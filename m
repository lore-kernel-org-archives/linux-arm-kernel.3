Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364A5C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 04:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mVFhsZOFWXOaaokEcxhZoL5Z9W04LeNellBPPg9dCY4=; b=y+O+6xYc5088WbuyFNXeHbE9KK
	2Dbq2MymVkwAamcesYGJYycophhTnBuM1XbOPcnMZXUBq3gODuMpj7K4LFm6xUMEnAAwFzsqgcng+
	iCMx9lfWFecyxUXkj2zElCXUVItjTT4+qaaVvNtH/cbYK093BWnJVOYVbG5fYq7/CD0vXGe2+Z9pB
	/eCwLoonkMC6Rl8w4Vb3rnnXjUxBmP0zWy83amIwRZQCfmNsxK0FZTxw+g1Mte0Zf+l4JZai/R7WB
	J6isKNf4lBjDkDLZ4q7Oof3ujYi3hGLrAa3RlZAcv0FtJmJheLxdnROaTe+gzYHdGugD+u6dV7JeK
	0qodmtNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bTU-00000001N4Q-0han;
	Sun, 13 Sep 2026 04:05:52 +0000
Received: from mail-oi2-x10.google.com ([2607:f8b0:4864:32::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bSz-00000001MLs-3eh8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 04:05:24 +0000
Received: by mail-oi2-x10.google.com with SMTP id 5614622812f47-4b37a29bf27so211562b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 21:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272321; x=1789877121; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mVFhsZOFWXOaaokEcxhZoL5Z9W04LeNellBPPg9dCY4=;
        b=BOtDF5jWTpnotaSgq00uXZP9nzTYqX4X6eHT+2FM257Qg/QB06ty6BdFnBhhprSzhU
         itdgFDe5r+wr20w4nVv0RkI5e9oFcF49uSWCy1+MHRukj3fuIe/uhDhrtOZA0dBGWjL5
         I/k1YHq5wQw1xpKXg2FTn9sBgmn4ht3XcORdW9tc6n8GAfQTEk8HwCNHnb1On1TwGIdH
         ARzxuupJxcGVbVSabDEFKNqFXXqBQls/tmMIiTCtzGtecPCL0wgKjOJiCplDg4dRf3sk
         o8W4XMJj+uJSFYGucLi1Ul6K07AD4ARSY3PtHyTAAHHRJKoIB3B8d/i30cUp5WtbTk2x
         51qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272321; x=1789877121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mVFhsZOFWXOaaokEcxhZoL5Z9W04LeNellBPPg9dCY4=;
        b=mEioxPJj5oKNrYFdHaI6jPIz5enh1auiaIvICc8plEDrHn4SlKSwjIB+hw3g2ASrsZ
         ITSWFmY4kGcxmb9zohpcH13B+iQAAOY6SZJ7C3av4Zr3Ge9T1eYqj5kDlWKoq8OTZm92
         IjW6F8m9jAhb7IqrQrBc4yRYMqJAFj2yrGFsILu/9J63Mm/FQia1yfwopIuusOokqHFl
         v4ua4xur24cZtjDp9azo7h+KNb+tzpCAXmSm9H7gxM7WNNJiC6RE00rH+U7SXnMJBvIp
         LcC2NdU9YV66Y9zwU6F4buLA6RXHplAqvUzfW3XPbNfXBkJWUT3LH3ivoy7oMlb1Lecf
         HE8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzJda2dlr8HUD5wMO87CtdrIHYNN2hTb+KMnuCSaOz/BeIf8DdxSC7WLpxfh7MCUrPLjS7CEGRZLWdddoFg4HZn@lists.infradead.org
X-Gm-Message-State: AFuF++nocbAd074X6RJrjgXCnI+L+wFaRibueoTGC5msVzeUASP/scAu
	Vxs7qhEy4DDadqywPJvCyfjcnmvBzNWmM6ozrporoSscduQ+7zdID8Ic7W4klQ==
X-Gm-Gg: AYBFou1IWqipUSLCCk4X5dhUT9x/JLiqPm3+9Q+ONbeGdE/32daaFrVKaQnZhGEjCbU
	2SzJt717wttG81RTvdLeDgvkOZ8hhQN1XPVPDNhUEveaRB1VVhXURpM4cRqZ97YBTjCzvJdniAR
	E/JrNYlJ+ChcBrNeiLAaxFLaNldchrFkPPsXlcjiaM+ZZ0rjztCNPUSQpfqDp9OGcVA3A1TKItq
	4dvyVFNIWT6ZnxgbtHNzjBYgaku3ntGBBnPv5PSyQegajSUVz0VxTE8EhYawApT67WuoeFKHwbI
	QsfRJ4er+YwMnz6pw2kq+QiHmOZrJU7VapwAjv0xpP5kIempR2FRHWQYI8RQKXdVqCaBv2dkylf
	PN0v24RFH9QgpcgSyYq88XkQjW54viuo/oZnNScRUTeYeUk/f7WPPvQl4Yyw6bGg8mdbN3V0XM7
	r2riOMUOWpcqIK/a8Q7KGJxh7iiCUrEHbgYnFeBeeSvsUxR8ATqMW0teymX3CbMjwHPjRqlEjrp
	e9smsxXAd9WhCuE5jYsnlt3SQkBOGQ4/kzbh2lqLG1ipUxixC2hQPj0oNVWUlfSOs256b8KuOMq
	PP8pb04vkBtHr4gM9Kcc1tpG/ovqpOkGT5yIk/HK7ML31q8T5MkBZH5GxlGJvV7/bsUl/tpBLn1
	oKQQjpS/ZlAGaGWe8hrhGu+H0UCiOqQ==
X-Received: by 2002:a05:6808:1385:b0:4b9:a88b:8892 with SMTP id 5614622812f47-4c4aa8e6f34mr3706612b6e.40.1789272320822;
        Sat, 12 Sep 2026 21:05:20 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:05:00 -0600
Subject: [PATCH v4 09/17] mtd: rawnand: sunxi: clarify OOB register and
 step handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-9-4a64bed94229@gmail.com>
References: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
In-Reply-To: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
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
X-CRM114-CacheID: sfid-20260912_210522_075340_F1B3AC65 
X-CRM114-Status: GOOD (  25.81  )
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
helpers so their different roles are visible at each call site.

Share the variable-length user-data register-index calculation between
the protected-OOB read and write helpers, keeping the separate MMIO loops
and existing fixed-length register accesses. Clarify why the plain-marker
format compensates the bad-block marker around hardware randomization.

Rename raw_mode to erased_chunk_found in the page readers, using a
boolean in both paths. The flag suppresses randomization of the trailing
OOB after an erased chunk; it does not select MTD_OPS_RAW. No on-flash
format, register-access sequence or ECC accounting changes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 143 ++++++++++++++++++--------------------
 1 file changed, 67 insertions(+), 76 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 13dc0af56eb3..40746686142b 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -924,16 +924,33 @@ static inline u32 sunxi_nfc_buf_to_user_data(const u8 *buf)
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
+}
+
+/*
+ * Variable-length user data is concatenated in four-byte registers.
+ * PIO uses hardware step zero; DMA slots follow the logical page steps.
+ */
+static unsigned int
+sunxi_nfc_user_data_reg_index(struct sunxi_nand_chip *sunxi_nand, int hw_step)
+{
+	unsigned int byte_offset = 0;
+	int i;
+
+	for (i = 0; i < hw_step; i++)
+		byte_offset += sunxi_nfc_user_data_sz(sunxi_nand, i);
+
+	return byte_offset / 4;
 }
 
 static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
-						int step, bool bbm, int page,
+						int hw_step, bool bbm, int page,
 						unsigned int user_data_sz)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
