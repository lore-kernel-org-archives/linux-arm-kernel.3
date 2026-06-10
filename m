Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39DACD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 17:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EATPXEB1RDeFojesY+qsHCN5Elyd5D9oGU90SkPET0U=; b=EK1+o3muSyRkiK5WDbRHiGAH3F
	HKw3W0wStitEhlfYcfxZyyK0MegZyg6YMKwO+VHJ5zj1BrTtyRYWjTqDSyD0llj3iOPvfbhVg7Vjc
	g4TnvLz+3qSbwSBUFlAYM/ZZ2VN5oFsfs7yJo5N6TvCVEASzmFg2rqb5r4WLh3IRahqB4EdDzooO9
	DmLKfSck9Xx58yC4VHhiZj2RNPb3Jdl7e23zACERMZg0flnR5/M7raCIjfTmGHqjW9xRawHvkB6oB
	ZriPUncB8EBugcuFVVTGHbaQLBxlaz5u0Dk0sdXyTCqczI5MZnDu5HukC+/I32pYn2yjXfxaC+Mvj
	7QT55hhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXN7Q-00000008Cxh-0iHy;
	Wed, 10 Jun 2026 17:53:36 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXN7M-00000008Cw0-0mHD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 17:53:33 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-45eeba68948so5084584f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 10:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781114010; x=1781718810; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EATPXEB1RDeFojesY+qsHCN5Elyd5D9oGU90SkPET0U=;
        b=Q8ZQ4QFQlvsxV8LW5jP3ksCGb46O8J/DVA+2J4kdWBomDE7WM3O/ZdZiJEwik3nnA+
         oOQp8ZmtdHn0XGHg6cADxcWVLUEVxlHyUB23uuSXjAgbdLoRjviAjr8jKy3Idt25KpHs
         HOqCh27bwUKt6qs/D1lEavXR2DWHfpfGGnyZj+YcNhY8cjpNBWVA2G0YwYbMxqKCQ47i
         Zn/x0RRPn2cxqfcCIydh7gnVghEKNUB8UQIVmlMaIroEShGeCYiXSyI+9954uGRhyiBW
         whS8jruIvlGvoAj1+7UeFdvJSkXYPhSS577Eu6Bz7bZvUcZMuGAgFX5fz1opmRgH7lJn
         pENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781114010; x=1781718810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EATPXEB1RDeFojesY+qsHCN5Elyd5D9oGU90SkPET0U=;
        b=lz4ZtPl3+7kQ/QYBbgla/4vuiOQzgKezM655UPN+zSGgIgEYMH/V9FyV8ntG4hHYH7
         uxnSYD5lWDZkEZyrqBKV/QDtLufpsvO6ce6n54fZb3mrxGrWbrgm7d7wSxzrNgoCzsKc
         Aen0PWVpSeyv9C5zpXvyNX8Da/MgbvvTZJg5GeqAjMdpN7opG+/rmUtMLDIB5Br27Nfe
         PVA5EsU5tzYYTXnEjSzYdyLGb1EZuJTHKJiKsy58ZASKJptcNDxGB4q5aNtvNhe0X474
         sCtOFijpUHYL1trTlfCslV1u/obiSCO28KQqcOVWwRE3zmeu+Xw3kv0xvAaSlbgzIFmQ
         uvIg==
X-Gm-Message-State: AOJu0Yx7STz9yIYF4+q7xa9oec0HQnS+WeQ51nirMoYbZH6fSL35uLNf
	Mk98Hqu0GMt3rK7oL8Ks7Msza53EoXvCs/2gPTe1o1yU/8e2CG0UJzuS32VKV+1sVpA=
X-Gm-Gg: Acq92OH1wshtEjD2hMI1Q+UukeNavyj5hkeVY9IVtJhaoP5aMdZY3gCczhxuensQTi8
	mpyzFjpSlchsE916A8ukmeMjYmPcmETGt1ykrgXUa3qUazQOUE3ygoRZhaep2s03a+UdfZLkwyR
	Hp8iWat2G3nR7C5jEAKS9XMdcH2/j3GDb3pQo9DW6S4KFksfgCu0Bw2HJMS+tpdtw4YNZGSD2j6
	psSgSloXYf+aTiFRKDR2t/wWsBtRdcwvOons/DutRoC4z9LV0MRsyJGzYBlZgPjRkuj5yNy8gBD
	LmS50J5SHfQbzAO51nfsXJxSlxexStEEguOEzCR7Ch3JiabbgOqBWMGX510sZGRBU7MtboPJ+lD
	QtMi7/qxRUVUnrpc7+3UYoLEq14hiyCCvUO60+3+KGywOROniT1KZbGhM1XQucM67EN0K3iyvxx
	5syyEM0R0ufLewNoIiBc2X3bLbEN36OKHLhkleglTgGMvhiQ==
