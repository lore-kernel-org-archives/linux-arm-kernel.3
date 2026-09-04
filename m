Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26ED1C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 21:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9BgbJZzXDYwsOLv3h9k0AMpcw0EOYW2MSapQnfQyB+Y=; b=hhClvzK575IsfN8q9MTduofjMM
	V94mRV1qVTn+/euMFeE4OQkAgEqvO9ZrtkfVlh1fcF5uVakTXj4edoraaNWlgmh6mAZxfOKTklgGm
	JfC82OerHAQuE60bHpsRIxlvOd+ChgDtnK+VVG0A73uAMinmeyafX4HveiEoxu4MTw1cHYjRM7lAV
	r+5I4wNfzsv5/cKpa8g3/ELifr+4/4X6GuKc1TTJy6dy1pblfBoo0SW9m9jBYPYTM0wizq6Klo3KB
	kGa1Wozhirh88x7ReRdy6XKcy1B83EfiPy2+uIT9XmyNRLBAlxiHACCg+6DWY0Ss22Bmk8FgIMCF/
	gPjmiZtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2bNy-00000003Jgv-2TIi;
	Fri, 04 Sep 2026 21:23:46 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2bNr-00000003JcM-10Zd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 21:23:40 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-6b19e291cc6so1154298eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 14:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788557018; x=1789161818; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9BgbJZzXDYwsOLv3h9k0AMpcw0EOYW2MSapQnfQyB+Y=;
        b=UgiplSdaYGsgBDa6c8StG+K2wxGmGfsHX7OdalYNSOpRVoq5nzJNhQlRB2y6kyMTAt
         7lKZEoHfpj0vk9RtIDFDn/qASNFe2QPtBnZahpUmmOr4/rSsp0HsQ73Xtys9lVOQO96G
         THg9ybA67nkLhNxjAgufKDiwkj6LNf+ULNXK9MK1An1pKbixPefQuna6YjeexVqLjCrP
         u5jjrIR5tj3srmctHupibZnZ6jNBThEFC6DfDMN/8Gmv68OBQdGdG8tncoyC14xGYWys
         32sxEISa8vmjn7em/V4Tqs1QFuXxFyr1an6tbMxnv70YMIPMgRuyxM3UrqtRIJWMDMZX
         bmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788557018; x=1789161818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9BgbJZzXDYwsOLv3h9k0AMpcw0EOYW2MSapQnfQyB+Y=;
        b=euGRPxDqjmTWMookBhudOc018dUYYhwdltUDRpT7aU2sOWob49tvRTHkaeZ+9X85ig
         tOCENpBPuMahmosNQcCK/RA5Dzze6Vd72u72oF1g5MwwXX6uvh13QmqzMrg22dFZQhyb
         BacPUB+pulevL86cNN/DqrmfaY39lpFKoUr+/c06jHjRCEVfZjFzL2BgiXYXBBskouIA
         JKIJ/YthYg1Yflz3hix3nPVmsm+uESAQoTjlcdns6BDvbUhqkpgGxwmvY4plKgd4bWiB
         Sq4lp/j0tq3ECWJRzrPPwF0Al9avjQRZRlsBkTqbOakxbCPRwjj3kq+oSP3uIr7B964F
         yNDg==
X-Forwarded-Encrypted: i=1; AKwUvBwzTranG2/YQisAjcEluPY6Do7aBCIMfqjYbWyLm7xo//EbdNsh5q4VzRtBzG+wpm728229Gch5xqq66twF14uf@lists.infradead.org
X-Gm-Message-State: AFuF++mFJlxLX8jb9+ImWS9o6bwKyGmdc3vf+n3G1g09aBdDF7F6Nqmj
	+15w6Egmf68YZppKm9mD/jeSCz9wljIegOFApjvyj94PsiZGPyohSw03SIkSFQ==
