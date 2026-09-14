Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A21AC88E7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 21:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDb8CvIky7fTL8ZHKUM7VSBHzZxqYVS0jxwrplOkME4=; b=j6o9nyuxg3KMfQFN3evyQUnhLD
	8f2OuWZy5PEfWiRpFGU2PBqph3W2BIikW+sd9+ey8tHMALf7FtGH5mx4QE4QGngrDiB4bVCJNHytG
	K/ZYmATVV3/nt/DgoSxVnHgsg3+h50iLZkbi87J0xKSfaXRA1Zz3h3Pgp/CEtwJTFNefo8Idfx9Nx
	PJUhik+Hs6vSFDgPvdj6S8UTI/qbOzJpIPY0q/J2IVRKW7U/GjTA0uY6F6dwDmxDllB8ekxNl9gE8
	IWBhQQXGMzLR+7XX4goWazqGpt4DXiG86/dxLxL8YwS3UvaiRS+zwCBXZy2cXQWqrT3O+OCJv9ZCz
	TA7Fztfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dy1-00000004hJL-0tXN;
	Mon, 14 Sep 2026 21:11:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DxS-00000004h7r-1Ob4
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Sep 2026 21:11:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=FDb8CvIky7fTL8ZHKUM7VSBHzZxqYVS0jxwrplOkME4=; b=lcKzo45or7ihK5KTzJsUy6QDPd
	Ht1rJaCr6XKY79mOFvoYLQRlMi2Tuwb2WMXag0dQtriZZWW89tHTtiXoNjmQgsp4LEa0C/4pp3vMG
	aK0dq62r4ldvCG0J4bPZiJvhVfrHxBXmLS/OM1kI1Gu3+1D0C+lm9nA/c2sViZREkMVSNYlSEPxAQ
	DwYxDMK9OWbTkmP6RjgQQz5gT99IRNRlzcsLAdodSYfN/TqajzVijYeR+LgRMfHe/QrrwOG9Y8RpC
	uVvnhRcE36O79X6OWa5XGvFlwOqd2SBFfhXwxNUlGotv9FwGiovDPvhYiBchRqh4be9XBJ7iyYQ7/
	G8b/bSmQ==;
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6DwR-000000061hT-0DGY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 21:10:58 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-6c20a9c464fso2484093eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 14:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420214; x=1790025014; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FDb8CvIky7fTL8ZHKUM7VSBHzZxqYVS0jxwrplOkME4=;
        b=fm/uJ5MlNZXHPBNgZwckyoKfYnSPAHfw74zfvELNvQpoMgL+obFghspS2ol2WXzoNj
         OEWaGOTEeJ+a+m+2htFXMMeUX1MLH8HQ5+7HzMWCkalPg/DaJZgibctYBDqeOAx6AlTH
         Dq9DYJYxGrE1C6DD7cqkkcN98Bb+lzm/iOpbUwORSUrcr5Rj7yyIoVxC26bwqmz3/Mpe
         QXbPRD6jB2R7F3AR6bHRpeeZvLdL6Vz1L+JloRBoj4gxCSBLwZu77E2kfLK14E4zyb2r
         OFxPgs1aMzHS/ZaUKTo6Xh8iO0eriFoDl/dIPgkUe3RGl7RA+No0nv9op1vqav9fm5rR
         WoPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420214; x=1790025014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FDb8CvIky7fTL8ZHKUM7VSBHzZxqYVS0jxwrplOkME4=;
        b=r4qUAWgWE6rqidNJqZcFCyPy6CcAeX5adTgrVUuKameIkQ7jOE52FAaX/YTVdwfhwd
         KDyMkWHstf+6BFCQsSmb5FN+ZmbpLJ8LDbJ9S9fuQjffIKVYWGMkiUq+1xr2DQh8QORU
         Cgo7X75ij5J2keZ63Q8fg1FXn5ayo9YqmXxzRtik9pj+A4J/DrjW3wHj4o0oHcOdD3Bt
         EaiMr+oKP4BrFN4mV6xm24oNIPyWUD3f470Mtz0oshYuGfxboHLaM/3CWzSWsXL66PbT
         YKeNaO9lG88V+bnVoi7kLQJfBUJwcG2nENLHWu5AXyAKxfeXsUvAV4jEtRUJCNnofLeA
         OhEQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3gPBj/bT9tcD5Mu54Y2GGCqzpBejenpLRX5HBJgDZDUPBx/yq96lxiKzP0/UZJ/PiWl4Wjpas0L1YvZkbGHuZ@lists.infradead.org
