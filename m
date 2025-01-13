Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990E0E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 06:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UXMYkhj5IZ9Mb+wHyrW48mIfsHQ1A9AFKPYuWPrAkpY=; b=l1ekjfVfvxUQWafvBARdnM0I3O
	0ux3Q8oGZlLLw4KddUeUKlmMJ1TGf7rC2MII+WwY7KNtMWZBRdj8agOF0Cp2dUtqALVW0Ux9JgWIP
	XW2Vba5N9V2PYlpf/Q/G5ZNx3w7vs6RpfWFk++7pJ4D6wfusS/qiyIJIMPLlQj7Y9KJgAcV0KKXKS
	NMLu+iJgbOoCibWLkFGrxAQtGeuzNAgKe6t7ZvknMuMc6zdoi5VUlEu9oAvvPUk0vogGBFRLM1oQM
	AF+yGkZPEEpkZLQregxkcmz4+OhkVo6pYOGtVldPY2WjrfS8wQJeQc9PIQfQpn5hvq5PKyvej6DFy
	wNTxbu1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXDo2-000000047SR-2AC2;
	Mon, 13 Jan 2025 06:20:10 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXDmm-000000047Ff-3fSE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 06:18:54 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21619108a6bso65214435ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jan 2025 22:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736749131; x=1737353931; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UXMYkhj5IZ9Mb+wHyrW48mIfsHQ1A9AFKPYuWPrAkpY=;
        b=a1wR1+86kJlINGWYiloSh1s3LKJHHczsOXs37WdQ0tSRrON59qKGuCXafJm7aBylHc
         3EDS0ZSLnIUDwJOpL0jLd+5D6OtqalZvpWwNkjsG2Cy2YHmIDjfaqfYIxigUu9/OQ9SG
         6tQmXUIu1zCxFngItuBmzJ2TKLFW9tETezOWK+v7Nro38qTJS8XEemtZExbdR1XV/2WI
         M04553JaISsxKzVEKlWQhss1vazgrldd3YpgkVdM8YGZoVQbvWYBvxzz6N9CYV1HWL/y
         ofkIEL8sZ6Y2SodvO+ERzbTrsQw/JCblxXqRKnRxntVj3GSFIX2AEeHQkgPE27v2sb40
         zKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736749131; x=1737353931;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UXMYkhj5IZ9Mb+wHyrW48mIfsHQ1A9AFKPYuWPrAkpY=;
        b=LH680is3Ql7KUyPJJt9iXe2XX7mnJhAaijlP+/3JG5bstVs0gnSDBzT9BuNvJWSsy2
         IrD4KP9WV/m9sfk1iiibewsa6Z93Rlc5oQ5wng5XvyfoitRXkQnpzr3v3amH5ZAvDBen
         cdqzHabpTG2Iakuzaja3mJtQDO5jhQU3fQdB62tTwM9ELOYBc74aIXt/Z7F46BLRHznM
         faP6/QP+J3kqk97gV0cIMLAP1tcEXIUMO2Bfutjdh4Ol+RMrGlgTCsPOrJMmPMhgbhNS
         si+ciDBXMDjutXu6yzWd0/RjkeVqTx2X0278Q7tdOfqkH5Z7nrQIlWShuWRAFWoEp0FX
         gMKA==
X-Forwarded-Encrypted: i=1; AJvYcCWh6/3RXrMrYBKqDBg1fwmY6/W13+0+2/ZDPVbDz1UikL2AK3KcbsruPxi5BuCYyuhlbhe2DsSvSSrgxvLcE4FG@lists.infradead.org
X-Gm-Message-State: AOJu0YyDyRJqgwkFNgOM2ixv82xxHeYTNAZ2uwPw4I4U9cgcxehz2I7Z
	jC5iwkqITsTl3WbdjSg5qCMzabqLGviEBz/2FaLGbnAGvjAnJLKakekYWQ==
X-Gm-Gg: ASbGncs7oTI/lOiF5asQBaTfXdm3VqyHRc80Ol8qZhxhmo0vgc3Mf3+4El1UZtS/6xN
	VGjq3fsL6MBJxijqv+59pkS/3aCDS9YrCEGCRBjokgLcZV5sbnBQQqVdKKQTb00XJSA7r0P1wcw
	+EqBhmUBukXyaA/bawAfEWF2lsAFq9ggbtmMhrJigs4bnVwOvbS+ClSqswFXGo8gQPQoIEFx+wk
	YNkzndj/b5TDGp6jLsLHUuxi4zZoHKE/tA455V59hbB6Jfiv4bj5ZNkptxDBu0f5vnwO8TGGnnZ
	GlmhunKeO0hv44ydV2/PXywFPjGtb7Wu3A==
