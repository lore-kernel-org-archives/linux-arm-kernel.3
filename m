Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8389ACCF2D1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 19:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AcVwsAGitc/8mDgkiqGJIxKdaOI/OCkQfgdeA86v4XE=; b=uS0BKipdo3jFVaw4dV1d+kO9h1
	aYYiAiuVUmXUM1hSDgVWb1sHWIbisWGQBUCA2DLp2xr+Fy7btj/3VHKyqM/I038Qx1z5V2DleGdUx
	eSLoeibikArH5itGEnS2UBBThAG+2riln6nDRBoRCKpsuD5gBMQ5RQ2oKTqkxJkrcqZV3Mxdoo4ix
	FbUaG78gD+ospCzUPLVQZthMeBtJrgtfyBTXRufDdIznPdY19cWhnU+nvyOtITJz51T8hgySnFeCF
	lWuLRUkziT9q0eVylIVb+26//43ioI4thQUJAm2uygra7QRpp3fhqbcNltVo3Hrn4aSERZ+xBgxII
	B66Ugeqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAMS-0000000595v-1jJt;
	Sat, 17 Oct 2026 19:46:32 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAME-000000058rZ-3h0N
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 19:46:21 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-4f59ea27bd0so336588b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 12:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266378; x=1792871178; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AcVwsAGitc/8mDgkiqGJIxKdaOI/OCkQfgdeA86v4XE=;
        b=O+0LZOyntZUTrkH3q+AOAiDaQIqTKT5+fAmoQ2r43LlIQg66BevaQ8EtLllJJJ2bXv
         S0RcL2FwGyzPpZSzzU+UIM0dLw1mEJjLfrA7R+UYUn8+jURKJYH7VnGBNDQlbaaz0ppp
         rNx38c2eua2BYKNz4Fe9rKvyxd0vmcokBFgESMe3phVvEVYlOMovNAgD4B1E1vWw8lWA
         WPmrbWZsVTgt0AnoLLYh/PpBYEIieq7HKi/ouI+RY3uPZQ8AxWUfaXxdPRmiUGcKBhay
         TSVfQrozlw1kE8wHtHTbAoOUQg8vfhMg7QtjgKh5DhOR3kD/AAaTzjL5LXcpfhohfSLU
         nv8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266378; x=1792871178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AcVwsAGitc/8mDgkiqGJIxKdaOI/OCkQfgdeA86v4XE=;
        b=XBTUsaec2JIdTZjRG86TcC8VNmMKBQItxdPoiQ0xuRlfDouonS8KfD45DmuDiWvYYi
         lAUu0rwsgVAODTLKj2CQfM7who7QIeLw9cysYhqdgJhEJZMSThc1GeRetnbwTa7NvWKp
         q1V4hGrT4H653WNm988Xz4KLJdQy3Z1GwonivhY0iLsjG1UJ2dWqaVmZxf0Ysbop9JK3
         a57P9FHPSMUGjDjeEys+zuH0M+wBvZL2IS6kHMGD3Uh62lE+OnQO60ymYXINJ2Yfw9L5
         WTf2nnYrsAe9HNcl1mZqVPeOPhM8kCjCANNn75wNhhiLRbT+SBrO0v7o8CSdW6VkWf5W
         8Itw==
X-Forwarded-Encrypted: i=1; AKwUvBztl5MLyIgtzct4W3Jpb/TooFvOOjWTGI1vlbXzL2EjZxlBP4/vfPffSIk3xxveo+lG2v8uPa06CuF+lf4xGs9p@lists.infradead.org
X-Gm-Message-State: AFq9FYLTF3pjkGAni+WHrEo5CPEj8NBYZZ8B6JgFTwdoc2KIafZp6t1g
	AKEl+yUSBDY+7l3lU8ndPOM/d8vOxZAQmG8QQxKclIIXuKbPv99GqVoj
X-Gm-Gg: AYBFou074OuVaYQuFFEjg1dsNLxKLw2wn1KCBZxArxawdXU/bh8XWCCoL7dqsqewVRf
	nEP9TwUYHppCQMaVRvSlQlbv055XZNdv6dFlIz1+Ws4QggZA003yhRbF45qPyqGgrwt8a0SBWT2
	WaurJ+WWU1nJfwM1pNAxLeJT1jutxSl0pod2mTFliBFZlWQ0ibC4RkwinKN57sjjfqTEPXO65Jy
	KSJ54AdVEJAMHJZip11kGbOFPrbjqQfL1wj3kmd6cIyW08eOmpBUp4u20Qz5gunUS5l5Bzr8qQV
	im/16j6r3m25eCliSbpi6Vg2UUh6OuXB+wE1k9sAfkHa9toy0GY4zq4DzRwBeCdHSJrDKUi+cCl
	WmSNw92tNHB/qO2czCWWrlRDr5vVLLfjW1Vnknd3G0tCRbv/TY9ijwI6LcsBY1LfoUMC7MI8reJ
	aA+Fdihs6iccIcUfhudUL7wEvLcAvV9KY8sd4HPK4j4CQ0IshljAOVfa6oGdtqRJfhWYPOgqzQu
	9CPSaqR39NYCJ9p+ocbSnUTN4szEXsTIwCd1hgE4W6xyju7HyZRMhmbB45rT4e+l+C+nQBtPW14
	0do04ysAf8DxnME89hcx8upcqSlkZOXMf87jxQ2nrU3aYA46zqGgsQNi1cpGGn6RIjhY4hFnQNW
	ukGyokrJen2F+qWLcQKTV
X-Received: by 2002:a05:6808:4fca:b0:4fc:248a:de3b with SMTP id 5614622812f47-53ccaf2998dmr3273386b6e.23.1792266378042;
        Sat, 17 Oct 2026 12:46:18 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:45:59 -0600
Subject: [PATCH v9 04/18] mtd: rawnand: sunxi: propagate page-setup and
 erased-check errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-4-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
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
X-CRM114-CacheID: sfid-20261017_124619_022076_DCE875D9 
X-CRM114-Status: GOOD (  20.07  )
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
index 4ff19da8b98d..29715d179d22 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1038,7 +1038,10 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
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
@@ -1050,10 +1053,16 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
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
@@ -1317,6 +1326,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct sunxi_nfc_ecc_read read = {
 		.buf = buf,
@@ -1324,6 +1334,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 		.oob_required = oob_required,
 		.dma = true,
 	};
+	unsigned int corrected = mtd->ecc_stats.corrected;
+	unsigned int failed = mtd->ecc_stats.failed;
 	struct scatterlist sg;
 	int ret, i;
 	u32 status, pattern_found, wait;
@@ -1375,9 +1387,19 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
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
@@ -1465,7 +1487,9 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1473,10 +1497,11 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
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
@@ -1489,7 +1514,9 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page,
 					       nand->ecc.steps);
@@ -1514,7 +1541,9 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1523,10 +1552,11 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
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
@@ -1541,7 +1571,9 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, nchunks);
 	if (ret >= 0)

-- 
2.53.0