@@ -941,35 +958,22 @@ static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
 	u32 user_data;
 
 	if (!nfc->caps->reg_user_data_len) {
-		/*
-		 * For A10, the user data for step n is in the nth
-		 * REG_USER_DATA
-		 */
-		user_data = readl(nfc->regs + NFC_REG_USER_DATA(nfc, step));
+		user_data = readl(nfc->regs + NFC_REG_USER_DATA(nfc, hw_step));
 		sunxi_nfc_user_data_to_buf(user_data, oob);
 	} else {
-		/*
-		 * For H6 NAND controller, the user data for all steps is
-		 * contained in 32 user data registers, but not at a specific
-		 * offset for each step, they are just concatenated.
-		 */
-		unsigned int user_data_off = 0;
+		unsigned int reg_index = sunxi_nfc_user_data_reg_index(sunxi_nand, hw_step);
 		unsigned int reg_off;
 		u8 *ptr = oob;
 		unsigned int i;
 
-		for (i = 0; i < step; i++)
-			user_data_off += sunxi_nfc_user_data_sz(sunxi_nand, i);
-
-		user_data_off /= 4;
 		for (i = 0; i < user_data_sz / 4; i++, ptr += 4) {
-			reg_off = NFC_REG_USER_DATA(nfc, user_data_off + i);
+			reg_off = NFC_REG_USER_DATA(nfc, reg_index + i);
 			user_data = readl(nfc->regs + reg_off);
 			sunxi_nfc_user_data_to_buf(user_data, ptr);
 		}
 	}
 
