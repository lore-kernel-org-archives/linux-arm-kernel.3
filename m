Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7843C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 18:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4W7/uVh1SHBueJ7TDZhlHeiCdQneN4JhcxgrJWh5ZZA=; b=3najd27zQoHptQbw0ODmQFWlFU
	oAQdMlGObWiyHWTMDl92t83vC82rR/Sk1gwZDF9fz/rqakxzu163e2Yjlm2vWEwoBOQAvhMlEPdxk
	XczYhdXAIFfPw2Bv3cIEomKw49zwApjnxFImZQVrY8W5mmctMbYYbDQAI0GrSd2VoxuzyCT19ihP8
	2leVuH2aVW9Mi0XeTCvShQd08g6m959igFYhSYiAoa03EyaazZFjz9Rs4exTDyx4w/Nd/9HF18RHR
	pH/IJXroHmRouSLa/c7tUQsJ8ITkKqIdnfStSYa0gVAs5ZkapmQ1KZ62p/ZmfqdHGbxiPMjKKCoFF
	h5dgiUDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNHy-00000001AXU-3WPv;
	Tue, 04 Feb 2025 18:04:46 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNGe-00000001ANu-3xDZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 18:03:26 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38db0146119so32518f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 10:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1738692202; x=1739297002; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4W7/uVh1SHBueJ7TDZhlHeiCdQneN4JhcxgrJWh5ZZA=;
        b=cYDUL+bho2z4K0hfm6twYXPJbow1+BkCSG7GAtxy0abmqxmVtBIYUwSrxs65CfPmMn
         1vk9qpw5fCfSKPs63K+trw6UEJH36qtysr0dsGFycOkO5jzWOTYGiS+d0X8u2d9l3yQ1
         hfJFN8S55PYOVFujMj8Kry/TxGl+gb1LTmRz3beOCq+/V+NaHJx69k7KM1X+VhQX1JGZ
         O5VeYUcTmTDzxyAM0VQecu8W5kE72clruBUM3f3Mwb/wqBQSDXMLPDu7AD0FPYuKfdp3
         zYwtGBjVOHW41a+hiad2mWRBbPgs+XEAB6QAfpmbYOqUFBmsQoXbTyyGB7ttbLj20Y7/
         9QcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738692202; x=1739297002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4W7/uVh1SHBueJ7TDZhlHeiCdQneN4JhcxgrJWh5ZZA=;
        b=ne4biXpuzBNjFnvVgqTC0BfPFSB6noUmVoo725m/2Q0B1+MmFHtvlrZ+ycSqzsVwxz
         0FrnXvCcPhvqZWr0fNARpSVEyB55sfQ8nHWayvNzLUTWK+YKjyt86Ff3Q+Flh/D3k2on
         jfO9Pxgyl1I9UwWphF0AM67GOog0E8xYWLU+/P+LZX7z4k8YbbCSHeQkxKvKLc8cQ2Z3
         s4T8w9/o+Ga3LfwWoc5jh8VaNMNP+yQv3LdMYSysIf4JYYwGpiF15cW6mDpHNZKATJRs
         uHmERR46NcBqQmSlffq983BDdKPc24RnCoobaz9TDjKD0riqoj+uWay8NtFvz9cGtD0R
         0oSw==
X-Forwarded-Encrypted: i=1; AJvYcCXS3pUcIJFWGuqCGC+qMHdxdQFnc3CfxxpdXzzo4jwOxFmheOjOwzns1SSxfsjz4CnY2DXTkIZn0LIjUg37tUFW@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl1RuMsV/F71GdH0mnEwZwUqIvDkrVP0VLYbBQg9qHuju3wFN6
	jLCpQ/atwwYH3GwEHlQkA8QkDlalXb0Adlh0DTgshca4h0jUj+mdY2y1bqdhEhI=
X-Gm-Gg: ASbGncs5+klW8O9cQDnieYIjGhR+LUsbu0AcwyElF/YyA5b7V+0aTBklkYrUsimMajf
	ZDX9qhiLw7uBhWsIlHfGjsf80eTXtpZIcDDevvuD86nwyjJ/VlLeN5CniUnRPQNDD5eezUGn+4Y
	Hbs+r+0qbyilBd35o7Ldc4wHsAbKXCrAICTFnDT7/bCmRqnOkrk3T4+CkxECvn7MWm6+uQDsI40
	8AXyLp07OFcyaoG+hsWoR2+TzhZ2hGWOw50keoEa3U6HWoj6OaEj+9Fry8ZjO7o2VcZO581TRoF
	br9DFPnoCu9C4zg73/TDeiPQk70c5YatSUq/GMkLkS3NTlfAPDkcFHqteCxDE2lvqmAExtBcCnn
	B1CEyRPIOnac=
