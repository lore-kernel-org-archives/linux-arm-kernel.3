Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49047C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 12:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+VeLjO2DwFBf6rQsy8olsg3EAsIDvKkOvaB8/Zphig=; b=i4iL2ItIbfmM25CDU8TgeVZ+ey
	7a5kTvFOm0qk3bTnx3OaiuenYGUmf2B5wipNAkIwo9BsMwphSt5JXHhePhbcztIl+x4r9/JoFyDsd
	Z/PYVpXsF5sruKCTajPm8GIKriZ7APAtI4Fm3fL96OyJw3xvqdMyX8qyrTURRhlZzFCiFvY/QlHFd
	Hex2krsG7iWKse/p1g2m+PYz2HNPaYj9QraFQULbVeYcQMhhh27pbaC4q6arWcLr2gbvvmqq7atFW
	ceekx9HigF8RAdUJCBVdWDbr7bJY26TeSFMzyCZNeTnK7f1L99W8YMEsd3SMTHzCd+Fv5WaUMct40
	SVTRggRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuUlN-00000000fYk-3auv;
	Thu, 13 Aug 2026 12:42:25 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuUlL-00000000fYF-4BLp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 12:42:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=c+VeLjO2DwFBf6rQsy8olsg3EAsIDvKkOvaB8/Zphig=; b=fdXYo5B05QUYmO2FSc7a5QyqLd
	NTmvkskK6jev/tYpRFQ0RGjzuMfGWd1Y21fSR3X2nYSYRHyInyJOJB/lJZ+tKLPBcN59zFRM8DEhf
	HfJxkhb6I1HNndVy6UShwz+X29+SY/ZvflkgZWDjn+RiPWq5uSUB3fHr7biYYPmPBadqSeTHNqIUV
	GKfpV0Q53bNxIxmljRKGt5zUN/pPtf1Of2rDWLXGWVpaku2t4mrqyHCpm8v1nBpD8voqDv012WMnb
	KLYPe6/WeJl7cIrLaiHmCiFj7V/QqlwFU6hQn3NPfNaUIZiE8xYGKvP9GorrmcCBUoQYBZdNsMUww
	1qfr8VRA==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wuUIu-000BXJ-34;
	Thu, 13 Aug 2026 14:13:01 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wuUIv-0005zb-1I;
	Thu, 13 Aug 2026 14:13:00 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: mba6ulx: Add USB hub node
Date: Thu, 13 Aug 2026 14:12:46 +0200
Message-ID: <20260813121250.3993187-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813121250.3993187-1-alexander.stein@ew.tq-group.com>
References: <20260813121250.3993187-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28091/Thu Aug 13 08:25:54 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_054224_146221_6229DF8C 
X-CRM114-Status: GOOD (  11.03  )
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

Instead of handling the USB hub reset using a regulator, add a proper
on-board USB hub device with reset-gpios set.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
index dea473f660f91..2327528b402f3 100644
--- a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
@@ -133,16 +133,6 @@ reg_mpcie: regulator-mpcie-3v3 {
 		vin-supply = <&reg_mba6ul_3v3>;
 	};
 
-	reg_otg2vbus_5v0: regulator-otg2-vbus-5v0 {
-		compatible = "regulator-fixed";
-		gpio = <&expander_out1 0 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		regulator-name = "otg2-vbus-supply-5v0";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		vin-supply = <&reg_mpcie>;
-	};
-
 	reserved-memory {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -407,10 +397,18 @@ &usbotg1 {
 /* 7-port usb hub */
 /* id, pwr, oc pins not connected */
 &usbotg2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	disable-over-current;
-	vbus-supply = <&reg_otg2vbus_5v0>;
 	dr_mode = "host";
 	status = "okay";
+
+	hub_2_0: hub@1 {
+		compatible = "usb424,2517";
+		reg = <1>;
+		reset-gpios = <&expander_out1 0 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&reg_mba6ul_3v3>;
+	};
 };
 
 &usdhc1 {
-- 
2.55.0


