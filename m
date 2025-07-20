Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEC2C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 09:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V8jVCNBeo/+6f3Mo8OE9T6Hkz0Ib2C8UypT57jXFp3E=; b=k0NVf2gMYpwYty8mZSrxjmwu2u
	ZcP1GnbZJvQG+A/dWjGuah3yHWmk7vSBL36fiZr0IZ8FZ6ajrM1N5TwYSib/7vnhPGg6JuZWogyr+
	JHVrffjlB2pd27nILD3GzMrb2WrCibWox5VDYNWjS9lwV37kBr/2go9rpbflT9ERGytZ8RMiGIFfE
	Aox534qP6nlIX5rEOUx97HQ+6POUye/G4Mdo0XO4/+k7woJFGvfO9wPAI8YCRjYqRGipQKzllfOZh
	mmmBu2EnVLL/xXDWwdKdq+hJWfIinIdKCgQjxJYS1NzUlRUVX2daKjbz0fxbs++0eErQJhvSV7058
	wsdfGtug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udQBv-0000000F5RZ-3qKO;
	Sun, 20 Jul 2025 09:18:43 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udPm8-0000000F3fS-1dmi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 08:52:05 +0000
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 707857A0189;
	Sun, 20 Jul 2025 04:52:03 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 20 Jul 2025 04:52:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1753001523; x=
	1753087923; bh=V8jVCNBeo/+6f3Mo8OE9T6Hkz0Ib2C8UypT57jXFp3E=; b=i
	nTep5QD3SOrLVtWUx/yStr90f+zFyJTIqgfv7SJlewJ11ST5hCphpLKBqzZE6hck
	1iNV2CCIu55nJccFp59JHPe9Kd2K/tP9tsZX6ojIPS4OcOkLklkHXYGo38PWRZwu
	94bLetnGY2r3z9IS28v7oG6n8YyRDvjsVSr7carlXhThLEuPk2ZtBCWC3UhpPt1U
	+fDvRHB+kq1LWc5YpnGwYIfHdS8Ko5JO3Jn7lVqmwejPPp0tsi767G0HM6gKZf2Z
	NDJojk++91tC0UHAKgULHMae0aUhZaop6AqH9BArdtLOAFk9DljUviiFzNNUws5j
	Bmc+X0csQ6p3oS0hGpJhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1753001523; x=1753087923; bh=V
	8jVCNBeo/+6f3Mo8OE9T6Hkz0Ib2C8UypT57jXFp3E=; b=mw3Y3eyIpZl1ypRFT
	Oasg3AzEuEja397h9R8hix+h+C0a7szyYB4SaEzBuemF85zmA5JC/IP26M9v37MN
	E3fmfNgHhVZZPIBB9Ut/lqTkQLGCu6B1NzTYu1OwmoJahx+8hcq1vDqOksnxMxF+
	M8vdXeX2RQvYwcHNA0WlPIwYK85/Q9yY6wmcgMrCnnJzvWVlFWOa/l8fePEPsyIX
	rSh8IlyVboMHmrITDvUYM/JJ7RJIctU2PW93DZdjWfOll/jI69Agl1hL8NDd0ZBY
	C74mzOas8LN3wP7U9QssWyxPNnB0MMrNwmSreF3BT+/Vkjgowb9+mGOdxB8r2hlX
	gekEg==
X-ME-Sender: <xms:M658aGIS9UOhZDqcwXYOul5OaJKczvr1YgnU59-0721uv3tej0Sydw>
    <xme:M658aJD7MIL2iO-C5HJ6Ed_KUfP758lkYwzjmcHZNrIWPo_mpeCDl2j0scUDSC4xm
    BCaCF0B9mFoIaNgTg>
X-ME-Received: <xmr:M658aA7IBAtmJtS5DuFqdKdSR7p0GtR3D-6BpZQ8t6F0rfxdPspqPxC45XCmJz7U0LmjPgs471LCPGVTACdeI5j747Z6jQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeikeejjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcuhggr
    lhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrthhtvg
    hrnhepffehieffgedtgfffjeetveegfeekleeileekveeuteffteetudffveegieeiheet
    necuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprhihrg
    hnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgtphhtthhopeduiedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgu
    theskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprh
    gtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphht
    thhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtghpthhtoheprghnughrvg
    drphhriiihfigrrhgrsegrrhhmrdgtohhmpdhrtghpthhtohepmhgrtghrohgrlhhphhgr
    kedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhikhhutghhrghnleeksehgmhgrih
    hlrdgtohhm
X-ME-Proxy: <xmx:M658aNH_rF0hjDBpHor-Yf2hSivaaCXRFxZK9R05yqhBXunogvi-5A>
    <xmx:M658aDQwY599IYLUMJsPVHhmOxK_2jqtTwLDDRJ1bq8tUvVTpxmlDg>
    <xmx:M658aPdDJ2H2Dn9oSNvqr6Fh-3GKdwUEXxtqpoOa7M7x3oXAiRnkIQ>
    <xmx:M658aBik_StL-bc4QrSvUNnYjHehB7Nrcgfk8ULmfbO33xV0rtmBkQ>
    <xmx:M658aNH6L_-2E669Ete9w2ud0NTN-GkCcQ12xE9KbSk4nR2-1V6LBidG>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Jul 2025 04:51:58 -0400 (EDT)
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
	dri-devel@lists.freedesktop.org,
	Ryan Walklin <ryan@testtoast.com>,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v2 10/12] arm64: dts: allwinner: h616: Add LCD timing controller nodes
