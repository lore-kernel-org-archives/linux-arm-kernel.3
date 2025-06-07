Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546ABC61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 09:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYXpxglNlRn6ZF9PKdL5/2uCcX5/hamtbwOWk6+JISM=; b=IThdLexJr6ZpNHoYi/JklX6mHD
	SMMTIE5k6Fm+mN2qiPj3nsC86LLDppMZ/i/KztUkhock7hzcTFNnQxFuyzOf6ghzoGr2o5ahMpHTH
	7SsBkEn5b4elhEWsqoXG2/Jm4BpCSSiKGElhOKKKoIsOjSvlicAdxVkKlGogPXKvAuFJ2Xlf1myAL
	PMet/gg5y+eh4D7cMaf9W807eRl3BVJ+JGGXiE4RP4Ck84H/HbfxzNN7rr9FZxItYjDRGeJXX4DOf
	Wk0yJ3cn4WWUKxkixLzw7xszHbGNnH8sCJKNap//LLqocDSsWw79Q05HDLOCFvEp2bD+0yr77gboY
	pk1abiSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNq0L-00000001Uqd-1QkG;
	Sat, 07 Jun 2025 09:38:21 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNpvz-00000001UEK-3tEP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 09:33:53 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-adb47e0644dso629279266b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 02:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749288830; x=1749893630; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYXpxglNlRn6ZF9PKdL5/2uCcX5/hamtbwOWk6+JISM=;
        b=jH5R5bxylbvMWM2qgqDCnx+jcp5jhUmzwjE3ky5+iOlxkLNodBdhNtEAZsKhduvQHF
         k0xyHugyvlrUGQHCKjNfV0l8cvNbJlZDKo1fnRYeyWGgCcfbsRbp69FQLJhDq8OghXyY
         +3ZoUOgQUWuGBafFOtrTWNup3Hi1kv0HnQAk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749288830; x=1749893630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYXpxglNlRn6ZF9PKdL5/2uCcX5/hamtbwOWk6+JISM=;
        b=IakVDl9xnYeZeeMB4CFMre04klcZ/3Nafz2TWLyd96/mW6V+5jRX4SYKZaWH9KudxD
         UK3MpWipGCI6FhYnLJx5J1kOgAjQZZ1fIKvVcrsjEnBFrKpZR8sFw74EaC+Z5/3yEUOL
         gAYBAEmpU4DtkE5a7GKRMHPW5X8zjOQq8qqlVHqQG5qnVwbi3wqhI76KHSPYk5W0c48l
         xnIbTZ1rdX4dyHtbYDb2TAAUVklnD08D5hGae6HWs9ZPTC+nqgrGVjgEYauXIPgErUhD
         WueE0j65AuiSGyKDNsPaP9uGWzzAe1a4/C89C3xu4raGu9InkLmmvm2IsPnZ6z4dUEnU
         Xl9A==
X-Forwarded-Encrypted: i=1; AJvYcCXLdg0TcDKnAv/jLU/UEzRB1bqkfg/iveEJOEn6hlsTQYzeoQGtoICgSU369eWurob157WL43ll1/YaCgOyXlMA@lists.infradead.org
X-Gm-Message-State: AOJu0YzcOfrkW8uOieONrui4kqSesgmE6C1tsxTFGhM84a0JKaxMcT1g
	9OH8AbmSCF6M2MyQ2CYeKqd/uNQPHIx9yG19QKdJHtDot6pchYrW2Yme/tTs7s4ypxo=
X-Gm-Gg: ASbGncsBenf3FQk02syDZh44MxoQ88k+VLA+Ln2uLh0U0QehZbN09y2yoYn82HfZnRE
	8ah9AWiVYPYeS/GUUpTx7j2CIpOTnwVl7OHCNFANS4Dd5U9wG6kMDKI0GWCTPqSKmAWZElmJPAY
	dQu3Vc/lbBbC6RoYcbdcfaCNU3/ByeKqGro+jR0o15+mS7rcO9BZx66IrQ4iBqPVXvMADHRRxSK
	AxwAS4d9Lj1s/RqIqMRNgrW6jrCIiLOkvs/ALuuPB2iFow4I9HOcyAvJxVwItlsPrTABn2/1B9o
	XrQjlMgqBATK4e3G0CVB8nynvetmJsJWD5zQ7ijRXU0oFP98WfhSwQwS1SOWWgDv4tovs0YkgN+
	p7IcFcR9ijOD5qw5X3DxtFFF9P5whRpYLZGmZB8cmqK6blMVxF3jgjSkFC9Ec/MM45q2fkYI8TB
	EoL2dXG3EUY5z6T3uWvMEvFUY=
