Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5186BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 09:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brQxkQcBSLeOu8llLPLKYoA1VBGbas+TGQGDU2SyhI0=; b=NS4FPAn6538K+MTzOA5PyaO4r6
	x/vUAUIoGFIk3PT9kLDyA71Hch6kqdjwutvmIa/oQDEcUTqyBm1UJOgqw2dyHDTogkkXCu9TxdmkK
	FE+j3/SWXStDzWqWazZvkL+HaHvyzdQN+1wRs3h/1AFHLMNveh6NAtHtB1DP0kBXs0dBuy3WgYEh3
	bPw9nBzEH2eGpDHwAjMjEGa6IuiUN1FLWY/isGMIGprEACtntylPdyzLGuEwUh5Xij9DR56E0fOf0
	WCbWu36xl5c3ND5qRx/c/wsM+IbdwBkTYZUS8NCo/bp8ZDqnKq1yC4Lz91h6E4PBWCnLzmOsY7Px/
	TbqDK/Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiqjj-00000007JJ5-35KU;
	Sun, 12 Jul 2026 09:44:35 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiqjh-00000007JH4-1HO3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 09:44:34 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-38df0038497so99851a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 02:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849472; x=1784454272; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=brQxkQcBSLeOu8llLPLKYoA1VBGbas+TGQGDU2SyhI0=;
        b=nH+BoFOXIgklecCyssKqL/eHJxKT/oz1L9dCEYbLqJJQZZkOZmUfRAcAehkxMDRCk/
         cIHa62nXfy7/LN1HDN3x/3HHlYnCzIsosVk4w275a7CiJOGljww8nRo2/BnnVZIBJ90i
         khNqg2ubakyqZcRIvvl6jyz9gPgcKd2T4a8VRiwYheJUcscEdy0dEthOmj/7i1n9doVF
         OzMCc23jKm14caFBeZU9K105YY9baa9Ms8blMFOcj4nVvxPaUt3XlbNNYOmVpjbtsr7o
         nEVi9BXeljWyBNSF5CMMPUfUrRbF39wFRvG+eFS7ld0JtrSert9761vsaT5KiFhLidjn
         eVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849472; x=1784454272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brQxkQcBSLeOu8llLPLKYoA1VBGbas+TGQGDU2SyhI0=;
        b=JQSKCnJer0jxY9t4D8XzVwooEX+5uvTrdcBjWcdHeX/Ehe5MzmRCPc7HYhIjOMqksH
         U4R4MKr9vHG2/PRm058B6L01NFOkglDvl57MP6e+kj0g1F4ZaGTkYXnWqt68iV5tC43r
         kZjyb9iPGcWdkhOX4FoHfxei9a8mm/gRDg6UdCUPZMUOPFHEEIOuFW4xag+0Hgp8A5t2
         +5ds4WNLitDcW8v3ZzzY84eKpbbQEmaJt1ldNktucucYr4nnDnaDzQqDLxLR2r8HFxwK
         SaVF8Ikup+xRZgDefPqBDqqOYrllvQ1nmvgBfcsrwZxoHoeOh0ALGg7+NB885OEXNh6S
         nGjQ==
X-Forwarded-Encrypted: i=1; AHgh+RpeWGsqvqNGDHWCke75pvEEOT/6lHt+ZyCtroV58OL+kQf7UfW5Ya2T5PFeY9CF9D4xXsiQogREGAtjkJkRTOWj@lists.infradead.org
X-Gm-Message-State: AOJu0YwzOjX6WSS/Rqnu/XzmkkTLKLqgnOJfGWdcgEMpKkj6crqeiCbu
	mHvbmX+t5bFYfPic6Z2XEszCTbGGtv9gVf+zShky2apBh6zPaqJ+T0vo
X-Gm-Gg: AfdE7cn+MRwvm5pm74JjjLlKUviQYMEzHkDTT1FGYxm7zOFB7jfOrS1dcz7DadPmpv1
	HtlQpW1pkWjudqBa/zrZsOlzCl0TfozMpEBzoXqpEvu9xaWPGvHcKAKlboIMOjIUBgqGB8Rur0Y
	TKnrerVTQEzx1GQeop3bYAm3YO2LOFxudg+FY+CCrD5lqEYKnMWmRJos/UVkkcHkLavGUpk2Uso
	Pbqj4flyQkIRIuTBjDw9lYxbaiAIsLqB/04C3sh7a5EcFQi0o1Ru871v8rio4F8DmXN1TPnmNRC
	Zf112rYNdaxrUcSu1VHYPkPf09vuuEeh9DB9wZkH94xlW7nUECAbplRiEv8JYG2Uhru8j+YOOLh
	O5eiqJjLS+kxssWH7ZLMfdouBQkDot2RRdbcAxy5dKJcpwVmOyyZ9ht2o9vVOv486eZSUuvEo4q
	PtkpDXILIE2H/9j47lBhtcEz6Ht5zu5VYsUg3TppYAgkBQxmclyzs5Rcv2/jxEu4KDaSi967Vxt
	yCgMyOzNfoCqPXoWPeLjbPfWWmSSticBdHlBcfOiZKQ3i7Tzu1jWLx6qItxh0BD
X-Received: by 2002:a17:90b:510f:b0:37e:a09:2640 with SMTP id 98e67ed59e1d1-38dc761aba3mr5422313a91.7.1783849472539;
        Sun, 12 Jul 2026 02:44:32 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:31 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:24 +1000
