Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A228AEF8FE3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 13:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8mg++I7PIn4dt5AFv6kcvsSJIHq4QLe4L7ARlFnSbcA=; b=TU7zNF/4jNnEHL3VfnPweYt10A
	HKDgNBl9XJeyBNgaL8mGxfWSkCG1v8UI/eZJxKb97S/ZvUQLnDwzGjwyC4BL7107ybtWkXbiZ8w/F
	NDMVD2faRuCToHReQoGPxmCR9M+KhkpoLph11bccU9bR99g2sidng+Vaj+3sZAM9Gu91KUo8b5Ge/
	bHIl+5yumilDEay1yML8MLmx9LueedXl+c7vbOwgas12YGBexcQ+em/Bth6aewf4z2GchToBEYbjM
	4cyAKgRPImHJ2vLno0JaBhwfLSDl2qTISvfMAGG2iW7T4/28wyhOQ2lUT95rFFBNcwcpzVUUGWG/p
	jEFn0Ehw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmIH-0000000HFQI-3jv6;
	Wed, 04 Mar 2026 13:29:41 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmIF-0000000HFPU-0IgW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 13:29:40 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48374014a77so83234675e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 05:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772630977; x=1773235777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mg++I7PIn4dt5AFv6kcvsSJIHq4QLe4L7ARlFnSbcA=;
        b=bvdxar0rp9CuNGj29kpvwQFBq3L23hijCV0FC+KwnxwyciSSkSJo3fdh+jwD7ZlUQu
         zK97336aMvg07u8+ntPvjVhmQuZVVX11H+snYW02CPiR3xqEPt+in013ec3AFHjOQyaF
         OlMJkjhQpdEH/e9FBxKjEiiVISE2yZ7MRl8P4Bvoxpruzo2ihlIq/N9bTV3go9NlgrQQ
         fBrw/1OJbyyVAvE9b4yIQSQO562NRkQbF4db00BLR3qxdW/dmxRSIGQHe/fUR1N0RPyE
         AnP5Y8i5vSIC8hFGezZEw6lsVoQ8XmDlUsf0DwYxzywMGf56Dk9k5MuIiSt4FuJw01DJ
         wZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772630977; x=1773235777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8mg++I7PIn4dt5AFv6kcvsSJIHq4QLe4L7ARlFnSbcA=;
        b=Bh+XWdfkAOTnygkK6fO7OB2AFLlwpCbqENT0cvwudiT/1+dfCeziXuIsXUJFj2cP/v
         19y0NVA3LB8AAZZgQ5aQj4JuF4gVkzakI75NtFGhFRi+dc9ZS5XqJNXOhYS3Dle/GlUd
         X2ndusEF0yAJFeOdGLsh5L4/UFzd6IUeZnTf1xZwKXGsx2erztj6EJHpY8K9zLM+brwa
         9JaU4qGXYvRyHlup1CbzElahz8o6i3816EBUvyaMuYgSoQp3uG0R2/ahZCcV1rGDTp0o
         SmunuLmUfZSSWr2A8W0SBTcKVRRLhbeVn7tANvwkHd/QAGSJ8bwiypHw4z2xXJ/EWRSb
         7SQQ==
X-Gm-Message-State: AOJu0YxtuYFcpVAVTpPa9dcGSFmMgx6LM3pVsHZDZt/pKmzN96vuuJAI
	KnznXe0eOVH2R1jWpAtSHnu1XGECJCCxOSb52afShPFCTmUAu17miOKR
X-Gm-Gg: ATEYQzz7bBNn6BXOHg6wUowwPlVCfGI/I/Cmc2c9Kk0rsn/5ztZ4o+W+eJdVAAArVsH
	+DQ0draiz+6k4/QLtjtwxen4k81zMEhr8UxZscp1VW8E0km1JBYMG+XRSeLvW98gCI1CF9Ut7JJ
	yEVz5bAKoh6z+sSJj5qNEnhLHdCIz1l6Si7FA7bEw4jKaRft+26qz8M8vv3gk2/blY0dMb6Vy1y
	0BrWebiYnFNziAxbvDqwiKeHe1TnBdnFfG7KdcGX7j2tLHn4t1sxxf82Aw2DRbzNUZI9uPrW9uT
	pMv4+HyPRD3Eow99DUpWXc8hv2FLOAf1InuQfOKOTPW+eq1m5dQHPGnA08vV6R+nGrEvIr0e4gT
	jDiHkSU2VI/F0eGKdwrPRP5gz2RCS/Ehgr1q/sq7wOe/Ojvlzny6awV/RPhscUdb/ojpdicSEUa
	UgA0yQZiEGr1zoAFa13wZDVtUSonANgSw6trFT5cljKFLikJpx