X-Gm-Message-State: AFuF++l6dk31AccSLWU/VEG/1GVNmQib4CiscOD1h3qyLbFqfYmOabth
	ywzqp/ft316Q9rkK4WZTk5yfgFIB2nUT2J2NSwbw5t1KZdI2be9z8fDf
X-Gm-Gg: AYBFou3JUhHTV07i7qCgEh43UTASzpi82C6JJLE0Jkkv4g8gNwC8tT2oMjO3Q/iMcu6
	xD3H8tztoZPGb0DM1SZEWMOZ2rF3+OogemrIrOJ0jtV9zvrstnuowox/09uEVzA3slKMjT21TOY
	219Q+kisTIbPJ3RbACEvU2Q9Q6V3fY7UrUof/e9DYWRxs860t7yAykqzVjtaI9OpCUuPa01QL50
	QjfTqBIb7kntqrUGswIXnXG1r12w41HO7ymMpyLr7vO2LzmIC/WzDDJqUwksSqSRfE2yjoO5gFK
	3kJJJ8Ro1+pLfm69ilLafKuZmDkPdJ0Ta+VE0zm3JRur7RRbpT+0KZT1X481pi6lW6EsEMoogIQ
	Ys9GvZtobFMevVFGWzQ5hUsnV+NCms1TtWxaQAHvvaUXK2tEF7FPiDS/zHn3RQiFSnNdVIXQ1l3
	9WCT9PGB9gVgXLk03AnW5NCP483+kxpT/eY75w8PTTi43GDpDdTKg2V3xnkSjUeAGl9Cbze4J25
	Pkuo6uBCFuu13eXtzjVpiSXUaFagE0pBVXCCR/nerfXQfuz5GvBZu4u8JsEkmuswyeNCDk8nCUj
	frmLBtiaRz1aYtTMTjuwzeA7/rDsVYRULzHaxYIfpqUz5hdyf29MHl04iMUL0+WD0BheIiLpcdX
	dg3KNIAK9waRW2Ojn67HNPCkwOEja8+hxquQ1mXk=
X-Received: by 2002:a05:6820:200c:b0:6b7:83c5:fdf7 with SMTP id 006d021491bc7-6c5451a9095mr2847169eaf.56.1789420214324;
        Mon, 14 Sep 2026 14:10:14 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:10:00 -0600
Subject: [PATCH v6 14/18] mtd: rawnand: sunxi: select the packed H6/H616
 OOB layout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-14-2fb084fe0751@gmail.com>
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
X-CRM114-CacheID: sfid-20260914_221035_124084_353A475D 
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
index 42c5f782db40..8b0d0620e1d9 100644
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
@@ -2431,8 +2434,14 @@ static void sunxi_nand_detach_chip(struct nand_chip *nand)
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
@@ -2448,6 +2457,12 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
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
@@ -2508,6 +2523,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 				bytes -= 2;
 
 			bytes -= total_user_data_sz;
+		} else if (sunxi_nand->randomized_oob) {
+			total_user_data_sz =
+				sunxi_nfc_h6_user_data_sz(nsectors);
+			bytes -= total_user_data_sz;
 		} else {
 			/*
 			 * User-data lengths are encoded in four-byte units. Reserve
@@ -2578,12 +2597,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
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


