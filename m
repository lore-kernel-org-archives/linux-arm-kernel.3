Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588AFCD8C90
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 17:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5wGuO+lQk/MjIiPNsRYyx6BtR+pKFF6jcGfnBax9vYY=; b=UDZC6NWueWUrShvXlqSxMclRe6
	5huP4cwCWwWVMg1p1wUYe8PMDPNB04X70nauNAU5toatKHLDnuU1ClEEfoDHchmshsRGe3SgmXIR5
	2P3ycIQiMlq76yrZdgWvK3a2JpmFso2GPoVPG1qr0TYQSqzZ3CXIP69VaSGzRWyJOeqyOFGvdPLtv
	HQYddP0A1I4x7TX9acq17rwKCabXgNDG1DetiQX0zGUdUNUpV/bzhsn9Tdz5262/AVglq4juwbLCG
	dcOqjmVxSrUNDGXstEA3w8kQ44PpBR9Nt18bRvrjwPC+rCM0piSLQXAHmh6iorXRTp2Wyw1VYYSG4
	NheG4rlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXN7Q-00000008CxR-0APT;
	Wed, 10 Jun 2026 17:53:36 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXN7L-00000008Cvl-1RxN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 17:53:32 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-45ef372c58aso3742912f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 10:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781114009; x=1781718809; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5wGuO+lQk/MjIiPNsRYyx6BtR+pKFF6jcGfnBax9vYY=;
        b=BJw9jisdjVM/lG3983q7Xkj96iaI72U4H95alU7K2wcDQmySi+oFKLiISMyVA21igW
         BUxNRC5QDsVoSMQ1HhJmZXFhAB0P/IoEo+0jv8GSN0BtKGfSB7npWO8ixr1QzKPZAIZA
         STrlt1Y8fKMrTR0GHQLVT/c/jicmYyzKGvN1NnLix/5wQQifwKIy8aLyTOHkMoDqY+km
         5sajEXVFJeG2IHDhrkwEU+QlsuDBmGDvoVFtS3hkwSGGLTknJdSoC0mxmUWTGC7qQeOB
         aEBQ0dZ1t0m8qjk0f48x5TiN+s8OcCtaBgun1vynRXySyq22deSDantUB7YPOXVe60yZ
         9y8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781114009; x=1781718809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5wGuO+lQk/MjIiPNsRYyx6BtR+pKFF6jcGfnBax9vYY=;
        b=e/6WWPZUnW5gGgahsbxg6H/mXutvlo0ocMRBC78hm2owuDdncLYCGNPyI2Jxm1iU93
         HSqllrHMA0L+WHQ8OSLUka+WVY51bluzQHX7/BUeG7PalZO4rhqz+ZDbFHrxzyPttiUG
         8CqKIB0tSTKqd/GZyOs4KqYj4MKJ7MILzJBWkVEF13skyKARCFtoKu9ZDimxMZ6YbSkn
         nAd5vgjP26CBE9VKUnS1h7jKUABdFGD6zM2nBBzVSeOLIk6v25k2sT34LbZ7flzkX8sF
         26XSukDeMOw2z5OjKk1AcUFjlJ+rFPF+ps71IwMyHPBBQBxK0qZ3jOups53Av+JO3I0r
         zubQ==
X-Gm-Message-State: AOJu0Yy1dkKRmYtVAlNk26hFrixAS4vgasnBpO9QVXwfEzSQ8SR/s4f1
	L6UWnmS5In4mr/tHfG0/oygxVNGEMiF1mAWNMppNBjiRY3wl2CJE5TuMr1PqsT2abUY=
