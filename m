Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D59D29FBC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 01:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=70biaWPUxzLhw9ksFEz/hXAB/ieBt8ygwZwDIRUemd0=; b=taL8zRanNMe+B2GZZwRuLBzSPj
	F47TRpHas+tsZ0m3yHmOtd8jadMH03d1jTiK4nPAPphZpBMo8e3Pztu5EpwtVbWzQRIsnuExlFnPO
	fz7Q3x3QFk3cUXRrI4+t7mKoKKCVhBA5CVk9jX8LdAgFw4Ow+fXZESU8wy3AIZvv6lk4kXvLOsqkB
	K2T64wsAzsCBbs118TOrA7nnDDrS5XJk+NUAE1WNanVRltmIakEWvug5TGFXFBh/FypKBwLClslh3
	KeOPt3pCZxncpu1FJfIQazypOBBCdKidhLONHdrdNPV+G8wEiTzup8rq4ybRhPYyoapHZg8tJRBFU
	oJVsijHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ri0-00000005M6j-2NBj;
	Thu, 07 Nov 2024 01:53:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8rY8-00000005K5b-3k6L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 01:43:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C236F497;
	Wed,  6 Nov 2024 17:43:31 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A7F83F66E;
	Wed,  6 Nov 2024 17:43:00 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Yangtao Li <tiny.windzz@gmail.com>,
	Cody Eksal <masterr3c0rd@epochal.quest>,
	Parthiban <parthiban@linumiz.com>,
	stable@vger.kernel.org
Subject: [PATCH] mmc: sunxi-mmc: Fix A100 compatible description
Date: Thu,  7 Nov 2024 01:42:40 +0000
Message-ID: <20241107014240.24669-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_174305_000417_B813EB3F 
X-CRM114-Status: GOOD (  13.20  )
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

It turns out that the Allwinner A100/A133 SoC only supports 8K DMA
blocks (13 bits wide), for both the SD/SDIO and eMMC instances.
And while this alone would make a trivial fix, the H616 falls back to
the A100 compatible string, so we have to now match the H616 compatible
string explicitly against the description advertising 64K DMA blocks.

As the A100 is now compatible with the D1 description, let the A100
compatible string point to that block instead, and introduce an explicit
match against the H616 string, pointing to the old description.
Also remove the redundant setting of clk_delays to NULL on the way.

Fixes: 3536b82e5853 ("mmc: sunxi: add support for A100 mmc controller")
Cc: stable@vger.kernel.org
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/mmc/host/sunxi-mmc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index d3bd0ac99ec46..e0ab5fd635e6c 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -1191,10 +1191,9 @@ static const struct sunxi_mmc_cfg sun50i_a64_emmc_cfg = {
 	.needs_new_timings = true,
 };
 
-static const struct sunxi_mmc_cfg sun50i_a100_cfg = {
+static const struct sunxi_mmc_cfg sun50i_h616_cfg = {
 	.idma_des_size_bits = 16,
 	.idma_des_shift = 2,
-	.clk_delays = NULL,
 	.can_calibrate = true,
 	.mask_data0 = true,
 	.needs_new_timings = true,
@@ -1217,8 +1216,9 @@ static const struct of_device_id sunxi_mmc_of_match[] = {
 	{ .compatible = "allwinner,sun20i-d1-mmc", .data = &sun20i_d1_cfg },
 	{ .compatible = "allwinner,sun50i-a64-mmc", .data = &sun50i_a64_cfg },
 	{ .compatible = "allwinner,sun50i-a64-emmc", .data = &sun50i_a64_emmc_cfg },
-	{ .compatible = "allwinner,sun50i-a100-mmc", .data = &sun50i_a100_cfg },
+	{ .compatible = "allwinner,sun50i-a100-mmc", .data = &sun20i_d1_cfg },
 	{ .compatible = "allwinner,sun50i-a100-emmc", .data = &sun50i_a100_emmc_cfg },
+	{ .compatible = "allwinner,sun50i-h616-mmc", .data = &sun50i_h616_cfg },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sunxi_mmc_of_match);
-- 
2.46.2


