Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B012CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 19:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4P4PvF1h4nH9aNU08hyrkF4dkUmnUPpBIVg5VJpyCM8=; b=w7AAf1q/IhDExCWOcKu5ZHD85A
	CyFgjBfQzZQMdSSm34RtzHwGXD4aUiB4Zbkq04jYK0xHqoWFe7G7wMSE0I2gTnqjhxdmP2LjCW5Xt
	ay5j4M5jhv5psrQlM4lXcnxrTApu7wIAlZHlUD+B4qcmE/9s89WIHm++s3UjyintJ5PluaSsct07f
	IpcJPnjHYZ7GaBDxJbkCCCk9P4ljQ14i7jR4BEuKB5drcO3jL33ceV6qckwP87GP4o5ZEGgJyy7zz
	iFd4qNGI4SmaHpN76qCwHiUcqrASd6o7Mf40WV3BSccOkR8b0r4lNisc/rqeeqRkjx6zaos/YuTMF
	50HbqdCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIASy-00000005Alz-0YxR;
	Sat, 17 Oct 2026 19:53:16 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIASu-00000005Akq-3q4J
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 19:53:14 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-825b40f8a26so355376a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 12:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266792; x=1792871592; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4P4PvF1h4nH9aNU08hyrkF4dkUmnUPpBIVg5VJpyCM8=;
        b=szB4lA4tXdl/8q84eHXmLafTB78mwW8ItX8jryf7AXDU4sQTZRNNewIDLItaCF7Y9i
         cQrmM4iH1DSWdXkKtFt1gFfudSTnL4D/Y5xeslk14vhzQb1SC2CpfYohY+NZURm5ZorO
         U9YtdCDcHd98N7+I39qGlwFMxH52EuzKe0vtpx2z02XPO5C+kjitNnAEZGIlDR1zgOEs
         ghvdoRQ3BB86QuU3oeofowoJN5EMYPtQc5TdjpD1jyq8mRI6r24W434br1TWrnAjY7C/
         b7lg2UD+23dN87OfxtxPlIXhFNsGUze6Yzp+oYjiLntsCzTuJqCu4+kHup0U2ybxHKXV
         oMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266792; x=1792871592;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4P4PvF1h4nH9aNU08hyrkF4dkUmnUPpBIVg5VJpyCM8=;
        b=BwAXoX0ikAPhGz4A25UBD8HDB0h+efNU7DFWqBKqfeKZHhS57IwfK4aBWvq8nYxcri
         ZbB1AzVNQmCdVcpPT+CCDx2iF9ppRhbVKdbU7DNbzKNZKaFgM9GT0GMeTZkdgvt47IDo
         O0P/JDM2zUUTJPre5P9ljamsTmIbKr89+y2MTka56H5Tw5oXIEoCcmPr0vxMiCPIQ6fJ
         ufe1TbJH7L1oW5f5y36OIriTZe219hcKoKq9+1cSKvq8PRJFl04S/y/CkmnTB3GOHUcH
         ZkZxfqn6KDOnYpKPOPTFIRvnNupiQQeR7o1QPbagv+Ph3agdTKnQVfFHZCTqXw8ElEOI
         2Ttw==
X-Forwarded-Encrypted: i=1; AKwUvBzg7SGPGh30UXzty9bqyJ3QdmLrZ9fDEyY8HGRwzfhM1Ysx/4hMcycBE4aFMMH550ONujQ0u99LO+j5GctBayVI@lists.infradead.org
X-Gm-Message-State: AFq9FYLLW/z2EAPFvTaUPFx5llTcfhOBDnACSh1wRHHqoj942FJ6FdLV
	f880ZkwSzex++P2NXDzrUQorBOZzoY50iy+lsnjJf+e/yOzMuqhKReye
X-Gm-Gg: AYBFou2zHvv+qO8LJu3B8coTsWZTCM2egKloUU5bOOPb4dJ2Pr4n8fuMr4iUbQIKOMw
	YSoEYjID6ci8AtnGlfoZdROfdUb4Q70OKmH3cE5RjUquygmZlILSjp8H3NmOntVvSSxy5YLFJtj
	O+e3lE42NEFOL6zf1q0htjjHB7nMXf3w7z1X2oHYsPP+W/8HFTORzL3zgVmf7zOJ06GK0nW8JuA
	FdkwJkMvZi3qOxteQ7gRc9p6aPc9wiiUp0oJERJrpCLkEtNgGbPTRHyLQv4FOK5jauTKNSReDek
	do/+GlADV4bL/MJW+nkRYKaALqai6FZqg7V6p9kFS4/LN4uSCVf/vUU+ubtdNC76KV6dGdZBuHP
	CD92eVBnD5r+iWm9M5pitLKUFhII+ePW7MdsQ+weTuWVPsh6F9NgdG1HKB645o1v3KXPfLLyiwR
	FuYwpdeHh9lvG8iHCiNdVchqWE8Kke/JMer1gZDOOM+G1/8mZJ6OY5+dePxjgmiN4mO5XEEYlXq
	bnPMZLbbgNnUlT93BJjx8puhnMur9tSUiIWOQHGEf7j1jodu8VRd7JxwB+gk4hNqtIdlFSfNG3v
	aAnab9HzH9vTjHeD9qVqR1QRXc/dLkI9dT4iM+69EhKYItTcQQpzjoXB7E69zWssyMfVybUxpMF
	uwyRMmIABt08lGfltKwqFkXadjNOUYwckGlxUfGAs+56s