X-Received: by 2002:a05:6000:713:b0:460:1a52:8a13 with SMTP id ffacd0b85a97d-460301825femr38896171f8f.0.1781114010356;
        Wed, 10 Jun 2026 10:53:30 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:f160:c480:bee:c914])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4004sm73553248f8f.9.2026.06.10.10.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 10:53:29 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 10 Jun 2026 19:53:11 +0200
Subject: [PATCH 2/2] clocksource/drivers/arm_arch_timer_mmio: Restore
 support for early init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-arm-arch-timer-mmio-early-v1-2-ac17218ec8b4@linaro.org>
References: <20260610-arm-arch-timer-mmio-early-v1-0-ac17218ec8b4@linaro.org>
In-Reply-To: <20260610-arm-arch-timer-mmio-early-v1-0-ac17218ec8b4@linaro.org>
To: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Jack Matthews <jack@jackmatthe.ws>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_105332_255301_E7B97CB8 
X-CRM114-Status: GOOD (  20.92  )
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

Some single-core Qualcomm modem platforms (e.g. MDM9625, MDM9607) have an
obscure timer setup where the global Arm MMIO timer (arm,armv7-timer-mem)
is used as the only available timer for the CPU. This setup used to work
fine until commit 0f67b56d84b4 ("clocksource/drivers/arm_arch_timer_mmio:
Switch over to standalone driver") when the early timer initialization
using TIMER_OF_DECLARE() was removed when moving to the standalone MMIO
driver.

We need some timer early to run properly, so without another timer in the
system the only choice is to make the MMIO timer available early again
using TIMER_OF_DECLARE(). Use the refactoring in the previous commit to
reuse most of the initialization code in the new standalone driver and
probe one timer early if required. ACPI-based systems and platforms with a
CPU-local CP15 timer continue to probe the timer late as before.

Reported-by: Jack Matthews <jack@jackmatthe.ws>
Closes: https://lore.kernel.org/r/46A20F89-E208-4091-8B6E-B5C38BF82B42@jackmatthe.ws/
Fixes: 0f67b56d84b4 ("clocksource/drivers/arm_arch_timer_mmio: Switch over to standalone driver")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
I couldn't find any existing (fully-supported) platform upstream that
relies on this, so I omitted Cc stable. MDM9607 does have most of the
necessary drivers upstream, it's just missing the DT (I would like to
upstream that once ready).
---
 drivers/clocksource/arm_arch_timer_mmio.c | 47 +++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/clocksource/arm_arch_timer_mmio.c b/drivers/clocksource/arm_arch_timer_mmio.c
index 5cb94051c4be..d128dff7067f 100644
--- a/drivers/clocksource/arm_arch_timer_mmio.c
+++ b/drivers/clocksource/arm_arch_timer_mmio.c
@@ -15,6 +15,7 @@
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
@@ -409,6 +410,8 @@ static struct arch_timer *arch_timer_mmio_init(struct arch_timer_mem *gt_block,
 	return_ptr(at);
 }
 
+static struct device_node *arch_timer_mmio_early_np;
+
 static int arch_timer_mmio_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -417,6 +420,10 @@ static int arch_timer_mmio_probe(struct platform_device *pdev)
 	int ret;
 
 	if (np) {
+		/* Check if timer was already probed early */
+		if (np == arch_timer_mmio_early_np)
+			return 0;
+
 		gt_block = devm_kzalloc(&pdev->dev, sizeof(*gt_block),
 					GFP_KERNEL);
 		if (!gt_block)
@@ -436,6 +443,46 @@ static int arch_timer_mmio_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id arch_timer_cp15_match[] __initconst = {
+	{ .compatible = "arm,armv7-timer", },
+	{ .compatible = "arm,armv8-timer", },
+	{}
+};
+
+static bool __init arch_timer_mmio_has_cp15(void)
+{
+	struct device_node *np __free(device_node) =
+		of_find_matching_node(NULL, arch_timer_cp15_match);
+
+	return np && of_device_is_available(np);
+}
+
+static int __init arch_timer_mmio_of_early_init(struct device_node *np)
+{
+	struct arch_timer *at;
+	int ret;
+
+	if (arch_timer_mmio_early_np || arch_timer_mmio_has_cp15())
+		return -EPROBE_DEFER;
+
+	struct arch_timer_mem *gt_block __free(kfree) = kzalloc_obj(*gt_block);
+	if (!gt_block)
+		return -ENOMEM;
+
+	ret = of_populate_gt_block(np, gt_block);
+	if (ret)
+		return ret;
+
+	at = arch_timer_mmio_init(gt_block, np);
+	if (IS_ERR(at))
+		return PTR_ERR(at);
+	retain_and_null_ptr(gt_block);
+
+	arch_timer_mmio_early_np = np;
+	return 0;
+}
+TIMER_OF_DECLARE(armv7_arch_timer_mem, "arm,armv7-timer-mem", arch_timer_mmio_of_early_init);
+
 static const struct of_device_id arch_timer_mmio_of_table[] = {
 	{ .compatible = "arm,armv7-timer-mem", },
 	{}

-- 
2.54.0


