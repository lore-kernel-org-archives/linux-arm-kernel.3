Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35C4C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 00:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nMqliGyYpfsu19Ad4wb4NZGMWZWQ33k71V6ukpvY4Vk=; b=k/R4oehUwljcVRpOif4bWvAz1/
	ArHMKcN6CqdAlmgFLt633dQY3RGYrP4hAQJup95VjGJ4MdR8K8ErlCXPe4gH6midvHGo/Ofle8KTg
	6AXGkSBx6IeHKBkuLQEZ9cOaYiC5APt6aEhDC9nOSO6727rcI64I+sC1uW7pU9FqIoeR7FKbdO3+u
	7eH231oXhbL6VoFJV1xfyyDpUNrSY/gq2MVPqf9fxhLhoscwsZk+40apjwj6fYs+Y8BvxzK4mLsGr
	OaI2lKZFfl57YNoKGNmdyM3MdRkcb2hIpZrBJKQBtIQ+u0NoNxmYx6+m9EMbL2LaUdlF0j3hNqWJL
	5L4L/qwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpcVR-00000006cWu-3vVM;
	Wed, 05 Mar 2025 00:21:01 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpcTq-00000006cJF-1cJj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 00:19:24 +0000
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 7F20A13826D1;
	Tue,  4 Mar 2025 19:19:18 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 04 Mar 2025 19:19:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=traverse.com.au;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1741133958; x=
	1741220358; bh=nMqliGyYpfsu19Ad4wb4NZGMWZWQ33k71V6ukpvY4Vk=; b=3
	RC5UXMYN1NS7Zin/KABAZ9c/FhehsYxvDzlJ9+eurKAU6nTEi46onYYa/QLMSQ2W
	Ya2UzRmKeOixLK4rJbXMCA/Hp60/lxDl9FrCBQphTLzObUiVmRWHU6AMaadkh5UR
	7RNRngSZJld8p1ocBbKlR6PgkD4n/iqjBMe4uXcOmgeBjbd5C3wTFnEOSBy6pokS
	TehuQhrORhzpnOcdI6m6AHyuNvqd0P6ZByp1mUhb5K1GfZEh2cuQTMBR98lQrxcz
	Cpu5PvPvtufN1s8MkS6SH3GzmGPr9yQ1rl6vgMu+KR48o0jTWOMfD0XxVkG6OOv9
	utoGxQvEv6132i3V8whLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1741133958; x=1741220358; bh=n
	MqliGyYpfsu19Ad4wb4NZGMWZWQ33k71V6ukpvY4Vk=; b=0jpC5ivbhoGFFt4kl
	ytqePwP7Uvz9oIi/BaMv6htv4TZbM9RR/VDmpdHABOdWsL1KShLsBl0Fu70xiPJZ
	+kg/fOiL4NVQT+YKYUjIQXdb/uhe9hnuFqtmZzmlDUFyzH/rc/wDUAG8m1H0c3nw
	Gyge8QsjHS/V3jo/97lZz5xpNId2nPToWVTWBfAaC/an0UhQHltzMGenA/E2yTT1
	P5ww+Z6rvUwxMHsn1HslT5w0cZVwB2Bgm9h1kFfhZ5zxWcfk6UCB7305Dp/ubTHk
	8fBPAYNRNHbWjEaSAprH4BTehAEPVmfKvHUh4WHmJzZF1DZNUh97KbngamiFh2YA
	soaaQ==
X-ME-Sender: <xms:hpjHZ-JXkbGo9EWtIIJ_NEG8M1FdNsYKPO51s_Sj0WtG-Q-U46TOjw>
    <xme:hpjHZ2KTJXg2Viy8GlMvpq6uMRSBlERpfWMNj1E9kLW9nynYOfHDYfHNCRZ1yuO_K
    bbnUOsdbspMbrNEuZI>
X-ME-Received: <xmr:hpjHZ-skIrz2acmI-BxtLVhkhE1As_odX4ooBDrgnrwYzAEw4N1Rzo-tGLWVTxmIvMmzorb4_Ssn0rGbFJQ-Lr3dXgqh62jtUvfbO_cr_AlfqNBEq20ri1C87BJ5fwk9jDzBtpO6Gb5J0ND-jNZh2p5zuP4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdeffeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepofgrthhhvgifucfotgeurhhiuggvuceomhgrthhtsehtrhgrvhgvrh
    hsvgdrtghomhdrrghuqeenucggtffrrghtthgvrhhnpeeiieefheeiieeuledufefgtdev
    feejffetgedvveduffffleehjedtjeegleelgeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehmrghtthesthhrrghvvghrshgvrdgtohhmrdgr
    uhdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepug
    gvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhi
    nhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpd
    hrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepmhgrthhtsehtrhgrvhgvrhhsvgdrtghomhdrrghu
