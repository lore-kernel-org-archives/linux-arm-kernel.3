Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0244C2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 15:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xCFnyxQ3kE94m7oA5V9nQHQf/U50pnd0oZWwoKAuPBw=; b=3LINRDKkOUABXLv9OHA1bLz/+c
	RyYGEmBW6NYu5Y/MlULc/mK6+fzZuw3u1DI+gMPRuBvIy3CrhvsaLMz6Wbseaxm9e6+EenRLPQjd4
	nQssQ21rp3DFzoAbvO/3jSCDiqOF9oK+RSzG7AKWmfAe02/t4k7GGB38VL0yeW/xl56O5soszBbWO
	vQvHs7WNfAYBx0jI3VIlej4BNlf3qgDlZIfoI+qJv6iNIdZ53L0EDSxxFY490bdDsByaxlAE108ZR
	ggHdD6RkngnwNvnfbvc8zGGh+dp//nT01J8h0wGk845qW0OEv7JuTIY5NHtUydjDTfut1JDWq1/Pe
	ISJl//Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMfI-00000008M6h-2Ja2;
	Fri, 07 Aug 2026 15:39:20 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMfB-00000008M0S-0Ea3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 15:39:14 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-49ff971e903so1482167b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 08:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786117152; x=1786721952; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xCFnyxQ3kE94m7oA5V9nQHQf/U50pnd0oZWwoKAuPBw=;
        b=bLtFfkHzEwZJEToCWe1dbcshMzC3x+keizL4IC5nQpuy/fyrFepLpokBL2BCWBKyVM
         qBcg5fjxxOc/yBi98Pg0MHZvMB0U8M1BeAGHYbpGtuo+1XjAqFGxVKNZbNT7QEfn+nyz
         S2qC/BgU1Hw3QnarYdH1NaAroQIn7OjSs36P/gRkm1YfDmXj0xyuQiwkoz9I+9aRA9l5
         YY93oFdt6FF/PAIDmMZbQa2Q8mdgsJJmLdrPkr09t59YWrXPxaMFgVri8RBYPnxTceTR
         FGQVrvxFYlOtmRXTpqrcUHyiCu8bfmrU6eU6eEaqmHoZ1VDxpPM0/ny2Ud+fvaiFjtPp
         nLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786117152; x=1786721952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xCFnyxQ3kE94m7oA5V9nQHQf/U50pnd0oZWwoKAuPBw=;
        b=mrXgleRhW708ex4JjbwnJu2foJ3atwVR9URoOGvNQHnxDFzJqtns8/7RZfFRAl/bs9
         O4JSQOzrsxJAl63ob1/vno22ox1f8Z5s4hSu7rXQwWOxMkYbiIq1jwvK5ejEFCQwQ8qJ
         6lHmMhN3xK4bSUVC9suCOoywBhIriyh4OuW+ZhmAvHA1uatYbW5SNw/uK/ZCF9MrSqJl
         jR6iIi40CDwAlF3TCs8xi006S7YawLvMhbvjN842pbhFkWEf1cWQY2fvhLpcYcIXvtPQ
         RjdjGS0+CeKzbfHxlfOwfdQJqMZvX93PunQqUMpHE61saBs0Z7u/xLbtS6xUvOPTQUCU
         S7KA==
X-Forwarded-Encrypted: i=1; AHgh+RqUtTszh1hzg7FHf7o5Tq27mw3SmIMG2wGZ3yhoIyxjEw6DdtUekKhqo+O0lx/XsHikygCj/5iQJRG1bo4kXBt3@lists.infradead.org
X-Gm-Message-State: AOJu0YwQd+0msxi+6AOqv5tQNqXi6wXbOUPZbyXsZU0PkwgL/ZfLyjg+
	9G6E20l+ZhWCIyCFSj5paIPAxYhi+p65fAJH1hX20/Q/cJmq+/Aeujzt