-	/* De-randomize the Bad Block Marker. */
+	/* Undo hardware de-randomization for a plain on-flash BBM. */
 	if (bbm && (nand->options & NAND_NEED_SCRAMBLING))
 		sunxi_nfc_randomize_bbm(nand, page, oob);
 }
@@ -991,7 +995,7 @@ static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
 }
 
 static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
-					int len, int step)
+					int len, int hw_step)
 {
 	bool found = false;
 	u32 val;
@@ -1014,15 +1018,15 @@ static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
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
-						const u8 *oob, int step,
+						const u8 *oob, int hw_step,
 						bool bbm, int page,
 						unsigned int user_data_sz)
 {
@@ -1030,7 +1034,7 @@ static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
 
-	/* Randomize the Bad Block Marker. */
+	/* Pre-randomize the BBM so the hardware writes it plain on flash. */
 	if (bbm && (nand->options & NAND_NEED_SCRAMBLING)) {
 		memcpy(user_data, oob, user_data_sz);
 		sunxi_nfc_randomize_bbm(nand, page, user_data);
@@ -1038,32 +1042,18 @@ static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 	}
 
 	if (!nfc->caps->reg_user_data_len) {
-		/*
-		 * For A10, the user data for step n is in the nth
-		 * REG_USER_DATA
-		 */
 		writel(sunxi_nfc_buf_to_user_data(oob),
-		       nfc->regs + NFC_REG_USER_DATA(nfc, step));
+		       nfc->regs + NFC_REG_USER_DATA(nfc, hw_step));
 	} else {
-		/*
-		 * For H6 NAND controller, the user data for all steps is
-		 * contained in 32 user data registers, but not at a specific
-		 * offset for each step, they are just concatenated.
-		 */
-		unsigned int user_data_off = 0;
+		unsigned int reg_index = sunxi_nfc_user_data_reg_index(sunxi_nand, hw_step);
 		const u8 *ptr = oob;
 		unsigned int i;
 
-		for (i = 0; i < step; i++)
-			user_data_off += sunxi_nfc_user_data_sz(sunxi_nand, i);
-
-		user_data_off /= 4;
 		for (i = 0; i < user_data_sz / 4; i++, ptr += 4) {
 			writel(sunxi_nfc_buf_to_user_data(ptr),
-			       nfc->regs + NFC_REG_USER_DATA(nfc, user_data_off + i));
+			       nfc->regs + NFC_REG_USER_DATA(nfc, reg_index + i));
 		}
 	}
