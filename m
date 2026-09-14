Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60546C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 21:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Euqh3OGD+8WNOg3rzaOTiHhaf1O3ybQtEVQQVF9+898=; b=Q1F5i/ric1TDYz1KDKSJyjvpf3
	uhbwJARJWWdKPJjUH2jKHqALW0veGcOJu2Sez0r0otQTQ6KWJHC5y1PKUs8TAOPbafQsoIeFZvWKi
	Rn9tmekc/I1yEcacnWgVj0ohEPhYACAb5Raq6EPXNgjKay+3/1XZCAkrATfeJiZUo7AaHpUI9TCwh
	FnT+yc5g5jmU9ePLQagRgE2CGOYD9wCXRsvt2iIuA1hifYL+jMo5YD+cohxxPuIFhiy9dySwcZgQM
	kLg9KHlRO7F5QXD3BSdU6wRSBHgyVZ49kZjaN8D9gLftuocb2VZnxxcE3FGTnYYR2Bs0+/wfW2E4W
	XcDeejWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dwd-00000004g31-3mGj;
	Mon, 14 Sep 2026 21:10:31 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DwJ-00000004fdu-37AQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 21:10:16 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-6c1983dfaffso3072223eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 14:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420211; x=1790025011; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Euqh3OGD+8WNOg3rzaOTiHhaf1O3ybQtEVQQVF9+898=;
        b=QRcDUR0UXsn80oNjtFlk6JNDQ/AcHEVydQ1su3QabP+tdmwqzGdiOQkNGxH/aRbNDf
         MDLmmVFg0FqSDUTVsEgGyHP26y7qcHz3mlFRqqn1TO20g5sLjJTm2R3yeK12gw8ZhkdI
         TIAfj3QjTAirPiHZPlelRLLNOMkqqN9vYQyTs88SowNOH0zokO0SJB+OfWXi+JsoWcuu
         Sr1a2y3amWP+Zssazydcgwy4nfH4hlsusAwvIUHtN75dCJ9zpWtRoCs9YjrP1e3yJl4c
         HiIfpnUs2PmZE4XcCME5Bwu668s7zVNUq/bfiKJMk6wmkX8hqZQGLFzdEQLSFIT//Duc
         CSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420211; x=1790025011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Euqh3OGD+8WNOg3rzaOTiHhaf1O3ybQtEVQQVF9+898=;
        b=xcDsa38u/jJ6+DsPVd/eVO427YHDxdiQXWzxOM5DAFkcsQFpYygp368VHZONxaYBph
         QUBd3zCcBQEigQGJZhM/deu0pg2MXwlJ4zy0ZMq7Mf+aF6VTGSQ2dqEhHucqlHr5UFVy
         q9YWQ1B62c+f0BCHDkSumHCCRKgHjNeQjHTppKfBQ71eyOOTTjBijELpRU6c0c0Uk/P8
         MezDR4R/mK2Xp5xs3/1y5aqyigaF4K4mkxEp8dThw4yNJFjW33f2xVEbRH79AkjnWHdQ
         DCQ+Xq6R2Y8q+E1SS81QNhRAAo7ySiHfuACTfM/L3VRn3ZXcvylD6euLIF6e3fg+kN/6
         KAzA==
X-Forwarded-Encrypted: i=1; AKwUvBy2UYOed1VXsve1XzoRywNEAtD6m5FCkD2149fekUlc+rYLtOHWGWJX8IAUDXFj+s0jBP8mNZfoRCqqI4mVs7e5@lists.infradead.org
X-Gm-Message-State: AFuF++kw+gHxJkvn+szLo5TlSPBjB1z9mTJdDwZrcxmA7Ne3VgXXPFRh
	AYPa0lulkbley0qO3hQj5aRvkRGQOe7O5yIX9i+7j6GzjorvlEe50823
