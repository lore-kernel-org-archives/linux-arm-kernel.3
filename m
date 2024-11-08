Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B20D5C0C8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 14:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Nal7GYRn7SCY5r0MRRTMipkTKNKXHwVu7a4dXfbnSk=; b=KsvYxuNLN6LH4AAApy2nGWFv/N
	tFEFpvO6wC6aOVlV2/uUSfwyU3/yyyVLqLlFSOCuNVhu0o9dR8+c2OAQscArHF2qmB0KpNtq36kYY
	SjSG+7d7AttGlpHFUDDrwPkY0SP/EtaRkEfwqBv58HuqG3w90JIf7PA/YZMLpywno//ry0cTEry2b
	ukoXpzRWDx3Xinztt2AAuHtsB8el3VlIclJCJvpJYwcrYAKhjAeEvVXOvf5rODeRYkMZv3v2fnkuF
	Xz/RjAY1ntqmpKR6C6u5Aqb5WqQB3XMF2l/EYN5pQ6e5F6OjH+PdRomYOZBz/yleAiLJCaBZOFFw3
	uAZanZaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Phe-0000000Ao59-184Q;
	Fri, 08 Nov 2024 14:11:10 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PNJ-0000000AkVW-12Ff
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 13:50:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1731073809; x=1762609809;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5Nal7GYRn7SCY5r0MRRTMipkTKNKXHwVu7a4dXfbnSk=;
  b=MZrFLEGj926OrRySRybUTLqb1Ib0NRpABgP4BbBZ0FFyPCfIFyhRziVH
   GU7HJSMfGscDdVqz2kLlYUEb7pwldiGVm0jSbxMhbGncPgzmn8L8QrsjQ
   D5sQGZJbyMJ0SE4HlIZi2LRU+ZkeZkZaMm2F7dBrZFCuU+53Sfo+IX7lr
   3LPkYQFJdhAJKhn6ZO4fOKxoI/8kxlFupLJIep3zhPcajOfzRkEo80Evc
   W6PZiLbQp/j/ALmr2GHZy74Sb9Oe1wr/wiljPzeoSJvZIzpsBPxDVbmxG
   ZMUeZtsCYiFCWXMvEvBEliBxQhF/Kwaq3ETusic3tDxv2AyNdAgGL0fpg
   g==;
X-CSE-ConnectionGUID: R9LnWTwRTuefToAxPzdYEA==
X-CSE-MsgGUID: omvlil9aRlK9zGLZmtTpZA==
X-IronPort-AV: E=Sophos;i="6.12,138,1728943200"; 
   d="scan'208";a="39936933"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Nov 2024 14:50:08 +0100
X-CheckPoint: {672E1710-28-86C05612-CA75E1CA}
X-MAIL-CPID: E2D8FA00EC760E8BB26F8383588D72B2_1
X-Control-Analysis: str=0001.0A682F1A.672E1710.00A5,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6CD3A163B2E;
	Fri,  8 Nov 2024 14:50:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1731073804; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=5Nal7GYRn7SCY5r0MRRTMipkTKNKXHwVu7a4dXfbnSk=;
	b=gXgdtjq2sIRAhsk5Qlzga7MHsbh9EPRoHuF677/XE4+oP59XVpjxzeHCqVTyfOqPr1L9yF
	d5Ashadqihn/uJgsi/Wp8TJd4KgQxcUVk0H0umraubWUH4BlPw7un98J4ebFT4q6DPjEII
	0CwwEg7Q4tzetj6ygl7h2J76sn4bpkjto7N+xAkxeKIjDeD3q0gyje3RRxo4mPjGEfQ6Tf
	Q9BA8fK2QG4VxwkMtAkpset1Rmy568VVfssgkdaYsOxtycSs3tuFS4ns8uGiN25gq/R4k/
	lZcEhkIRSt3+vXiM6hMwdUk6uyKFip1BfyWg5LRQEAEzsI/bfXpe68q40KEhIw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	=?UTF-8?q?Jo=C3=A3o=20Rodrigues?= <jrodrigues@ubimet.com>,
	Bruno Thomsen <bruno.thomsen@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] ARM: dts: imx7-mba7: Remove duplicated power supply
Date: Fri,  8 Nov 2024 14:49:24 +0100
Message-Id: <20241108134926.1324626-7-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108134926.1324626-1-alexander.stein@ew.tq-group.com>
References: <20241108134926.1324626-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_055009_872179_79945B22 
X-CRM114-Status: GOOD (  11.25  )
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

VCC3V3 is used twice, resulting in the debugfs warning:
debugfs: Directory 'VCC3V3' with parent 'regulator' already present!

The power supply provided by reg_vcc_3v3 is actually the same as
reg_mba_3v3.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
index 077700a5f4c3d..304281681abfe 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
@@ -188,14 +188,6 @@ reg_audio_3v3: regulator-audio-3v3 {
 		vin-supply = <&reg_mba_3v3>;
 	};
 
-	reg_vcc_3v3: regulator-vcc-3v3 {
-		compatible = "regulator-fixed";
-		regulator-name = "VCC3V3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-always-on;
-	};
-
 	sound {
 		compatible = "fsl,imx-audio-tlv320aic32x4";
 		model = "imx-audio-tlv320aic32x4";
@@ -318,7 +310,7 @@ &i2c1 {
 	lm75: temperature-sensor@49 {
 		compatible = "national,lm75a";
 		reg = <0x49>;
-		vs-supply = <&reg_vcc_3v3>;
+		vs-supply = <&reg_mba_3v3>;
 	};
 };
 
@@ -351,7 +343,7 @@ pca9555: gpio-expander@20 {
 		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-controller;
 		#interrupt-cells = <2>;
-		vcc-supply = <&reg_vcc_3v3>;
+		vcc-supply = <&reg_mba_3v3>;
 	};
 };
 
-- 
2.34.1


