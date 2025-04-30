Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD8FC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 07:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QtDdKSd6hN5lH6sDk00ZJYQhob5LTcjf68AShtqVBV8=; b=pzuCpdvz8GIJsNaJW1rCZxKUMD
	Y5SLHuw8NgXbnN7ZCab/OFoXHGx4BpjFTH27gOlEZipupEYa9R81yj0VE78vejDEnw+eAqRoGOK9h
	EI4Ji37XxToeh3bFyRSoAx1X2/9v/VQTQWEeGru3LS59zPIjV3Zl5eyL5FaCehnKsYj0URLP7J1Ch
	43dGPLEVj0pNXFUyG9lXeyQ8yjawEeGai7ZH6ZXwP4PS0kiStmG0VuyAF0mxglGq06bZSKXWVbsbF
	sFoF3bSsiIDSW0i2Dr5lfi8Uuk8O8BzwbPUuJ9K0QY19ySx2+Tkm1lD1fpv/Ns81ljv11AWo6a/aZ
	C77RkxLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1gu-0000000Bxiw-1c8i;
	Wed, 30 Apr 2025 07:17:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1XR-0000000BwT2-3CtA
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Apr 2025 07:07:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=QtDdKSd6hN5lH6sDk00ZJYQhob5LTcjf68AShtqVBV8=; b=DMPuEmK6HvpWEdrCuZ8/qmNhpe
	DHHPtIfvMYikfpuyFBADKo0maxQrOrhupwA6yZFlf6EdZy3Arnl1CyePu28JEbkkchB4VNNVWKQZy
	P8LkN6GSVctg/nm+H0lGBK0i871UuhKEua3/8X1IGfuuY2YNcVM0R0WrMpm4kxHZN6OhUqCzMvwEw
	9CHFxwi/SHIiFD6notFHXPnrg0xWsb/grTRyCm4epW2ReAdC0bbCbG0CSIxD9OXLAsATiVn5kQPYG
	SfGFq1XElN7sbDJems19TDZIYHvfjpe8v1BRwa921uCAv+zzsDSv2KXedB6ajxi5boIUco0pFLLoq
	uCNIXIYg==;
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uA1XM-0000000DiO4-482w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 07:07:23 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5f6fb95f431so1195024a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 00:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745996838; x=1746601638; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QtDdKSd6hN5lH6sDk00ZJYQhob5LTcjf68AShtqVBV8=;
        b=IBWpdv+2yl0dEYvHL50zvDpY3oQiIXR6gTUxOIJCvf/ot6qPXDR53NO5iqhR/rupr9
         ufYl641d/SfwK2l0hBHVDtnCM9UxuQzIbeikpqxsmgE1EGRnF5ysPBOaw1RoWLXGgfXD
         nhLmixI+/5RldlHFJ+TH/ya64OVLm+C7TyrFuCnUQIk3RwM1UEhUdcMiNY5k+eVj4xxU
         RVm12kpi3fqB2RXlS0+iuxmfGvSEgwLnVytYbPw86u9l1EYUFLFf+xD1sT6BkK9Ls1cT
         C2SCaQvonalot++uToF3plHh5RdsRL123OOawTRM/xLWeFXM/en0V4PXWUs8ZDw9onPl
         QQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745996838; x=1746601638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QtDdKSd6hN5lH6sDk00ZJYQhob5LTcjf68AShtqVBV8=;
        b=DngSqd/4cIJnyTosvu3iNKh1ZBP2qhaaHdpKjeHDfd5fk8GEFBEAuZEenKozT/PAeE
         wfZsZTpj52EiEDtn5+FhVLqL3eQv0JRF0SWKm4WrgGIIRmiWdNAywtET43fn7jzyGrKN
         JZT35qtQw/XVhxymUx1vZ4VIT49M7G/S925FNl68UnthWvTeeD5vUnCMI/YJJLBbEeJN
         h+/3NiNTkSudXyT05OyCAJKYE5E6FDQfr3tMSC3fDPsnUM5O5IXyZmNkZsbGViOUqkDF
         KcQsXSsXiVR1IqGlJ2KgYSPb5+rkrUkUS+dzM1gl78zsDDYt90XkTf4tKmkTvfQiBRCV
         +wNg==
