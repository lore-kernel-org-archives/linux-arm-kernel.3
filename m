Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F66DC61DC6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 08:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVHbMMgwTRdvhl3Xmvr04M/6W1HqFA3Q/iNZoN90xm8=; b=3VCvHfj1BJKRQiC0iJxLZK6TTn
	CMkNTmxEyXHS0jYv4CrQ53DwlwpK8XEy2rXXGQN1/SI6xiC8r1oy4RB6W5H/ZUcsa3VNF7UgmH5ql
	WnEmO3lKl/+hcwd6KSVwPTfUoxJWCBKLCdQVptrP8F2hunfnU5hCTGYiWd5VDDByW+EM3I9Q63hag
	bIyoD/gS1OL+hfLPkazOKwfFCRD9v5XJBcFoXEq+DbWrlMSkTjWsPURh2PLVpdBkaStA0OAnUvVv+
	BcIWVrZngmAl8LT1KhSZZd6U11OmNvZVuPoSv7W8pnMHKE0ASCoNpWthtW81mYqAYJxcHw+tFsQXM
	LQQ3+YOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsQm-00000005O5Z-1Df8;
	Fri, 28 Aug 2026 08:59:24 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsQd-00000005Nyw-1shM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 08:59:16 +0000
Received: by chaosmail.tech (Postfix) id 4394B1CC17E;
	Fri, 28 Aug 2026 08:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1787907548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wVHbMMgwTRdvhl3Xmvr04M/6W1HqFA3Q/iNZoN90xm8=;
	b=qXbezgFJ+EVp1HKwvDHhnigrozPU75e8tM48R/huH9iNeOoWxWmvVT3fwKZZ/8sQVkm1Cl
	LanHby2RTAVDqZiq9yqInmtEqsRrQmrIudNUX46eRvtAR3D+NOTkVPSzlOhEgEdpWrE035
	hdBB/dK0KWqTjFjrA9J+X/8Sl/z7AAc=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Fri, 28 Aug 2026 10:59:01 +0200
Subject: [PATCH v8 5/6] spmi: apple: lock around FIFOs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-t603x-spmi-v8-5-708d4d12e0fd@chaosmail.tech>
References: <20260828-t603x-spmi-v8-0-708d4d12e0fd@chaosmail.tech>
In-Reply-To: <20260828-t603x-spmi-v8-0-708d4d12e0fd@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787907544; l=1392;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=/okjDmX4WP5ORuj7W0YBcJBa1hZOvGWaK9RmHtLYrOM=;
 b=9OoJExJftqrBBYs8Fb4Yj7w5aoNFCuhmQ1XPufl8ePj6MgdtVCalKohDMT+1XYkPT3QQtO/Mp
 DvwiLzad068A/YNqVZc8jPa/o/0kUYY6aZVJW3s4BV8L6t/4L9bMBae
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_015915_665818_EBC58781 
X-CRM114-Status: GOOD (  11.10  )
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


