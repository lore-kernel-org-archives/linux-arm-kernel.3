Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E83CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 23:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QW/G35MOi1nbpenKn0jGc/i9ZxGqUMDCw5SmHmcN3xo=; b=xoQAgC8/vFt7/BcTYfs/bih39k
	czldTOa2UstEi8YKAk2egHYLJu5nxf3clq3dEui/CV6LSbhGDLarWYdWwjQKgk0a651NstjDhVddJ
	N0rAosHKsmolzVMpcs76d44TXILexaaObbsK5uGTPG2s0FyttLIfHe7lHIKh5UkJQTNLFnPo58g6S
	l04w1ybdHKG/jSBX1sSDVb2R//6XTB8tG4VAEE/zr0l3zrSo7LdjSPODx/xmWsyFSofbAkV10ylO+
	zk8bNOEweJjNxTxcJFLbVcAf+ZLlA9nyyXEDd1emfe+LNccqe8MMhe4W/9sah27xzjAEgIaNCQA1R
	ipHtJcBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEcEQ-0000000597v-25JA;
	Thu, 30 Oct 2025 23:39:02 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEcEN-0000000597F-18E6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 23:39:00 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b6d676a512eso28121966b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 16:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761867537; x=1762472337; darn=lists.infradead.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QW/G35MOi1nbpenKn0jGc/i9ZxGqUMDCw5SmHmcN3xo=;
        b=nP9Nb0eaSuf8OFolSL537/fmC974iwcwn60YeQAW5s/6M40qfrX1hX4vVNpU+diX2J
         HpxxInvkvsaO4TsjUReJ/+mVw/eD6oHXrbhe+36vyWRpb09UrkTEhS6NRjhtiHH7dF/z
         1yJIcFm8bp5dQqb7mmUm70Rorw+zw5PTHKjtb3TbTFsTI5GnQrUS0bZGUhQ+3Xs9Oyz4
         aBSDl9JeH+TgUkPDrwmHfDuLNJAGrexl0Qf4plhGEkxWHxde5eoQPq3pcuDkGNklY7kk
         ZjUkSnIndQ4aS3LVrlFySVRNgcSJoEaHX8KjT6pWe8b9eFRyQv4eOP2L6hTCoRiMeZ5q
         n6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761867537; x=1762472337;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QW/G35MOi1nbpenKn0jGc/i9ZxGqUMDCw5SmHmcN3xo=;
        b=Gg6LhdVVDU1NhT66d8jDNZs35NU30dNGVadqUK0FqJ+0HuXqj3XLH1jsj1k1qwvDtv
         0GOOOzXtW50AEXj7iu7E0aH1N4iGSuwPQxGctGMBQMkJwwBHIorXO3WZk2TJzS+nghH9
         tpuF3FxLojqYdayq6DZWsexFVDRLW5FphfZV9kpNjmlutTBgIGiBLQainvUtiPPXRiGy
         jAEOk8ED6Cus/fdoFkEBJTIsLWpXS2QYSrsPD06YWd9mokkGFtjvoDnJRGZd8aeWIHCD
         jLnAoQBxMDIFTJKwnjaFBZmWFpYFcabG9yzisc5WGeN+w4a5H4CoqyHyU2h8eaT5AI1Q
         QDQA==
X-Forwarded-Encrypted: i=1; AJvYcCXJyMkSsX3VxvNs5LLZ4rQ0w95SK5RRQMZs7LTqGvr7Rk3r/1mcyiZp6LzRHw550FRVDAha7P9DZRyL71ddbVL2@lists.infradead.org
X-Gm-Message-State: AOJu0YwpYpLf+N3PeIaw1NQXlAokeTuP7i314b6nBorqXG+0ZXp6+Q8c
	Mr2e7af4PH1G+BhsHagEVd7hVU0xIWaJHTCN4vpW/gbm6Me/TguSys7E
