Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D01C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 12:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjLsQQnQgoiVkYb0Cm8bLRBPR+XW6bRhPpST0RE8duM=; b=yrdKhbJx4Is0XoHGUdbuW4tL79
	36MASQ4Og+KFIItanVQTBtC3IE3jIDcC4cRvVWpxV34qIYDGqhkuH5vziyCdmWQg9l+d014YPugMl
	4X8sMCx3QFiEPcRgBqbu8HS6Ua03pZ+PUqnI6iofG0kPB+hT6qV5VbjUQQeY+jtl5+FJMNy1vvhnh
	uow60RKbhUWXTZuxff4vQR/DMFUUXz/nCOYaXXOyS/Oa7G/1KeZUv4BRyHZy0hPk+gpya1VZvAuhw
	KqS7sr2KjLztW3NVCuc2NO+BnAjRTzQN+lM3ianxoTWlR9aMuesv40kKU91PDq055km5xCty0RjDI
	Z4ns95SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tew1Y-0000000FRuT-3d9T;
	Mon, 03 Feb 2025 12:58:00 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tevsh-0000000FPgS-0MTE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 12:48:52 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2162c0f6a39so92365455ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 04:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738586930; x=1739191730; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjLsQQnQgoiVkYb0Cm8bLRBPR+XW6bRhPpST0RE8duM=;
        b=GGWl8vhUD0uYBgnhw0OXiKQf1KDKWO8koYsSzCbsZKTSuR1ddcMznQdQJWDP3NwNms
         he2ESeBNSdkbrbJRmqrqFFJljBYfDfkzIQiAbvuODOogU7iaSpkrEYyvbw0Ku4cNPR1m
         QUCon4HHSP4ORtWoTD50WpaJVqQ+bA0Ly/bG233jzC1YtkdZcKLFQMMLu93HH2Pne34+
         hV0LF/3J296hfQfiO7xvZrPCpUzvM/kBuDt1qr/LatkPfHUFFpHdBrJN/moDY5k0F/Uf
         S2qQ9WsZ5wgU1yNduVrimOHqxr9XhQCU1i/bPij7rOVQSBAkxcmORts0s+RyQW3+d7wz
         24+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586930; x=1739191730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjLsQQnQgoiVkYb0Cm8bLRBPR+XW6bRhPpST0RE8duM=;
        b=tnBBnEbmiQDrbsccHPIX98eWSw0x+dpX2/lMeilnighrSc8aBUXmg6i4JVfQYQdNSD
         3zCywfVJV3ydItaKu0EUQC69ZxQ0ciL8gVHQ47NxpRurxqmZJ6P0N+Vq2mL9LjZBfe1y
         iegYKaBHnf1yPATocQrRgbpn1/dyCinu1yI/b4ngpuiJnhjiTRD6FO+troZ8ZNxO0pW+
         Fefh0zdV5QNz5VK67wyKx6fHdBr8rtZg5tsAOCDp3DwZzW8HKBxjKb+hNCqvJuyouwsY
         nivrFQt5LLVO0SumJRjK2aPfFZAyv3fB2HG90Rr83ZSf/iWgYdrX3C6jXH2aW2Fv5BY9
         n1Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWt3OyaLZzjY28LI/6lnsGYdOFPVhsTEwj2xghByfLnkNsoBADh6oiH2IBthI7sFuy5yOAQIJdnLW9C79VIQRbE@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0UGVuBJIJO/ZlUS8o7sfsdCjN6QrjyJ/WhYI1OUc+HHpHtTYz
	JE+igXRLNEHQ64vgN+hx2TdN5TKYXSjhqGxjIzFhwj9VauE0n2AH
X-Gm-Gg: ASbGncuO8x8wbtrwO1qMmohc6Hz/VNTuVonVqY1u5sVhzQkBEskarmKJnFL0t93s9Tn
	43gX0ykhXn0hEJS9sCr+7K7XGCMFUuDz8YL6AcxMo+ezfQAmom2LizNknvEpFxyOw/iaOoP2Fg9
	bhNAcQFZ1LdkUeDh+sy8xPP7hYNo2mFOROlxS3kAnfd48Xrb2JwS72dDoVKpj4VEkgu7cp3q0RI
	8paOm3Wn4AuSzPlviR7Z7vyHO09ytZOYh/6p6+O8I9vX8t+ESTQ1XTnUeYTIR6ksScUSuK7YSz4
	M023vdi1yO4v7q7n
X-Google-Smtp-Source: AGHT+IG2gJDQV9ByXKH3jCoAUfKcG9AffDalAhNUFxq2O5PchU6Ikr4yuxy3gHVej9DOE0y0Nn8ySA==
X-Received: by 2002:a05:6a20:12d2:b0:1ed:d35e:b6d7 with SMTP id adf61e73a8af0-1edd35eb796mr845104637.5.1738586930412;
        Mon, 03 Feb 2025 04:48:50 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-acebddbb0d4sm7835225a12.10.2025.02.03.04.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:48:50 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH RESEND 6/9] arm64: dts: apple: t8010: Add cpufreq nodes
