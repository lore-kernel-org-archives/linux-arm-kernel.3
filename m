Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E006E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 16:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WzIPlmgQYvqaNwex1YHnIy7YRZOsyuGpSTntBCm6GNw=; b=i98RuMa2gBgF3fCKdyg7hCJ439
	s0XxJuc20bXNIxmKUxE/lLr5kgLEzUuZp2kFAlcR67IK2asjWv9eGz8v52k4vFs/9qrarszDnHlwC
	OyN9uFOOgLtoR0s8Tjl8u9c9DL+hlkyTolXDgCyq43Zf6zvEPnWBvoRNUpeC0iY+dr+GDiuJDt1Tt
	8BIR7+p18jM/TC0em04yWMNKl5nNmYXOvqwHgo3YVuNgPSlq+w4PWU5Kbju8Ic0cuE5EeMOSRLXZ+
	n3+MX5UrRSmgO4eQT9CNggK0ZHkpihJlALQIKFvdpdQCa5/nZ+PD8b+ZT5zwiN7Ake4hJGpzVn+3J
	SMijUJpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTknz-0000000DSzy-3kcA;
	Fri, 03 Jan 2025 16:45:47 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTkh7-0000000DRvm-1EYm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 16:38:42 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-aa6a618981eso2044003066b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 08:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1735922320; x=1736527120; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WzIPlmgQYvqaNwex1YHnIy7YRZOsyuGpSTntBCm6GNw=;
        b=JfAjYg1UPuX1TZ/QTb6HshKZLeP9Ly5YuqaGx6SXzVafcZxbbmTr5/WE0VWJAQGblR
         0ddpVA1yYGkgkO85zfPIFIH8F/TXmoJnTJyS3bTnsDohr7wHmLxGgua7OeGk4GnoaYOo
         rId2MlXlMqDKio08hDxe0tqYqDRug8PjwqKFbpsl/IyV1HGFsRNqH4Quu1YPvgH0aLaN
         0uu0SSBqYVD0LYF0Hr6V3O0fcMdXhZ2BLOf+Hi9wEmI1WKA0ljhBlsUkTERCSgLPt+Ek
         vEStcjyHUwYxuT7/U58+u0SZ/VKiWP5kAeNMM2W88Lr9jiQfqGlp+CHqP5sWT0cbvbav
         hmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735922320; x=1736527120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WzIPlmgQYvqaNwex1YHnIy7YRZOsyuGpSTntBCm6GNw=;
        b=d7rJuO9FRWTZDP+lhntzs9lu/qDKQFtFk3sI+bHOFYgtLdouMwUZtBV09oBYub2Bk6
         yVAXUxUPZOP9kHQX8uyAXfW7pkPwLIdDzMFsCGfVhamVXRJJNu5b7aYgQ7KgMtdSZJoK
         BROQ6PCo7YP32ueLiwMYmkuQoYWKMJvDD/thOpVppB1KiQ6hk9P09v4Ev6cLCiyhbl3O
         5EJZ4BpaT4b9+YcgZ3muqgrtHvUqhndTs09I7Li8Ds21MghdQmi8Aen3pHZvqjJ4Vo/Q
         dCnNwyvCQyWwcN/COwGc86WSM9a9l0DTnZo4sZ9QdX2RNDdWGiSvy7u8COSME01EU9LR
         zSzA==
X-Forwarded-Encrypted: i=1; AJvYcCVa8f7qo4JycKN+4ch0a6oFyL3YAWJY68LlKYSvP64EZE3NgJQhtj02xYU1Z2Hj6fcduNE4JXtLjcNgMKSQMnac@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7aD7mKeLBI28DZBGtU8W8DLPrrR5BH2Peh/7f3saSie1CokwQ
	Fhp/FjnKwy90sE/ygEQnjgZX3TavutW2r+QtTHDHRtWfL9ePK58jRztDKyAPRDc=
X-Gm-Gg: ASbGncsLTNQmnzG1FDkemK0AZWOc1e2WowWwESa4PDh/D1ePWztGsM4D/XgNWw5shPA
	GzNygRYmd+3h+60gljAobKFXDY5HPvj57g7qAHUbplq9fqziE/tjN805hbxyIJDsABrNDxNtjYN
	9iOn9tkIUUi3KjpU/QYNJPLDgBY7EKt7JJt6/OQgHaY5ZGRFrCYe9LUYr1MWEVtNhmebWkt01OL
	TM275IKCSN85D7+r4HdO5TOx/nXo7oiW2h1Vtgh6RlAZtrEEuh2pgOjI9ZQRXbzm+rPwLSbcd9g
	V3tg5dTgmUo=
X-Google-Smtp-Source: AGHT+IE84xLk/WtOOKb4Wwm+4qdlu+SqcMhw+gwQquj/QrYYaTzEDXr5cpwvEJHSOv4z3jx+xnmhFA==
X-Received: by 2002:a17:907:724b:b0:aa6:7737:1991 with SMTP id a640c23a62f3a-aac2702ae51mr5003000966b.2.1735922318403;
        Fri, 03 Jan 2025 08:38:38 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e8953b6sm1932984066b.65.2025.01.03.08.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 08:38:37 -0800 (PST)
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
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	ulf.hansson@linaro.org
Cc: claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 5/6] arm64: dts: renesas: r9a08g045: Add TSU node
Date: Fri,  3 Jan 2025 18:38:04 +0200
Message-ID: <20250103163805.1775705-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_083841_332205_2503AD0A 
X-CRM114-Status: GOOD (  12.79  )
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

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    | 43 ++++++++++++++++++-
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |  4 --
 2 files changed, 42 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index a9b98db9ef95..fd74138198a8 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -205,7 +205,6 @@ adc: adc@10058000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			#io-channel-cells = <1>;
-			status = "disabled";
 
 			channel@0 {
 				reg = <0>;
@@ -244,6 +243,17 @@ channel@8 {
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
@@ -690,6 +700,37 @@ timer {
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
+					trip = <&target>;
+					cooling-device = <&cpu0 0 2>;
+					contribution = <1024>;
+				};
+			};
+
+			trips {
+				sensor_crit: sensor-crit {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+
+				target: trip-point {
+					temperature = <100000>;
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
index ef12c1c462a7..041d256d7b79 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -102,10 +102,6 @@ x3_clk: x3-clock {
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


