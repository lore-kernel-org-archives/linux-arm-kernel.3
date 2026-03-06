Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13247FC9EC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 23:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4NuxzLDGj8yS8JkPsoLwHvhkLdZ7UNN2cfrgeUVnLo=; b=NskRx4Q6xwFZSuSLqRV4zFhf6L
	NjkjCIsFmZ+2kVuFhsQLVIFTkR0wqh8nImYbeNlqXcm+llubckM2ju1pI44YN7JYyAotJHpQPc3sH
	ra2RxeBiQYQVFXSkZSGoPcPE5K/GgRK7SYIsH403hGlm5kfdPBhL655Jkf45t4L9XYSNSC4SZv5jt
	fWMNcBY+qFXzyR4JpcPqQd46PyUjIsF4CNHCiJYzYSmf1b22EbGkWXM9R2QRMqyU/1Ob2/Te46QBq
	J5Y6uvCNbM/jPsfDfo6lurvBUue7LS/unfi47A3gX90YovngecdNRhqmLkXWpuR/oIkPBjRsq2Oup
	BhZ5H6+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeke-00000004emQ-46X3;
	Fri, 06 Mar 2026 23:38:37 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyekb-00000004ejF-2Gqu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 23:38:35 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-480706554beso106333345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 15:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772840312; x=1773445112; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4NuxzLDGj8yS8JkPsoLwHvhkLdZ7UNN2cfrgeUVnLo=;
        b=HguT8oaOHc1fQVU8XLaVV9HGE1CKd0sPt0MAIL9HgGUoGz/d8611YoxofLWk6OvMYw
         H5lihCoFg27ZlNcNMn/vPwQt/924dk74oN0ToEOeztEIG0EjL6LWNo3QHeiQddPWStDy
         aMVbsynkcLPLAvjoWkaYoIBEwxZwfWegsLbsr4dQ37DyF6kN5uXQxs1WilzzTF8oQ4zE
         qr6zTDM/mq1Cy8ISBtT6AVaL59LpE/57YSlIcShe729jVZSRHhStyD409p+MI9ICz1fb
         lfDCjcBkq0ATixP5oHwAKfeXYuCIRHaDKOsXIg72Repnzxa9mpnovZPjxhDYz6FjXoAO
         5CbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772840312; x=1773445112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i4NuxzLDGj8yS8JkPsoLwHvhkLdZ7UNN2cfrgeUVnLo=;
        b=KjOCMm/Q/rRRvBmehhBoAN1WklkqVB0iyDWLWF94KvqC/mk5AGL3Em2VoWmxdDBZ7X
         y/ibE/NrCyo2DYzJMPczldE4u6gCmlsKtCntjNUQobxTrWvmZ5a5FO8BPwwWE3eAbte8
         Yx3TabrNd2BPC7zQvVXWu4TOWLcy06D2+9lyvSx0pCDeol7hPUBiJsVmuQpBLyq3gbMd
         N7oKqPerfaHMRTbMB630wGCEc1mdgZ4KNTuO3ls5FrPvfqIUoZDU3DFSG9QxNyBf5uVf
         d8SBY2PPOOjHN4RcXial4HgCWFJ+3xFZiQWs4F6cnj7ZSNI6byuxKrlvDmqQ3oVB6pMx
         m/4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzWd+Ov9MPZMe/X7XRYzY477FHvKg+qXpvGHtSaPCfWJ6OgppTKWKtB3ZLleZzIPzFuc5d8NFktCGT+RdDxlvi@lists.infradead.org
X-Gm-Message-State: AOJu0YyHw5CaGCJzdbtyFYkizv+Jsx/4exzB+MbI9snqNDWUt3ZCqbrY
	sAbeUOVnVGBUhmG+ddvEle5KJyJrNOzLJyoN/tC64ab+7+fGo8KSVw0rkdxylMAM0Ig=
