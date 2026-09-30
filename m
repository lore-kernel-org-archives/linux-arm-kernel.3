Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B8CCA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 11:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCnLVLhWtVLLmpN3x9fjuaEAEUhiKYtsxACEAQQZJ0o=; b=rsHJ0QyCq0QnAa5lfrNF1h7rKa
	Kg4zZuKnlbxCXb0bOUa81QsTExrhNGE2mDvcEZrHiK/VMkd9Zf0moegYhogCZ5kZ2JV+4xTHE22iN
	X1+poVnMlQFB/ijpk3r1iqZvoOOSkYqyji3pNVTnQlTD8Gi/XgIy/r+nbPLA8AQKGIBjU66KwAMO1
	SP3OmctKZ0cLlP3wBBrqUh5W8YHqJRAfu05HqrJMTsZVzTlufOyuWVdFQ4eAdCAkZSlwylrWvqc27
	LQaZBgc7bqAfdmxdN04jQoTApV3zdSN2GvmgybyKM7DJiRHfw8dqcuUL6Izo5/UjTIx+/7T/LWKco
	x6bqj4gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsLC-00000005qSn-3pfB;
	Wed, 30 Sep 2026 11:19:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsL7-00000005qQz-2N9G
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 11:19:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rCnLVLhWtVLLmpN3x9fjuaEAEUhiKYtsxACEAQQZJ0o=; b=nsRBUW4IMy0+ir+1mqLnsrSNR+
	wkkxckGqXIuix/8zXnX4jKNnRMcPZ+HcNlSpmXABQrRH07NEXwp+0YbHrCF5CRxCKYOit7QLAWjui
	9+9J7aY1d2hziaNoflU2DHiiwIbnt3o0Fe+AOqqnE0v0sWEtnovfZtfke29erAO6bdb6vLEnqAj82
	9QYVZvc1igb4BJwNOt1dNc9vI5JT+D9k66UEggPjU5I5txI1aUjMFgplaQSSWA6vxc7ibTuHwe/F9
	FOOY0TiStqTYQwOyWP2H+k9VsHEi3F2HuhlQzbK0FbMRo4C6xY2XC84bIxSJrLsSFTvXqpTPv97Kz
	KZQksKlw==;
Received: from mail-pz2-x29.google.com ([2607:f8b0:4864:3b::29])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBsL4-00000003hsT-179Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 11:19:08 +0000
Received: by mail-pz2-x29.google.com with SMTP id d2e1a72fcca58-88732460a36so265860b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 04:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790767144; x=1791371944; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rCnLVLhWtVLLmpN3x9fjuaEAEUhiKYtsxACEAQQZJ0o=;
        b=qVz8lpDxWsSZgrulTT9nnZQ7jcDS0TC+IBVOMMypYFV2n3gwgSfdVreyF5liVFPeCK
         lyf48ogvb8k4k8NzhtdDiK4I7VfjtuWsYFndoGA1emSKhFac/zdA376N50fFDHtD0b1v
         GFjGfmIV5TCgabyAnbPW/oMwRN0O1DSHHIqeGn9blUj0dQVaR2Oun6YkUb2ocmK7fNMD
         NpD0Cr1BLou1VgU7eyqRq4I7SKt+CZOwzt0hd33+vfkXjV/2ehgpZ4aiVSCpSdTlChB6
         3g28ErCZ6InCtXlkrEoKC2DhvfI5GbPAFLUzpLSLUU4x+TYFEQ3tkHjFZPKgPrl+Yjk5
         UeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767144; x=1791371944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rCnLVLhWtVLLmpN3x9fjuaEAEUhiKYtsxACEAQQZJ0o=;
        b=TERIaoDXkQQqutyRUQRpcjbo9kbwnuPTjcjH/jEqalXDfixnHjS5FrK1RRkE9r8WbV
         t2Tij+i1YBWGS+dz08fLQKRZIcaWyUGxHVGDTkQodJLPGsO7hryYSMl/QwLHVYzz5x0l
         43+eP5LTXqzhCpvLM9Lxk0y739+WgOOTbTLmWh0kim7qgmKb200VzIRyDLMgQyQSFmh3
         lKDGsrVus+4xMCtoMEAY2shp7nJ+zhNYEf8XbTOCUxK10/8z6jD0N8ZRv9xqpXdvoCVq
         Gbwn6vBmIxBgg4YfW5EOHvvTNIk2eo2E12l6FpjIM/iF0x1X7SR8wX+tcoTF0+rLZGDv
         19Sg==