X-Gm-Gg: AYBFou0RVP3en2alOJmIZ/3kODbh14d+veIFo4V/7KKUSAfMwBDEhsNzv4UpBl5n7rL
	q0J2P/xGLcs0FuTU+b7prZa1+qrG86W2c0FflOkEPMMZQo0+XXNMoLGgiTNlAs5vVLTxUsMfN5Z
	JSoGQyNQh0OPMVyfDXbOIJE/jhhS0NiHdKbprYuZ8UCQ9fzdCQaECaaKvgy9tNx5j9j0wKctSYJ
	OzZFsP5EbGq6OB7hoYpqrsxDhFpqyAC1QseXsJOvJ74c8alnCjBLq5iCf6W/YnakJacL7TuqLGW
	AhgKDJmKvUZjWhaG3OWrpWynzATwRx1qRyLDtt5KbXF03Qgled8Gz9VotzC4LwmkXcfSaJoMtKH
	dh2/grrJJhNWWJ+iPqwt3bo9nw24AnFUnFPtbwkKgKxRpcguLr4/0pH9/SZhk5Iza+SOZ6qP987
	/sa6KFXUtb5O9EIs6PD2TWIS1jSfTf/QSb8NwO8F4hQrKxjs096/8Ba7MC9HgjLGWgFOqvUgTaJ
	cp/FD5q8QFzMCKfSQX1onv0pu+RyC5xDctF0qgSMsT5xMPgjFTo/hhXnEqEWdSueXeqF03podN/
	Mo5sq4NbWNUeiedmQYFLTk+kcx2wIDHVNeSwDQzZSjtRXfAkcEu0Md8Z5H6d4G5sMb/Rk8pjsXP
	qGfboPioeHHnXzjyXXuI=
X-Received: by 2002:a05:6820:180e:b0:6b1:65ad:3181 with SMTP id 006d021491bc7-6b6fcfd957cmr8410089eaf.16.1788557018080;
        Fri, 04 Sep 2026 14:23:38 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6fasm4492259eaf.3.2026.09.04.14.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:23:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 04 Sep 2026 15:22:13 -0600
Subject: [PATCH v2 3/3] mtd: rawnand: sunxi: select the packed H6/H616 OOB
 layout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-3-b12074f4aca7@gmail.com>
References: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
In-Reply-To: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
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
X-CRM114-CacheID: sfid-20260904_142339_325514_8FC908FB 
X-CRM114-Status: GOOD (  20.79  )
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

The allwinner,randomized-oob property selects the firmware's normal-page
format for the configured controller hardware-ECC geometry. Use four
protected user-data bytes per 1 KiB ECC step, cap the total at 16 bytes,
and assign the entire total to ECC step zero. Reserve the same total before
maximizing ECC strength so the selected strength leaves enough room.

Keep the existing maximized mainline user-data layout when the property
is absent. Older controllers have fixed four-byte user-data registers
whose placement already matches the firmware and need no additional
change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index c1246a9268ca..1265d900fc27 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -224,6 +224,9 @@
 #define USER_DATA_SZ 4
 #define SUNXI_NFC_MAX_USER_DATA_SZ 32
 
+/* The randomized H6/H616 layout packs at most 16 bytes before ECC step 0. */
+#define SUNXI_NFC_H6_MAX_USER_DATA_SZ 16
+
 /**
  * struct sunxi_nand_chip_sel - stores information related to NAND Chip Select
  *
@@ -2037,8 +2040,14 @@ static void sunxi_nand_detach_chip(struct nand_chip *nand)
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
@@ -2054,6 +2063,12 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
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
@@ -2111,6 +2126,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 				bytes -= 2;
 
 			bytes -= total_user_data_sz;
+		} else if (sunxi_nand->randomized_oob) {
+			total_user_data_sz =
+				sunxi_nfc_h6_user_data_sz(nsectors);
+			bytes -= total_user_data_sz;
 		} else {
 			/*
 			 * User-data lengths are encoded in four-byte units. Reserve
@@ -2177,12 +2196,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	nsectors = mtd->writesize / ecc->size;
 
 	/*
-	 * The rationale for variable data length is to prioritize maximum ECC
-	 * strength, and then use the remaining space for user data.
+	 * The default variable-length layout prioritizes maximum ECC strength,
+	 * then uses the remaining space for user data.
 	 */
 	if (nfc->caps->reg_user_data_len) {
-		ret = sunxi_nfc_maximize_user_data(nand, mtd->oobsize,
-						   ecc->bytes, nsectors);
+		ret = sunxi_nfc_init_user_data(nand, mtd->oobsize,
+					       ecc->bytes, nsectors);
 		if (ret)
 			return ret;
 	}

-- 
2.53.0