Subject: [PATCH 05/12] arm64: dts: apple: Add common SMC hwmon
 infrastructure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-5-7763006d57c7@gmail.com>
References: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
In-Reply-To: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5127;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=S7RyjJPJgk8bM8bSvDin/ELs3Q0NaOfmTEAFhGjIglA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU/q9n14kjx3x7Iux5rQddGSwkUWB05b7AqZtzB45
 gctGTemjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFQLajH807+hLVmZ0XV4l0rePFE2luOv82e2mLpa+pr9vfeaxbZ3AyPD1yt/pCo
 v/SuPD4tp+CN6R3Bj+qHZOYvmJ51k/bXv6+XNzAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_024433_357098_09592DC7 
X-CRM114-Status: GOOD (  14.57  )
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

Apple's System Management Controller exposes the readings
from numerous sensors scattered around the SoC and elsewhere
in the machine. Some of these sensors are reliably common
on all devices, whereas others are exposed at SMC keys
specific to either the SoC or even the particular device.

To account for this and expose the right sensors for the
right device without tedious Devicetree duplication, we
can include fragments of increasing specificity in the
per-device .dts files such that the individual keys
(of which there are potentially hundreds) do not need to
be copied in for every device.

Add the initial set of SMC hwmon sensors that are common
to multiple devices so that they can be included in
the per-device Devicetrees.

Co-developed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/hwmon-common.dtsi   | 38 ++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi | 23 +++++++++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-fan.dtsi      | 17 +++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-laptop.dtsi   | 38 ++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/hwmon-mini.dtsi     | 16 ++++++++++++++++
 5 files changed, 132 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/hwmon-common.dtsi b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
new file mode 100644
index 000000000000..a35c7b14fec8
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * hwmon sensors expected on all systems
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+&smc_hwmon {
+	power-PSTR {
+		apple,key-id = "PSTR";
+		label = "Total System Power";
+	};
+
+	power-PDTR {
+		apple,key-id = "PDTR";
+		label = "AC Input Power";
+	};
+
+	power-PMVR {
+		apple,key-id = "PMVR";
+		label = "3.8 V Rail Power";
+	};
+
+	temperature-TH0x {
+		apple,key-id = "TH0x";
+		label = "NAND Flash Temperature";
+	};
+
+	voltage-VD0R {
+		apple,key-id = "VD0R";
+		label = "AC Input Voltage";
+	};
+
+	current-ID0R {
+		apple,key-id = "ID0R";
+		label = "AC Input Current";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
new file mode 100644
index 000000000000..e87997d21e22
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-fan-dual.dtsi
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright The Asahi Linux Contributors
+ *
+ * Fan hwmon sensors for machines with 2 fan.
+ */
+
+#include "hwmon-fan.dtsi"
+
+&smc_hwmon {
+	fan-F0Ac {
+		label = "Fan 1";
+	};
+
+	fan-F1Ac {
+		apple,key-id = "F1Ac";
+		label = "Fan 2";
+		apple,fan-minimum = "F1Mn";
+		apple,fan-maximum = "F1Mx";
+		apple,fan-target = "F1Tg";
+		apple,fan-mode = "F1Md";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-fan.dtsi b/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
new file mode 100644
index 000000000000..180eb8d7441f
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-fan.dtsi
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * Copyright The Asahi Linux Contributors
+ *
+ * Fan hwmon sensors for machines with a single fan.
+ */
+
+&smc_hwmon {
+	fan-F0Ac {
+		apple,key-id = "F0Ac";
+		label = "Fan";
+		apple,fan-minimum = "F0Mn";
+		apple,fan-maximum = "F0Mx";
+		apple,fan-target = "F0Tg";
+		apple,fan-mode = "F0Md";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi b/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
new file mode 100644
index 000000000000..cadffd000c76
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-laptop.dtsi
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * hwmon sensors expected on all laptops
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+&smc_hwmon {
+	power-PHPC {
+		apple,key-id = "PHPC";
+		label = "Heatpipe Power";
+	};
+
+	temperature-TB0T {
+		apple,key-id = "TB0T";
+		label = "Battery Hotspot";
+	};
+
+	temperature-TCHP {
+		apple,key-id = "TCHP";
+		label = "Charge Regulator Temp";
+	};
+
+	temperature-TW0P {
+		apple,key-id = "TW0P";
+		label = "WiFi/BT Module Temp";
+	};
+
+	voltage-SBAV {
+		apple,key-id = "SBAV";
+		label = "Battery Voltage";
+	};
+
+	voltage-VD0R {
+		apple,key-id = "VD0R";
+		label = "Charger Input Voltage";
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/hwmon-mini.dtsi b/arch/arm64/boot/dts/apple/hwmon-mini.dtsi
new file mode 100644
index 000000000000..7fd86e911acf
--- /dev/null
+++ b/arch/arm64/boot/dts/apple/hwmon-mini.dtsi
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+ OR MIT
+/*
+ * hwmon sensors common to the Mac mini desktop
+ * models, but not the Studio or Pro.
+ *
+ * Copyright The Asahi Linux Contributors
+ */
+
+#include "hwmon-fan.dtsi"
+
+&smc_hwmon {
+	temperature-TW0P {
+		apple,key-id = "TW0P";
+		label = "WiFi/BT Module Temp";
+	};
+};

-- 
2.55.0


