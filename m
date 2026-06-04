Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7847CD6E7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 13:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CoHc1Zlbr3pNOE70Y4k5QiMyrmoz//QwwHMvtTDGYPc=; b=qR1XeeOGBD1910Q2oij3xVqBKp
	U8JNiBlZPzh3qBgKiUbWfZwScVpKmiOebFm7mfYz6/E/aRhaDUendXoiqvh32GVUglGxJTW1Aux4S
	zykhlxQpXmrX5+0J9veCWnoz/wVznNtMxHOS/JOsdMkOM4zw+GqjfhLe3rBxGqEDFNzD1R2EGlEEq
	lCFS+lOvWj0C9ykjIGWHiKmuSs4RIBAfuQjScSVuimPJHDDVcr2CiARXWDbARDnNRJFRTMRpU4h4S
	y7SnA44+EPhwzVBJI4Y5tRm7b9/SAcSUBKnxnzNo1jzRpEFY9iXhwb3L2+ITvhcGBIzFaMNYQc4uw
	Xv3A0IuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8VM-0000000GpkS-3jwK;
	Thu, 04 Jun 2026 13:53:04 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8VI-0000000Gph2-0CgT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 13:53:02 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4601949975dso103186f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 06:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780581178; x=1781185978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CoHc1Zlbr3pNOE70Y4k5QiMyrmoz//QwwHMvtTDGYPc=;
        b=joNIkdjRl7S+gB0dfufKhonvst+uO101EcRIpm7cuHbiuCNUfLCP2BCPmxnyfsJTc+
         kv9xRPKtTCqtJCh1QxaIsmDKlnz2P+K0RMB51P6jSqz6l6HhZfgcfIdmBIUnRpFQLdhb
         npVMayZxWAPLGlKRnOCmt67PD+O53eK0A5hY0IKaYBiov5fGyQ2DSlPqYE0atqM11Inm
         EfT0k9hsRzx0/SGb+vu7XLKR1js5P1GfG7IosRuQva2WJMowIWm1oNiNwb5Y5VVY7P06
         KMG48HotwtrQppHQMv/8v7A/2AhxAmMc7NO1hc6Db0t83Q1I/Kn1BrypFRfflaoqfWZx
         su5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780581178; x=1781185978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CoHc1Zlbr3pNOE70Y4k5QiMyrmoz//QwwHMvtTDGYPc=;
        b=U4Hd2+okt/OVD0va9f4J1biMIr3TQuqVOglJsxSCUyR66uxPsmhvObprmEdvKatiLv
         0nffXKkfN/Q14P68AkazDSmvWK7XdsWI/h0ue+PGCPs6GFWDxezRv1rWuGAdinCL+YiH
         eqIr5JMosYHhZzsB1ynpIzGgOZXEsCZg7R488z2w9AwcsuV63vwHKLD54pgmOtaN6ODr
         ZHopp2IOaUrkT6vkxUZKTzrUNKid9eZ6o0jZ/U+ua5MZdshP1UoqbxRY48zzTdo/RtY4
         fMMEfue6WDTdIKATjPgEk9pxd7xwolxaAig63l5bTlfvTtAs5sWr5B7YTKwh81yvbfRc
         fV+w==
X-Forwarded-Encrypted: i=1; AFNElJ+jdy9Q9q6yY2d/AhGkQiE7INn+TAkEc81CdRyWi6I0OO0hHImBDFP7R+/9hbkP25z3ht7NPs87YOHO3PJyhaaI@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8uMFc1Zh7+KD985YUwGxquGestq75y4r2wke8vxN+N5x7fPS3
	f+eu2KlJPjaLj/3RINj+4af/SkOCyt0J7lqv92fv5ddzVEzSNSurxdeW
X-Gm-Gg: Acq92OFhADxO4jf9kTbEWRrLlXd2tOndb+1rwnMZfhHj7Y2YYluYXl58bX0uIIzATcy
	0bv7j2xVRKnT15XHhACSTeiu35ifaA4MwD5514rRqGClLUbUfS0Qg/IhwN7yAXkEPKr28IyyPay
	V2qe/bIg6XgBA6I/1pPtiDMFvuREiQKncv4WqAlC8/d8AatRENzY5CeiOEfEPIVm4q5WcZs7o9h
	KF5Bjf7TmxwH36QwbvCHNE5zP47BgHHe9Ka8OsNERW81p+YKyZJ5I04XJ+rDddK1hC4d4i8TPPL
	ZfcBrwnZmmYI8WdXP6mBHtR/cZ4xaATcRSOuZy/++q6mfK3h0HSdnUKDAMrakfQ9yVD+9XxADc3
	08P2uP0LiWUOwMYH2Va9VaKLaxjGi9CI2P7++E4vNiid2CVZynElfRHGypQq9HfaZ8iHxwM3xWo
	0vRTdgTJ4nl+Ywj5E77hvCv/a27cUMqsv4lgYU3Rsls5ZVXsH7JQG2Q25mJWGNWKQ=
