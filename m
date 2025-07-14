Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED11FC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 17:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UwBMlHHy2zuqqOIt3wM/gII1DkI956IRm4le60WaIXc=; b=LhD8hubMeMfohlwPFD/+xYkoi9
	CScbNkEWs+3D0nlSma+PpON2IAmx4quziNvH+jwySaB3tKLRXotPO504SliZ/r7Zq4ZpCpTUIkRdk
	Ol8D/kkMbVOrR5mVlMQ1aMXZS19Hz/kuATnAqlr0+Uevoa1bbX4TPU0reIwqMJhBDmq6P0krsjpMR
	bv0UkawIsvIaWO0PL4qXh5EK3gZ7lzB7y8D4OMWOtuCv30/8pO6mUFmDrC1t+QUqNQvSNInJXyyZk
	EmGfcFUr/JXGEI64UddT6SPqf10gptTD7KQCr9L5pipJoDAjEyUHfHG/W4O+bQZsNIWJHVluGwmYX
	kkyOJl1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubMeP-00000002uqD-1rNH;
	Mon, 14 Jul 2025 17:07:37 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKtE-00000002cUq-35ZQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 15:14:49 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ae0b6532345so1001226566b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 08:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752506087; x=1753110887; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwBMlHHy2zuqqOIt3wM/gII1DkI956IRm4le60WaIXc=;
        b=AQOQ7iN1PxsWsBmJhlMWbmmQHKWhjQ8ge0/l1qiNPNlTkphw7B9PtofizEhUklk6GR
         mx2DLw7QCEsEYG1ZuO3x77J15ArJhGpbYp6YOdHOXSq5vEBbIyyuqN47+5nlbg4C15Ci
         kPD/Owfc+fg8M8z/Z6yuE9+GeYwBO6y//aFtKgehSavCo2+mDc1NwoBUfLm05OZMnG+s
         911cBIUqsCPV1r7qTHP2WsmPEjqHPnPLf3j4Lj1LEaPXzlOGF6ZF6Y3cgMRZaJF85QK5
         MF7+ZiL6AkeKz2roaXciGUW1kFI+6PBCsInq7lWLGSkmZpyYKTb5agzK7/qRHN9f5cMf
         BffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752506087; x=1753110887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UwBMlHHy2zuqqOIt3wM/gII1DkI956IRm4le60WaIXc=;
        b=BGkJf4177rdBvhbUmocxryVsgxR0qYA6SHOi2P2p8DUpajhqG861Mp3z7x/auB/naJ
         ABPUQsTsx42/k6sS/Gy8moNbThIbjGj1R3yPbuwwSdHOEZ2GElIJdGLOH3v4W3P3cpRl
         v3GiItjpKAC2E4AzLW61amTYgfsYE/NOPK+xPwYdgUxj74L+aeQMU2XFLpfkVocbIHSm
         LngHPWQu3tumxHZkFJl4JbY9dKji69nP4vnwBAc+qhDUgd0KkVYMAeVWmBGs9BIvc+p7
         8Jix2sRoXxg8LWhrPU5k+d1i1n8s5d0dV+AVPXvg2HMsap8Ob+aESG2SKKXCBEOyJ5bn
         ljgA==
X-Forwarded-Encrypted: i=1; AJvYcCU7jgIa9/AbGTrrTrKBuq0Ak78jmWLSfRVFXZgLQkAPfq5AFtlp+hiRoBUEAhqGRnXhIfTM9MUDuLQ7E+DSUi6Y@lists.infradead.org
X-Gm-Message-State: AOJu0YyLqY+hxXdb/6ntStjCZACd0/kn1eOrkgs9oN4Mz0JjOqbHz6Pt
	b41o55kUQN/mwEtfulSr6y+vDfp1zDCahxFqMxrWwgycvzDn2Z2TLkoe
X-Gm-Gg: ASbGnctCD5vDf+MAIZkDJvQLWEb/qSLXzKbrAO7LIYmuWuaC5emX9x/IhiOGY/iVhrM
	6CZPkc7BMw9xnaz/02MOxnR0A0akBc0wJKHFUWZTD7/LO4bqAAbinzng9v4YBoMODzio27lKYRV
	+DqCS9KR0Jl3Z+dU9829DwPT0sjdqSTJuRHob07UDpkUmN8pci2y/V9ELr9KzOuNQReIDK/Or1L
	K9Lq4KuHedMyVH/tInpugQfF+EGzSkDxeCK7o3iW3VxkkKuqtCbgMhoLibTfzDKNCnxiYagPPut
	sCNTbfi/lunK97T5F6MpBpPn7c3S7mGDcB5WsMNatavRUxG9V6mV5fJIaMJDIPJUaG7Xbfya1MJ
	+aPF2uzLibNE41XmO5NtD3Ize6bXnaQN6f1yL+4PqMguqzDIhub4uazVJLm5olULarDQ=
