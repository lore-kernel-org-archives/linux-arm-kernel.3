Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D765AC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 17:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1yo3qtSfIhFeGAEiRzmVMQo73ZalEAsSnX/cJq79kA=; b=GHTUwpX2S7FtPxnDDa4l/Gd3+2
	mZ/ZZIXfWuNNXg/O2D7oWlHx0IrA4xrVPrw3P4kpQtrpSwzduANIJqbc9lQ8U7+2H5g6bsx2hb7ZC
	CNj+bxj59r10xUsAL9/cT2bgfCS6hcERzVngNp0ANfh5EHCUzOgI5JwAMAkLfMNq6VIRA8KPNM+Ol
	OFdC4sMFicg1EqVYAEM4TgBPaniX+R+Ilne7amty9LvWMXWGo7a1O8aS4wPz5hqAVn0+ScwT4N/hn
	rIfD9nmQVynAedsZtJy94/nXWada3sHQ+qIpIsg92IM5+63CikiVNuRwlTqZAOUR+Qtoc6oSs/54Y
	uH/2TSVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcPL-0000000Eeo8-1fBM;
	Mon, 24 Feb 2025 17:38:19 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmcJL-0000000EdWm-0er3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 17:32:08 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5ded69e6134so7723637a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 09:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740418325; x=1741023125; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1yo3qtSfIhFeGAEiRzmVMQo73ZalEAsSnX/cJq79kA=;
        b=IiJokPZoXtV4yA1krseKE2Uq55lW1AvuW3svq4ghvXopyiNn7XEz6CTSeb7otjWDK2
         SdUy1qq/nOFGwGSNMms46daXXoYp9/gsF/6CW9cN8VZhS6Sfsy+SuIY8xT1qEI4i5Ue0
         sSYvJ5dRdW7QpYmcm5JnFAeN+2G7kK1xR+Cetr1YmciQ8oVxr446YTwNm3G/oWSEzviG
         zbQOztklL6LK/U2b7h3atBTojBpTbytKMkjsULwhS61bHOvFbxyHBRR/Xhay/poil1JN
         GH+YtVWz5ZsCnhhpckEpb/a+vMmpTShb52GBzDAoQEKTQBYkqhQ/8cFjXkzWNLZ3rOvV
         PbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740418325; x=1741023125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1yo3qtSfIhFeGAEiRzmVMQo73ZalEAsSnX/cJq79kA=;
        b=U1BQXE+2dYiw9Po/kSbStUPZ5jJEFmwWFQW9d90Ksci9vVVOOUzXzqh+UcvRqA704j
         +WXzd0KvQqsScVBzq9WdI+ieib2/4kLNjv48eF/6hCnfojtatuSQKRSABZwPRtLCm55A
         LxxXe8DT635PXdqRV+VJSDIqt8C3+J7DTS7eHRMdkDHKzEU4ujFcx12iFoh7uUl5zwUE
         akR+QYgW8kq7Ts8H5zRSd3FrTj5LuTdsYvu+r/XCfJju7F63HmVcejU1LZyZ1/rRhgO6
         Rv/hT7pGjAbnfAtrod4Q8dZ91gBnNXmWmgcNF72S/PszfVRyVA4TCEDC117PA4V2xy7T
         Ccxw==
X-Forwarded-Encrypted: i=1; AJvYcCUpoBOrqH21Hl+A9Aji7SMAVwTWybCulXl6GVGXX0KHRZDN8DakW3Ij2Sk3SegstTByLXn+FSPthjNKfODSRcON@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7nCOlMEW0aTXnWtS1z3we6TnMXACLOQU9ohfC20/0PFCoOBde
	v8vbjPMek+7wGZRo33YlgvohheTpFHHvdJesQGeeIpo4Z1Gh+9Yg6Gdauwy7kHo=
