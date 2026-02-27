Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B61BFEFB70
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 17:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A9U6I+mLX1JQSTjfL64j8Iv+JYQLtuWYA0l/ELiacio=; b=JyNwngGaU24dMLGW0qhVtRm0mb
	qsq5p2PU98O+guL+uG67CbYlfG1LyLLrvvVyBADabRuDGXhwbKgoyFB3m6M9J3mMLtZXjqPuZuauu
	1flARSM+ynSgkoHhsYyuHYaxussuz4EYvfDac81t6sWz5+ZD+HwZvDFLYzTiu+j6nE9YLhn/lg7OH
	S8Dq8hnhSncqqAFNuEE2deNxj9FTQjyLJ80751QResGvyCv7j/OWeJT4SZYHHzvYXy/S/bMRHROkN
	a7XbpdxoAdRJYfbC6ZP29SPsbBfyvRMeJ0WacM2EYbj+r6HnDq5JjBOXJEsjszZoAZuj/jGMN8LFt
	fQwCkAAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw20a-00000008pkz-3rou;
	Fri, 27 Feb 2026 17:52:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw20U-00000008piH-49Wf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 17:52:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F0D4044232;
	Fri, 27 Feb 2026 17:52:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93165C2BC87;
	Fri, 27 Feb 2026 17:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772214724;
	bh=rbxhkxoFkbgVJcHFFqOrA4/4vQ1RgZNPDVV7X5oTc9I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kHMUBrwNR1dSDEPxiwjji5YgXG1sVOeJaLHndrWPf0urS20mOLrpKvNY7obAdT/YA
	 +4Boi4EcubM28rxBW7O7AvHFWILbgVKEKQoscqgRcTUHvyYd17epCl2Xo/a0e69dBt
	 TH87WGO7FIZ4R+WHxnBpPBTUyoyKm0XAllkbeE308cdr6UVO6ULtlHLZ7CVcaTdLP+
	 mahUq5LDvdf12eUSt4+yixkVbOD4L1V7CdjpTUxQQ5uX2vWiuSC3ZhXfuzSrtOvszI
	 JXypgCvzDIbzDeYKU/KKkuwTpgWnn0VX4gAd/W4+l15X3mHZtGsI6rbB4zR4/D6ELV
	 AQoykA5oVzAWw==
Received: by wens.tw (Postfix, from userid 1000)
	id 23DD65FEB2; Sat, 28 Feb 2026 01:52:02 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: allwinner: sun55i-a523: Add pinmux for spi0 on PJ pins
Date: Sat, 28 Feb 2026 01:51:54 +0800
Message-ID: <20260227175157.2339758-3-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260227175157.2339758-1-wens@kernel.org>
References: <20260227175157.2339758-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_095207_065374_AF236CA9 
X-CRM114-Status: GOOD (  10.89  )
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

The Avaota A1 board uses spi0 on the PJ pins to connect a SPI NAND
chip.

Add the full set of pins. Even though this board doesn't use CS1, other
boards may do so in the future.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index b8263e2872af..fbdf23e90cf7 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -245,6 +245,13 @@ spi0_pc_pins: spi0-pc-pins {
 				allwinner,pinmux = <4>;
 			};
 
+			/omit-if-no-ref/
+			spi0_pj_pins: spi0-pj-pins {
+				pins = "PJ21", "PJ22", "PJ23";
+				function = "spi0";
+				allwinner,pinmux = <5>;
+			};
+
 			/omit-if-no-ref/
 			spi0_cs0_pc_pin: spi0-cs0-pc-pin {
 				pins = "PC3";
@@ -252,6 +259,13 @@ spi0_cs0_pc_pin: spi0-cs0-pc-pin {
 				allwinner,pinmux = <4>;
 			};
 
+			/omit-if-no-ref/
+			spi0_cs0_pj_pin: spi0-cs0-pj-pin {
+				pins = "PJ20";
+				function = "spi0";
+				allwinner,pinmux = <5>;
+			};
+
 			/omit-if-no-ref/
 			spi0_cs1_pc_pin: spi0-cs1-pc-pin {
 				pins = "PC7";
@@ -259,6 +273,13 @@ spi0_cs1_pc_pin: spi0-cs1-pc-pin {
 				allwinner,pinmux = <4>;
 			};
 
+			/omit-if-no-ref/
+			spi0_cs1_pj_pin: spi0-cs1-pj-pin {
+				pins = "PJ24";
+				function = "spi0";
+				allwinner,pinmux = <5>;
+			};
+
 			/omit-if-no-ref/
 			spi0_hold_pc_pin: spi0-hold-pc-pin {
 				/* conflicts with eMMC D7 */
@@ -267,6 +288,13 @@ spi0_hold_pc_pin: spi0-hold-pc-pin {
 				allwinner,pinmux = <4>;
 			};
 
+			/omit-if-no-ref/
+			spi0_hold_pj_pin: spi0-hold-pj-pin {
+				pins = "PJ26";
+				function = "spi0";
+				allwinner,pinmux = <5>;
+			};
+
 			/omit-if-no-ref/
 			spi0_wp_pc_pin: spi0-wp-pc-pin {
 				/* conflicts with eMMC D2 */
@@ -275,6 +303,13 @@ spi0_wp_pc_pin: spi0-wp-pc-pin {
 				allwinner,pinmux = <4>;
 			};
 
+			/omit-if-no-ref/
+			spi0_wp_pj_pin: spi0-wp-pj-pin {
+				pins = "PJ25";
+				function = "spi0";
+				allwinner,pinmux = <5>;
+			};
+
 			uart0_pb_pins: uart0-pb-pins {
 				pins = "PB9", "PB10";
 				allwinner,pinmux = <2>;
-- 
2.47.3


