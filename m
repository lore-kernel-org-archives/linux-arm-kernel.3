Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A97CC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 04:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djZlVdSi/YIckqFS7pyWE2GArCm4EkKkgRfSQpPp8jg=; b=iQEUOSV+6EBY6wA7in4IxfbtAR
	DTJendjN5zqcDwb5p2rdw/tvbp1SD/rNMqftW7Gd8h5Q59hKqQDBDtNGNwJPpBRF1ZUM/YOQUOECK
	g41Iqa43wAAyqPCDT5iBVkRItpoHdkSqfDGhzCrzpvBlUqyI1Aoueijps/efjWbSJmiEfhsjbR5cS
	kG8zcf165bb7PO6ZcldSQk9S3yVf3pUztJFTkqv5w7eJOYiAfJ4OtmRLgRzYXR5KaoHxSRAKzP3E+
	DmADaEZKoXwAlnpqOK2ABQT0AomB/J2ts6/lbyyEH39WTFZJBTx6oPPVq8AuD83TE4BVhnE83M8TO
	PbXFLGRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYtQ-00000001t11-3zZv;
	Fri, 16 Oct 2026 03:46:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYtF-00000001sdj-34pj
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 03:45:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=djZlVdSi/YIckqFS7pyWE2GArCm4EkKkgRfSQpPp8jg=; b=hNgkKbbC1MKX/Bg1rLgNsD70Ea
	Z8/usHSGVR7XwbRBmubQyqLls0HPz2KI4pCPJKtU8bj+FayDkL2HeB8NbxqacObfATPJzLHSxBjFx
	5mbzSeVElObGIiO5eEVScbAWcqBYJgNTqrXV7wg9brbSPIHp+HA9lpDtT0ESMGXz40CBv53UHF2t+
	4SUV1dC3XbfNEIW3CXM3WdzJ0vDF3q+8HxWIymvGE4/uoV+fnKjSnF+niKq0WRx1lRVVcoP2aWNzB
	DH45iKa++LnVyIrIlJFQdi2kjDowfTGMtTQlZ4/KIlKuP8sTPMRyI5x7iZ6oIFgGZ+3N0NUaORAHT
	xysA2Pww==;
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHYtC-0000000147p-0TOM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 03:45:52 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-8249c775215so2994643a34.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 20:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122348; x=1792727148; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=djZlVdSi/YIckqFS7pyWE2GArCm4EkKkgRfSQpPp8jg=;
        b=Wk5npkNVhZSAy4skcm9TJDcgpD7B/rXeJFeGBUozQIGVqNvoSNpuKHYQvWkkKgoV12
         jB59rIWy9QI/eBHK9lt771r2kthTcl/M3NymCRFhBWetoSHCb/GfSl2PIIZxoFOBAAzs
         p44AQH7HBRjxNqs+/DdAnfA4UpA1fwS5YzuF0sf90fNA8NbmkM+ktIaaCg4hb5GkT55+
         2NGoBTz9X+oc86qcaGkUtoQKrR1rN9wEtMk1Nr/fvvX0ZhkyAc0CuJovmgNYyhSU4A67
         mC7eOTu0RfxbbQaxzKz5RNQN9vx3n7XUOuyW950cAU8gvAFKOwM10+zmSovaFUWfnkdV
         /buQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122348; x=1792727148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=djZlVdSi/YIckqFS7pyWE2GArCm4EkKkgRfSQpPp8jg=;
        b=z8/+pmcsQECSIdsm6XscQpX4ug97URa03NC9nVvgIpRKqgvsUKxXtf5Qa/6qLiPfLA
         sLHu+xRaCndUGdqyQ9cTFkiAvStI1q2rkcbIVF8cenBNQmHt7XOKOubT6xko5An4fIBq
         rPt6hnitYJ6tBrPP6TZzTGKCfxV+w1xgcY6inewHbNBymE03Ci2FLrv3Q2w3ZJYA4WiC
         M0syTPJae6f1mvERLeh+TGr+Iq3Uk6Cx4aF19EYz6c+xhHa+0CTiLjASgw4YymMAolms
         i/DvpRLY+du7LUQ+Nxguuq4tkedMuHwspjHjVb9HKnbxUZUmGe3u+oEai8Uee8pcTuco
         3M5w==
X-Forwarded-Encrypted: i=1; AKwUvByKTfEvgFg7LsTux9hthmRjauly7EARHPGFwpt62TK5DsBwjm2t3+cCBD8IyUKkYVRVfrlIIDo4r52lvQpKH1xR@lists.infradead.org
X-Gm-Message-State: AFq9FYIqHlFujrmljHub4vMjl1rwfMFHungQS9Qn54qk174q+rEohT8X
	D2JRzVbRVuDEytfKn3gjQzOO0VTJxQmnT1EHusAxRHNgnmfoy72ARnH4