X-Gm-Gg: ASbGncuk5txFacvbl3r+IN6aw0MFYz8tbh2QR32SnH6xJjqVdVZfxnIK876eYGIS8TP
	ZVTPPFc82ziFRprlq7qNFBbF74gILZUn+lXt3sCSM3Ch1EPSwddPAY96rXBI1Jxg7FyUeIucKak
	72i99JmFWKYoj5HU326EBNUINPj3l4POx0K45KUsRb2PHhieBua/O6RfeXc9ifoDo7k6efLBPyG
	8xOPfdAFSUzmRuZ4eXK5Jy0QaolIG45ksjyqKFU9gPENG780laMmF5IXk3e8U6E7W+rrERz3Rh0
	myh6Ao0E7lmvnjfVzooPDFXovmDrIuf+HID8WfSmeVJEA2azqg4RMTM=
X-Google-Smtp-Source: AGHT+IEvfXereLG4YfzIby0vL8BC3Kca01jNjsC9KnxwSBKk7fKmr/umERW/k7CxUdOT/iVLoKfvqg==
X-Received: by 2002:a17:907:6d02:b0:ab7:b5d6:2696 with SMTP id a640c23a62f3a-abc09b1470amr1217759666b.32.1740418325327;
        Mon, 24 Feb 2025 09:32:05 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece270a7fsm18674357a12.58.2025.02.24.09.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 09:32:04 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 3/4] arm64: dts: renesas: r9a08g045: Add TSU node
Date: Mon, 24 Feb 2025 19:31:43 +0200
Message-ID: <20250224173144.1952801-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250224173144.1952801-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250224173144.1952801-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_093207_196508_19B0DA3E 
X-CRM114-Status: GOOD (  15.01  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add TSU node along with thermal zones and keep it enabled in the SoC DTSI.
The temperature reported by the TSU can only be read through channel 8 of
the ADC. Therefore, enable the ADC by default.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- collected Geert's tag
- adjusted the trip points temperature as suggested in the review
  process
- added cpu_alert1 passive trip point as suggested in the review
  process; along with it changed the trip point nodes and label names

Hi, Geert,

I kept your Rb tag. Please let me know if it should be dropped.

Thank you,
Claudiu

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    | 49 ++++++++++++++++++-
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |  4 --
 2 files changed, 48 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 0364f89776e6..3f56fff7d9b0 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -233,7 +233,6 @@ adc: adc@10058000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			#io-channel-cells = <1>;
-			status = "disabled";
 
 			channel@0 {
 				reg = <0>;
@@ -272,6 +271,17 @@ channel@8 {
 			};
 		};
 
+		tsu: thermal@10059000 {
+			compatible = "renesas,r9a08g045-tsu";
+			reg = <0 0x10059000 0 0x1000>;
+			clocks = <&cpg CPG_MOD R9A08G045_TSU_PCLK>;
+			resets = <&cpg R9A08G045_TSU_PRESETN>;
+			power-domains = <&cpg>;
+			#thermal-sensor-cells = <0>;
+			io-channels = <&adc 8>;
+			io-channel-names = "tsu";
+		};
+
 		vbattb: clock-controller@1005c000 {
 			compatible = "renesas,r9a08g045-vbattb";
 			reg = <0 0x1005c000 0 0x1000>;
@@ -717,6 +727,43 @@ timer {
 				  "hyp-virt";
 	};
 
+	thermal-zones {
+		cpu_thermal: cpu-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsu>;
+			sustainable-power = <423>;
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert0>;
+					cooling-device = <&cpu0 0 2>;
+					contribution = <1024>;
+				};
+			};
+
+			trips {
+				cpu_crit: cpu-critical {
+					temperature = <110000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+
+				cpu_alert1: trip-point1 {
+					temperature = <90000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				cpu_alert0: trip-point0 {
+					temperature = <85000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+
 	vbattb_xtal: vbattb-xtal {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 39845faec894..6f25ab617982 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -84,10 +84,6 @@ x3_clk: x3-clock {
 	};
 };
 
-&adc {
-	status = "okay";
-};
-
 #if SW_CONFIG3 == SW_ON
 &eth0 {
 	pinctrl-0 = <&eth0_pins>;
-- 
2.43.0


