Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D26E77197
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 01:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k2Cl0qLA6Zse6X1mOHGAIPpGxF7+VgglAz9fd0zm31c=; b=oZhb2OXGNJy2x9HLIf4F1voqbf
	OYns9HIpaK6q4xfNvqmJe6f515SLaPq7aOu0W6Y4Mx6LwjtYqdaGIAG2o8/gSmei+ClSk9UjvZxbe
	S91QB5NjgDTY1b0w/hgmTyn43VhNSeOaaCIOzyExCP9QL9vteYZzNOk4kmqZHcgpMTf2eB/djh+/8
	o+PKIlxhY1mMryVBkxJi9LqXPodBGyhpuVm33lN7eN9ncSa4WpbP2dR29yEMjN9HU95hR0sJoOFXl
	Ne9E8sQq0gfrAjSuC1zfborCEzMstzz7xkRsjqX0glPTXBAEAbHRWu3u+IqmmYIs8KPDZZFfd31NY
	OPhidExw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTWlI-0000000BrEg-2eDF;
	Fri, 03 Jan 2025 01:46:04 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTWk6-0000000Br6H-0Uig
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 01:44:51 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2eec9b3a1bbso12914486a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 17:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735868688; x=1736473488; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k2Cl0qLA6Zse6X1mOHGAIPpGxF7+VgglAz9fd0zm31c=;
        b=Zt8cFfpegGSU4HN9SlHGlU5rEqOrNBa3mj2mpSNqhHwSq0v4Tdzbdg0qalU6DwIVgy
         hWmBbGeqMPS6hjqPHqY/o7GddKkTlnXjdWD4IbZ30N0zY9asLHqUODi7uDwHsiO3iMMQ
         VQ4F76fWH8C2lSR0WvFVr5sjnbdvKRAziGkr0Ye3n8CPr2Rw7fW9m57u+bcoC5hhdFDq
         fabkfM/FbHQeVi2L0rQMLuYlDCZ10+dw72HylCSy2S5lvPv+ba9DvuB+eAMJx4YfvX2y
         glhji52wikwrQEg7aI9d55iirZ6zUXyeJQWTjX46QMG2ObPeqbU/BCCgT/fK4KgkIgh8
         fMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735868688; x=1736473488;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k2Cl0qLA6Zse6X1mOHGAIPpGxF7+VgglAz9fd0zm31c=;
        b=LD+fUhqTvR979C58oE1Ewlegp09he/ZHsFONmJ+iJv4ZtyjHoxIS8qbCFoqztcwSCj
         rDhl6RScXBk6rIEbfNx49e5p6z2hvAgvI2fYu9BCsnmqX3NSLuNoTLk5hUCCHr+CDJDU
         9cQMhQ8oHiEVVv4mGp2UC9yMFd8xSoG+2awWbY/ug2bGxzH0+WrPIo1jK9g5+JRW76Ij
         z6TSiGUR7fItonMVQ8XAzCgqcox9lYBbY54a15Kdz1ioAxpudGikS4xinITq5VuLolsm
         nxPfnhp9i92/q1XOQQs8jTB/BBGbYuSq5eGd/VJIjs0q9IMrKC1a7jxiVaZAbQQSGbCb
         KLsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf0C6fGWV8bTqny30dxB5CVZfZJJnyE6ox0naUFBYtpNG/SYngJUpc5M/e22ZzbcREjDQPf6+5Dh6mmp8zvawB@lists.infradead.org
X-Gm-Message-State: AOJu0YzMKaLSNDs1DDXFNDxmeHs/8L6NqNTLcmEGz6PjHT/jrCpJneb3
	nwgmnUyHA/lSNZXIcj69QoTG6jqruNV5vCG7bN55pOHXZyyLyvUM
X-Gm-Gg: ASbGncuR038G1U539s+U+Plvk+ckS5ZQhQJ78gbvgSqdSpYeIQXn83sNfFmbProPMaF
	tewHmYPyujNxSpqCNimDdp4Qn9WEXwTclpdOmHoiy+kIcgJQ+nBdUeFl98Qz3PpdFjUvlqmh2na
	z/YY4Un4feOheBDJpIrDcIjwRRmfeYRp1dmjgXIT9uOfEI9pGc7KyYOm6ierpp3EOGhi1XGIqwn
	SqC/OYr2WvQ9q5pvVyVFa8ZjqHYnquXHosHWF5dttCBNxnrmfFis+00SZgy6qo1TyRsC/7DcrWF
	VfKuYKFNmcVVw2rOE6Ur835nC7/wKUhLGQ==
