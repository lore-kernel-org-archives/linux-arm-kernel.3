Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392EFC88E73
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 21:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a95pnyMUuTP3EJOQCSW0InToPnlbmRSOMBXnRGDUxFk=; b=wTX8h6loC94pexXb2RezkiFZVc
	yYETcuNnXwxDhM0pZT56lgGvwyMXw+uijLz8BxCVLf07bd+abq8Iy5lezrcXfHMTczYDAD9f0YRDX
	vAc+P3c2uoHvLRe9xvaEPo+uF+6kVeICiglC26Uhwt/PQLxI7czi8GbxaefcKgfJilY4w8rX+zHlZ
	1CVfCfCON0TRYGPVoo+izMFWrgM/NVzfkFX+h08dqtb/c2hiAz6fHTZeT69aH7P+O0BC4F2A4chrA
	LaAiys2ezOg8Gtjq1V/XoTHJ+aIC+ErbEBbI5lAGr7mmvZvc4ME9sjrHRdKnjXbK60uRbfayyUbBJ
	/9wJJcwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DwF-00000004fWH-0qX8;
	Mon, 14 Sep 2026 21:10:07 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dw9-00000004fOI-0A5x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 21:10:02 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-6c20a9c464fso2483940eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 14:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420200; x=1790025000; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a95pnyMUuTP3EJOQCSW0InToPnlbmRSOMBXnRGDUxFk=;
        b=i9g9Qr7yvjcRrcV2UKVpVlMw8rILQz+QsgXmwuikmiAvRfjdtbnGF5/1NggLuud3Tp
         m6qGltwtTuK4JxC7LeJz3nVeJbWQbhdXqBDU1zWpZIFjOrU3KX+IkgSUdPK0mkKoh76c
         WCD7mIxGGD/5tO7Erg87CEWMwOXG40sLYVb8CAeTwvRpE5mXksvhGp5+9loAlCk7HMk1
         uwDEqvkTu7xUN9LFTUF2OH6mC/fIFavEWcpZUoYxpDQaYVHOYmzCFWsze2vuh1m8qvB5
         8GtyLfwy75cRiLmbDfBFjZ7vNOMiwdhgOJmrooRZzggRKXEAUJG7YE498Mh7MbnHGRvE
         lK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420200; x=1790025000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a95pnyMUuTP3EJOQCSW0InToPnlbmRSOMBXnRGDUxFk=;
        b=XjFwWEd8zasq+sNCECFsha/vY/G8j+l1KEsDJno7SgD6V1xFGQhEufpspqYOmiGgPf
         n1SRs9iPoKZea08L2hZzQw8E2B0I/FNnHv47B/d0t/Lw4InSa+GAMK05NFx5Ml7v+Tv0
         CuXv/cgMOcM+bH3PifrH4MtYl8nIIvG189aWbMIDVnUUDE8Axz7P8lFg7dtOzgc/hkCI
         62MToC36A0HlQf3pN5E/bji0b98onIxHqNtncP9qFGJ+aMBxNvinZSNQhNKLIADhdnZe
         09oMr7WMKGf8KmKAciD+IxeDpzC5kYN3FQL+yy5oMQnkvont9coQWGRz4sn8l3gOcjkK
         8fnQ==
X-Forwarded-Encrypted: i=1; AKwUvBx28vqugVXpVAoizarGcybpohDsiysnytv42thYrxv8YkDQfoBIhK8tNJi/Gb9yIEYAwF6Whdkoh4Ltf/UAQuab@lists.infradead.org
X-Gm-Message-State: AFuF++k88uhlCMqc4pRj5qRggulb4QvFK5E8vv51vgLIuPIl5Y1L4lGc
	gGlL+enXMWb4OKH+GY3+vc2neY6cuHWowcScZ7x0ecsO+xyBKTDE0Xdh
