Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B232C982C3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 21:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eqAKP8KvklWhrAanMl0NJZL0/+j+O7CDNjnmlHeKJxw=; b=cWRlnNiDC3u+Xx1ukduOWsaQ6J
	JauiHXoHe5sutoPzzU3Q9/EFsCBLhkJ1qOCeFx/zDb58+HY7IVAbMqATxJKvK6OdwKMHcnFtYfR6o
	XVUKQlN8ZOsYdD9utHqj/GUDi5+DcZrWTRCVM4aEjm370bSavT4J/k7C/6HCTB5trlYRbSB7OwcBw
	ZAaemn6QXPeDnLOkIT6Pg2Hx8eBUBxfCJEeMyaIRCpbDrHvrDVtZ9fqNNcxxR7mwHmD3d6QDN4KhJ
	A2Wr6eBCa7H+wzSMBpyHIafqi6FnRv5B2D7Zeq0wKCyVNpuUQ8l58zMLrVWcVPeq1SW8OFIs3iGc3
	aah1pbTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dwo-00000004gJR-1lGb;
	Mon, 14 Sep 2026 21:10:42 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DwS-00000004fnn-348p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 21:10:22 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-6b1afdf98dfso2599877eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 14:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420220; x=1790025020; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eqAKP8KvklWhrAanMl0NJZL0/+j+O7CDNjnmlHeKJxw=;
        b=dYSaB0JKd/M3r3RlQHzWLa1Fb0cph2d2JgkoxIcmRMALSXctsaek8/qLgsCr3jdvSe
         ZIuKbs7cQU63OtAgD6ZRG8JNbmSBuE5DzPwu1xwILPm2yI+B+LScxpre8n6G9qo3Nr2Z
         Ydp0o8lKgavK6AOxbCvKBXm0HbcAUX3PpxYs583n7ZnadPdRrr0af8CmAPpjqqz15HjZ
         oKQZKEzzGgjJBotbkV7wGfDXbdeQG4UlVqVQudcS5phY7FL65B3GMupZJiAM8SRoOWJ0
         FXe1GMUiJNBJgd1MJSPssOEQqh/vP0cgGuul+GYy3tZpoDxMASsOAYbJob8NdbI+Dwwa
         R4uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420220; x=1790025020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eqAKP8KvklWhrAanMl0NJZL0/+j+O7CDNjnmlHeKJxw=;
        b=w9vVn1JkcG8vJhFlMSaefM6ixGYfhzWUoIFmDS1w53/ywVrUjkx/qBDDUa8sBunNz8
         AHK/EmRSTlIkV2dHhUnoi1OgKOio+R0jZ0REmqUWxw6ZxoWxUyc6h7mZSRGYeaa9QtcY
         E8tNV3sA+PWvz2o3QtQPjyTj8QompF4dOq6Onl97S5ihLOm9YurZu/nUazus24t5YwKI
         sr1nmoty78136xnDNw7oBLYg5o5AiPo4/cR5Xsu0InSQ5IDl4EsVzuIr1app+A9veZ2V
         pxi8sg71CRR5vTEFCNi2TcQkq/GOzHsynqUFS0aWpgDhEvZq9d87q1OZFHnSaqQtmQOf
         A0fA==
X-Forwarded-Encrypted: i=1; AKwUvByYdG2JGHL7aZ3D9783reOy1toOV/pgQuSvURfNMS3WkAb46WQxEp/qgQ6zwko7iDrNsvVn97FJeJXkk4YynA13@lists.infradead.org
X-Gm-Message-State: AFuF++mJNl58aTnN4VrVsPyROFcRJ72ti1goKlZ/abh6MTDlrGNKTcdS
	D/nUGGD9f6fOdB4XDL1quhSULoZYdIjTmbSUgLaBISF4urAHj903KFT9
X-Gm-Gg: AYBFou3OgViYvnIsQtMwS2Bkm1RB7OKvgHKi6oOWV3oOxKdgEOk7PML2lHlHfCEu5r3
	H+Q50/urQq/oRhDLUUeuRWhb7fSgZNz1saOCHhOoS0BYXK6gE3NtPLk5QXJqR34A8U5jLBrY6tn
	Ot29eYZcFTq6yqP94KpXFM+NH9SPgkXCrn2DyPGJ6x2Fg9hQOK8RR8LZqWfdOLTO/I5wwmrVNHq
	Dh6mEMmnHpoUyO5onN+2+UoRIjID26uHQkMasDSXdd454lI8+maOc1L5no/fzhqreeerPKRPkqj
	NQPXWYt+uadbbCYyN0Z5ZDmfPZ1SiKES0geyeCgbxGHZuhr9SnuSRG0bpHRrsMF/w/XOiu7btE1
	qNvyqjKEgDfi+VKG25aAU/jiXAUNwbhDRmJHRbmMUx/5erHgEgaopmwr5blFX54ZD2dwte1KNPb
	HFgjfXIpbiF/MpzSkbbucqwqqlhsfuMitH7D+3VP7Hk4PgJe+sGeBwDUBo3CdMdaZhCgMbj/2Lc
	OVN8ghptuAJhIb99o5AqDcqU2C8X9O2gViWPlRaajSjcCREMc2Y0aA3V/i0umVOdA1LvK9JPT7D
	fQiOk4aNPLRSYQMtQvczrR7Hd7tjjm/zGMGEu0PgX2tKszL0/VYwye5ImIdkTDNDjjG7e/XeqRL
	don0t7A7uQsNc5Bo/2hHPLw9yvzaA
