Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC96606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 22:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hL2BbK+C;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eiZpq1Yz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ln4tk/LM9M0+d3paa8i5oxkJfRqKQYtzPOy14WdQ1gI=; b=hL2BbK+CxZpaHm
	JKBgyq2wETc0BtiBE30HTcTEMt0c5twre842mn5vbyyqNxMUee9qr3aHlr8nhk+r63ShwwZkjpenz
	uvb0X0SJSXvxR9eVLAr0Cg4TGNGuyUxfcdmXVYwmalR6KhxT9qb898tjiycaSVJ41pmwKIXP/OFlb
	3osoDUxLlmAZALJSeyXD39fACJsoCMduXPOJKad2njZ8fhUi3hZBgjlmkRUJhdBMT0+411kXyaMbj
	XUbPiP00zGV3frP+/evv4T7dmpPE+7QxDjKpNREsG/3c/3iZzKfEWuJkzS0MQbrltTrUnlvfvhGBd
	6MzUY+2lyzP97McbJUQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP62T-0000000AoP0-3Pj9;
	Thu, 05 Nov 2026 22:34:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP62R-0000000AoMo-3QA0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 22:34:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F0E7438E4;
	Thu,  5 Nov 2026 22:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3636D1F008A2;
	Thu,  5 Nov 2026 22:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793918071;
	bh=ln4tk/LM9M0+d3paa8i5oxkJfRqKQYtzPOy14WdQ1gI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eiZpq1YzgAa2fy5imGg6jK1ziacqZsR4XCVKvq9Luinw/tkBPVYxUEpFWi/v3wSlc
	 URVQY8WgqkQUUVL7I/4SNiiAvzyPEAZEb1aOoPH9rXKXojw2Fvkn8m4p6vooyj2EFO
	 oreYil7CtgOMgJ6e2kdQ8lNU1YGW+pyoi92hOqefWViOFnmkkAGOVkoETke2g/+oD6
	 U06zlWgipG1tHZzGwYlXN0VFFFzG1zJpb7sCUxsOjphvi5QyokkkrPevb/RL2QwDS4
	 gxIYWdJbDwyynQMQ2KH+Rwfrf16bx7W59wppdw6RmoBGuQhpkKCfodzpkMEo2hlqEJ
	 FJOYTKmaPKqpA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 05 Nov 2026 16:34:16 -0600
Subject: [PATCH 3/7] ARM: dts: arm/vexpress-v2m: Move regulator and led
 nodes out of bus
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-dt-vexpress-dts-fixes-v1-3-66615c3c8ec3@kernel.org>
References: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
In-Reply-To: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>, Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The regulator and led nodes are not MMIO devices, so they don't belong
in a "simple-bus" node. Move them to the root level. This mirrors the
change already done in vexpress-v2m-rs1.dtsi.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm/boot/dts/arm/vexpress-v2m.dtsi | 162 ++++++++++++++++----------------
 1 file changed, 81 insertions(+), 81 deletions(-)

