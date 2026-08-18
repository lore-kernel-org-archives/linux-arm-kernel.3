Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831FBC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 18:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVHbMMgwTRdvhl3Xmvr04M/6W1HqFA3Q/iNZoN90xm8=; b=UTy54FxEmtjEmWfLnVBQLVitJo
	JAM7xxmuh48nCSG85JnZnzTCV0i1fHgImCLLKXvoIoer1MbIPQq9hNb9QAOMu7vPqP7ygPEjFxKIA
	VoAnFJjMXYWAs2c+/Aj7D+Uz5aQJXoPudgH2jeikBr4+mRWpCDrWUpCeCkVHOH093pZ2Ry7N+ndDI
	jViD+R5nH6+Jul0zGz43qvFOduZOcEyY3cdhn5wkPvsIv3E5rjkn9ZzDYXi8uvhVci3OLZAvtBzFZ
	YyfwlqpYp5Z0HwF6FF64t6TGPtM6YOUOFn2kZtrzl4q2sggMdm3YSHzKozplDvyf9/xOHFExshAGP
	l8zheW6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwOdD-00000008W8B-13D9;
	Tue, 18 Aug 2026 18:33:51 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwOd9-00000008W5S-0PO8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 18:33:48 +0000
Received: by chaosmail.tech (Postfix) id A6B201C97BC;
	Tue, 18 Aug 2026 18:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1787078020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wVHbMMgwTRdvhl3Xmvr04M/6W1HqFA3Q/iNZoN90xm8=;
	b=UbnTWzWdX6r7+Cck/ugPPW9pzgrzLStwpWfinOclMLxzBZlnbOdYkwiBNk+nyKh2uVsuMM
	rIhuAuCFiSMRVgiuOgbyIFdyKY8kxrIykZXbZuAlmnGRrSC0appXgQpNA2wL1OJ+BcKDuZ
	0IX3tXhFXFvbNr6jdNXiTsWKKBHuv1Y=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Tue, 18 Aug 2026 20:32:44 +0200
Subject: [PATCH v7 5/6] spmi: apple: lock around FIFOs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-t603x-spmi-v7-5-dafebe6e7739@chaosmail.tech>
References: <20260818-t603x-spmi-v7-0-dafebe6e7739@chaosmail.tech>
In-Reply-To: <20260818-t603x-spmi-v7-0-dafebe6e7739@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787078015; l=1392;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=/okjDmX4WP5ORuj7W0YBcJBa1hZOvGWaK9RmHtLYrOM=;
 b=evNw5E/4Td1efYc72rUid+cmqXQbiLrXofStbjqd1j19XLq5xXXKuZX6wAa3RNkKGZ/r3lgNL
 Z4fio3Dwge8AU/3BU+6pY8ttvEPKr0y9CgB8CaOsXnd+Lv2NB2AbDjQ
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_113347_291786_A95E72AD 
X-CRM114-Status: GOOD (  11.06  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Alba Mendez <me@alba.sh>

The driver was missing locking around register interactions.

Signed-off-by: Alba Mendez <me@alba.sh>
Reviewed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/spmi/spmi-apple-controller.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index 9843dc871d6c..fabccd25aa0d 100644
--- a/drivers/spmi/spmi-apple-controller.c
+++ b/drivers/spmi/spmi-apple-controller.c
@@ -16,6 +16,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/spmi.h>
 
@@ -39,6 +40,7 @@
 
 struct apple_spmi {
 	void __iomem *regs;
+	struct mutex fifo_lock;
 	bool prev_fail;
 };
 
@@ -78,6 +80,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid, u16 param,
 	size_t i = 0, j;
 	int ret;
 
+	guard(mutex)(&spmi->fifo_lock);
+
 	if (spmi->prev_fail) {
 		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_ACT_REG);
 		spmi->prev_fail = false;
@@ -195,6 +199,7 @@ static int apple_spmi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	spmi = spmi_controller_get_drvdata(ctrl);
+	mutex_init(&spmi->fifo_lock);
 
 	spmi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(spmi->regs))

-- 
2.55.0