X-Google-Smtp-Source: AGHT+IE+4fM40xvU28AzvOJIq0548U2gC/Q8aDCSFhqHoK9P+D4GoUQlU1aKGPee55+jqzqjHIgWuQ==
X-Received: by 2002:a17:90b:5244:b0:2ee:f440:53ed with SMTP id 98e67ed59e1d1-2f452ed6a0dmr61484494a91.31.1735868688516;
        Thu, 02 Jan 2025 17:44:48 -0800 (PST)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca02f8asm234551495ad.279.2025.01.02.17.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 17:44:48 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Fri, 03 Jan 2025 09:42:31 +0800
Subject: [PATCH] ARM: dts: aspeed: catalina: update catalina dts file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-potin-catalina-dts-update-20250102-v1-1-b0b7a523c968@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIZAd2cC/z2NQQrDIBAAvxL23AUVW0i+EnJY47ZZCCpqQyH49
 0oOOQ4MMycUzsIFpuGEzIcUiaGDfgywbhQ+jOI7g1HmqbQymGKVgCtV2iUQ+lrwmzxVxlsZtXX
 qRdZ5R9BDKfNbftdkXlr7A1Frn790AAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735868686; l=5772;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=EWxIpZVzkObHrj3L3XnSjp1bXarY9ieZwL9MOGdfNcQ=;
 b=xLRs8zCBojbAOqgKdmTqa8vcJFMyCMitfwkdSmBkpFbK3jD0OBzbcb/9meKzqok8jfEm2f9Wa
 ILsB5P38XJWAMc9AP5VGhAC2QxyTvQ5tYWHwFeC/7JfPlT0FD4DTMHG
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_174450_166615_56633F97 
X-CRM114-Status: GOOD (  10.92  )
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

Update device nodes list below for driver binding.

- Add IOB NIC thermal nodes (TMP421)
  - 24-001f, 26-001f, 36-001f, 38-001f
- Add FIO Remote thermal node (TMP75)
  - 23-001f
- Add Power sensor node (MP5990)
  - 16-0022
- Add main source fan controllers (MAX31790)
  - 18-0021, 18-0027
- Add 2nd source fan controllers (NCT7363)
  - 18-0001, 18-0002
- Add 2nd source HSC nodes (XDP710)
  - 20-0013, 20-001c
- Remove all ina238 nodes, move to userspace
  - 16-0041, 16-0042, 16-0044, 17-0041, 17-0043

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Updating the catalina system device nodes in dts file.
---
 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 149 +++++++++++++++++----
 1 file changed, 126 insertions(+), 23 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index 3822bb3c9243..23583665ba12 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -190,6 +190,12 @@ i2c0mux0ch0: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+
