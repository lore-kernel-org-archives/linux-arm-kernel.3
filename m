Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BC2C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 04:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eMyQJwJhmVS3FVKPKH5yOTL3X3dY5nNNbnJgYKK3EIg=; b=Eb+IoVgVR2Ja6uUoR/pzyibB5/
	PdlaDRqxGrAw0pDL2CvVBZ/kO6OUpSuqdZRtJbJ81LbxwMbvCQOM0fnnRm4HsKS3kiXaRckzgd4bB
	1/orCr9YMl7lo+7KQY4aRlopFewBMlkkw71bTP3+DJRsJEX+8HsNhoiN75qWR6P20tHSKZPQFhT2T
	yykGT35/s7bziZdjvMrkiGXny0PW/dbDo1EZVC/4xswk2FMgHoZbCyByloNdo4TmRfI1VmYHzGkwH
	6USp1fzHzwe7j/1UCK7afTpKagc/OAW4Zzg8/sjUe32D1mRSkLe3tK46uiHMLN7e1chGLelZePuTy
	CEUaFn/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td06o-00000006K7A-2u1Q;
	Wed, 29 Jan 2025 04:55:26 +0000
Received: from fout-b2-smtp.messagingengine.com ([202.12.124.145])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td05T-00000006K2h-0hOC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 04:54:05 +0000
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 0738A11401BD;
	Tue, 28 Jan 2025 23:53:59 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 28 Jan 2025 23:53:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=traverse.com.au;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1738126438; x=1738212838; bh=eMyQJwJhmV
	S3FVKPKH5yOTL3X3dY5nNNbnJgYKK3EIg=; b=pc3Ep6c8WKGOT0jQNPJZEKNP0Z
	L2I8T9E96YJhKYx8I8BAvQ61oqb9U2ayuuUeN95O9BVike+q9xFYplJMfh6eF5LK
	2pmNWHNDYQ7rSL2E9xyFW7cphTQIc/1ovNWTLmEQ1DgPMQzdGKTm3QZANJCXGcae
	TfrjItuhqOArSW27O0ZZFHYxmyTHi1OUphoHxppmoKHFSkfwXvUX5WwLuvLTGj9h
	NEITZI4nnx2628+64/r7N3IYJ/lJV7ZKOtvMgHEWMzY8COLsGc5M6Sm9sAIEUrUG
	8NpdKE16NMGvYgpXbn5Ecydd9mTQquMvoEQFw+QnFcOeYcpDPposZQrJw03g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1738126438; x=1738212838; bh=eMyQJwJhmVS3FVKPKH5yOTL3X3dY5nNNbnJ
	gYKK3EIg=; b=wYiJ4UISqkuI/hGv6BV6qz/+UWg2dQmbwI4+F98jVUhsoshDCdn
	DBj6T4K+4jjyC8ksA8cC0xBtnfq+AfVr0LjjpW6EyYN7FLXXuxnbpdN8MUkg1lL8
	6jvnk+h/pXM5g6jJqW+5nX9JlYWslxJqrlKsVDeKF+Hgq+jsorSDaaSw0NLf8lB6
	XnWeewRJQyYYjR0WCwO/8DAci3xrawTYzandiZDICM1/7ljCrEVRni/EAvydkejy
	2z5ICu9M1l9cNtNAgfUCF8o6+LZHM3HJX4NyvzilxLAdIRwa25vzGRdnfKVDRkkt
	uoxaVziL87UFyt6gSle+NmvFtm/tnw/mL0w==
X-ME-Sender: <xms:ZrSZZ4KOF0tSGajFZ7RswBpdy8p-OV0FH3ukqAKXa3NCgJ1phNzr4Q>
    <xme:ZrSZZ4KV3oaTbfJJ5jueQlC-Wel75iW4LcGY9I2oWbhaqG2F7d5a7faki1lllxS4B
    Uu8RdSZOMOhUjxySZA>
X-ME-Received: <xmr:ZrSZZ4vMUO7Xg6UIUUrdPOwgOK7vD0qQEIifR1Sys6jI0IFBAvMA6H1LVjoK9ULVT1dAE-qqc-srJecnYzjuxqFUlGYQwguaSVEdsyBcrwbxNELy8xxk5CaKNY8pdNMFG1rGHIYBw-K32KH1I8rn8HDJsXk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfh
    rhhomhepofgrthhhvgifucfotgeurhhiuggvuceomhgrthhtsehtrhgrvhgvrhhsvgdrtg
    homhdrrghuqeenucggtffrrghtthgvrhhnpefgkeetgedufffgtdevvdejjefftdfghfet
    fefgueehhfeljeffgfefueeujeelffenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehmrghtthesthhrrghvvghrshgvrdgtohhmrdgruhdpnhgs
    pghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggvvhhitg
    gvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidq
    rghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpth
    htoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepmhgrthhtsehtrhgrvhgvrhhsvgdrtghomhdrrghu
X-ME-Proxy: <xmx:ZrSZZ1ZlM2-OSRFpHaVtdpiZEC2G5R-ouCjRbNBiFL8Nyu6CR1mfvQ>
    <xmx:ZrSZZ_YtecGEbON3THFkAd3EF1vAtZIiVmC_Z_Ph8Ge8EyXl9cgmJg>
    <xmx:ZrSZZxAyknMpM3ufooBk3O2vU3eU06XCrTQRPcWaL7G0KneSqdzuTg>
    <xmx:ZrSZZ1ZClwcXVtGh4sS4PfXcchUk2evef7tTyFcUgcQgg-e0TcxTLg>
    <xmx:ZrSZZ9PtxyriO9N9UBYaCxYml2DXBfqIhBb5fcUxCB-HXZj5ZDoJeeH8>
Feedback-ID: i426947f3:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Jan 2025 23:53:55 -0500 (EST)
From: Mathew McBride <matt@traverse.com.au>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Mathew McBride <matt@traverse.com.au>
Subject: [PATCH] arm64: dts: freescale: ten64: add usb hub definition
Date: Wed, 29 Jan 2025 15:53:52 +1100
Message-ID: <20250129045352.10728-1-matt@traverse.com.au>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_205404_201894_0ACDD03E 
X-CRM114-Status: UNSURE (   9.88  )
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
 .../boot/dts/freescale/fsl-ls1088a-ten64.dts  | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
index bc0d89427fbe5..fc15c83d222f6 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
@@ -87,6 +87,22 @@ sfp_xg1: dpmac1-sfp {
 		los-gpios = <&sfpgpio 7 GPIO_ACTIVE_HIGH>;
 		maximum-power-milliwatt = <2000>;
 	};
+
+	usb1v2_supply: regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "usbhub_1v2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+	};
+
+	system3v3_supply: regulator {
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
@@ -378,10 +400,33 @@ partition@9400000 {
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
+
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