X-Gm-Gg: ASbGncvfUO7pZLFr6Td2/Ir1mCB7lMxbcOgD7VWPfqQHeettMhpp8m1vy6dwPjWxFFB
	CdnC9Iy760r7yUPJwPa33tFhctKp+9CmZ3EL+etgGU6RjSVQ3IizkaqUVNABBmvi3djlYKSoKzo
	UtfQaf3bqrQRsCKeXcXnulToOlBU520+o9f419nTi2kkdW9JdxfTdfTIdvBHvwnefNNTVOOTY3z
	DOVmUaLsggQ5sQhJoXOhCFmEoJReKAczTRo58j9MuX5GWSs8UxVdGidUQB3chTaMhOGCNlZfu2J
	D7POVNYtj+LBoNAO1bLkFlaAusXsKie3BvIWa1fFJX9aUetZrRBUDvwdhUN8UHac7WRCPPq0Wu/
	Ks92PAn2FuCIjtZDU3dGFQJ4Kilf2nzmAq9k2dpg2ZWsOgsFLTGi60uYtb+c9CHaiR+Tq4rMfC7
	Cwk22eXFkgop39odXSxDvnxyjLoBXTzmsdy7vxy4FF4XePtMbiFg==
X-Google-Smtp-Source: AGHT+IFu52Lv7EHZGXKUGlAUADqfNrD4YHhFGg0CHcltbEW9aIgyfK1tlwF8IrE/Dn5an5+ltyyBEw==
X-Received: by 2002:a17:907:3c8c:b0:b4e:e4c4:4245 with SMTP id a640c23a62f3a-b70701891d9mr74782666b.3.1761867536930;
        Thu, 30 Oct 2025 16:38:56 -0700 (PDT)
Received: from ?IPV6:2a02:a449:4071:0:32d0:42ff:fe10:6983? ([2a02:a449:4071:0:32d0:42ff:fe10:6983])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7077c3dbeesm11779266b.44.2025.10.30.16.38.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 16:38:56 -0700 (PDT)
Message-ID: <b3d05df4-a916-48e1-8d9e-590782806bd5@gmail.com>
Date: Fri, 31 Oct 2025 00:38:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1] arm: dts: rockchip: fix tps65910 nodes
To: heiko@sntech.de
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_163859_440433_1134F24B 
X-CRM114-Status: GOOD (  10.34  )
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

The binding for tps65910 is converted to yaml and they have
changed the regulator nodename layout and added some required
properties. Fix the tps65910 nodes on Rockchip boards.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 .../boot/dts/rockchip/rk3066a-bqcurie2.dts    | 34 ++++++++++--------
 .../boot/dts/rockchip/rk3066a-marsboard.dts   | 34 ++++++++++--------
 .../boot/dts/rockchip/rk3066a-rayeager.dts    | 35 +++++++++++--------
 3 files changed, 59 insertions(+), 44 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3066a-bqcurie2.dts b/arch/arm/boot/dts/rockchip/rk3066a-bqcurie2.dts