X-Google-Smtp-Source: AGHT+IFigaJwgK7Z0NX1dvC/nKexlb3PogVsWIi3IglxLkUsghZrWcqjcsFlHJl2DP1Q0iXvPWIhFg==
X-Received: by 2002:a05:6a20:6a25:b0:1e7:6f82:321f with SMTP id adf61e73a8af0-1e88d10749amr27730415637.17.1736749131204;
        Sun, 12 Jan 2025 22:18:51 -0800 (PST)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a318e8ecacfsm6279705a12.38.2025.01.12.22.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 22:18:50 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Mon, 13 Jan 2025 14:16:23 +0800
Subject: [PATCH v2] ARM: dts: aspeed: catalina: Update DTS to support
 multiple PDB board sources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-potin-catalina-dts-update-20250102-v2-1-1725117fe7a9@gmail.com>
X-B4-Tracking: v=1; b=H4sIALavhGcC/42Nyw6CMBBFf4V07Zi2PBRX/odhMX0Ik0BL2ko0h
 H+3kuja5bm5OWdl0QaykV2KlQW7UCTvMshDwfSArrdAJjOTXNZccAmzT+RAY8KRHIJJER6zwWT
 hd2lFpXiDlTIKWRbNwd7puUduXeaBYvLhtTcX8Vm/+vIf/SJAgOLqhLUsdducr/2ENB61n1i3b
 dsbWGRFVdQAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736749128; l=6860;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=+9P1SAFUTyPeHDsem7TQlwq42JcEr9R7g9tjaiPQiIs=;
 b=q7cGmq9jtHu+sNoOLc89cs/9abzrthQEj0V4PmdvhAoWoyNT0lNHWSLu3QYfxAkuzcEU+acMA
 7Tg1EZrRPQwBE6NOoGguYQPQg0a5TPmzZ+TijEtlbwyFcTemAXAhs20
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_221852_934770_4025E2E8 
X-CRM114-Status: GOOD (  13.60  )
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

This patch updates the Catalina device tree to support different sources
of PDB boards.

Changes for Main source PDB board
- Thermal Sensor Monitoring:
  - Added IOB NIC nodes (TMP421) for thermal sensor monitoring.
  - Added FIO remote thermal node (TMP75) for thermal sensor monitoring.
- Fan Monitoring and Control:
  - Add fan p12V power sensor node (MP5990) for sensor monitoring.
  - Add fan controllers (MAX31790) for fan control and tach monitoring.

Changes for 2nd source PDB board
- Fan Monitoring and Control:
  - Added 2nd source fan controllers (NCT7363) for fan duty control and
    tach monitoring.
- Power Monitoring:
  - Added 2nd source HSC nodes (XDP710) for power sensor monitoring.
- Address Conflicts:
  - Removed all ina238 nodes due to address conflicts. Moved the driver
    probe for ina238 to userspace.

Changes for PDB brick board
- Power Monitoring:
  - Add delta brick nodes for power sensor monitoring.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Updating the Catalina DTS to support multiple PDB board sources.
---
Changes in v2:
- Add delta_brick nodes to support PDB brick board
- Link to v1: https://lore.kernel.org/r/20250103-potin-catalina-dts-update-20250102-v1-1-b0b7a523c968@gmail.com
---
 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 170 ++++++++++++++++++---
 1 file changed, 147 insertions(+), 23 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index 3822bb3c9243..49230e6a749e 100644
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
@@ -464,51 +488,145 @@ i2c1mux0ch0: i2c@0 {
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
 			#size-cells = <0>;
 			reg = <0x3>;
+
+			delta_brick@63 {
+				compatible = "pmbus";
+				reg = <0x63>;
+			};
+			delta_brick@64 {
+				compatible = "pmbus";
+				reg = <0x64>;
+			};
+			delta_brick@65 {
+				compatible = "pmbus";
+				reg = <0x65>;
+			};
+			delta_brick@66 {
+				compatible = "pmbus";
+				reg = <0x66>;
+			};
+			delta_brick@67 {
+				compatible = "pmbus";
+				reg = <0x67>;
+			};
 		};
 		i2c1mux0ch4: i2c@4 {
 			#address-cells = <1>;
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
@@ -580,6 +698,12 @@ temperature-sensor@4b {
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


