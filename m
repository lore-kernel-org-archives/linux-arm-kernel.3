Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6019C88E73
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 21:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+GbSlDHSjNPM9B5dSRFNO0YLnNdNTULtbcSEuiC7wJc=; b=Fr/WL4z9ueiMNp/8KUWlfVcPr/
	yFwm/6HTWiNKBfKYZEu7Ai0FjM0WKUfJE0UY7Q6lPQ/EFbkxS5XLV2+NzzsQPXSWw3do/hcoxsSNX
	paNM+nyOWVVV+CAgapU8Cc3TTn+8TMihFBS/1Lom+hzM7Apa26nrxoXKB7HRr7OZN8+OS0V4p7Lvo
	YtUWeiBXcHwTPQaN/82OaqnJ7+Vscxwg/G/liCYET1/iZg/kQRlsjvsO8uBRz4ALB0b+I3Xmj2ov1
	ngr4j35yVhAcKCQ/jD/JDPYEqZXN0reI8x9M0egskvY2GXdZ2oZ97vjdO/yENDp96NJe4RjyA7ABj
	ocEOrkZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dwn-00000004gFb-1rKp;
	Mon, 14 Sep 2026 21:10:41 +0000
Received: from mail-oi2-x11.google.com ([2607:f8b0:4864:32::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DwR-00000004flb-21Xb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 21:10:20 +0000
Received: by mail-oi2-x11.google.com with SMTP id 5614622812f47-4b37a2ffef2so1042917b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 14:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420218; x=1790025018; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+GbSlDHSjNPM9B5dSRFNO0YLnNdNTULtbcSEuiC7wJc=;
        b=Ql8D2McCqGfe9aKB/43UCo1BdZvgdXc2TvuvjgY+Uvy/cljeLfVH78L0EtlXi2BuVf
         HZ4naU03SDlMnPVXTS2pvt5bvG9gORIdMNQMiWcCLmwpOd+ve+90skf5o5VXxZKtMjnh
         Av0gZAspJ+vkMoFFRA5Nm3q2lndx3oYqsB4Nh6qHX5ynYwfZxKfbAybvuj0bIEghw2Jf
         GA3ftBNImeAjVd2tcl9V6wQw6WWYWuGStsCBgzK742xOD6pTVqG0AM5J2G0NZkZRGTPF
         DJq6TUsY9My4Od694w5Arl9qSmrGrsztxFx/Hu87Yval15bPNpOGPR/ZsY8lB+gZYhVV
         TTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420218; x=1790025018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GbSlDHSjNPM9B5dSRFNO0YLnNdNTULtbcSEuiC7wJc=;
        b=YAhFYz6VhGqQwdGmrCwG8Bh1OLIrBdcLYx23V0jkOXgAYEWV/yRHWH5XZN8XquXHW/
         CS39YmG55Va3Q18hDdvUHEGkzbmTjtbI+cVluYlLUK7eY/QqGbKINBg1EvJkgmRoPntP
         nqxGqPONNOdB+2xk9AlJpw14CzaNK+jWZb0y7uQSmryLX506oLULlGdNGZTC3wa9cDAN
         c9LYgVjJNhLU8IYD0pfuiWwQXRsSie3L60e0P6VQbbfzk29z7rhmd6YkpWQKaP5x3Vga
         R06LcAuBchPL2wgqB+kfnr1MGnKaMGXzEkM4vnzWAhx0hi6gdhntcmITIW3cj+wUXjmn
         J0gw==
X-Forwarded-Encrypted: i=1; AKwUvBx2w3NP/X1EaeX3PiB3dFY8OZ9xdfZ8YTB5Ar6vgo9pYScIkALvbxXhakQ8Q3R3hDcOzwm6wrraNl4DrDeuB4qE@lists.infradead.org
X-Gm-Message-State: AFuF++kaLu1KZBLOC3NK3Mvw2toZef5EAH3bxy6q1lv3UhEDMiSzQ/wY
	wnnJHdk5y6LO4T2qK4Ueom/6Rq5uLEswEKlpceW0nhHQN/o+S+PywtU+
X-Gm-Gg: AYBFou2/eFuWvkGIcn4on92SyU3rpkT4W59JQfdG9XUKaIp2S+sC7FbVb/MUjOY+LPY
	8pl/7NFLH7tAQ7H2nN0nqdLEcPFg8BIk8zDNoW4GNcQEOdEm8E/3uAfYgNPCD+ycs3lfdhyTmKk
	xz1fPcc66blbLYNVTubkoD/yLBIhoOKbTJtePTCB/04xcqigs5HbHrME8M0LOs8o4vI8kY+at9R
	Zwk91UsbgQ5uNaNHBOzE5bN983HKruOD3r5stCqnnQEDCDKfZcRBsGZIbRP/FXZo6v+ADbcnUIF
	osQB1GnmgW/rkjbhyvBwmruRLhrz0Ata1kR3gG0CodRmP5kyypfBYv9M8OQtHjul3KZvVakQq0A
	bOnmlE1N/oQSaruJ8lpFl6o5/L2FYMql/RnnrSY8W3ypdVsD0qQgiv5wuG+ekySzYVz9HCjdaNU
	F3fjbi2xq9d+Jz85FERcoi8BrQgQF8l0FyAjaQgATtY0pZyJfaM18+OBIJj5qq2I10rX+JQvstX
	1xfxrccOKuebps0Xx8WRzM0dp6XW5Z6R+55sZOCLBis+gtzZsdi77bfU+2N+1zmNtUXhtzjId/H
	1X4UOmf6vEyTfoij4xKgnD3/dz3b5H2u9SiDdmlYF/HDFEi5UlRnCFL6AKdNB3NtrvXaTjvRble
	lBipnpVR2rEe3sSBsoxiA9BoZuWBi
X-Received: by 2002:a05:6820:1893:b0:6b7:8396:f3e3 with SMTP id 006d021491bc7-6c542249981mr2544577eaf.69.1789420218531;
        Mon, 14 Sep 2026 14:10:18 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:10:03 -0600
Subject: [PATCH v6 17/18] mtd: rawnand: sunxi: reduce user-data length
 register accesses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-17-2fb084fe0751@gmail.com>
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
X-CRM114-CacheID: sfid-20260914_141019_585041_42031C67 
X-CRM114-Status: GOOD (  19.27  )
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

DMA reads and writes clear every user-data length register and then
read-modify-write one field at a time. Multiple ECC steps share each
register, so this repeats MMIO accesses to the same words.

Build each register value in memory and write it once, including zero
lengths for unused slots. Reprogram every word for every DMA operation
instead of caching hardware state, so controller resets and switches
between chips need no special cache invalidation.

Share the length encoding with a PIO-specific setter. PIO always uses
hardware slot zero, and its page callbacks clear all length registers
before the chunk loop. Write the slot-zero value directly instead of
reading and modifying the same register for every chunk. Keep the
per-operation clearing so other slots remain zero after DMA fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 75 +++++++++++++++++++++++++--------------
 1 file changed, 48 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 773ba55ecc07..41d6ef31ea3d 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1013,35 +1013,60 @@ static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
 		writel(0, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, i));
 }
 
