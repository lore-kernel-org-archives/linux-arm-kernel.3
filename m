Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90373C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 01:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4RLro0zVrzQrjAPm6l1qYto9Dw+jSbq9LMC2c97EwCE=; b=1x2NQ9iRb13OVYpHHXP1ro3r4/
	yzaBTPkuW+nVqsau70lVkyW+6UA4SbJSfFcUtA1vlTk4Ez8yENdcy0mu66orlAB+RaE1Tc+38tuLH
	NIqx/2xS9FKOo2A6F2N3TJ6FGmxeh+NqEIijKbCqXYUdvBCMOVZqETLxGBSPmsDJuRa1/cHVbY+mK
	KXlIKir6nAGdEDYz6ClWm2IUcn2EKsljSxzjNdUWSZafSjUNVkWUmG6951QrS2XeKI6VAPA575Bh/
	8eZNvPfLFgADymb+vjZDWBm/Q3TBvg2UROznYqPJ+gaygq5J4bqS92yDGK/w3ftUizEYTnpLfsRzk
	S3IJcYQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjoTh-0000000DZPB-0T2C;
	Wed, 15 Jul 2026 01:32:01 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjoTd-0000000DZO2-1yle
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 01:31:59 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7e9ecd7216cso833417a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 18:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784079116; x=1784683916; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4RLro0zVrzQrjAPm6l1qYto9Dw+jSbq9LMC2c97EwCE=;
        b=VLpnmMGY0x+dFUQKUABzhf/yPDHCGtMPDwE0D7youWM3fu5PYbkG9COffG/w/XZ+2G
         IiUPfX4QT24hlpvz7GPVv8tHRh+Uq86fv4GK8pw9+F4TVPnMnrEJqn51ApZq0wsPojOq
         H9jpRaH38yMHwS4y89YRbENpGrLLBx72cYQEDaKvfMlXPgAvO7qZIwgpVtMTyrSaY34+
         VHoislRV1aNcHPOSPjX/5+S9DKjB3n38GTO3rg4cTv2zWoPsL1isjxzTOeKzIK9NV4Cr
         PWzVUmpxorXC9xpa4QTVuk57PboMcT6XhuKLnne8lRhEXI5A5wmTJEh+6+0cbsA2UtZM
         0epQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784079116; x=1784683916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4RLro0zVrzQrjAPm6l1qYto9Dw+jSbq9LMC2c97EwCE=;
        b=n+9ETRPTnVUcbuckwVz4eG1kj6iS3ewhT8Q2giUQpZc3rP7hPL/dPgQyl5OkE6Ydf2
         b5pv+fH0t1k/HYaBdVvoc26sZB7bn2KprnNpR8EifMh5sUC0NgrFXH4xNZb4vyNRSE2+
         apRnhg24yfoftnP8jZXSsIvjnsBsLn0UAin6I2f8UexUnuc8Qgt64Hen88xmpT3XaDDi
         HvJfEQmbOsuBQpEiHqdX4N6cj6Vhh3P/WI+nAUKyZN+QuOuJ+ALclOoOI+GCT0p63B81
         3nKNpYgRhjmxs8DQQarVTkRUUjzYLxWbXvw8K51rvRqdZlZOsVR/47j2oJmXoPU7ae/J
         rp4w==
X-Forwarded-Encrypted: i=1; AHgh+RrX64FHeBPrqJpWAAaHyDknACqouRU+AWveZv6pYLeBS1Z06avtzWigZciY80RVJuVLDnj0ieou6hRWGodK4nG+@lists.infradead.org
X-Gm-Message-State: AOJu0YxkUcrYOVT9Qwk9QTsyFhFLQkz0Xnm4okC6GvFRozNBeLAjv5A+
	8PrDaF0a1MD8/fX3LKDTBgDLc/40+1n4nQFPuvwxg4ctbbaDluyCFXmI