X-Received: by 2002:a05:6820:1628:b0:6b8:ef7d:e181 with SMTP id 006d021491bc7-6c544daaf8cmr2777294eaf.54.1789420219820;
        Mon, 14 Sep 2026 14:10:19 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:19 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:10:04 -0600
Subject: [PATCH v6 18/18] mtd: rawnand: sunxi: reuse ECC status within each
 DMA read
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-18-2fb084fe0751@gmail.com>
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
X-CRM114-CacheID: sfid-20260914_141020_813633_38D1AD79 
X-CRM114-Status: GOOD (  21.93  )
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

The DMA completion loop reads the pattern ID repeatedly and reads the
same packed error-counter word for each of its four ECC steps.

Snapshot the completed operation status and pattern ID, and retain the
last counter word while visiting consecutive DMA steps. Read counters
only for steps which use them. Reuse the shared status register value on
older controllers which place the pattern flags in its upper half.
Keep the existing error and pattern priority in both the plain-marker
and randomized-format paths.

Start a fresh snapshot after every PIO ECC operation so reuse of hardware
slot zero cannot reuse status from a previous step. The snapshot is local
to one callback and does not survive controller resets or DMA-to-PIO
retries.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 103 +++++++++++++++++++++++++-------------
 1 file changed, 69 insertions(+), 34 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 41d6ef31ea3d..b79bf13f3ff0 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1157,16 +1157,60 @@ struct sunxi_nfc_ecc_status {
 	unsigned int max_bitflips;
 };
 
+struct sunxi_nfc_ecc_snapshot {
+	u32 status;
+	u32 pattern_found;
+	u32 pattern_id;
+	u32 count_reg;
+	u32 count;
+};
+
+static void sunxi_nfc_hw_ecc_read_status(struct nand_chip *nand,
+					 struct sunxi_nfc_ecc_snapshot *snapshot)
+{
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	u32 pattern_found;
+
+	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
+	snapshot->pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	if (nfc->caps->reg_pat_found == NFC_REG_ECC_ST)
+		snapshot->status = pattern_found;
+	else
+		snapshot->status = readl(nfc->regs + NFC_REG_ECC_ST);
+	snapshot->pattern_id = 0;
+	if (snapshot->pattern_found &&
+	    (to_sunxi_nand(nand)->randomized_oob ||
+	     (snapshot->pattern_found & ~snapshot->status)))
+		snapshot->pattern_id = readl(nfc->regs + NFC_REG_PAT_ID(nfc));
+	/* A new operation, including every PIO step, invalidates the count word. */
+	snapshot->count_reg = ~0U;
+}
+
+static unsigned int
+sunxi_nfc_hw_ecc_read_count(struct nand_chip *nand,
+			    struct sunxi_nfc_ecc_snapshot *snapshot, int hw_step)
+{
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	u32 reg = NFC_REG_ECC_ERR_CNT(nfc, hw_step);
+
+	/* Four consecutive DMA steps share one error-counter register. */
+	if (snapshot->count_reg != reg) {
+		snapshot->count = readl(nfc->regs + reg);
+		snapshot->count_reg = reg;
+	}
+
+	return NFC_ECC_ERR_CNT(hw_step, snapshot->count);
+}
+
 static void sunxi_nfc_hw_ecc_record_status(struct nand_chip *nand,
 					   struct sunxi_nfc_ecc_status *result,
-					   int logical_step, int hw_step, u32 status,
-					   u32 pattern_found)
+					   int logical_step, int hw_step,
+					   struct sunxi_nfc_ecc_snapshot *snapshot)
 {
-	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	u32 count;
 
-	if ((pattern_found & BIT(hw_step)) &&
-	    !(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(hw_step)))
+	if ((snapshot->pattern_found & BIT(hw_step)) &&
+	    !(snapshot->pattern_id & BIT(hw_step)))
 		result->zero_steps |= BIT(logical_step);
 
 	/*
@@ -1174,35 +1218,32 @@ static void sunxi_nfc_hw_ecc_record_status(struct nand_chip *nand,
 	 * Classify these steps with the vendor page check too, and do not use
 	 * their correction counters. Keep their decoded data until then.
 	 */
-	if ((status & NFC_ECC_ERR(hw_step)) ||
-	    (pattern_found & BIT(hw_step))) {
+	if ((snapshot->status & NFC_ECC_ERR(hw_step)) ||
+	    (snapshot->pattern_found & BIT(hw_step))) {
 		result->error_steps |= BIT(logical_step);
 		return;
 	}
 
-	count = readl(nfc->regs + NFC_REG_ECC_ERR_CNT(nfc, hw_step));
-	count = NFC_ECC_ERR_CNT(hw_step, count);
+	count = sunxi_nfc_hw_ecc_read_count(nand, snapshot, hw_step);
 	result->corrected += count;
 	result->max_bitflips = max(result->max_bitflips, count);
 }
 
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
-				    int hw_step, u32 status, u32 pattern_found,
+				    int hw_step, struct sunxi_nfc_ecc_snapshot *snapshot,
 				    unsigned int user_data_sz, bool *erased)
 {
-	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	u32 tmp;
 
 	*erased = false;
 
-	if (status & NFC_ECC_ERR(hw_step))
+	if (snapshot->status & NFC_ECC_ERR(hw_step))
 		return -EBADMSG;
 
-	if (pattern_found & BIT(hw_step)) {
+	if (snapshot->pattern_found & BIT(hw_step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(hw_step)))) {
+		if (unlikely(!(snapshot->pattern_id & BIT(hw_step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;
@@ -1218,9 +1259,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 		return 0;
 	}
 
-	tmp = readl(nfc->regs + NFC_REG_ECC_ERR_CNT(nfc, hw_step));
-
-	return NFC_ECC_ERR_CNT(hw_step, tmp);
+	return sunxi_nfc_hw_ecc_read_count(nand, snapshot, hw_step);
 }
 
 static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
@@ -1235,7 +1274,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, logical_step);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	u32 pattern_found;
+	struct sunxi_nfc_ecc_snapshot snapshot;
 	bool bbm = !logical_step;
 	bool erased;
 	int ret, bitflips;
@@ -1275,13 +1314,11 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 
 	*cur_off = oob_off + ecc->bytes + user_data_sz;
 
-	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
-	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	sunxi_nfc_hw_ecc_read_status(nand, &snapshot);
 
 	if (sunxi_nand->randomized_oob) {
 		sunxi_nfc_hw_ecc_record_status(nand, result, logical_step, hw_step,
-					       readl(nfc->regs + NFC_REG_ECC_ST),
-					       pattern_found);
+					       &snapshot);
 		memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
 		sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, hw_step, bbm,
 						    page, user_data_sz);
@@ -1289,8 +1326,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	}
 
 	bitflips = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL,
-					    hw_step, readl(nfc->regs + NFC_REG_ECC_ST),
-					    pattern_found, user_data_sz, &erased);
+					    hw_step, &snapshot, user_data_sz, &erased);
 	if (erased)
 		return 1;
 