X-Received: by 2002:adf:f8c4:0:b0:460:e0f:8d19 with SMTP id ffacd0b85a97d-4602179121cmr10232727f8f.9.1780581177846;
        Thu, 04 Jun 2026 06:52:57 -0700 (PDT)
Received: from compiler-rock3b.tailb81abf.ts.net ([2a01:e0a:104a:4d80:be24:11ff:fe12:2776])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f0a43e9sm16661068f8f.0.2026.06.04.06.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:52:57 -0700 (PDT)
From: Midgy BALON <midgy971@gmail.com>
To: tomeu@tomeuvizoso.net,
	ogabbay@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org
Cc: robin.murphy@arm.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 1/9] accel: rocket: Introduce per-SoC rocket_soc_data
Date: Thu,  4 Jun 2026 13:52:47 +0000
Message-Id: <20260604135255.62682-2-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260604135255.62682-1-midgy971@gmail.com>
References: <20260604135255.62682-1-midgy971@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_065300_114813_4C6C02CC 
X-CRM114-Status: GOOD (  16.84  )
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

Add a per-SoC data structure carried in the OF match table, currently
holding only the NPU AXI address width, and use it for the per-core DMA
mask instead of a hardcoded 40-bit value.  No functional change: the
RK3588 AXI master is 40-bit.  This prepares for SoCs with a narrower
address width.

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 drivers/accel/rocket/rocket_core.c |  7 ++++++-
 drivers/accel/rocket/rocket_core.h | 11 +++++++++++
 drivers/accel/rocket/rocket_drv.c  |  6 +++++-
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/rocket_core.c
index b3b2fa9ba645a..09c445af7de73 100644
--- a/drivers/accel/rocket/rocket_core.c
+++ b/drivers/accel/rocket/rocket_core.c
@@ -7,6 +7,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/iommu.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
@@ -21,6 +22,10 @@ int rocket_core_init(struct rocket_core *core)
 	u32 version;
 	int err = 0;
 
+	core->soc_data = of_device_get_match_data(dev);
+	if (!core->soc_data)
+		return dev_err_probe(dev, -EINVAL, "missing SoC match data\n");
+
 	core->resets[0].id = "srst_a";
 	core->resets[1].id = "srst_h";
 	err = devm_reset_control_bulk_get_exclusive(&pdev->dev, ARRAY_SIZE(core->resets),
@@ -52,7 +57,7 @@ int rocket_core_init(struct rocket_core *core)
 
 	dma_set_max_seg_size(dev, UINT_MAX);
 
-	err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(40));
+	err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(core->soc_data->dma_bits));
 	if (err)
 		return err;
 
diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/rocket_core.h
index f6d7382854ca9..8ee105a0be40e 100644
--- a/drivers/accel/rocket/rocket_core.h
+++ b/drivers/accel/rocket/rocket_core.h
@@ -12,6 +12,16 @@
 
 #include "rocket_registers.h"
 
+struct rocket_core;
+
+/**
+ * struct rocket_soc_data - per-SoC configuration data
+ * @dma_bits: Physical address width reachable by the NPU's AXI master.
+ */
+struct rocket_soc_data {
+	unsigned int dma_bits;
+};
+
 #define rocket_pc_readl(core, reg) \
 	readl((core)->pc_iomem + (REG_PC_##reg))
 #define rocket_pc_writel(core, reg, value) \
@@ -31,6 +41,7 @@ struct rocket_core {
 	struct device *dev;
 	struct rocket_device *rdev;
 	unsigned int index;
+	const struct rocket_soc_data *soc_data;
 
 	int irq;
 	void __iomem *pc_iomem;
diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index 8bbbce594883e..384c38e13acce 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -213,8 +213,12 @@ static void rocket_remove(struct platform_device *pdev)
 	}
 }
 
+static const struct rocket_soc_data rk3588_soc_data = {
+	.dma_bits = 40,
+};
+
 static const struct of_device_id dt_match[] = {
-	{ .compatible = "rockchip,rk3588-rknn-core" },
+	{ .compatible = "rockchip,rk3588-rknn-core", .data = &rk3588_soc_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.39.5