X-Gm-Gg: AYBFou3rf30X1cZGahAI++Nin0EuhrWQbjiCyOZmjoaGRr89dNVdVPxzP/dRxojZrOK
	kvcPDaHDnGX6Q7ho9vqVzxyCOHoXSZ6FcteV7znkuiOvot6v+IJqSz0MN4wX8m/5OpIM5VNjaxS
	1T0fRLVgjphCthp1yBva+iWRTh5Wbs2DVI3Lj5bjIw9WhuYQt6ctezNJ9CcXKPmps4TN/wkWokM
	QNYUaajwZQUl7iibL9wfhfMNd0+rFyz8sbADiG6vtPIYcKfqXQIBOZYewlPkTZ0MbmnpwlzlAUU
	b3/SfwWqlRps3Cn5zVQfABv1+vllbeJtf2RtnvF8Tq8qaQdDYykdbjOX0hPni/TPdhIufOuC5DB
	FWyjT7V0r3uZIkgrRAzWYY9mvxIjsM/S2EW/Rq6DeOCHQ/S3M/QqZ5yED7fHVHquVJtaNloNeCf
	wZtIDTUuIWDfl9DVyFW9Cse6opTO5j7XEnl81dyHDhV+rwccngeZ6a1Q9KRfzEYkFky61oFguOb
	4NyVmEqAFxzreWnW6kjx1wVoUnk3ytAfrnSXnol+vj7ouIjmCsl8x9IBS9qAI8j59Qoepogp+hl
	R3U7nsfi3L11z/dfrBeh9NLAS6ooF5zsL4db+edsNxPBUOoKaoN3GWU/LiJ9WqsoTNYypSZI/GN
	D6lDXU1d6bPmY+fVxSTLxbw==
X-Received: by 2002:a05:6830:2693:b0:7fa:5c68:d053 with SMTP id 46e09a7af769-830993e87a2mr22826285a34.29.1792122348371;
        Thu, 15 Oct 2026 20:45:48 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:27 -0600
Subject: [PATCH v8 12/17] mtd: rawnand: sunxi: reuse ECC status within each
 transfer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-12-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_044551_064253_EC506E01 
X-CRM114-Status: GOOD (  22.03  )
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

A completed DMA batch leaves one ECC status bitmap and one pattern
bitmap for all its steps. Four consecutive steps also share a packed
correction-counter register. Reading the pattern ID for every matching
step and the counter word for every corrected step repeats MMIO accesses
to the same completed result.

Snapshot status and pattern information once per completed transfer.
Reuse the status read when the controller places pattern-found bits in
the same register, and read the pattern ID only when a non-error step
needs it. Cache each packed counter word while consuming its steps.

Keep the snapshot local to a single transfer and invalidate the cached
counter before processing it. Each PIO step gets a fresh snapshot, as
does each DMA batch. The ECC decisions and returned correction counts
are unchanged, as is the page layout; only redundant register reads are
removed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 90 +++++++++++++++++++++++++++------------
 1 file changed, 62 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 8d523dc43093..105374e93b37 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -258,6 +258,7 @@ struct sunxi_nfc_timings {
 };
 
 struct sunxi_nfc_ecc_read;
