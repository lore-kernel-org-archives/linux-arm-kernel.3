Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE62108E1D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 10:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fEgrB2T+whJlk9Y05dXgdk6oVsIuY+KNuAhr1hMqks0=; b=BiVoyprdIVPR7jZ1KiXVdBySDf
	SmlzGL4EjQ3HPqVBD+FdIb2Ayxmp9s/L3GtausfaHaO1P2XeIJKbXAbXxKEh/n+dyNwtnrcaZgany
	R4GNrHcXeNFHiI5a6eMDvki2gRPbn2MUC4x9r0k6+YE9fYpqHbAdoo65wL+PNs0JGarUMyKtrQKJz
	DFmmIdMCFYjB29br4kLbI/7xJ5R3UzI1oiuywoGfXuT3i9g4BtzZwzPZ4+WK039pFAekSvESJmyZ8
	krxRzx50ohDePyKxrITTq/Dd9sJ4b/tJc7Jh4d/tRxnJ5zgYTMHdOV75Q8JjTGuWcw4dqT90/gDMK
	VgW3v59Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3AW4-0000000APIT-3lBe;
	Thu, 19 Mar 2026 10:22:12 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3AW2-0000000APHp-0HZE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 10:22:11 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-439b2965d4bso554006f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 03:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773915728; x=1774520528; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fEgrB2T+whJlk9Y05dXgdk6oVsIuY+KNuAhr1hMqks0=;
        b=UMch57GYUbzn7xvd6Slp3HpxWS3No1NH/TpVsGcfIcWClKcsM0ug58rMh1vs3THdz0
         tDWFkMp4YfPqqBTaIw6XiBRQDOR/KWdjZDbig/LVOsiafhs4d0LC54X/gaNuQjKPEdzr
         VaqKkUao5+OwC7NEU1o7C2iOWaFkYyNoAVwFsmtQ8ssuqxfRUXwaCCOrveaLB11/mfpk
         LLHIJAC75+hRUOl0PNXgA+1G/VJxHD2l1T1Y5Qm53qF7Ejvaq16ZXpYzDWsXicb5bM2+
         l7cdd8yunLt72D018r8MxPAAs73MTOQDCDrlfilco0sG6Z33kkH2twyk6aadsAViLlVA
         PMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773915728; x=1774520528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEgrB2T+whJlk9Y05dXgdk6oVsIuY+KNuAhr1hMqks0=;
        b=U+8d3mVikOYLGTtyfEKNf8wS2x3keIQOpnlq6wrbUwjC5ypjeuidc1YhXruuLsuKFT
         shArZX2R8aQZuKE8Un9VqxWOp7htVNjbgG/r0X9ueIWdAr937kL23NScnjM9RJppuT78
         +jTa01fPzzzvq2YBqFQX5nGF08W9h87x7Ews1ea11cQc4FbfxsyAWFWNg2g+OmeEp7R5
         Q0VGwji29vcekWcD/pelV3VIjIgdpUGA1IY02093deFMIzvblycEcCT3r8U5nGQptKJF
         HTIEdRTCQZiXli3czwA14pPxTnMYcV332b4ajvFH8BTuIRlsNtPuRwOg4LNqkUEtpmNt
         SiMg==
X-Gm-Message-State: AOJu0YxeVkIoqg5IgOJSiNnUPlBDJ62gm2MR6IDTA2fMaaqHCOHjqihx
	//6BIgc0HAVfjHDKDWhqP9O+tQo6c7t9EhMM78VbP6mF6fHci4MHTBK1
X-Gm-Gg: ATEYQzxKvOAgY7qmMRF1tYKIcoDK2XFt6vJ0MJmUl/Li6Etsb4sVtSS9/QGVaY5lsfv
	kwel8EfK/DhOngZZ5Db996OfrO+oMZXDmBuJDBA0CsJTHV0unIym1Z2EjDMTHpVGy32RCLSXRiD
	1aLA5MbQImgh1biC6sNzaQSVN7jiXsqF8XcikK1jEcPuD7VeJY/wkFpUpqk3b46s02f0xSHA9ke
	LC4xCE0D6RgZY6lu6Hq3MRrdYUPphabJD/SXz+F0yE/EGsxITlF1hbDtd5YYfpfVRIJWnfXNRjM
	1ATnhBopXaCR/WOKUU/+qJB+SyZjdT1RAE/qYomuMPis02I0kuGwa6o4Vd4RCKDMobDwNOdClTK
	gwxDZmKWKAmuAQXSX96TZqnImmP/WvmizGP7ujkiDg/VzZaOPMCcFG0NNDqaumH/RIEC9JMQuju
	lDrA/IT0vs8/5xF6PsANTdBcEkzOjZrDlFd+wgGxQnVCefNp3e
