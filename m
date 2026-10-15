Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960AACC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 01:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V8zDMiUEBwO1gulkBzoLNFoNTmgcXEIIu2kuyTI/+xI=; b=0Vrs7tBtsPsiGHB228GUdZlXoo
	5ES7H6Mlz8LFzDWETOYksyFNXQe8FIo1mkk4kKMfQbRfG7TIOJ8aTJoweWxcPpqURharzBODuuB6q
	clQMT/UkcPLP+1BOxsJ25g4hISmGlaHOyvrvgXqPbqhPVJsmh1nDb3ssh6akmGeuWPdnh8A6hl+p2
	0mXGHq68I+fQ/P7LNSUdSTkOQUWBCfCKZqsOhfO9yTrcwGGw87D9Q5ewN7OwuD640IVmbFmyMZsf+
	WtjGYsExUNy/EdOqYOLH7PQTOhVGH9UkVYMq4PM4tefxydrArsoVHoRRvNImgUl4dv0j6FQXJpVfR
	L33dlYaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMi-0000000GYb0-3io8;
	Thu, 15 Oct 2026 01:34:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMb-0000000GYOb-1E7o
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 01:34:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=V8zDMiUEBwO1gulkBzoLNFoNTmgcXEIIu2kuyTI/+xI=; b=AGL8kpmlco613rPv45PS/SsJ5o
	rfXY6sm6SKQqPt2rxOpyZx3crJ5CyTtk7BN3Z1xibQlK1azJcGLyRhOJ121Hndp1zyDuVO62xgoA3
	X2FGwVZmqlcHMykI/bm7PIFwaiZuwIk7S9FSytJakznApgUIjb+fz9fUnukLkbJP4Jkplus2/Pbgj
	jma2LaRYQV8YphTSESoXMII+dMXHYjPn2X25piBXj0b+bpbIVzw6vcG8o9DKxEdEE5Acqv5wkwVRf
	h9mzi3PpdoKaFjuAGzfSdUGxFYgmQSXml8/kVOSlaQseunjfNGFOS49K5Ml/COSDJ5Ye0VdeP0PSG
	u7hs5xOw==;
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHAMX-0000000HLXz-3V9R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 01:34:31 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-483a66818edso558906fac.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 18:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028068; x=1792632868; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V8zDMiUEBwO1gulkBzoLNFoNTmgcXEIIu2kuyTI/+xI=;
        b=Xb4BEwGjCEl/OZh5q0yUtUPYgDJCd96enEvWGgm0+oz8f5OS2V2rJnw7MDGDv+k7V2
         sOshd8hKXKne1Z3K7W+nyxs69aLQPYocwJw62cMJpvZU4YlgVrYlHCpsrblsgUo9QOOC
         ZzuTa7qo0SjoKhbM6AQaQGSTlhtMLrRROmpU9OkXojX3GofYsnJyoBLvRQApLvAOhPqA
         vANKGD+YUswdcHmADczQuHrhhrjJE6H0QhaQ1XzYZW8qUb5IdA8nwEkoh97ARCer6VHI
         aCJEtDZMJbbEN+eESdolkKNVka0XSt7ONK+DXVFdw58Ietg0/PQ554FZFx3amLA45BYM
         dQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028068; x=1792632868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V8zDMiUEBwO1gulkBzoLNFoNTmgcXEIIu2kuyTI/+xI=;
        b=ne3N5jNAnEHN4pi1n7VQamfCb2gSrWRaxlhQwNuW2TLWNxjVZJdwL0DDHzPPs/AsFN
         IW3sVVNEn9IYjSStcMVw0dEwLMsXJPXJOpDkCkP5u9w0OwGAA6bv7bBulkt1m0k+b8DH
         EkNCLytZ2zIMOkMQ0wlgXctstGlqnyzIhfd06d2Vh5mqm+7LEyStLJfHB1AZz9dSZ0S5
         +P9U5+x/gth66eZjLn01w9L4wcfNqreGXS7zXPQJYvAVIZ9/oAJbEmSk535BdjVRm//c
         eVyCfz85TQLR/jHS1ZmpBp2Kwe0aosTow6bClu1KbjNN5AFaBjq2uOll+Mdwsz9C7rQQ
         n9wA==
