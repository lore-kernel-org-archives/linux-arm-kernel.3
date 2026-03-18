Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58538103E199
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=godpTaFXAY2ep8bhfkFW/rBnOk7asG87yrTm6n99gBY=; b=bPtz9FVC1g82ygq/F4TQBIYR3y
	g0CMf2uct8Xsi9PNSGHazlCF60WTjF6vRGMvgD20afLJra/9dHUtnxpJ8Po+xG/4wMf4ROkw1BUMy
	F4hV00JFUCyfenMAPVqkrxn1UJzFyFPsKBNB0p4OESnCkL1TiapKllEAwQ6s4GSfVGS9VNTtsA7Ic
	HsIuW09EUuMFGje1cAZulTkFAFHLe3Hs16Z+yQlwFNWjhnqarjsucYYvw8m6rDyfHPxcABQjROW+x
	XBRYyvM1TsT2QqBU+2UNRQ/PpALwjdexF8nq+WuEg8ui0taRwkkapmdj0/ulp+B1aNHNTiRnn/VH8
	WNy7cxjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sbM-00000008fOh-0yVq;
	Wed, 18 Mar 2026 15:14:28 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sbD-00000008fIf-08Q6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:14:20 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso78461565e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 08:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773846857; x=1774451657; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=godpTaFXAY2ep8bhfkFW/rBnOk7asG87yrTm6n99gBY=;
        b=J4DG7Dn6tMvQPtEEQgqLCxi2lACj9WcCexmNcmSK4oxfJjutiGmbseJw+V01YGDvaD
         xkikgK20/xS1dDCTSLVZpzRElVmii7Z8i6nxmvdACgbyBmO2MEN4fRWifw+YyCm8HtLp
         56vWq0J92Pk03toD78A0objw0jZYvCzzqbl+BpOfwwOUVJ8I5YTKp9REwqJhd0rDuugI
         Jl+AjpJ0vJfELhYkR7C3yIgNLZsFiUIbVhZrdjtRc5xFp4yQTP1SpR2kymndpJo6YP0g
         i4l9P3L6SoX5Kvh0ocawaVRz9GGShIm/xXsmJvP/nAyRJaozx+d6UGNeIjxtoTp2mOCh
         yADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846857; x=1774451657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=godpTaFXAY2ep8bhfkFW/rBnOk7asG87yrTm6n99gBY=;
        b=VXVN4h9S2eSg2MDe5D5dIaUX4jvFOZmiUhvU35wvGaEibW2UlSWnIM0M7xQmvRmD7+
         l/0G+ywzmSQPf8iEme9NvOhKmZ6C2VtAAT1kRH/cdY/bKevNkCB292+Hv9BtCW6OHEQf
         +rWLdb206XHZdmGFF8kz4fI8qPw+40mwzImhkMMuiqxgHwh3dYg7EhG8AZGxVpwLwdhl
         F1N0IB8QoC2hl2g4u4GshP87iz/fpO0UcP+yFFAatKocUx935pGR59Cufcpq52scaJss
         ct+y/7gxHcxqaXzH4pOYs0gmPG7bT3A6dabmX1oOAvkIfUbJVaYOScczxy+j0WJZB4h1
         6Ptg==
X-Forwarded-Encrypted: i=1; AJvYcCUW2cO7Bt6U8O3wpDU+x2ZnTb/UTWQg5BBNtD/BewdMtBOwoQopcwpcKyNx0NWy+KxBZ1NQ2c1mnZSwNukWIkgc@lists.infradead.org
X-Gm-Message-State: AOJu0YxPaSjPDis8MemQiYXnsWetd3w7tvaEgykDjRG9/4KIfN9BPuk5
	ASkdoEf5Hq/JgBC9YlQshrhyvbWh5pFOAB7LO1GlaWjuxqJ6fODFNufprtoEicmLLaQ=
