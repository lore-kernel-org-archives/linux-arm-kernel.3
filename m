Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36858C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 23:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WTW3rnTf6gNY3ga4NJ5kmbTdCiFHL1I5Sk6ssF2oGp8=; b=3RH67GBCOV3M+9A/M6Pk2Z6Jce
	LLSFusH4j58Pckv90j4ILL01gHoxchzA1fqj3fQjlddDJDM6sL+FdLXa0hOSLouoGFV+y9Lg452J6
	F0LyjNacakxsa7XYHJOeQC/8QNGsx5zq4kTIBkr23IRKqeiHOxjvsOSzHOUSQB6V383KhE9ZAUm7+
	T74qgmer12SWX0s0WM7JzTAslA0IH81DLXUHCagk56TJlmWnCo6ssEPSyv4MzViLjvooCASyYh34K
	DLpp5kyfj6J41Y9xzIlQpC52hfWNr10zHhIgmStLNvE0h2rLDPst+hQj5vk4w6qseCa0AfF3XZLPG
	VWiBYzjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtZ3N-0000000D0L7-2fcy;
	Mon, 10 Aug 2026 23:05:09 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtZ3J-0000000D0Hq-3u1Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 23:05:08 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-7e9ecb1e13cso2526304a34.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 16:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786403105; x=1787007905; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WTW3rnTf6gNY3ga4NJ5kmbTdCiFHL1I5Sk6ssF2oGp8=;
        b=QPUhqq1NRM9lg2Su7ep1LBckh5HyQZ6OXfo/PpxIY/evxnYiN3MVl44oeD+WZlt0HL
         YCwyODkXNno06z6YtF4pDDR26wIwTrrfHfq96YCrAKgqSGZIX9xrp1SDj8ZWnvm5okPy
         97Z6z2IHZnGJN5QT5Fv82WNjHB6wsCTuR9428OxMvSjjG2zHCVjr4MQKRQJe2QQ2ExsH
         kcOJ+mmXJUJGbvoghsB8RD15k41GNiOu1C1rYnre0ItU/SvcWd24xdNAhh+P9fApGmXq
         s5uVSobjJIae4oMqxfd89tcjPXmXcU1UZocBFiYdONUbBG81H6+K1BqoeCT6a64Ms6+B
         9Beg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786403105; x=1787007905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WTW3rnTf6gNY3ga4NJ5kmbTdCiFHL1I5Sk6ssF2oGp8=;
        b=KWquMnyjzPXj+cq2HC1GM7SmQ01aREtvKdbG3j6mQzXIogpGkC9kl/f41UqDDHQgRB
         DxdNQH5Ox08utdTZukOunS/Nt2g/4DKUudbXURGFspQq4HPZrCeqDx9czjGJQ7oDXsJk
         NNBsIHK0TskF/J+6GLQdjaQCDGRgpiDWd5ncEr3xYcaXUMI+AaselqVtlDQsDelXM7uV
         D/Poc7ogV7J05myi9ZljplVj5qk7vzQyZ5kMZ5m3asiBJV697KCmhB+qOearSqhxurMs
         oa1lB4GYadLWt5qRRsQVn205S0W14dpuJJhBcI4b56fL1NYiuVSz7pDDXn6SWvCtXQPg
         5jyg==
X-Forwarded-Encrypted: i=1; AHgh+Rp9aX+xBpDRZWm3TaEoEb687k/asyiduMsONZ15Ic6jRSSA+ybb/yFoMP65FLmOQWgT7auO0CsoosgXZ6D8ejdu@lists.infradead.org
X-Gm-Message-State: AOJu0YxJHH31CgVBQQ9P6Q7hIKaBFRNPLjjyxiJ9dyk9awfywOdFXXNN
	c/Iy8gOadrXiSDgHDGXKd6/EIcJWfjgiNcjLFP2+ljCIqZGfMfHfVRok
X-Gm-Gg: AR+sD13m1qqe01ITbeh5QtgC4/LPUnbe6+/NN2u4aoinJ4Dn1RtCciamLXtd990Vb0N
	hcvcza1K0CSbpKiOqZVloNWS2J4i6EyFPKYegJPMg5R7cmLr3fAqcJgFwkHYQHctz5xSOaWHEGb
	FoSv4D2QS+3YGuL6q6KMSEua++iEK6mvop8ND4imlvBK+8fnY83ufD5O3/HhHrFHwMfmUebAAUR
	d6s/DG4jF7MqsrTkzgYHJpa/x0kzQJII1zfSUzMY5r3RHFILAUPtPHiICwFH1EMpm9af9LsQLmn
	lNeN95CbV9GRUjySQoxFdBiAYSjmRofT5HXz5KCnGuvgIsvqHqkrin0Sc5xs93v4cLYFp1IgKBo
	P0d7JBzKoQA6PrvEIx48i0pr8eRMLo61Gu/j6ZYFZFvmncXLIO8Dn+ukw1yncqazY8iv6n3qdFB
	iBxOIlZZ5CFY+uHSonucc6g0ouE40ReTYZU1LP727ZzZfrwAsdIL84VKshU+6knyhFiTxgLEw5b
	xWkl2VrHRDIIEqTOLHRe4QraSa1uUB+gW62ZyPqEjRRDFEzx9H7VIlnYBjDBICj7yXW2D+9GPaZ
	8c5MEGaqXKTR54yr5zABh3gpy0WsIgx5DErsz67pjvvijiWFPXgTualaCN54C04AZM+NnEu02jG
	9/RCmJeYqwDGMTBdzSw==
