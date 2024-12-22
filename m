Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40E7E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 14:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aMZe3KIsDQb+Ch5185jS18YCIZb5/VxUA7wsA3ESW1g=; b=grI4DOsdKJSolj/a1NbMM3PJOe
	1LnoalIzzuSME4ehrBEnsADF2kUi0kPiMFaRZlG5+aTcnOXhQEIKkpC6bS+KbCgpTPjUcE0c35j5V
	JiMrlgkObzp3XkewcqCXuNTEbru6X+cwG0RE//XoYW6ZBruML5c9crlSbgsPTvtF5bu/I+IHfckK7
	6jO2IKPbm9Mgkj6Cq1RNpq2KboRcHgK4ew9rOnu7Yn7DASjQJGK6W3/FmdLr0OOgMY6ZqyHpgB5ho
	9pPl8nX97IuVHHtgD27kMnWsfYgeSdNyqZvlsnPbz708DBbTmkcsIhV4+YGU/2hPrphUZrpE1F7Sx
	HJg8LNfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPNLS-00000008Q4Q-28wE;
	Sun, 22 Dec 2024 14:54:14 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPNKI-00000008PxK-0Qwi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 14:53:03 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aab73e995b5so65022666b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 06:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734879180; x=1735483980; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aMZe3KIsDQb+Ch5185jS18YCIZb5/VxUA7wsA3ESW1g=;
        b=UdGiraVBiKZplgFbAQG+0+EzHFilJLV5srsM8JGCKv2I5/DJmYzLJl6VSSaefqzY7I
         Rv0dxxuBaf24nfo7jw49eI5zi3j7qclNixa2URT0EZa3X4DanIxxOAvWDICLy/2cC1P8
         jdUl4X7gbtJClNFn8VxRA5VjG/LKdvrP1Lm1MHH1ElJKpHS3JA/NwKwfNSgGdTCNA4eE
         /QI/mr6qNfv1XCUF7BRgRaWhIPEWkXBCE+IVtt7pESPi4Z/tkodcCPiwDlC7DrAAgZJ8
         8rbLgN/v4o3rFL486elX53Vz4GPIMF5QGdpvZkdYiUk1PTyo1dcpA/SW0fUBHgRzLOZK
         DZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734879180; x=1735483980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMZe3KIsDQb+Ch5185jS18YCIZb5/VxUA7wsA3ESW1g=;
        b=rZTLcVUceagZmAzUfMojl0VWtBdgOZropkEBzFMBG/isjiFjDIII+qNHViYjXuLCDY
         HzFWJlYpUYhuJve3AuyQ/7b5/HVOTsqR5PJYdN1m6OWGRSpcC0MPFOdKibXZdiwpqP6W
         dlP+EKKgY/LZ/a4aODHN75Tt2t47lXUGyWG6hPU4Zvf1PZ4gQlpTrpfRu8jqOd5AQoL+
         xW5PRFMjszOdoL7snJzTStLzgr0FnslMnZF56kbeLvaH2pM27VUUBRQzazVMeieCKD3H
         mplVugKEbE3thR6IJhKoBQDnS1sBZpZ0qLAXfVmL3aYT7rUScFUdOZJO0x0gCwC4Euvf
         QDBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCmkCslxA/NdBG27hEsiUxwC3V74TTq+xdIGkbxs5nQyDei3sKCyRS7ZYge5VlkhtLmAaruiWPxw/9FpVoifNF@lists.infradead.org
X-Gm-Message-State: AOJu0YyYkMHV8yjA9W4TRMP5MR4+Ncdo5+vuKoQ/mI7LJNIQNsm8bslY
	d1F0je7yKqBflz05gQAi8dj4zR0ObFObdONkfYPyTr6bGLHzeOui/yRmBfPI2bw=
X-Gm-Gg: ASbGncsNt1cYh3PDKiDicuRRHohiFNnXEb10SbFCL9kkOwBaU7lMt9vm4yVmSL27AGL
	ADeJLvVJJ20ve2PD/nISUgPSgfgpbAuh/NlMgCVoIbZx+yM67s4gkCqWiWtPFjq36Koer0dwilo
	Y3Al886oMpdsvW8p+P7cmhc0vqCnj+k3oFZhFM4zJ2ijsewQmZpTAzbXE97ZcYEDGDQwdRe55NL
	oXx4qdlAaJ/y18fPdQYTSeI2RKobCKgNyIbrIHEraOuraxsCatYLAh44dT5n2iUskJi4HGQPhQM
	/lGN6xokTQsat6EtBxjmr11ZJhA3PA==
X-Google-Smtp-Source: AGHT+IHjZBO20DhCS6VWRIkYCvaJqzjKDPYq8fCPXpEgvr/Ih/lPcG98CqFloHsurYEW0cVqBYl2ww==
X-Received: by 2002:a17:906:dc95:b0:aa6:75db:c34e with SMTP id a640c23a62f3a-aac3444a235mr315630266b.14.1734879179038;
        Sun, 22 Dec 2024 06:52:59 -0800 (PST)
Received: from krzk-bin.. (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe46f6sm395237866b.111.2024.12.22.06.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 06:52:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: exynos8895: Rename PMU nodes to fixup sorting
Date: Sun, 22 Dec 2024 15:52:57 +0100
Message-ID: <20241222145257.31451-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_065302_156567_0A1AC632 
X-CRM114-Status: GOOD (  11.75  )
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

Nodes should be sorted by name but it is also nice to have same class of
devices together, so rename both PMU nodes (A53 and M2) to use "pmu"
prefix, instead of suffix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I know we have everywhere else in pure-ARM designs nodes "arm-xxx-pmu",
but this is too trivial and unimportant to change.  I however want to
avoid copying unsorted-style code to new patches.
---
 arch/arm64/boot/dts/exynos/exynos8895.dtsi | 48 +++++++++++-----------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
index 90b318b2f08a..d31d74cc4580 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
@@ -26,30 +26,6 @@ aliases {
 		pinctrl7 = &pinctrl_peric1;
 	};
 
-	arm-a53-pmu {
-		compatible = "arm,cortex-a53-pmu";
-		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-affinity = <&cpu0>,
-				     <&cpu1>,
-				     <&cpu2>,
-				     <&cpu3>;
-	};
-
-	mongoose-m2-pmu {
-		compatible = "samsung,mongoose-pmu";
-		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-affinity = <&cpu4>,
-				     <&cpu5>,
-				     <&cpu6>,
-				     <&cpu7>;
-	};
-
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -149,6 +125,30 @@ oscclk: osc-clock {
 		clock-output-names = "oscclk";
 	};
 
+	pmu-a53 {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>,
+				     <&cpu1>,
+				     <&cpu2>,
+				     <&cpu3>;
+	};
+
+	pmu-mongoose-m2 {
+		compatible = "samsung,mongoose-pmu";
+		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu4>,
+				     <&cpu5>,
+				     <&cpu6>,
+				     <&cpu7>;
+	};
+
 	psci {
 		compatible = "arm,psci";
 		method = "smc";
-- 
2.43.0


