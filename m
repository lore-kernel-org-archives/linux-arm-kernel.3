Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F1DC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 14:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMplGUMafRwp7HXFHP8HY84mcYsdyQC2G6ObWF63fwE=; b=LJxYBl5T/U+MjTsuJCdzoYYoFI
	v6snebQV1XjYESb/MX5JwTWO/80LR/AEjESjwtEHBG+sYmwzv+VDmAU9I9tH6a27avlFp8z6ZSl7W
	VrpgLMepBY6bs7w2WGXP/hxIppCYbtAuDN2dtffEhBJvCaGP3kWt90MGYpMR1fkDMXarj8xDiAIPp
	aoCGQK2FwmPL1wVHw1hL75CEkRSdq6TyOfqx3xCMyN/DqT8ZQDHEZXAs1ArOc9nhgkSJqvof8SzEV
	jbKrfK65FdVkB9Pb8I9piz9tasbSvkAbQiWtvJVlnN79+mtRDW59FlhnpWw5TS+4yBfnVf7uNhvJP
	2nUgIyEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twiPU-00000003LAR-12NE;
	Mon, 24 Mar 2025 14:04:12 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twiIm-00000003K6Z-19yN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 13:57:17 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso19853115e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 06:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1742824635; x=1743429435; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMplGUMafRwp7HXFHP8HY84mcYsdyQC2G6ObWF63fwE=;
        b=FIhNHSgzaU+6i24HR5Zl14DS6tbhJdu/qzUuWG2xeeSBpsrJ/uePBqmlob0QjBW2kD
         qWUdWpb4tOJ10SjAjqFagdoep9RDQSihGGVvumfyk7WHbvZcEtgPhHCz7lj45M3IrKsh
         j26S7jORV9frXqsLlLS/IBdqSTpMPUuXSuh8E4mJLWqTm2ktgK7GaL1SYrSDO7Epn4LU
         sIRJYAlxgHYV1hisS5WeavSmfUlnUj4jaJo0jLRmbthxKiyR9fHjbhW5GM3az5QOr+rL
         ArzA5rE8aQhDyxfOCjAW6ZQr3bpiTDUy/qWkNsxTbnotJ9WeiR5quIYOwBWyFchpaj08
         KH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742824635; x=1743429435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMplGUMafRwp7HXFHP8HY84mcYsdyQC2G6ObWF63fwE=;
        b=Aq0NCwu2Y6vfiWXYoC8aGRIViqwz+SythIQZhabpwHPrs4FyQWn386PUebstLvluFq
         7rFFlnDwljM4NZd6zkJn2gVKO5+vsAsk8Rbx2Aj78jPITBiRX2XPyJrYQlEnYCJ1m5IP
         XnspZKNKYcosQTQwuFL7nsN2Jf4Aa83XB8Ucq3aWUGUTx/caCZLnA7rE7Rwq+zWwbpFq
         7a5BGe87GMSSEZ1PH3tMSCIsNKAtP8x15a9LEOd4j7AOUVj0UDWEzxYKxOIW5ZepeLPK
         mOFeEt4lbVt8X3yrj/9XMOD+m/V72crs59+WJts6Hery2354V+/nuuYJURYMoPnaalLs
         AAMA==
X-Forwarded-Encrypted: i=1; AJvYcCUtfmIqZl8JDIaz/E8zKWSasJqgBwjux7iRyqsf+GdQuzos95iFQnhKtNYpTGVMDymJd5MHiyrguUbUJ8bpnlYP@lists.infradead.org
X-Gm-Message-State: AOJu0YzrwOWv8XeOc3gM0RjCl+z+kNRQICzNHwmufafEb3qI22d75XON
	oykjWzTQB+gP62PvuQ6mjQmsVXrqtqZ+ARlRP0sR0eRT0lUuzP3NoiSQ4QljtEM=
X-Gm-Gg: ASbGncujsZOPh9uIyLljv58zDsu7Ow8dYfG62VJ9NAO4GqNR7OwLgOT6GV87uTtfFaD
	jP3KlV2+lZGWAzeDn37JTsenh8M2BXG09T1goHg6K4d6LRTjU2ddM4DqQqJfSaqA71N5OqhF6Sg
	2l/FqvVawdzu1Dg2D1EQWusXekuoANni6k4xB1SPtW0HcuqEtpSflfTdGvtPfQoTDijSt+WKaOY
	FTmkSm5Ma8gZnjQr0mh2zWSb+JHV3R9PiLqoJs6sJFDxLfSArawuIQzZ67IWU7XyZYz1QKmPWnp
	dJjeDQMdJQFmRXrRjO54TT26cLu/qkZv8I53Tsb5cjglAnD4AlXZ4EeBRfYVQJFVYB+n2JWlZA=
	=
X-Google-Smtp-Source: AGHT+IHobCejWB+ti0E5Uw69+nVxjpEbVDbvYp3oPBiD2PXSMtx/XLxjlfZxbT4NY1k5LpuIjy51Hw==
X-Received: by 2002:a05:600c:1d15:b0:43c:fe85:e4a0 with SMTP id 5b1f17b1804b1-43d509ec36fmr89567225e9.7.1742824634707;
        Mon, 24 Mar 2025 06:57:14 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdbcfaasm120146525e9.35.2025.03.24.06.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 06:57:14 -0700 (PDT)
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
Subject: [PATCH v3 3/4] arm64: dts: renesas: r9a08g045: Add TSU node
Date: Mon, 24 Mar 2025 15:57:00 +0200
Message-ID: <20250324135701.179827-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250324135701.179827-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250324135701.179827-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_065716_315347_AD34B50B 
X-CRM114-Status: GOOD (  15.10  )
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

Changes in v3:
- none

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