X-ME-Proxy: <xmx:hpjHZzZGPN_CM1ZDnKFt7SzFu-AOT1JgdzIVbvJoe4JtKAB_SVdBMw>
    <xmx:hpjHZ1Ytyv0OaZUqfr5-aA457j6BeY56PhUVAbrnq7XYRkLS1aJqnQ>
    <xmx:hpjHZ_At_5POVMFJoYXKSG8KRVd7seOQow4vfXoUlI_7KAJb0jmGDQ>
    <xmx:hpjHZ7bAyTIx2gmPL41EEkNMOLb14Rx8DdmHU3LafyOc5RQ6-FtRhQ>
    <xmx:hpjHZx66gkd99NWuyvUNq2AfVqV_gqNyiLDXhV1wDzHT2LZGEXUp2hep>
Feedback-ID: i426947f3:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Mar 2025 19:19:15 -0500 (EST)
From: Mathew McBride <matt@traverse.com.au>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Mathew McBride <matt@traverse.com.au>
Subject: [PATCH v2] arm64: dts: freescale: ten64: add usb hub definition
Date: Wed,  5 Mar 2025 11:19:01 +1100
Message-ID: <20250305001901.31594-1-matt@traverse.com.au>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20250129045352.10728-1-matt@traverse.com.au>
References: <20250129045352.10728-1-matt@traverse.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_161922_968418_9B354D25 
X-CRM114-Status: GOOD (  10.06  )
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

A device tree binding for the Microchip USB5744 hub controller
was added in commit 02be19e914b8 ("dt-bindings: usb: Add support
for Microchip usb5744 hub controller").

U-Boot will consume this binding in order to perform the
necessary actions to enable the USB hub ports over I2C.
(We previously used our own out-of-tree driver for
this task)

The Ten64 board does not have any switchable supplies
for the voltage rails utilized by the USB5744, so a
pair of dummy supplies have been added to facilitate
operation with U-Boot's hub driver.

Signed-off-by: Mathew McBride <matt@traverse.com.au>
---
Changes in v2:
 - provide unique node names for the two regulators
 - remove unnecessary newline under &usb1
---
 .../boot/dts/freescale/fsl-ls1088a-ten64.dts  | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
index bc0d89427fbe5..3a11068f2212f 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
@@ -87,6 +87,22 @@ sfp_xg1: dpmac1-sfp {
 		los-gpios = <&sfpgpio 7 GPIO_ACTIVE_HIGH>;
 		maximum-power-milliwatt = <2000>;
 	};
+
+	usb1v2_supply: regulator-usbhub-1v2 {
+		compatible = "regulator-fixed";
+		regulator-name = "usbhub_1v2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+	};
+
+	system3v3_supply: regulator-system-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "system_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 };
 
 /* XG1 - Upper SFP */
@@ -231,6 +247,12 @@ at97sc: tpm@29 {
 		compatible = "atmel,at97sc3204t";
 		reg = <0x29>;
 	};
+
+	usbhub: usb-hub@2d {
+		compatible = "microchip,usb5744";
+		reg = <0x2d>;
+	};
+
 };
 
 &i2c2 {
@@ -378,10 +400,32 @@ partition@9400000 {
 	};
 };
 
+/* LS1088A USB Port 0 - direct to bottom USB-A port */
 &usb0 {
 	status = "okay";
 };
 
+/* LS1088A USB Port 1 - to Microchip USB5744 USB Hub */
 &usb1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
+
+	hub_2_0: hub@1 {
+		compatible = "usb424,2744";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		i2c-bus = <&usbhub>;
+		vdd-supply = <&system3v3_supply>;
+		vdd2-supply = <&usb1v2_supply>;
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb424,5744";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		i2c-bus = <&usbhub>;
+		vdd-supply = <&system3v3_supply>;
+		vdd2-supply = <&usb1v2_supply>;
+	};
 };
-- 
2.45.1


