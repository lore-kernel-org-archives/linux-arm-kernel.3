Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF12C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 15:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uUMs6u1zn9GnSxixdQQj+KqICw4gE2MY7effcI0/DiY=; b=LqMe3xwi9jS72trObwUhW5TYRx
	nJSyxxFLT7rJFjBL+NWO+t375llk9edO1nGFKB/JJ5hW9h3lsOAelJ28fYTMWLh4Iu//+HSgri1Bk
	COJYCc2QGL7TMPD2kwhpbhRZr01w7zk0EENytvyckR/a1EacvZiuEiZKQzoQXcM8hbGsYDsnGv+k4
	tKzISDVnd8+lVQGL8jv8dp7KzyH0PAngcp8JaFr77sCrQpkrx7wKlzvK+kIFeZ3NiUOVaCGpXcsA7
	IW8N7MtsP8T3Iol26UzvNgkzABUtQ806QDc6LOX7PQy0wE615TjD7okr72DARS/6yIz2+2jy+rllU
	Ttej3f+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQXf-0000000AVRq-2K89;
	Thu, 17 Jul 2025 15:29:03 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucPVb-0000000AM40-45Mr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 14:22:53 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ae6d8584e08so17831166b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 07:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752762170; x=1753366970; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uUMs6u1zn9GnSxixdQQj+KqICw4gE2MY7effcI0/DiY=;
        b=ID+O9qQHe4Yc8crPqp0kpD+NU8DJSCfDAFQC7QZH63gaj+39C4/FD1gHSEM3dzZLuY
         qQrZgUEuSMMl05wgsQkW/G2TV57E0BOzwgc3ZNY0Mmgxz+wHeAYngqtD0q1/kNky11Xm
         ow7U2rcaknSavvZ6rYfx8SGOxAIC5JUDSaEtTEgazNZvW//PZb2zZfRjYTp9G5HWGwBu
         Qwvr0YQRw1UST7GVBZb+LZeNiZujw2nOEifrMYQaqx4fX9NmmjUDBeCXRK7nhJ0lrkGA
         hLWHvux5SNwm2ASREnaG+rL75SC20TbSP7xcdJgWbcYsfZPaXfhdt+1oCI44TjwZjzVz
         u0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762170; x=1753366970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uUMs6u1zn9GnSxixdQQj+KqICw4gE2MY7effcI0/DiY=;
        b=jKPIqzSxFdWrcdnVpsHbFUTFs0mn54L3Q5SQpQ0NFcelIwskyDRJSx6WXkyRdzbPXU
         uK1Z9KoMzupN6RvJ0OwKKoGPR/7hNx7Xbqm8JF27NkkxkscW2N+CQO26C8s4B7aLLhE/
         cPXIxxAq6jvrwesD2aPdy02i0uCO/axyP2kHLmEJOJNysLr9u98zjFGiD4z1oTtzAeMH
         3z9gsBUOzwWMoiWL1EoFCTDTM3M6Pp1zHCpAJhwRoPFVf/hNHSkAyl3J3pbSKosjUXV1
         rlnWQlUi6A72nMSc72vdW1BZvWKcEEKvNtnO9NnE56mFP4yBLnfOrA+9yx8iJz4TBKO8
         XhOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSAkk9/lA8j/Pikz/h9CQe1hSrLrcaYv+Zm9elozlunZ2t3m0FNUiMEycqQwvJdttJ5P23oUL36cB+qi/iiKiB@lists.infradead.org
X-Gm-Message-State: AOJu0YyMjIqdgk9y4HX4JT/aUZyHPjzu6lzUr9ALyJFe7d+7DueF5cHC
	glneWYo9FK+UF87yBcjz8lyBwp9pno0TQe5ofugdllufhn2yrLBhJVdFRVnmhenKrz0=
X-Gm-Gg: ASbGncvdEdt+F+txNiJ6idi1J5DNDufpxfIxFV5RU09WT1DLIDrwZtB8sNYsWhcqM5h
	uxQMGQB0elCRxuD/K4uglgLVKVPfpg5XMbKmkbUhJrF3vY95k/RJU6Va+z7QPoV3aBSGxen9lig
	tkTwuVOKa7N4G5aM4pWPyOKkFby6sTVWXPGHHABZQmqfnpr96dr8DyJKEz4nYfFrSQETClFXOJW
	o8sU1jhXXws+ijebGdPs2j6PCCroevrTThhM93MX7GV4BGeuKdKe0FCJlDL6MeusSymMVFmJekv
	nPUdw5b6Btw46k044NJOS+PkZcb5znZUzIH7IKSoq2y3fITEHwkf1ue2o1Wy03K3BzOsPMdJeB4
	blVEWEocjWGlJ4KMHCTZvYD5EvqJ/T/x2BpIkU4PJcgc=
