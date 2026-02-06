Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4060DEB28C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 05:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AM421lbCvkRnD46VnL4qnZ95KStO1BJURGzCJykN5dc=; b=maXYs/AwOBXw8WA8qbEwlPQ0hi
	IO6TnX+c+i60HtmrXq9SSo9LMCFTRtyLbXJdtzntC9HKepM8QPaqwQXJukdthRW1utQytNv1cEiBX
	vR33wM7Kcw3YHqAXW8rw11seLklNZKpC4M0Z2vDw/JwIHMvJQG6YaNQaEBidSME7ZnE27tl8Sl3cz
	718O4nIGlAfiVmTnp07/BVDP5F+tcyFNafw+r50v8ZELRihp5BtuYuxPjus4l0Hn2F6OukOOTnzgK
	KimUzuhNAso3wPLZQYmEv/dDi1VUnbqsWqfK+WXhsSvLMTPeZzRZQClH/T++v35KNEmsZy/R1lXUR
	M83y9jDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voEMR-0000000AtVM-2x3Z;
	Fri, 06 Feb 2026 05:26:31 +0000
Received: from fhigh-a1-smtp.messagingengine.com ([103.168.172.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voEML-0000000AtSz-1IUK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 05:26:28 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 06ECD14001DA;
	Fri,  6 Feb 2026 00:26:23 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 06 Feb 2026 00:26:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=traverse.com.au;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1770355583; x=1770441983; bh=AM421lbCvkRnD46VnL4qnZ95KStO1BJU
	RGzCJykN5dc=; b=HxOUQILhWtCSjS9HFu+lIWbmpI/F4GHKXiRsobSMPOKhuMlL
	08ogJ5vp6+s4jmyqP5zYc9PIGyIO1AEZWscwKy7c0g8oJtAat6uDe4N2vCbf5Sz0
	TtWM9w3ES/5uAiHd055rqsTnnhLUxYZe9V4RdL9krVqZfHFztqQD8hgK/6tHO/b4
	V4qSoh31w4UdItkPAPTIoGEWO8rTzZ+kARGHEYbhAe15Z1ia37XiWsAtnIoh6GmR
	w+SzMSdiAKApnkyClbdlx0O5PDzUOKK9OAp7LiMCZCb4j3n7MLazGsYRqk9c3XXC
	o7qd9rvPzvVd6Iy7vAqL+bKvuMZhk/9ddR8E1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770355583; x=
	1770441983; bh=AM421lbCvkRnD46VnL4qnZ95KStO1BJURGzCJykN5dc=; b=k
	8gANKES+0g4u52VF3e3Q6vTVv0FCOvpvUKDcUMq+aBKQiXXMMdmA9aCSIIC8M8vP
	dWsZ0FIbQUeE6z+RV8DzzKdTXTZ7Hi+bb/ekp8gNlGklFj6t2znNnMXKdLxaHJtu
	AkLhyin/g7+d79nij901avXHgIRW968XqyV7FU17rmga5pZFX4Qhr6mi6M9jh+Z8
	L4614odq0cDByQN6J7GEUnNufcvVOAAKkC4t+lu9tt1mt/twuclEfgo44YWjnN94
	0lGAsVADVbqnLewkM3FmTFmFd8I326iZHKe5ikYkQZppYAGIcS+Q7hbyUZEbJOjF
	xJPd8hyz88ZxDmXqn3t5w==
X-ME-Sender: <xms:fnuFaQTFJa_3miOstwQoQAjZnHR9BLjKmX5Hr3Y92_5wxnGbm0jj5A>
    <xme:fnuFaQVbeswFpHcdInhcV0Qa0nYrne9YD2EdIiLTqRy3qoKo_-rvs5cFTdUSYaEXB
    jg2aKor8c6M2F5GtXWkMbqKHnXNrOHGrGbeuirH19Vtql89isDXjw9b>
X-ME-Received: <xmr:fnuFaRcUmcMxQtRg4k_WmQnuUThG4GfKM4bKx0eWz-olhBHssXSHmSi7HOuucg00ahQjm5pRnmeADA30sOkl7kcckViezNyM2Ju750mK1Od0vbgrpmTH90s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeejfedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforghthhgv
    ficuofgtuehrihguvgcuoehmrghtthesthhrrghvvghrshgvrdgtohhmrdgruheqnecugg
    ftrfgrthhtvghrnhepffdvtdfhkeelffffgfejkeefteeuhefhiefgfffgkeduueejheff
    teffleetgfehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepmhgrthhtsehtrhgrvhgvrhhsvgdrtghomhdrrghupdhnsggprhgtphhtthhopeek
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrghtthesthhrrghvvghrshgvrd
    gtohhmrdgruhdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvth
    hrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghr
    mhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepfhhrrghnkhdrlhhisehngihprdgtohhmpdhrtghpthhtoheptghonhhorhdoughtse
    hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:fnuFaULt-lTPRBeUPSfRtqru-Ye11J9tjPoWhVCgSpwo7HHae2M4Wg>
    <xmx:fnuFaeyAWBbMpls_LQa8JEjWLOFLigti60nMpPCgrO9CdDEtn5P4-g>
    <xmx:fnuFaauitJpuzaRKt6R3D3tockAncmEl7sfk9rFFB47aHI22ouBRwg>
    <xmx:fnuFaRDhuTEtig5Jes2vdasrLXU-4-Dx80cXrKFT6LMYSu20EChToQ>
    <xmx:f3uFaVQ1TNvZl0eu-MusRiVfONcUEsKTqLd1UHriZpKMBYtU1AkLqVQv>
Feedback-ID: i426947f3:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Feb 2026 00:26:20 -0500 (EST)
From: Mathew McBride <matt@traverse.com.au>
Date: Fri, 06 Feb 2026 16:26:12 +1100
Subject: [PATCH v2 1/3] arm64: dts: freescale: ten64: add emc2301 fan
 controller and thermal set points
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-ten64-dts-updates-2025-12-v2-1-2d77f47a89e7@traverse.com.au>
References: <20260206-ten64-dts-updates-2025-12-v2-0-2d77f47a89e7@traverse.com.au>
In-Reply-To: <20260206-ten64-dts-updates-2025-12-v2-0-2d77f47a89e7@traverse.com.au>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mathew McBride <matt@traverse.com.au>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770355576; l=2279;
 i=matt@traverse.com.au; s=20260115; h=from:subject:message-id;
 bh=EhEafYcR5G6YrM9Al28I4jrc6wnuvl/PvTiP7j00trE=;
 b=IM3ssMusOPWcyhf1kFdV0mt3MToLxdINan6DObN/OD7GpXdIyi2BzWNzAOCBSn+vXRAUJNfOs
 ORQ1dmg96q5CXupgHUXbSAiUES9tglovRvifDoD7itGi4RZoZwjdF0F
X-Developer-Key: i=matt@traverse.com.au; a=ed25519;
 pk=SM+aGm9Y2fPJ2prfH/b5lab73fTBrKL5UsJwdzv7Pbg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_212627_648949_846E5768 
X-CRM114-Status: GOOD (  11.51  )
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

Add support for using the on-board EMC2301 fan controller as
a cooling device for the main SoC.

This functionality only became available in the mainline
kernel recently, so the fan controller has been absent from the
mainline DTS copy until now.

The thermal set points are intended for the Ten64
Desktop appliance, it is anticipated that users of the board
in other installations will be able to override these through
their own FDT overlay or by a fixup function in the system firmware.

Signed-off-by: Mathew McBride <matt@traverse.com.au>
---
 .../arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
index 71765ec91745..35470c0a928f 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
@@ -68,6 +68,42 @@ led-2 {
 		};
 	};
 
+	thermal-zones {
+		soc-thermal {
+			trips {
+				fanlow0: fanlow0 {
+					temperature = <60000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+				fanmid0: fanmid0 {
+					temperature = <65000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+				fanmax0: fanmax0 {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+			};
+			cooling-maps {
+				map2 {
+					trip = <&fanlow0>;
+					cooling-device = <&casefan 0 3>;
+				};
+				map3 {
+					trip = <&fanmid0>;
+					cooling-device = <&casefan 4 7>;
+				};
+				map4 {
+					trip = <&fanmax0>;
+					cooling-device = <&casefan 8 THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+
 	sfp_xg0: dpmac2-sfp {
 		compatible = "sff,sfp";
 		i2c-bus = <&sfplower_i2c>;
@@ -253,6 +289,20 @@ usbhub: usb-hub@2d {
 		reg = <0x2d>;
 	};
 
+	fan_controller: emc2301@2f {
+		compatible = "microchip,emc2305";
+		reg = <0x2f>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#pwm-cells = <3>;
+
+		casefan: fan@0 {
+			reg = <0x0>;
+			pwms = <&fan_controller 26000 0 1>;
+			#cooling-cells = <2>;
+		};
+	};
+
 	uc: board-controller@7e {
 		compatible = "traverse,ten64-controller";
 		reg = <0x7e>;

-- 
2.51.2