X-Google-Smtp-Source: AGHT+IFwrSoT/bg84mvJeB5tJBoerkyokpFv/ZBrKGOCSANMJJ0LsqpRieQ9b6Ay4j+aF5bsl8WiDw==
X-Received: by 2002:a17:907:6ea6:b0:ad8:9ca4:af7c with SMTP id a640c23a62f3a-ade076350e8mr993166366b.17.1749288830301;
        Sat, 07 Jun 2025 02:33:50 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c316sm251541066b.98.2025.06.07.02.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 02:33:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 02/10] ARM: dts: imx6ul: support Engicam MicroGEA-MX6UL SoM
Date: Sat,  7 Jun 2025 11:33:14 +0200
Message-ID: <20250607093342.2248695-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
References: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_023351_966716_379939DA 
X-CRM114-Status: GOOD (  12.87  )
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

Support Engicam MicroGEA-MX6UL SoM with:

 - 256 Mbytes NAND Flash
 - 512 Mbytes DRAM DDR2
 - Ethernet MAC

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../dts/nxp/imx/imx6ull-engicam-microgea.dtsi | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
new file mode 100644
index 000000000000..8588e9ad7b8f
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2025 Engicam srl
+ */
+
+/dts-v1/;
+
+ #include "imx6ull.dtsi"
+
+ / {
+	compatible = "engicam,microgea-imx6ull", "fsl,imx6ull";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enet1>, <&pinctrl_phy_reset>;
+	phy-mode = "rmii";
+	phy-handle = <&ethphy0>;
+	local-mac-address = [00 04 9F 01 1B B9];
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			reset-gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <4000>;
+			reset-deassert-us = <4000>;
+		};
+	};
+};
+
+/* NAND */
+&gpmi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	nand-ecc-mode = "hw";
+	nand-ecc-strength = <0>;
+	nand-ecc-step-size = <0>;
+	nand-on-flash-bbt;
+	status = "okay";
+};
+
+&iomuxc {
+
+	pinctrl_enet1: enet1grp {
+		fsl,pins = <
+			MX6UL_PAD_ENET1_RX_EN__ENET1_RX_EN	0x1b0b0
+			MX6UL_PAD_ENET1_RX_DATA0__ENET1_RDATA00	0x1b0b0
+			MX6UL_PAD_ENET1_RX_DATA1__ENET1_RDATA01	0x1b0b0
+			MX6UL_PAD_ENET1_TX_EN__ENET1_TX_EN	0x1b0b0
+			MX6UL_PAD_ENET1_TX_DATA0__ENET1_TDATA00	0x1b0b0
+			MX6UL_PAD_ENET1_TX_DATA1__ENET1_TDATA01	0x1b0b0
+			MX6UL_PAD_ENET1_TX_CLK__ENET1_REF_CLK1	0x4001b009
+			MX6UL_PAD_GPIO1_IO07__ENET1_MDC		0x1b0b0
+			MX6UL_PAD_GPIO1_IO06__ENET1_MDIO	0x1b0b0
+		>;
+	};
+
+	pinctrl_gpmi_nand: gpminandgrp {
+		fsl,pins = <
+			MX6UL_PAD_NAND_CLE__RAWNAND_CLE		0xb0b1
+			MX6UL_PAD_NAND_ALE__RAWNAND_ALE		0xb0b1
+			MX6UL_PAD_NAND_WP_B__RAWNAND_WP_B	0xb0b1
+			MX6UL_PAD_NAND_READY_B__RAWNAND_READY_B	0xb000
+			MX6UL_PAD_NAND_CE0_B__RAWNAND_CE0_B	0xb0b1
+			MX6UL_PAD_NAND_RE_B__RAWNAND_RE_B	0xb0b1
+			MX6UL_PAD_NAND_WE_B__RAWNAND_WE_B	0xb0b1
+			MX6UL_PAD_NAND_DATA00__RAWNAND_DATA00	0xb0b1
+			MX6UL_PAD_NAND_DATA01__RAWNAND_DATA01	0xb0b1
+			MX6UL_PAD_NAND_DATA02__RAWNAND_DATA02	0xb0b1
+			MX6UL_PAD_NAND_DATA03__RAWNAND_DATA03	0xb0b1
+			MX6UL_PAD_NAND_DATA04__RAWNAND_DATA04	0xb0b1
+			MX6UL_PAD_NAND_DATA05__RAWNAND_DATA05	0xb0b1
+			MX6UL_PAD_NAND_DATA06__RAWNAND_DATA06	0xb0b1
+			MX6UL_PAD_NAND_DATA07__RAWNAND_DATA07	0xb0b1
+		>;
+	};
+};
+
+&iomuxc_snvs {
+	pinctrl_phy_reset: phy-resetgrp {
+		fsl,pins = <
+			MX6ULL_PAD_SNVS_TAMPER9__GPIO5_IO09	0x1b0b0
+		>;
+	};
+};
-- 
2.43.0