X-Google-Smtp-Source: AGHT+IFZX9BGgT9x3QocepLQl5WhOnUhBgwxIkPHZcxu8L9iFIb0/kRnbcbOnsyPXf7VCVGi0goryg==
X-Received: by 2002:a17:907:1b03:b0:ae3:5d47:634 with SMTP id a640c23a62f3a-ae9c9ae83fdmr247023766b.9.1752762169843;
        Thu, 17 Jul 2025 07:22:49 -0700 (PDT)
Received: from kuoka.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e910fesm1371235366b.1.2025.07.17.07.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:22:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Viresh Kumar <vireshk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: st: spear: Use generic "ethernet" as node name
Date: Thu, 17 Jul 2025 16:22:46 +0200
Message-ID: <20250717142245.92492-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4702; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=uujvZIEacMR4RmI0viShcrE6nyskrRbnFlw1trpWzkg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoeQc1nazIsXmyvnrckGiynmTvQnQDrqclaTwNs
 09NE3Zpv6uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaHkHNQAKCRDBN2bmhouD
 1ziUD/4xRIoA9qa8jB6p8q9H6du3tZw9quXQJhekhD31jMX4VcsCOcjBIiktkHqvRK+VHXCx8SF
 IlsxNiot9I64M/+CVxK9HOBiD5w2C3MflRYkbeAH3BfbfTvafMU+fo9JgTFr3aOT+vDTGtEfkm9
 RAeLbqDe6beDNFeG71n25GvTULT8ECpzou92GkVNv2CNf5vG6NmxjOz2/CLn0XlhgWToS8S+tig
 P8A62nu8Mqmr2sUJ2354HQ4MPB0+yR/iuBfoDU2SuYyUZkf5XvaSligGVsDh0jk+3fjUglX1ne7
 m4RxY5rg28N6bvXVJpHVW7tcmg89/xdKzOIk0BHk/tlDPjs3XN4BiZu6cW1GC0RSz243zjIJkwY
 rSE37Vk/lUFbOkuUgXnY9KdkjkywXFBgl2VlQDIyaUZRhV8BBQaIZT0gjFgixzL+Uf3e4LkmQBg
 FCeEhBHKB9FfYoPgP680CVLj1MUSewy9Z6U3gyXMAr6wq17itAUNRXZbfy90ayzO4NRo7R41Fxk
 EYVPf23yT0fiaONZv4S3yx8fnt5j25SRnIy+6cM6cMBpKOpWGVKb0dypLdJNxnfRfifT9c0nrcz
 ZONV3p1k3TigfZKPhQCvzuCkk6L6+/FgYFSAm26bWvXbBPMSzN2GYMii/2DLqSc8Rbze0lZbFAX IzY3tofXGHWcLiQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_072252_021735_90DAAADF 
X-CRM114-Status: GOOD (  10.66  )
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

Common name for Ethernet controllers is "ethernet", not "eth", also
recommended by Devicetree specification in "Generic Names
Recommendation".  Verified lack of impact using dtx_diff.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/st/spear1310-evb.dts | 2 +-
 arch/arm/boot/dts/st/spear1310.dtsi    | 8 ++++----
 arch/arm/boot/dts/st/spear1340-evb.dts | 2 +-
 arch/arm/boot/dts/st/spear13xx.dtsi    | 2 +-
 arch/arm/boot/dts/st/spear300-evb.dts  | 2 +-
 arch/arm/boot/dts/st/spear310-evb.dts  | 2 +-
 arch/arm/boot/dts/st/spear320-evb.dts  | 2 +-
 arch/arm/boot/dts/st/spear3xx.dtsi     | 2 +-
 8 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/st/spear1310-evb.dts b/arch/arm/boot/dts/st/spear1310-evb.dts
index 089bd7db55c7..417a064db11e 100644
--- a/arch/arm/boot/dts/st/spear1310-evb.dts
+++ b/arch/arm/boot/dts/st/spear1310-evb.dts
@@ -159,7 +159,7 @@ button@1 {
 			};
 		};
 