diff --git a/arch/arm/boot/dts/arm/vexpress-v2m.dtsi b/arch/arm/boot/dts/arm/vexpress-v2m.dtsi
index 2a8d1d6dfc7e..e368f04bf513 100644
--- a/arch/arm/boot/dts/arm/vexpress-v2m.dtsi
+++ b/arch/arm/boot/dts/arm/vexpress-v2m.dtsi
@@ -20,6 +20,87 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
 / {
+	v2m_fixed_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	v2m_clk24mhz: clock-24000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "v2m:clk24mhz";
+	};
+
+	v2m_refclk1mhz: clock-1000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <1000000>;
+		clock-output-names = "v2m:refclk1mhz";
+	};
+
+	v2m_refclk32khz: clock-32768 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		clock-output-names = "v2m:refclk32khz";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-1 {
+			label = "v2m:green:user1";
+			gpios = <&v2m_led_gpios 0 0>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		led-2 {
+			label = "v2m:green:user2";
+			gpios = <&v2m_led_gpios 1 0>;
+			linux,default-trigger = "disk-activity";
+		};
+
+		led-3 {
+			label = "v2m:green:user3";
+			gpios = <&v2m_led_gpios 2 0>;
+			linux,default-trigger = "cpu0";
+		};
+
+		led-4 {
+			label = "v2m:green:user4";
+			gpios = <&v2m_led_gpios 3 0>;
+			linux,default-trigger = "cpu1";
+		};
+
+		led-5 {
+			label = "v2m:green:user5";
+			gpios = <&v2m_led_gpios 4 0>;
+			linux,default-trigger = "cpu2";
+		};
+
+		led-6 {
+			label = "v2m:green:user6";
+			gpios = <&v2m_led_gpios 5 0>;
+			linux,default-trigger = "cpu3";
+		};
+
+		led-7 {
+			label = "v2m:green:user7";
+			gpios = <&v2m_led_gpios 6 0>;
+			linux,default-trigger = "cpu4";
+		};
+
+		led-8 {
+			label = "v2m:green:user8";
+			gpios = <&v2m_led_gpios 7 0>;
+			linux,default-trigger = "cpu5";
+		};
+	};
+
 	bus@40000000 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
@@ -423,87 +504,6 @@ clcd_pads_mb: endpoint {
 					};
 				};
 			};
-
-			v2m_fixed_3v3: regulator-3v3 {
-				compatible = "regulator-fixed";
-				regulator-name = "3V3";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-always-on;
-			};
-
-			v2m_clk24mhz: clock-24000000 {
-				compatible = "fixed-clock";
-				#clock-cells = <0>;
-				clock-frequency = <24000000>;
-				clock-output-names = "v2m:clk24mhz";
-			};
-
-			v2m_refclk1mhz: clock-1000000 {
-				compatible = "fixed-clock";
-				#clock-cells = <0>;
-				clock-frequency = <1000000>;
-				clock-output-names = "v2m:refclk1mhz";
-			};
-
-			v2m_refclk32khz: clock-32768 {
-				compatible = "fixed-clock";
-				#clock-cells = <0>;
-				clock-frequency = <32768>;
-				clock-output-names = "v2m:refclk32khz";
-			};
-
-			leds {
-				compatible = "gpio-leds";
-
-				led-user1 {
-					label = "v2m:green:user1";
-					gpios = <&v2m_led_gpios 0 0>;
-					linux,default-trigger = "heartbeat";
-				};
-
-				led-user2 {
-					label = "v2m:green:user2";
-					gpios = <&v2m_led_gpios 1 0>;
-					linux,default-trigger = "mmc0";
-				};
-
-				led-user3 {
-					label = "v2m:green:user3";
-					gpios = <&v2m_led_gpios 2 0>;
-					linux,default-trigger = "cpu0";
-				};
-
-				led-user4 {
-					label = "v2m:green:user4";
-					gpios = <&v2m_led_gpios 3 0>;
-					linux,default-trigger = "cpu1";
-				};
-
-				led-user5 {
-					label = "v2m:green:user5";
-					gpios = <&v2m_led_gpios 4 0>;
-					linux,default-trigger = "cpu2";
-				};
-
-				led-user6 {
-					label = "v2m:green:user6";
-					gpios = <&v2m_led_gpios 5 0>;
-					linux,default-trigger = "cpu3";
-				};
-
-				led-user7 {
-					label = "v2m:green:user7";
-					gpios = <&v2m_led_gpios 6 0>;
-					linux,default-trigger = "cpu4";
-				};
-
-				led-user8 {
-					label = "v2m:green:user8";
-					gpios = <&v2m_led_gpios 7 0>;
-					linux,default-trigger = "cpu5";
-				};
-			};
 		};
 	};
 };

-- 
2.53.0