+struct sunxi_nfc_ecc_snapshot;
 
 /* OOB interpretation is independent of PIO/DMA command sequencing. */
 struct sunxi_nfc_oob_ops {
@@ -268,7 +269,7 @@ struct sunxi_nfc_oob_ops {
 	void (*transform_bbm)(struct nand_chip *nand, int page, u8 *bbm);
 	/* Consume one PIO step or a DMA batch; negative values are I/O errors. */
 	int (*read_batch)(struct nand_chip *nand, struct sunxi_nfc_ecc_read *read,
-			  u32 status, u32 pattern_found, int first_step, int nsteps);
+			  struct sunxi_nfc_ecc_snapshot *snapshot, int first_step, int nsteps);
 	/* Read any remaining OOB and return the maximum correction count. */
 	int (*finish_read)(struct nand_chip *nand, struct sunxi_nfc_ecc_read *read,
 			   int *cur_off);
@@ -1143,23 +1144,64 @@ struct sunxi_nfc_ecc_read {
 	bool has_erased_chunk;
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
+	if (snapshot->pattern_found & ~snapshot->status)
+		snapshot->pattern_id = readl(nfc->regs + NFC_REG_PAT_ID(nfc));
+	/* A new operation, including every PIO step, invalidates the count word. */
+	snapshot->count_reg = ~0U;
+}
+
+static unsigned int
+sunxi_nfc_hw_ecc_read_count(struct nand_chip *nand,
+			    struct sunxi_nfc_ecc_snapshot *snapshot, int step)
+{
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	u32 reg = NFC_REG_ECC_ERR_CNT(nfc, step);
+
+	/* Four consecutive DMA steps share one error-counter register. */
+	if (snapshot->count_reg != reg) {
+		snapshot->count = readl(nfc->regs + reg);
+		snapshot->count_reg = reg;
+	}
+
+	return NFC_ECC_ERR_CNT(step, snapshot->count);
+}
+
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
-				    int step, u32 status, u32 pattern_found,
+				    int step, struct sunxi_nfc_ecc_snapshot *snapshot,
 				    unsigned int user_data_sz, bool *erased)
 {
-	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	u32 tmp;
 
 	*erased = false;
 
-	if (status & NFC_ECC_ERR(step))
+	if (snapshot->status & NFC_ECC_ERR(step))
 		return -EBADMSG;
 
-	if (pattern_found & BIT(step)) {
+	if (snapshot->pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
+		if (unlikely(!(snapshot->pattern_id & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;
@@ -1175,9 +1217,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 		return 0;
 	}
 
-	tmp = readl(nfc->regs + NFC_REG_ECC_ERR_CNT(nfc, step));
-
-	return NFC_ECC_ERR_CNT(step, tmp);
+	return sunxi_nfc_hw_ecc_read_count(nand, snapshot, step);
 }
 
 /*
@@ -1246,7 +1286,7 @@ static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 /* Interpret one PIO step or a completed DMA batch before reusing its status. */
 static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 				    struct sunxi_nfc_ecc_read *read,
-				    u32 status, u32 pattern_found,
+				    struct sunxi_nfc_ecc_snapshot *snapshot,
 				    int first_step, int nsteps)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
@@ -1269,8 +1309,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		bitflips = sunxi_nfc_hw_ecc_correct(nand,
 						    !read->dma || randomized ? data : NULL,
 						    read->oob_required ? oob : NULL,
-						    i, status, pattern_found,
-						    user_data_sz, &erased);
+						    i, snapshot, user_data_sz, &erased);
 		if (bitflips < 0) {
 			/* Preserve PIO data before the raw erased-page check. */
 			if (!read->dma && !randomized)
@@ -1279,7 +1318,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		}
 
 		/* Both patterns are already filled; only all-ones is erased. */
-		if (pattern_found & BIT(i)) {
+		if (snapshot->pattern_found & BIT(i)) {
 			read->has_erased_chunk |= erased;
 			continue;
 		}
@@ -1310,7 +1349,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		sunxi_nfc_hw_ecc_update_stats(nand, &read->max_bitflips, bitflips);
 	}
 
-	if (!(status & NFC_ECC_ERR_MSK(nfc)))
+	if (!(snapshot->status & NFC_ECC_ERR_MSK(nfc)))
 		return 0;
 
 	/* Finish consuming the batch's corrected OOB before raw error rereads. */
@@ -1318,7 +1357,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		int step = first_step + i;
 		int data_off, oob_off;
 
-		if (!(status & NFC_ECC_ERR(i)))
+		if (!(snapshot->status & NFC_ECC_ERR(i)))
 			continue;
 
 		data_off = step * ecc->size;
@@ -1360,10 +1399,10 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	struct sunxi_nfc_ecc_snapshot snapshot;
 	int data_off = step * ecc->size;
 	int oob_off = nand_to_mtd(nand)->writesize + sunxi_get_oob_offset(sunxi_nand, ecc, step);
 	int page = read->page;
-	u32 pattern_found;
 	int ret;
 
 	if (*cur_off != data_off) {
@@ -1399,12 +1438,9 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 
 	*cur_off = oob_off + ecc->bytes + user_data_sz;
 
-	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
-	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	sunxi_nfc_hw_ecc_read_status(nand, &snapshot);
 
-	return sunxi_nand->oob_ops->read_batch(nand, read,
-					     readl(nfc->regs + NFC_REG_ECC_ST),
-					     pattern_found, step, 1);
+	return sunxi_nand->oob_ops->read_batch(nand, read, &snapshot, step, 1);
 }
 
 static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
@@ -1415,10 +1451,11 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	struct sunxi_nfc_ecc_snapshot snapshot;
 	struct scatterlist sg;
 	int page = read->page;
 	int ret, i;
-	u32 status, pattern_found, wait;
+	u32 wait;
 
 	if (first_step) {
 		ret = sunxi_nfc_read_column(nand, page, first_step * ecc->size,
@@ -1474,12 +1511,9 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	status = readl(nfc->regs + NFC_REG_ECC_ST);
-	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
-	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
+	sunxi_nfc_hw_ecc_read_status(nand, &snapshot);
 
-	return sunxi_nand->oob_ops->read_batch(nand, read, status, pattern_found,
-					     first_step, nchunks);
+	return sunxi_nand->oob_ops->read_batch(nand, read, &snapshot, first_step, nchunks);
 }
 
 static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,

-- 
2.53.0


