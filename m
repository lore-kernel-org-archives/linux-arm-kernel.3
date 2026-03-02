Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E550BFD0072
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 00:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tsooOqjs2Ru/3m+bvaCsEHR8prvnLQz2mO1zrfusdAU=; b=ZMvp2wjwHrschxeWlwo4PGla96
	28vr1xD7n+AKAKuM6KYSP1m1laqddpAQhnw+7UVnt61IaoMOPZWssov5aaIeEPMnj1cwOwykRaZtl
	PFaktb74jyWiY95VMrgX56uO8V8pP1CQkYshHLqmck4O7hIrwzEQenIF0FrglUgN5ebvNjmK5RlJC
	O/9n1lFsHBWK98oBkDCszDquGYJ4Ta+BcwSH1bp/91+nB0cavgU02sLTtgvRY6AR6+0z/Zfs6hGsj
	RBSbnYPtiL/4jMQaNqHOytFHyerUlqkZPGmuJycVqUTVf9kvn76vizdO0qyxG3v1NepEzs6xTZ3B6
	6LsLWmlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwqpL-0000000BzwD-3MW5;
	Mon, 02 Mar 2026 00:07:59 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwqpJ-0000000Bzvs-0s8M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 00:07:58 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-64ca2b32f46so2839503d50.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 16:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772410075; x=1773014875; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tsooOqjs2Ru/3m+bvaCsEHR8prvnLQz2mO1zrfusdAU=;
        b=FXTFNcZ8WTwm+mjbTDIsERNHKAHYT8ITlNXjS4ra4O6asEPsk7wgmyncUKRZT/w6U+
         5FMkwL7UHyPFkvWU67Qsxq7J5zq1JQfWF/Rssd3orub7CrKsSWzaCX4ghEzEqIbv+ZGt
         RgM1wZi3pk7Lxg9t452rk38TTTNX9UK/HrjNVQ4SGM5rWwXBROhTtGj8Yw91GLCNSp5u
         doBgFzkk+Ox7DVqZPZLpxRITm2ljQdm00Bn61ToyqwZ6nIilCCG9IoT8YcN79ayG+EZl
         hXS2LxWhiA/ebBPfPXGsfIausYQAr8DVIUuC0HZlU8eONHLT5jv4kFQ5kgpZUjMMyo36
         k/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772410075; x=1773014875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsooOqjs2Ru/3m+bvaCsEHR8prvnLQz2mO1zrfusdAU=;
        b=lgxZGoBmwglC+tYhoAJPGJ1AqMbF3Igw2UCZTsG+M6nskw18R6EaYTgdH1Az6GhFXt
         cBEVnCzImPxOoL8x0i5XPWuBSPWF9lRHLrVtJt30vX4blCY/RgNYArvmBQ02+teMcWxM
         JOx7Rcxs4mRBugeknshBnmwzwPLOC+ypPnFZmACfAp86+xWEEtmEYEEWwTrpANQpVLMw
         IM6H+LWik9CNUQfoxZixq8iLjp6wanxdX3YrhHocXx15L3C98V9sNfMmPFB6iLxe/KbP
         3Evyg9uloSUeRnMO+9puyIH2ev3MynAO/rBySTfg/M9l17fZ/VHm3um5+fegVwM3ttpv
         iZAA==
X-Forwarded-Encrypted: i=1; AJvYcCVJvr1XeYO39DuODA9TdDSt3+mHzlzTFThy3oyWjKNVvv3soWUMaVI19J36qpUyUpeiZ11/iFqjLYA+N0bWyfiX@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp47UlnNR5WzAYhiONG4/hgZ58IMsHIOcTb8+qcbOAJSN8990P
	SP4mtT9WqsQmPBwdFuS8e0PdOWVaR7zeuRNiqbyACl78pLAtPv7r2cXI
X-Gm-Gg: ATEYQzyi8wg6Ao5gTXCUOEPVQfQkhqEWeFYNFmbGQFdOqoQBePkY/QrbUoKMoj35hVk
	x8Wv0haeKYwlxE1NI+Yy3fqATM7/ooZgBDFIB5wxXnMDf4uSsGdgCIKOd0N66FlwDx5bfavhXMv
	iev1pNfQuEm2k4URqvj+A9eu9IHoOBNyR3T7gqFrWdlpyEpKjWM0Q2igmIHnLKaI452YJ5UZhAo
	PtHvrj30Wkd58BLH30wS+vbxL65QJg1jFJOr43zOwr+HhJgCxFFlQf40ixePMKMOFQfiw4PwoVa
	FQr8sZKla7dpJeSISbM6c6r4WzRuR2OczaaxLhor1bilwDIASecGg1JhxClyRHZEJqUgtyMT1xy
	x6OMT3v/oAk1lnkraaeaKd06ARjFmtf59oFEwtLc6/IxGplcmAacNZBmNYiOhZ56wiV1gGb88fC
	7V+btakCXxX0f77HPIdTggDgWICcXxprzC4+fTTRpOd84BA2xhsTHEpA==