X-Received: by 2002:a05:6830:3591:b0:7e9:e5c0:e0a with SMTP id 46e09a7af769-7f39a872f1cmr4107850a34.5.1786403104757;
        Mon, 10 Aug 2026 16:05:04 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f35b5a7616sm8921584a34.8.2026.08.10.16.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 16:05:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 10 Aug 2026 17:04:51 -0600
Subject: [PATCH 3/3] mtd: rawnand: sunxi: select the packed H6/H616 OOB
 layout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-3-463853a14ad9@gmail.com>
References: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
In-Reply-To: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_160505_986655_2ACF9BE1 
X-CRM114-Status: GOOD (  20.84  )
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

The H6/H616 controller can configure a separate protected user-data
length for every ECC step. Mainline fills all space left after ECC with
user data. This changes the physical ECC offsets from those used by
Allwinner NAND firmware, so pages written by one layout cannot be
decoded with the other.

The allwinner,randomized-oob property selects the randomized normal-page
OOB format. When it is present on H6/H616, use four protected user-data
bytes per 1 KiB ECC step, cap the total at 16 bytes, and assign the
entire total to ECC step zero. Reserve the same total before maximizing
ECC strength so the selected strength leaves enough room.

Keep the existing maximized mainline user-data layout when the property
is absent. Older controllers have fixed four-byte user-data registers
and need no additional placement change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 92b26371a6d1..2388cc361685 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -223,6 +223,9 @@
  */
 #define USER_DATA_SZ 4
 
+/* The randomized H6/H616 layout packs at most 16 bytes before ECC step 0. */
+#define SUNXI_NFC_H6_MAX_USER_DATA_SZ 16
+
 /**
  * struct sunxi_nand_chip_sel - stores information related to NAND Chip Select
  *
@@ -2036,8 +2039,14 @@ static void sunxi_nand_detach_chip(struct nand_chip *nand)
 	sunxi_nand->user_data_bytes = NULL;
 }
 
-static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize,
-					int ecc_bytes, int nsectors)
+static unsigned int sunxi_nfc_h6_user_data_sz(int nsectors)
+{
+	return min(nsectors * USER_DATA_SZ,
+		   SUNXI_NFC_H6_MAX_USER_DATA_SZ);
+}
+
+static int sunxi_nfc_init_user_data(struct nand_chip *nand, uint32_t oobsize,
+				    int ecc_bytes, int nsectors)
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
@@ -2050,6 +2059,12 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
 	if (!sunxi_nand->user_data_bytes)
 		return -ENOMEM;
 
+	if (sunxi_nand->randomized_oob) {
+		sunxi_nand->user_data_bytes[0] =
+			sunxi_nfc_h6_user_data_sz(nsectors);
+		return 0;
+	}
+
 	for (step = 0; (step < nsectors) && (remaining_bytes > 0); step++) {
 		for (i = 0; i < c->nuser_data_tab; i++) {
 			if (c->user_data_len_tab[i] > remaining_bytes)
@@ -2104,6 +2119,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 				bytes -= 2;
 
 			bytes -= total_user_data_sz;
+		} else if (sunxi_nand->randomized_oob) {
+			total_user_data_sz =
+				sunxi_nfc_h6_user_data_sz(nsectors);
+			bytes -= total_user_data_sz;
 		} else {
 			/*
 			 * remove at least the BBM size before computing the
@@ -2170,12 +2189,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	nsectors = mtd->writesize / ecc->size;
 
 	/*
-	 * The rationale for variable data length is to prioritize maximum ECC
-	 * strength, and then use the remaining space for user data.
+	 * The default variable-length layout prioritizes maximum ECC strength,
+	 * then uses the remaining space for user data.
 	 */
 	if (nfc->caps->reg_user_data_len)
-		sunxi_nfc_maximize_user_data(nand, mtd->oobsize, ecc->bytes,
-					     nsectors);
+		sunxi_nfc_init_user_data(nand, mtd->oobsize, ecc->bytes,
+					 nsectors);
 
 	if (total_user_data_sz == 0)
 		for (i = 0; i < nsectors; i++)

-- 
2.53.0