X-Gm-Gg: AYBFou1BqRluqoCUnR/hgMG02a0rEvUBGiwN6WTqxiB0ia+t6z3kQ03QEVC0dKDVPhr
	FlKGoDspol+p6mDXy+g/60NbWMkq2DMZ/bAiyvCjohm8DxQmP9QKBlhAg5XcZ9MtkoZTzr2pMHc
	5egpmAGimAtwC+qx0QtCCqM3779BBk8E2JWoFMa95ioIQE7EMlnnrsrGuXZU7GH8/s4n8qvcG60
	5dkhoKwALJbh7iqfp5gEtmfXuucPCPE1Achdn+Cjl9FXZxQWezRfUAFD1txC9AfPlRPMrZxJY/K
	M4MDnX+/7R4bgCgTTM8x5B3dhz8WTaI+HcVoRF5F6l1qRuMSHMwoRn3rFkBU8aLW6vKVh/478hO
	3cfFrZwljzUNYg4T/9KFmLYmVxrScO3IQFO5XEZtIaR/dSkO0tsfjPgpfex5irX3oZUu3P1/s26
	4GlubQTarfD/PV65h+ShFaQMKEmsQB5uQRJmvVAZN57zj79E8KDkK8FA+r74R0Dn39X4usa08ol
	jcI1pKtOOPe9HfVMk6FCNQrRTO4OWVp6cyv3RAJhtlEoyc7DNKy6ratZXtstNeMkhZNczFeQklJ
	Y8TpL5JgxW3S4JYD3ysgYqntBPs8VMQkztH4n0nAYLOyUEkbXWIXTnT7xQOL0+KbSvcHUEP0rm/
	EFbaEtEol2m3zLYWVHd6KL5F5AV/l
X-Received: by 2002:a05:6820:810:b0:6be:6f42:3a86 with SMTP id 006d021491bc7-6c544ca9f68mr2776984eaf.47.1789420199333;
        Mon, 14 Sep 2026 14:09:59 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:09:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:09:49 -0600
Subject: [PATCH v6 03/18] mtd: rawnand: sunxi: propagate page-setup and
 erased-check errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-3-2fb084fe0751@gmail.com>
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
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_141001_113676_96630182 
X-CRM114-Status: GOOD (  22.83  )
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

The hardware-ECC read callbacks ignore errors from nand_read_page_op().
A failed page-setup command can leave the previous page available, so a
later successful transfer can return stale data instead of the requested
page. Stop before starting the PIO or DMA transfer when page setup fails.

The physical rereads used to check an uncorrectable chunk for erased
contents also ignore errors from nand_change_read_column_op(). A failed
transfer can therefore leave stale data in the buffers used for the
erased check and turn an I/O failure into an ECC result.

Share the erased-chunk fallback between PIO and DMA and stop before
checking the buffers when either reread fails. Preserve the existing
erased-chunk test and corrected-bit accounting when both reads succeed.

Before retrying a failed DMA read in PIO, restore only its corrected and
failed counters so partial results are not counted twice. Leave bad-block
and BBT counters alone. Route PIO page and subpage error exits through
ECC disable before returning the transfer error.

Fixes: 97d90da8a886 ("mtd: nand: provide several helpers to do common NAND operations")
Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 120 +++++++++++++++++++++++---------------
 1 file changed, 72 insertions(+), 48 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 172c7c4b0ba6..d5d8d383b6d1 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1067,6 +1067,40 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 	}
 }
 
+/*
+ * Return 1 for an erased chunk or 0 for an uncorrectable chunk, with ECC
+ * statistics updated in either case. Negative values report transport errors.
+ */
+static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
+				       u8 *data, int data_off,
+				       u8 *oob, int oob_off,
+				       unsigned int user_data_sz,
+				       unsigned int *max_bitflips)
+{
+	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	unsigned int oob_len = ecc->bytes + user_data_sz;
+	int ret;
+
+	/* Check the physical representation for bitflips in erased pages. */
+	if (nand->options & NAND_NEED_SCRAMBLING) {
+		ret = nand_change_read_column_op(nand, data_off, data,
+						 ecc->size, false);
+		if (ret)
+			return ret;
+	}
+
+	ret = nand_change_read_column_op(nand, oob_off, oob, oob_len, false);
+	if (ret)
+		return ret;
+
+	ret = nand_check_erased_ecc_chunk(data, ecc->size, oob, oob_len, NULL, 0,
+					  ecc->strength);
+
+	sunxi_nfc_hw_ecc_update_stats(nand, max_bitflips, ret);
+
+	return ret >= 0;
+}
+
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 				    int step, u32 status, u32 pattern_found,
 				    unsigned int user_data_sz, bool *erased)