X-Received: by 2002:a05:600c:6098:b0:471:1717:411 with SMTP id 5b1f17b1804b1-48519888e49mr31558475e9.24.1772630976778;
        Wed, 04 Mar 2026 05:29:36 -0800 (PST)
Received: from debian.levillagebyca.com ([213.152.28.84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851887fa9csm51283605e9.9.2026.03.04.05.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:29:36 -0800 (PST)
From: MidG971 <midgy971@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	jonas@kwiboo.se,
	midgy971@gmail.com,
	Claude <noreply@anthropic.com>
Subject: [PATCH v2] arm64: dts: rockchip: rock-3b: Model PI6C20100 as
 gated-fixed-clock
Date: Wed,  4 Mar 2026 14:29:57 +0100
Message-Id: <20260304132957.684616-1-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260213151452.535527-1-midgy971@gmail.com>
References: <20260213151452.535527-1-midgy971@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_052939_162122_A289503F 
X-CRM114-Status: GOOD (  10.94  )
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

The Radxa ROCK 3B uses a PI6C20100 PCIe reference clock buffer to=0D
provide a 100MHz reference clock to the PCIe 3.0 PHY and controllers.=0D
This chip is currently modeled only as a fixed regulator=0D
(vcc3v3_pi6c_03), with no clock output representation.=0D
=0D
The PI6C20100 is a clock generator, not a power supply. Model it=0D
properly as a gated-fixed-clock, following the pattern established=0D
for the Rock 5 ITX and other boards with similar PCIe clock buffer=0D
chips.=0D
=0D
The regulator node is kept as-is since it controls the power supply=0D
to the PI6C20100 chip via GPIO0_D4. The new gated-fixed-clock node=0D
references this regulator as its vdd-supply and provides a proper=0D
100MHz clock output. The pcie3x2 node is updated to include the=0D
reference clock, matching the approach used in rk3588-rock-5-itx.dts.=0D
=0D
Signed-off-by: Claude <noreply@anthropic.com>=0D
Signed-off-by: MidG971 <midgy971@gmail.com>=0D
---=0D
=0D
Changes since v1 [1]:=0D
 - Drop phy-supply approach entirely (Jonas, Shawn)=0D
 - Model PI6C20100 as gated-fixed-clock instead=0D
 - Wire reference clock to pcie3x2 controller=0D
 - Follow pattern from rk3588-rock-5-itx.dts=0D
=0D
[1] https://lore.kernel.org/linux-rockchip/20260213151452.535527-1-midgy971=
@gmail.com/=0D
=0D
 .../arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 18 +++++++++++++++++-=0D
 1 file changed, 17 insertions(+), 1 deletion(-)=0D
=0D
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/b=
oot/dts/rockchip/rk3568-rock-3b.dts=0D
index 69001e4..24befc9 100644=0D
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts=0D
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts=0D
@@ -56,7 +56,16 @@=0D
 		};=0D
 	};=0D
=0D
-	/* pi6c pcie clock generator */=0D
+	/* PI6C20100 PCIe reference clock buffer (100MHz) */=0D
+	pcie30_refclk: pcie-clock-generator {=0D
+		compatible =3D "gated-fixed-clock";=0D
+		#clock-cells =3D <0>;=0D
+		clock-frequency =3D <100000000>;=0D
+		clock-output-names =3D "pcie30_refclk";=0D
+		vdd-supply =3D <&vcc3v3_pi6c_03>;=0D
+	};=0D
+=0D
+	/* PI6C20100 power supply - active-high GPIO0_D4 */=0D
 	vcc3v3_pi6c_03: regulator-3v3-vcc-pi6c-03 {=0D
 		compatible =3D "regulator-fixed";=0D
 		enable-active-high;=0D
@@ -553,6 +562,13 @@=0D
 };=0D
=0D
 &pcie3x2 {=0D
+	clocks =3D <&cru ACLK_PCIE30X2_MST>, <&cru ACLK_PCIE30X2_SLV>,=0D
+		 <&cru ACLK_PCIE30X2_DBI>, <&cru PCLK_PCIE30X2>,=0D
+		 <&cru CLK_PCIE30X2_AUX_NDFT>,=0D
+		 <&pcie30_refclk>;=0D
+	clock-names =3D "aclk_mst", "aclk_slv",=0D
+		      "aclk_dbi", "pclk", "aux",=0D
+		      "ref";=0D
 	pinctrl-names =3D "default";=0D
 	pinctrl-0 =3D <&pcie30x2m1_pins>;=0D
 	reset-gpios =3D <&gpio2 RK_PD6 GPIO_ACTIVE_HIGH>;=0D
--=0D
2.39.5=0D
=0D

