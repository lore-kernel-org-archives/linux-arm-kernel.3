Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EF2C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 04:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KdSItwmPertDTRkK8vqVEqMt7TRjoawR0JDQnwMenpk=; b=sK63Si4lL6ZN5eJ/eyGYVGIOFX
	8pCxAPBTYE3SKEmJh8UIxF6fd5Ap2S6Ima0P8lnYeHzjaFhew/OA+9DZgdOhPujgHHuopDn8MnEf8
	ZDgWIgelHoJylGMNi7kD7SbQIdfFPp4OpZA+z3HX0MfmAjDO1X7hJ1icx4z3ia3KvBEwWevxDrewU
	GrdMB/IQ32BjF8S8aLmIx+oI9RRvaH6a87QIz0WQejBNdpZ1A3+gljCLHCw82jretN3M335ft3EIj
	HGPFJarweufMj3oDezPNQcFC0nri9cw3m2EqChAjI5jvkb05xPZm/BKhsE4p7bzpu+wrYw+twP++D
	jUttNs0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bU1-00000001Nlq-1Qnt;
	Sun, 13 Sep 2026 04:06:25 +0000
Received: from mail-oo2-x0c.google.com ([2607:f8b0:4864:31::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bT8-00000001MYf-0vwO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 04:05:33 +0000
Received: by mail-oo2-x0c.google.com with SMTP id 46e09a7af769-804e42309a5so242310a34.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 21:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272329; x=1789877129; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KdSItwmPertDTRkK8vqVEqMt7TRjoawR0JDQnwMenpk=;
        b=oiyjfLqSw6U9sDW9Z922p0v+NJQoy3imv5LV4N4jYy4BgEXLhF6VjVPflQWQdHMSYG
         OKydpTT2ZQvht6R1/TEHPiY7lrMSmSYCBfK5oU3hlC1kRkHgY7d4Hgo6arhIGXBBQLgM
         qmnVgJjSzo5N9tv9oGj44SP6vVJoKSvtHMjSrHC1iXMd7GOkJ1t0EV/3UeG63V0q7ECl
         svN1mo+qmN9zqttVVCoheXeejbZ4JTazLrPqHQFT0xPS9vuC0qsUxZfnkmQs6EfGPGjK
         1n+lWHhYziOxsjb9ykmFTHM3lmZJ5bXjfT+HSBJYDuo1v2MXzELiODfebMiDVYfr5cGA
         jopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272329; x=1789877129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KdSItwmPertDTRkK8vqVEqMt7TRjoawR0JDQnwMenpk=;
        b=HPEDHzu/P3lLtGmxNPZOcbLfhqWTWHSLqRCSJX47fD3iyHImJRoc07T2GRbFg+IYsN
         mdtiLEwrDSgCVj6aAq06z7BGpb8igNGGeV0TTRZM3EGbv+WCY9Xom37fd/1cgcTWDlKF
         tIjQCFYp8qdYFkuJ6UwfPfySJE15Ea0jX1/veI+BL4jZhdvvJve0RVgqdAB7xhrwLH1o
         SNoJQYEUORR6Fqb6n4LhqlhrBAUKKsGluvoDvrkRNho0svJK8dKyMqrRnw/Nhuf5kZRJ
         bqfHf9GMOz3wcPkZYrkf+rDxRkvA61ZK8vulaYSv+jiCc8yqMb7US3mmWlEMiC2bRox0
         fMyg==
X-Forwarded-Encrypted: i=1; AKwUvBxADC56zIqbE+1QdpmF0YiacfJRXdPnQiiW8QQDu7y7Fcvb1zFoYGYiFR3Rkvr0vN80VRGm82JK7vednQm6lxXc@lists.infradead.org
X-Gm-Message-State: AFuF++n3uDHfdjPt7w1mNIuaYNRO16tam1lF2u9O9WKUkDYjba+7JOxD
	WbnB+RakfwpxWVRUyCwbwqevFaxraBSYSoOyCblkQM3VIdHn5ZxCk70w4xoIxQ==
X-Gm-Gg: AYBFou01TW8somHkQAq2e7NpkCsQRXQlDrThR/aDIcxFH5zCpFMKGIk3gv1RsbtZSk9
	mrBLbRP2q6pmKOVvIOjSL/8/xRRu32ADoHRBQzHiOnQzLE9slG7eyWAMGbkcVDmY+gJVoq7aUOg
	ZMXggjBVtsdpAU8edOO3G2qxIGnhOwRAdFARv9oj/wdPEHhptHL9DgoDpPi/s+JSOzfx7LzLqy9
	0fDDIuWF69hQeq0hBvSoibVZDG6xMep94BDpaWV5A9rMCwN8IAsCPOK6FlBFFPRdmqL5zXUdAmK
	Dm+2WJwHXmhIltSyVSWSnvsaRCdY8Q49LfLY1bpvCZ9GiuF8bvg3zpAm/ziJXW1OYrDw0PuCBuV
	5Lfi7vBBNnQgCLd93WYZZXWedoWH5bQRAIYM8Cx6HHFlq0qW7u7YwTkU+cxCNpTUsI1Yyq8qk7g
	XsbTKobp6jjDqNpdN01329LnO2K3kv8rMWttufgqlNYPd5LusdBFQguFCIKDwFHrviiBgghnSqk
	utLl5e0GJx7aP8Hi/N/dAs+G6LYbBsER/7iZyuwPLhVj0BVr5DMgRb37S9bNvL2zS3FTcBelyn6
	Bp4FAnGrK4T9W6VGrF1geYN1X09OlLl7Layp7crKPhjIKMgyBuGGzROnw7cI3yQxoKowP45NZ3Q
	5sp1/YFd38jAWocXX0P9lEhlMpv14gA==
X-Received: by 2002:a05:6820:61e:b0:6b7:46e9:96f5 with SMTP id 006d021491bc7-6c24e672089mr2838753eaf.37.1789272329061;
        Sat, 12 Sep 2026 21:05:29 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:05:06 -0600
Subject: [PATCH v4 15/17] mtd: rawnand: sunxi: reduce user-data length
 register accesses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-15-4a64bed94229@gmail.com>
References: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
In-Reply-To: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
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
X-CRM114-CacheID: sfid-20260912_210530_309074_388C084A 
X-CRM114-Status: GOOD (  19.24  )
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
 drivers/mtd/nand/raw/sunxi_nand.c | 73 +++++++++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 26 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 84e1e04d0743..debef3f4f0dd 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1008,35 +1008,59 @@ static void sunxi_nfc_reset_user_data_len(struct sunxi_nfc *nfc)
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
+static void sunxi_nfc_set_user_data_len_dma(struct nand_chip *nand, int nchunks)
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
+			len = sunxi_nfc_user_data_sz(sunxi_nand, step);
+			code = sunxi_nfc_user_data_len_code(nfc, len);
+			if (code >= 0)
+				val |= field_prep(NFC_USER_DATA_LEN_MSK(step), code);
+		}
+		writel(val, nfc->regs + NFC_REG_USER_DATA_LEN(nfc, first));
+	}
 }
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
@@ -1225,7 +1249,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 	if (ret)
 		return ret;
 
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD | NFC_ECC_OP,
@@ -1536,9 +1560,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
-	sunxi_nfc_reset_user_data_len(nfc);
-	for (i = 0; i < nchunks; i++)
-		sunxi_nfc_set_user_data_len(nfc, sunxi_nfc_user_data_sz(sunxi_nand, i), i);
+	sunxi_nfc_set_user_data_len_dma(nand, nchunks);
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 
@@ -1694,7 +1716,7 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
-	sunxi_nfc_set_user_data_len(nfc, user_data_sz, hw_step);
+	sunxi_nfc_set_user_data_len_pio(nfc, user_data_sz);
 	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, hw_step, bbm, page,
 					    user_data_sz);
 
@@ -1989,7 +2011,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	if (ret)
 		goto pio_fallback;
 
-	sunxi_nfc_reset_user_data_len(nfc);
+	sunxi_nfc_set_user_data_len_dma(nand, ecc->steps);
 	for (i = 0; i < ecc->steps; i++) {
 		unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, i);
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
@@ -1997,7 +2019,6 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 
 		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page,
 						    user_data_sz);
-		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
 	}
 
 	ret = nand_prog_page_begin_op(nand, page, 0, NULL, 0);

-- 
2.53.0


