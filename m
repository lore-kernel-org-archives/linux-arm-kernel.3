Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F311CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 14:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fo5OW2N+fFWT46bTnXRh3LxSjEG1Sg+/vJAfEv3O438=; b=33wXfmP/VBe+ALw7S0YEAeHw7B
	1bcrHldPQL0SGnzcAUcZqQxkwAtW1jHGPd9H9qACyRxaJoWU3Mfx+OAdKn1ZGJyYnY345ZhPsgSG8
	qcv4Pjm7cobXNOpxH6Kz+bpSA5YYRN9ufS6sQWq5YLafEkjAdHGm+wxI4Wtp5Z4cPa8v/lscaGWeT
	OjMKGFxEMdOuZQXCkycnpIDX67L2Y/Oao7G3gmEpif6dTCVTxs3TJTmIHzcgEAA0iBwCCVJ5EAqpd
	tPHrcW0Zk51jRWoWBJKWBtik61gZRn2TZgiNZrA9sO8S+RFUQKE56bxs4tXasSjLBh6QWqANANWbv
	aGNe+Uhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNi6-0000000AoFY-3k7C;
	Tue, 19 Aug 2025 14:53:14 +0000
Received: from mail-wr1-f45.google.com ([209.85.221.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLAg-0000000AO78-12sH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 12:10:35 +0000
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3bb2fb3a48aso1996874f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 05:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755605432; x=1756210232; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fo5OW2N+fFWT46bTnXRh3LxSjEG1Sg+/vJAfEv3O438=;
        b=PKJ6X/BrmwLcPpok+gkBzLvtFMmValGXnYmCQeeTCT13DVYOo3sRSOnoUdLOwW8sh+
         JxDEYCoetFqj8xnDM7nR2pMQ7YoxeDv0YB2SH8Rf9LQlykslhuGMm6Eb0dNzNqcIWRLT
         UOgFEx1vshh+YV9hFsNQKJcCvNmQj+yzFoTrhkwKQ1FmhZ/4QJCaalj+QSZ8oMfXKl3R
         qPVLr0rLQaVoN30JWvrJAoJsmKednOvsZchgr7BduDUq6Hr5L+Qb31OpneM5jNzdC/I5
         pv5SfQOMzAyBlUHawCEw4aE9L1hKKQ0Qt8+nml7bYM42Rry6aTh2uZlqgaouIzSPCrFf
         axnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605432; x=1756210232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fo5OW2N+fFWT46bTnXRh3LxSjEG1Sg+/vJAfEv3O438=;
        b=llY5GKQUR/uBMfJUZK77kLdF45IbF1rNZUhyh7+wruQKXGAP6wt7i2ftjIUzyQ7slT
         kupXlR9r6folfEbIqXDUckjGISIvE25qfF8G2BL2wzyVAAvCTVPznJwQoSk3MCL7ECTW
         2A7LHruQnrNMvOzS+T5BFIE4VQNmcxhXiWnpons1eafnSUL5cjKvumvWyDPKp8feXtg+
         Jr+Iue6MhkQL2Nc7vXjZsmWFMzJsQYpBEEYcunEI64O0F9xk3AzaUt//dYgbIdf+gm9U
         rQmMETDcBImBBqKw9pjMtByH6ZLvd8N/t8x+Q0BqTDYGyHiwtix+KCKkFE724WBtLFNX
         h9Qw==
X-Gm-Message-State: AOJu0YwJ+k+Wahz6Onh5HTqQ9PEA6uOi+RAvSfCzx4WQ4C/slilwyiXz
	Gkp2KSIOtbAYthki94kUL8q7cvZB9CZp1St2ouDj6/MJqgCDpTBgIHaJzEyOfSk86qIv3dSSXQP
	OFXt4qkL6Jw==
X-Gm-Gg: ASbGnctrfD2n1KEdUAm2JPzmewcd6IHgw+DZh0A1eFJUu/tbS6bQmhZwQLvk+qu4wvM
	3U00xQLUfgchmLIqrMXA7D1R0gQRQVtKyIlNPL4ib3eVuzYCFArbBgUiLEAwfOK5ygUBi7lbDjm
	7Tmrb+xa4QrwJVN4X60ZdvtqO1eEsoiyOig9twS9g/TJRUsO8z+T0ZRvyHcM31nJKuhxpi2UZXR
	QpdhqinovW78ZVL5/xzne132hXahIQlSFivC7q/orgEF5ZhzLUt/+NtGcDp2aRDKONKv0V1FEkz
	j0CkvmtwACTPsMEtMQM5kyfuYGfJPEN6xlPxQ8QZoryvYP/c9tTofNm7aR1YFX3FyNxDce/A7hw
	9GR2drO1HGB5dgUyhdSUTAr9VzVabH1N0+z2RRiq6GrbwNCwOl/rtpvqaVQaknmUT0VVHPjXY7S
	/oYg==
X-Google-Smtp-Source: AGHT+IE+TigsoESUPEvEdx0SMj9TNE4WhIFMdtlTxF/XQWw9NIeo2Xu1D9pgQ3QTkx9YGaISinGf5g==
X-Received: by 2002:a05:6000:2212:b0:3b7:889e:2b2b with SMTP id ffacd0b85a97d-3c0ed1f2fbbmr2090455f8f.47.1755605432231;
        Tue, 19 Aug 2025 05:10:32 -0700 (PDT)
Received: from ta2.c.googlers.com (245.92.187.35.bc.googleusercontent.com. [35.187.92.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c074d43b9asm3464410f8f.24.2025.08.19.05.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:10:31 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 19 Aug 2025 12:10:22 +0000
Subject: [PATCH 3/3] arm64: dts: exynos: gs101: add OPPs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-acpm-dvfs-dt-v1-3-4e38b95408c4@linaro.org>
References: <20250819-acpm-dvfs-dt-v1-0-4e38b95408c4@linaro.org>
In-Reply-To: <20250819-acpm-dvfs-dt-v1-0-4e38b95408c4@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755605429; l=8502;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=a6PZI+tjZrmUg6w8G2uTeLCpE/pt0ZaCvCKU3fNi5Gw=;
 b=VHVnXzOLTTEgHy3PRapQ2DpiSk2f3PV2HmXhzrM77UxMkHCaAnS1joG5fcZS2vcpK5NnKpJ08
 YAM+PFCydyaBXyqSkyULZ629pZxk+fLLr7xvwiO6rmdO0pwi4Kg5QOM
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_051034_297055_5F4F94F2 
X-CRM114-Status: GOOD (  10.29  )
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

Add operating performance points (OPPs).

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 275 +++++++++++++++++++++++++++
 1 file changed, 275 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 42926f8bde8889ec99ecf9fc551629a0453e788f..b2303b3a3d176ef9b825d24bbe0bb0d51ef81246 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -77,6 +77,7 @@ cpu0: cpu@0 {
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
 			dynamic-power-coefficient = <70>;
+			operating-points-v2 = <&cpucl0_opp_table>;
 		};
 
 		cpu1: cpu@100 {
@@ -88,6 +89,7 @@ cpu1: cpu@100 {
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
 			dynamic-power-coefficient = <70>;
+			operating-points-v2 = <&cpucl0_opp_table>;
 		};
 
 		cpu2: cpu@200 {
@@ -99,6 +101,7 @@ cpu2: cpu@200 {
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
 			dynamic-power-coefficient = <70>;
+			operating-points-v2 = <&cpucl0_opp_table>;
 		};
 
 		cpu3: cpu@300 {
@@ -110,6 +113,7 @@ cpu3: cpu@300 {
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
 			dynamic-power-coefficient = <70>;
+			operating-points-v2 = <&cpucl0_opp_table>;
 		};
 
 		cpu4: cpu@400 {
@@ -121,6 +125,7 @@ cpu4: cpu@400 {
 			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
 			dynamic-power-coefficient = <284>;
+			operating-points-v2 = <&cpucl1_opp_table>;
 		};
 
 		cpu5: cpu@500 {
@@ -132,6 +137,7 @@ cpu5: cpu@500 {
 			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
 			dynamic-power-coefficient = <284>;
+			operating-points-v2 = <&cpucl1_opp_table>;
 		};
 
 		cpu6: cpu@600 {
@@ -143,6 +149,7 @@ cpu6: cpu@600 {
 			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <650>;
+			operating-points-v2 = <&cpucl2_opp_table>;
 		};
 
 		cpu7: cpu@700 {
@@ -154,6 +161,7 @@ cpu7: cpu@700 {
 			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <650>;
+			operating-points-v2 = <&cpucl2_opp_table>;
 		};
 
 		idle-states {
@@ -191,6 +199,273 @@ hera_cpu_sleep: cpu-hera-sleep {
 		};
 	};
 
+	cpucl0_opp_table: opp-table-0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <537500>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-574000000 {
+			opp-hz = /bits/ 64 <574000000>;
+			opp-microvolt = <600000>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-738000000 {
+			opp-hz = /bits/ 64 <738000000>;
+			opp-microvolt = <618750>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-930000000 {
+			opp-hz = /bits/ 64 <930000000>;
+			opp-microvolt = <668750>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1098000000 {
+			opp-hz = /bits/ 64 <1098000000>;
+			opp-microvolt = <712500>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1197000000 {
+			opp-hz = /bits/ 64 <1197000000>;
+			opp-microvolt = <731250>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1328000000 {
+			opp-hz = /bits/ 64 <1328000000>;
+			opp-microvolt = <762500>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1401000000 {
+			opp-hz = /bits/ 64 <1401000000>;
+			opp-microvolt = <781250>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1598000000 {
+			opp-hz = /bits/ 64 <1598000000>;
+			opp-microvolt = <831250>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1704000000 {
+			opp-hz = /bits/ 64 <1704000000>;
+			opp-microvolt = <862500>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1803000000 {
+			opp-hz = /bits/ 64 <1803000000>;
+			opp-microvolt = <906250>;
+			clock-latency-ns = <5000000>;
+		};
+	};
+
+	cpucl1_opp_table: opp-table-1 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <506250>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-553000000 {
+			opp-hz = /bits/ 64 <553000000>;
+			opp-microvolt = <537500>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-696000000 {
+			opp-hz = /bits/ 64 <696000000>;
+			opp-microvolt = <562500>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-799000000 {
+			opp-hz = /bits/ 64 <799000000>;
+			opp-microvolt = <581250>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-910000000 {
+			opp-hz = /bits/ 64 <910000000>;
+			opp-microvolt = <606250>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1024000000 {
+			opp-hz = /bits/ 64 <1024000000>;
+			opp-microvolt = <625000>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1197000000 {
+			opp-hz = /bits/ 64 <1197000000>;
+			opp-microvolt = <662500>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1328000000 {
+			opp-hz = /bits/ 64 <1328000000>;
+			opp-microvolt = <687500>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1491000000 {
+			opp-hz = /bits/ 64 <1491000000>;
+			opp-microvolt = <731250>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1663000000 {
+			opp-hz = /bits/ 64 <1663000000>;
+			opp-microvolt = <775000>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1836000000 {
+			opp-hz = /bits/ 64 <1836000000>;
+			opp-microvolt = <818750>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1999000000 {
+			opp-hz = /bits/ 64 <1999000000>;
+			opp-microvolt = <868750>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-2130000000 {
+			opp-hz = /bits/ 64 <2130000000>;
+			opp-microvolt = <918750>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-2253000000 {
+			opp-hz = /bits/ 64 <2253000000>;
+			opp-microvolt = <968750>;
+			clock-latency-ns = <5000000>;
+		};
+	};
+
+	cpucl2_opp_table: opp-table-2 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <500000>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-851000000 {
+			opp-hz = /bits/ 64 <851000000>;
+			opp-microvolt = <556250>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-984000000 {
+			opp-hz = /bits/ 64 <984000000>;
+			opp-microvolt = <575000>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1106000000 {
+			opp-hz = /bits/ 64 <1106000000>;
+			opp-microvolt = <606250>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1277000000 {
+			opp-hz = /bits/ 64 <1277000000>;
+			opp-microvolt = <631250>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1426000000 {
+			opp-hz = /bits/ 64 <1426000000>;
+			opp-microvolt = <662500>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1582000000 {
+			opp-hz = /bits/ 64 <1582000000>;
+			opp-microvolt = <693750>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1745000000 {
+			opp-hz = /bits/ 64 <1745000000>;
+			opp-microvolt = <731250>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-1826000000 {
+			opp-hz = /bits/ 64 <1826000000>;
+			opp-microvolt = <750000>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-2048000000 {
+			opp-hz = /bits/ 64 <2048000000>;
+			opp-microvolt = <793750>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-2188000000 {
+			opp-hz = /bits/ 64 <2188000000>;
+			opp-microvolt = <831250>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-2252000000 {
+			opp-hz = /bits/ 64 <2252000000>;
+			opp-microvolt = <850000>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-2401000000 {
+			opp-hz = /bits/ 64 <2401000000>;
+			opp-microvolt = <887500>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-2507000000 {
+			opp-hz = /bits/ 64 <2507000000>;
+			opp-microvolt = <925000>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-2630000000 {
+			opp-hz = /bits/ 64 <2630000000>;
+			opp-microvolt = <968750>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-2704000000 {
+			opp-hz = /bits/ 64 <2704000000>;
+			opp-microvolt = <1000000>;
+			clock-latency-ns = <5000000>;
+		};
+
+		opp-2802000000 {
+			opp-hz = /bits/ 64 <2802000000>;
+			opp-microvolt = <1056250>;
+			clock-latency-ns = <5000000>;
+		};
+	};
+
 	/* ect node is required to be present by bootloader */
 	ect {
 	};

-- 
2.51.0.rc1.167.g924127e9c0-goog