X-Received: by 2002:a05:6830:83b4:b0:7fa:5c68:d050 with SMTP id 46e09a7af769-845009804d7mr3324399a34.26.1792266791655;
        Sat, 17 Oct 2026 12:53:11 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a6e12dfasm4829795a34.24.2026.10.17.12.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:53:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	devicetree@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v9 12/18] mtd: rawnand: sunxi: bound DMA batches by the user-data register bank
Date: Sat, 17 Oct 2026 13:53:01 -0600
Message-ID: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-12-5af9a1be16ef@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15.2
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_125312_985272_922E2F57 
X-CRM114-Status: GOOD (  24.09  )
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

H6/H616 store ECC-protected OOB metadata, called user data, in 32
four-byte registers. The fields for successive ECC steps are
concatenated in that 128-byte bank. However, the existing allocator
fills the OOB space left after parity, allowing up to 32 user-data bytes
per step without limiting the page total. A whole-page DMA transfer can
exceed the bank. For example, 16 KiB main data plus 1280 OOB bytes with
BCH40/1024 leaves 160 user-data bytes; with 1664 OOB bytes it allocates
512. Register accesses then extend beyond the user-data bank.

PIO can handle these layouts because it reuses register zero for each
step. Capping the page's allocation would instead move parity offsets on
flash and break compatibility with pages written through PIO. Split DMA
transfers without changing that allocation or the logical main-data and
OOB offsets.

Fill the first batch up to the 128-byte limit. Transfer each remaining
step in a separate batch, using hardware slot and user-data register
zero after explicitly selecting its main column and spare-area base.
PAGE_OP generates later main-data columns from hardware slot numbers,
not relative to the selected initial column. A multi-slot batch starting
partway through a page would therefore revisit an earlier column.
Single-slot later batches avoid those generated column changes. Pages
that already fit keep one DMA batch.

Program length fields from the batch's logical starting step, and
consume its protected OOB and ECC status before reusing the registers.
Keep erased state, correction counts and trailing OOB handling
page-wide. On a failed DMA read, discard all partial statistics before
the existing PIO retry.

Use one page-read setup or program-begin for the whole page, and send
program-end only after every batch and any trailing OOB succeed. A write
may fall back to PIO only if DMA preparation fails before its first
batch; never retry a write after part of the page has been transferred.
Raw access and the OOB layout reported to MTD remain unchanged.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260909085138.9A98A1F00A3D@smtp.kernel.org
Closes: https://lore.kernel.org/r/20260914031929.2E7091F000FF@smtp.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 202 ++++++++++++++++++++++++++------------
 1 file changed, 139 insertions(+), 63 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index ab9ff470062a..69e92fe21040 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -54,6 +54,7 @@
 #define NFC_REG_H6_RDATA_1	0x004C
 #define NFC_REG_A10_USER_DATA	0x0050
 #define NFC_REG_H6_USER_DATA	0x0080
+#define NFC_H6_USER_DATA_REGS	32
 #define NFC_REG_USER_DATA(nfc, x)	(nfc->caps->reg_user_data + ((x) * 4))
 #define NFC_REG_H6_USER_DATA_LEN 0x0070
 /* A USER_DATA_LEN register can hold the length of 8 USER_DATA registers */
@@ -969,7 +970,36 @@ static u8 sunxi_nfc_user_data_sz(struct sunxi_nand_chip *sunxi_nand, int step)
 	return sunxi_nand->user_data_bytes[step];
 }
 
