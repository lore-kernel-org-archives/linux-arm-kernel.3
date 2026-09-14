Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCAAC982C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 21:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3gIMuO5LgsmThmwiwqzrGE8ky+825OhMeKFgclE6Udc=; b=G2r16eoyLn0tl5Y2coE3iguZWw
	WzldbDiCUZDndhWlTVqjMUYXH2kV2o8d2k42bvd7dytydCYwdIkH+8vW5lGBtdccGdi66VzCUsaqS
	qCMVuXllk89I0eTFdVUCXoUV0eMBbaiBXtRKls8eNvILFLUGWrD05S/ryfzaMd6Sr3C5s/jUufdjZ
	XNbmRLpleWSnQSaIFFyJH9Z4DYE6dGHI03s148fRjSKuuES8DWU3PjdKqBbzFQNhSlsrd2kwPFtDt
	EWZ9St7BhAE74IpplYVqlgXCaRkGiyUgiFrVpP9cgslkx7ZJ6pj8anccJ89WDBsKXoFzX/wfkrqNt
	75p2GhIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dwb-00000004fyJ-2SFZ;
	Mon, 14 Sep 2026 21:10:29 +0000
Received: from mail-oi2-x11.google.com ([2607:f8b0:4864:32::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DwG-00000004fZE-33Ga
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 21:10:09 +0000
Received: by mail-oi2-x11.google.com with SMTP id 5614622812f47-4c66ba0b762so455569b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 14:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420208; x=1790025008; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gIMuO5LgsmThmwiwqzrGE8ky+825OhMeKFgclE6Udc=;
        b=PxLefBO21RoUraIq0GZXhmB19vcLcF5uD9tjsitEmTVyYk8Q42c+qyGRPJ7Lw3bmZc
         GN1j6doPOvoAl+ax7iNSnuF1biQikWTQyhm+8AMuUl4hoGetmb1KmXZ3fEwaKUUOm8po
         lDIYMFHTAUeaVP2AZOYwQ8bbfulENKavf5xt5JJGBhAN4vWqG4Juf6omjfYq0sTWq1XP
         xXhQme7WUvSJs2Lamy+GXk8Bj5XpJ1HZRkrxr6xce/XoTgEF988bqzvGZNqUnvzYlFzn
         2QkKRgHO3Fi3xFQhh0apyBlsV9MjCJcm3H6ziui5T1IbdUZ6NxwknxxDosJYDFh+B2au
         eGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420208; x=1790025008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3gIMuO5LgsmThmwiwqzrGE8ky+825OhMeKFgclE6Udc=;
        b=tOyN82YAibqPIteAdUxB0d4t7GlndA2U2hXeRek7HC35WRnktIZL7ehTQTZyHp2Z8H
         +mGJwpZymObiUKJLdO4fBSJLyARHB4Md3U+FJEgyj0UHB0rsLY6KgvAqd4VkBt66rrJQ
         dpa+eQZmkJQ2I35C4Ah7yO6oMc4UlPDQDa7EJnUe4DwHPfQGTMavjbNuYC18cks88gy7
         VUffRJ+aXE/2IqUhvcwSkgub8YwgmSPTn+6mX8/GREopGXUL0iCdqA9FnxEvJifQzUkE
         R7SFZ3scefpGhdr3ePRJB551Vso9ofqvL6nHuxL+vQRWjHjnuNvopc460/TtxUnmt7Ys
         GpdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqF6ET9jGRH2+qcnrJCE4JuFOIchsy2809HOZMRnfGd+ALOm2ar3pa0d6vhQwm4UFOlfgMIAmVaP1r4E2p8AbQ@lists.infradead.org
X-Gm-Message-State: AFuF++l0Tv0Bhy8ktXVfoZeS3fsiFyTQT90noln9PDjRvG6fpWFHpCRu
	NdMRPG7eVmyVn20SWfC/YD1Ebrgi48drj/Tmo+oPWi20/11DrOn6a3IU
X-Gm-Gg: AYBFou1WYnqeXvdLWLci/gShfomGG2xBZtgV3cNb/sQ4J96gKbP6MNX2zJnoKfPwEu7
	nexUmL+WzoCwSeiBl3nGvHY03NIMUQuskgR3Nf3kBYw5xEejnL1daJAf/FiF47E9xbWCIaRd799
	xyzuT5fhFkG+oQq/rtkGMvjj4DRoFRRnyrUWUUJBaRiyLbOtSlGx1S+ASaSOXeAecv5rpzVwcaM
	Y3DhHDoaosfxdja63D1BIrtYJHhbrifGhm+SA7lzs1S4N7XKqupbG8ABT8neoVmIZCyrm4XdVJ3
	2snbG9l0QchikIGdQkFXPQRjQSn9I1zPtgW0SVJsVREiOFI4/8HuJUgU7Ubzt3LqpXDQO3StS+f
	XEwuMMQKpX4FhIV15sn+FdBkqviaZlbFu9a3U5JTDuycLZovHebrtl2xuz3ZizPqybA25xBVLK+
	iv713jTt9/PnQTepdF+5+EtK/iXyVhBd2ywUqBS9MoUvlub5I/YRASj/ziHY/YaJ90T3CYWXUAz
	tlcb4Kmad5IeUZ+cyh5xVrBNJ5sAM3G2PbJ38KMGqtEMcQNt0+MFvhFBC+1i/TXBi5jD/kdNtaO
	v7hPVVPHU7B8/cshO2+NwqgpyzjnAsvK4KuxlJRc42yueMCRbDM5A1DCAinIJNh6kWEq0brzuFF
	tTZ60+uIA6yrzWbaOjNW6F9mn1qRZ
X-Received: by 2002:a05:6820:1899:b0:6b5:ec3f:4987 with SMTP id 006d021491bc7-6c63a55903bmr501376eaf.34.1789420207811;
        Mon, 14 Sep 2026 14:10:07 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:55 -0600
Subject: [PATCH v6 09/18] mtd: rawnand: sunxi: use page reads to reposition
 small-page NAND
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-9-2fb084fe0751@gmail.com>
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
X-CRM114-CacheID: sfid-20260914_141008_800033_B464A9E8 
X-CRM114-Status: GOOD (  20.56  )
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

The hardware-ECC read paths use random-column commands to revisit main
data and OOB. Small-page NAND does not support these commands, and
nand_change_read_column_op() rejects pages of 512 bytes or less. Ignoring
that error does not provide a physical reread: the erased-chunk check can
instead inspect stale buffer contents.

Introduce a read-column helper which starts a new page read for small-page
NAND. Let the NAND core select READ0, READ1 or READOOB and send the row
address. Keep random-column commands for large pages. Pass the page number
through the erased-chunk fallback and use the helper for normal OOB reads
as well.

Retain transport errors and only classify a physical chunk after all its
rereads succeed. Read exactly the requested region so the tracked column
still matches the start of any trailing OOB.

Also select PIO callbacks for small-page hardware ECC even when DMA is
available. The DMA page sequencer uses large-page random-column commands;
PIO can stream the single 512-byte ECC step and its OOB without them.

Keep the ECC geometry checks unchanged. In particular, the usual 512+16
geometry still cannot fit the controller's minimum 28 parity bytes and
four user-data bytes. This fixes the command handling for small-page
geometries that pass those checks, not a demonstrated regression on a
previously working 512+16 device. Software-ECC and raw callbacks,
large-page DMA eligibility and the on-flash layout are unchanged.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 40 +++++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 13dc0af56eb3..e29638c828ca 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1079,6 +1079,16 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
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
@@ -1087,7 +1097,7 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 				       u8 *data, int data_off,
 				       u8 *oob, int oob_off,
 				       unsigned int user_data_sz,
-				       unsigned int *max_bitflips)
+				       unsigned int *max_bitflips, int page)
 {
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	unsigned int oob_len = ecc->bytes + user_data_sz;
@@ -1095,13 +1105,12 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 
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
 
@@ -1169,7 +1178,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	const int nfc_step = 0;
 
 	if (*cur_off != data_off) {
-		ret = nand_change_read_column_op(nand, data_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, data_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1179,7 +1188,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 		return ret;
 
 	if (data_off + ecc->size != oob_off) {
-		ret = nand_change_read_column_op(nand, oob_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, oob_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1217,13 +1226,12 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 
 		return sunxi_nfc_hw_ecc_read_error(nand, data, data_off,
 						 oob, oob_off, user_data_sz,
-						 max_bitflips);
+						 max_bitflips, page);
 	} else {
 		memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
 
 		if (oob_required) {
-			ret = nand_change_read_column_op(nand, oob_off, NULL, 0,
-							 false);
+			ret = sunxi_nfc_read_column(nand, page, oob_off, NULL, 0);
 			if (ret)
 				return ret;
 			ret = sunxi_nfc_randomizer_read_buf(nand, oob,
@@ -1285,8 +1293,8 @@ static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 		return 0;
 
 	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
-		ret = nand_change_read_column_op(nand, mtd->writesize + offset,
-						 NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + offset,
+					    NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1386,9 +1394,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 
 		if (oob_required && !erased) {
 			/* TODO: use DMA to retrieve OOB */
-			ret = nand_change_read_column_op(nand, mtd->writesize + oob_off,
-							 oob, ecc->bytes + user_data_sz,
-							 false);
+			ret = sunxi_nfc_read_column(nand, page, mtd->writesize + oob_off,
+						    oob, ecc->bytes + user_data_sz);
 			if (ret)
 				goto err_stats;
 
@@ -1416,7 +1423,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 			ret = sunxi_nfc_hw_ecc_read_error(nand, data, data_off, oob,
 							  mtd->writesize + oob_off,
 							  user_data_sz,
-							  &max_bitflips);
+							  &max_bitflips, page);
 			if (ret < 0)
 				goto err_stats;
 			if (ret)
@@ -2305,7 +2312,8 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
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