X-Gm-Gg: Acq92OHrD5qQEkXH5qxaPcySgkiD7MM0Q1t2NqF8Gc1rLKKj044x5f142wLtRmiBoGa
	BA9YV7GGWxo5yECt1nAG3TkDCUNOw7eedqxOQ/zBRzz4qqVbT0SU53FFDOEL/r6VffNh6ZtEQcF
	NvHO0LUjzIkwqT2CHTJ0j+Jy4eSDDzS3n5UUCPPdeTe06UZsGtbKsalmQVLkIBjurCC3Oa+bQIJ
	JHcJegd5/u+55uWvQrY9ckPBunQ1VKonJtGDMgLVcxU9uYyaVJwOFTLaB44/Q23N6GsZikkfg3c
	5GOSA5Ho/Ty1ntdRd5FeESri9Nchdm7Wmvaxa7wPiCKmtgjEfHna/8VRc+dXVuCkgpV6Jol0qgX
	m+pboC/G3Qe+kKBagfzVcPk4YZbXIykIoPO+bgQXql+T55egPuj2y+akCn5uZOm8QmOikQCFr4m
	IDGNtuS9EF9ivgId4p0HxKySJwQl5rd0GYoEaIEs6ff6DGudPIgKwuWwPa
X-Received: by 2002:a5d:4252:0:b0:43d:7bc9:9b2c with SMTP id ffacd0b85a97d-46030510fbbmr27016713f8f.17.1781114009487;
        Wed, 10 Jun 2026 10:53:29 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:f160:c480:bee:c914])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4004sm73553248f8f.9.2026.06.10.10.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 10:53:29 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 10 Jun 2026 19:53:10 +0200
Subject: [PATCH 1/2] clocksource/drivers/arm_arch_timer_mmio: Refactor for
 early init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-arm-arch-timer-mmio-early-v1-1-ac17218ec8b4@linaro.org>
References: <20260610-arm-arch-timer-mmio-early-v1-0-ac17218ec8b4@linaro.org>
In-Reply-To: <20260610-arm-arch-timer-mmio-early-v1-0-ac17218ec8b4@linaro.org>
To: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Jack Matthews <jack@jackmatthe.ws>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_105331_428261_3EC26E3C 
X-CRM114-Status: GOOD (  23.35  )
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

In preparation of restoring support for using arm,armv7-timer-mem as an
early timer, refactor the driver to allow early initialization without
a device pointer. Replace uses of dev_() logging with pr_(), replace devm
helpers with manual cleanup or scope-based cleanup helpers where possible.
Create a new arch_timer_mmio_init() function that performs the
initialization and registration without a device pointer.

This is not very pretty, although given that the driver cannot be removed
at runtime due to .suppress_bind_attrs = true, at least the overhead for
the manual resource management is limited.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/clocksource/arm_arch_timer_mmio.c | 139 +++++++++++++++++-------------
 1 file changed, 79 insertions(+), 60 deletions(-)

diff --git a/drivers/clocksource/arm_arch_timer_mmio.c b/drivers/clocksource/arm_arch_timer_mmio.c
index d10362692fdd..5cb94051c4be 100644
--- a/drivers/clocksource/arm_arch_timer_mmio.c
+++ b/drivers/clocksource/arm_arch_timer_mmio.c
@@ -10,7 +10,9 @@
 
 #define pr_fmt(fmt) 	"arch_timer_mmio: " fmt
 
+#include <linux/cleanup.h>
 #include <linux/clockchips.h>
+#include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/of_irq.h>
@@ -191,17 +193,16 @@ static irqreturn_t arch_timer_mmio_handler(int irq, void *dev_id)
 	return IRQ_NONE;
 }
 
-static struct arch_timer_mem_frame *find_best_frame(struct platform_device *pdev)
+static struct arch_timer_mem_frame *find_best_frame(struct arch_timer *at)
 {
 	struct arch_timer_mem_frame *frame, *best_frame = NULL;
-	struct arch_timer *at = platform_get_drvdata(pdev);
 	void __iomem *cntctlbase;
 	u32 cnttidr;
 
 	cntctlbase = ioremap(at->gt_block->cntctlbase, at->gt_block->size);
 	if (!cntctlbase) {
-		dev_err(&pdev->dev, "Can't map CNTCTLBase @ %pa\n",
-			&at->gt_block->cntctlbase);
+		pr_err("Can't map CNTCTLBase @ %pa\n",
+		       &at->gt_block->cntctlbase);
 		return NULL;
 	}
 
@@ -277,22 +278,21 @@ static void arch_timer_mmio_setup(struct arch_timer *at, int irq)
 	clocksource_register_hz(&at->cs, at->rate);
 }
 