-/* PIO uses register zero; DMA concatenates user data within each transfer. */
+/* Keep the on-flash layout, but fit each DMA batch in the user-data bank. */
+static int sunxi_nfc_dma_batch_steps(struct nand_chip *nand,
+				     int first_step, int end_step)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	unsigned int user_data_sz = 0;
+	int i;
+
+	if (!nfc->caps->reg_user_data_len)
+		return end_step - first_step;
+
+	/*
+	 * PAGE_OP generates main-data columns from hardware slot zero, not
+	 * from the initial column. Use only slot zero after the first batch,
+	 * so the explicit column change selects each remaining logical step.
+	 */
+	if (first_step)
+		return 1;
+
+	for (i = first_step; i < end_step; i++) {
+		user_data_sz += sunxi_nfc_user_data_sz(sunxi_nand, i);
+		if (user_data_sz > NFC_H6_USER_DATA_REGS * sizeof(u32))
+			break;
+	}
+
+	return i - first_step;
+}
+
+/* PIO uses register zero; DMA concatenates user data within each batch. */
 static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
 						unsigned int reg_index, bool bbm, int page,
 						unsigned int user_data_sz)
@@ -1394,30 +1424,32 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 					     pattern_found, step, 1);
 }
 
-static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
-					    int oob_required, int page, int nchunks)
+static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand,
+					   struct sunxi_nfc_ecc_read *read,
+					   int first_step, int nchunks)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	struct sunxi_nfc_ecc_read read = {
-		.buf = buf,
-		.page = page,
-		.oob_required = oob_required,
-		.dma = true,
-	};
-	unsigned int corrected = mtd->ecc_stats.corrected;
-	unsigned int failed = mtd->ecc_stats.failed;
 	struct scatterlist sg;
+	int page = read->page;
 	int ret, i;
 	u32 status, pattern_found, wait;
 
+	if (first_step) {
+		ret = sunxi_nfc_read_column(nand, page, first_step * ecc->size,
+					    NULL, 0);
+		if (ret)
+			return ret;
+	}
+
 	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 	if (ret)
 		return ret;
 
-	ret = sunxi_nfc_dma_op_prepare(nfc, buf, ecc->size, nchunks,
+	ret = sunxi_nfc_dma_op_prepare(nfc, read->buf + first_step * ecc->size,
+				       ecc->size, nchunks,
 				       DMA_FROM_DEVICE, &sg);
 	if (ret)
 		return ret;
@@ -1425,7 +1457,12 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 	sunxi_nfc_hw_ecc_enable(nand);
 	sunxi_nfc_reset_user_data_len(nfc);
 	for (i = 0; i < nchunks; i++)
-		sunxi_nfc_set_user_data_len(nfc, sunxi_nfc_user_data_sz(sunxi_nand, i), i);
+		sunxi_nfc_set_user_data_len(nfc,
+					    sunxi_nfc_user_data_sz(sunxi_nand, first_step + i), i);
+	/* exec_op() restores the page's spare base during column changes. */
+	if (first_step)
+		writel(mtd->writesize + sunxi_get_oob_offset(sunxi_nand, ecc, first_step),
+		       nfc->regs + NFC_REG_SPARE_AREA(nfc));
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 
@@ -1457,10 +1494,32 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 	status = readl(nfc->regs + NFC_REG_ECC_ST);
 	pattern_found = readl(nfc->regs + nfc->caps->reg_pat_found);
 	pattern_found = field_get(NFC_ECC_PAT_FOUND_MSK(nfc), pattern_found);
-	ret = sunxi_nand->oob_ops->read_batch(nand, &read, status, pattern_found,
-					    0, nchunks);
-	if (ret)
-		goto err_stats;
+
+	return sunxi_nand->oob_ops->read_batch(nand, read, status, pattern_found,
+					     first_step, nchunks);
+}
+
+static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
+					    int oob_required, int page, int nchunks)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct mtd_info *mtd = nand_to_mtd(nand);
+	struct sunxi_nfc_ecc_read read = {
+		.buf = buf,
+		.page = page,
+		.oob_required = oob_required,
+		.dma = true,
+	};
+	unsigned int corrected = mtd->ecc_stats.corrected;
+	unsigned int failed = mtd->ecc_stats.failed;
+	int first_step, batch_steps, ret;
+
+	for (first_step = 0; first_step < nchunks; first_step += batch_steps) {
+		batch_steps = sunxi_nfc_dma_batch_steps(nand, first_step, nchunks);
+		ret = sunxi_nfc_hw_ecc_read_batch_dma(nand, &read, first_step, batch_steps);
+		if (ret)
+			goto err_stats;
+	}
 
 	ret = sunxi_nand->oob_ops->finish_read(nand, &read, NULL);
 	if (ret < 0)
@@ -1766,71 +1825,88 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct scatterlist sg;
-	unsigned int reg_index = 0;
 	u32 wait;
