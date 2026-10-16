Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEDDCCA46D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 03:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/V8rc4CjnNbzKk1bJzDBVlS/8f2AkkYVi/FGYi/KHc=; b=W1vWmVjtOQp/0xVsYoIVmgbCmA
	LYycvBMY8dYmTyCqyRIzQ7MSCLxE5k04rBmcavSWBFGM5lEWPgeMS4ZODH61Zi4tyCUpJ9rMe3WPH
	KA0iwCeK/EBnor6kpgj/ytbY9p8jcCeH3fWgoDnlaFwdopSANxHlK8L78UxUaUR5+f07xlyqaMTUB
	L0WZ3UfXV6w2FiUcwJuuZAzB4TnaduBKA1BAMs7i3HP22g/fzgqwUBTAIoiygIV6M6YWYmhuV1A7T
	KSBQ49H+xw1yzqVWzdJL0K5eyqJnfwvcWlFYoPZmYAlu4sO7j9+AppXvT0HJMSJOMh/jt7T8pP0xF
	Sx1NH9bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYtP-00000001sxU-1ovO;
	Fri, 16 Oct 2026 03:46:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYtE-00000001sbr-0rOM
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 03:45:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5/V8rc4CjnNbzKk1bJzDBVlS/8f2AkkYVi/FGYi/KHc=; b=fqkwEVOB4UfLHJ5DoZk36zyUrP
	H5oINdtqhVH20tskinmHWuM5uLfuIT3I/Kk2dvgUU+P9sRFn796UNAcpe8nZYcmFjRoYQM0j7g+Ck
	Nax4ADXKZqYK+0h3/2akhB+6BaDxoSpEjzJG2JanE1t1gOtr8SZAudzf0Z2mfUmct1XR3wSyJz7vT
	ev0nxNHEMez87nT1NiJFjTO/BRmmwEA+b427jEq8zzPfUiQYZeqs7zZ8XAWCY3kkpyB0aZt808gQn
	JR86q+94zVkf8ovX9V5Cl6M+261SSK5TZIrzUtywzA1u9fl/r5Hh5JiXI90XVn2B5Bez/1IE/Z9M8
	iVjPYjfg==;
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHYt8-0000000146E-1pO7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 03:45:50 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-82478760557so2035329a34.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 20:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122344; x=1792727144; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5/V8rc4CjnNbzKk1bJzDBVlS/8f2AkkYVi/FGYi/KHc=;
        b=fYeOPEiZmyH+IvKiN5PXTgu4R+/BZDUAlgLvdogd9UozS4zEyv7/yx7b3/c+RxEDjG
         5iiLXLnqCBHsch7hosG4IE1Z3b7LB+/86In6OUsb2mwQqI4abavTQj/hkZCOjFno4bGX
         Whw985UzQ+TZSp10GNjHEqgbmpShm/U35JFjD5i22yemtZ028GtNAPprTM3wZ2mqXwjd
         DTWhvu4GcsK73Rn6WuQ1A9fQeGXD2EqpsqNTF5OP6Fy+pw7zeFRHDWpsFM/g2u46LGuj
         OSTEQG4PdxUWHxlApGUzoEs34xMiQyPbOqZM63VkERtYUcVWbFHuhKBlPsd+/a5h+h0C
         isHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122344; x=1792727144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5/V8rc4CjnNbzKk1bJzDBVlS/8f2AkkYVi/FGYi/KHc=;
        b=IRtnuUyLDGfVXC6kMJMwP5Kb48vUlN4bPv28NXj5Hq8yPlfBm3QE5j9Aey3ojA1fqL
         pQI/+jmEZLLMTYPvBybedwQ8sShVaTPtyLbl9pM91FXJT1daNvcwGrWa3kG31aJTPWIZ
         Wf+vFS1o9eXy/Nhz24//emheDcMIEmeqequrTJ5BwUj6sgQy4CsOjJc6PFf1ClkGzDqy
         YzEpxXwRqYetYXPEpXW0+PtcYsijHzx0virj4N6U/p2Xzjj83jhnXotNzhbG6vZqcroA
         41zcWSbzrYAIfNkDIU3OO9ZqN8rOPM5D02lXqY/1cwVm5WIk5xIVr7Ki9CwLO19FPxgG
         REzQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8nNFRYfLgEgF1kp8TWoCDI/YYe3d7TdQ8TpE7egb/xR7HajvmOjui/BHcVuOj2onMuDALFCO9PqDnodQPf1Wo@lists.infradead.org