-static int arch_timer_mmio_frame_register(struct platform_device *pdev,
-					  struct arch_timer_mem_frame *frame)
+static int arch_timer_mmio_frame_register(struct arch_timer *at,
+					  struct arch_timer_mem_frame *frame,
+					  struct device_node *np)
 {
-	struct arch_timer *at = platform_get_drvdata(pdev);
-	struct device_node *np = pdev->dev.of_node;
 	int ret, irq;
 	u32 rate;
 
-	if (!devm_request_mem_region(&pdev->dev, frame->cntbase, frame->size,
-				     "arch_mem_timer"))
+	if (!request_mem_region(frame->cntbase, frame->size, "arch_mem_timer"))
 		return -EBUSY;
 
-	at->base = devm_ioremap(&pdev->dev, frame->cntbase, frame->size);
+	at->base = ioremap(frame->cntbase, frame->size);
 	if (!at->base) {
-		dev_err(&pdev->dev, "Can't map frame's registers\n");
-		return -ENXIO;
+		pr_err("Can't map frame's registers @ %pa\n", &frame->cntbase);
+		ret = -ENXIO;
+		goto err_release_region;
 	}
 
 	/*
@@ -310,49 +310,56 @@ static int arch_timer_mmio_frame_register(struct platform_device *pdev,
 		at->rate = arch_timer_get_rate();
 
 	irq = at->access == VIRT_ACCESS ? frame->virt_irq : frame->phys_irq;
-	ret = devm_request_irq(&pdev->dev, irq, arch_timer_mmio_handler,
-			       IRQF_TIMER | IRQF_NO_AUTOEN, "arch_mem_timer",
-			       &at->evt);
+	ret = request_irq(irq, arch_timer_mmio_handler,
+			  IRQF_TIMER | IRQF_NO_AUTOEN, "arch_mem_timer",
+			  &at->evt);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to request mem timer irq\n");
-		return ret;
+		pr_err("Failed to request mem timer irq for frame @ %pa\n",
+		       &frame->cntbase);
+		goto err_iounmap;
 	}
 
 	/* Afer this point, we're not allowed to fail anymore */
 	arch_timer_mmio_setup(at, irq);
 	return 0;
+
+err_iounmap:
+	iounmap(at->base);
+err_release_region:
+	release_mem_region(frame->cntbase, frame->size);
+	return ret;
 }
 