X-Gm-Gg: AfdE7cnWM2Mil8b/XxzZiY94tlZ92T2Rs4ceDGpZFThJpvuBcu8ko2pwZUZElAifhyj
	2XHdyKnH3T+x8djHYigZlQihPfa3h2nrtMhHD+J6RIL3MybkwyGUU5241TOO0v2OU7gP7RoMb3X
	Ji1r7SFPOCwnciL/mQgkZ1L4vtRn5n2kwhpimrq5hzMLP2pkWsHa2FtU01shvpZ95vc3/oPPmkx
	p52cqbyPai7P58CgjWVpQLu2RrWKpbGfVv4+jBpWBIULpR199NQRSRjnsbL9G0tnLy2jYG89Q7w
	g6oKqvDTVvkBpUOF3pFZaQawnX/zdQHkT+yp3TP2tl56QFU/chCDQ2LKBU2ugQQIfTTbw/xVs4Z
	kpx+4OdeIxJD89WWO6Xvd7FBGC2V8r/vv7rqZccW0Nxbs70Vu8JcH/Th8/Gw5XhtsqfrJ/nHcXN
	T/kODEudz+atAsscSANTAvoJBMcsY/igSxMzkLelRpIVfX/u/rmdb7TEHQep/jJ6CaZLGxaeiCx
	r3HIXFQW5ASkCJorv3w1m7GU4KsVNo42iYPm94CZ8lEFrh5XMRjFrcTjbf/O17M2VmA3kSAIL49
	2A2QiVXfaA==