X-Gm-Gg: ATEYQzy3jbTu6MyJkBM8WqAb0qGtCK/J8uumoweN4hybedvWr3b3tWwMcMJ0HlnPEPC
	JbwOJjMZH+M001Z+msmT4fxbdxTQYy/ZYInqkKJtVx/Y6sI+QnjdJ+8Gc/TJMp1hOQeMstiGnJ2
	8vvhRAfvTcs5IxoqH1+CoKIoxR2KRMmsGbHqMJLaSDp6t9IvsSsDlNkXxHhiRGntiwe/S9kQUmY
	7i+kwr3Qbd09PFUbHt26i6cfbi+4Xw9e80m8bOk9U0nzoFtjtMj8FNTYCROGmF9Sz0vCr1XDWR9
	ofGCnh/7IYA64l8fFCHa0vEPRE4nK4/xprS3IISs+inZ69Ozf/UiLLDnp9UMC6zWwMze4cr1tzY
	wqcr1gVK87neGoJGYwyYTm45So88/YiZob37KEnnGuLoWyhSBTXZAwxSrZxANdfLYZvvTMoYJRu
	XG63R4pGYyGJY/bAxa1yQlK3J5MDb0XDqewnmJFNszY9wF1sOHH9ZlvUDDdpmpfgTAUw==
X-Received: by 2002:a05:600c:c088:b0:483:a922:2e8d with SMTP id 5b1f17b1804b1-48526919884mr59641445e9.4.1772840311638;
        Fri, 06 Mar 2026 15:38:31 -0800 (PST)
Received: from localhost (host-79-12-214-40.retail.telecomitalia.it. [79.12.214.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad97da3sm7209369f8f.12.2026.03.06.15.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:38:31 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Lee Jones <lee@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Phil Elwell <phil@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH 1/2] mfd: bcm2835-pm: Introduce SoC-specific type identifier
Date: Sat,  7 Mar 2026 00:41:21 +0100
Message-ID: <c4bb218654e91f312a01b419d3d408e5131f7673.1772839224.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1772839224.git.andrea.porta@suse.com>
References: <cover.1772839224.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_153833_595791_7EE05FA1 
X-CRM114-Status: GOOD (  15.01  )
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

From: Phil Elwell <phil@raspberrypi.com>

Power management blocks across the BCM2835 family share a common
base but require variant-specific handling. For instance, the
BCM2712 lacks ASB register space, yet it manages the power domain
for the V3D graphics block.

Add a hardware type identifier to the driver's private data. This
allows the driver to distinguish between SoC models and implement
custom quirks or features as needed.

Signed-off-by: Phil Elwell <phil@raspberrypi.com>
Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/mfd/bcm2835-pm.c       | 7 ++++---
 include/linux/mfd/bcm2835-pm.h | 7 +++++++
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/bcm2835-pm.c b/drivers/mfd/bcm2835-pm.c
index 8bed59816e82e..2d5dc521b623d 100644
--- a/drivers/mfd/bcm2835-pm.c
+++ b/drivers/mfd/bcm2835-pm.c
@@ -81,6 +81,7 @@ static int bcm2835_pm_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, pm);
 
 	pm->dev = dev;
+	pm->soc = (uintptr_t)device_get_match_data(dev);
 
 	ret = bcm2835_pm_get_pdata(pdev, pm);
 	if (ret)
@@ -106,9 +107,9 @@ static int bcm2835_pm_probe(struct platform_device *pdev)
 
 static const struct of_device_id bcm2835_pm_of_match[] = {
 	{ .compatible = "brcm,bcm2835-pm-wdt", },
-	{ .compatible = "brcm,bcm2835-pm", },
-	{ .compatible = "brcm,bcm2711-pm", },
-	{ .compatible = "brcm,bcm2712-pm", },
+	{ .compatible = "brcm,bcm2835-pm", .data = (void *)BCM2835_PM_SOC_BCM2835 },
+	{ .compatible = "brcm,bcm2711-pm", .data = (void *)BCM2835_PM_SOC_BCM2711 },
+	{ .compatible = "brcm,bcm2712-pm", .data = (void *)BCM2835_PM_SOC_BCM2712 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, bcm2835_pm_of_match);
diff --git a/include/linux/mfd/bcm2835-pm.h b/include/linux/mfd/bcm2835-pm.h
index f70a810c55f7d..d2e17ab1dbfc5 100644
--- a/include/linux/mfd/bcm2835-pm.h
+++ b/include/linux/mfd/bcm2835-pm.h
@@ -5,11 +5,18 @@
 
 #include <linux/regmap.h>
 
+enum bcm2835_soc {
+	BCM2835_PM_SOC_BCM2835,
+	BCM2835_PM_SOC_BCM2711,
+	BCM2835_PM_SOC_BCM2712,
+};
+
 struct bcm2835_pm {
 	struct device *dev;
 	void __iomem *base;
 	void __iomem *asb;
 	void __iomem *rpivid_asb;
+	enum bcm2835_soc soc;
 };
 
 #endif /* BCM2835_MFD_PM_H */
-- 
2.35.3


