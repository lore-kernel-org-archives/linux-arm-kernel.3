Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A28BC021AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 08:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yh3NFuBQ3pLHNfn96Off+kmLu1YllyLTVZzfV5VETuc=; b=RPay9xKvADTsubNCAaDstqjW68
	aU89lAzdXzEdPi0L4qTMow6b23NdP9EMZpKlzv4sHlziT5xSCXUAfR2Rmza13H25qkOs9SSGQEoNu
	o3vrkNQvFCOvmZlfUKExgpKcNHULbH8KvR2iofsOM/AI0W7x6fAcucpoXmWuOhhZLyaPnql4vfP7V
	YI2tdfO1ARgXZX55HA2bb62PbDLtgAwn4k66DF62YoTwhNNfJCEF+3PFLDtZsSPtM3nnZni7dbAXM
	CH871h1uEY5HVG+DsPs1raG/DhU2wAtNh8L+h1snRtVKKPHADP0bqoUSeDQOouTUS+c8dLkVdT46W
	xDxKkijw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfYX-0000000BZCq-2aEs;
	Wed, 19 Feb 2025 08:35:45 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfHb-0000000BSvS-2wz4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 08:18:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1739953095; x=1771489095;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Yh3NFuBQ3pLHNfn96Off+kmLu1YllyLTVZzfV5VETuc=;
  b=eiZ82O1ZKM7QdBTklaIGdeZF9/NFbrS78R870XgH7bsC3mzo6i8za6hI
   jKTVsR8AhoBD+Gd5lVZM8rbiMRP+dqEIno5kApxowQF0L0w5zTAbc313T
   ftB+z48WPLzPy0eDD6yH76VtTCx9/2bB+YPpP6l/TrZkhk/GERu2umU5q
   BlNec10nftLNXaLxWyICNP2LT0iWTZzMPmBOtAUVDzJu7pOQRj55lWijG
   r4RS9a0khWoUPc29KzX/kck8bjmyq7OehnZaewrIEVKg50IqiqstO/ax/
   SqALt0uV1z5Y8D2vrjluwhjgitcgCfyyNuHmH+GzyvjLUIugrICkAoHB1
   g==;
X-CSE-ConnectionGUID: EieqYNEgSb2m0j2Z/PF9EQ==
X-CSE-MsgGUID: tySEgp6QT1eJWTCGCsR6Jw==
X-IronPort-AV: E=Sophos;i="6.13,298,1732575600"; 
   d="scan'208";a="41945135"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 19 Feb 2025 09:18:14 +0100
X-CheckPoint: {67B593C6-43-6E0A4539-DBC44C3A}
X-MAIL-CPID: 6C3344EEA9D18489FE742E4A461A3210_1
X-Control-Analysis: str=0001.0A002107.67B593C7.001D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DA59E16D333;
	Wed, 19 Feb 2025 09:18:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1739953090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yh3NFuBQ3pLHNfn96Off+kmLu1YllyLTVZzfV5VETuc=;
	b=t2P7FyBWvEnPmaMMjaRhFVFaM4LFn4hpy7TzSVMDLEvTeQmoPkFN2FF0/8Ytmi+BMdCrHh
	i6FkC5iPkpBndz+VXisZFumVG++4RPqD3XMR/60xOneYcswFjSVXvwMCI6PUWANyF53l9L
	SKI4cxgMogF9xvySl2nm72hsNyyfePMJqtQIAjRrTbMQIfDe5RaMMXltuNocQebVjeIp/K
	izRplZL9hTOGIBEO6Lz0rLt31BilpdA0mjG6SEWH1JxLRM++8idozOt7BxvlXsHu2I0Vhf
	UjiZS48lUE5RNzr1YpgYRwfRhxBPxK5Xo99J+414NJ8imdLzSbywP+GNh0qOUQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 3/9] ARM: dts: imx6qdl-tqma6: use sw4_reg as 3.3V supply
Date: Wed, 19 Feb 2025 09:17:38 +0100
Message-ID: <20250219081748.1181507-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219081748.1181507-1-alexander.stein@ew.tq-group.com>
References: <20250219081748.1181507-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_001816_039730_6132F658 
X-CRM114-Status: GOOD (  11.87  )
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

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

This matches the real hardware and allows to remove
the virtual 3.3V regulator.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi  | 13 ++-----------
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi |  4 ++--
 3 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi
index 68986fb3b8df3..6eee1a4b0b19f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi
@@ -7,16 +7,6 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
-/ {
-	reg_3p3v: regulator-3p3v {
-		compatible = "regulator-fixed";
-		regulator-name = "supply-3p3v";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-always-on;
-	};
-};
-
 &ecspi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_ecspi1>;
@@ -29,6 +19,7 @@ m25p80: flash@0 {
 		spi-max-frequency = <50000000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
+		vcc-supply = <&sw4_reg>;
 		m25p,fast-read;
 	};
 };
@@ -183,7 +174,7 @@ reg_vgen6_3v3: vgen6 {
 &usdhc3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_usdhc3>;
-	vmmc-supply = <&reg_3p3v>;
+	vmmc-supply = <&sw4_reg>;
 	non-removable;
 	disable-wp;
 	no-sd;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi
index 828996382f246..e8fd37dd88355 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi
@@ -30,14 +30,14 @@ pmic: pmic@8 {
 	temperature-sensor@48 {
 		compatible = "national,lm75a";
 		reg = <0x48>;
-		vs-supply = <&reg_3p3v>;
+		vs-supply = <&sw4_reg>;
 	};
 
 	eeprom@50 {
 		compatible = "st,24c64", "atmel,24c64";
 		reg = <0x50>;
 		pagesize = <32>;
-		vcc-supply = <&reg_3p3v>;
+		vcc-supply = <&sw4_reg>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
index 1d0966b8d99e2..0e404c1f62f26 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi
@@ -23,14 +23,14 @@ pmic: pmic@8 {
 	temperature-sensor@48 {
 		compatible = "national,lm75a";
 		reg = <0x48>;
-		vs-supply = <&reg_3p3v>;
+		vs-supply = <&sw4_reg>;
 	};
 
 	eeprom@50 {
 		compatible = "st,24c64", "atmel,24c64";
 		reg = <0x50>;
 		pagesize = <32>;
-		vcc-supply = <&reg_3p3v>;
+		vcc-supply = <&sw4_reg>;
 	};
 };
 
-- 
2.43.0


