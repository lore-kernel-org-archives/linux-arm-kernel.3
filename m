Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7F9C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 09:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2EIzP0HgejNa9WUiq2oxdXd+iKdqm6aPx/jw2TlMIfA=; b=qhsL7lq250HTw9Ity3FLAXJlfB
	nHGAE/d0odUBmi73wwEfs4NSGoDgRZT4i67FtnKF0VbyY9W/mNVXYQBy/PuNNzDDMj5bf9I3lj2AJ
	6deNSPuqhVFFKYD20daFKrVk4XtJQEI5EBUh9fDu6/cDbR7xbtGQdJXxeDcwgPn+0bJsgTiHb1aS1
	NjsaOEEYgL7AVjYsi5Cm+9klqeV34l3QWephlddZYNurnHlcCkDyytt8VFAHxgfMedYBRjbP3AKzd
	Lqy24KM39ZSglFRt/7c/rGyNVhLFY9ImhKddlI0HaBsJU95zujMZQo2MPs7Q2iuaXs8Mqqe/NRAyw
	mGi4Fjfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjbNI-00000001bFd-2HsF;
	Sun, 16 Feb 2025 09:55:45 +0000
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjaxj-00000001XYJ-1rtH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 09:29:20 +0000
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 56E242540112;
	Sun, 16 Feb 2025 04:29:18 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 16 Feb 2025 04:29:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739698158; x=
	1739784558; bh=2EIzP0HgejNa9WUiq2oxdXd+iKdqm6aPx/jw2TlMIfA=; b=I
	pg3QvbEv5maekN3iAiiOwaXgrFKgRl1h1s8ryRkAFWu2eeiC+Oc4MH9/MQFC3tNj
	Jqx7xohzHq2Q+MeOOtn2tCUr4L9i3fMh5gsjIfHRzQPbU/8z6R4E3UR/pRR4BCUz
	AX8O2G2zFeJ3LJ3nRHVrUS5FsRd+rTUEyVzoMKxf/wHg/yYb144U8lT0FwQDm7Yw
	OkVQT3NsFQODcM7A5QS4roJ1QOHZRyS4T+ol4+vZpu7XN3o0/bxRWmXho3s3nbLB
	8LaqRdH3wykbXnVctqN1vkZyD3DuW7UN9kiemDy9wJPeOdsxmwZGlf7/wvr3G2oc
	RnSqUBqyWJQujcrpzCv/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739698158; x=1739784558; bh=2
	EIzP0HgejNa9WUiq2oxdXd+iKdqm6aPx/jw2TlMIfA=; b=RYpXxJlhCVl9Uj6DM
	IUp56tQvUACh7kvMnMnDFrc4QEDOcjeALbdYZKtI7DF5lppK4yodFNJgfavASMU9
	04FRtqYctuid+S4ytM2Rxynv1oyTLLOjZOxpPen3H35fdAJHe5Nv09NbgsdgAjLp
	eAiPmHyeTVGqUY0i4jhxo3jJzVPK2lxRJX4Lh6WGvdqE932DuE58WH+v4G4TRMu+
	bu+cWTlo7DYAKX6cqPAD3azSUX+oQ72aYh+u8QF7m4WEfcWnprbm/+EsxNi4ykc5
	TfwX4TUhmQC6OZQQZSv2e5gVyCq50cGkv5xZ85El33SfAdIRKKQvWognEysvdp4v
	3BomQ==
X-ME-Sender: <xms:7q-xZ-_WL5QEcU2wKu4rzpF4e2o6-XgE52uJM6byJJj6quw2dwsz_g>
    <xme:7q-xZ-tZw8HQQQN9VdyRm2WGQxnBKGxGhBI1hztZxFgLkSKqOd4FS-hVpw5xuKMyM
    -JffcaHociemXMYGg>
