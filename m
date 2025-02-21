Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7459C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 20:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=97ERf3V/Bpk7MgoHGPJsnvkiQqZJeJp/kSKmJml6+us=; b=PAO5C8rsdPJi5TcuJMbfoHHSzR
	XPEz77hBdJJCKhUZfQmg9VSw4JrJV3sYQI12qKKKIndekDxel9QQVY1oR4pNzpMseUdFwnYVoxmhA
	1EFWZ0zEuBz6gAK5eYd7OZpgXCNNIqHS8sp9VYC3h5eBXoOUWvxvJGyJ1lOTUsUgdCms2PL3u5XOS
	PCmWOvZ6EmE5i+V/lH+HpFRNeH58drWml+SPvKcpBbzoBoxrBAGIR51t/PuB5bi5v0jcbS+Q66dav
	cZa3b65xrOtzLt8KsX37o97e5RjcVai119B+iNSts4/yUyOHubatB0BVPgVgCXZIdcc8fQSUZeTF/
	0nGDfyDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZXc-00000006lvj-3duI;
	Fri, 21 Feb 2025 20:22:32 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZRv-00000006kmV-3UNq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 20:16:40 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5debbced002so4641749a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 12:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740168998; x=1740773798; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97ERf3V/Bpk7MgoHGPJsnvkiQqZJeJp/kSKmJml6+us=;
        b=hXZxNUBSJwAKPRfVac4w/QmDF2M8/kvMJG9eF9AYBpiv98L2IVKh0krFWu1UbNz+KG
         1wiITwWg1CdlwAUDFfNXius/+HBfk/1oM5ng8kknfzB0jWQveoCFM4077WkWVKGvEuCy
         CYQde6hwJEicnpQU5uHfxOVFJFOwu3ndLSSHUOPzexrGar1Sk/ha+8R1UfwAYKSEj49Y
         qjhygbWEBJ1krTpSUlL9a3L5r+00RYd3SWuPPfghk79nM8Lp1+JIgagyFnsi0o099VTz
         idl3Ulv5xflC5Y75BiSfWmSPH+KW5Mflewz5vs4EolXCmhMzs71O8bcT5oTbt+6ELGhG
         vVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740168998; x=1740773798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97ERf3V/Bpk7MgoHGPJsnvkiQqZJeJp/kSKmJml6+us=;
        b=IO8YbiKG3l3Ki6Z+lfrByee90qlAX30ogG28DxuTof/0EaWOnPTrCj++Yxjqszu6ia
         zr3srx+2kO+g53Y9udE59ZjU6Vyay8Yq7/rh0TIrB5NzUiRhk0eTrkC+ORXPjWIapAfA
         OYDFvJgyd8DXsdMPZQMx3y/SdfNpgmsQ8KZoMSGhnOR0I6U5YyA8EjWVljWLDhMsZzOo
         AEKbSa1ZKC6BP1J0qBpLx94ccRsEz9yokmYxcVq74Y+zuxgXmSwAaMWTRhYBnNkPDcv5
         wkTK18pagzGyVM3rzv0wWPHRY2VwVcnFrZsiGcpVkGV9CF/IBAv2ecQRfOU2UUVhNMXg
         doWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaNCIZwXHThtSkTilRLWRvASAwUmcE31drYUUlS+cTF8kcXbiT0+mz4MiQBgCQJD/yjFIv4JLzzZkkWTr3Wl/s@lists.infradead.org
X-Gm-Message-State: AOJu0YwrvLckFvSxzYcS8vPMm5IWtYVEXevaXrNi26p2K1APDdo8EQJy
	4vpVh6NVzD0E1Rj0kOBTZjUx0jjXBwdcHs3YW3xoyrS762WFCIkp
X-Gm-Gg: ASbGncsSLmhS4y9GlURMtjxdwGmSt7PqzUPuoU0wbTj7enP34PBMczt2HANT12buNGH
	BsjZOQYyRuxrXEjB8LP7czw8HOVqT6wC1xyJ1aPVJCu8sm8V1R3cSrIbO6spbqg8JUL6JmNQ1k/
	a4xxDhKHH4kAmH6lrVyno0Vkuw8sLs75F45I0+GghoZMAOunaLg5HxcuA8GXVNKu/3rLHjibpe2
	pW6BycetbJRNuOPob8387n+jB0eaEe13Nb6MegkO325OpKG0JrpzoFSoQU21GAMLaq7DqdF5fYS
	WkXtqkWn4rvwGKhfCFRRIBBDg2FBgS8WL3nMkFoYCSIB6bu4a0NQGu8GtJdXcqqgDL9tdTQj
X-Google-Smtp-Source: AGHT+IFX0cBW5NhhaqSoZUE02MmKdZx+XfwVP6S+FGJatQ0gAH+hL5/+9KxAWHDDmDivmB6UEYLASw==
X-Received: by 2002:a05:6402:40c1:b0:5de:4f4c:3780 with SMTP id 4fb4d7f45d1cf-5e0a12212afmr7730937a12.5.1740168997874;
        Fri, 21 Feb 2025 12:16:37 -0800 (PST)
Received: from hex.my.domain (83.8.202.192.ipv4.supernova.orange.pl. [83.8.202.192])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f70sm14127594a12.12.2025.02.21.12.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 12:16:36 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 21 Feb 2025 21:16:25 +0100
Subject: [PATCH v5 3/9] ARM: dts: Drop DTS for BCM59056 PMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-bcm59054-v5-3-065f516a9042@gmail.com>
References: <20250221-bcm59054-v5-0-065f516a9042@gmail.com>
In-Reply-To: <20250221-bcm59054-v5-0-065f516a9042@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740168989; l=4265;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=oSsgHxWm93UX4Dr0gTfLMbljoK+SAeJiEhBDHrh1GCg=;
 b=xn8dnAj7UkaSerl2L1ALR3Y5M5eGQt/UvlOlAyVc7XHJXSagGqSJShZbZorT4vSLbeBF7DUCB
 6Z2MKxtI0c4ACsSDPw9TdM0NzcHlPX1kcetxY958MQJGSDqBQEjcQfi
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_121639_874636_A0C00E7C 
X-CRM114-Status: GOOD (  13.92  )
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
2.48.1