X-Forwarded-Encrypted: i=1; AKwUvBwYwDs7Q1GV9i9Tvzzm1Z3APIsnmxjR4jI0N0dF3nPzufVTfbE21q/9vPr49Ny37iubk8QtCIQBqj1CwyexjCA5@lists.infradead.org
X-Gm-Message-State: AFq9FYLUS8zxVISsipatVCakA/U+xQiXFXxn2LithLBMNuzihBkHDXMx
	4Fn7gBzAPLNZn7YDzj+GCzpNnImgJIQksdup2FgO/hQJKSsB7ZwOhKDP
X-Gm-Gg: AYBFou1ZoHUdW+FwbDATrzycDeLsDFovo+Cf3iqhmVhuVI2NrbWDpa9Cj2fGk9+AFek
	GzT20yyPuH8ngsBuOZHJaSbYdyNHOEWe+OUfHRxYB1uLMLqyGVLe/9U13K1Y8c7H+dgfpVbCIIg
	3SCoQq7UzFt4nkRsaCKrC//WPT+4pPjIi9zVYXIkXw+8Zk5JSz8GSZNtyLPdeT8emYxBs3fUWFI
	E3bYDQ0JbSTiY5hj540xArA1cx3X9Lk5FJjVvlaahAIngzntrB/K881GYnHplGqAcb+fmz6FfJf
	oGWAGnlxgf3YdQrXkWMfSPCynt2ER3TJXaM7p3TTycAc72hbWWeDZthb5FgZdwlJ7tP7xoEu4HB
	9xvIVj2QVKZh5MnFUz9lFso4k9oZJKa5Dtaqw+H8ewuVnfsk4IRbFDr0+YGPxVXIg9NMe3RC6Pb
	Ry41Dl3tsos/AGjsAfVnPi/oj5m8d8c6tQuupFDKJErIgOJxih+Ue7EVgK4PHz1YznPvM8DMMjc
	MhpI1E5QrEyO30jT8OmtK9KfF2onryQ8E1LXl3EXKxD+CR5hKtGAeJF0if9xQkutuTSTBqWwm25
	DymlrT5dgu2j3SEeVhaobXe9kvyU2XDOA9mws/3TiyVXdU76SnGwFzhrzLazSp5XqisvLHdudsS
	AnI4MNshF+j6X2XuSWI0o
X-Received: by 2002:a05:6870:a40a:b0:494:76db:2aa8 with SMTP id 586e51a60fabf-4a2a86a7ebemr15214415fac.5.1792028067725;
        Wed, 14 Oct 2026 18:34:27 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:33:56 -0600
Subject: [PATCH v7 09/16] mtd: rawnand: sunxi: use page reads to reposition
 small-page NAND
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-9-5d3fc6ad2da1@gmail.com>
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
X-CRM114-CacheID: sfid-20261015_023430_174044_925B8BFE 
X-CRM114-Status: GOOD (  20.27  )
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

The hardware-ECC reader moves between main data and OOB, and rereads raw
bytes when checking a possibly erased ECC step. It uses
nand_change_read_column_op(), which sends large-page random-output
commands and rejects NAND pages of 512 bytes or less. For a small-page
geometry accepted by hardware-ECC setup, these reads therefore fail when
they need to reposition, rather than using the small-page read commands.

Add a read-column helper that uses nand_read_page_op() on small pages.
The core selects READ0, READ1 or READOOB for the requested column and
sends the row address again. Pass the page number through the
erased-check path as well, and preserve errors from the resulting
operation. Keep the existing random-column operation for larger pages.

Select PIO for small pages even when DMA is available: the DMA PAGE_OP
sequencer uses large-page random-column commands internally.
This corrects read-side repositioning only; the write-column helper still
rejects small pages. Software-ECC and raw callbacks are unchanged.

