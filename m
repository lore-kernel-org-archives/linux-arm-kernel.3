Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AC3CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 08:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ybe/vNHybbFFD9CumA+Ao11VG7Qh745VMU9T9J4X9OI=; b=beGFz77ALpLmEf5cDR3MdGz2hx
	4ZQHzWmhF0qC5rfAN47dAm5z5B2YkjutnhBhsbewxgASqGPJIuw1f8Jp99qrfeLdGjlhB/G9Z+CXN
	pTfo7ZAFu2zV22URB8aSirec/eDiX5d5AuRqDkfy66L1ppVoqetVOi81v2jMjn/E6uPjIArDb6gwx
	v+/d5pYtKQ1C5sRugOTFn11CGRHorLBzL+QcDQkesTAoTqWwDjH12kPeHzjsHs2Q0qPR/qmucSZGw
	yIzjghHnJjFWFi1SdB9E8sV6Pb9GN+zQuj+XKXKGFQUtKeTwHr2nOgLMrmwYMUymnbsu9ofE9F0qm
	+HMPXscw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvXXs-0000000ForH-0MCK;
	Mon, 08 Sep 2025 08:48:16 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWpZ-0000000FY83-3H97
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 08:02:30 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-772301f8ae2so3383118b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 01:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757318549; x=1757923349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ybe/vNHybbFFD9CumA+Ao11VG7Qh745VMU9T9J4X9OI=;
        b=ZbEks1Rp3q7TOpdzBETI/OQJWex7/nR2T5ksky+vxFhS9xV7KQbXIJbuCBFfkR3bM8
         Y4UHBZKVJhNbf0+sg5FB9dXGrZFtaL0AIYD3ulLw8RSm8Z7YJMA9d+p/XTirZwixeWG+
         RZAOU/Q/omvd5KsaapkE2tgGAfz3QSAigXVr9dMv+xmwGZaqwk17JgpsRvz3DKC127vy
         U1A/KyRcCUuQEfIlj22G7kfGgTmLbH/cZbjuguE23chpHTqqmFCcr0465UEgD1K7ZJno
         anMVcPiA7q1T6GZnIc/lIAQgBckgyxiZaewLhzrQIGvv7KEzDH99ALCXG7/U28FU8AAF
         rBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757318549; x=1757923349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ybe/vNHybbFFD9CumA+Ao11VG7Qh745VMU9T9J4X9OI=;
        b=pgQuLAV9L2a97cjgEUeCLMPU6WPKlP/sgfL2g/OFlVIFHwX4/JyPeATerYB6BvRX42
         PoxhIHwlkl0Doz3gkGD2BedpQOMV3wQv4nYkGEUvR2uE/fNGfConL/4OTlBnhasGZ6+u
         85G0DLUf1k4M0SlRACuVCGvqgPBl+mzAFGP9w72wD0RdK2oulabzMo09cT+WrKuVy5G/
         6N/nN0XMwphDNYtwwwqqg9vfIpR1gLE5BIUi7Eld3He3g0Jyvx1+19hPM9RRgrp8T/bn
         NuiRRF3qcEWBWVbSGl9E7pe5MR/u/3fyTdi5gdY2txKh93UvdDmTWbw2Z9HIqfxJ9pdF
         h0/g==
X-Forwarded-Encrypted: i=1; AJvYcCUMm/UNqJFh/lEyk26hpuGnocR0V2we3H61nzVJ7x9Cdk9bHPxaHvsDsb8ekZoxlqhCj31UQ57WbhwdR8ENlYyG@lists.infradead.org
X-Gm-Message-State: AOJu0YxBWu4J89rMndEg56zM+bw1sWJdX3ZAb+TGtiJ9/9Mdd62qIxbF
	G91zm/9q93VynI0U4csUVlqop4K0Sjo36fRnBV3VtGlKZu6TJeqiUJjJ