X-ME-Received: <xmr:7q-xZ0DD-qjatzFaf1gBcpYLVRoB2cde8HxPDqbHE3fCLRI_S-2aXD-TepDhsO6kXwni2MEHLrj1qzO4eaMHuELPsHRKL3kfI4FgpafmS-oi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhosghhsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfi
    gvnhhssegtshhivgdrohhrghdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtges
    ghhmrghilhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorh
    hgpdhrtghpthhtoheprghnughrvgdrphhriiihfigrrhgrsegrrhhmrdgtohhmpdhrtghp
    thhtohepmhgrtghrohgrlhhphhgrkedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkh
    hikhhutghhrghnleeksehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:7q-xZ2cOFAKwvpsqE0llPKnIExYzXSeSwB6vgB6UGjC8psvQ6JRrUA>
    <xmx:7q-xZzNwsrzZSom4AFqg9ogT5ICOAtUPbv7_kMK6Ab5AlYp8WF0l3Q>
    <xmx:7q-xZwk0stJZMjc4MLW7WN4iGx-Hu3I7g5toKI8neJbbwc9yRfRWVw>
    <xmx:7q-xZ1vPiQnYCDMOQ0XNGk420U7hFhgIqiw50aE9ApyOJvlZhmiQgw>
    <xmx:7q-xZ6mLqkOnbs0l1gq8LvFYhjt1Wfbix4R_QlhEu1IuVAfeAWePPClS>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 04:29:13 -0500 (EST)
From: Ryan Walklin <ryan@testtoast.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH 7/8] arm64: dts: allwinner: rg35xx: Enable LCD output
Date: Sun, 16 Feb 2025 22:27:14 +1300
Message-ID: <20250216092827.15444-8-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216092827.15444-1-ryan@testtoast.com>
References: <20250216092827.15444-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_012919_567491_47B6DA94 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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

The RG35XX has a 640x480 RGB/SPI LCD panel, supported by the SoC display
pipeline and an NV3052C controller. The H616 SOC's GPIO bank D contains
the muxed display pins for RGB and LVDS output support.

Enable the display engine and LCD timing controller, configure the
panel, and add a fixed 3.3v GPIO-controlled regulator for the panel, and
a VCC supply for the display pins as per the other GPIO banks.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 .../sun50i-h700-anbernic-rg35xx-2024.dts      | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
index a231abf1684ad..388487d4720e2 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -175,6 +175,49 @@ reg_vcc5v: regulator-vcc5v { /* USB-C power input */
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 	};
+
+	reg_lcd: regulator-gpio-lcd-vdd {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "vdd-lcd";
+		gpio = <&pio 8 15 GPIO_ACTIVE_HIGH>; // PI15
+		enable-active-high;
+	};
+
+	spi_lcd: spi {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sck-gpios = <&pio 8 9 GPIO_ACTIVE_HIGH>; // PI9
+		mosi-gpios = <&pio 8 10 GPIO_ACTIVE_HIGH>; // PI10
+		cs-gpios = <&pio 8 8 GPIO_ACTIVE_HIGH>; // PI8
+		num-chipselects = <1>;
+
+		panel: panel@0 {
+			compatible = "anbernic,rg35xx-plus-panel";
+
+			reg = <0>;
+
+			spi-max-frequency = <3125000>;
+			spi-3wire;
+
+			reset-gpios = <&pio 8 14 GPIO_ACTIVE_LOW>; // PI14
+
+			backlight = <&backlight>;
+			power-supply = <&reg_lcd>;
+
+			pinctrl-0 = <&lcd0_rgb888_pins>;
+			pinctrl-names = "default";
+
+			port {
+				panel_in_rgb: endpoint {
+					remote-endpoint = <&tcon_lcd0_out_lcd>;
+				};
+			};
+		};
+	};
 };
 
 &codec {
@@ -187,6 +230,10 @@ &cpu0 {
 	cpu-supply = <&reg_dcdc1>;
 };
 
+&de {
+	status = "okay";
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -206,6 +253,7 @@ &ohci0 {
 &pio {
 	vcc-pa-supply = <&reg_cldo3>;
 	vcc-pc-supply = <&reg_cldo3>;
+	vcc-pd-supply = <&reg_cldo3>;
 	vcc-pe-supply = <&reg_cldo3>;
 	vcc-pf-supply = <&reg_cldo3>;
 	vcc-pg-supply = <&reg_aldo4>;
@@ -355,3 +403,13 @@ &usbotg {
 &usbphy {
 	status = "okay";
 };
+
+&tcon_lcd0 {
+	status = "okay";
+};
+
+&tcon_lcd0_out {
+	tcon_lcd0_out_lcd: endpoint@1 {
+		remote-endpoint = <&panel_in_rgb>;
+	};
+};
-- 
2.48.1