-static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
-					int len, int hw_step)
+static int sunxi_nfc_user_data_len_code(struct sunxi_nfc *nfc, int len)
 {
-	bool found = false;
-	u32 val;
 	int i;
 
+	for (i = 0; i < nfc->caps->nuser_data_tab; i++) {
+		if (len == nfc->caps->user_data_len_tab[i])
+			return i;
+	}
+
+	dev_warn(nfc->dev, "Unsupported length for user data reg: %d\n", len);
+	return -EINVAL;
+}
+
+static void sunxi_nfc_set_user_data_len_pio(struct sunxi_nfc *nfc, int len)
+{
+	int code;
+
 	/* not all SoCs have this register */
 	if (!nfc->caps->reg_user_data_len)
 		return;
 
-	for (i = 0; i < nfc->caps->nuser_data_tab; i++) {
-		if (len == nfc->caps->user_data_len_tab[i]) {
-			found = true;
-			break;
-		}
-	}
-
-	if (!found) {
-		dev_warn(nfc->dev,
-			 "Unsupported length for user data reg: %d\n", len);
+	code = sunxi_nfc_user_data_len_code(nfc, len);
+	if (code < 0)
 		return;
-	}
 
-	val = readl(nfc->regs + NFC_REG_USER_DATA_LEN(nfc, hw_step));
+	/* PIO uses slot zero; the page callback clears all other slots. */
+	writel(FIELD_PREP(NFC_USER_DATA_LEN_MSK(0), code),
+	       nfc->regs + NFC_REG_USER_DATA_LEN(nfc, 0));
+}
+
+static void sunxi_nfc_set_user_data_len_dma(struct nand_chip *nand,
+					    int first_step, int nchunks)
+{
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
+	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	int first, step, len, code;
+	u32 val;
+
+	if (!nfc->caps->reg_user_data_len)
+		return;
 
-	val &= ~NFC_USER_DATA_LEN_MSK(hw_step);
-	val |= field_prep(NFC_USER_DATA_LEN_MSK(hw_step), i);
-	writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, hw_step));
+	/* Write each packed register once, including zeroes for unused slots. */
+	for (first = 0; first < nfc->caps->max_ecc_steps;
+	     first += NFC_REG_USER_DATA_LEN_CAPACITY) {
+		val = 0;
+		for (step = first; step < nchunks &&
+		     step < first + NFC_REG_USER_DATA_LEN_CAPACITY; step++) {
+			len = sunxi_nfc_user_data_sz(sunxi_nand, first_step + step);
+			code = sunxi_nfc_user_data_len_code(nfc, len);
+			if (code >= 0)
+				val |= field_prep(NFC_USER_DATA_LEN_MSK(step), code);
+		}
+		writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, first));
+	}
 }
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
@@ -1237,7 +1262,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -1554,10 +1579,7 @@ static int sunxi_nfc_hw_ecc_read_batch_dma(struct nand_chip *nand, u8 *buf,
 		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
-	sunxi_nfc_reset_user_data_len(nfc);
-	for (i = 0; i < nchunks; i++)
-		sunxi_nfc_set_user_data_len(nfc,
-					    sunxi_nfc_user_data_sz(sunxi_nand, first_step + i), i);
+	sunxi_nfc_set_user_data_len_dma(nand, first_step, nchunks);
 	/* exec_op() restores the page's spare base during column changes. */
 	if (first_step)
 		writel(mtd->writesize + sunxi_get_oob_offset(sunxi_nand, ecc, first_step),
@@ -1747,7 +1769,7 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, hw_step, bbm, page,
 					    user_data_sz);
 
@@ -2051,7 +2073,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 			goto pio_fallback;
 		}
 
-		sunxi_nfc_reset_user_data_len(nfc);
+		sunxi_nfc_set_user_data_len_dma(nand, first_step, batch_steps);
 		for (i = first_step; i < first_step + batch_steps; i++) {
 			unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
 			int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
@@ -2059,7 +2081,6 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 
 			sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, reg_index, !i,
 							    page, user_data_sz);
-			sunxi_nfc_set_user_data_len(nfc, user_data_sz, i - first_step);
 			reg_index += user_data_sz / 4;
 		}
 

-- 
2.53.0