X-Gm-Gg: ASbGncv+TrzZRiyYIl/f8UvprJbS5lCHfk4rmQ35L6VZz0j5UBs41S3ooLS77pDJMUP
	RDnXHfWh2vbktk06/wkXN/KcXOfGQAwGjAvj1vfeVWR/EMF7BxCPjIGcqAGphRmAP+ZGNkgY7gs
	0rcTluVj4pKQ/Huw/eLRIN8vaWW940fQ9RMIFkYyISwWhSeopsgCmaq30bvpeBBIycF8XJEc4mb
	39RCopWXDPTLdVirnxhf3cAeIeeIVjdvZ4/wJBjEvN2tZ3RA3UlRI9CEbAXKpeJmH1f3nNiFV4V
	pAyHBrpqVdVe3Mt1F2OQSmUNtuvravHrsBW4fP/T2vHQgI8KpIDvJBJbkbX5EsIdUuQGMq38b1d
	m+lVewdow/OnIGc4QVeiSzDhAQRHya/SvZTSwcrI2rN3QxPnEaNhbwIQ0T60Ji35Wq4MKE7erVD
	7QDH4IFiBcx+qMlF7BMDew7Q6PwCnfvq+0zNNRoC1cH15H9VeoWTvWCiJvBaLOt+VwuF0=
X-Google-Smtp-Source: AGHT+IF5xuJKrndVnQJrr29v05c6QYNtUIFOS76fOYQ7hiiP6yT0C+Eh+nmZB7rDRHBxj/cT+rWaKA==
X-Received: by 2002:a05:6a21:6d99:b0:248:ace6:755a with SMTP id adf61e73a8af0-2533e5727ecmr9790095637.11.1757318548740;
        Mon, 08 Sep 2025 01:02:28 -0700 (PDT)
Received: from fred-System-Product-Name.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7727bce1b58sm15186600b3a.9.2025.09.08.01.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:02:28 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] ARM: dts: aspeed: santabarbara: add sensor support for extension boards
Date: Mon,  8 Sep 2025 16:02:12 +0800
Message-ID: <20250908080220.698158-2-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250908080220.698158-1-fredchen.openbmc@gmail.com>
References: <20250908080220.698158-1-fredchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_010229_827947_9D1E6051 
X-CRM114-Status: GOOD (  11.35  )
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

add power monitor and temperature sensors for extension boards in bus 6,
8, 10 and 13.

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 .../aspeed-bmc-facebook-santabarbara.dts      | 824 ++++++++++++++++++
 1 file changed, 824 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