+			// IOB0 NIC0 TEMP
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
 		};
 		i2c0mux0ch1: i2c@1 {
 			#address-cells = <1>;
@@ -200,6 +206,12 @@ i2c0mux0ch2: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
+
+			// IOB0 NIC1 TEMP
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
 		};
 		i2c0mux0ch3: i2c@3 {
 			#address-cells = <1>;
@@ -361,6 +373,12 @@ i2c0mux3ch0: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+
+			// IOB1 NIC0 TEMP
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
 		};
 		i2c0mux3ch1: i2c@1 {
 			#address-cells = <1>;
@@ -371,6 +389,12 @@ i2c0mux3ch2: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
+
+			// IOB1 NIC1 TEMP
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
 		};
 		i2c0mux3ch3: i2c@3 {
 			#address-cells = <1>;
@@ -464,40 +488,105 @@ i2c1mux0ch0: i2c@0 {
 			#size-cells = <0>;
 			reg = <0x0>;
 
-			power-sensor@41 {
-				compatible = "ti,ina238";
-				reg = <0x41>;
-				shunt-resistor = <500>;
-			};
-			power-sensor@42 {
-				compatible = "ti,ina238";
-				reg = <0x42>;
-				shunt-resistor = <500>;
-			};
-			power-sensor@44 {
-				compatible = "ti,ina238";
-				reg = <0x44>;
-				shunt-resistor = <500>;
+			power-sensor@22 {
+				compatible = "mps,mp5990";
+				reg = <0x22>;
 			};
 		};
 		i2c1mux0ch1: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0x1>;
-
-			power-sensor@41 {
-				compatible = "ti,ina238";
-				reg = <0x41>;
-			};
-			power-sensor@43 {
-				compatible = "ti,ina238";
-				reg = <0x43>;
-			};
 		};
 		i2c1mux0ch2: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0x2>;
+
+			hwmon0: hwmon@1 {
+				compatible = "nuvoton,nct7363";
+				reg = <0x01>;
+				#pwm-cells = <2>;
+
+				fan-9 {
+					pwms = <&hwmon0 0 40000>;
+					tach-ch = /bits/ 8 <0x09>;
+				};
+				fan-11 {
+					pwms = <&hwmon0 0 40000>;
+					tach-ch = /bits/ 8 <0x0b>;
+				};
+				fan-10 {
+					pwms = <&hwmon0 4 40000>;
+					tach-ch = /bits/ 8 <0x0a>;
+				};
+				fan-13 {
+					pwms = <&hwmon0 4 40000>;
+					tach-ch = /bits/ 8 <0x0d>;
+				};
+				fan-15 {
+					pwms = <&hwmon0 6 40000>;
+					tach-ch = /bits/ 8 <0x0f>;
+				};
+				fan-1 {
+					pwms = <&hwmon0 6 40000>;
+					tach-ch = /bits/ 8 <0x01>;
+				};
+				fan-0 {
+					pwms = <&hwmon0 10 40000>;
+					tach-ch = /bits/ 8 <0x00>;
+				};
+				fan-3 {
+					pwms = <&hwmon0 10 40000>;
+					tach-ch = /bits/ 8 <0x03>;
+				};
+			};
+			hwmon1: hwmon@2 {
+				compatible = "nuvoton,nct7363";
+				reg = <0x02>;
+				#pwm-cells = <2>;
+
+				fan-9 {
+					pwms = <&hwmon1 0 40000>;
+					tach-ch = /bits/ 8 <0x09>;
+				};
+				fan-11 {
+					pwms = <&hwmon1 0 40000>;
+					tach-ch = /bits/ 8 <0x0b>;
+				};
+				fan-10 {
+					pwms = <&hwmon1 4 40000>;
+					tach-ch = /bits/ 8 <0x0a>;
+				};
+				fan-13 {
+					pwms = <&hwmon1 4 40000>;
+					tach-ch = /bits/ 8 <0x0d>;
+				};
+				fan-15 {
+					pwms = <&hwmon1 6 40000>;
+					tach-ch = /bits/ 8 <0x0f>;
+				};
+				fan-1 {
+					pwms = <&hwmon1 6 40000>;
+					tach-ch = /bits/ 8 <0x01>;
+				};
+				fan-0 {
+					pwms = <&hwmon1 10 40000>;
+					tach-ch = /bits/ 8 <0x00>;
+				};
+				fan-3 {
+					pwms = <&hwmon1 10 40000>;
+					tach-ch = /bits/ 8 <0x03>;
+				};
+			};
+			pwm@21{
+				compatible = "maxim,max31790";
+				reg = <0x21>;
+			};
+			pwm@27{
+				compatible = "maxim,max31790";
+				reg = <0x27>;
+			};
 		};
 		i2c1mux0ch3: i2c@3 {
 			#address-cells = <1>;
@@ -509,6 +598,14 @@ i2c1mux0ch4: i2c@4 {
 			#size-cells = <0>;
 			reg = <0x4>;
 
+			power-monitor@13 {
+				compatible = "infineon,xdp710";
+				reg = <0x13>;
+			};
+			power-monitor@1c {
+				compatible = "infineon,xdp710";
+				reg = <0x1c>;
+			};
 			power-monitor@42 {
 				compatible = "lltc,ltc4287";
 				reg = <0x42>;
@@ -580,6 +677,12 @@ temperature-sensor@4b {
 				compatible = "ti,tmp75";
 				reg = <0x4b>;
 			};
+
+			// FIO REMOTE TEMP SENSOR
+			temperature-sensor@4f {
+				compatible = "ti,tmp75";
+				reg = <0x4f>;
+			};
 		};
 	};
 };

---
base-commit: becaccc292bfbd12df81148746043c5221e49da8
change-id: 20250102-potin-catalina-dts-update-20250102-914b06a4bdba

Best regards,
-- 
Potin Lai <potin.lai.pt@gmail.com>