X-Forwarded-Encrypted: i=1; AJvYcCUet6upugYhBZr1fRMQkPS3ecQtq46EMV4c6h0lcCJ6apkEwD42CyaCq4DM/HmN6U8x/tj15tVMR4dMC0MxHk2S@lists.infradead.org
X-Gm-Message-State: AOJu0YzmWmGVaucj9hyCPs4ZckYgVeS4G9fUEay04wXiDV3hLb7uTksX
	/RTzn/bdf8qt+tVpWzLMH2HMaSXjy2fQFSc2v6GN3jAzNjNDo57MakdOfg==
X-Gm-Gg: ASbGnctaui0pKFkJzSi/CyAvpLtWWMKZ+qN2R+WNqQL2h8kgcRqqwa9eojqrclF11wH
	3WzhsXf4Jo3OOlcLh69FMywgT4sfYGP6oMjx/rlLcStkTwV7Fvb/Vy/lPzO6DxcMjRhyjB9aksA
	q1H1rEjHfZhGEJAUnqAUwkA8Rs4BxgS/xQB1EoDB58tmBI6erszq1SebNDEJKTLdrZ8uleb/Aw8
	SafoseZwtLhgNibwZqEqsbFCdKS+fnW0d3DSRxhNnrL8FhOrtnZ5I+a++tT83q0ZFXl/4FY/5Ex
	BOyXAcXwB1Z4UfzVsPidrJR5OnhaUXeI1kLIqGbG5Xvtj1rfNcSQDkZhvyqs+s9rfxeudJV78yQ
	lq6IvZHk1frI=
X-Google-Smtp-Source: AGHT+IGLsEQ2XB9GY0oZX93R83Gm/kDCuM0Gfi+QTVfEqedLRsCSzqXsS1050oalSdYUuJ19J55ccg==
X-Received: by 2002:a05:6402:51d2:b0:5e4:d52b:78a2 with SMTP id 4fb4d7f45d1cf-5f89fe7004amr1565048a12.15.1745996838003;
        Wed, 30 Apr 2025 00:07:18 -0700 (PDT)
Received: from hex.my.domain (83.8.121.197.ipv4.supernova.orange.pl. [83.8.121.197])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013fec3csm8334314a12.19.2025.04.30.00.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:07:17 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 30 Apr 2025 09:07:07 +0200
Subject: [PATCH v8 3/9] ARM: dts: Drop DTS for BCM59056 PMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-bcm59054-v8-3-e4cf638169a4@gmail.com>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
In-Reply-To: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745996831; l=4265;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=gWHaYIo9B3VudHVZ8I6m6gLwDBRYmLzx2Lunvk1Jg8U=;
 b=9YDN793N1EYkLoW7/rTMIWadtYdPcuFWIfUbe5118bJ35AYqfaDAHoRth/dpGV9LgREn/B8y/
 KZXTO9opxm3D9iEBhezjtHc3sJ7TellQdkMGWZ2Z+iOxNf085fYk8jF
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_080722_025786_72464946 
X-CRM114-Status: GOOD (  14.24  )
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

The BCM59056 PMU has its own separate DTSI, meant to be included
in a DTS file after defining the pmu node on some I2C bus.

This seems rather unintuitive; drop the DTS in favor of adding the
BCM59056 PMU node directly into the device DTS files.

If the amount of subdevices supported by the BCM590xx grows, and
a common device tree turns out to be beneficial, it can be reintroduced
in the future.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v4:
- PMIC -> PMU in commit message
---
 arch/arm/boot/dts/broadcom/bcm28155-ap.dts | 68 +++++++++++-----------
 arch/arm/boot/dts/broadcom/bcm59056.dtsi   | 91 ------------------------------
 2 files changed, 32 insertions(+), 127 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm28155-ap.dts b/arch/arm/boot/dts/broadcom/bcm28155-ap.dts