X-Google-Smtp-Source: AGHT+IHIMKnTNpqJDxY3v0bo2WYrU4HSwD3uCw03bQshJpV99EtaA9dPr7btQW2fPifZaqFAm2Ao2A==
X-Received: by 2002:a17:907:9604:b0:ad8:942b:1d53 with SMTP id a640c23a62f3a-ae6e2540128mr1509141166b.27.1752506086795;
        Mon, 14 Jul 2025 08:14:46 -0700 (PDT)
Received: from playground.localdomain ([92.120.5.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7eec2b1sm847701266b.68.2025.07.14.08.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 08:14:46 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] arm64: dts: imx: add dts for the imx8ulp evk9 board
Date: Mon, 14 Jul 2025 11:13:46 -0400
Message-Id: <20250714151346.7575-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714151346.7575-1-laurentiumihalcea111@gmail.com>
References: <20250714151346.7575-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_081448_774948_CF137900 
X-CRM114-Status: GOOD (  14.00  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DTS for the i.MX8ULP EVK9 board. Some notable differences from the
i.MX8ULP EVK board include:

	1) M.2 header uses SAI6 instead of SAI5.
	2) Ethernet transceiver chip (KSZ8081RNB) uses different pads.
	3) USB0 ID/OC signals are tied to different pads.
	4) USB1 ID/OC signals are tied to different pads.
	5) EVK9 board integrates the 9.4x9.4mm SoC package, while
	the EVK board integrates the 15x15mm package.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../boot/dts/freescale/imx8ulp-9x9-evk.dts    | 69 +++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 23535ed47631..cbcabdfb324c 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -332,6 +332,7 @@ dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-csi.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8ulp-9x9-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
new file mode 100644
index 000000000000..5497e3d78136
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ */
+
+/dts-v1/;
+
+#include "imx8ulp-evk.dts"
+
+/ {
+	model = "NXP i.MX8ULP EVK9";
+	compatible = "fsl,imx8ulp-9x9-evk", "fsl,imx8ulp";
+};
+
+&btcpu {
+	sound-dai = <&sai6>;
+};
+
+&iomuxc1 {
+	pinctrl_sai6: sai6grp {
+		fsl,pins = <
+			MX8ULP_PAD_PTE10__I2S6_TX_BCLK  0x43
+			MX8ULP_PAD_PTE11__I2S6_TX_FS    0x43
+			MX8ULP_PAD_PTE14__I2S6_TXD2     0x43
+			MX8ULP_PAD_PTE6__I2S6_RXD0      0x43
+		>;
+	};
+};
+
+&pinctrl_enet {
+	fsl,pins = <
+		MX8ULP_PAD_PTF9__ENET0_MDC		0x43
+		MX8ULP_PAD_PTF8__ENET0_MDIO             0x43
+		MX8ULP_PAD_PTF5__ENET0_RXER             0x43
+		MX8ULP_PAD_PTF6__ENET0_CRS_DV           0x43
+		MX8ULP_PAD_PTF1__ENET0_RXD0             0x43
+		MX8ULP_PAD_PTF0__ENET0_RXD1             0x43
+		MX8ULP_PAD_PTF4__ENET0_TXEN             0x43
+		MX8ULP_PAD_PTF3__ENET0_TXD0             0x43
+		MX8ULP_PAD_PTF2__ENET0_TXD1             0x43
+		MX8ULP_PAD_PTF7__ENET0_REFCLK           0x43
+		MX8ULP_PAD_PTF10__ENET0_1588_CLKIN      0x43
+	>;
+};
+
+&pinctrl_usb1 {
+	fsl,pins = <
+		MX8ULP_PAD_PTE16__USB0_ID		0x10003
+		MX8ULP_PAD_PTE18__USB0_OC		0x10003
+	>;
+};
+
+&pinctrl_usb2 {
+	fsl,pins = <
+		MX8ULP_PAD_PTD23__USB1_ID		0x10003
+		MX8ULP_PAD_PTE20__USB1_OC		0x10003
+	>;
+};
+
+&sai6 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_sai6>;
+	pinctrl-1 = <&pinctrl_sai6>;
+	assigned-clocks = <&cgc1 IMX8ULP_CLK_SPLL3_PFD1_DIV1>, <&cgc2 IMX8ULP_CLK_SAI6_SEL>;
+	assigned-clock-parents = <0>, <&cgc1 IMX8ULP_CLK_SPLL3_PFD1_DIV1>;
+	assigned-clock-rates = <12288000>;
+	fsl,dataline = <1 0x01 0x04>;
+	status = "okay";
+};
-- 
2.34.1