X-Google-Smtp-Source: AGHT+IE/qY9aAKQmWdzpYQlP9HqBpbBqhuFIYDUB8Q8Ee1l43WimZvBDhx75rwg4/X6t6kRWcupvFw==
X-Received: by 2002:a05:6000:4013:b0:38a:88ac:ee69 with SMTP id ffacd0b85a97d-38da53ab53dmr3527394f8f.13.1738692201956;
        Tue, 04 Feb 2025 10:03:21 -0800 (PST)
Received: from stroh80.lab.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e244ecd6sm202687235e9.28.2025.02.04.10.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 10:03:21 -0800 (PST)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Guenter Roeck <linux@roeck-us.net>,
	broonie@kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-hwmon@vger.kernel.org,
	Naresh Solanki <naresh.solanki@9elements.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: aspeed: sbp1: Update for ir38640
Date: Tue,  4 Feb 2025 23:33:04 +0530
Message-ID: <20250204180306.2755444-2-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250204180306.2755444-1-naresh.solanki@9elements.com>
References: <20250204180306.2755444-1-naresh.solanki@9elements.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_100325_001238_42CDD867 
X-CRM114-Status: GOOD (  11.95  )
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

Update node to align with infineon,ir38060.yaml

Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
---
 .../boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts   | 124 +++++++++++-------
 1 file changed, 80 insertions(+), 44 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts
index 8d98be3d5f2e..34f3d773a775 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dts
@@ -1838,13 +1838,17 @@ i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			pvcore_nic2: ir38263-pvcore-nic2@40 {
+			ir38263_pvcore_nic2: ir38263-pvcore-nic2@40 {
 				compatible = "infineon,ir38263";
 				reg = <0x40>;
 
-				regulator-name = "pvcore_nic2";
-				regulator-enable-ramp-delay = <2000>;
-				vin-supply = <&p12v>;
+				regulators {
+					pvcore_nic2: vout {
+						regulator-name = "pvcore_nic2";
+						regulator-enable-ramp-delay = <2000>;
+						vin-supply = <&p12v>;
+					};
+				};
 			};
 		};
 
@@ -1853,13 +1857,17 @@ i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			pvcore_nic1: ir38263-pvcore-nic1@40 {
+			ir38263_pvcore_nic1: ir38263-pvcore-nic1@40 {
 				compatible = "infineon,ir38263";
 				reg = <0x40>;
 
-				regulator-name = "pvcore_nic1";
-				regulator-enable-ramp-delay = <2000>;
-				vin-supply = <&p12v>;
+				regulators {
+					pvcore_nic1: vout {
+						regulator-name = "pvcore_nic1";
+						regulator-enable-ramp-delay = <2000>;
+						vin-supply = <&p12v>;
+					};
+				};
 			};
 		};
 
@@ -1874,13 +1882,17 @@ i2c@5 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			p3v3_nic: ir38263-p3v3-nic@40 {
+			ir38263_p3v3_nic: ir38263-p3v3-nic@40 {
 				compatible = "infineon,ir38263";
 				reg = <0x40>;
 
-				regulator-name = "p3v3_nic";
-				regulator-enable-ramp-delay = <2000>;
-				vin-supply = <&p12v>;
+				regulators {
+					p3v3_nic: vout {
+						regulator-name = "p3v3_nic";
+						regulator-enable-ramp-delay = <2000>;
+						vin-supply = <&p12v>;
+					};
+				};
 			};
 		};
 
@@ -1889,13 +1901,17 @@ i2c@6 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			p1v2_nic: ir38263-p1v2-nic@40 {
+			ir38263_p1v2_nic: ir38263-p1v2-nic@40 {
 				compatible = "infineon,ir38263";
 				reg = <0x40>;
 
-				regulator-name = "p1v2_nic";
-				regulator-enable-ramp-delay = <2000>;
-				vin-supply = <&p12v>;
+				regulators {
+					p1v2_nic: vout {
+						regulator-name = "p1v2_nic";
+						regulator-enable-ramp-delay = <2000>;
+						vin-supply = <&p12v>;
+					};
+				};
 			};
 		};
 