X-Forwarded-Encrypted: i=1; AKwUvBxGwOtk+NYzgEYKhcgZI3xk635nY6uvpotp2wu01pADxmTXRuYlCVjcBmG62paH6ijYoiAFGIQXUSCPCravr0ZZ@lists.infradead.org
X-Gm-Message-State: AFuF++lH6F9svqJ8Vx0zQc8UebmbP5SoBhBFw3+THsK4ZGTvjeiJixjU
	t1ZidnqZ8uSrAgRmcf2wBMXBeCYgu0E3KXtZmFqWjyTH7a9CASMfegq/
X-Gm-Gg: AYBFou136adbt/UHWqhA7Tqm6sAVjIkP048dNrsyys1f6coplBEOv85YraVGKzyVpeJ
	fzkY9XB3HL66PCeRSb9Y9Q4s47fWxYJ8acP/edc34demmAIGRdL5/R1XVuE/gpo/04vCxY6SPvk
	zwcjaAz3qq/zHJuSH2ALStbcdESkpB48/n2IO2Vlv2lsaPUDXWHq4g2WcOkrgwiw5kdYPCfyxjz
	UitWQVtHqMa7bSwLadLNc7YumBamtw6z09tawwdCXm0Ft40iHs9X+EdCqPwg5ny91dCL2h6hXk4
	2zHrvlQNXUcJ433WJgrwyPX8MKHipumae7baGdljGMylZE9tuPTpfQV+Qyfm2TSAlac5Jex1Zdd
	omY1dapMVY8I0bXtOQo6/fKPJ13DrywQPKg+tBjiffxFeQKfJ96Wz/tNmCf4UZtU72DEOrgjaMs
	EEnjUOi3S9A50/XZezmLjvVpT9xCDDyaYzMp1ZIB3OhYwpTtb2mxcrHzZISD48j11Cajv9/MUgV
	ZifGmrPxeb+qmblCdkAI1Bq6G7l8nQf5cz8GtLDGf6EpMhiWgFLUqw=
X-Received: by 2002:a05:6a00:4390:b0:880:fe7b:bc56 with SMTP id d2e1a72fcca58-8874e53ec84mr760256b3a.50.1790767143558;
        Wed, 30 Sep 2026 04:19:03 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-887253992a9sm650257b3a.17.2026.09.30.04.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:19:03 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH v3 1/4] ARM: dts: aspeed: bletchley: Sort i2c device nodes by address
Date: Wed, 30 Sep 2026 19:18:10 +0800
Message-ID: <20260930111813.52396-2-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930111813.52396-1-chou.cosmo@gmail.com>
References: <20260930111813.52396-1-chou.cosmo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_121906_918215_4562DD4C 
X-CRM114-Status: GOOD (  12.95  )
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

Reorder child nodes in i2c0-i2c6 to follow ascending unit address
ordering as required by scripts/dtc/dt-check-style. No functional
changes.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-bletchley.dts  | 430 +++++++++---------
 1 file changed, 218 insertions(+), 212 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