-static int of_populate_gt_block(struct platform_device *pdev,
-				struct arch_timer *at)
+static int of_populate_gt_block(struct device_node *np, struct arch_timer_mem *gt_block)
 {
 	struct resource res;
 
-	if (of_address_to_resource(pdev->dev.of_node, 0, &res))
+	if (of_address_to_resource(np, 0, &res))
 		return -EINVAL;
 
-	at->gt_block->cntctlbase = res.start;
-	at->gt_block->size = resource_size(&res);
+	gt_block->cntctlbase = res.start;
+	gt_block->size = resource_size(&res);
 
-	for_each_available_child_of_node_scoped(pdev->dev.of_node, frame_node) {
+	for_each_available_child_of_node_scoped(np, frame_node) {
 		struct arch_timer_mem_frame *frame;
 		u32 n;
 
 		if (of_property_read_u32(frame_node, "frame-number", &n)) {
-			dev_err(&pdev->dev, FW_BUG "Missing frame-number\n");
+			pr_err(FW_BUG "Missing frame-number for %pOF\n",
+			       frame_node);
 			return -EINVAL;
 		}
 		if (n >= ARCH_TIMER_MEM_MAX_FRAMES) {
-			dev_err(&pdev->dev,
-				FW_BUG "Wrong frame-number, only 0-%u are permitted\n",
-			       ARCH_TIMER_MEM_MAX_FRAMES - 1);
+			pr_err(FW_BUG "Wrong frame-number %u for %pOF, only 0-%u are permitted\n",
+			       n, frame_node, ARCH_TIMER_MEM_MAX_FRAMES - 1);
 			return -EINVAL;
 		}
 
-		frame = &at->gt_block->frame[n];
+		frame = &gt_block->frame[n];
 
 		if (frame->valid) {
-			dev_err(&pdev->dev, FW_BUG "Duplicated frame-number\n");
+			pr_err(FW_BUG "Duplicated frame-number %u for %pOF\n",
+			       n, frame_node);
 			return -EINVAL;
 		}
 
@@ -371,50 +378,62 @@ static int of_populate_gt_block(struct platform_device *pdev,
 	return 0;
 }
 
-static int arch_timer_mmio_probe(struct platform_device *pdev)
+static struct arch_timer *arch_timer_mmio_init(struct arch_timer_mem *gt_block,
+					       struct device_node *np)
 {
+	struct arch_timer *at __free(kfree) = kzalloc_obj(*at);
 	struct arch_timer_mem_frame *frame;
-	struct arch_timer *at;
-	struct device_node *np;
 	int ret;
 
-	np = pdev->dev.of_node;
-
-	at = devm_kmalloc(&pdev->dev, sizeof(*at), GFP_KERNEL | __GFP_ZERO);
 	if (!at)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
+
+	at->gt_block = gt_block;
+
+	frame = find_best_frame(at);
+	if (!frame) {
+		pr_err("Unable to find a suitable frame in timer @ %pa\n",
+			&at->gt_block->cntctlbase);
+		return ERR_PTR(-EINVAL);
+	}
+
+	ret = arch_timer_mmio_frame_register(at, frame, np);
+	if (ret)
+		return ERR_PTR(ret);
+
+	pr_info("mmio timer running at %lu.%02luMHz (%s)\n",
+		(unsigned long)at->rate / 1000000,
+		(unsigned long)(at->rate / 10000) % 100,
+		at->access == VIRT_ACCESS ? "virt" : "phys");
+
+	return_ptr(at);
+}
+
+static int arch_timer_mmio_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct arch_timer_mem *gt_block;
+	struct arch_timer *at;
+	int ret;
 
 	if (np) {
-		at->gt_block = devm_kmalloc(&pdev->dev, sizeof(*at->gt_block),
-					    GFP_KERNEL | __GFP_ZERO);
-		if (!at->gt_block)
+		gt_block = devm_kzalloc(&pdev->dev, sizeof(*gt_block),
+					GFP_KERNEL);
+		if (!gt_block)
 			return -ENOMEM;
-		ret = of_populate_gt_block(pdev, at);
+		ret = of_populate_gt_block(np, gt_block);
 		if (ret)
 			return ret;
 	} else {
-		at->gt_block = dev_get_platdata(&pdev->dev);
-	}
-
-	platform_set_drvdata(pdev, at);
-
-	frame = find_best_frame(pdev);
-	if (!frame) {
-		dev_err(&pdev->dev,
-			"Unable to find a suitable frame in timer @ %pa\n",
-			&at->gt_block->cntctlbase);
-		return -EINVAL;
+		gt_block = dev_get_platdata(&pdev->dev);
 	}
 
-	ret = arch_timer_mmio_frame_register(pdev, frame);
-	if (!ret)
-		dev_info(&pdev->dev,
-			 "mmio timer running at %lu.%02luMHz (%s)\n",
-			 (unsigned long)at->rate / 1000000,
-			 (unsigned long)(at->rate / 10000) % 100,
-			 at->access == VIRT_ACCESS ? "virt" : "phys");
+	at = arch_timer_mmio_init(gt_block, np);
+	if (IS_ERR(at))
+		return PTR_ERR(at);
 
-	return ret;
+	platform_set_drvdata(pdev, at);
+	return 0;
 }
 
 static const struct of_device_id arch_timer_mmio_of_table[] = {

-- 
2.54.0