X-Received: by 2002:a05:6000:3104:b0:439:caf7:a5e5 with SMTP id ffacd0b85a97d-43b527c54eemr11777499f8f.31.1773915726959;
        Thu, 19 Mar 2026 03:22:06 -0700 (PDT)
Received: from debian.levillagebyca.com ([213.152.28.84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51852a64sm15352271f8f.14.2026.03.19.03.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 03:22:06 -0700 (PDT)
From: MidG971 <midgy971@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	jonas@kwiboo.se,
	shawn.lin@rock-chips.com,
	MidG971 <midgy971@gmail.com>
Subject: [PATCH v3] arm64: dts: rockchip: rock-3b: Model PI6C20100 as
 gated-fixed-clock
Date: Thu, 19 Mar 2026 11:22:47 +0100
Message-Id: <20260319102247.32260-1-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_032210_150507_5C36F279 
X-CRM114-Status: GOOD (  10.21  )
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
pipe and reference clocks, matching the approach used in=0D
rk3588-rock-5-itx.dts.=0D
=0D
Assisted-by: Claude:claude-3-opus=0D
Signed-off-by: MidG971 <midgy971@gmail.com>=0D
---=0D
=0D
Changes since v2 [1]:=0D
 - Fix AI attribution: use Assisted-by tag instead of Signed-off-by (Shawn)=
=0D
 - Add missing pipe clock (CLK_PCIE30X2_PIPE_DFT) to pcie3x2 clocks=0D
   override (Shawn, referencing David's patch [2])=0D
=0D
Changes since v1 [3]:=0D
 - Drop phy-supply approach entirely (Jonas, Shawn)=0D
 - Model PI6C20100 as gated-fixed-clock instead=0D
 - Wire reference clock to pcie3x2 controller=0D
 - Follow pattern from rk3588-rock-5-itx.dts=0D
=0D
[1] https://lore.kernel.org/linux-rockchip/20260304132957.684616-1-midgy971=
@gmail.com/=0D
[2] https://lore.kernel.org/linux-rockchip/d981fa84-bd05-ac9d-98ca-89ee4717=
7829@rock-chips.com/T/#m6a8289609e6a60691d3c06358b6322c7aa5e43d1=0D
[3] https://lore.kernel.org/linux-rockchip/20260213151452.535527-1-midgy971=
@gmail.com/=0D
=0D
 arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 21 ++++++++++++++++++++-=
=0D
 1 file changed, 20 insertions(+), 1 deletion(-)=0D
=0D
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/b=
oot/dts/rockchip/rk3568-rock-3b.dts=0D
index c5f67dd6dfd9..1a2b3c4d5e6f 100644=0D
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
@@ -553,6 +562,15 @@=0D
 };=0D
=0D
 &pcie3x2 {=0D
+	clocks =3D <&cru ACLK_PCIE30X2_MST>, <&cru ACLK_PCIE30X2_SLV>,=0D
+		 <&cru ACLK_PCIE30X2_DBI>, <&cru PCLK_PCIE30X2>,=0D
+		 <&cru CLK_PCIE30X2_AUX_NDFT>,=0D
+		 <&cru CLK_PCIE30X2_PIPE_DFT>,=0D
+		 <&pcie30_refclk>;=0D
+	clock-names =3D "aclk_mst", "aclk_slv",=0D
+		      "aclk_dbi", "pclk", "aux",=0D
+		      "pipe", "ref";=0D
 	pinctrl-names =3D "default";=0D
 	pinctrl-0 =3D <&pcie30x2m1_pins>;=0D
 	reset-gpios =3D <&gpio2 RK_PD6 GPIO_ACTIVE_HIGH>;=0D
--=0D
2.39.5=0D
=0D

