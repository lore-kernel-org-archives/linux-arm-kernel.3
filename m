Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476EB106705E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 15:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=godpTaFXAY2ep8bhfkFW/rBnOk7asG87yrTm6n99gBY=; b=S47185ThlEcy/3E2EbpoHYMnr5
	MtEQGVy/BsGTCs2ZiNv15EIx2BdHaQx90CkCBwwH8ccJymtQ68qmdgg/gh2pVkGCdsHcnlM5VqlGq
	Y0jmjmu4OQkjt8iQPcNPgeY+gLLKJZHXjgmBSpjSGSQ94iwqRjBDSdpm/JaQJW3YmwC+xXRp/lwZm
	xLbfjh3G3zamwUR9zy/3fwNWdoWJIuSbk39Q9sL2B79Jtj1FomOW8+yVMAWVP3RgJJAH59vK3hwbv
	UGvm3TeJiIL15IJPpRtAf5SVs/NY08V/7nGkuraxwE/Wp+j9nceFshGLySJ9VT42Zo6Khl89fEGkV
	VuwT44sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iJ2-0000000ERhY-2ipW;
	Thu, 12 Mar 2026 15:50:36 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iIi-0000000ERVy-3j3p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 15:50:18 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48534b59cf3so10926235e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 08:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773330615; x=1773935415; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=godpTaFXAY2ep8bhfkFW/rBnOk7asG87yrTm6n99gBY=;
        b=E4EGQePYQ5sZw2aW/Mrr/Xw/VGTQWCjZkQE1joSFAu5f1QAVTerhC/u6m7sjSWHsho
         SWTP8yH0MaMwd5miVyRbwAoCFiwyOOyIrDLtb5JWlEJZPWyDrEIT4nHRcvkOoCostZIw
         lLKHxUcxV6TUsI43EafIdGFYuBc83qvP4Ye3+E1SEo9G3bpph7preMznqPk4UExMaDxm
         A7FFibB7IZJ/wyykE1XE/15TJ50aJLRSTotlEaQhMktD2BRhBqzfwEvpYIf/MolbTqC4
         SPIFu/UKk5lHKBVidxSxWUtyz1FKIVarHDwSNvMMVwB+1Ew4nDxKHNFAhzEAyyNj2wOp
         lYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773330615; x=1773935415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=godpTaFXAY2ep8bhfkFW/rBnOk7asG87yrTm6n99gBY=;
        b=uunS5CS+JxnlwAdgFGV1DYx2NkldQc2QS7LjO3FETvz827W2kJUKwjWKbHuTr/6V1D
         gMsus7uylL6B79zvH0q1oVZZJ+yuovMUInPS5QUY7nOjaW8yOmI/6Ol0KCphB5XYPPV2
         h7fmEkZGV8s5aoZ7soEaH/APGjZEta/HMaQTOat0jaXg9u6r1DLYs3va5/LpxJjD7uQV
         lIOk2AjWDtrCLbRs2UhwJ5goFkGWguXvGUMpmieYV3b9zEC0NliU7jYjbwaliQhTepU6
         FJTLbhICIR1mQBq+RpumJJKSdvw8tyZcjNme2hEqFcOHdVec0zIfDpYWETuJAjYcCiAj
         r3Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXC7kCKpOK4kbdOaSO9KV0ePi2uvbrO4Dhs0hvgzyqZMwZoNACBKDYKR0XZ/E2zb6j9HDOfmx5zlYThQpaKFKKh@lists.infradead.org
X-Gm-Message-State: AOJu0YwlvcpRI+ym1K4kK2CxZI0EW14vH1v3hYx/ULlCmJnNpm7sNHnw
	uPwwC8gJ91VQx9u9NG4ErTSfkTcbEIQUEwYlogHnWzagPileA7/NWkAX5soQvbmttX4=
X-Gm-Gg: ATEYQzwGNJAtquhk3PJZ1HF/vzQ4Jsvid9ZtcPKvToo3AaqJ42qjG2ISqBx4YgAY84X
	hKRyaw8HxGDlYdmW7eyGlW/8pVNlEzxt7vHXZKY/CWaFN8YFw+OiGVSwsesvOQSDEY1hdFEFSsk
	AB7sT7vNpVacKbvWWi1GKUubZibEbOxLklS10GSdxxXJSQVjdnTFfCDziX7o5J6A6b1OiRRpnij
	Ql7KSvNIAEtX6q0lyvy7MqdrFuru22M0qbsPhJjMOZgZg867gtUqAmqUQcm1xAUPMNyAGkIpVFf
	fqTuOlF+ICvNhgLg2xizeH78HO67vYzkRa8F9JndMB7dNm+s0yxGRvVJcqkcW5nVmTGKT58/lkc
	bMer9DM6qvZwbbSbeTnXcEN3LcxwU2wq/BEZCKVPJSSyWJqmRG25Vs+jMbnccSgvlOjP7musjME
	R3c7Ra475nGnDl47o3oEgyi/U7zCVQWfg=
X-Received: by 2002:a05:600c:37c3:b0:485:358b:e80c with SMTP id 5b1f17b1804b1-4854ad76a80mr122016195e9.0.1773330614674;
        Thu, 12 Mar 2026 08:50:14 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b65fd3dsm143086075e9.10.2026.03.12.08.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:50:14 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 12 Mar 2026 16:49:01 +0100
Subject: [PATCH v2 7/8] arm64: dts: ti: k3: Use memory-region-names for r5f
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-topic-am62a-ioddr-dt-v6-19-v2-7-37cb7ceec658@baylibre.com>
References: <20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com>
In-Reply-To: <20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com>
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
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxND+YW9r5sfuzD9GXfCc7e6YXz4g4satwx0+nwnLUah
 2fz5RXHd5SyMIhxMciKKbJ0Joam/ZffeSx50bLNMHNYmUCGMHBxCsBE9jsz/NP+Pj/qzZbMutbZ
 wkyeN1x3Z+qqHrVcb3l8WfSsWMN/pWIM/4xXl7zlnM+izO41b274epHE+DNFtzmF71gv3d4fFSf
 wmQsA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_085017_116009_4A57B815 
X-CRM114-Status: GOOD (  11.49  )
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


