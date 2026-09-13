Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E47BC88E40
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 04:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2jxU2MaLD6ynlliV/V4nmXeQrG06Mf6j7bRrOAd0XuY=; b=VIH1yq7FP9wVB2t+ySxWzJ1KDi
	rXYZkboiXDkSgizLyOMOA9kRaYiJyw0Ct+NaTuSIhpLvjofSNpjeKuLYOuM30hdOcmmtwOeuXxz/+
	c3d1B9XCuklsjoAg1FYxXWNLuGQklDYao5lkN2cB3DlQN3C9PqVwltptFgJUv69n3a/jXYWxT899j
	zKdae5Bof4XfGTSlRqyv/N+ok5qXXV/M90UXDrDT11bomzl/J46c1DV6K5m37qqFBVDLg3AUEmERC
	lJ31fyn38SJN8rfL9r2qz7Phz3KjTz3m7W3BPPKNRyIKqN49v6hJ1TXaMVBiIVjRLDxDnj29JeYrl
	2bVxk4Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bSx-00000001MI4-1nhV;
	Sun, 13 Sep 2026 04:05:19 +0000
Received: from mail-oi2-x10.google.com ([2607:f8b0:4864:32::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bSp-00000001MB6-1Kfr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 04:05:12 +0000
Received: by mail-oi2-x10.google.com with SMTP id 5614622812f47-4b37a36887bso615211b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 21:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272310; x=1789877110; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2jxU2MaLD6ynlliV/V4nmXeQrG06Mf6j7bRrOAd0XuY=;
        b=AwErAS7z9wNczsPRc6xedQjOhDKGtHSUby29FMfWRrrrtBmn5nZ3i7SXWeUNxTwJ+u
         Z+1G0sfHgQI3jf7n+dYDB3uV4yuhmBS9+r68m9Pk0JaBc+QBYqJFPTds2xEObPN9h7wA
         7vmEI4uHIzkZy3cFTOmRVB8YGDpv08q/UWoFIlBEOgbApGWjxDlr3Ltq7GHhd89FbSj7
         IRU62WJKaMnOCWVdhfUVYlCex0j5O5B14iNeeelAxK6AxKMXfNvVEjooq+3TYZb7LQMa
         VOSelcPTrmHWCJa8gKmUSRzRtikVRaYbt/xFWaflx9Jgurr9TRtmEUe3LGppaRIZNIqk
         /ipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272310; x=1789877110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2jxU2MaLD6ynlliV/V4nmXeQrG06Mf6j7bRrOAd0XuY=;
        b=UfrjBnqIwJrE3/idFemRzSOxpo1yO6MKNEDW/zdSHLWf69SKkps3hgyAHbeSGVRE/m
         rJBXgmiCz/IyH2nQlE8Ue9SpT38/7zwNLT0y2LvSlmdMC3eK2aRr+Y/WOltLLeY/5iBI
         iERi0cRsKrS5EFLa3CMG/A5wRViPWJzdNOimkIIkYNoJVgc6s++NSku1gXIdyJXWcpGA
         Rvnexn6l6Sxco1YUsznDoWe4Ycto0HpNuTW3m4IeqeIGeokJrDk1A9PbxCxLWsUYt2ZR
         ZYzzQUCQaxIxpoaN0AuFwu7U+QAEhT5iNqmMWg3ZdVfQRxNLo//LvwoIGXt7x3xLQRuz
         MQjA==
X-Forwarded-Encrypted: i=1; AKwUvBzsNTppYCxC6r6a2gId56c+Le0hoUxXzOnGb+zsXTPPYg7hfc/DUGwKKV5pP2QTxMju3cUl6Bu8RObhMRvJKCLh@lists.infradead.org
X-Gm-Message-State: AFuF++lRXR/QWJG6qoiull4HgDA/noWXdH2tnOo/W0eKmHgdQJvmjQkx
	nx2Q3KvdZfJHil6rZCqtBxpjySM4yxRd25XMlsHvO4A3UZ2sOxCdKzfM7uaY4g==
X-Gm-Gg: AYBFou2fOoESsMNI2ALzkiuQIjTayDOaw8ZZRAKt638wTkxofpRn3vtk1JgkSrNxGe4
	MWIDrKKRvJewjaLY/hUg2/gxqJtRzFuXE2HeWgHdz2EwlJSrUkqhKw5TOevELGeCdVCnUysXO64
	NHeUo4gKxGR0kJj6dDi8TGQyrwatOvPbZZAF88gfKGsdwvzD8iHas7mx0VwvCvVxFk1caOuk+Qs
	Q7EDQKIxhZoBZS6+ett4DQ1YaEJEYCMFIrlGAYCn5iweM4VeHXVAi7weDxfLCWr3nwAXOhFxjbz
	4BJbK7TyoS2I17MLC0GcPrJhFdipCfdcY8pnG3e8X0dFmg18tgE0Ek64WEmm+yIQc8FAs5WELTh
	hKqxekhnt2RzDfNKpcUeaYY8dNhnzeMRPfU4zYf1oerRxT9duMPMQyBJqc2DrmC5Q9ddsPCeKXh
	5QZ8EwD224zcsQkYvicyz+SGSqfkDnYCP57ruJ6IRkII+FUVt79qnM6s1gbPbjr1XuJQtla3jcv
	TAYSWFyj7QwusVSzwEwm2HZJA9Q/yRsmVNesxKjz6uJp4BTAxgduxb6KAdIV2Pm5WDRCnuMSRX7
	qrJsz58NDVxMdwM5AGE9qk2lgYSvuRSEks6y3SL8UYCKxOYZPR/w+0WArbbQheoHCHr/tn8IKjL
	SvSQWg1TDIh8QB1UqlGQMVHwu4pXIhQ==
X-Received: by 2002:a05:6808:13cc:b0:4b9:a8ac:489 with SMTP id 5614622812f47-4c31c8306c5mr7319934b6e.39.1789272310145;
        Sat, 12 Sep 2026 21:05:10 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:04:53 -0600
Subject: [PATCH v4 02/17] mtd: rawnand: sunxi: use the logical step's OOB
 length in PIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-2-4a64bed94229@gmail.com>
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
X-CRM114-CacheID: sfid-20260912_210511_369312_2E5220CE 
X-CRM114-Status: GOOD (  14.24  )
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

PIO transfers always use hardware ECC slot zero, even when transferring a
later logical step. The user-data length programmed into that slot can
differ from the first step's length on H6/H616 controllers.

The ECC correction and protected-OOB write helpers instead derive the
length from the hardware slot. Pattern handling can consequently fill
beyond the current step's OOB region, including beyond the page's OOB
buffer for its last step. Writes can also fetch bytes outside the current
step's protected user data.

Pass the logical step's user-data length to both helpers, as the protected
OOB read helper already does. Keep the hardware slot for register access.
DMA callers pass their existing per-step length, without changing the
on-flash layout.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index e50cf5b6a730..172c7c4b0ba6 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1011,11 +1011,11 @@ static void sunxi_nfc_set_user_data_len(struct sunxi_nfc *nfc,
 
 static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 						const u8 *oob, int step,
-						bool bbm, int page)
+						bool bbm, int page,
+						unsigned int user_data_sz)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	u8 user_data[SUNXI_NFC_MAX_USER_DATA_SZ] = {};
 
 	/* Randomize the Bad Block Marker. */
@@ -1069,11 +1069,9 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 
 static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 				    int step, u32 status, u32 pattern_found,
-				    bool *erased)
+				    unsigned int user_data_sz, bool *erased)
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
-	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, step);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	u32 tmp;
 
