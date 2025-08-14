Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36E6CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 14:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ybe/vNHybbFFD9CumA+Ao11VG7Qh745VMU9T9J4X9OI=; b=CnaAS2cs7sRTJaamU9DDz5RgDg
	FPVAqG9m7sUmG3y/A61xFF1rc2RbIYomyEMMnbgWndhgFqbc4oZQiiPGiEorIFpipLOf2+c/rESQ/
	TtUXOUOVo+EXxnTvJNgmP32dAp0TOXBzkORis990Alh7dMeLoIVGiyNEgOe4V6QbQ+1qhn2nIr4CB
	LA3WV6FgA4JazBLKYwfGezB/IaDTaD+jDWV0GBZlH5Sj13cMt4mnP6M5E7EkxFxObNEatwCMPSNBX
	vw69C2k6lSx9MURUtBoNk0iGDkm9mK2+od+UGZNep0mi6GjlNYf9gVM0H+WkuzBprklTlhDmi0X7m
	qYnAjFTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYWf-0000000H9Ae-0i5w;
	Thu, 14 Aug 2025 14:01:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXpa-0000000H1NF-1lmN
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 Aug 2025 13:17:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=Ybe/vNHybbFFD9CumA+Ao11VG7Qh745VMU9T9J4X9OI=; b=dChaOnhaxBPedpaSBblm/Uw5GK
	+9uZymE6vv3Kjh5bIiTLgESvgMTBYR5JCj7J5lptpaJrKheb9zqZ5lfG2KiMBy7vur9PacpUqtmNr
	oUL6u1HQnUf2AFsVr6G/H3jGupRxF4jF77dGmQVtPezMj6NqLAJRmE/ubaXPYOcUF6/lB4wBCWIcw
	rZ7xLt2lxmyQ+//I+xmOYYwhxqZRyI3SK417s4veXaOnqEYdJLyONojUDasUTidRPtc4MSGAlZ2RJ
	37bz86kt69ukIUgIA9v1ct1tF3MQruYl2hUxQCXxUGj75cNwkSJqjOn00npPqR5mjAMSD6pgTyY9D
	twV4rWTw==;
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXpV-0000000GOCQ-2uNv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 13:17:21 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-24456ce0b96so11158655ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 06:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755177435; x=1755782235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ybe/vNHybbFFD9CumA+Ao11VG7Qh745VMU9T9J4X9OI=;
        b=nsaM8KWMhx9kbinglPKhGNnOWM43FNt2O0fleruCeDBnRxyO4tkCpLi4uegoHJVIX3
         9rfcPdKzjjub7nGnmfOte2aR84t0NOSupTSF/oVX24yYpZf59e1iXr0oblHg/b3e2gMQ
         M5vbTOLBiCDck9PtWMEqqQKNuwrCekaeCGi99FuOFGTc9+87eShfoaMa3gEu5RsZYhEe
         BEPzNV5zkGQMq2PbWN3VbY/tjxScr5oCTbgp38LhtFzBqkNvAYnaJG+VYrYcdURoQ07i
         uMSioaYdRQyBT9eXlDenh/QjwIVivZdteS1L6nIBhVqaiCmuDx44t71SPQHri7iPQ027
         Wziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755177435; x=1755782235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ybe/vNHybbFFD9CumA+Ao11VG7Qh745VMU9T9J4X9OI=;
        b=iggqk2dxZWKrzynBuhP8y7dXJK4W2SRZ370uC10d1ueilvtdnRyQmBhQhI67QzFvJ5
         VZA52lOcETrFxi8OOohMRXt1U0agp32027U9ahWlQPo+1RVhORrzmAcBmKAFSjdPFaSD
         qz96ZXQoWCYvgOOL4Gmk9tPvPSyXzO1nSaBvquCicCFGlkQ51Rx6dTkiUB0U4OP2VoOh
         B2BwzMISybJ9C0yIPMj+W+7D+QG+9BDFQLNRosjJNimKXMur4iNIGBLOlnMvVkqGhqof
         fM7ADeF6eh7/f6BRqi6sJ/jNNPUzwQIKutZAvBhNqWg7h/YOgsdcbnVi1Wmp4EKnbrpT
         mOGw==
X-Forwarded-Encrypted: i=1; AJvYcCU1NTYMPme1yw1xwtimm5Q5rvmdkwV5q6Va4o2m0MvWDUBbvCjSv/wthYuRnb2cmXOebb0oMKXVSXNUk4jdbhaz@lists.infradead.org
X-Gm-Message-State: AOJu0YyZqoFltN+GCCyGnGmiht4GuWDRxEysb0MCcu9mKo4bR6pCk8A8
	Dfg9amYZQhqrIvqaMgfXrL25kGBgwfwe4oAom1E/OSwJusRZYqcw5cJ3ehdhTA==
X-Gm-Gg: ASbGncvS1uCFWnC78OILVQ2v2A8wURyQ5a1skrfB8q3a/ccovtmNAhLyomWG6k9XAMi
	V/5BBUkszFFgrI3zA0SGs1klkR/rZccroHHFR4alxBpJBTGPtG29vpHN7dbpXGTwzpDKI3ST+9F
	k89z8HLpl8XLItTj7nX2p8uJGV3z0jPQiyDRKH4H8IY+oBI2vOyNawH+yqQXDANvgfLU36DmZXR
	L9GV9wucXcs08v3mtuefQMpLFsMTQLPqYVRt7m1Q3ubC+hAaTdyC/3NuAQFRa48p6ov+gkWv192
	V144yAsCrrAyEIobwBIwS+Vh2Z808lJ1DFDxeTON9suEVhkHVD5p/xX9lsT115lYilhgZ2EBPfP
	EibbcvQn6KiEbMRUS4XYu98Blh4ua1qioTswbG1Z9wOcIjUppmGpCAMyZkh8gCXH3bHolnxhHzm
	tTWuaWsdPXHVM=
X-Google-Smtp-Source: AGHT+IEQQsV6uAs+qEZ1rI54B0Jz3RIrSLU0frIByCGnUIb6syaad4gGYwxQMGVxt9DZxn+QFHZiOw==
X-Received: by 2002:a17:903:3510:b0:240:b3b3:872a with SMTP id d9443c01a7336-2445c152d45mr32541395ad.6.1755177434246;
        Thu, 14 Aug 2025 06:17:14 -0700 (PDT)
Received: from fred-System-Product-Name.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24218d8413asm335652995ad.63.2025.08.14.06.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 06:17:13 -0700 (PDT)
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
Subject: [PATCH v2 1/4] ARM: dts: aspeed: santabarbara: add sensor support for extension boards
Date: Thu, 14 Aug 2025 21:16:57 +0800
Message-ID: <20250814131706.1567067-2-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814131706.1567067-1-fredchen.openbmc@gmail.com>
References: <20250814131706.1567067-1-fredchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_141717_871932_DB9AAB6A 
X-CRM114-Status: GOOD (  10.76  )
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


