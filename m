Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95755C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 15:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LVBJaFomYnqSqtZwNfhU1nsKV+qCjSwKc3i+p0HPzM=; b=4J6pur0wIB/+XEZ2bIj7hH24VB
	YRbCz0N4A8YMx1F0FGrgvxS6hW6+1unbII5zaEzgMwBf2JY56U3MmDlZOMU1dw7CzK2A0Sood+tqZ
	7fAaNTPQwUXpSlxOFNmnB28HIEc0WBFKirLCfJSGltbzovb4xNUHgFvji4d5efrdl/UWruTqvFrAI
	Gftpm38uUR1ThiuCDWDH77UzSxWRUluVGQNVdN72dW1hystRjz+n3uLaDh3jaLOqiRpzBM+VcdII5
	ixzXyro1XcPaztuJbDKgsTp8dWqlrguCAVltnCfNsvoLZyEAtK5SPDDaPbiCe+HMz3DBp85M3BAjM
	CT5j12vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMfC-00000008M2S-3un4;
	Fri, 07 Aug 2026 15:39:14 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsMfA-00000008Lzp-0S0Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 15:39:13 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-45837e52d8aso1219061fac.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 08:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786117151; x=1786721951; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LVBJaFomYnqSqtZwNfhU1nsKV+qCjSwKc3i+p0HPzM=;
        b=koMLZmWk8W4+o9W29pnf5M+yDRfwN9WRFOgOIQRep1mPLX3Qv+j47q35zq2OKt2xFy
         FBPBVi1mK9CH7Eogoe9FpBjd4lKJq+ztLZkRsxuByiaXZ0VVkGyxCRz0nHOuZrquDdos
         DcfejYT0vjUG13P54TBYJ10trWqaUBY43zAq14jezp/IV1YxeQh4+G5d807ywM8RXEul
         rD4Z82YzEVxBiEqkueh5572gumJaSjHp2RezYugfFoYaLIEtgDhthwSvUaC4ZIcPND0I
         3zlcr+5p6EU5N6+XRMYmuQ0eKmfWyQMCZz5kQrnp6l+Q9S7Ow7k1a6lRk+z0bg3qn/GW
         WJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786117151; x=1786721951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4LVBJaFomYnqSqtZwNfhU1nsKV+qCjSwKc3i+p0HPzM=;
        b=klddzxjVEaHAXvnPODZbSe+utZM/TOyzewyP6F0nuQcH6SeNjMr/Wv8pM880If8Jzh
         LqX4HBRnIIIVBv+yn4MOhSNwwcxOFUWQ/6Hs/kkgLcmLoYqB7xJ1aIrcE/zkvW7DqmZo
         mg8LB8KdR61cMdNed52gmBR6gw0jcgnZUvB4e9TvTGbsAJOnqwPYDdarnk9WC4uU4Mal
         yGynFUFtP3G1FG5nfD7f6d/mFSXq500CcoR3MdS33wRmP81OMZvsKnBKNVaA8e+lpTln
         TJVH0Pv2kede4s/8EcP+bdAUKjOIBSgODPe7V36vC36BPsRWoNkA/9wd48znUfrbL5NT
         PwhQ==
X-Forwarded-Encrypted: i=1; AHgh+RoKOZ3SjmWBcaE2ZI6tex1l/GwSzQayROOcBF/dWnlzlygJOxbzeQmXx6jG4lYDkWzZ2FolWLO3v3r+bWDqS+23@lists.infradead.org
X-Gm-Message-State: AOJu0Yys8Eomk+wWzvN8DjeDGFPrjTjJQVMsS3p69KvAZdfSl9KWml3T
	fQukyvDHQ1kbLlEOnZDq3LBZAcpBM+dhgg56Vh4vd1qkgdWn0Q+Lxe/r
X-Gm-Gg: AR+sD105k7oVDC7smoffjHkaSG82md9NTNxE5tBjyveAM9nH73mkXQP6fXSzcBtMWiI
	O88mhJ9jM9FgNcz2APHa5dRcUEGhm5CE4fr/cOlOrCaO3Vg+8eWduTrP6HN04Tz5Y2kzX7fi659
	xJlvjyee1QYtxZJsmPdeOO7yPA4BLRRLd/YOXUtQnab0Pi3KlAqpcR+qE67dlh9pb0+0ZY9Rq7s
	BsYXTww2OWK9NT7VsJ2wZpDCcOGIUqJ6tTlKlUUJD5BSlU7qFQ20kLVTbEdySBvyov2YQ+UsUm5
	5A5bog/ir4VhK50zpWvyY730IUzcvS7xEjBefrhxxOA0pbh7cj57y3X6wR9iAXx5QuOcF12d3+P
	X1TsVhuWMnc7BZQKZuiNZh/7qL27/Jqp7PfKfW1WA1f4ywxverLL3s2DMOA1rLMeHEcGdR9yg+1
	M+cBgYVpR/gIyFvZ4JPRxf7eeLn33/cTOFqL5IUYJC7rpN6oi+xihZV7ReD2/XORhjYLeYWvSV8
	WT95mNXxWHCUcMgmjQ9PZ8yLT9+yPqZa9NvFinsW1EKS7PuEmb1mqYOXvtONOLAMjyroTRYjd4u
	WDnRCywozoZdzmnZdWXfm4L2w7ysW22mlwOF9NNn8ICz5c8XUpsbWXQKF+YWsIuhaoV40g9Qt2v
	5LTHa2/djTWpLySYT
