Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67311D5C0CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 14:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DJurGxsK8uCi65WSK796cGo8UlfRslV8FdH49GA6Q/Y=; b=2VgGL4JgqYyYeeG7FX3bU2+EpE
	1zYWfe7LQrculpTV+BhRDvgOgY8d+sMo0sFdfDUqn1+hRxM1VD2GmPMWXmi28UZmBOIr2Tv+V8VB5
	YOh6iIZhi0PVu9d8iwmC9I7AIY3Co5Wmoh67Uf7i5WYJ/BXWkZlywGfx6b9++lbG5BK/X9e6TSr5V
	wfZDQQg4SMpRgmkigu07q93P1pi4LtSMP6vFmaZ7fwGg3g+ZlSob3jDEAqgAd4wA0f0b5r1hTucZq
	iUVQ9ZPoYQvF7/OvN2/u4VbooFmC4GPD0RvjSz6zR7Jjd4EGE3gt3iVo1k+Msb26xhNB3RbWB7LyU
	rLPmx22g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Pe9-0000000AnPd-3kAA;
	Fri, 08 Nov 2024 14:07:33 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PN8-0000000AkVW-2j4j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 13:50:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1731073798; x=1762609798;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DJurGxsK8uCi65WSK796cGo8UlfRslV8FdH49GA6Q/Y=;
  b=YG4NZrTEjZi06YrFO0j3lD1UMdaLis7d5HKJ1mP5kbxbsWwtswgrTaSz
   kSO/Kxu50FgvCsrEcucQbenBj63W532zHVtA/UueFpvpfseg/4+lrj9dg
   Lo6fWyLNChM/tWS46Ymwarwgr4NfOFaRTCK+H3m2hBonJsxbesSF/HzGU
   4Y92Mxw/MMMcniesa1hmku44wWDETScYJxEuy5LkKgCVOgdcxJ4W7crYD
   mgUbTteiPmcRC80KN+OidQ4OOvw5wYGgJvFhluM4c1FVY3GEQf0g9W1Gq
   KF6MawLJkzGa1FSX9zogBXsXJI1qog73aOLGrZl5KA1y01uICYf3B2GO4
   g==;
X-CSE-ConnectionGUID: MK9ldqucRs6qslH3v8YZAw==
X-CSE-MsgGUID: YxUeWQK/SfiKbRP+f/bXKA==
X-IronPort-AV: E=Sophos;i="6.12,138,1728943200"; 
   d="scan'208";a="39936929"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Nov 2024 14:49:58 +0100
X-CheckPoint: {672E1705-29-5736D786-D50827BE}
X-MAIL-CPID: BE6FE53A4DD63A425696AA2378CC106C_2
X-Control-Analysis: str=0001.0A682F21.672E1706.0043,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EE9141657DC;
	Fri,  8 Nov 2024 14:49:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1731073793; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=DJurGxsK8uCi65WSK796cGo8UlfRslV8FdH49GA6Q/Y=;
	b=DFrqDmQR1s9DGboqTLnWbsjOjrV5mzyI6ajNpYpxI5M7ndjyKuXWMUExY/leu8ehDpkLDy
	O8U48O14DDjaQsGbV/Osc52kEPHPiDQ6PhaEPv8LOvEEZ2mXBORNbhpNA0PwpPhAZXV9v7
	4OkJ74iNoqeylexFqemlDeSkKOodKLXBCYhBKUM1U+gst1u01PObY9RzxRte7lcbJtfAhN
	/HJ6PVUAmlYCIxgWSORYOdGNQAz7U3Ivp2Bufo030IA2oYWAb7u6chB7tJEB2PfNVVcLEq
	buWrpO6yPBxHD12X57f77zpLhWELrmiv7xOI6Pe6qYTWB6WgzsfSeppzKI3L4g==
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
Subject: [PATCH 4/8] ARM: dts: imx7-mba7: Add 3.3V and 5.0V regulators
Date: Fri,  8 Nov 2024 14:49:22 +0100
Message-Id: <20241108134926.1324626-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241108134926.1324626-1-alexander.stein@ew.tq-group.com>
References: <20241108134926.1324626-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_054959_005253_0E3C863E 
X-CRM114-Status: GOOD (  10.22  )
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

These voltages are provided unconditionally from external power supply and
are input voltages to various dedicated, switchable, power rails.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
index cc3760fa7d981..a23d7b0a195f1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi
@@ -141,6 +141,7 @@ reg_mpcie_1v5: regulator-mpcie-1v5 {
 		gpio = <&pca9555 12 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
+		vin-supply = <&reg_mba_5v>;
 	};
 
 	reg_mpcie_3v3: regulator-mpcie-3v3 {
@@ -151,6 +152,7 @@ reg_mpcie_3v3: regulator-mpcie-3v3 {
 		gpio = <&pca9555 10 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
+		vin-supply = <&reg_mba_3v3>;
 	};
 
 	reg_mba_12v0: regulator-mba-12v0 {
@@ -162,6 +164,20 @@ reg_mba_12v0: regulator-mba-12v0 {
 		enable-active-high;
 	};
 
+	reg_mba_5v: regulator-mba-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_mba_3v3: regulator-mba-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
 	reg_vref_1v8: regulator-vref-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC1V8_REF";
@@ -177,6 +193,7 @@ reg_audio_3v3: regulator-audio-3v3 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
+		vin-supply = <&reg_mba_3v3>;
 	};
 
 	reg_vcc_3v3: regulator-vcc-3v3 {
-- 
2.34.1


