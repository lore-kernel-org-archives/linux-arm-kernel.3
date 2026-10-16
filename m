Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077F9CC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 03:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hlWVFZs9qMdbAGtAdGz2zNdnsjoirOAt+ztYuqFoEV4=; b=vNXND0z+EWW2Pabk0PhGK0q11E
	JLFl/UzU8VJv6SoKqVbg+BOurOqhkF54MIINBMMO70W0571MnG0CdyNjnZQs1D/J3y+BQOS3SxqMX
	3UlxASG2R+PooqeXR3xN/5c1MJhAUeYddbO/UvM4dpW7WYciq8FtvrImI2OUpQ8ZkU5ru3hI6BON5
	DZv6EmAgxql+plyy71MItyyQAJZ68AkkyXyoxjcUy6XoJv8ZM364NDGThmohNDoDeK684emcmG1oN
	EaHqNsb6RWEvs1EfbaYQmznyXTyo4kF5OjoVPZ4eTigncru/JswTx0b18tCycD6UfUIJ2bMi//itj
	SQXVHZUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYt0-00000001sIv-3X8r;
	Fri, 16 Oct 2026 03:45:38 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYsu-00000001sCK-08Vj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 03:45:33 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-6b19e291cc6so5523557eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 20:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122331; x=1792727131; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hlWVFZs9qMdbAGtAdGz2zNdnsjoirOAt+ztYuqFoEV4=;
        b=rE9Cot+EeW/A9Fdv4TgoPF0AJvdoEyNMd3dRC/vjzAlJuRQ4/zqH04p0i94Xy1Qde1
         y1cUEcYGPULwiVVNKJU0qE0aM/8SH2XrKCEwqn/vw62bfv3jX2X5XEV1X6kQDW9VHNFD
         SufvbA+33tMC8bXu+kSYeY+/sXad6Xy0n9k0MVlsqncJSrmHWrXiPgYNYcykd59k4Y7p
         D2a3anSoZH/gP/ocHEDcFKxFpuSrvOvkpFBfBVRV7ELDEBQdLGZ89zpz910ppecgB4WC
         bEm38jghiq8gesGrpZ7SE7BQcCpsGiyEQl1pTYhvsbknQROrFxk9Ba0EcebhgeUuHCHi
         cDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122331; x=1792727131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hlWVFZs9qMdbAGtAdGz2zNdnsjoirOAt+ztYuqFoEV4=;
        b=WbpDbm6GX3dJC62KWEn45IDMYEpvUTDGI0/kGk1NfO8ronTmm1XpaGqtlovW8BbL1j
         oruHf+qpwaMHWC/OgXSzjbxsNafVqVUwVw6AqXk047+e7PMDMAqv/dTIECcssx/CMQy6
         hK/obfaUIgxTOcn64+qMGxsUXSGNuq95xwWPp2t33QvW1G5DdBU3ck31EWovDt33WKJP
         eswVCYPhZyHqZfSEQp/xSJQO8t1dwF0CoI2LaA1MV+7aJET0eCAymNuF+IH07j8PpbbP
         rmEZqSh6qBLKMi+g7/UBOgiOQfZXNwdGqnIXh+7CGWCCafWEaT1rDR0bE+U9XdNrBB0M
         YvXg==
X-Forwarded-Encrypted: i=1; AKwUvBw5kE0wdJ85211QnEbaMPmLTeS6UvwrFwEnRhJrALjt0vlDfztnS30WUZfbp2Plty7vm2AGAETHNo2l6tCZ0Grw@lists.infradead.org
X-Gm-Message-State: AFq9FYJYRGiGFf0oNHlHHnwW6XIHsLYnneD46Zbkjoxe8KxCIk24b9ht
	SHO9tHHe13g8Sc8o1oQN0SYj9TItEHo3fzbaqPmo6O5EcDXUNqws4Wm9AlHf918P
X-Gm-Gg: AYBFou35fhuQ0GZYKCq4h7Aj6iZwOxTjI0QqgI7jCcaWsd/Md3Y/CIMPk0Z2rb0NioO
	ysjn23FJvT1o26XUftdUp5LteRZNYWQaDcZFBj1yLf4aLCZ9MGGzXHrirhbE0H0jo0ji+/B2uqQ
	6/i8VhedyudcCDDyL3M/hp7KyknSNIj99U60NoDDy3mwcIh2FdwoclKdLiztVKh86VkueUydrGI
	A93Em+H8oslvhHaLiB7fmC7uK/i14O40iMulLXmqivRoP8T+kKr8wCu4wJ2JRH2T2IZNr/yMgvb
	dGwUi+TX01lM79odmajeYZfhTnXbEhhK5AhG8/kfYTYU4pmZgQkLO+pCuJJEenMWbwtvPUR5qMV
	T38VQVjyDQoyqKwQGxEn1/rr5pTY4o0v6fwkNvzbhbGMVF1tcn8cq+ha2TxPdIaRsBP1BkPV1Kf
	OODi9Ts8vy0LPkzbbA00c6J/ATjKvUFr1UcGG3V8BGiMghc0jcW2HL53kpH9U4JQU5U3M6i4hiE
	12OBoDmVuBGHHYFgb2LSsbeuM04+SoytVFppH9qrXGHY8Qpb60yUhwUjEDqCUQKPozusVNEI0gZ
	5VcPLuJnWuZLlsPW3GCVJxc9X/CE54BNoi30lKskrnYEjzodtoHgMPY91rEkzSEN5KattBVWuIf
	HoUhIjtbSBc1FFSApeqzKHw==
X-Received: by 2002:a05:6820:1503:b0:6d7:cd0c:752a with SMTP id 006d021491bc7-6ef0faaa6f2mr17901293eaf.54.1792122331029;
        Thu, 15 Oct 2026 20:45:31 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:18 -0600
Subject: [PATCH v8 03/17] mtd: rawnand: sunxi: propagate page-setup and
 erased-check errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-3-8ba4881fbee8@gmail.com>
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
X-CRM114-CacheID: sfid-20261015_204532_086418_3510733D 
X-CRM114-Status: GOOD (  20.51  )
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


