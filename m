Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248F3C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 18:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FAPozP4IneH+whBW7y4JwsioLb146azVsz4FWFU1mlo=; b=G6Z0XxjviUjHXxof3iqktJd2MX
	cDd4MxBeGBaeZ1jRENnM9W4gRykBTaI9b/qbbftLNaHlfP6oaFmTC/HLmZfXrVzsvqfzlERkrmwva
	FIOuWVl1vwRWCbT9ovl1uiWR24pYk91ImL8Bw5dLXILMxp4mXTd5moFMWIAs639ev4i+cMg3EcJt0
	GJ8ATpyXuwDYHz6+kgADtHM31Ncp2bQ+YhTbp/9rdhzlOP0aDFWR82Y/3p9EkID9KVXV2BA5yGLwy
	qET8GOBUTnOFCjnMfsuSAtGFDk/P5qHt+e8MWL04cy2IhNduw4IpKqG7UptBhhowcnCNiSetWj5qz
	n5h+sPHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdvbn-0000000BC0O-3l4C;
	Fri, 31 Jan 2025 18:19:15 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdvWi-0000000BBGC-2OMX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 18:14:01 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5d982de9547so4307178a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jan 2025 10:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738347239; x=1738952039; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FAPozP4IneH+whBW7y4JwsioLb146azVsz4FWFU1mlo=;
        b=KrUB4Ty3ZIBRDJm/EuVV/EBESVvWSsGvJu59DHadKcEHUlo3Sv9iNvfLCFYzw4GSkR
         USobo+usNdtet0F+t3CrnytaD1LL+B1ShNL82SIzQPxf/webQzlMd7AnrWJHjbUc5S/D
         VWI8E9vrKjUgGFlJgMM1RDtYdJ95KlOVZE3nvTDH7C9ryODWDaeBLVkT900ygO7PPM2A
         /9piifXl4s7xYyIy4XVdgCUisBOcX47Gyb3OVzb8hr/MyV8DMdq60trATVC8ePjunN4y
         IegxOCNwtYKrPPEJOAAvHKhYU3kSlqHJWxJ9t0C0zzLiHvN2atrCTelPbBxNqdsUEpe1
         HscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738347239; x=1738952039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAPozP4IneH+whBW7y4JwsioLb146azVsz4FWFU1mlo=;
        b=I2YQ/AKXxbLkvUldRBMOvQF2xaX/R+QrAHihcvdb6GWdkyTXC5blQZskBlTgHBvqFd
         mOJyw+dV9alNKsgtlHR4SyBu+0egOpZny8oFmISx9FbGfOsI3uGIGB5VZDc0ugbI/MGQ
         zWit/WMeKWX2nbVw2Tt0QBJkTwlHqPo6uJ+8GrJvW5nwxboNcnAwIkWuMyMjhcqOXydK
         r/rUCDRaEKOOzvtGJurv++yvCWmmUhZ4ErG7BewUxsRHAoqerxM60K3sUWstcD/QkppN
         6Bwnv1dIC4gZSWP6viCQ5eSuzqe7I/InwUu0LE0eAG3cfFgtuUBu5nvTANNbAfqBCt/z
         leVw==
X-Forwarded-Encrypted: i=1; AJvYcCUQRpBVLSsP4hAlIt9KxzuZL2clBYH0K2JP0fcvfhlxR79hzY9JIIeHR58Rxhm7B7n/2OLBbVtNFfw2mmEm5ypC@lists.infradead.org
X-Gm-Message-State: AOJu0YyaUkjKoXn708wyWTshptYeLTNg/YjARodWqOiyBboe2stkpFGP
	rftG2w9/VYQW3iqm4wrwsNML9BWXBJla7r1hiPvBU6MDRX1rhnYr
X-Gm-Gg: ASbGncsI6fSq8V/kvqIrpKPXLyJlZ/Iii7vspnqpGA2FBThwwh02AwULvqisbNB319H
	/u00iIczh3+aHbATlIOJgqko4xEQhH3Iwwl3Aggz917bt0UTBwEKqS2ISbYVT6D+egZbKCpNfW+
	N7kC1zgTgPm3vz6OLDKa86HUboyJ8FCwysHAd48NA455zeXBKJ+H2WiDCmBT7FqkYyVft0gkaDW
	QQDzt+yXwUm+hgdRrhPoNpev9Xw4cS+xPnNNXaSMvV4MnMa6ruqG7vcFRmlzGdgYNQYyBgow+6X
	Mp5MzXqCn6rVdp6hJQWDyg9kMsAkEgW6Q2wo7YjJ2cKviDZq97dvWLne9uJTYw==
X-Google-Smtp-Source: AGHT+IHRPj8UwgcWH6OIw9wepi1Xwi6EB7ZtS1zYMWIfFGxWen8LM1yvcLK7/5QE8x90kvED0B3M5A==
X-Received: by 2002:a05:6402:5291:b0:5dc:9002:3164 with SMTP id 4fb4d7f45d1cf-5dc90023384mr60378a12.5.1738347238821;
        Fri, 31 Jan 2025 10:13:58 -0800 (PST)
Received: from hex.my.domain (83.11.225.21.ipv4.supernova.orange.pl. [83.11.225.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723cff67sm3223744a12.16.2025.01.31.10.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 10:13:57 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 31 Jan 2025 19:13:51 +0100
Subject: [PATCH v3 3/7] ARM: dts: Drop DTS for BCM59056 PMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-bcm59054-v3-3-bbac52a84787@gmail.com>
References: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
In-Reply-To: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738347232; l=4056;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=oSZj2mqvkLxBORbTCSITwqBVG2fzKvqkrOn5Jmie/9I=;
 b=73obPnSj4YDjncrEoMGJIbbHDkG09Jt8NyBm9DLvJVFK79B70Im8wYGlKQWhqaIoO3fnUIzhY
 zgmrX+edcmYAFAzgdASTVPw5iL7QiYXUqkfbGK70Fhyu638boMdrouE
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_101400_613268_CA47B7D7 
X-CRM114-Status: GOOD (  12.75  )
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

The BCM59056 PMIC has its own separate DTSI, meant to be included
in a DTS file after defining the pmu node on some I2C bus.

This seems rather unintuitive; drop the DTS in favor of adding the
BCM59056 PMIC node directly into the device DTS files.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
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
2.48.1