X-Gm-Gg: AR+sD1352H3lLmA3gF5MgZMVuBn6A8XSDuzBGk56F0SQNqEiydPJ/NnJLkIF4/tNTUt
	EB7gyzgePZn3K2SwLiClAdTpLFIf639+bqrhSixygrY3xrsXuSXQrbGzoxvFZ4+bMsoIUT1WU35
	wIzz3xsWVK1DI5GjiN2G2KHA6jz4+zXvB9AuLZUhpTJCKA9LxHU3Rns5pSB5zD3P6+3r674amQA
	213rrWTg3NfJ3wabUD+GQGnGSnWQk9nccnchae5f3dbNR4/eI76c+ETieHNkLKL1xqirVgFY+sd
	Qw+BjXKiWCq/9oDtpe/tzkMDNrZhd8rh1uFLG20CIt0t2hqMcEnpU5UREQyPKFRPB/ChQZNz+9k
	v7byo9gj5y1BjdsDIf8IVq7pu5///BWlI+3z+6Ny5yAcKVADCwBKnjAwzJZHQHqHLJQgMFIBH04
	Mtln6fN2A41WTfJssim13KvRAvmqIv0PAkhLQN+oG0hsOMeKwwsc53JciGHjxnZUFuYInlF6QuL
	ImXq0s91MfPEjzNvkFUYcjtmggsregcJ6auphgofHt4akuJeMwBDNn8kk9K7FPsuisJrQpCewmB
	1HPrAlXrm3mKRArU0es9DCWjuOlwEcQl/lYDGo2BoMEpqviQGCW6kRJsbHk8gi+gcsk/osd6kMI
	BX3+CgB/DgsmgcDWQ
X-Received: by 2002:a05:6808:ec9:b0:4a4:cedc:6859 with SMTP id 5614622812f47-4afc4df6419mr8781396b6e.4.1786117151816;
        Fri, 07 Aug 2026 08:39:11 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae706cd5sm7353485b6e.11.2026.08.07.08.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 08:39:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 07 Aug 2026 09:39:01 -0600
Subject: [PATCH v3 3/3] mtd: rawnand: sunxi: fix H6/H616 controller timings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-submit-sunxi-nand-h6-h616-timings-v3-3-91287b543f41@gmail.com>
References: <20260807-submit-sunxi-nand-h6-h616-timings-v3-0-91287b543f41@gmail.com>
In-Reply-To: <20260807-submit-sunxi-nand-h6-h616-timings-v3-0-91287b543f41@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Genoud <richard.genoud@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_083913_124001_2F5852C9 
X-CRM114-Status: GOOD (  15.44  )
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

The NAND timing calculation assumes that command and address setup and
hold intervals T1-T4, T7 and T11 each take one controller clock. It also
uses the original A10 delay encodings for tWB, tADL, tWHR and tRHW.

The H6/H616 NDFC defines the setup and hold intervals as two internal
clock cycles and uses different delay encodings. Add the H616 timing
characteristics and select them through the controller capability data so
the clock solver and timing fields match the hardware.