@@ -1155,7 +1153,7 @@ static int sunxi_nfc_hw_ecc_read_chunk(struct nand_chip *nand,
 
 	ret = sunxi_nfc_hw_ecc_correct(nand, data, oob_required ? oob : NULL,
 				       nfc_step, readl(nfc->regs + NFC_REG_ECC_ST),
-				       pattern_found, &erased);
+				       pattern_found, user_data_sz, &erased);
 	if (erased)
 		return 1;
 
@@ -1323,7 +1321,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		ret = sunxi_nfc_hw_ecc_correct(nand, randomized ? data : NULL,
 					       oob_required ? oob : NULL,
 					       i, status, pattern_found,
-					       &erased);
+					       user_data_sz, &erased);
 
 		/* ECC errors are handled in the second loop. */
 		if (ret < 0)
@@ -1420,7 +1418,8 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
 	sunxi_nfc_randomizer_config(nand, page, false);
 	sunxi_nfc_randomizer_enable(nand);
 	sunxi_nfc_set_user_data_len(nfc, user_data_sz, nfc_step);
-	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page);
+	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, nfc_step, bbm, page,
+					    user_data_sz);
 
 	writel(NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD |
 	       NFC_ACCESS_DIR | NFC_ECC_OP,
@@ -1684,7 +1683,8 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		int oob_off = sunxi_get_oob_offset(sunxi_nand, ecc, i);
 		const u8 *oob = nand->oob_poi + oob_off;
 
-		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page);
+		sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, i, !i, page,
+						    user_data_sz);
 		sunxi_nfc_set_user_data_len(nfc, user_data_sz, i);
 	}
 

-- 
2.53.0