@@ -1904,13 +1920,17 @@ i2c@7 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			p1v8_nic: ir38263-p1v8-nic@40 {
+			ir38263_p1v8_nic: ir38263-p1v8-nic@40 {
 				compatible = "infineon,ir38263";
 				reg = <0x40>;
 
-				regulator-name = "p1v8_nic";
-				regulator-enable-ramp-delay = <2000>;
-				vin-supply = <&p12v>;
+				regulators {
+					p1v8_nic: vout {
+						regulator-name = "p1v8_nic";
+						regulator-enable-ramp-delay = <2000>;
+						vin-supply = <&p12v>;
+					};
+				};
 			};
 		};
 	};
@@ -2070,13 +2090,17 @@ i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			p1v05_pch_aux: ir38263-p1v05-pch-aux@40 {
+			ir38263_p1v05_pch_aux: ir38263-p1v05-pch-aux@40 {
 				compatible = "infineon,ir38263";
 				reg = <0x40>;
 
-				regulator-name = "p1v05_pch_aux";
-				regulator-enable-ramp-delay = <2000>;
-				vin-supply = <&p12v>;
+				regulators {
+					p1v05_pch_aux: vout {
+						regulator-name = "p1v05_pch_aux";
+						regulator-enable-ramp-delay = <2000>;
+						vin-supply = <&p12v>;
+					};
+				};
 			};
 		};
 
@@ -2085,13 +2109,17 @@ i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			p1v8_pch_aux: ir38060-p1v8-pch-aux@40 {
+			ir38060_p1v8_pch_aux: ir38060-p1v8-pch-aux@40 {
 				compatible = "infineon,ir38060";
 				reg = <0x40>;
 
-				regulator-name = "p1v8_pch_aux";
-				regulator-enable-ramp-delay = <2000>;
-				vin-supply = <&p12v>;
+				regulators {
+					p1v8_pch_aux: vout {
+						regulator-name = "p1v8_pch_aux";
+						regulator-enable-ramp-delay = <2000>;
+						vin-supply = <&p12v>;
+					};
+				};
 			};
 		};
 
@@ -3596,34 +3624,42 @@ i2c@1 {
 		reg = <1>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		p5v_aux: ir38263-p5v-aux@40 {
+		ir38263_p5v_aux: ir38263-p5v-aux@40 {
 			compatible = "infineon,ir38263";
 			reg = <0x40>;
 
-			regulator-name = "p5v_aux";
-			regulator-enable-ramp-delay = <2000>;
-			vin-supply = <&p12v>;
-			vbus-supply = <&p3v3_bmc_aux>;
-			regulator-always-on;
-			regulator-boot-on;
+			regulators {
+				p5v_aux: vout {
+					regulator-name = "p5v_aux";
+					regulator-enable-ramp-delay = <2000>;
+					vin-supply = <&p12v>;
+					vbus-supply = <&p3v3_bmc_aux>;
+					regulator-always-on;
+					regulator-boot-on;
+				};
+			};
 		};
 	};
 	i2c@2 {
 		reg = <2>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		p3v3_aux: ir38263-p3v3-aux@40 {
+		ir38263_p3v3_aux: ir38263-p3v3-aux@40 {
 			compatible = "infineon,ir38263";
 			reg = <0x40>;
 
-			vin-supply = <&p12v>;
-			regulator-name = "p3v3_aux";
-			/*
-			 * 2msec for regulator + 18msec for board capacitance
-			 * Note: Every IC has a PTC which slowly charges the bypass
-			 * cap.
-			 */
-			regulator-enable-ramp-delay = <200000>;
+			regulators {
+				p3v3_aux: vout {
+					regulator-name = "p3v3_aux";
+					/*
+					 * 2msec for regulator + 18msec for board capacitance
+					 * Note: Every IC has a PTC which slowly charges the bypass
+					 * cap.
+					 */
+					vin-supply = <&p12v>;
+					regulator-enable-ramp-delay = <200000>;
+				};
+			};
 		};
 	};
 	i2c@3 {
-- 
2.42.0


