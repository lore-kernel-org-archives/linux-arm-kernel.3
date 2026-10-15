Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACA8CC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 01:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hlWVFZs9qMdbAGtAdGz2zNdnsjoirOAt+ztYuqFoEV4=; b=P/iecU8IggF6cFdsSEMSKwtj4u
	I84jHFy0lFZpIxLcDMvhEnGYX43JaYnK5WqTbLuuDumZgeKFGMBaJugo49eoqMdirbZ8yqUmYUKYg
	har+LNizUvgSr7fAa+iyw5Yb4LZERl5pqaswNBR8CMB/ghlZfffmXVg4dCjpdiQOMouu/eoUqf4Mr
	BmrNMK2vZlfeisiK9LgJrHdk0amLhK6rNPI1oW0omJrai47aYGEtPC11tB0x/uG0GUm3kk/1wor38
	y2yT/S5C6mnFPVWErluPAuaTaHRFRsWS3DrAbJA6lHKC8efiRNjYuq4HnvGCj2Mt6xdH9XHAy7Miz
	NXWMY7gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMO-0000000GYAL-2O53;
	Thu, 15 Oct 2026 01:34:20 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMK-0000000GY85-3jju
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 01:34:18 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-4f59e61f295so3422504b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 18:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028056; x=1792632856; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hlWVFZs9qMdbAGtAdGz2zNdnsjoirOAt+ztYuqFoEV4=;
        b=ASRx9S3MfXH6ludb3+FXZr/Lh4lyg0k9CFWng6W6nRHZupTN3OmP5vTTjELW1ksXtL
         JylQP+LmpPrW5bZ6AIcKAJoMvcb6BKbQtmhEeQ5vDey54ZmixHdoM3Mk5qTTTUK5veZf
         uOA8iFaNv1nyfxcRKFgJPmss8PnT5cjUFE0UEuECqttAxzxCY0TC8rVXXt6hzCd+Q4WE
         PlHE3pbUQtfdIgR5lmTcoGbWwr0ZOsp79ZUqN0RtDS6LWtmrISUMCDFci4Cf8eS+UCWU
         Z/R9qiRCtUoQpW18kF41uL+lT1jpM2uoYEoN/QIjAZG/pmFK6yat//WPtgqeyZFQXxEu
         1a6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028056; x=1792632856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hlWVFZs9qMdbAGtAdGz2zNdnsjoirOAt+ztYuqFoEV4=;
        b=ke80GSytzHKv/bTH91Y64kvJPm/j08Dd1QTuh8oEtSOQ44QsfdLoaAOXXUskg7i0Yr
         84cGCDqbeq7sFi2TXeWPRZQBxowxr+fkLUagzyV33x7mwb/JSJVf8ULE70Uydklua1iC
         z+arMzjY35SzL1ZH2CN4Y1wgKdC9SbGNcJLKkpQYYLIAF0teFul+OP+DyTmCWNzmfEEp
         dMV8dUWIsnYKNjx+LP0TNGjcbYVEL252fjQ91fNzhDu2u12Sp1kkzLGURNp3CzaP09lh
         llpJcMnWSsnefSFYdg8xBVSF8wIti5ruL5XgvUFPNDWV8ntKuHCyC6N6qbB0+6mR79WH
         UiFA==
X-Forwarded-Encrypted: i=1; AKwUvBzgsSerdtBU3KQymegIHq8zL+JQg9L/T8lmZEwXSi6ena1m+cYklTws0hqYD6c0LfQQGz0VHf84zqHKAl3YHUHK@lists.infradead.org
X-Gm-Message-State: AFq9FYK2ppmj8mc1d6K1BcZGlA5rL4HvRUH8Ck988e9xO+4ipQjIUtrd
	VP434GrEbveWqeS4K1u925ogqZwod6foLGOd8b+ozPLug00iTxJXeb6b
X-Gm-Gg: AYBFou0CeoyCOQ6PGIwAxeQvC3gHZZxb55rJ2aZgja5+GSUPjmzKGBqzoBvZ3HllKaL
	JdaFv6bjs61cbpsrVfId/nXuRL1w/MnMBHczePQN2bou30+jVsqaWz3Vj2tEFvV99CN3zkcdDFX
	7RBOb0WBuKy5x9z3p9wIPI8LjTpBhc4wA/okVxditAORAb6lXqtbySPx3JrgR6woArXndkyR/XR
	JDuw4nXFNMKVKvGTkBRZqcSEaKEIV4wivTw1DItAnB/VIDA2NSXsqG00K+IkQTBRmu3cOTyRaxa
	e7lJcKz6rUajwPQ+gwlK94hYadzVzMH1//MvzKiK1LJSznDfj1VuN3cUGnErzz6Rl7v+/W5cIQs
	ImPih4YYiar1Uuuxyq9V0v3xPD44+gR+aoeGkr6ywkJkHj+FoEoyTjK5HC7xCypPTEhDP41yOGc
	fFR9u+0RBawN++wr8/qd5/Ug1wIMoPj7wFdooogTt+mjsHPGkbNarBBLO4FT//DllrwDSGZxPSj
	KABO4HijP2mWg/fqI+WRfglKXja6aqwn4ww38x/4zCGuRF4RwDuZgQ4CU32GQYPJ2d6jgMZL+XM
	xUXIDaBqotgovRFW0dW05hTRC9YPUonTCm3RmPZe1wF6zrhQYnV/3tr79/kZynfdFBXe7ovHKey
	x91BGTosbZjuVRO9krBvg