index 2f3634545e64978888cd0b47fd5647a5e2eb8e07..cefaa9a3c45c9c90bffc08f739161d8ea21d98dd 100644
--- a/arch/arm/boot/dts/broadcom/bcm28155-ap.dts
+++ b/arch/arm/boot/dts/broadcom/bcm28155-ap.dts
@@ -37,7 +37,39 @@ &pmu_bsc {
 	status = "okay";
 
 	pmu: pmu@8 {
+		compatible = "brcm,bcm59056";
+		interrupts = <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
 		reg = <0x08>;
+
+		regulators {
+			camldo1_reg: camldo1 {
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			sdldo_reg: sdldo {
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+			};
+
+			sdxldo_reg: sdxldo {
+				regulator-min-microvolt = <2700000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			usbldo_reg: usbldo {
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+			};
+
+			iosr1_reg: iosr1 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+		};
 	};
 };
 
@@ -74,39 +106,3 @@ &usbotg {
 &usbphy {
 	status = "okay";
 };
-
-#include "bcm59056.dtsi"
-
-&pmu {
-	compatible = "brcm,bcm59056";
-	interrupts = <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
-	regulators {
-		camldo1_reg: camldo1 {
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-		};
-
-		sdldo_reg: sdldo {
-			regulator-min-microvolt = <3000000>;
-			regulator-max-microvolt = <3000000>;
-		};
-
-		sdxldo_reg: sdxldo {
-			regulator-min-microvolt = <2700000>;
-			regulator-max-microvolt = <3300000>;
-		};
-
-		usbldo_reg: usbldo {
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-		};
-
-		iosr1_reg: iosr1 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-always-on;
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/broadcom/bcm59056.dtsi b/arch/arm/boot/dts/broadcom/bcm59056.dtsi
deleted file mode 100644
index a9bb7ad81378d88811c4473763c579d3d2c006a1..0000000000000000000000000000000000000000
--- a/arch/arm/boot/dts/broadcom/bcm59056.dtsi
+++ /dev/null
@@ -1,91 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
-* Copyright 2014 Linaro Limited
-* Author: Matt Porter <mporter@linaro.org>
-*/
-
-&pmu {
-	compatible = "brcm,bcm59056";
-	regulators {
-		rfldo_reg: rfldo {
-		};
-
-		camldo1_reg: camldo1 {
-		};
-
-		camldo2_reg: camldo2 {
-		};
-
-		simldo1_reg: simldo1 {
-		};
-
-		simldo2_reg: simldo2 {
-		};
-
-		sdldo_reg: sdldo {
-		};
-
-		sdxldo_reg: sdxldo {
-		};
-
-		mmcldo1_reg: mmcldo1 {
-		};
-
-		mmcldo2_reg: mmcldo2 {
-		};
-
-		audldo_reg: audldo {
-		};
-
-		micldo_reg: micldo {
-		};
-
-		usbldo_reg: usbldo {
-		};
-
-		vibldo_reg: vibldo {
-		};
-
-		csr_reg: csr {
-		};
-
-		iosr1_reg: iosr1 {
-		};
-
-		iosr2_reg: iosr2 {
-		};
-
-		msr_reg: msr {
-		};
-
-		sdsr1_reg: sdsr1 {
-		};
-
-		sdsr2_reg: sdsr2 {
-		};
-
-		vsr_reg: vsr {
-		};
-
-		gpldo1_reg: gpldo1 {
-		};
-
-		gpldo2_reg: gpldo2 {
-		};
-
-		gpldo3_reg: gpldo3 {
-		};
-
-		gpldo4_reg: gpldo4 {
-		};
-
-		gpldo5_reg: gpldo5 {
-		};
-
-		gpldo6_reg: gpldo6 {
-		};
-
-		vbus_reg: vbus {
-		};
-	};
-};

-- 
2.49.0