index ee93a971c500..2f5712e9ba9f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
@@ -39,6 +39,38 @@ aliases {
 		i2c37 = &i2c12mux0ch5;
 		i2c38 = &i2c12mux0ch6;
 		i2c39 = &i2c12mux0ch7;
+		i2c48 = &i2c6mux0ch0;
+		i2c49 = &i2c6mux0ch1;
+		i2c50 = &i2c6mux0ch2;
+		i2c51 = &i2c6mux0ch3;
+		i2c52 = &i2c8mux0ch0;
+		i2c53 = &i2c8mux0ch1;
+		i2c54 = &i2c8mux0ch2;
+		i2c55 = &i2c8mux0ch3;
+		i2c56 = &i2c10mux0ch0;
+		i2c57 = &i2c10mux0ch1;
+		i2c58 = &i2c10mux0ch2;
+		i2c59 = &i2c10mux0ch3;
+		i2c60 = &i2c13mux0ch0;
+		i2c61 = &i2c13mux0ch1;
+		i2c62 = &i2c13mux0ch2;
+		i2c63 = &i2c13mux0ch3;
+		i2c64 = &i2c6mux1ch0;
+		i2c65 = &i2c6mux1ch1;
+		i2c66 = &i2c6mux1ch2;
+		i2c67 = &i2c6mux1ch3;
+		i2c68 = &i2c8mux1ch0;
+		i2c69 = &i2c8mux1ch1;
+		i2c70 = &i2c8mux1ch2;
+		i2c71 = &i2c8mux1ch3;
+		i2c72 = &i2c10mux1ch0;
+		i2c73 = &i2c10mux1ch1;
+		i2c74 = &i2c10mux1ch2;
+		i2c75 = &i2c10mux1ch3;
+		i2c76 = &i2c13mux1ch0;
+		i2c77 = &i2c13mux1ch1;
+		i2c78 = &i2c13mux1ch2;
+		i2c79 = &i2c13mux1ch3;
 	};
 
 	chosen {
@@ -574,6 +606,204 @@ eeprom@52 {
 		compatible = "atmel,24c256";
 		reg = <0x52>;
 	};
+
+	i2c-mux@71 {
+		compatible = "nxp,pca9546";
+		reg = <0x71>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c6mux0ch0: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			temperature-sensor@64 {
+				compatible = "microchip,mcp9600";
+				reg = <0x64>;
+			};
+
+			temperature-sensor@65 {
+				compatible = "microchip,mcp9600";
+				reg = <0x65>;
+			};
+
+			temperature-sensor@67 {
+				compatible = "microchip,mcp9600";
+				reg = <0x67>;
+			};
+
+			i2c-mux@72 {
+				compatible = "nxp,pca9546";
+				reg = <0x72>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				i2c-mux-idle-disconnect;
+
+				i2c6mux1ch0: i2c@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+				i2c6mux1ch1: i2c@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					voltage-sensor@48 {
+						compatible = "ti,ads7830";
+						reg = <0x48>;
+					};
+
+					voltage-sensorr@49 {
+						compatible = "ti,ads7830";
+						reg = <0x49>;
+					};
+
+					temperature-sensor@4a {
+						compatible = "ti,tmp175";
+						reg = <0x4a>;
+					};
+
+					temperature-sensor@4b {
+						compatible = "ti,tmp175";
+						reg = <0x4b>;
+					};
+
+					eeprom@56 {
+						compatible = "atmel,24c256";
+						reg = <0x56>;
+					};
+				};
+				i2c6mux1ch2: i2c@2 {
+					reg = <2>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+				i2c6mux1ch3: i2c@3 {
+					reg = <3>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+		};
+		i2c6mux0ch1: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			potentiometer@2c {
+				compatible = "adi,ad5272-020";
+				reg = <0x2c>;
+			};
+
+			potentiometer@2e {
+				compatible = "adi,ad5272-020";
+				reg = <0x2e>;
+			};
+
+			potentiometer@2f {
+				compatible = "adi,ad5272-020";
+				reg = <0x2f>;
+			};
+
+			power-monitor@40 {
+				compatible = "ti,ina238";
+				reg = <0x40>;
+				shunt-resistor = <1000>;
+			};
+
+			power-monitor@44 {
+				compatible = "ti,ina238";
+				reg = <0x44>;
+				shunt-resistor = <1000>;
+			};
+
+			power-monitor@45 {
+				compatible = "ti,ina238";
+				reg = <0x45>;
+				shunt-resistor = <1000>;
+			};
+		};
+		i2c6mux0ch2: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			potentiometer@2c {
+				compatible = "adi,ad5272-020";
+				reg = <0x2c>;
+			};
+
+			potentiometer@2e {
+				compatible = "adi,ad5272-020";
+				reg = <0x2e>;
+			};
+
+			potentiometer@2f {
+				compatible = "adi,ad5272-020";
+				reg = <0x2f>;
+			};
+
+			power-monitor@40 {
+				compatible = "ti,ina238";
+				reg = <0x40>;
+				shunt-resistor = <1000>;
+			};
+
+			power-monitor@44 {
+				compatible = "ti,ina238";
+				reg = <0x44>;
+				shunt-resistor = <1000>;
+			};
+
+			power-monitor@45 {
+				compatible = "ti,ina238";
+				reg = <0x45>;
+				shunt-resistor = <1000>;
+			};
+		};
+		i2c6mux0ch3: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			voltage-sensor@1d {
+				compatible = "ti,adc128d818";
+				reg = <0x1d>;
+				ti,mode = /bits/ 8 <1>;
+			};
+
+			voltage-sensor@37 {
+				compatible = "ti,adc128d818";
+				reg = <0x37>;
+				ti,mode = /bits/ 8 <1>;
+			};
+
+			power-monitor@40 {
+				compatible = "ti,ina238";
+				reg = <0x40>;
+				shunt-resistor = <1000>;
+			};
+
+			power-monitor@45 {
+				compatible = "ti,ina238";
+				reg = <0x45>;
+				shunt-resistor = <1000>;
+			};
+
+			temperature-sensor@48 {
+				compatible = "ti,tmp175";
+				reg = <0x48>;
+			};
+
+			temperature-sensor@49 {
+				compatible = "ti,tmp175";
+				reg = <0x49>;
+			};
+		};
+	};
 };
 
 &i2c7 {
@@ -588,6 +818,204 @@ eeprom@52 {
 		compatible = "atmel,24c256";
 		reg = <0x52>;
 	};
+
+	i2c-mux@71 {
+		compatible = "nxp,pca9546";
+		reg = <0x71>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c8mux0ch0: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			temperature-sensor@64 {
+				compatible = "microchip,mcp9600";
+				reg = <0x64>;
+			};
+
+			temperature-sensor@65 {
+				compatible = "microchip,mcp9600";
+				reg = <0x65>;
+			};
+
+			temperature-sensor@67 {
+				compatible = "microchip,mcp9600";
+				reg = <0x67>;
+			};
+
+			i2c-mux@72 {
+				compatible = "nxp,pca9546";
+				reg = <0x72>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				i2c-mux-idle-disconnect;
+
+				i2c8mux1ch0: i2c@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+				i2c8mux1ch1: i2c@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					voltage-sensor@48 {
+						compatible = "ti,ads7830";
+						reg = <0x48>;
+					};
+
+					voltage-sensorr@49 {
+						compatible = "ti,ads7830";
+						reg = <0x49>;
+					};
+
+					temperature-sensor@4a {
+						compatible = "ti,tmp175";
+						reg = <0x4a>;
+					};
+
+					temperature-sensor@4b {
+						compatible = "ti,tmp175";
+						reg = <0x4b>;
+					};
+
+					eeprom@56 {
+						compatible = "atmel,24c256";
+						reg = <0x56>;
+					};
+				};
+				i2c8mux1ch2: i2c@2 {
+					reg = <2>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+				i2c8mux1ch3: i2c@3 {
+					reg = <3>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+		};
+		i2c8mux0ch1: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			potentiometer@2c {
+				compatible = "adi,ad5272-020";
+				reg = <0x2c>;
+			};
+
+			potentiometer@2e {
+				compatible = "adi,ad5272-020";
+				reg = <0x2e>;
+			};
+
+			potentiometer@2f {
+				compatible = "adi,ad5272-020";
+				reg = <0x2f>;
+			};
+
+			power-monitor@40 {
+				compatible = "ti,ina238";
+				reg = <0x40>;
+				shunt-resistor = <1000>;
+			};
+
+			power-monitor@44 {
+				compatible = "ti,ina238";
+				reg = <0x44>;
+				shunt-resistor = <1000>;
+			};
+
+			power-monitor@45 {
+				compatible = "ti,ina238";
+				reg = <0x45>;
+				shunt-resistor = <1000>;
+			};
+		};
+		i2c8mux0ch2: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			potentiometer@2c {
+				compatible = "adi,ad5272-020";
+				reg = <0x2c>;
+			};
+
+			potentiometer@2e {
+				compatible = "adi,ad5272-020";
+				reg = <0x2e>;
+			};
+
+			potentiometer@2f {
+				compatible = "adi,ad5272-020";
+				reg = <0x2f>;
+			};
+
+			power-monitor@40 {
+				compatible = "ti,ina238";
+				reg = <0x40>;
+				shunt-resistor = <1000>;
+			};
+
+			power-monitor@44 {
+				compatible = "ti,ina238";
+				reg = <0x44>;
+				shunt-resistor = <1000>;
+			};
+
+			power-monitor@45 {
+				compatible = "ti,ina238";
+				reg = <0x45>;
+				shunt-resistor = <1000>;
+			};
+		};
+		i2c8mux0ch3: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			voltage-sensor@1d {
+				compatible = "ti,adc128d818";
+				reg = <0x1d>;
+				ti,mode = /bits/ 8 <1>;
+			};
+
+			voltage-sensor@37 {
+				compatible = "ti,adc128d818";
+				reg = <0x37>;
+				ti,mode = /bits/ 8 <1>;
+			};
+
+			power-monitor@40 {
+				compatible = "ti,ina238";
+				reg = <0x40>;
+				shunt-resistor = <1000>;
+			};
+
+			power-monitor@45 {
+				compatible = "ti,ina238";
+				reg = <0x45>;
+				shunt-resistor = <1000>;
+			};
+
+			temperature-sensor@48 {
+				compatible = "ti,tmp175";
+				reg = <0x48>;
+			};
+
+			temperature-sensor@49 {
+				compatible = "ti,tmp175";
+				reg = <0x49>;
+			};
+		};
+	};
 };
 
 &i2c9 {
@@ -619,6 +1047,204 @@ eeprom@52 {
 		compatible = "atmel,24c256";
 		reg = <0x52>;
 	};
+
+	i2c-mux@71 {
+		compatible = "nxp,pca9546";
+		reg = <0x71>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c10mux0ch0: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			temperature-sensor@64 {
+				compatible = "microchip,mcp9600";
+				reg = <0x64>;
+			};
+
+			temperature-sensor@65 {
+				compatible = "microchip,mcp9600";
+				reg = <0x65>;
+			};
+
+			temperature-sensor@67 {
+				compatible = "microchip,mcp9600";
+				reg = <0x67>;
+			};
+
+			i2c-mux@72 {
+				compatible = "nxp,pca9546";
+				reg = <0x72>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				i2c-mux-idle-disconnect;
+
+				i2c10mux1ch0: i2c@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+				i2c10mux1ch1: i2c@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					voltage-sensor@48 {
+						compatible = "ti,ads7830";
+						reg = <0x48>;
+					};
+
+					voltage-sensorr@49 {
+						compatible = "ti,ads7830";
+						reg = <0x49>;
+					};
+
+					temperature-sensor@4a {
+						compatible = "ti,tmp175";
+						reg = <0x4a>;
+					};
+
+					temperature-sensor@4b {
+						compatible = "ti,tmp175";
+						reg = <0x4b>;
+					};
+
+					eeprom@56 {
+						compatible = "atmel,24c256";
+						reg = <0x56>;
+					};
+				};
+				i2c10mux1ch2: i2c@2 {
+					reg = <2>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+				i2c10mux1ch3: i2c@3 {
+					reg = <3>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+		};
+		i2c10mux0ch1: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			potentiometer@2c {
+				compatible = "adi,ad5272-020";
+				reg = <0x2c>;
+			};
+
+			potentiometer@2e {
+				compatible = "adi,ad5272-020";
+				reg = <0x2e>;
+			};
+
+			potentiometer@2f {
+				compatible = "adi,ad5272-020";
+				reg = <0x2f>;
+			};
+
+			power-monitor@40 {
+				compatible = "ti,ina238";
+				reg = <0x40>;
+				shunt-resistor = <1000>;
+			};
+
+			power-monitor@44 {
+				compatible = "ti,ina238";
+				reg = <0x44>;
+				shunt-resistor = <1000>;
+			};
+
+			power-monitor@45 {
+				compatible = "ti,ina238";
+				reg = <0x45>;
+				shunt-resistor = <1000>;
+			};
+		};
+		i2c10mux0ch2: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			potentiometer@2c {
+				compatible = "adi,ad5272-020";
+				reg = <0x2c>;
+			};
+
+			potentiometer@2e {
+				compatible = "adi,ad5272-020";
+				reg = <0x2e>;
+			};
+
+			potentiometer@2f {
+				compatible = "adi,ad5272-020";
+				reg = <0x2f>;
+			};
+
+			power-monitor@40 {
+				compatible = "ti,ina238";
+				reg = <0x40>;
+				shunt-resistor = <1000>;
+			};
+
+			power-monitor@44 {
+				compatible = "ti,ina238";
+				reg = <0x44>;
+				shunt-resistor = <1000>;
+			};
+
+			power-monitor@45 {
+				compatible = "ti,ina238";
+				reg = <0x45>;
+				shunt-resistor = <1000>;
+			};
+		};
+		i2c10mux0ch3: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			voltage-sensor@1d {
+				compatible = "ti,adc128d818";
+				reg = <0x1d>;
+				ti,mode = /bits/ 8 <1>;
+			};
+
+			voltage-sensor@37 {
+				compatible = "ti,adc128d818";
+				reg = <0x37>;
+				ti,mode = /bits/ 8 <1>;
+			};
+
+			power-monitor@40 {
+				compatible = "ti,ina238";
+				reg = <0x40>;
+				shunt-resistor = <1000>;
+			};
+
+			power-monitor@45 {
+				compatible = "ti,ina238";
+				reg = <0x45>;
+				shunt-resistor = <1000>;
+			};
+
+			temperature-sensor@48 {
+				compatible = "ti,tmp175";
+				reg = <0x48>;
+			};
+
+			temperature-sensor@49 {
+				compatible = "ti,tmp175";
+				reg = <0x49>;
+			};
+		};
+	};
 };
 
 &i2c11 {
@@ -748,6 +1374,204 @@ eeprom@52 {
 		compatible = "atmel,24c256";
 		reg = <0x52>;
 	};
+
+	i2c-mux@71 {
+		compatible = "nxp,pca9546";
+		reg = <0x71>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+
+		i2c13mux0ch0: i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			temperature-sensor@64 {
+				compatible = "microchip,mcp9600";
+				reg = <0x64>;
+			};
+
+			temperature-sensor@65 {
+				compatible = "microchip,mcp9600";
+				reg = <0x65>;
+			};
+
+			temperature-sensor@67 {
+				compatible = "microchip,mcp9600";
+				reg = <0x67>;
+			};
+
+			i2c-mux@72 {
+				compatible = "nxp,pca9546";
+				reg = <0x72>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				i2c-mux-idle-disconnect;
+
+				i2c13mux1ch0: i2c@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+				i2c13mux1ch1: i2c@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					voltage-sensor@48 {
+						compatible = "ti,ads7830";
+						reg = <0x48>;
+					};
+
+					voltage-sensorr@49 {
+						compatible = "ti,ads7830";
+						reg = <0x49>;
+					};
+
+					temperature-sensor@4a {
+						compatible = "ti,tmp175";
+						reg = <0x4a>;
+					};
+
+					temperature-sensor@4b {
+						compatible = "ti,tmp175";
+						reg = <0x4b>;
+					};
+
+					eeprom@56 {
+						compatible = "atmel,24c256";
+						reg = <0x56>;
+					};
+				};
+				i2c13mux1ch2: i2c@2 {
+					reg = <2>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+				i2c13mux1ch3: i2c@3 {
+					reg = <3>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+		};
+		i2c13mux0ch1: i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			potentiometer@2c {
+				compatible = "adi,ad5272-020";
+				reg = <0x2c>;
+			};
+
+			potentiometer@2e {
+				compatible = "adi,ad5272-020";
+				reg = <0x2e>;
+			};
+
+			potentiometer@2f {
+				compatible = "adi,ad5272-020";
+				reg = <0x2f>;
+			};
+
+			power-monitor@40 {
+				compatible = "ti,ina238";
+				reg = <0x40>;
+				shunt-resistor = <1000>;
+			};
+
+			power-monitor@44 {
+				compatible = "ti,ina238";
+				reg = <0x44>;
+				shunt-resistor = <1000>;
+			};
+
+			power-monitor@45 {
+				compatible = "ti,ina238";
+				reg = <0x45>;
+				shunt-resistor = <1000>;
+			};
+		};
+		i2c13mux0ch2: i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			potentiometer@2c {
+				compatible = "adi,ad5272-020";
+				reg = <0x2c>;
+			};
+
+			potentiometer@2e {
+				compatible = "adi,ad5272-020";
+				reg = <0x2e>;
+			};
+
+			potentiometer@2f {
+				compatible = "adi,ad5272-020";
+				reg = <0x2f>;
+			};
+
+			power-monitor@40 {
+				compatible = "ti,ina238";
+				reg = <0x40>;
+				shunt-resistor = <1000>;
+			};
+
+			power-monitor@44 {
+				compatible = "ti,ina238";
+				reg = <0x44>;
+				shunt-resistor = <1000>;
+			};
+
+			power-monitor@45 {
+				compatible = "ti,ina238";
+				reg = <0x45>;
+				shunt-resistor = <1000>;
+			};
+		};
+		i2c13mux0ch3: i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			voltage-sensor@1d {
+				compatible = "ti,adc128d818";
+				reg = <0x1d>;
+				ti,mode = /bits/ 8 <1>;
+			};
+
+			voltage-sensor@37 {
+				compatible = "ti,adc128d818";
+				reg = <0x37>;
+				ti,mode = /bits/ 8 <1>;
+			};
+
+			power-monitor@40 {
+				compatible = "ti,ina238";
+				reg = <0x40>;
+				shunt-resistor = <1000>;
+			};
+
+			power-monitor@45 {
+				compatible = "ti,ina238";
+				reg = <0x45>;
+				shunt-resistor = <1000>;
+			};
+
+			temperature-sensor@48 {
+				compatible = "ti,tmp175";
+				reg = <0x48>;
+			};
+
+			temperature-sensor@49 {
+				compatible = "ti,tmp175";
+				reg = <0x49>;
+			};
+		};
+	};
 };
 
 &i2c14 {
-- 
2.49.0