X-Gm-Gg: AYBFou0PIrWJffXYEI4s1t51vsdcLlkr2eBZq/Amw3jF/ywFKmRIp6y0Xjbg1uxjGSH
	DSyOqcYFagxfgAJyimxQDT/XWCsX4V3+r9CQ0miLbPvWSkuI24eyClpV6Mo9gWyAQdY7N0NB1Zv
	I43ayC687pcXqXKAd6q382f90OB7GA2SS2fOQVdc8Ocd92TkH+iQvuTUl3xqrCj07xoPs0gyhlE
	xAb3RdFNzSvRkeZ/Ne6a3rSm4AUmqzuiXdITlxgn91qGgHKtyDfq8orWtWD499C9UWHZE5DC6MI
	JD1qx6Njx0m7klnHZg/sTgM6QPW9Q3MhvC7FV5T5TC8rPNgMCKsOWQ/cqwoiscfopB1rx/L2nfl
	iTZdFIe/nOKz6dLVl/AbcAU6NRvj/5Dqj771Aoa+aOj+A1YkeIRg5SmaJZg3XJCeK5CQqHuwIwG
	0NRszlx0Q0rhAsBup9oWblICdZTvI3SzAAjQeLT+ldQugzCApOdw3SW5TIO3oygxpGH4NH6EDzC
	S94/bPGOiJ8pUW4LHDKgosds6YQlfOzQy/+91Mai3ja3WdT8qP+ZgnaEkhP/uvySGDUkXEBmOs5
	8gd2g4fALZeIGBPAXjTm+DRxDdmQ4bQHhJDVtZH71RjrkM1cB9cslOK3MbtrMZeJFiRv9JJk7Fr
	pzClZzCPPxTcSnH0wWVx9802tkE4Y9gaGL/aNfCY=
X-Received: by 2002:a05:6820:180b:b0:6b7:8415:d78b with SMTP id 006d021491bc7-6c542734c78mr2067060eaf.54.1789420210653;
        Mon, 14 Sep 2026 14:10:10 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:57 -0600
Subject: [PATCH v6 11/18] mtd: rawnand: sunxi: clarify OOB register and
 step handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-11-2fb084fe0751@gmail.com>
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_141011_832953_B86F1ADC 
X-CRM114-Status: GOOD (  24.04  )
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

PIO reuses hardware slot zero while the user-data length and OOB offset
belong to the logical page step. Name the two indices explicitly in the
helpers so their different roles are visible at each call site. The
protected-OOB helpers already take a batch-local register index separately.

Clarify why the plain-marker format compensates the bad-block marker
around hardware randomization.

Rename raw_mode to erased_chunk_found in the page readers and DMA batch
helper, using a boolean in both paths. The flag suppresses randomization
of the trailing OOB after an erased chunk; it does not select MTD_OPS_RAW.
No on-flash format, register-access sequence or ECC accounting changes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 87 ++++++++++++++++++++-------------------
 1 file changed, 44 insertions(+), 43 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 18a4d1cc4246..c55537bc71e1 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -925,12 +925,13 @@ static inline u32 sunxi_nfc_buf_to_user_data(const u8 *buf)
 	return buf[0] | (buf[1] << 8) | (buf[2] << 16) | (buf[3] << 24);
 }
 
-static u8 sunxi_nfc_user_data_sz(struct sunxi_nand_chip *sunxi_nand, int step)
+static u8 sunxi_nfc_user_data_sz(struct sunxi_nand_chip *sunxi_nand,
+				 int logical_step)
 {
 	if (!sunxi_nand->user_data_bytes)
 		return USER_DATA_SZ;
 
-	return sunxi_nand->user_data_bytes[step];
+	return sunxi_nand->user_data_bytes[logical_step];
 }
 
 /* Keep the on-flash layout, but fit each DMA batch in the user-data bank. */
@@ -976,7 +977,7 @@ static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
 		sunxi_nfc_user_data_to_buf(user_data, oob + i * 4);
 	}
 
-	/* De-randomize the Bad Block Marker. */
+	/* Undo hardware de-randomization for a plain on-flash BBM. */
 	if (bbm && (nand->options & NAND_NEED_SCRAMBLING))
 		sunxi_nfc_randomize_bbm(nand, page, oob);
 }
