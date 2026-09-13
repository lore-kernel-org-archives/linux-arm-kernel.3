Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9069C88E40
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 04:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3fsd5mFSYNbCICE0q+20FvucYtRM3opmhA2nF/SNd8=; b=FhGGPRaPQf6Fp5l+H+Kn/lBwBg
	dzYc0K2odJ+HmKdLLWEK39xpBv/YUvOH+ONnLcqxirqStfir7Q1k9GT9P91byKWCZk6XG4NG94IjF
	0GwDwj6sS5trFTlo99C0R/b6codyCa0X+4O87yxb+BYByGGNJYE8beRIyM7RFpYQ5RBfoVztRpM9I
	hBKLfPwPGh7VQu/VpbdS4JVmEcFQRWOYFQgP+UJGeu31poX80CoKUaWvmKFD7hRIhAm4xkQT6cSET
	diHJbYd4Uu6pDHDPQOQS/59ZJaDOxeEvbAHA71FE4roRiZ/EKAewZmWQNLuly8VlW07SlEh6PF/NG
	Ro+F+6mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bTs-00000001NXH-0fIe;
	Sun, 13 Sep 2026 04:06:16 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bT7-00000001MXA-1K4a
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 04:05:32 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-495c49f8eccso2539216b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 21:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272328; x=1789877128; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l3fsd5mFSYNbCICE0q+20FvucYtRM3opmhA2nF/SNd8=;
        b=PvcHJmwzCs2l5hGtso5Id000Vk4MjA6FixEDa2IFE4Tq1hDIYWGLZQLu5/R27E/6po
         UaeqWaQXGbxym5M8z9mzv1G7VRlYJiDUoYOz5Arn6UzbRyzWlTESCX9aoRcCG0Oi1D6A
         RqGzvC0m9Nw55PuRhTDq+YkNoJGt76fhfMKpmJXB+NWcNbSnjZDeEESdg1GdmFq4QHp0
         1/8aPhFe2Nc2al22KyZS9v3IK2fcziG3qERSwul/u+SRuvEnenJ4T482UuToTla9N4gg
         8UcCMp4b2HS0VHsX/mOnkBiY+2lPHdfAWVG5sdvHnL65S7Cy4NTr722g1Sl3P+g8NHQd
         ZzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272328; x=1789877128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l3fsd5mFSYNbCICE0q+20FvucYtRM3opmhA2nF/SNd8=;
        b=apKVHlsR+bR9AtSMSkv5hPTfsB5d+pt+B1Db9dmauRMiCKoUG1DxfUgeBhh1ueQFBZ
         Qem8tCSmq4h6I3G0HhVow6YuLePaVXuHsCR74uDHX8qXFGNrCsJjb+y3wBo09wOdPfxP
         6dqBaLC3y/0fZSBJMY9uruBb6lpN5BbaLucsURXri8ZOM/44+T51l8QqqOQPP3dqhKo4
         XJxsLvOIcdificRNq2EnZqk8748phgK4nhEYth2oO7f/6UkDdUGrrAGTomC1jRMat2dh
         gMDqzs+nO+VbyAjcN0w8NrUP9MbjOfluBRH82bAL+Z3lEq0/zSR7w94nX+JNGHQgUBLd
         NUMw==
X-Forwarded-Encrypted: i=1; AKwUvBzgRQy2xGLSn2M4M4btVUVOXzyYOJ06pPGvdmv/OD90lB+J3pGaRXeUvDjeULR4gnXzxaVwqGkP9laMRkC634Ue@lists.infradead.org
X-Gm-Message-State: AFuF++kAtDZt5GXNIqNnYuKTgttXE7uToXZ1w/lZZBgQG3G552vngqN9
	Zek2tj/e52N0raz6u3WIwLBUi+riQI16MvmhX/AEC3Y0dlwOHShf2sOxV433Xw==
X-Gm-Gg: AYBFou0hcff0o6ayE+e6BmC3ZBa1nVmcA7GdgfRk1KAlYO2qEkobqiuqRzQXHDswe6n
	jPX0BlP8ovPyBb/PgFaPxT55t4FrUEtp+I3LdywO6G/5Xumhw3NIP2XofPb6cYpyfujIxPf6vVc
	0RtJgNV2feQOvDHIsfQzlN+LHrl5UsPBRYJ5yW2e2iVw4rjO29CP4zg8AK4mOB3bpEqJadi4eai
	UFucZY5L81BjmuRlYm+Rm0CFXo98j0v5py0K6FKNw/ZFdzUpzWmbSiQApn+v2IJB9TLF+LZ61Mt
	ia2/Se0zhyUr3qLNWoXtWT5Mq2YqMoS0teufMF+/ko9GhK9vy8TSD1hxflyPWksshxWNDTj9p2U
	di2kpbkSyu1F966vzRGC5aacQppl3H+SKf64tdElIu5FZN2dJbSvcr4byXP0ecmH/RbpSOFbGA1
	CXKBPAOirnC0I69JMtH0oe5HN0YEoh3jiYzYeOSvh3dJ01C280oV8Lkbjwaa4HjJMdyxR8FjUla
	IDKQCSEMpTem9B+nA/EPL22b++FOanYisV+bNalaDxaMZVg+wu5ZHENSTbYKAGzUJfcqAjnhVw/
	CyWSOcK+V+fzHHCjlzq+bHWRQZLqmCFMTWkVyz6Rjr1xxmvVzGy2dcqnEWlJuHEI8euQ9dfhc/W
	hBzfRzJc4qy3n9uaVWkabMM8bi2beSs4=
X-Received: by 2002:a05:6809:28e:20b0:4c3:7af9:f497 with SMTP id 5614622812f47-4c37af9fbbemr4704298b6e.38.1789272325105;
        Sat, 12 Sep 2026 21:05:25 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:05:03 -0600
Subject: [PATCH v4 12/17] mtd: rawnand: sunxi: select the packed H6/H616
 OOB layout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-12-4a64bed94229@gmail.com>
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
X-CRM114-CacheID: sfid-20260912_210529_395797_9DA4836C 
X-CRM114-Status: GOOD (  20.46  )
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
index 725cc302df9f..97a4b4470dad 100644
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
@@ -2360,8 +2363,14 @@ static void sunxi_nand_detach_chip(struct nand_chip *nand)
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
@@ -2377,6 +2386,12 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
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
@@ -2437,6 +2452,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 				bytes -= 2;
 
 			bytes -= total_user_data_sz;
+		} else if (sunxi_nand->randomized_oob) {
+			total_user_data_sz =
+				sunxi_nfc_h6_user_data_sz(nsectors);
+			bytes -= total_user_data_sz;
 		} else {
 			/*
 			 * User-data lengths are encoded in four-byte units. Reserve
@@ -2507,12 +2526,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
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