X-Received: by 2002:a05:6830:2306:b0:7e9:ead3:4449 with SMTP id 46e09a7af769-7ec0967b3e2mr9849272a34.6.1784079116368;
        Tue, 14 Jul 2026 18:31:56 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-11-8.hlrn.qwest.net. [174.29.11.8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcafda2ffsm16289012a34.12.2026.07.14.18.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 18:31:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: linux-mtd@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: sunxi: fix H6/H616 controller timings
Date: Tue, 14 Jul 2026 19:31:38 -0600
Message-ID: <20260715013142.640977-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_183157_528796_79D09179 
X-CRM114-Status: GOOD (  21.35  )
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

The NAND timing calculation was written for the original A10 NDFC. It
assumes command and address setup and hold intervals T1-T4, T7 and T11
are one controller clock and uses the A10 timing-register encodings.

The H6/H616 NDFC instead defines those intervals as two internal clock
cycles and uses different encodings for tWB, tADL, tWHR and tRHW, as
documented in the H616 User Manual.

Describe the timing characteristics in the controller capability data
so the clock solver can select a rate permitted by the NAND SDR timings
and program valid delay fields. Keep the legacy A10 behavior unchanged.

Fixes: 88fd4e4deae8 ("mtd: rawnand: sunxi: Add support for H616 nand controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 140 +++++++++++++++++-------------
 1 file changed, 82 insertions(+), 58 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 02647565c8ba..9b7d17b6d81a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -237,6 +237,18 @@ struct sunxi_nand_hw_ecc {
 	u32 ecc_ctl;
 };
 
+#define SUNXI_NFC_TIMING_STEPS	4
+
+/* Delay arrays contain internal NDFC clock cycles for field values 0 to 3. */
+struct sunxi_nfc_timings {
+	/* Internal clock cycles used by T1-T4, T7 and T11. */
+	u8 setup_cycles;
+	u8 tWB[SUNXI_NFC_TIMING_STEPS];
+	u8 tADL[SUNXI_NFC_TIMING_STEPS];
+	u8 tWHR[SUNXI_NFC_TIMING_STEPS];
+	u8 tRHW[SUNXI_NFC_TIMING_STEPS];
+};
+
 /**
  * struct sunxi_nand_chip - stores NAND chip device related information
  *
@@ -301,6 +313,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  *			bytes to write
  * @nuser_data_tab:	Size of @user_data_len_tab
  * @sram_size:		Size of the NAND controller SRAM
+ * @timings:		Controller timing characteristics
  */
 struct sunxi_nfc_caps {
 	bool has_mdma;
@@ -327,6 +340,7 @@ struct sunxi_nfc_caps {
 	unsigned int nuser_data_tab;
 	unsigned int max_ecc_steps;
 	int sram_size;
+	const struct sunxi_nfc_timings *timings;
 };
 
 /**
@@ -1667,16 +1681,35 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 	return nand_prog_page_end_op(nand);
 }
 
-static const s32 tWB_lut[] = {6, 12, 16, 20};
-static const s32 tRHW_lut[] = {4, 8, 12, 20};
+static const struct sunxi_nfc_timings sun4i_a10_nfc_timings = {
+	.setup_cycles = 1,
+	.tWB = { 6, 12, 16, 20 },
+	.tADL = { 7, 15, 23, 31 },
+	.tWHR = { 7, 15, 23, 31 },
+	.tRHW = { 4, 8, 12, 20 },
+};
+
+static const struct sunxi_nfc_timings sun50i_h6_nfc_timings = {
+	.setup_cycles = 2,
+	.tWB = { 28, 44, 60, 76 },
+	.tADL = { 0, 12, 28, 44 },
+	.tWHR = { 0, 12, 28, 44 },
+	.tRHW = { 8, 24, 40, 56 },
+};
+
+static void sunxi_nand_update_min_period(u32 *min_period, u32 duration,
+					 unsigned int cycles)
+{
+	*min_period = max(*min_period, DIV_ROUND_UP(duration, cycles));
+}
 
-static int _sunxi_nand_lookup_timing(const s32 *lut, int lut_size, u32 duration,
-		u32 clk_period)
+static int sunxi_nand_lookup_timing(const u8 *lut, u32 duration,
+				    u32 clk_period)
 {
 	u32 clk_cycles = DIV_ROUND_UP(duration, clk_period);
 	int i;
 
-	for (i = 0; i < lut_size; i++) {
+	for (i = 0; i < SUNXI_NFC_TIMING_STEPS; i++) {
 		if (clk_cycles <= lut[i])
 			return i;
 	}
@@ -1685,14 +1718,12 @@ static int _sunxi_nand_lookup_timing(const s32 *lut, int lut_size, u32 duration,
 	return -EINVAL;
 }
 
-#define sunxi_nand_lookup_timing(l, p, c) \
-			_sunxi_nand_lookup_timing(l, ARRAY_SIZE(l), p, c)
-
 static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 				     const struct nand_interface_config *conf)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(sunxi_nand->nand.controller);
+	const struct sunxi_nfc_timings *nfc_timings = nfc->caps->timings;
 	const struct nand_sdr_timings *timings;
 	u32 min_clk_period = 0;
 	s32 tWB, tADL, tWHR, tRHW, tCAD;
@@ -1703,77 +1734,65 @@ static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 		return -ENOTSUPP;
 
 	/* T1 <=> tCLS */
-	if (timings->tCLS_min > min_clk_period)
-		min_clk_period = timings->tCLS_min;
+	sunxi_nand_update_min_period(&min_clk_period, timings->tCLS_min,
+				     nfc_timings->setup_cycles);
 
 	/* T2 <=> tCLH */
-	if (timings->tCLH_min > min_clk_period)
-		min_clk_period = timings->tCLH_min;
+	sunxi_nand_update_min_period(&min_clk_period, timings->tCLH_min,
+				     nfc_timings->setup_cycles);
 
 	/* T3 <=> tCS */
-	if (timings->tCS_min > min_clk_period)
-		min_clk_period = timings->tCS_min;
+	sunxi_nand_update_min_period(&min_clk_period, timings->tCS_min,
+				     nfc_timings->setup_cycles);
 
 	/* T4 <=> tCH */
-	if (timings->tCH_min > min_clk_period)
-		min_clk_period = timings->tCH_min;
+	sunxi_nand_update_min_period(&min_clk_period, timings->tCH_min,
+				     nfc_timings->setup_cycles);
 
 	/* T5 <=> tWP */
-	if (timings->tWP_min > min_clk_period)
-		min_clk_period = timings->tWP_min;
+	sunxi_nand_update_min_period(&min_clk_period, timings->tWP_min, 1);
 
 	/* T6 <=> tWH */
-	if (timings->tWH_min > min_clk_period)
-		min_clk_period = timings->tWH_min;
+	sunxi_nand_update_min_period(&min_clk_period, timings->tWH_min, 1);
 
 	/* T7 <=> tALS */
-	if (timings->tALS_min > min_clk_period)
-		min_clk_period = timings->tALS_min;
+	sunxi_nand_update_min_period(&min_clk_period, timings->tALS_min,
+				     nfc_timings->setup_cycles);
 
 	/* T8 <=> tDS */
-	if (timings->tDS_min > min_clk_period)
-		min_clk_period = timings->tDS_min;
+	sunxi_nand_update_min_period(&min_clk_period, timings->tDS_min, 1);
 
 	/* T9 <=> tDH */
-	if (timings->tDH_min > min_clk_period)
-		min_clk_period = timings->tDH_min;
+	sunxi_nand_update_min_period(&min_clk_period, timings->tDH_min, 1);
 
 	/* T10 <=> tRR */
-	if (timings->tRR_min > (min_clk_period * 3))
-		min_clk_period = DIV_ROUND_UP(timings->tRR_min, 3);
+	sunxi_nand_update_min_period(&min_clk_period, timings->tRR_min, 3);
 
 	/* T11 <=> tALH */
-	if (timings->tALH_min > min_clk_period)
-		min_clk_period = timings->tALH_min;
+	sunxi_nand_update_min_period(&min_clk_period, timings->tALH_min,
+				     nfc_timings->setup_cycles);
 
 	/* T12 <=> tRP */
-	if (timings->tRP_min > min_clk_period)
-		min_clk_period = timings->tRP_min;
+	sunxi_nand_update_min_period(&min_clk_period, timings->tRP_min, 1);
 
 	/* T13 <=> tREH */
-	if (timings->tREH_min > min_clk_period)
-		min_clk_period = timings->tREH_min;
+	sunxi_nand_update_min_period(&min_clk_period, timings->tREH_min, 1);
 
 	/* T14 <=> tRC */
-	if (timings->tRC_min > (min_clk_period * 2))
-		min_clk_period = DIV_ROUND_UP(timings->tRC_min, 2);
+	sunxi_nand_update_min_period(&min_clk_period, timings->tRC_min, 2);
 
 	/* T15 <=> tWC */
-	if (timings->tWC_min > (min_clk_period * 2))
-		min_clk_period = DIV_ROUND_UP(timings->tWC_min, 2);
+	sunxi_nand_update_min_period(&min_clk_period, timings->tWC_min, 2);
 
 	/* T16 - T19 + tCAD */
-	if (timings->tWB_max > (min_clk_period * 20))
-		min_clk_period = DIV_ROUND_UP(timings->tWB_max, 20);
-
-	if (timings->tADL_min > (min_clk_period * 32))
-		min_clk_period = DIV_ROUND_UP(timings->tADL_min, 32);
-
-	if (timings->tWHR_min > (min_clk_period * 32))
-		min_clk_period = DIV_ROUND_UP(timings->tWHR_min, 32);
-
-	if (timings->tRHW_min > (min_clk_period * 20))
-		min_clk_period = DIV_ROUND_UP(timings->tRHW_min, 20);
+	sunxi_nand_update_min_period(&min_clk_period, timings->tWB_max,
+				     nfc_timings->tWB[SUNXI_NFC_TIMING_STEPS - 1]);
+	sunxi_nand_update_min_period(&min_clk_period, timings->tADL_min,
+				     nfc_timings->tADL[SUNXI_NFC_TIMING_STEPS - 1]);
+	sunxi_nand_update_min_period(&min_clk_period, timings->tWHR_min,
+				     nfc_timings->tWHR[SUNXI_NFC_TIMING_STEPS - 1]);
+	sunxi_nand_update_min_period(&min_clk_period, timings->tRHW_min,
+				     nfc_timings->tRHW[SUNXI_NFC_TIMING_STEPS - 1]);
 
 	/*
 	 * In non-EDO, tREA should be less than tRP to guarantee that the
@@ -1789,26 +1808,28 @@ static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 	if (timings->tREA_max > min_clk_period && !timings->tRLOH_min)
 		min_clk_period = timings->tREA_max;
 
-	tWB  = sunxi_nand_lookup_timing(tWB_lut, timings->tWB_max,
+	tWB  = sunxi_nand_lookup_timing(nfc_timings->tWB, timings->tWB_max,
 					min_clk_period);
 	if (tWB < 0) {
 		dev_err(nfc->dev, "unsupported tWB\n");
 		return tWB;
 	}
 
-	tADL = DIV_ROUND_UP(timings->tADL_min, min_clk_period) >> 3;
-	if (tADL > 3) {
+	tADL = sunxi_nand_lookup_timing(nfc_timings->tADL,
+					timings->tADL_min, min_clk_period);
+	if (tADL < 0) {
 		dev_err(nfc->dev, "unsupported tADL\n");
-		return -EINVAL;
+		return tADL;
 	}
 
-	tWHR = DIV_ROUND_UP(timings->tWHR_min, min_clk_period) >> 3;
-	if (tWHR > 3) {
+	tWHR = sunxi_nand_lookup_timing(nfc_timings->tWHR,
+					timings->tWHR_min, min_clk_period);
+	if (tWHR < 0) {
 		dev_err(nfc->dev, "unsupported tWHR\n");
-		return -EINVAL;
+		return tWHR;
 	}
 
-	tRHW = sunxi_nand_lookup_timing(tRHW_lut, timings->tRHW_min,
+	tRHW = sunxi_nand_lookup_timing(nfc_timings->tRHW, timings->tRHW_min,
 					min_clk_period);
 	if (tRHW < 0) {
 		dev_err(nfc->dev, "unsupported tRHW\n");
@@ -1824,7 +1845,7 @@ static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 	 */
 	tCAD = 0x7;
 
-	/* TODO: A83 has some more bits for CDQSS, CS, CLHZ, CCS, WC */
+	/* TODO: A83 and H6 have more bits for CDQSS, CS, CLHZ, CCS, WC */
 	sunxi_nand->timing_cfg = NFC_TIMING_CFG(tWB, tADL, tWHR, tRHW, tCAD);
 
 	/* Convert min_clk_period from picoseconds to nanoseconds */
@@ -2595,6 +2616,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.nstrengths = ARRAY_SIZE(sunxi_ecc_strengths_a10),
 	.max_ecc_steps = 16,
 	.sram_size = 1024,
+	.timings = &sun4i_a10_nfc_timings,
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
@@ -2617,6 +2639,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 	.nstrengths = ARRAY_SIZE(sunxi_ecc_strengths_a10),
 	.max_ecc_steps = 16,
 	.sram_size = 1024,
+	.timings = &sun4i_a10_nfc_timings,
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
@@ -2641,6 +2664,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
 	.nuser_data_tab = ARRAY_SIZE(sunxi_user_data_len_h6),
 	.max_ecc_steps = 32,
 	.sram_size = 8192,
+	.timings = &sun50i_h6_nfc_timings,
 };
 
 static const struct of_device_id sunxi_nfc_ids[] = {
-- 
2.53.0