@@ -998,7 +999,7 @@ static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
 }
 
 static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
-					int len, int step)
+					int len, int hw_step)
 {
 	bool found = false;
 	u32 val;
@@ -1021,11 +1022,11 @@ static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
 		return;
 	}
 
-	val = readl(nfc->regs + NFC_REG_USER_DATA_LEN(nfc, step));
+	val = readl(nfc->regs + NFC_REG_USER_DATA_LEN(nfc, hw_step));
 
-	val &= ~NFC_USER_DATA_LEN_MSK(step);
-	val |= field_prep(NFC_USER_DATA_LEN_MSK(step), i);
-	writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, step));
+	val &= ~NFC_USER_DATA_LEN_MSK(hw_step);
+	val |= field_prep(NFC_USER_DATA_LEN_MSK(hw_step), i);
+	writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, hw_step));
 }
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
@@ -1037,7 +1038,7 @@ static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
 	unsigned int i;
 
-	/* Randomize the Bad Block Marker. */
+	/* Pre-randomize the BBM so the hardware writes it plain on flash. */
 	if (bbm && (nand->options & NAND_NEED_SCRAMBLING)) {
 		memcpy(user_data, oob, user_data_sz);
 		sunxi_nfc_randomize_bbm(nand, page, user_data);
@@ -1107,7 +1108,7 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 }
 
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
-				    int step, u32 status, u32 pattern_found,
+				    int hw_step, u32 status, u32 pattern_found,
 				    unsigned int user_data_sz, bool *erased)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
@@ -1116,13 +1117,13 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 
 	*erased = false;
 
-	if (status & NFC_ECC_ERR(step))
+	if (status & NFC_ECC_ERR(hw_step))
 		return -EBADMSG;
 
-	if (pattern_found & BIT(step)) {
+	if (pattern_found & BIT(hw_step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(hw_step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;
@@ -1138,9 +1139,9 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 		return 0;
 	}
 
-	tmp = readl(nfc->regs + NFC_REG_ECC_ERR_CNT(nfc, step));
+	tmp = readl(nfc->regs + NFC_REG_ECC_ERR_CNT(nfc, hw_step));
 
-	return NFC_ECC_ERR_CNT(step, tmp);
+	return NFC_ECC_ERR_CNT(hw_step, tmp);
 }
 
 static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
@@ -1148,18 +1149,18 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 				       u8 *oob, int oob_off,
 				       int *cur_off,
 				       unsigned int *max_bitflips,
-				       int step, bool oob_required, int page)
+				       int logical_step, bool oob_required, int page)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
+	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, logical_step);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	u32 pattern_found;
-	bool bbm = !step;
+	bool bbm = !logical_step;
 	bool erased;
 	int ret, bitflips;
 	/* From the controller point of view, we are at step 0 */
-	const int nfc_step = 0;
+	const int hw_step = 0;
 
 	if (*cur_off != data_off) {
 		ret = sunxi_nfc_read_column(nand, page, data_off, NULL, 0);
@@ -1181,7 +1182,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
+	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -1198,7 +1199,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
 
 	bitflips = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL,
-					    nfc_step, readl(nfc->regs + NFC_REG_ECC_ST),
+					    hw_step, readl(nfc->regs + NFC_REG_ECC_ST),
 					    pattern_found, user_data_sz, &erased);
 	if (erased)
 		return 1;
@@ -1224,7 +1225,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 			if (ret)
 				return ret;
 
-			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, nfc_step,
+			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, hw_step,
 							    bbm, page, user_data_sz);
 		}
 	}