X-Gm-Gg: ATEYQzxPXW/Pdg50cHJYUH+0JEJtmjwcTpnHbbA5U3yjEmaHkZmX/UNXsJDc9nq4LJ5
	0BEi03tttYYP4NaAyU8tIMswv11o9wGk3APFYiaG7/tyWe5YbYjzrBdPKOaSYoYpZFZhWjgUeBU
	b1JpqMJCNMI8S/TNDhMqU5BNwAX8EfFqstlEj3Xs9IHCeloRN1eHKc4MywF7LYioWOkPeHFYVpI
	IRbNWHI7rYclE1IphAVOpYMfffrpXKL4C/xO/9MAHQdwIU6dahlU//mjGAwAJR+jpcE6TKpAsjS
	qOz/2EztREAz94xcbnpB1wUlOgVqMjEl+q2ciLghsrTIn7fqP3addKEOgW6V9gWQdCA9uUsQFvd
	xtr2TYnIT/QYotVTR340X6qXDtmhKpNzVfWsuqiK6P+BLK8mZ6R1yXmHa1JkUt31RLkfNoAIUAe
	3SzpsK8IQYtJkn/ngRYhbH
X-Received: by 2002:a05:600c:4685:b0:485:40c6:f507 with SMTP id 5b1f17b1804b1-486f456feb6mr64803965e9.30.1773846857053;
        Wed, 18 Mar 2026 08:14:17 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f75f774fsm11253655e9.32.2026.03.18.08.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:14:16 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 18 Mar 2026 16:13:09 +0100
Subject: [PATCH v3 3/7] arm64: dts: ti: k3: Use memory-region-names for r5f
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-topic-am62a-ioddr-dt-v6-19-v3-3-c41473cb23c3@baylibre.com>
References: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
In-Reply-To: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14721; i=msp@baylibre.com;
 h=from:subject:message-id; bh=eg8ypgw5ZqfczO8GaLg+1+WWvtaYju8g3PHYUIABZr4=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxdB+XcPJp1Hif+2KPQlu1mnV8+9dq27GirRSaz7+84Y
 sipWz+9o5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACYSLc3wP7/xyUxenVcch9ef
 6L7S+Pf3mi9a071DY/2cuya/U+B54MHI8O/DGpnqJ1y5czq2rJZjtyz60RLr2lq86XHqnf/1mX1
 nGQE=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_081419_224050_B7F85725 
X-CRM114-Status: GOOD (  11.36  )
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

Add the newly introduced memory-region-names to all occurences of
ti,*-r5f. This helps adding a name to each memory-region so it is
easier to see what memory regions are for.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi               | 1 +
 arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi              | 2 ++
 arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi              | 2 ++
 arch/arm64/boot/dts/ti/k3-am64-ti-ipc-firmware.dtsi               | 4 ++++
 arch/arm64/boot/dts/ti/k3-am65-ti-ipc-firmware.dtsi               | 2 ++
 arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi              | 4 ++++
 arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi              | 6 ++++++
 arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi             | 6 ++++++
 arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi              | 3 +++
 .../boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi      | 8 ++++++++
 10 files changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi
index ea69fab9b52b0458a830c03adbccbf3c2842a9c9..ad247f53fe82da57504e5ffc0351c8cc3c4a0e67 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-ti-ipc-firmware.dtsi
@@ -48,5 +48,6 @@ &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
 			<&wkup_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
index 950f4f37d477a32b5eb5f66c97daed4c8fd09aca..06d4e815b1670beafb8852b76a3f6a79295ce8ca 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
@@ -66,6 +66,7 @@ &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
 			<&wkup_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
@@ -77,6 +78,7 @@ &mcu_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster2>, <&mbox_mcu_r5_0>;
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
 			<&mcu_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index d29a5dbe13ef7e66e7df8e8c3542ab5c4dc64262..5d7f701420e2d8308b637f3064c560e485ed85f2 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
@@ -45,6 +45,7 @@ &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
 			<&wkup_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
@@ -56,5 +57,6 @@ &mcu_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster1 &mbox_mcu_r5_0>;
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
 			<&mcu_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/ti/k3-am64-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am64-ti-ipc-firmware.dtsi
index 6b10646ae64a62e19067b80bead7c99643d1702b..51fd9b68f58d1f8ae3a7a77a48f74a77c2c795f3 100644
--- a/arch/arm64/boot/dts/ti/k3-am64-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am64-ti-ipc-firmware.dtsi
@@ -126,6 +126,7 @@ &main_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss0_core0>;
 	memory-region = <&main_r5fss0_core0_dma_memory_region>,
 			<&main_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