-
 }
 
 static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
@@ -1114,7 +1104,7 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 }
 
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
-				    int step, u32 status, u32 pattern_found,
+				    int hw_step, u32 status, u32 pattern_found,
 				    unsigned int user_data_sz, bool *erased)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
@@ -1123,13 +1113,13 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 
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
@@ -1145,9 +1135,9 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 		return 0;
 	}
 
-	tmp = readl(nfc->regs + NFC_REG_ECC_ERR_CNT(nfc, step));
+	tmp = readl(nfc->regs + NFC_REG_ECC_ERR_CNT(nfc, hw_step));
 
-	return NFC_ECC_ERR_CNT(step, tmp);
+	return NFC_ECC_ERR_CNT(hw_step, tmp);
 }
 
 static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
@@ -1155,18 +1145,18 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
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
 		ret = nand_change_read_column_op(nand, data_off, NULL, 0, false);
@@ -1188,7 +1178,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
+	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -1205,7 +1195,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
 
 	bitflips = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL,
-					    nfc_step, readl(nfc->regs + NFC_REG_ECC_ST),
+					    hw_step, readl(nfc->regs + NFC_REG_ECC_ST),
 					    pattern_found, user_data_sz, &erased);
 	if (erased)
 		return 1;
@@ -1232,7 +1222,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 			if (ret)
 				return ret;
 
-			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, nfc_step,
+			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, hw_step,
 							    bbm, page, user_data_sz);
 		}
 	}
@@ -1247,12 +1237,12 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
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
@@ -1264,10 +1254,10 @@ static int sunxi_get_oob_offset(struct sunxi_nand_chip *sunxi_nand,
  * but it skips the next user data.
  */
 static int sunxi_get_ecc_offset(struct sunxi_nand_chip *sunxi_nand,
-				struct nand_ecc_ctrl *ecc, int step)
+				struct nand_ecc_ctrl *ecc, int logical_step)
 {
-	return sunxi_get_oob_offset(sunxi_nand, ecc, step) +
-		sunxi_nfc_user_data_sz(sunxi_nand, step);
+	return sunxi_get_oob_offset(sunxi_nand, ecc, logical_step) +
+		sunxi_nfc_user_data_sz(sunxi_nand, logical_step);
 }
 
 static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
@@ -1317,7 +1307,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 	unsigned int corrected = mtd->ecc_stats.corrected;
 	unsigned int failed = mtd->ecc_stats.failed;
 	unsigned int max_bitflips = 0;
-	int ret, i, raw_mode = 0;
+	bool erased_chunk_found = false;
+	int ret, i;
 	struct scatterlist sg;
 	u32 status, pattern_found, wait;
 
@@ -1397,7 +1388,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		}
 
 		if (erased)
-			raw_mode = 1;
+			erased_chunk_found = true;
 
 		sunxi_nfc_hw_ecc_update_stats(nand, &max_bitflips, bitflips);
 	}
@@ -1420,13 +1411,13 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 			if (ret < 0)
 				goto err_stats;
 			if (ret)
-				raw_mode = 1;
+				erased_chunk_found = true;
 		}
 	}
 
 	if (oob_required) {
 		ret = sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi,
-						      NULL, !raw_mode, page);
+						      NULL, !erased_chunk_found, page);
 		if (ret)
 			goto err_stats;
 	}
@@ -1443,17 +1434,17 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
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
@@ -1477,8 +1468,8 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
-	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
+	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, hw_step, bbm, page,
 					    user_data_sz);
 
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD |
@@ -1535,7 +1526,7 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	unsigned int max_bitflips = 0;
 	int ret, i, cur_off = 0;
-	bool raw_mode = false;
+	bool erased_chunk_found = false;
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
@@ -1559,12 +1550,12 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
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