@@ -1555,11 +1591,12 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	struct sunxi_nfc_ecc_snapshot snapshot;
 	unsigned int reg_index = 0, user_data_sz;
 	unsigned int max_bitflips = 0;
 	int ret, i;
 	struct scatterlist sg;
-	u32 status, pattern_found, wait;
+	u32 wait;
 
 	if (first_step) {
 		ret = sunxi_nfc_read_column(nand, page, first_step * ecc->size,
@@ -1612,9 +1649,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 	if (ret)
 		return ret;
 
-	status = readl(nfc->regs + NFC_REG_ECC_ST);
-	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
-	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	sunxi_nfc_hw_ecc_read_status(nand, &snapshot);
 
 	for (i = 0; i < nchunks; i++, reg_index += user_data_sz / 4) {
 		int logical_step = first_step + i;
@@ -1628,8 +1663,8 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 		user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, logical_step);
 
 		if (sunxi_nand->randomized_oob) {
-			sunxi_nfc_hw_ecc_record_status(nand, result, logical_step, i, status,
-						       pattern_found);
+			sunxi_nfc_hw_ecc_record_status(nand, result, logical_step, i,
+						       &snapshot);
 			sunxi_nfc_hw_ecc_get_prot_oob_bytes(nand, oob, reg_index, !logical_step,
 							    page, user_data_sz);
 			continue;
@@ -1637,7 +1672,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 
 		bitflips = sunxi_nfc_hw_ecc_correct(nand, randomized ? data : NULL,
 						    oob_required ? oob : NULL,
-						    i, status, pattern_found,
+						    i, &snapshot,
 						    user_data_sz, &erased);
 
 		/* ECC errors are handled in the second loop. */
@@ -1664,7 +1699,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 	if (sunxi_nand->randomized_oob)
 		return 0;
 
-	if (status & NFC_ECC_ERR_MSK(nfc)) {
+	if (snapshot.status & NFC_ECC_ERR_MSK(nfc)) {
 		for (i = 0; i < nchunks; i++) {
 			int logical_step = first_step + i;
 			int data_off = logical_step * ecc->size;
@@ -1672,7 +1707,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 			u8 *data = buf + data_off;
 			u8 *oob = nand->oob_poi + oob_off;
 
-			if (!(status & NFC_ECC_ERR(i)))
+			if (!(snapshot.status & NFC_ECC_ERR(i)))
 				continue;
 
 			user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, logical_step);

-- 
2.53.0