Date: Mon,  3 Feb 2025 20:43:45 +0800
Message-ID: <20250203124747.41541-7-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203124747.41541-1-towinchenmi@gmail.com>
References: <20250203124747.41541-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_044851_122451_D10415B0 
X-CRM114-Status: GOOD (  13.81  )
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

Add cpufreq nodes for Apple A10 SoC. There is a transparent hardware
big.LITTLE switcher in this SoC. Spoof E-core p-state frequencies such
that CPU capacity does not appear to change when switching between core
types.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8010-7.dtsi     |  8 ++
 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi |  8 ++
 arch/arm64/boot/dts/apple/t8010.dtsi       | 86 ++++++++++++++++++++++
 3 files changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8010-7.dtsi b/arch/arm64/boot/dts/apple/t8010-7.dtsi
index 1332fd73f50f..919e067ef073 100644
--- a/arch/arm64/boot/dts/apple/t8010-7.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010-7.dtsi
@@ -41,3 +41,11 @@ switch-mute {
 		};
 	};
 };
+
+&hurricane_opp09 {
+	status = "okay";
+};
+
+&hurricane_opp10 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t8010-ipad6.dtsi b/arch/arm64/boot/dts/apple/t8010-ipad6.dtsi
index 81696c6e302c..4ea8cf12e430 100644
--- a/arch/arm64/boot/dts/apple/t8010-ipad6.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010-ipad6.dtsi
@@ -42,3 +42,11 @@ button-volup {
 		};
 	};
 };
+
+&hurricane_opp09 {
+	status = "okay";
+};
+
+&hurricane_opp10 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index e3d6a8354103..2547e8c60cad 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -32,6 +32,8 @@ cpu0: cpu@0 {
 			compatible = "apple,hurricane-zephyr";
 			reg = <0x0 0x0>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			operating-points-v2 = <&fusion_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
@@ -40,11 +42,89 @@ cpu1: cpu@1 {
 			compatible = "apple,hurricane-zephyr";
 			reg = <0x0 0x1>;
 			cpu-release-addr = <0 0>; /* To be filled by loader */
+			operating-points-v2 = <&fusion_opp>;
+			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
 		};
 	};
 
+	fusion_opp: opp-table {
+		compatible = "operating-points-v2";
+
+		/*
+		 * Apple Fusion Architecture: Hardware big.LITTLE switcher
+		 * that use p-state transitions to switch between cores.
+		 * Only one type of core can be active at a given time.
+		 *
+		 * The E-core frequencies are adjusted so performance scales
+		 * linearly with reported clock speed.
+		 */
+
+		opp01 {
+			opp-hz = /bits/ 64 <172000000>; /* 300 MHz, E-core */
+			opp-level = <1>;
+			clock-latency-ns = <11000>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <230000000>; /* 396 MHz, E-core */
+			opp-level = <2>;
+			clock-latency-ns = <49000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <425000000>; /* 732 MHz, E-core */
+			opp-level = <3>;
+			clock-latency-ns = <13000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <637000000>; /* 1092 MHz, E-core */
+			opp-level = <4>;
+			clock-latency-ns = <18000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <756000000>;
+			opp-level = <5>;
+			clock-latency-ns = <35000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1056000000>;
+			opp-level = <6>;
+			clock-latency-ns = <31000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <1356000000>;
+			opp-level = <7>;
+			clock-latency-ns = <37000>;
+		};
+		opp08 {
+			opp-hz = /bits/ 64 <1644000000>;
+			opp-level = <8>;
+			clock-latency-ns = <39500>;
+		};
+		hurricane_opp09: opp09 {
+			opp-hz = /bits/ 64 <1944000000>;
+			opp-level = <9>;
+			clock-latency-ns = <46000>;
+			status = "disabled"; /* Not available on N112 */
+		};
+		hurricane_opp10: opp10 {
+			opp-hz = /bits/ 64 <2244000000>;
+			opp-level = <10>;
+			clock-latency-ns = <56000>;
+			status = "disabled"; /* Not available on N112 */
+		};
+#if 0
+		/* Not available until CPU deep sleep is implemented */
+		hurricane_opp11: opp11 {
+			opp-hz = /bits/ 64 <2340000000>;
+			opp-level = <11>;
+			clock-latency-ns = <56000>;
+			turbo-mode;
+			status = "disabled"; /* Not available on N112 */
+		};
+#endif
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -52,6 +132,12 @@ soc {
 		nonposted-mmio;
 		ranges;
 
+		cpufreq: performance-controller@202f20000 {
+			compatible = "apple,t8010-cluster-cpufreq", "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
+			reg = <0x2 0x02f20000 0 0x1000>;
+			#performance-domain-cells = <0>;
+		};
+
 		serial0: serial@20a0c0000 {
 			compatible = "apple,s5l-uart";
 			reg = <0x2 0x0a0c0000 0x0 0x4000>;
-- 
2.48.1


