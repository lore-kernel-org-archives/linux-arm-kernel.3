Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62DDC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 17:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fU/T4ePwxMvnfrbedCWGcOi9RX0frxKmTN5hi5W5USU=; b=dDtKMQpjVmvPYnBZ0YHhTOpGkI
	y5ArUDMJ/gPiZLdWhw4U0FJE+mvdeKHlRuH3uqQRHID2HzZ/9kwHOrDJV3QyPePbxQb0oeAa3e3qT
	G7A7nrM2BYTSLYmGXDX9DsVXhOSIuF92L+hz2IzXrUspGIhim56GP47OpS3UZ3pMAQmEz+Uw7ydT9
	J5HjFhQzMj/qXQHqMReF97+6tUaKOV47fc0IdpX46Zyc0Az2uDvzqeYj86cqud0ZpxRbOZxBKtQFj
	n7ZJMS/u5zVjeEKkCC2Sc86msnzTtBRywtJRdmaKY1mVCJrV9zdiwIiglzq00Qv0uvM1YtmghtBEX
	74WAKlIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkmSJ-00000002tjQ-1j4X;
	Fri, 17 Jul 2026 17:34:35 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkmSE-00000002teW-1185
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 17:34:31 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7e6b554044fso6491324a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 10:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784309669; x=1784914469; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fU/T4ePwxMvnfrbedCWGcOi9RX0frxKmTN5hi5W5USU=;
        b=S6X8/FBeM+MvHGCjXye2YQ9gIGSR5FCASPVt9Kdt10LsEhd4fWPkBkuNm7iPCe8Y2d
         Rz8OUMK4rHExZ9PXA+LSRwae9IQdHcYbvZ93LKDZ5QvA0Lk3K33AZI4gDdLETSff5V2e
         lYVn0KqDaTMpvqIaj+DCvwem2m0s0+ujMoZ5pHSrokeOqLRnZJt9LDJu7NtkuzN0rnLY
         9Nu6HGWsg0vDY2XFvzv+1HO02z3ByuecR9x37GWa+7JvCef1xvguM9EaF2vnwzhp0dGl
         9B4z7frDT3Nb/nKd9E7OnY+j4nakBvhpd95YSWHrRghjqWtqoFhO3m+J3bj/EvTXH6cG
         W9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784309669; x=1784914469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fU/T4ePwxMvnfrbedCWGcOi9RX0frxKmTN5hi5W5USU=;
        b=nBzCSrgOINbuEDuJkPEHBF6LcpNGbHrlLeADFhRYt//KhnxacSfdMUcLSLy8u/fyPi
         O2VzxrA6agrdrviTynI1hdGQp0RnzYfM6ui/WvmtEsFo7p01Ksrw0cSd+RlmJFPjGmic
         ieA8X7ZBrOhUo1UWeF+BUHmvPHcvDDXrMz2Vd8BCSmUEDiY+IxPO/OaT1cLr/Zaqnnca
         yBNzR7RXarZ6OGABvY7irWWcWruRIQjqZUJJIldsdddMBZa2FlgYrHPdp94AS3e4dXIB
         LP4pxXOAqPq93hlK0haP8W+P2PMtd/wmJh1UKQBO11FEbAtXSbqQVSijNrGoAvRTKzrc
         c/Zw==
X-Forwarded-Encrypted: i=1; AHgh+RpRjrwK0W82c44yXCVkbA3XHuDYZ4xfNavvnFzrhh7uSD9nruKoRH69rG0zsQwrT22fm5LjoUBoYSdJQKeIxSEq@lists.infradead.org
X-Gm-Message-State: AOJu0YxPRi9ymvANssKNITH7l+Wv5FOiRwMCpSUTieDxqqMpxt1/yihC
	0AttbLi2/60vRrFsZ2PWItREQH8M7bxSunXsr1x4hOFb2pyzalAb9PkS
X-Gm-Gg: AfdE7cmB2hCcTrOVS/cnadWUTUWE/PwqAWV185CNEJQUIVRECXmRVtqVIdjCShAzfgb
	wl8bm5kLzKUgp6mdeFhvX8KRTDyjesSkELJx9hRrFWT2pjZd6SPQELdU48L6/la+eWXxDOad85s
	srd3wjbdeePzyKCm0s6+i7cunq4kmdloF9G/sLvuz+xh6RRyWptdP9pKu7mkfedY+ZGTdzjlD+6
	qYFrhm0HQgCG9x0+skpPdpaO5sp4wYAfAWlXTbDj1DzBmnfqBUpw+ByO6IiktTRMYWKgWFfm/zj
	+K3Hj86guE6HxAkmnK92eC8LqTC3zjTm+c660wZvrdW8jzGMbEWnNrMfVTm1+aI6pUcpi/zE1Oc
	lpsq881jwkOjK+WeuQTXboXHZGy1vR57IBrENsXufEIwGi9cP1vgrD783KMPX3c4UmGnAapFV4U
	35X8rxF7Dipl1TOEBYwXlnWySdwtulamxHPtnlBgnMT+MYbvdkKlPHLDNn8kxl3SuJ+LJGb6FyO
	j+B7mjDdTzD/7pXHb1UD7LYLR3l9Bzpgv2CmtfjcTQTShmXI6xBAg==
X-Received: by 2002:a05:6830:4888:b0:7e9:cdf6:230d with SMTP id 46e09a7af769-7eda154706fmr1996146a34.24.1784309669083;
        Fri, 17 Jul 2026 10:34:29 -0700 (PDT)
Received: from [127.0.1.1] (174-29-11-8.hlrn.qwest.net. [174.29.11.8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7edad965130sm1677212a34.11.2026.07.17.10.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 10:34:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 17 Jul 2026 11:33:58 -0600
Subject: [PATCH v2 2/3] mtd: rawnand: sunxi: describe tADL and tWHR delays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-submit-sunxi-nand-h6-h616-timings-v2-2-225515107640@gmail.com>
References: <20260717-submit-sunxi-nand-h6-h616-timings-v2-0-225515107640@gmail.com>
In-Reply-To: <20260717-submit-sunxi-nand-h6-h616-timings-v2-0-225515107640@gmail.com>
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
X-CRM114-CacheID: sfid-20260717_103430_317118_C1353611 
X-CRM114-Status: GOOD (  13.79  )
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

Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index d12cbb3c813c..791f495f6e82 100644
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
+				nfc_timings->tADL[SUNXI_NFC_TIMING_STEPS - 1]);
 
-	if (timings->tWHR_min > (min_clk_period * 32))
-		min_clk_period = DIV_ROUND_UP(timings->tWHR_min, 32);
+	if (timings->tWHR_min >
+	    (min_clk_period * nfc_timings->tWHR[SUNXI_NFC_TIMING_STEPS - 1]))
+		min_clk_period = DIV_ROUND_UP(timings->tWHR_min,
+				nfc_timings->tWHR[SUNXI_NFC_TIMING_STEPS - 1]);
 
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