index c227691013ea..65f8bc804d21 100644
--- a/arch/arm/boot/dts/rockchip/rk3066a-bqcurie2.dts
+++ b/arch/arm/boot/dts/rockchip/rk3066a-bqcurie2.dts
@@ -80,26 +80,33 @@ &i2c1 {
 	clock-frequency = <400000>;

 	tps: tps@2d {
+		compatible = "ti,tps65910";
 		reg = <0x2d>;

+		gpio-controller;
+		#gpio-cells = <2>;
+
 		interrupt-parent = <&gpio6>;
 		interrupts = <RK_PA6 IRQ_TYPE_LEVEL_LOW>;

+		interrupt-controller;
+		#interrupt-cells = <2>;
+
 		vcc5-supply = <&vcc_io>;
 		vcc6-supply = <&vcc_io>;

 		regulators {
-			vcc_rtc: regulator@0 {
+			vcc_rtc: vrtc {
 				regulator-name = "vcc_rtc";
 				regulator-always-on;
 			};

-			vcc_io: regulator@1 {
+			vcc_io: vio {
 				regulator-name = "vcc_io";
 				regulator-always-on;
 			};

-			vdd_arm: regulator@2 {
+			vdd_arm: vdd1 {
 				regulator-name = "vdd_arm";
 				regulator-min-microvolt = <600000>;
 				regulator-max-microvolt = <1500000>;
@@ -107,7 +114,7 @@ vdd_arm: regulator@2 {
 				regulator-always-on;
 			};

-			vcc_ddr: regulator@3 {
+			vcc_ddr: vdd2 {
 				regulator-name = "vcc_ddr";
 				regulator-min-microvolt = <600000>;
 				regulator-max-microvolt = <1500000>;
@@ -115,42 +122,42 @@ vcc_ddr: regulator@3 {
 				regulator-always-on;
 			};

-			vcc18_cif: regulator@5 {
+			vcc18_cif: vdig1 {
 				regulator-name = "vcc18_cif";
 				regulator-always-on;
 			};

-			vdd_11: regulator@6 {
+			vdd_11: vdig2 {
 				regulator-name = "vdd_11";
 				regulator-always-on;
 			};

-			vcc_25: regulator@7 {
+			vcc_25: vpll {
 				regulator-name = "vcc_25";
 				regulator-always-on;
 			};

-			vcc_18: regulator@8 {
+			vcc_18: vdac {
 				regulator-name = "vcc_18";
 				regulator-always-on;
 			};

-			vcc25_hdmi: regulator@9 {
+			vcc25_hdmi: vaux1 {
 				regulator-name = "vcc25_hdmi";
 				regulator-always-on;
 			};

-			vcca_33: regulator@10 {
+			vcca_33: vaux2 {
 				regulator-name = "vcca_33";
 				regulator-always-on;
 			};

-			vcc_tp: regulator@11 {
+			vcc_tp: vaux33 {
 				regulator-name = "vcc_tp";
 				regulator-always-on;
 			};

-			vcc28_cif: regulator@12 {
+			vcc28_cif: vmmc {
 				regulator-name = "vcc28_cif";
 				regulator-always-on;
 			};
@@ -158,9 +165,6 @@ vcc28_cif: regulator@12 {
 	};
 };

-/* must be included after &tps gets defined */
-#include "../tps65910.dtsi"
-
 &mmc0 { /* sdmmc */
 	status = "okay";
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/rockchip/rk3066a-marsboard.dts b/arch/arm/boot/dts/rockchip/rk3066a-marsboard.dts
index de42d1855121..15dbe1677e30 100644
--- a/arch/arm/boot/dts/rockchip/rk3066a-marsboard.dts
+++ b/arch/arm/boot/dts/rockchip/rk3066a-marsboard.dts
@@ -96,11 +96,18 @@ &i2c1 {
 	clock-frequency = <400000>;

 	tps: tps@2d {
+		compatible = "ti,tps65910";
 		reg = <0x2d>;

+		gpio-controller;
+		#gpio-cells = <2>;
+
 		interrupt-parent = <&gpio6>;
 		interrupts = <RK_PA4 IRQ_TYPE_LEVEL_LOW>;

+		interrupt-controller;
+		#interrupt-cells = <2>;
+
 		vcc1-supply = <&vsys>;
 		vcc2-supply = <&vsys>;
 		vcc3-supply = <&vsys>;
@@ -111,17 +118,17 @@ tps: tps@2d {
 		vccio-supply = <&vsys>;

 		regulators {
-			vcc_rtc: regulator@0 {
+			vcc_rtc: vrtc {
 				regulator-name = "vcc_rtc";
 				regulator-always-on;
 			};

-			vcc_io: regulator@1 {
+			vcc_io: vio {
 				regulator-name = "vcc_io";
 				regulator-always-on;
 			};

-			vdd_arm: regulator@2 {
+			vdd_arm: vdd1 {
 				regulator-name = "vdd_arm";
 				regulator-min-microvolt = <600000>;
 				regulator-max-microvolt = <1500000>;
@@ -129,7 +136,7 @@ vdd_arm: regulator@2 {
 				regulator-always-on;
 			};

-			vcc_ddr: regulator@3 {
+			vcc_ddr: vdd2 {
 				regulator-name = "vcc_ddr";
 				regulator-min-microvolt = <600000>;
 				regulator-max-microvolt = <1500000>;
@@ -137,41 +144,41 @@ vcc_ddr: regulator@3 {
 				regulator-always-on;
 			};

-			vcc18_cif: regulator@5 {
+			vcc18_cif: vdig1 {
 				regulator-name = "vcc18_cif";
 				regulator-always-on;
 			};

-			vdd_11: regulator@6 {
+			vdd_11: vdig2 {
 				regulator-name = "vdd_11";
 				regulator-always-on;
 			};

-			vcc_25: regulator@7 {
+			vcc_25: vpll {
 				regulator-name = "vcc_25";
 				regulator-always-on;
 			};

-			vcc_18: regulator@8 {
+			vcc_18: vdac {
 				regulator-name = "vcc_18";
 				regulator-always-on;
 			};

-			vcc25_hdmi: regulator@9 {
+			vcc25_hdmi: vaux1 {
 				regulator-name = "vcc25_hdmi";
 				regulator-always-on;
 			};

-			vcca_33: regulator@10 {
+			vcca_33: vaux2 {
 				regulator-name = "vcca_33";
 				regulator-always-on;
 			};

-			vcc_rmii: regulator@11 {
+			vcc_rmii: vaux33 {
 				regulator-name = "vcc_rmii";
 			};

-			vcc28_cif: regulator@12 {
+			vcc28_cif: vmmc {
 				regulator-name = "vcc28_cif";
 				regulator-always-on;
 			};
@@ -179,9 +186,6 @@ vcc28_cif: regulator@12 {
 	};
 };

-/* must be included after &tps gets defined */
-#include "../tps65910.dtsi"
-
 &emac {
 	phy = <&phy0>;
 	phy-supply = <&vcc_rmii>;
diff --git a/arch/arm/boot/dts/rockchip/rk3066a-rayeager.dts b/arch/arm/boot/dts/rockchip/rk3066a-rayeager.dts
index b0b029f14643..07c03ed6fac6 100644
--- a/arch/arm/boot/dts/rockchip/rk3066a-rayeager.dts
+++ b/arch/arm/boot/dts/rockchip/rk3066a-rayeager.dts
@@ -198,9 +198,18 @@ &i2c1 {
 	status = "okay";

 	tps: tps@2d {
+		compatible = "ti,tps65910";
 		reg = <0x2d>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
 		interrupt-parent = <&gpio6>;
 		interrupts = <RK_PA4 IRQ_TYPE_EDGE_RISING>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
 		pinctrl-names = "default";
 		pinctrl-0 = <&pmic_int>, <&pwr_hold>;

@@ -214,19 +223,19 @@ tps: tps@2d {
 		vccio-supply = <&vsys>;

 		regulators {
-			vcc_rtc: regulator@0 {
+			vcc_rtc: vrtc {
 				regulator-name = "vcc_rtc";
 				regulator-always-on;
 			};

-			vcc_io: regulator@1 {
+			vcc_io: vio {
 				regulator-name = "vcc_io";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-always-on;
 			};

-			vdd_arm: regulator@2 {
+			vdd_arm: vdd1 {
 				regulator-name = "vdd_arm";
 				regulator-min-microvolt = <600000>;
 				regulator-max-microvolt = <1500000>;
@@ -234,7 +243,7 @@ vdd_arm: regulator@2 {
 				regulator-boot-on;
 			};

-			vcc_ddr: regulator@3 {
+			vcc_ddr: vdd2 {
 				regulator-name = "vcc_ddr";
 				regulator-min-microvolt = <600000>;
 				regulator-max-microvolt = <1500000>;
@@ -242,52 +251,52 @@ vcc_ddr: regulator@3 {
 				regulator-boot-on;
 			};

-			vcc18: regulator@5 {
+			vcc18: vdig1 {
 				regulator-name = "vcc18";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
 			};

-			vdd_11: regulator@6 {
+			vdd_11: vdig2 {
 				regulator-name = "vdd_11";
 				regulator-min-microvolt = <1100000>;
 				regulator-max-microvolt = <1100000>;
 				regulator-always-on;
 			};

-			vcc_25: regulator@7 {
+			vcc_25: vpll {
 				regulator-name = "vcc_25";
 				regulator-min-microvolt = <2500000>;
 				regulator-max-microvolt = <2500000>;
 				regulator-always-on;
 			};

-			vccio_wl: regulator@8 {
+			vccio_wl: vdac {
 				regulator-name = "vccio_wl";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 			};

-			vcc25_hdmi: regulator@9 {
+			vcc25_hdmi: vaux1 {
 				regulator-name = "vcc25_hdmi";
 				regulator-min-microvolt = <2500000>;
 				regulator-max-microvolt = <2500000>;
 			};

-			vcca_33: regulator@10 {
+			vcca_33: vaux2 {
 				regulator-name = "vcca_33";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 			};

-			vcc_rmii: regulator@11 {
+			vcc_rmii: vaux33 {
 				regulator-name = "vcc_rmii";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 			};

-			vcc28_cif: regulator@12 {
+			vcc28_cif: vmmc {
 				regulator-name = "vcc28_cif";
 				regulator-min-microvolt = <2800000>;
 				regulator-max-microvolt = <2800000>;
@@ -296,8 +305,6 @@ vcc28_cif: regulator@12 {
 	};
 };

-#include "../tps65910.dtsi"
-
 &i2c2 {
 	status = "okay";
 };
--
2.39.5


