Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90AEEC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 06:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=97ERf3V/Bpk7MgoHGPJsnvkiQqZJeJp/kSKmJml6+us=; b=leCusQratkKW0MAkU8ZNGFVazY
	fZWjPRzFBAgA+C5ax01OWeTv5m0HuIzGHKWR3r5u6rJ3DmkeTWMqJ7zw0LyowPQnDW+HnuZTJllvL
	t2ouWFb7jAWzvxloJzjIQwFEijFD2kqVEoYa6cxuNROzjcUg9JHaAMSyCeDITRV2sEKDVqwBnycTz
	1tUW67FNGzafBHMxZA9wLhAiV5V0U/t0X6C9OST2L+ly6PXugxLzuKfKAG44wHRjiccl6NrdNCszx
	H9fIHnKBW9XEUKJJDzz8obET+L2+TLm4H1O0bSFqiL3Mq19kmJnMn5dVKb7AZiumy+3dZDxyGNzsc
	Bhza4iaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLln-00000003H9f-0YmT;
	Tue, 04 Mar 2025 06:28:47 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLe7-00000003Etz-1JWP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 06:20:52 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5e4c0c12bccso9271570a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 22:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741069250; x=1741674050; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97ERf3V/Bpk7MgoHGPJsnvkiQqZJeJp/kSKmJml6+us=;
        b=ddPO/+UQ5alxOghran3MQ3tvcAiyHlArhYpGdJsMR+6a0w0TOARP8h9EBZ+ZZiU1NV
         lzuwiaCSQetkRO1Og5C9Anrgma65LfqGsWv0YlOwpiCICTQ2q+gYvGMubl/H3dms5WwO
         CeE2kPCKXaYBD8hWbXn90cQZsV9tcSQP21XbEf7Je2JhCw57bl2rXOVcIMCmqFABlGDs
         5Mu4xftgHVW29inksjzS6llOeMCUFiR3QhHgPsxhTVAtL1icA7GYeADGix5W5p8ZzMDI
         uwmBp0KQFsxk9hOsWntPXEqqERPbLC54ctbcVDu66nhEiPQ30ND3tvTODuauO8dfaax8
         Tl+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741069250; x=1741674050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97ERf3V/Bpk7MgoHGPJsnvkiQqZJeJp/kSKmJml6+us=;
        b=Zs3YLKYl220w7+BK31aXV+KoxABnpRFL3uMINwkf2FOMrLcy64F1PbYqJCidmA/Fsb
         9ZxtsnKgpR63gKAESSblTgKuSC+uX8GRwS8T0sbMoHlUZn87tVklDY3xff4gB9s+m8DD
         0ab0CutarX4cvmfPy0VU+DPwkxU2L6wHqulPnIQSgWv07yh7kTjy87g+739A9YuddrrD
         4H/6fCAfk+ZM8t7V1Oh70trnBL6dPe/jbLO7b4mEVrmvUY4412bHIrr0XcgC62AOYHVT
         UtmmBKbID8leGrn+slfyYOG2BwL05w3djOJOyhE91QpEU4DArt2O/7ezytefncnr+HNC
         /3VQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZxeE3p80vdOoN3Z0xikFJ8kHapeFRieISlTcqvAK9P7m7FXTC8k6dOGGFav5AhOmYkAxGyLN/CdtUOKWnmRuU@lists.infradead.org
X-Gm-Message-State: AOJu0YzOU0MpA+GM/160Y6v6G8n0MAdIBN1tJaMCMfrPi9w1Gl4jcIL0
	0++w8ixy6VOitBrtTmgjBr/cyjafWCLU83GTXsCbWyuM1fMUbrSUXVQFFg==
X-Gm-Gg: ASbGncv2OsavgG6LvhYfjerkWodQuy6z4WThNksJzk5DJJoifLfUwgc1H1gkgyQcHB/
	11P7ACvw+HdEZZzBYT13tqC24pR5O1M5NNL7h6w+gmpJTMvQRDcvIXZRvcsRqXDFGphmmAjajQw
	vbidWGZBi71uHtRIToOJZSOvs5JoO3LfhVz5UVQ0bOQbG9lkmWanWwgr24ZW6JuKZnwQJAY2xhz
	OTvzpMAC9HNlrS/weI8hFM73Y+bddLvTLjF2r7IzfC9hf+zgLTRJaSH4ng1vrIgJ7y0TRNRwfvd
	Dff/tNM5YO893lEnOSEwSzPwGa0h/Qil6/0Nezm0X2+lnaILMdqE5F+Qd6QHVnkj/x9pW/Esl+o
	eKTEZgnCi8dRRvh8=
X-Google-Smtp-Source: AGHT+IETu8E7wBlicYrIJPSlHcZly3Nq9bJ5rvMGIHFhEg3oFUbbPHyfXTWuUCwSJ4ixrhNvMNd+Lg==
X-Received: by 2002:a05:6402:5190:b0:5dc:1289:7f1c with SMTP id 4fb4d7f45d1cf-5e4d6b853a7mr19363341a12.29.1741069249529;
        Mon, 03 Mar 2025 22:20:49 -0800 (PST)
Received: from hex.my.domain (83.8.122.142.ipv4.supernova.orange.pl. [83.8.122.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a663fsm7609036a12.68.2025.03.03.22.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 22:20:49 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Tue, 04 Mar 2025 07:20:34 +0100
Subject: [PATCH v6 03/10] ARM: dts: Drop DTS for BCM59056 PMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-bcm59054-v6-3-ae8302358443@gmail.com>
References: <20250304-bcm59054-v6-0-ae8302358443@gmail.com>
In-Reply-To: <20250304-bcm59054-v6-0-ae8302358443@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741069240; l=4265;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=oSsgHxWm93UX4Dr0gTfLMbljoK+SAeJiEhBDHrh1GCg=;
 b=0Ge+lOaV9AGpWKF2qpI9XFmgFwmsiyDdxZ9rSmekozIIvQToAB7WXH8CJNzl3txCTOGpL4DBN
 THKadnJOkdeCdQTORr5ZP8w7+7qHglq/cP1gr+oih6+hQcISNGQmhiN
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_222051_370899_75393E0E 
X-CRM114-Status: GOOD (  14.43  )
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


