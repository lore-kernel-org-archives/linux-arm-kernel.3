Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6203C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 13:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JtnHVUij68ugKVFNvO+lp77TLC0lsYgiXF37zBgiZKc=; b=e5vjFpO+dRGrGTqxfCsTjXLX5a
	fFLNGbU2VSERCRzLxe+c9DaloqO3QlkBTgA7kJwrtDTiKMJ1oV/grx0CaqN+AhCqmjfEdkJyh2/Il
	8WnrRrhJinQFbW+6czyfDstJXv5v9NEPfmK+Z+SXfjEasZ4asQIzHS09T6rga+uCvQiOQhe6SmddS
	6TSvgM4SrjlUd3Gfzft49+O9vNCb2uP647eoqmmMM67EFR+7uWcMlhuUWSVLONFjALHRMKZ6Ssnhj
	f9nMM/rLtsL+zlaqNkCrd2g5pu6kCpc+Bnnv3dyPfvWVxh//ps8WzNHz4VwYDNWtWw5lapPQvaOs+
	Qvha7dXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsJq-0000000H6jB-3LLg;
	Mon, 03 Aug 2026 13:03:02 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsJl-0000000H6da-3POb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 13:02:59 +0000
Received: by chaosmail.tech (Postfix) id F3B6F1C87FF;
	Mon, 03 Aug 2026 13:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785762171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JtnHVUij68ugKVFNvO+lp77TLC0lsYgiXF37zBgiZKc=;
	b=xW/HgEfuFzzzQ/KNZhSTF3F3wMKLF5ETRpCv+V03f+8NGOoWspfda9bpzK7p4TkiHKAtvc
	Pb5NaQvarTkSc6CAQi/V6l0n62s8HV1cb9hpm4+2DMZPIwqi2Trcqp7d/SjWOS1WmSzD2Y
	FSBnPUKvtDDS4+ztx0AkO8azwgfvwaw=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Mon, 03 Aug 2026 15:02:47 +0200
Subject: [PATCH v3 5/6] spmi: apple: lock around FIFOs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-t603x-spmi-v3-5-c17b506d91a1@chaosmail.tech>
References: <20260803-t603x-spmi-v3-0-c17b506d91a1@chaosmail.tech>
In-Reply-To: <20260803-t603x-spmi-v3-0-c17b506d91a1@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785762167; l=1319;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=R5eyC9DfnU9OQAY/qaw5pqG1quhd+pGqseFeIWnwzeY=;
 b=/8f0Y4NXTrUVUUVggCYYD9IFuvH9l/eCCVhUznBVgvmU/uZdAYbIHBAMghpuHnomf17qEPMcK
 asBb4RNz/31BXUmPGcvZOOZNzOUaKYROjW4VWVDL4q5tx/VS0sfd8Bk
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_060258_014214_8FE46ABC 
X-CRM114-Status: GOOD (  11.23  )
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

The driver was missing locking around register interactions

Signed-off-by: Alba Mendez <me@alba.sh>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/spmi/spmi-apple-controller.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index 8c9a70ba0422..74d4b5d98b11 100644
--- a/drivers/spmi/spmi-apple-controller.c
+++ b/drivers/spmi/spmi-apple-controller.c
@@ -14,6 +14,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/spmi.h>
 
@@ -35,6 +36,7 @@
 
 struct apple_spmi {
 	void __iomem *regs;
+	struct mutex fifo_lock;
 };
 
 #define poll_reg(spmi, reg, val, cond) \
@@ -87,6 +89,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	size_t i = 0, j;
 	int ret;
 
+	guard(mutex)(&spmi->fifo_lock);
+
 	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
 
 	while (i < len) {
@@ -193,6 +197,7 @@ static int apple_spmi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	spmi = spmi_controller_get_drvdata(ctrl);
+	mutex_init(&spmi->fifo_lock);
 
 	spmi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(spmi->regs))

-- 
2.55.0