Date: Sun, 20 Jul 2025 20:48:48 +1200
Message-ID: <20250720085047.5340-11-ryan@testtoast.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250720085047.5340-1-ryan@testtoast.com>
References: <20250720085047.5340-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_015204_531850_68F80194 
X-CRM114-Status: GOOD (  12.54  )
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

The Allwinner H616 has a display pipeline similar to other Allwinner
devices, specifically the A10, but using a newer display engine
revision (DE33).

Not all output pins are exposed on all package variants, for example
only the H700 and T507 have LCD pins exposed, but all variants support
HDMI output. On the die these are connected to a display engine via a
TCON TOP and one or more timing controllers (TCONs).

Add TCON nodes for the TOP, and the LCD and TV timing controllers. The
timing controllers are compatible with the existing R40 driver.

HDMI output support is not provided in this series so for now note this
within the relevant node to prevent a DT compiler error.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>

--
Changelog v1..v2:
- Add correct register, address and size cell, and endpoint definitions
- Add stub tcon_lcd0_out_lcd endpoint so that device DTs only need to provide remote endpoint.
---
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 141 ++++++++++++++++++
 1 file changed, 141 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 7347332f54a7..e4209dc6b46b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -7,9 +7,12 @@
 #include <dt-bindings/clock/sun50i-h616-ccu.h>
 #include <dt-bindings/clock/sun50i-h6-r-ccu.h>
 #include <dt-bindings/clock/sun6i-rtc.h>
+#include <dt-bindings/clock/sun8i-de2.h>
+#include <dt-bindings/clock/sun8i-tcon-top.h>
 #include <dt-bindings/reset/sun50i-h616-ccu.h>
 #include <dt-bindings/reset/sun50i-h6-r-ccu.h>
 #include <dt-bindings/thermal/thermal.h>
+#include <dt-bindings/reset/sun8i-de2.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -926,6 +929,144 @@ ohci3: usb@5311400 {
 			status = "disabled";
 		};
 
+		tcon_top: tcon-top@6510000 {
+			compatible = "allwinner,sun50i-h6-tcon-top";
+			reg = <0x06510000 0x1000>;
+			clocks = <&ccu CLK_BUS_TCON_TOP>,
+				 <&ccu CLK_TCON_TV0>;
+			clock-names = "bus", "tcon-tv0";
+			clock-output-names = "tcon-top-tv0";
+			#clock-cells = <1>;
+			resets = <&ccu RST_BUS_TCON_TOP>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_top_mixer0_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					tcon_top_mixer0_in_mixer0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&mixer0_out_tcon_top>;
+					};
+				};
+
+				tcon_top_mixer0_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					tcon_top_mixer0_out_tcon_lcd0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_lcd0_in_tcon_top_mixer0>;
+					};
+
+					tcon_top_mixer0_out_tcon_tv0: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&tcon_tv0_in_tcon_top_mixer0>;
+					};
+				};
+
+				tcon_top_hdmi_in: port@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+
+					tcon_top_hdmi_in_tcon_tv0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_tv0_out_tcon_top>;
+					};
+				};
+
+				tcon_top_hdmi_out: port@5 {
+					reg = <5>;
+
+					tcon_top_hdmi_out_hdmi: endpoint {
+						/* placeholder for HDMI  - remote-endpoint = <&hdmi_in_tcon_top>;*/
+					};
+				};
+			};
+		};
+
+		tcon_lcd0: lcd-controller@6511000 {
+			compatible = "allwinner,sun8i-r40-tcon-lcd";
+			reg = <0x06511000 0x1000>;
+			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TCON_LCD0>, <&ccu CLK_TCON_LCD0>;
+			clock-names = "ahb", "tcon-ch0";
+			clock-output-names = "tcon-data-clock";
+			#clock-cells = <0>;
+			resets = <&ccu RST_BUS_TCON_LCD0>, <&ccu RST_BUS_LVDS>;
+			reset-names = "lcd", "lvds";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_lcd0_in: port@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					tcon_lcd0_in_tcon_top_mixer0: endpoint {
+						remote-endpoint = <&tcon_top_mixer0_out_tcon_lcd0>;
+					};
+				};
+
+				tcon_lcd0_out: port@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					tcon_lcd0_out_lcd: endpoint@0 {
+						reg = <0>;
+					};
+				};
+			};
+		};
+
+		tcon_tv0: lcd-controller@6515000 {
+			compatible = "allwinner,sun50i-h6-tcon-tv",
+				     "allwinner,sun8i-r40-tcon-tv";
+			reg = <0x06515000 0x1000>;
+			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TCON_TV0>,
+				 <&tcon_top CLK_TCON_TOP_TV0>;
+			clock-names = "ahb", "tcon-ch1";
+			#clock-cells = <0>;
+			resets = <&ccu RST_BUS_TCON_TV0>;
+			reset-names = "lcd";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_tv0_in: port@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					tcon_tv0_in_tcon_top_mixer0: endpoint {
+						remote-endpoint = <&tcon_top_mixer0_out_tcon_tv0>;
+					};
+				};
+
+				tcon_tv0_out: port@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					tcon_tv0_out_tcon_top: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_top_hdmi_in_tcon_tv0>;
+					};
+				};
+			};
+		};
+
 		rtc: rtc@7000000 {
 			compatible = "allwinner,sun50i-h616-rtc";
 			reg = <0x07000000 0x400>;
-- 
2.50.1


