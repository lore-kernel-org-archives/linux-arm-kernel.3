Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F8B4C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 18:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=97ERf3V/Bpk7MgoHGPJsnvkiQqZJeJp/kSKmJml6+us=; b=j/GQnsRihT+wQoBn/Z5lHe4T4y
	b1TVFC0engqWhT1nX+3Pz5gkTGxDDzULLaJO3v4AxyLS4kq2dJ8oOfELmEJF1x99H9TKMY2/gXxHN
	cllcPX5S+06e5RujZhN2Bo43gkZ/sUPMgpamN4mXJ2Zmp+FX79zbJBrogtkWkNeYUn/I9rX4WWZ6R
	fG/3HXkli+kE1cD7265jehKcRVD83RuyXr+7XB1aXTfDi40kmskKmbRiu/SLtecYtxaY7dT7DZ1Px
	yquTFb28CTshMZuoj1B2YPtp71Z1Rp1Z+4N25uchpGCtecWb/fKNZwOokFlOFHYFTIY7ZLIcoX5U3
	9Ovq0VVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttsgZ-00000000SqG-475l;
	Sun, 16 Mar 2025 18:26:07 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttsa2-00000000S4r-3ALH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 18:19:24 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-abbd96bef64so660248966b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Mar 2025 11:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742149161; x=1742753961; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97ERf3V/Bpk7MgoHGPJsnvkiQqZJeJp/kSKmJml6+us=;
        b=CI75s9dnWvwIMXzOKEsuqFm2XAKD249BZx28Y4m/k12ugsoGOJaV1Yodtj/OjNztMp
         Fz589MStqICCKsW/TMFTW6cCQBHu/5L2EJKQXINUbENvZi4UOjcRiUaBGjVHnj4YowJC
         gkCDeB42g3J1aRtu2KomdIbNb04BjAaqs28gjY3QGIsgw3drtdAXQwagE/LErsMKVKFB
         M/tWO2NpdMbZH0wQf3O7DOQpnTY4xnQJHs79SSo9RR/KnG6mDpVY1jqK4hxq50zPRYC7
         u4P0hP7Jc2N32XR1xS7M3argOjBRYWWGRYCSketxm2f1m3FsIzxj257+0hDJgAbvWbgB
         hQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742149161; x=1742753961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97ERf3V/Bpk7MgoHGPJsnvkiQqZJeJp/kSKmJml6+us=;
        b=WlkpzrseUXXWTjPrbGpBQl2c1iXPFRJUCLYRcoZKWXCsq7Y2XOuayPgqgi30oGYB5n
         4HDZ0DRT/Udgj+/GZOz651ABTkGpo6VDWArkIfAGttBC0sGz8nx7J/Kcs1aaAOSe7CLX
         FjEwTqg+dm+Ilmyx3FsMxfIe8S2kdEKe5DH+d1zji7XNo3JkcuQchTCw6hIH6h2YFhV3
         RvNCFk7qSQ5mlMgqd/K005b9P1uOCyR1X2tGCttWqxL1xXTLBghCn2o90Qws2jNwiXAk
         SpsPtVV1v6rSTS+TKmSs/TYtexspOUgz9YzTbEhQ0m/HOHeFLAkHF0upyc5NH/1fGkWH
         pTNg==
X-Forwarded-Encrypted: i=1; AJvYcCVF692M/yAAwa6hr6YgsNKweWl3ulYhK9VaughyMTBTv1PJOiCrR1CT1B7S/+1yF8wgqzftxUaXlRPIRlfwxOG0@lists.infradead.org
X-Gm-Message-State: AOJu0YztoeOvPDbYQEavT1TLzt3OLrZ8R5Ig+l1/Ot2WDT9UXcujXmkN
	zPcGMiWw7R2YrKR+VsBSfAplem155YjPa05O45zjST7yencMkJUgnvE9Ug==
X-Gm-Gg: ASbGncsS/grFQXCP24IdW6E9ll2pdEzyBgpm+AbtEWP4FmEv5mNnrTmbF25AUK/EJct
	qRLNTceEFrTrTzEF1UqGiRidmAZNIgld0QRIaSvsxBXvT+obF2LtH44jP0X43Qdsa27ZlYSrTh7
	AncIe5u+XGvn/cEKq7IJk1FWY/Z7ZEFSyzqx9ykI1nEkcrFMwuLFu90WPSDJPk+otCF9HX/rNTy
	VVUwTMQ9Xta1UQJmo9+VQIAuAyLRLX5nuCoHIwbR6rbyg25w9asIwpKwNN1K4MkuzkvX1P0styQ
	WOIrNqmUcO1rKJnzPoCUZ809QG7GbcryJ/3Hd9wUihd6ZYdM/C27LTUjr8k5gfYJT7bQ8hx3DoZ
	wiR/Bd9JXwCjcurLHJuhVuIu4sacj
X-Google-Smtp-Source: AGHT+IG+83lChTiI1RBzCDIq8j9lOSoKKPoy8P0LCpgfYgJS30USvkARqAJeFOkKxSUjVu6YQZtMmg==
X-Received: by 2002:a17:906:c10d:b0:ac2:7cf9:7193 with SMTP id a640c23a62f3a-ac3304195a3mr1071132166b.48.1742149161249;
        Sun, 16 Mar 2025 11:19:21 -0700 (PDT)
Received: from hex.my.domain (83.11.178.210.ipv4.supernova.orange.pl. [83.11.178.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a48b51sm537951266b.149.2025.03.16.11.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 11:19:20 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sun, 16 Mar 2025 19:18:51 +0100
Subject: [PATCH v7 03/10] ARM: dts: Drop DTS for BCM59056 PMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250316-bcm59054-v7-3-4281126be1b8@gmail.com>
References: <20250316-bcm59054-v7-0-4281126be1b8@gmail.com>
In-Reply-To: <20250316-bcm59054-v7-0-4281126be1b8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742149152; l=4265;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=oSsgHxWm93UX4Dr0gTfLMbljoK+SAeJiEhBDHrh1GCg=;
 b=uoPcsxaopSegQjH9DQN9ffpNUBszrF6XR3Yfteih7WnBU+g5Uxpu+0gJ8JZ1h9wWSkHq5IKf6
 sEzCZxVbjVVD8ZkiVSjgHenP5iu/z5HFP8/kOgswtj2KHgqNxsMLRgJ
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_111922_843930_1318D012 
X-CRM114-Status: GOOD (  13.65  )
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