X-Received: by 2002:a05:6808:251a:b0:4cb:818f:d56e with SMTP id 5614622812f47-50c4c7a2fbdmr18782064b6e.22.1792028055832;
        Wed, 14 Oct 2026 18:34:15 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:33:50 -0600
Subject: [PATCH v7 03/16] mtd: rawnand: sunxi: propagate page-setup and
 erased-check errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-3-5d3fc6ad2da1@gmail.com>
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
In-Reply-To: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
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
X-CRM114-CacheID: sfid-20261014_183416_979527_E547525A 
X-CRM114-Status: GOOD (  20.86  )
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

The ECC read callbacks ignore nand_read_page_op() failures. A command or
ready timeout can therefore leave the requested page unselected, yet the
driver continues with data transfers and can report success for stale
data. Return the setup error before starting PIO or DMA.

After an ECC error, the driver rereads the physical data and OOB with
randomization disabled to distinguish an erased chunk from corrupt data.
Those rereads can also fail. Do not pass stale buffers to
nand_check_erased_ecc_chunk() or count a transport failure as an ECC
result: return the reread error instead. Successful erased checks retain
their existing statistics and correction-count behavior.

Route PIO read errors through ECC disable. DMA has already released its
transfer resources before interpreting the results, and its caller
retries a failed read in PIO. Restore the corrected/failed counters from
before that DMA attempt so earlier steps are not counted again by the
retry; leave bad-block counters unchanged.

These unchecked returns were found by inspecting the read callbacks and
their NAND-operation helpers.

Fixes: 97d90da8a886 ("mtd: nand: provide several helpers to do common NAND operations")
Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 56 ++++++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index c2e97b8656f7..6c0d3e2d2be2 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1030,7 +1030,10 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 	}
 }
 
-/* Return whether the chunk is erased, and account for its ECC result. */
+/*
+ * Return 1 for an erased chunk or 0 for an uncorrectable chunk, with ECC
+ * statistics updated in either case. Negative values report transport errors.
+ */
 static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 				       u8 *data, int data_off,
 				       u8 *oob, int oob_off,
@@ -1042,10 +1045,16 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 	int ret;
 
 	/* Check the physical representation for bitflips in erased pages. */
-	if (nand->options & NAND_NEED_SCRAMBLING)
-		nand_change_read_column_op(nand, data_off, data, ecc->size, false);
+	if (nand->options & NAND_NEED_SCRAMBLING) {
+		ret = nand_change_read_column_op(nand, data_off, data,
+						 ecc->size, false);
+		if (ret)
+			return ret;
+	}
 
-	nand_change_read_column_op(nand, oob_off, oob, oob_len, false);
+	ret = nand_change_read_column_op(nand, oob_off, oob, oob_len, false);
+	if (ret)
+		return ret;
 
 	ret = nand_check_erased_ecc_chunk(data, ecc->size, oob, oob_len, NULL, 0,
 					  ecc->strength);
@@ -1308,6 +1317,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct sunxi_nfc_ecc_read read = {
 		.buf = buf,
@@ -1315,6 +1325,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 		.oob_required = oob_required,
 		.dma = true,
 	};
+	unsigned int corrected = mtd->ecc_stats.corrected;
+	unsigned int failed = mtd->ecc_stats.failed;
 	struct scatterlist sg;
 	int ret, i;
 	u32 status, pattern_found, wait;
@@ -1366,9 +1378,19 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 	ret = sunxi_nand->oob_ops->read_batch(nand, &read, status, pattern_found,
 					    0, nchunks);
 	if (ret)
-		return ret;
+		goto err_stats;
+
+	ret = sunxi_nand->oob_ops->finish_read(nand, &read, NULL);
+	if (ret < 0)
+		goto err_stats;
+
+	return ret;
 
-	return sunxi_nand->oob_ops->finish_read(nand, &read, NULL);
+err_stats:
+	/* The caller retries the whole read in PIO mode. */
+	mtd->ecc_stats.corrected = corrected;
+	mtd->ecc_stats.failed = failed;
+	return ret;
 }
 
 static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
@@ -1456,7 +1478,9 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1464,10 +1488,11 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	for (i = 0; i < ecc->steps; i++) {
 		ret = sunxi_nfc_hw_ecc_read_chunk(nand, &read, i, &cur_off);
 		if (ret < 0)
-			return ret;
+			goto out;
 	}
 
 	ret = sunxi_nand->oob_ops->finish_read(nand, &read, &cur_off);
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
 
 	return ret;
@@ -1480,7 +1505,9 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page,
 					       nand->ecc.steps);
@@ -1505,7 +1532,9 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1514,10 +1543,11 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	     i < DIV_ROUND_UP(data_offs + readlen, ecc->size); i++) {
 		ret = sunxi_nfc_hw_ecc_read_chunk(nand, &read, i, &cur_off);
 		if (ret < 0)
-			return ret;
+			goto out;
 	}
 
 	ret = read.max_bitflips;
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
 
 	return ret;
@@ -1532,7 +1562,9 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, nchunks);
 	if (ret >= 0)

-- 
2.53.0