-		gmac0: eth@e2000000 {
+		gmac0: ethernet@e2000000 {
 			phy-mode = "gmii";
 			status = "okay";
 		};
diff --git a/arch/arm/boot/dts/st/spear1310.dtsi b/arch/arm/boot/dts/st/spear1310.dtsi
index ba827d60bf07..1498996be14e 100644
--- a/arch/arm/boot/dts/st/spear1310.dtsi
+++ b/arch/arm/boot/dts/st/spear1310.dtsi
@@ -128,7 +128,7 @@ pcie2: pcie@b4000000 {
 			status = "disabled";
 		};
 
-		gmac1: eth@5c400000 {
+		gmac1: ethernet@5c400000 {
 			compatible = "st,spear600-gmac";
 			reg = <0x5c400000 0x8000>;
 			interrupts = <0 95 0x4>;
@@ -137,7 +137,7 @@ gmac1: eth@5c400000 {
 			status = "disabled";
 		};
 
-		gmac2: eth@5c500000 {
+		gmac2: ethernet@5c500000 {
 			compatible = "st,spear600-gmac";
 			reg = <0x5c500000 0x8000>;
 			interrupts = <0 96 0x4>;
@@ -146,7 +146,7 @@ gmac2: eth@5c500000 {
 			status = "disabled";
 		};
 
-		gmac3: eth@5c600000 {
+		gmac3: ethernet@5c600000 {
 			compatible = "st,spear600-gmac";
 			reg = <0x5c600000 0x8000>;
 			interrupts = <0 97 0x4>;
@@ -155,7 +155,7 @@ gmac3: eth@5c600000 {
 			status = "disabled";
 		};
 
-		gmac4: eth@5c700000 {
+		gmac4: ethernet@5c700000 {
 			compatible = "st,spear600-gmac";
 			reg = <0x5c700000 0x8000>;
 			interrupts = <0 98 0x4>;
diff --git a/arch/arm/boot/dts/st/spear1340-evb.dts b/arch/arm/boot/dts/st/spear1340-evb.dts
index d24146c3c9e8..9e7c356b1d9e 100644
--- a/arch/arm/boot/dts/st/spear1340-evb.dts
+++ b/arch/arm/boot/dts/st/spear1340-evb.dts
@@ -157,7 +157,7 @@ partition@1200000 {
 			};
 		};
 
-		gmac0: eth@e2000000 {
+		gmac0: ethernet@e2000000 {
 			phy-mode = "rgmii";
 			status = "okay";
 		};
diff --git a/arch/arm/boot/dts/st/spear13xx.dtsi b/arch/arm/boot/dts/st/spear13xx.dtsi
index 76749992394d..159e941708ca 100644
--- a/arch/arm/boot/dts/st/spear13xx.dtsi
+++ b/arch/arm/boot/dts/st/spear13xx.dtsi
@@ -149,7 +149,7 @@ fsmc: flash@b0000000 {
 			status = "disabled";
 		};
 
-		gmac0: eth@e2000000 {
+		gmac0: ethernet@e2000000 {
 			compatible = "st,spear600-gmac";
 			reg = <0xe2000000 0x8000>;
 			interrupts = <0 33 0x4>,
diff --git a/arch/arm/boot/dts/st/spear300-evb.dts b/arch/arm/boot/dts/st/spear300-evb.dts
index 7d4e6412d558..80fae76d4610 100644
--- a/arch/arm/boot/dts/st/spear300-evb.dts
+++ b/arch/arm/boot/dts/st/spear300-evb.dts
@@ -69,7 +69,7 @@ fsmc: flash@94000000 {
 			status = "okay";
 		};
 
-		gmac: eth@e0800000 {
+		gmac: ethernet@e0800000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/st/spear310-evb.dts b/arch/arm/boot/dts/st/spear310-evb.dts
index 459182210825..a3449eb7e59b 100644
--- a/arch/arm/boot/dts/st/spear310-evb.dts
+++ b/arch/arm/boot/dts/st/spear310-evb.dts
@@ -88,7 +88,7 @@ fsmc: flash@44000000 {
 			status = "okay";
 		};
 
-		gmac: eth@e0800000 {
+		gmac: ethernet@e0800000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/st/spear320-evb.dts b/arch/arm/boot/dts/st/spear320-evb.dts
index 6ac53d993cf3..984075e60634 100644
--- a/arch/arm/boot/dts/st/spear320-evb.dts
+++ b/arch/arm/boot/dts/st/spear320-evb.dts
@@ -84,7 +84,7 @@ fsmc: flash@4c000000 {
 			status = "okay";
 		};
 
-		gmac: eth@e0800000 {
+		gmac: ethernet@e0800000 {
 			status = "okay";
 		};
 
diff --git a/arch/arm/boot/dts/st/spear3xx.dtsi b/arch/arm/boot/dts/st/spear3xx.dtsi
index f54bb80ba28a..54e87ac98164 100644
--- a/arch/arm/boot/dts/st/spear3xx.dtsi
+++ b/arch/arm/boot/dts/st/spear3xx.dtsi
@@ -46,7 +46,7 @@ dma@fc400000 {
 			status = "disabled";
 		};
 
-		gmac: eth@e0800000 {
+		gmac: ethernet@e0800000 {
 			compatible = "snps,dwmac-3.40a";
 			reg = <0xe0800000 0x8000>;
 			interrupts = <23 22>;
-- 
2.48.1