Fixes: 88fd4e4deae8 ("mtd: rawnand: sunxi: Add support for H616 nand controller")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 49 ++++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index df52501c1285..ca74c9c333e7 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -241,6 +241,8 @@ struct sunxi_nand_hw_ecc {
 
 /* Delay arrays contain internal NDFC clock cycles for field values 0 to 3. */
 struct sunxi_nfc_timings {
+	/* Internal clock cycles used by T1-T4, T7 and T11. */
+	u8 setup_cycles;
 	s32 tWB[SUNXI_NFC_TIMING_STEPS];
 	s32 tADL[SUNXI_NFC_TIMING_STEPS];
 	s32 tWHR[SUNXI_NFC_TIMING_STEPS];
@@ -1680,12 +1682,21 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 }
 
 static const struct sunxi_nfc_timings sun4i_a10_nfc_timings = {
+	.setup_cycles = 1,
 	.tWB = { 6, 12, 16, 20 },
 	.tADL = { 7, 15, 23, 31 },
 	.tWHR = { 7, 15, 23, 31 },
 	.tRHW = { 4, 8, 12, 20 },
 };
 
+static const struct sunxi_nfc_timings sun50i_h616_nfc_timings = {
+	.setup_cycles = 2,
+	.tWB = { 28, 44, 60, 76 },
+	.tADL = { 0, 12, 28, 44 },
+	.tWHR = { 0, 12, 28, 44 },
+	.tRHW = { 8, 24, 40, 56 },
+};
+
 static int _sunxi_nand_lookup_timing(const s32 *lut, int lut_size, u32 duration,
 		u32 clk_period)
 {
@@ -1720,20 +1731,28 @@ static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 		return -ENOTSUPP;
 
 	/* T1 <=> tCLS */
-	if (timings->tCLS_min > min_clk_period)
-		min_clk_period = timings->tCLS_min;
+	if (timings->tCLS_min >
+	    min_clk_period * nfc_timings->setup_cycles)
+		min_clk_period = DIV_ROUND_UP(timings->tCLS_min,
+					      nfc_timings->setup_cycles);
 
 	/* T2 <=> tCLH */
-	if (timings->tCLH_min > min_clk_period)
-		min_clk_period = timings->tCLH_min;
+	if (timings->tCLH_min >
+	    min_clk_period * nfc_timings->setup_cycles)
+		min_clk_period = DIV_ROUND_UP(timings->tCLH_min,
+					      nfc_timings->setup_cycles);
 
 	/* T3 <=> tCS */
-	if (timings->tCS_min > min_clk_period)
-		min_clk_period = timings->tCS_min;
+	if (timings->tCS_min >
+	    min_clk_period * nfc_timings->setup_cycles)
+		min_clk_period = DIV_ROUND_UP(timings->tCS_min,
+					      nfc_timings->setup_cycles);
 
 	/* T4 <=> tCH */
-	if (timings->tCH_min > min_clk_period)
-		min_clk_period = timings->tCH_min;
+	if (timings->tCH_min >
+	    min_clk_period * nfc_timings->setup_cycles)
+		min_clk_period = DIV_ROUND_UP(timings->tCH_min,
+					      nfc_timings->setup_cycles);
 
 	/* T5 <=> tWP */
 	if (timings->tWP_min > min_clk_period)
@@ -1744,8 +1763,10 @@ static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 		min_clk_period = timings->tWH_min;
 
 	/* T7 <=> tALS */
-	if (timings->tALS_min > min_clk_period)
-		min_clk_period = timings->tALS_min;
+	if (timings->tALS_min >
+	    min_clk_period * nfc_timings->setup_cycles)
+		min_clk_period = DIV_ROUND_UP(timings->tALS_min,
+					      nfc_timings->setup_cycles);
 
 	/* T8 <=> tDS */
 	if (timings->tDS_min > min_clk_period)
@@ -1760,8 +1781,10 @@ static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 		min_clk_period = DIV_ROUND_UP(timings->tRR_min, 3);
 
 	/* T11 <=> tALH */
-	if (timings->tALH_min > min_clk_period)
-		min_clk_period = timings->tALH_min;
+	if (timings->tALH_min >
+	    min_clk_period * nfc_timings->setup_cycles)
+		min_clk_period = DIV_ROUND_UP(timings->tALH_min,
+					      nfc_timings->setup_cycles);
 
 	/* T12 <=> tRP */
 	if (timings->tRP_min > min_clk_period)
@@ -2670,7 +2693,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_h616_caps = {
 	.nuser_data_tab = ARRAY_SIZE(sunxi_user_data_len_h6),
 	.max_ecc_steps = 32,
 	.sram_size = 8192,
-	.timings = &sun4i_a10_nfc_timings,
+	.timings = &sun50i_h616_nfc_timings,
 };
 
 static const struct of_device_id sunxi_nfc_ids[] = {

-- 
2.53.0