index d1a04b63df9e..b022bdd02c1e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
@@ -343,10 +343,25 @@ flash@0 {
 
 &i2c0 {
 	status = "okay";
-	ina230@45 {
-		compatible = "ti,ina230";
-		reg = <0x45>;
-		shunt-resistor = <2000>;
+
+	sled1_fusb302: typec-portc@22 {
+		compatible = "fcs,fusb302";
+		reg = <0x22>;
+
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(B, 0) IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vbus_sled1>;
+
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x20>;
+			power-role = "dual";
+			data-role = "dual";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <10000000>;
+		};
 	};
 
 	mp5023@40 {
@@ -354,11 +369,6 @@ mp5023@40 {
 		reg = <0x40>;
 	};
 
-	tmp421@4f {
-		compatible = "ti,tmp421";
-		reg = <0x4f>;
-	};
-
 	sled1_ioexp41: pca9536@41 {
 		compatible = "nxp,pca9536";
 		reg = <0x41>;
@@ -370,20 +380,20 @@ sled1_ioexp41: pca9536@41 {
 		"SLED1_CLKREQ_N", "SLED1_PCIE_PWR_EN";
 	};
 
-	sled1_ioexp: pca9539@76 {
-		compatible = "nxp,pca9539";
-		reg = <0x76>;
-		gpio-controller;
-		#gpio-cells = <2>;
+	ina230@45 {
+		compatible = "ti,ina230";
+		reg = <0x45>;
+		shunt-resistor = <2000>;
+	};
 
-		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(M, 0) IRQ_TYPE_LEVEL_LOW>;
+	tmp421@4f {
+		compatible = "ti,tmp421";
+		reg = <0x4f>;
+	};
 
-		gpio-line-names =
-		"SLED1_MS_DETECT1","SLED1_VBUS_BMC_EN","SLED1_INA230_ALERT","SLED1_P12V_STBY_ALERT",
-		"SLED1_SSD_ALERT","SLED1_MS_DETECT0","SLED1_RST_CCG5","SLED1_FUSB302_INT",
-		"SLED1_MD_STBY_RESET","SLED1_MD_IOEXP_EN_FAULT","SLED1_MD_DIR","SLED1_MD_DECAY",
-		"SLED1_MD_MODE1","SLED1_MD_MODE2","SLED1_MD_MODE3","power-host1";
+	eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
 	};
 
 	sled1_leds: pca9552@67 {
@@ -401,13 +411,33 @@ sled1_leds: pca9552@67 {
 		"","","","";
 	};
 
-	sled1_fusb302: typec-portc@22 {
+	sled1_ioexp: pca9539@76 {
+		compatible = "nxp,pca9539";
+		reg = <0x76>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-parent = <&gpio0>;
+		interrupts = <ASPEED_GPIO(M, 0) IRQ_TYPE_LEVEL_LOW>;
+
+		gpio-line-names =
+		"SLED1_MS_DETECT1","SLED1_VBUS_BMC_EN","SLED1_INA230_ALERT","SLED1_P12V_STBY_ALERT",
+		"SLED1_SSD_ALERT","SLED1_MS_DETECT0","SLED1_RST_CCG5","SLED1_FUSB302_INT",
+		"SLED1_MD_STBY_RESET","SLED1_MD_IOEXP_EN_FAULT","SLED1_MD_DIR","SLED1_MD_DECAY",
+		"SLED1_MD_MODE1","SLED1_MD_MODE2","SLED1_MD_MODE3","power-host1";
+	};
+};
+
+&i2c1 {
+	status = "okay";
+
+	sled2_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
 		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(B, 0) IRQ_TYPE_LEVEL_LOW>;
-		vbus-supply = <&vbus_sled1>;
+		interrupts = <ASPEED_GPIO(B, 1) IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vbus_sled2>;
 
 		connector {
 			compatible = "usb-c-connector";
@@ -421,39 +451,51 @@ connector {
 		};
 	};
 
-	eeprom@54 {
-		compatible = "atmel,24c64";
-		reg = <0x54>;
+	mp5023@40 {
+		compatible = "mps,mp5023";
+		reg = <0x40>;
+	};
+
+	sled2_ioexp41: pca9536@41 {
+		compatible = "nxp,pca9536";
+		reg = <0x41>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"SLED2_SWD_MUX", "SLED2_XRES_SWD_N",
+		"SLED2_CLKREQ_N", "SLED2_PCIE_PWR_EN";
 	};
-};
 
-&i2c1 {
-	status = "okay";
 	ina230@45 {
 		compatible = "ti,ina230";
 		reg = <0x45>;
 		shunt-resistor = <2000>;
 	};
 
-	mp5023@40 {
-		compatible = "mps,mp5023";
-		reg = <0x40>;
-	};
-
 	tmp421@4f {
 		compatible = "ti,tmp421";
 		reg = <0x4f>;
 	};
 
-	sled2_ioexp41: pca9536@41 {
-		compatible = "nxp,pca9536";
-		reg = <0x41>;
+	eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
+	};
+
+	sled2_leds: pca9552@67 {
+		compatible = "nxp,pca9552";
+		reg = <0x67>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 		gpio-controller;
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"SLED2_SWD_MUX", "SLED2_XRES_SWD_N",
-		"SLED2_CLKREQ_N", "SLED2_PCIE_PWR_EN";
+		"led-sled2-amber","led-sled2-blue","SLED2_RST_IOEXP","SLED2_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
 	};
 
 	sled2_ioexp: pca9539@76 {
@@ -471,29 +513,18 @@ sled2_ioexp: pca9539@76 {
 		"SLED2_MD_STBY_RESET","SLED2_MD_IOEXP_EN_FAULT","SLED2_MD_DIR","SLED2_MD_DECAY",
 		"SLED2_MD_MODE1","SLED2_MD_MODE2","SLED2_MD_MODE3","power-host2";
 	};
+};
 
-	sled2_leds: pca9552@67 {
-		compatible = "nxp,pca9552";
-		reg = <0x67>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		gpio-line-names =
-		"led-sled2-amber","led-sled2-blue","SLED2_RST_IOEXP","SLED2_MD_REF_PWM",
-		"","","","",
-		"","","","",
-		"","","","";
-	};
+&i2c2 {
+	status = "okay";
 
-	sled2_fusb302: typec-portc@22 {
+	sled3_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
 		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(B, 1) IRQ_TYPE_LEVEL_LOW>;
-		vbus-supply = <&vbus_sled2>;
+		interrupts = <ASPEED_GPIO(B, 7) IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vbus_sled3>;
 
 		connector {
 			compatible = "usb-c-connector";
@@ -507,39 +538,51 @@ connector {
 		};
 	};
 
-	eeprom@54 {
-		compatible = "atmel,24c64";
-		reg = <0x54>;
+	mp5023@40 {
+		compatible = "mps,mp5023";
+		reg = <0x40>;
+	};
+
+	sled3_ioexp41: pca9536@41 {
+		compatible = "nxp,pca9536";
+		reg = <0x41>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"SLED3_SWD_MUX", "SLED3_XRES_SWD_N",
+		"SLED3_CLKREQ_N", "SLED3_PCIE_PWR_EN";
 	};
-};
 
-&i2c2 {
-	status = "okay";
 	ina230@45 {
 		compatible = "ti,ina230";
 		reg = <0x45>;
 		shunt-resistor = <2000>;
 	};
 
-	mp5023@40 {
-		compatible = "mps,mp5023";
-		reg = <0x40>;
-	};
-
 	tmp421@4f {
 		compatible = "ti,tmp421";
 		reg = <0x4f>;
 	};
 
-	sled3_ioexp41: pca9536@41 {
-		compatible = "nxp,pca9536";
-		reg = <0x41>;
+	eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
+	};
+
+	sled3_leds: pca9552@67 {
+		compatible = "nxp,pca9552";
+		reg = <0x67>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 		gpio-controller;
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"SLED3_SWD_MUX", "SLED3_XRES_SWD_N",
-		"SLED3_CLKREQ_N", "SLED3_PCIE_PWR_EN";
+		"led-sled3-amber","led-sled3-blue","SLED3_RST_IOEXP","SLED3_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
 	};
 
 	sled3_ioexp: pca9539@76 {
@@ -557,29 +600,18 @@ sled3_ioexp: pca9539@76 {
 		"SLED3_MD_STBY_RESET","SLED3_MD_IOEXP_EN_FAULT","SLED3_MD_DIR","SLED3_MD_DECAY",
 		"SLED3_MD_MODE1","SLED3_MD_MODE2","SLED3_MD_MODE3","power-host3";
 	};
+};
 
-	sled3_leds: pca9552@67 {
-		compatible = "nxp,pca9552";
-		reg = <0x67>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		gpio-line-names =
-		"led-sled3-amber","led-sled3-blue","SLED3_RST_IOEXP","SLED3_MD_REF_PWM",
-		"","","","",
-		"","","","",
-		"","","","";
-	};
+&i2c3 {
+	status = "okay";
 
-	sled3_fusb302: typec-portc@22 {
+	sled4_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
 		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(B, 7) IRQ_TYPE_LEVEL_LOW>;
-		vbus-supply = <&vbus_sled3>;
+		interrupts = <ASPEED_GPIO(S, 7) IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vbus_sled4>;
 
 		connector {
 			compatible = "usb-c-connector";
@@ -593,39 +625,51 @@ connector {
 		};
 	};
 
-	eeprom@54 {
-		compatible = "atmel,24c64";
-		reg = <0x54>;
+	mp5023@40 {
+		compatible = "mps,mp5023";
+		reg = <0x40>;
+	};
+
+	sled4_ioexp41: pca9536@41 {
+		compatible = "nxp,pca9536";
+		reg = <0x41>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"SLED4_SWD_MUX", "SLED4_XRES_SWD_N",
+		"SLED4_CLKREQ_N", "SLED4_PCIE_PWR_EN";
 	};
-};
 
-&i2c3 {
-	status = "okay";
 	ina230@45 {
 		compatible = "ti,ina230";
 		reg = <0x45>;
 		shunt-resistor = <2000>;
 	};
 
-	mp5023@40 {
-		compatible = "mps,mp5023";
-		reg = <0x40>;
-	};
-
 	tmp421@4f {
 		compatible = "ti,tmp421";
 		reg = <0x4f>;
 	};
 
-	sled4_ioexp41: pca9536@41 {
-		compatible = "nxp,pca9536";
-		reg = <0x41>;
+	eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
+	};
+
+	sled4_leds: pca9552@67 {
+		compatible = "nxp,pca9552";
+		reg = <0x67>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 		gpio-controller;
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"SLED4_SWD_MUX", "SLED4_XRES_SWD_N",
-		"SLED4_CLKREQ_N", "SLED4_PCIE_PWR_EN";
+		"led-sled4-amber","led-sled4-blue","SLED4_RST_IOEXP","SLED4_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
 	};
 
 	sled4_ioexp: pca9539@76 {
@@ -643,29 +687,18 @@ sled4_ioexp: pca9539@76 {
 		"SLED4_MD_STBY_RESET","SLED4_MD_IOEXP_EN_FAULT","SLED4_MD_DIR","SLED4_MD_DECAY",
 		"SLED4_MD_MODE1","SLED4_MD_MODE2","SLED4_MD_MODE3","power-host4";
 	};
+};
 
-	sled4_leds: pca9552@67 {
-		compatible = "nxp,pca9552";
-		reg = <0x67>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		gpio-line-names =
-		"led-sled4-amber","led-sled4-blue","SLED4_RST_IOEXP","SLED4_MD_REF_PWM",
-		"","","","",
-		"","","","",
-		"","","","";
-	};
+&i2c4 {
+	status = "okay";
 
-	sled4_fusb302: typec-portc@22 {
+	sled5_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
 		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(S, 7) IRQ_TYPE_LEVEL_LOW>;
-		vbus-supply = <&vbus_sled4>;
+		interrupts = <ASPEED_GPIO(Y, 3) IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vbus_sled5>;
 
 		connector {
 			compatible = "usb-c-connector";
@@ -679,39 +712,51 @@ connector {
 		};
 	};
 
-	eeprom@54 {
-		compatible = "atmel,24c64";
-		reg = <0x54>;
+	mp5023@40 {
+		compatible = "mps,mp5023";
+		reg = <0x40>;
+	};
+
+	sled5_ioexp41: pca9536@41 {
+		compatible = "nxp,pca9536";
+		reg = <0x41>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio-line-names =
+		"SLED5_SWD_MUX", "SLED5_XRES_SWD_N",
+		"SLED5_CLKREQ_N", "SLED5_PCIE_PWR_EN";
 	};
-};
 
-&i2c4 {
-	status = "okay";
 	ina230@45 {
 		compatible = "ti,ina230";
 		reg = <0x45>;
 		shunt-resistor = <2000>;
 	};
 
-	mp5023@40 {
-		compatible = "mps,mp5023";
-		reg = <0x40>;
-	};
-
 	tmp421@4f {
 		compatible = "ti,tmp421";
 		reg = <0x4f>;
 	};
 
-	sled5_ioexp41: pca9536@41 {
-		compatible = "nxp,pca9536";
-		reg = <0x41>;
+	eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
+	};
+
+	sled5_leds: pca9552@67 {
+		compatible = "nxp,pca9552";
+		reg = <0x67>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 		gpio-controller;
 		#gpio-cells = <2>;
 
 		gpio-line-names =
-		"SLED5_SWD_MUX", "SLED5_XRES_SWD_N",
-		"SLED5_CLKREQ_N", "SLED5_PCIE_PWR_EN";
+		"led-sled5-amber","led-sled5-blue","SLED5_RST_IOEXP","SLED5_MD_REF_PWM",
+		"","","","",
+		"","","","",
+		"","","","";
 	};
 
 	sled5_ioexp: pca9539@76 {
@@ -729,29 +774,18 @@ sled5_ioexp: pca9539@76 {
 		"SLED5_MD_STBY_RESET","SLED5_MD_IOEXP_EN_FAULT","SLED5_MD_DIR","SLED5_MD_DECAY",
 		"SLED5_MD_MODE1","SLED5_MD_MODE2","SLED5_MD_MODE3","power-host5";
 	};
+};
 
-	sled5_leds: pca9552@67 {
-		compatible = "nxp,pca9552";
-		reg = <0x67>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		gpio-line-names =
-		"led-sled5-amber","led-sled5-blue","SLED5_RST_IOEXP","SLED5_MD_REF_PWM",
-		"","","","",
-		"","","","",
-		"","","","";
-	};
+&i2c5 {
+	status = "okay";
 
-	sled5_fusb302: typec-portc@22 {
+	sled6_fusb302: typec-portc@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
 
 		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(Y, 3) IRQ_TYPE_LEVEL_LOW>;
-		vbus-supply = <&vbus_sled5>;
+		interrupts = <ASPEED_GPIO(I, 7) IRQ_TYPE_LEVEL_LOW>;
+		vbus-supply = <&vbus_sled6>;
 
 		connector {
 			compatible = "usb-c-connector";
@@ -765,30 +799,11 @@ connector {
 		};
 	};
 
-	eeprom@54 {
-		compatible = "atmel,24c64";
-		reg = <0x54>;
-	};
-};
-
-&i2c5 {
-	status = "okay";
-	ina230@45 {
-		compatible = "ti,ina230";
-		reg = <0x45>;
-		shunt-resistor = <2000>;
-	};
-
 	mp5023@40 {
 		compatible = "mps,mp5023";
 		reg = <0x40>;
 	};
 
-	tmp421@4f {
-		compatible = "ti,tmp421";
-		reg = <0x4f>;
-	};
-
 	sled6_ioexp41: pca9536@41 {
 		compatible = "nxp,pca9536";
 		reg = <0x41>;
@@ -800,20 +815,20 @@ sled6_ioexp41: pca9536@41 {
 		"SLED6_CLKREQ_N", "SLED6_PCIE_PWR_EN";
 	};
 
-	sled6_ioexp: pca9539@76 {
-		compatible = "nxp,pca9539";
-		reg = <0x76>;
-		gpio-controller;
-		#gpio-cells = <2>;
+	ina230@45 {
+		compatible = "ti,ina230";
+		reg = <0x45>;
+		shunt-resistor = <2000>;
+	};
 
-		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(M, 5) IRQ_TYPE_LEVEL_LOW>;
+	tmp421@4f {
+		compatible = "ti,tmp421";
+		reg = <0x4f>;
+	};
 
-		gpio-line-names =
-		"SLED6_MS_DETECT1","SLED6_VBUS_BMC_EN","SLED6_INA230_ALERT","SLED6_P12V_STBY_ALERT",
-		"SLED6_SSD_ALERT","SLED6_MS_DETECT0","SLED6_RST_CCG5","SLED6_FUSB302_INT",
-		"SLED6_MD_STBY_RESET","SLED6_MD_IOEXP_EN_FAULT","SLED6_MD_DIR","SLED6_MD_DECAY",
-		"SLED6_MD_MODE1","SLED6_MD_MODE2","SLED6_MD_MODE3","power-host6";
+	eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
 	};
 
 	sled6_leds: pca9552@67 {
@@ -831,45 +846,36 @@ sled6_leds: pca9552@67 {
 		"","","","";
 	};
 
-	sled6_fusb302: typec-portc@22 {
-		compatible = "fcs,fusb302";
-		reg = <0x22>;
+	sled6_ioexp: pca9539@76 {
+		compatible = "nxp,pca9539";
+		reg = <0x76>;
+		gpio-controller;
+		#gpio-cells = <2>;
 
 		interrupt-parent = <&gpio0>;
-		interrupts = <ASPEED_GPIO(I, 7) IRQ_TYPE_LEVEL_LOW>;
-		vbus-supply = <&vbus_sled6>;
-
-		connector {
-			compatible = "usb-c-connector";
-			label = "USB-C";
-			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x20>;
-			power-role = "dual";
-			data-role = "dual";
-			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			op-sink-microwatt = <10000000>;
-		};
-	};
+		interrupts = <ASPEED_GPIO(M, 5) IRQ_TYPE_LEVEL_LOW>;
 
-	eeprom@54 {
-		compatible = "atmel,24c64";
-		reg = <0x54>;
+		gpio-line-names =
+		"SLED6_MS_DETECT1","SLED6_VBUS_BMC_EN","SLED6_INA230_ALERT","SLED6_P12V_STBY_ALERT",
+		"SLED6_SSD_ALERT","SLED6_MS_DETECT0","SLED6_RST_CCG5","SLED6_FUSB302_INT",
+		"SLED6_MD_STBY_RESET","SLED6_MD_IOEXP_EN_FAULT","SLED6_MD_DIR","SLED6_MD_DECAY",
+		"SLED6_MD_MODE1","SLED6_MD_MODE2","SLED6_MD_MODE3","power-host6";
 	};
 };
 
 &i2c6 {
 	status = "okay";
 
-	eeprom@56 {
-		compatible = "atmel,24c64";
-		reg = <0x56>;
-	};
-
 	rtc@51 {
 		/* in-chip rtc disabled, use external rtc (battery-backed) */
 		compatible = "nxp,pcf85263";
 		reg = <0x51>;
 	};
+
+	eeprom@56 {
+		compatible = "atmel,24c64";
+		reg = <0x56>;
+	};
 };
 
 &i2c7 {
-- 
2.43.0


