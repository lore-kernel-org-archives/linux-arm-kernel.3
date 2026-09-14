Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B71EC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 03:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wD0VAfBnkJ1JCjUlJIh8uFV9v+cdt2HXmo4JRu4mOC0=; b=Q7FDz4FUnPMTZacgX7s+LM/A7e
	fB9pK9YciFFu/hfpSDsqIjCG576J1hfAcgu0qNdbX436XByuvxs8ohM1UF0zgJK7NRJUO1/41jjRJ
	yNgKnB7eZlbS5T87252IfYmT6MsC/4twRLspuuI6VymXcoOzKERf5Axs0qWJKps6AV36lrpu1dHy8
	a7E0rDnk2X4/p4sOYyNx8XVVfcj5f/WNtv9bF3CDWe8XIJ2/Vk1xdalRCL3KB1cJSb2DnA5nAfh/h
	jSE5Z8AGbxM5spLBFL4lRsfj6iOu9VN7LBKLyRx8rX2gvQnvL9tUTkmKxdwkNseQfFpia9lZUZX7+
	1YngFW7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wy3-00000002EM9-2OZy;
	Mon, 14 Sep 2026 03:02:51 +0000
Received: from mail-oo2-x0e.google.com ([2607:f8b0:4864:31::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wxE-00000002Cwr-09cO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 03:02:05 +0000
Received: by mail-oo2-x0e.google.com with SMTP id 46e09a7af769-7f4f0dd550aso216251a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 20:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354919; x=1789959719; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wD0VAfBnkJ1JCjUlJIh8uFV9v+cdt2HXmo4JRu4mOC0=;
        b=RvCCtZTu8QOMxZuG64EEUbHWZ6Nnl58eSCaWVrvhtWe4IjnRJTFS2TU2LAbO/3N9JF
         YtDDf/24gXziqwz6yMxZU2B9sUf8LZDb2v5G1/+bCtZJInksqoBW/BA08//PdPziKGIx
         HZ24+qCz9/pRA4q/wmjS5Ymoc5Gz+203lQBeWiiJ2wTTmm2ZYHFQn3lKniHf4MUV1EdN
         h0t999/v3Gfas8oWbrX5UApFH3Xr6DCrHEJlNhHOTiUvVon0KSpnBiR60bBBdzXS02lm
         DY8DG3YVLnFyremQpHcHUOzVX0X49keT+1OvqyQsvDTvlUZHrTSAPGtyh1tLERftMiDM
         hFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354919; x=1789959719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wD0VAfBnkJ1JCjUlJIh8uFV9v+cdt2HXmo4JRu4mOC0=;
        b=olSOvTyZN1FVM2TpdkJtmhbvKhGIxMu2ftBiRbEsfBUn7bz/FEkhf4JLa/sIlvvGQY
         j76ls/BK+6RqwM0V6m41uduHGJ/plpsmXj961PdcBkrs2pL2w2LI2dnh4y0QQDJcCN6v
         QudPk6YKzimPxV9XqoSUCgwEPulH4aEajmtZWR8N7xi0DI++BiZHKkXo2Ha7LkZ71kOW
         lO6Ahjv/WB8YVN7qLca5gJWsL1iH05ioH6aq3+nAKvJEZiocKcj0+30E+xqeSPrCSSA6
         kE9DP52RLz8r9zmgBG/vZzDW3WowWpFcMGEBlGCDtvxtSCGEH88fWy37EiQOf4PcvbrZ
         +CVA==
X-Forwarded-Encrypted: i=1; AKwUvBwahgNddtTd3AuMw/v9oj7Y8WwenVeWVyrnZsb6NKxTxZCQkzg70oLdp093PRmqn1eAnHanEVAndog78EMYKuNj@lists.infradead.org
X-Gm-Message-State: AFuF++l3HVVKya+CmZoVrTAHyby8QC2bX1Ieg4YPSlNYf2G5xoyM/pv7
	n2H2ZjrEuX3gNBzIMmaFgfJno8Nilh0Wbv6QRusf519m+6R5s8vgWmVr
X-Gm-Gg: AYBFou1MXRc3RGegBV8tIW12Img+zFkoPPOH6cRAt6w9DIHd1oxN0KHVdUWV8iEEYxm
	WZVESfHihOwliHu000FKgn/qar7P7xEyt/U+gOlqiM3j8rn8I/oOaXOVdtmmmqbfLTWE72os2fm
	KvSVfBM9091IieFbUCuKmM/MxyzDt27+FyhGuVae2inlSpZH5E7UtHz2YOeOi33y4nsIzsZ0V8m
	U67acrd4sMpLofAdOSMxpHMMbn4KU0ztkpMup3WxTl7wh/26reMrfC8FQJ6wOOG/HeIrPPl9/7K
	wnjRC2KZ99/RWupncN68ps+FmWGd9fWb3fcUFPvpJv0FtyqYVenJua2MOBjV7gPPYmwttexwL7l
	44uUntRfjNzeMgnnyX2KGzd+9FYwSygBJwsh8gJzkcjBU+nZQssfp9jFYh+2BmTzoHS/JzDOpCB
	kZlLeMM8VIX91jox7YUPCZNqjk9YGHOZ0RLGcVN7G9Gitb6m16gUJByo7t72Nv2tOIo2HJZX87r
	i5e2Kg8NSTlP89dGiwl4yRc2kTq2ZZchI2RqsqRjCZPWmHeiJWwooNZFIIJlwq/k9i5kKHHP0U2
	6v8+N7keV4+8uJE/WnfO3HnwX3cciSYVz/VHzmnamt9EaXSCpjTie16p4+MhDQbCggezvHWAs3f
	wmY/m9u1zMVZMrvKhIYWTITSMd7CJHA==
X-Received: by 2002:a05:6830:67ca:b0:800:bca4:5626 with SMTP id 46e09a7af769-80899266b51mr285872a34.19.1789354919239;
        Sun, 13 Sep 2026 20:01:59 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:20 -0600
Subject: [PATCH v5 14/18] mtd: rawnand: sunxi: select the packed H6/H616
 OOB layout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-14-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
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
X-CRM114-CacheID: sfid-20260913_200201_527958_D50B0C81 
X-CRM114-Status: GOOD (  20.47  )
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
index 0375930042ef..3fb61a10a441 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -225,6 +225,9 @@
 #define USER_DATA_SZ 4
 #define SUNXI_NFC_MAX_USER_DATA_SZ 32
 
+/* The randomized H6/H616 layout packs at most 16 bytes before ECC step 0. */
+#define SUNXI_NFC_H6_MAX_USER_DATA_SZ 16
+
 /**
  * struct sunxi_nand_chip_sel - stores information related to NAND Chip Select
  *
@@ -2417,8 +2420,14 @@ static void sunxi_nand_detach_chip(struct nand_chip *nand)
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
@@ -2434,6 +2443,12 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
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
@@ -2494,6 +2509,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 				bytes -= 2;
 
 			bytes -= total_user_data_sz;
+		} else if (sunxi_nand->randomized_oob) {
+			total_user_data_sz =
+				sunxi_nfc_h6_user_data_sz(nsectors);
+			bytes -= total_user_data_sz;
 		} else {
 			/*
 			 * User-data lengths are encoded in four-byte units. Reserve
@@ -2564,12 +2583,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
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