This is a command-path correction found by inspection, not a claim that
ordinary 512+16 NAND becomes supported. The existing controller-ECC
limits still apply: it needs 512-byte ECC support and at least 28 parity
bytes plus four user-data bytes, so 512+16 remains rejected. No
small-page hardware validation is claimed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 6c4e1740a245..f8abcb46f7f0 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1054,6 +1054,16 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 	}
 }
 
+static int sunxi_nfc_read_column(struct nand_chip *nand, int page,
+				 unsigned int column, void *buf, unsigned int len)
+{
+	/* Small-page NAND needs a new READ0/READ1/READOOB and the page address. */
+	if (nand_to_mtd(nand)->writesize <= 512)
+		return nand_read_page_op(nand, page, column, buf, len);
+
+	return nand_change_read_column_op(nand, column, buf, len, false);
+}
+
 /*
  * Return 1 for an erased chunk or 0 for an uncorrectable chunk, with ECC
  * statistics updated in either case. Negative values report transport errors.
@@ -1062,7 +1072,7 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 				       u8 *data, int data_off,
 				       u8 *oob, int oob_off,
 				       unsigned int user_data_sz,
-				       unsigned int *max_bitflips)
+				       unsigned int *max_bitflips, int page)
 {
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	unsigned int oob_len = ecc->bytes + user_data_sz;
@@ -1070,13 +1080,12 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 
 	/* Check the physical representation for bitflips in erased pages. */
 	if (nand->options & NAND_NEED_SCRAMBLING) {
-		ret = nand_change_read_column_op(nand, data_off, data,
-						 ecc->size, false);
+		ret = sunxi_nfc_read_column(nand, page, data_off, data, ecc->size);
 		if (ret)
 			return ret;
 	}
 
-	ret = nand_change_read_column_op(nand, oob_off, oob, oob_len, false);
+	ret = sunxi_nfc_read_column(nand, page, oob_off, oob, oob_len);
 	if (ret)
 		return ret;
 
@@ -1177,8 +1186,8 @@ static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 		return 0;
 
 	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
-		ret = nand_change_read_column_op(nand, mtd->writesize + offset,
-						 NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + offset,
+					    NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1242,10 +1251,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 
 		if (read->oob_required) {
 			/* Keep the existing PIO and DMA representations of parity. */
-			ret = nand_change_read_column_op(nand, mtd->writesize + oob_off,
-							 read->dma ? oob : NULL,
-							 read->dma ? ecc->bytes + user_data_sz : 0,
-							 false);
+			ret = sunxi_nfc_read_column(nand, read->page, mtd->writesize + oob_off,
+						    read->dma ? oob : NULL,
+						    read->dma ? ecc->bytes + user_data_sz : 0);
 			if (ret)
 				return ret;
 
@@ -1281,7 +1289,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		ret = sunxi_nfc_hw_ecc_read_error(nand, read->buf + data_off, data_off,
 						  nand->oob_poi + oob_off,
 						  mtd->writesize + oob_off, user_data_sz,
-						  &read->max_bitflips);
+						  &read->max_bitflips, read->page);
 		if (ret < 0)
 			return ret;
 		if (ret)
@@ -1321,7 +1329,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	int ret;
 
 	if (*cur_off != data_off) {
-		ret = nand_change_read_column_op(nand, data_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, data_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1331,7 +1339,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 		return ret;
 
 	if (data_off + ecc->size != oob_off) {
-		ret = nand_change_read_column_op(nand, oob_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, oob_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -2304,7 +2312,8 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	ecc->write_oob = sunxi_nfc_hw_ecc_write_oob;
 	mtd_set_ooblayout(mtd, &sunxi_nand_ooblayout_ops);
 
-	if (nfc->dmac || nfc->use_mdma) {
+	/* The DMA page sequencer uses large-page random-column commands. */
+	if (mtd->writesize > 512 && (nfc->dmac || nfc->use_mdma)) {
 		ecc->read_page = sunxi_nfc_hw_ecc_read_page_dma;
 		ecc->read_subpage = sunxi_nfc_hw_ecc_read_subpage_dma;
 		ecc->write_page = sunxi_nfc_hw_ecc_write_page_dma;

-- 
2.53.0