X-Received: by 2002:a53:cb4a:0:b0:64a:de00:e38d with SMTP id 956f58d0204a3-64cc22c4e78mr7409140d50.68.1772410075409;
        Sun, 01 Mar 2026 16:07:55 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64cb7650fb7sm5028822d50.22.2026.03.01.16.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 16:07:54 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: add root pcie bridges
Date: Sun,  1 Mar 2026 16:07:36 -0800
Message-ID: <20260302000736.592422-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_160757_265857_9BD1B7E3 
X-CRM114-Status: GOOD (  10.48  )
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

They are always required and instead of duplicating a definition in each
dts file, place it in dtsi with labels and work based on that.

Also changed each bridge@ to pcie@ to get extra dtc static analysis.

Fixed bridge numbers as a result.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm-ns.dtsi        | 30 ++++++++
 .../dts/broadcom/bcm4709-netgear-r8000.dts    | 73 ++++++++-----------
 .../dts/broadcom/bcm47094-luxul-xap-1610.dts  | 36 ++-------
 .../broadcom/bcm47094-luxul-xwr-3150-v1.dts   | 36 ++-------
 4 files changed, 76 insertions(+), 99 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
index 3fb1b762e492..392a25713669 100644
--- a/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm-ns.dtsi
@@ -196,6 +196,16 @@ pcie0: pcie@12000 {
 			#interrupt-cells = <1>;
 			#address-cells = <3>;
 			#size-cells = <2>;
+
+			pcie_bridge0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0000 0 0 0 0>;
+				bus-range = <0x00 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie1: pcie@13000 {
@@ -210,6 +220,16 @@ pcie1: pcie@13000 {
 			#interrupt-cells = <1>;
 			#address-cells = <3>;
 			#size-cells = <2>;
+
+			pcie_bridge1: pcie@0 {
+				device_type = "pci";
+				reg = <0x0000 0 0 0 0>;
+				bus-range = <0x00 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie2: pcie@14000 {
@@ -224,6 +244,16 @@ pcie2: pcie@14000 {
 			#interrupt-cells = <1>;
 			#address-cells = <3>;
 			#size-cells = <2>;
+
+			pcie_bridge2: pcie@0 {
+				device_type = "pci";
+				reg = <0x0000 0 0 0 0>;
+				bus-range = <0x00 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		usb2: usb2@21000 {
diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
index 127ca8741220..d170c71cbd76 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
@@ -126,66 +126,53 @@ button-brightness {
 	};
 };
 
-&pcie0 {
-	#address-cells = <3>;
-	#size-cells = <2>;
-
-	bridge@0,0,0 {
+&pcie_bridge0 {
+	wifi@0,0 {
+		compatible = "brcm,bcm4366-fmac", "brcm,bcm4329-fmac";
 		reg = <0x0000 0 0 0 0>;
-
-		#address-cells = <3>;
-		#size-cells = <2>;
-
-		wifi@0,1,0 {
-			compatible = "brcm,bcm4366-fmac", "brcm,bcm4329-fmac";
-			reg = <0x0000 0 0 0 0>;
-			ieee80211-freq-limit = <5735000 5835000>;
-			brcm,ccode-map = "JP-JP-78", "US-Q2-86";
-		};
+		ieee80211-freq-limit = <5735000 5835000>;
+		brcm,ccode-map = "JP-JP-78", "US-Q2-86";
 	};
 };
 
-&pcie1 {
-	#address-cells = <3>;
-	#size-cells = <2>;
-
-	bridge@1,0,0 {
+&pcie_bridge1 {
+	pcie@0,0 {
+		device_type = "pci";
 		reg = <0x0000 0 0 0 0>;
+		bus-range = <0x01 0xff>;
 
 		#address-cells = <3>;
 		#size-cells = <2>;
+		ranges;
 
-		bridge@1,1,0 {
-			reg = <0x0000 0 0 0 0>;
+		pcie@1,0 {
+			device_type = "pci";
+			reg = <0x800 0 0 0 0>;
 
 			#address-cells = <3>;
 			#size-cells = <2>;
+			ranges;
 
-			bridge@1,0 {
-				reg = <0x800 0 0 0 0>;
-
-				#address-cells = <3>;
-				#size-cells = <2>;
-
-				wifi@0,0 {
-					compatible = "brcm,bcm4366-fmac", "brcm,bcm4329-fmac";
-					reg = <0x0000 0 0 0 0>;
-					brcm,ccode-map = "JP-JP-78", "US-Q2-86";
-				};
+			wifi@0,0 {
+				compatible = "brcm,bcm4366-fmac", "brcm,bcm4329-fmac";
+				reg = <0x0000 0 0 0 0>;
+				brcm,ccode-map = "JP-JP-78", "US-Q2-86";
 			};
+		};
 
-			bridge@1,2,2 {
-				reg = <0x1000 0 0 0 0>;
+		pcie@2,0 {
+			device_type = "pci";
+			reg = <0x1000 0 0 0 0>;
 
-				#address-cells = <3>;
-				#size-cells = <2>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges;
 
-				wifi@1,4,0 {
-					compatible = "brcm,bcm4366-fmac", "brcm,bcm4329-fmac";
-					reg = <0x0000 0 0 0 0>;
-					ieee80211-freq-limit = <5170000 5730000>;
-					brcm,ccode-map = "JP-JP-78", "US-Q2-86";
-				};
+			wifi@0,0 {
+				compatible = "brcm,bcm4366-fmac", "brcm,bcm4329-fmac";
+				reg = <0x0000 0 0 0 0>;
+				ieee80211-freq-limit = <5170000 5730000>;
+				brcm,ccode-map = "JP-JP-78", "US-Q2-86";
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts
index badafa024d24..3a33705c2969 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts
@@ -65,39 +65,19 @@ &gmac0 {
 };
 
 
-&pcie0 {
-	#address-cells = <3>;
-	#size-cells = <2>;
-
-	bridge@0,0 {
+&pcie_bridge0 {
+	wifi@0,0 {
+		compatible = "brcm,bcm4366-fmac", "brcm,bcm4329-fmac";
 		reg = <0x0000 0 0 0 0>;
-
-		#address-cells = <3>;
-		#size-cells = <2>;
-
-		wifi@0,0 {
-			compatible = "brcm,bcm4366-fmac", "brcm,bcm4329-fmac";
-			reg = <0x0000 0 0 0 0>;
-			brcm,ccode-map = "AU-AU-920", "CA-CA-892", "GB-DE-964", "NZ-AU-920", "US-US-825";
-		};
+		brcm,ccode-map = "AU-AU-920", "CA-CA-892", "GB-DE-964", "NZ-AU-920", "US-US-825";
 	};
 };
 
-&pcie1 {
-	#address-cells = <3>;
-	#size-cells = <2>;
-
-	bridge@0,0 {
+&pcie_bridge1 {
+	wifi@0,0 {
+		compatible = "brcm,bcm4366-fmac", "brcm,bcm4329-fmac";
 		reg = <0x0000 0 0 0 0>;
-
-		#address-cells = <3>;
-		#size-cells = <2>;
-
-		wifi@0,0 {
-			compatible = "brcm,bcm4366-fmac", "brcm,bcm4329-fmac";
-			reg = <0x0000 0 0 0 0>;
-			brcm,ccode-map = "AU-AU-920", "CA-CA-892", "GB-DE-964", "NZ-AU-920", "US-US-825";
-		};
+		brcm,ccode-map = "AU-AU-920", "CA-CA-892", "GB-DE-964", "NZ-AU-920", "US-US-825";
 	};
 };
 
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
index 83c429afc297..8e487f60a2cc 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
@@ -81,39 +81,19 @@ &gmac0 {
 	nvmem-cell-names = "mac-address";
 };
 
-&pcie0 {
-	#address-cells = <3>;
-	#size-cells = <2>;
-
-	bridge@0,0 {
+&pcie_bridge0 {
+	wifi@0,0 {
+		compatible = "brcm,bcm4366-fmac", "brcm,bcm4329-fmac";
 		reg = <0x0000 0 0 0 0>;
-
-		#address-cells = <3>;
-		#size-cells = <2>;
-
-		wifi@0,0 {
-			compatible = "brcm,bcm4366-fmac", "brcm,bcm4329-fmac";
-			reg = <0x0000 0 0 0 0>;
-			brcm,ccode-map = "AU-AU-953", "CA-CA-946", "GB-E0-846", "NZ-AU-953", "US-Q2-930";
-		};
+		brcm,ccode-map = "AU-AU-953", "CA-CA-946", "GB-E0-846", "NZ-AU-953", "US-Q2-930";
 	};
 };
 
-&pcie1 {
-	#address-cells = <3>;
-	#size-cells = <2>;
-
-	bridge@0,0 {
+&pcie_bridge1 {
+	wifi@0,0 {
+		compatible = "brcm,bcm4366-fmac", "brcm,bcm4329-fmac";
 		reg = <0x0000 0 0 0 0>;
-
-		#address-cells = <3>;
-		#size-cells = <2>;
-
-		wifi@0,0 {
-			compatible = "brcm,bcm4366-fmac", "brcm,bcm4329-fmac";
-			reg = <0x0000 0 0 0 0>;
-			brcm,ccode-map = "AU-AU-953", "CA-CA-946", "GB-E0-846", "NZ-AU-953", "US-Q2-930";
-		};
+		brcm,ccode-map = "AU-AU-953", "CA-CA-946", "GB-E0-846", "NZ-AU-953", "US-Q2-930";
 	};
 };
 
-- 
2.53.0