@@ -1239,12 +1240,12 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
  * (it includes the user data before the ECC data.)
  */
 static int sunxi_get_oob_offset(struct sunxi_nand_chip *sunxi_nand,
-				struct nand_ecc_ctrl *ecc, int step)
+				struct nand_ecc_ctrl *ecc, int logical_step)
 {
-	int ecc_off = step * ecc->bytes;
+	int ecc_off = logical_step * ecc->bytes;
 	int i;
 
-	for (i = 0; i < step; i++)
+	for (i = 0; i < logical_step; i++)
 		ecc_off += sunxi_nfc_user_data_sz(sunxi_nand, i);
 
 	return ecc_off;
@@ -1256,10 +1257,10 @@ static int sunxi_get_oob_offset(struct sunxi_nand_chip *sunxi_nand,
  * but it skips the next user data.
  */
 static int sunxi_get_ecc_offset(struct sunxi_nand_chip *sunxi_nand,
-				struct nand_ecc_ctrl *ecc, int step)
+				struct nand_ecc_ctrl *ecc, int logical_step)
 {
-	return sunxi_get_oob_offset(sunxi_nand, ecc, step) +
-		sunxi_nfc_user_data_sz(sunxi_nand, step);
+	return sunxi_get_oob_offset(sunxi_nand, ecc, logical_step) +
+		 sunxi_nfc_user_data_sz(sunxi_nand, logical_step);
 }
 
 static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
@@ -1300,7 +1301,7 @@ static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 					   int oob_required, int page,
 					   int first_step, int nchunks,
-					   int *raw_mode)
+					   bool *erased_chunk_found)
 {
 	bool randomized = nand->options & NAND_NEED_SCRAMBLING;
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
@@ -1403,7 +1404,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 		}
 
 		if (erased)
-			*raw_mode = 1;
+			*erased_chunk_found = true;
 
 		sunxi_nfc_hw_ecc_update_stats(nand, &max_bitflips, bitflips);
 	}
@@ -1427,7 +1428,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 			if (ret < 0)
 				return ret;
 			if (ret)
-				*raw_mode = 1;
+				*erased_chunk_found = true;
 		}
 	}
 
@@ -1441,14 +1442,14 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 	unsigned int corrected = mtd->ecc_stats.corrected;
 	unsigned int failed = mtd->ecc_stats.failed;
 	unsigned int max_bitflips = 0;
-	int raw_mode = 0;
+	bool erased_chunk_found = false;
 	int first_step, batch_steps, ret;
 
 	for (first_step = 0; first_step < nchunks; first_step += batch_steps) {
 		batch_steps = sunxi_nfc_dma_batch_steps(nand, first_step, nchunks);
 		ret = sunxi_nfc_hw_ecc_read_batch_dma(nand, buf, oob_required, page,
 						      first_step, batch_steps,
-						      &raw_mode);
+						      &erased_chunk_found);
 		if (ret < 0)
 			goto err_stats;
 		max_bitflips = max_t(unsigned int, max_bitflips, ret);
@@ -1456,7 +1457,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 
 	if (oob_required) {
 		ret = sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi,
-						      NULL, !raw_mode, page);
+						      NULL, !erased_chunk_found, page);
 		if (ret)
 			goto err_stats;
 	}
@@ -1473,17 +1474,17 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 					const u8 *data, int data_off,
 					const u8 *oob, int oob_off,
-					int *cur_off, int step,
+					int *cur_off, int logical_step,
 					int page)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
+	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, logical_step);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	bool bbm = !step;
+	bool bbm = !logical_step;
 	int ret;
 	/* From the controller point of view, we are at step 0 */
-	const int nfc_step = 0;
+	const int hw_step = 0;
 
 	if (data_off != *cur_off) {
 		ret = nand_change_write_column_op(nand, data_off, NULL, 0, false);
@@ -1507,8 +1508,8 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
-	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
+	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, hw_step, bbm, page,
 					    user_data_sz);
 
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD |
@@ -1565,7 +1566,7 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	unsigned int max_bitflips = 0;
 	int ret, i, cur_off = 0;
-	bool raw_mode = false;
+	bool erased_chunk_found = false;
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
@@ -1589,12 +1590,12 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 		if (ret < 0)
 			goto out;
 		else if (ret)
-			raw_mode = true;
+			erased_chunk_found = true;
 	}
 
 	if (oob_required) {
 		ret = sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi, &cur_off,
-						      !raw_mode, page);
+						      !erased_chunk_found, page);
 		if (ret)
 			goto out;
 	}

-- 
2.53.0