X-Received: by 2002:a05:6808:c1ba:b0:48a:ddd4:d36f with SMTP id 5614622812f47-4afadf16e3fmr12514228b6e.8.1786117150933;
        Fri, 07 Aug 2026 08:39:10 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae706cd5sm7353485b6e.11.2026.08.07.08.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 08:39:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 07 Aug 2026 09:39:00 -0600
Subject: [PATCH v3 2/3] mtd: rawnand: sunxi: describe tADL and tWHR delays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-submit-sunxi-nand-h6-h616-timings-v3-2-91287b543f41@gmail.com>
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
X-CRM114-CacheID: sfid-20260807_083912_185029_B9B9F7CA 
X-CRM114-Status: GOOD (  14.71  )
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

The tADL and tWHR timing fields use four encoded delays, but the driver
currently derives their values with a shift. This hides the actual
controller timing characteristics and lets the clock solver select a
32-cycle delay that the fields cannot encode.

Describe the legacy 7, 15, 23 and 31 cycle thresholds explicitly and use
the tables for both clock selection and field lookup. This prepares the
driver for controllers with different encodings.

Fixes: 88fd4e4deae8 ("mtd: rawnand: sunxi: Add support for H616 nand controller")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 9885248c9b85..df52501c1285 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -242,6 +242,8 @@ struct sunxi_nand_hw_ecc {
 /* Delay arrays contain internal NDFC clock cycles for field values 0 to 3. */
 struct sunxi_nfc_timings {
 	s32 tWB[SUNXI_NFC_TIMING_STEPS];
+	s32 tADL[SUNXI_NFC_TIMING_STEPS];
+	s32 tWHR[SUNXI_NFC_TIMING_STEPS];
 	s32 tRHW[SUNXI_NFC_TIMING_STEPS];
 };
 
@@ -1679,6 +1681,8 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 
 static const struct sunxi_nfc_timings sun4i_a10_nfc_timings = {
 	.tWB = { 6, 12, 16, 20 },
+	.tADL = { 7, 15, 23, 31 },
+	.tWHR = { 7, 15, 23, 31 },
 	.tRHW = { 4, 8, 12, 20 },
 };
 
@@ -1781,11 +1785,15 @@ static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
 		min_clk_period = DIV_ROUND_UP(timings->tWB_max,
 					      nfc_timings->tWB[SUNXI_NFC_TIMING_STEPS - 1]);
 
-	if (timings->tADL_min > (min_clk_period * 32))
-		min_clk_period = DIV_ROUND_UP(timings->tADL_min, 32);
+	if (timings->tADL_min >
+	    (min_clk_period * nfc_timings->tADL[SUNXI_NFC_TIMING_STEPS - 1]))
+		min_clk_period = DIV_ROUND_UP(timings->tADL_min,
+					      nfc_timings->tADL[SUNXI_NFC_TIMING_STEPS - 1]);
 
-	if (timings->tWHR_min > (min_clk_period * 32))
-		min_clk_period = DIV_ROUND_UP(timings->tWHR_min, 32);
+	if (timings->tWHR_min >
+	    (min_clk_period * nfc_timings->tWHR[SUNXI_NFC_TIMING_STEPS - 1]))
+		min_clk_period = DIV_ROUND_UP(timings->tWHR_min,
+					      nfc_timings->tWHR[SUNXI_NFC_TIMING_STEPS - 1]);
 
 	if (timings->tRHW_min >
 	    (min_clk_period * nfc_timings->tRHW[SUNXI_NFC_TIMING_STEPS - 1]))
@@ -1813,16 +1821,18 @@ static int sunxi_nfc_setup_interface(struct nand_chip *nand, int csline,
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
 
 	tRHW = sunxi_nand_lookup_timing(nfc_timings->tRHW, timings->tRHW_min,

-- 
2.53.0