-	int ret, i;
+	int first_step, batch_steps, ret, i;
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
-	if (ret)
-		return ret;
+	for (first_step = 0; first_step < ecc->steps; first_step += batch_steps) {
+		unsigned int reg_index = 0;
 
-	ret = sunxi_nfc_dma_op_prepare(nfc, buf, ecc->size, ecc->steps,
-				       DMA_TO_DEVICE, &sg);
-	if (ret)
-		goto pio_fallback;
+		batch_steps = sunxi_nfc_dma_batch_steps(nand, first_step, ecc->steps);
+		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
+		if (ret)
+			return ret;
 
-	sunxi_nfc_reset_user_data_len(nfc);
-	for (i = 0; i < ecc->steps; i++) {
-		unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
-		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
-		const u8 *oob = nand->oob_poi + oob_off;
+		ret = sunxi_nfc_dma_op_prepare(nfc, buf + first_step * ecc->size,
+					       ecc->size, batch_steps, DMA_TO_DEVICE, &sg);
+		if (ret) {
+			/* Only retry before any part of the page has been transferred. */
+			if (first_step)
+				return ret;
+			goto pio_fallback;
+		}
 
-		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, reg_index, !i, page,
-						    user_data_sz);
-		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
-		reg_index += user_data_sz / 4;
-	}
+		sunxi_nfc_reset_user_data_len(nfc);
+		for (i = first_step; i < first_step + batch_steps; i++) {
+			unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
+			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
+			const u8 *oob = nand->oob_poi + oob_off;
 
-	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
-	if (ret) {
-		sunxi_nfc_dma_op_abort(nfc);
-		sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
-		return ret;
-	}
+			sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, reg_index, !i,
+							    page, user_data_sz);
+			sunxi_nfc_set_user_data_len(nfc, user_data_sz, i - first_step);
+			reg_index += user_data_sz / 4;
+		}
 
-	sunxi_nfc_hw_ecc_enable(nand);
-	sunxi_nfc_randomizer_config(nand, page, false);
-	sunxi_nfc_randomizer_enable(nand);
+		if (first_step)
+			ret = nand_change_write_column_op(nand, first_step * ecc->size,
+							  NULL, 0, false);
+		else
+			ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);
+		if (ret) {
+			sunxi_nfc_dma_op_abort(nfc);
+			sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
+			return ret;
+		}
 
-	writel((NAND_CMD_RNDIN << 8) | NAND_CMD_PAGEPROG,
-	       nfc->regs + NFC_REG_WCMD_SET);
+		/* exec_op() restores the page's spare base during column changes. */
+		if (first_step)
+			writel(mtd->writesize + sunxi_get_oob_offset(sunxi_nand, ecc, first_step),
+			       nfc->regs + NFC_REG_SPARE_AREA(nfc));
+		sunxi_nfc_hw_ecc_enable(nand);
+		sunxi_nfc_randomizer_config(nand, page, false);
+		sunxi_nfc_randomizer_enable(nand);
 
-	wait = NFC_CMD_INT_FLAG;
+		writel((NAND_CMD_RNDIN << 8) | NAND_CMD_PAGEPROG,
+		       nfc->regs + NFC_REG_WCMD_SET);
 
-	if (nfc->use_mdma)
-		wait |= NFC_DMA_INT_FLAG;
-	else
-		dma_async_issue_pending(nfc->dmac);
+		wait = NFC_CMD_INT_FLAG;
 
-	writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD |
-	       NFC_DATA_TRANS | NFC_ACCESS_DIR,
-	       nfc->regs + NFC_REG_CMD);
+		if (nfc->use_mdma)
+			wait |= NFC_DMA_INT_FLAG;
+		else
+			dma_async_issue_pending(nfc->dmac);
 
-	ret = sunxi_nfc_wait_events(nfc, wait, false, 0);
-	if (ret)
-		sunxi_nfc_dma_op_abort(nfc);
+		writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD |
+		       NFC_DATA_TRANS | NFC_ACCESS_DIR,
+		       nfc->regs + NFC_REG_CMD);
 
-	sunxi_nfc_randomizer_disable(nand);
-	sunxi_nfc_hw_ecc_disable(nand);
+		ret = sunxi_nfc_wait_events(nfc, wait, false, 0);
+		if (ret)
+			sunxi_nfc_dma_op_abort(nfc);
 
-	sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
+		sunxi_nfc_randomizer_disable(nand);
+		sunxi_nfc_hw_ecc_disable(nand);
 
-	if (ret)
-		return ret;
+		sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
+
+		if (ret)
+			return ret;
+	}
 
 	if (oob_required || (nand->options & NAND_NEED_SCRAMBLING)) {
 		/* TODO: use DMA to transfer extra OOB bytes ? */

-- 
2.53.0


