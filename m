Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2120CC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 12:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czkhJoG2Gc/7FyisTMqLRYvCWAiMp1iGp7hQ46B82n8=; b=kn5KSubYNPpFbJTLT2N4Kgv05L
	M7Ig95D6G0u0KEzEYsFcqocI5PRHLSgXC8aP4ZjS6nxRqqvghZsaMn7MmLAQGEKbexu4VBI6dR68E
	2iSb0zdHj25BwC5Cm6VDfTGs6qxWaMW45th9Wb6o1vrs593MOFJSn/L1SEE89w19uNv+pe/HrHpL4
	KZRCB3uSb5OFjk1ssAXGb2QOBw/Q+zXjUMB8IR1s8Pl/PLByATvVMP6HfeGwjqXOTsj6ihrsL59OI
	8emAR1D1sO0Bb1oec/VaKzblIg3c65eQJ2YCYNiS0qb3+LYyLRBdIeWzxxF7oAPH47f5tGGU054oy
	a8jvOLmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul5DU-00000005ajR-1uSE;
	Sun, 10 Aug 2025 12:32:00 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul53c-00000005a3j-0XU6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 12:21:49 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-61813e2fc73so1346226a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Aug 2025 05:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754828507; x=1755433307; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czkhJoG2Gc/7FyisTMqLRYvCWAiMp1iGp7hQ46B82n8=;
        b=h4SULRoLIPQlNVC1JEc4wczxsKJnoDdchjsHAq+Y5ipfBU2DvbvgfDgVcMYjpbQsP4
         9ZF08l9GNHPCMhFbyQDlGH+2deGOppmn5MeytRM3VdGnxS+RrvXSWN+MjgMbNoIaBGMT
         eLV29FwyJ9uljSUi8Z9QFoWE1RZdEqmeywvhAtdeLdLpQzVGBRSGGydwIzz8BfWnSolq
         8MFMcl3G3QftunUrPFCwzP997w/AH4EmH9paIS5RpYzR24GKNC4/uDC73pPe2jM6rdS8
         usrf9tYpLSYyodhuce6DJqKpIK5O0aHcfwrc28zpRaTVM2SlpWtpq0zb6iFi16pU5ldQ
         aztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754828507; x=1755433307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czkhJoG2Gc/7FyisTMqLRYvCWAiMp1iGp7hQ46B82n8=;
        b=sVNL5ArWe3g6hvYKCCXhUOOckISQF9xzLIGOPA8QdPFKDBF1xGZ2CTEY6SPGU7cpot
         9HXLnvbDxCYyYE2D4BmGmLYF3SXb65zH6QHEaehEUD+1jjKrsgD+kL8wFkaBx6d8P6FJ
         anTiREib4DeHymVkvFZBfNzmIPackobyDIua5HRmD/ireSAHW96SoQbu++HGQTwhDvZz
         m/bQegGMYxG2k4/z5dcZuFQaqydC6iY4cmqgKvRkiP5Lhs71KDPzidk4DFePoqueao+n
         geKf24bzNls72tppEretQp8BbfCTUYlVbXYefoWKG+gnNhJKDC+lg+acq8OuJHIIQ+QS
         Fa+g==
X-Forwarded-Encrypted: i=1; AJvYcCWGhYEAed87e2URLLZLZzct4p3Du3TmbiJpP2nfKhT7aINiKetS77urIRU5OgmbrH70ib4ebLQXyQwBUWbZZjyG@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8u93nwy/JUrgJPCUSBkJSvpYhnZrrgGQ5c2qokJ3OQKHiDCRW
	FwJfHDklKRfEugU1j0/HzxGhjetMPuipoNF9fDaN/zwsY++YTpwFnLqwTRlVqBSXd+w=
X-Gm-Gg: ASbGncvsY8WOFbLV5Ki3H66uKqGjrgS1zup4VsSD37/8Y0Xf/DzZgSPy9G7uvApXoPY
	217nye9eQzyysSPQtx7+oxL14gldFkz/l5vYpGaMSTqThBTlYOhjUiSP8y58sxvuJ5mevOQd2BI
	YnenpdQ5PZeeAOvhdAaX/+dW4UA/YK9tl8XM/IaH26dkrMtEaJOaLAl/IAkZ0exOFG6F02UOG36
	zwu8nvgDeawThOBKipVb9BuSrfLbmrF2L05nWkXWXtxAy9l1Y13JiWPiyufyX44F6qKIiH8fBVB
	YNv/DCXC6K1c//5cQ4iyo66vNXLEifmcGG7ZlQ5z9umuR8gyOfrMkisAjH1wfF4rOBPsSwu6Ro0
	iI1+kynxLni29SZ1hVEmzDCOET/AxL/UVV0pPH7/teFXLmZFvo9rv
X-Google-Smtp-Source: AGHT+IEtxors3X7Rdp3bYfeRsAV85kpmN7w+thRk3VDKj4rUsmhSECv/3nQi8r+6f+zFV+oHk5YoZw==
X-Received: by 2002:a17:907:d23:b0:ae3:635c:53c1 with SMTP id a640c23a62f3a-af9c6518c68mr911773766b.54.1754828506589;
        Sun, 10 Aug 2025 05:21:46 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a86758fcsm16611897a12.0.2025.08.10.05.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 05:21:45 -0700 (PDT)
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
	niklas.soderlund@ragnatech.se,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 3/4] arm64: dts: renesas: r9a08g045: Add TSU node
Date: Sun, 10 Aug 2025 15:21:24 +0300
Message-ID: <20250810122125.792966-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250810122125.792966-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250810122125.792966-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_052148_167376_77F11883 
X-CRM114-Status: GOOD (  15.13  )
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

Changes in v4:
- none

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