@@ -1115,7 +1149,6 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
-	int raw_mode = 0;
 	u32 pattern_found;
 	bool bbm = !step;
 	bool erased;
@@ -1158,25 +1191,13 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 		return 1;
 
 	if (ret < 0) {
-		/*
-		 * Re-read the data with the randomizer disabled to identify
-		 * bitflips in erased pages.
-		 */
-		if (nand->options & NAND_NEED_SCRAMBLING)
-			nand_change_read_column_op(nand, data_off, data,
-						   ecc->size, false);
-		else
+		if (!(nand->options & NAND_NEED_SCRAMBLING))
 			memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE,
 				      ecc->size);
 
-		nand_change_read_column_op(nand, oob_off, oob,
-					   ecc->bytes + user_data_sz, false);
-
-		ret = nand_check_erased_ecc_chunk(data,	ecc->size, oob,
-						  ecc->bytes + user_data_sz,
-						  NULL, 0, ecc->strength);
-		if (ret >= 0)
-			raw_mode = 1;
+		return sunxi_nfc_hw_ecc_read_error(nand, data, data_off,
+						 oob, oob_off, user_data_sz,
+						 max_bitflips);
 	} else {
 		memcpy_fromio(data, nfc->regs + NFC_RAM0_BASE, ecc->size);
 
@@ -1193,7 +1214,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_hw_ecc_update_stats(nand, max_bitflips, ret);
 
-	return raw_mode;
+	return 0;
 }
 
 /*
@@ -1260,6 +1281,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
+	unsigned int corrected = mtd->ecc_stats.corrected;
+	unsigned int failed = mtd->ecc_stats.failed;
 	unsigned int max_bitflips = 0;
 	int ret, i, raw_mode = 0;
 	struct scatterlist sg;
@@ -1354,29 +1377,18 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 			if (!(status & NFC_ECC_ERR(i)))
 				continue;
 
-			/*
-			 * Re-read the data with the randomizer disabled to
-			 * identify bitflips in erased pages.
-			 * TODO: use DMA to read page in raw mode
-			 */
-			if (randomized)
-				nand_change_read_column_op(nand, data_off,
-							   data, ecc->size,
-							   false);
-
-			/* TODO: use DMA to retrieve OOB */
-			nand_change_read_column_op(nand,
-						   mtd->writesize + oob_off,
-						   oob, ecc->bytes + user_data_sz, false);
-
-			ret = nand_check_erased_ecc_chunk(data,	ecc->size, oob,
-							  ecc->bytes + user_data_sz,
-							  NULL, 0,
-							  ecc->strength);
-			if (ret >= 0)
+			ret = sunxi_nfc_hw_ecc_read_error(nand, data, data_off, oob,
+							  mtd->writesize + oob_off,
+							  user_data_sz,
+							  &max_bitflips);
+			if (ret < 0) {
+				/* The caller retries the whole read in PIO mode. */
+				mtd->ecc_stats.corrected = corrected;
+				mtd->ecc_stats.failed = failed;
+				return ret;
+			}
+			if (ret)
 				raw_mode = 1;
-
-			sunxi_nfc_hw_ecc_update_stats(nand, &max_bitflips, ret);
 		}
 	}
 
@@ -1471,7 +1483,9 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1487,7 +1501,7 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 						  &cur_off, &max_bitflips,
 						  i, oob_required, page);
 		if (ret < 0)
-			return ret;
+			goto out;
 		else if (ret)
 			raw_mode = true;
 	}
@@ -1496,9 +1510,11 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 		sunxi_nfc_hw_ecc_read_extra_oob(nand, nand->oob_poi, &cur_off,
 						!raw_mode, page);
 
+	ret = max_bitflips;
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
 
-	return max_bitflips;
+	return ret;
 }
 
 static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
@@ -1508,7 +1524,9 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page,
 					       nand->ecc.steps);
@@ -1532,7 +1550,9 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1550,12 +1570,14 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 						  &cur_off, &max_bitflips, i,
 						  false, page);
 		if (ret < 0)
-			return ret;
+			goto out;
 	}
 
+	ret = max_bitflips;
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
 
-	return max_bitflips;
+	return ret;
 }
 
 static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
@@ -1567,7 +1589,9 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, nchunks);
 	if (ret >= 0)

-- 
2.53.0