X-Gm-Message-State: AFq9FYJppSoMTIAP9sNzHI3yzcTKf7n+icCk3kEsB+kF00JbXvJwRT/q
	0qRYi7KXSP4eYErnf9icw7KmscNckv0j171vhMAnFIUWqG31wWoXPeFf
X-Gm-Gg: AYBFou1eB9JVwGASDEdlHQv7H+vmByvn1/DSYfGMP65z1H0KiQPAcEKWLHSlWzAXExE
	F6MEZ1oCS8AtVekKpiI3pgLOtFsMGfgGioB85fb6DsQZW0/PSL93U7KgrrXK3A5BCRDSWgIL90S
	VlH/1l+fLJig2MUAmb4BcCZ4cHr6fist+o/XBOU8bIJLF0vs+jlwB5BE+vedMpPDmfVXwQt/BQ+
	OIBILIGCr3AE2RoMGxD/+bO3L6ZOdWvrxSLpcy1OU8uv5WWe3HGaj9IZZFL5451eD4nSindNu2+
	+wsLns+e6tciqeIR2Qf9xSZIzO9+/TTVGLPm/JHUeICbUynmxhI8GMBOx7WjLkV+fhQXvYt54KS
	BS5MH/ZuXt59XXi19J1LvKWVw9CStGKSRGRg5n6bqTjoauY6SgSt8kNywyvhLyFXF7o9J3FehX0
	E7kU3fHQowjDRDmu1cXLAKqvwhAMfr8TKcpakve52eMabZm/FTTPOxIiC1W2muK8kpFhPjSaZvH
	2/dx7zuEojWsJeLgR1nzd1nz9doSQUi7VoZ+yLtmZ3z4+WMC7VU/0NKwUY0VJBO/UbR1vk0Oz2P
	DG8AQrnrCStpmpsjZNcBgAREk8K4vuMzDxJTBze8geH2mcss9q8A0RrvxMP11aJlUhARJRilYrr
	7jomxKleLa+0VGVm6RV7v8g==
X-Received: by 2002:a05:6830:6816:b0:7fa:ac4f:79d with SMTP id 46e09a7af769-83097c62d97mr22209672a34.25.1792122344353;
        Thu, 15 Oct 2026 20:45:44 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:25 -0600
Subject: [PATCH v8 10/17] mtd: rawnand: sunxi: use page reads to reposition
 small-page NAND
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-10-8ba4881fbee8@gmail.com>
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
X-CRM114-CacheID: sfid-20261016_044547_393606_BD044B02 
X-CRM114-Status: GOOD (  20.23  )
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
index 9f03ba22b4b7..34c1c5037b11 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1061,6 +1061,16 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
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
@@ -1069,7 +1079,7 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 				       u8 *data, int data_off,
 				       u8 *oob, int oob_off,
 				       unsigned int user_data_sz,
-				       unsigned int *max_bitflips)
+				       unsigned int *max_bitflips, int page)
 {
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	unsigned int oob_len = ecc->bytes + user_data_sz;
@@ -1077,13 +1087,12 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 
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
 
@@ -1184,8 +1193,8 @@ static int sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
 		return 0;
 
 	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
-		ret = nand_change_read_column_op(nand, mtd->writesize + offset,
-						 NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + offset,
+					    NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1250,10 +1259,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 
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
 
@@ -1289,7 +1297,7 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 		ret = sunxi_nfc_hw_ecc_read_error(nand, read->buf + data_off, data_off,
 						  nand->oob_poi + oob_off,
 						  mtd->writesize + oob_off, user_data_sz,
-						  &read->max_bitflips);
+						  &read->max_bitflips, read->page);
 		if (ret < 0)
 			return ret;
 		if (ret)
@@ -1329,7 +1337,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	int ret;
 
 	if (*cur_off != data_off) {
-		ret = nand_change_read_column_op(nand, data_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, data_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -1339,7 +1347,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 		return ret;
 
 	if (data_off + ecc->size != oob_off) {
-		ret = nand_change_read_column_op(nand, oob_off, NULL, 0, false);
+		ret = sunxi_nfc_read_column(nand, page, oob_off, NULL, 0);
 		if (ret)
 			return ret;
 	}
@@ -2312,7 +2320,8 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
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