@@ -133,6 +134,7 @@ &main_r5fss0_core1 {
 	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss0_core1>;
 	memory-region = <&main_r5fss0_core1_dma_memory_region>,
 			<&main_r5fss0_core1_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
@@ -144,6 +146,7 @@ &main_r5fss1_core0 {
 	mboxes = <&mailbox0_cluster4 &mbox_main_r5fss1_core0>;
 	memory-region = <&main_r5fss1_core0_dma_memory_region>,
 			<&main_r5fss1_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
@@ -151,6 +154,7 @@ &main_r5fss1_core1 {
 	mboxes = <&mailbox0_cluster4 &mbox_main_r5fss1_core1>;
 	memory-region = <&main_r5fss1_core1_dma_memory_region>,
 			<&main_r5fss1_core1_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-am65-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am65-ti-ipc-firmware.dtsi
index 61ab0357fc0de01df641b887b47e88ee26b4f2fb..e5f37cfd18bc55c86e9970cbfd25d354371ac079 100644
--- a/arch/arm64/boot/dts/ti/k3-am65-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am65-ti-ipc-firmware.dtsi
@@ -52,6 +52,7 @@ &mcu_r5fss0 {
 &mcu_r5fss0_core0 {
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
 			<&mcu_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
 	status = "okay";
 };
@@ -59,6 +60,7 @@ &mcu_r5fss0_core0 {
 &mcu_r5fss0_core1 {
 	memory-region = <&mcu_r5fss0_core1_dma_memory_region>,
 			<&mcu_r5fss0_core1_memory_region>;
+	memory-region-names = "dma", "firmware";
 	mboxes = <&mailbox0_cluster1 &mbox_mcu_r5fss0_core1>;
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
index 9477f1efbbc61d0befc56368436ccbc5007a1411..d65f68c7d43210b5af8eff52c5cec6ddb54e5c68 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
@@ -100,6 +100,7 @@ &mcu_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
 			<&mcu_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
@@ -107,6 +108,7 @@ &mcu_r5fss0_core1 {
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core1>;
 	memory-region = <&mcu_r5fss0_core1_dma_memory_region>,
 			<&mcu_r5fss0_core1_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
@@ -119,6 +121,7 @@ &main_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core0>;
 	memory-region = <&main_r5fss0_core0_dma_memory_region>,
 			<&main_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
@@ -126,5 +129,6 @@ &main_r5fss0_core1 {
 	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core1>;
 	memory-region = <&main_r5fss0_core1_dma_memory_region>,
 			<&main_r5fss0_core1_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi
index 40c6cc99c4056009e9ff66adb831400b8842de9e..5d4fc26b413b22a9c2168e5d37f04475511a75a4 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-ti-ipc-firmware.dtsi
@@ -219,6 +219,7 @@ &mcu_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
 			<&mcu_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 };
 
 &mcu_r5fss0_core1 {
@@ -226,6 +227,7 @@ &mcu_r5fss0_core1 {
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core1>;
 	memory-region = <&mcu_r5fss0_core1_dma_memory_region>,
 			<&mcu_r5fss0_core1_memory_region>;
+	memory-region-names = "dma", "firmware";
 };
 
 &main_r5fss0 {
@@ -238,6 +240,7 @@ &main_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core0>;
 	memory-region = <&main_r5fss0_core0_dma_memory_region>,
 			<&main_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 };
 
 &main_r5fss0_core1 {
@@ -245,6 +248,7 @@ &main_r5fss0_core1 {
 	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core1>;
 	memory-region = <&main_r5fss0_core1_dma_memory_region>,
 			<&main_r5fss0_core1_memory_region>;
+	memory-region-names = "dma", "firmware";
 };
 
 &main_r5fss1 {
@@ -257,6 +261,7 @@ &main_r5fss1_core0 {
 	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core0>;
 	memory-region = <&main_r5fss1_core0_dma_memory_region>,
 			<&main_r5fss1_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 };
 
 &main_r5fss1_core1 {
@@ -264,6 +269,7 @@ &main_r5fss1_core1 {
 	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core1>;
 	memory-region = <&main_r5fss1_core1_dma_memory_region>,
 			<&main_r5fss1_core1_memory_region>;
+	memory-region-names = "dma", "firmware";
 };
 
 &c66_0 {
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
index ebab0cc580bbb2fb2b101450ea7def0bf717be0e..5253d028da0946e6dd619c0adebdfcf88400cb14 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
@@ -190,6 +190,7 @@ &mcu_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
 			<&mcu_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
@@ -197,6 +198,7 @@ &mcu_r5fss0_core1 {
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core1>;
 	memory-region = <&mcu_r5fss0_core1_dma_memory_region>,
 			<&mcu_r5fss0_core1_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
@@ -209,6 +211,7 @@ &main_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core0>;
 	memory-region = <&main_r5fss0_core0_dma_memory_region>,
 			<&main_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
@@ -216,6 +219,7 @@ &main_r5fss0_core1 {
 	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core1>;
 	memory-region = <&main_r5fss0_core1_dma_memory_region>,
 			<&main_r5fss0_core1_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
@@ -228,6 +232,7 @@ &main_r5fss1_core0 {
 	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core0>;
 	memory-region = <&main_r5fss1_core0_dma_memory_region>,
 			<&main_r5fss1_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
@@ -235,6 +240,7 @@ &main_r5fss1_core1 {
 	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core1>;
 	memory-region = <&main_r5fss1_core1_dma_memory_region>,
 			<&main_r5fss1_core1_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
index cb7cd385a1655375931bac1d65fc766ae174234a..a59c3648d8056c8a759fcc536e51bc9adb04a62b 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
@@ -123,6 +123,7 @@ &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_wkup_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
 			<&wkup_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
@@ -134,6 +135,7 @@ &mcu_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster1 &mbox_mcu_r5_0>;
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
 			<&mcu_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
@@ -145,6 +147,7 @@ &main_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster3 &mbox_main_r5_0>;
 	memory-region = <&main_r5fss0_core0_dma_memory_region>,
 			<&main_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
index 455397227d4a1081a1579061208b7e92db32ebd1..d08fd3ff8a8902b7dc1f0f55c251e5546f1bdd2c 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
@@ -262,6 +262,7 @@ &mcu_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
 			<&mcu_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 };
 
 &mcu_r5fss0_core1 {
@@ -269,6 +270,7 @@ &mcu_r5fss0_core1 {
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core1>;
 	memory-region = <&mcu_r5fss0_core1_dma_memory_region>,
 			<&mcu_r5fss0_core1_memory_region>;
+	memory-region-names = "dma", "firmware";
 };
 
 &main_r5fss0 {
@@ -281,6 +283,7 @@ &main_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core0>;
 	memory-region = <&main_r5fss0_core0_dma_memory_region>,
 			<&main_r5fss0_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 };
 
 &main_r5fss0_core1 {
@@ -288,6 +291,7 @@ &main_r5fss0_core1 {
 	mboxes = <&mailbox0_cluster1 &mbox_main_r5fss0_core1>;
 	memory-region = <&main_r5fss0_core1_dma_memory_region>,
 			<&main_r5fss0_core1_memory_region>;
+	memory-region-names = "dma", "firmware";
 };
 
 &main_r5fss1 {
@@ -300,6 +304,7 @@ &main_r5fss1_core0 {
 	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core0>;
 	memory-region = <&main_r5fss1_core0_dma_memory_region>,
 			<&main_r5fss1_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 };
 
 &main_r5fss1_core1 {
@@ -307,6 +312,7 @@ &main_r5fss1_core1 {
 	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss1_core1>;
 	memory-region = <&main_r5fss1_core1_dma_memory_region>,
 			<&main_r5fss1_core1_memory_region>;
+	memory-region-names = "dma", "firmware";
 };
 
 &main_r5fss2 {
@@ -319,6 +325,7 @@ &main_r5fss2_core0 {
 	mboxes = <&mailbox0_cluster3 &mbox_main_r5fss2_core0>;
 	memory-region = <&main_r5fss2_core0_dma_memory_region>,
 			<&main_r5fss2_core0_memory_region>;
+	memory-region-names = "dma", "firmware";
 };
 
 &main_r5fss2_core1 {
@@ -326,6 +333,7 @@ &main_r5fss2_core1 {
 	mboxes = <&mailbox0_cluster3 &mbox_main_r5fss2_core1>;
 	memory-region = <&main_r5fss2_core1_dma_memory_region>,
 			<&main_r5fss2_core1_memory_region>;
+	memory-region-names = "dma", "firmware";
 };
 
 &c71_0 {

-- 
2.53.0


