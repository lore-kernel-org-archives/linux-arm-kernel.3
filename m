Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BA7C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 00:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PY79EKzRYcaTfBmkEn1plelmE3wgG6iSvl/aBwK6Y9E=; b=Yc3jYFG8gxL9Jn7IVHC72JfsW5
	7RU2B+91kjAHxMfarwV8mUODPBZU0vEzzsR/4Q2eIZxaeuUJEpWkZoQ/AUanD4LYHWuvp4+8izBx0
	MfiEN1R0lKytmXwuLb2R5xUsiGDSc+HM2lvp1v8CV69cEv1PJwj+WmiXUoiCpIqYFstMkIW383Lu4
	3THtQPmsXSdrVi99+vf+Vk/BLfLOQAW+A1f64sV352341QYg9jXDn6poRPBmYfw1HoMD79iVSzjjH
	Ply4zFOu+zMTvxRzTuId5dxuKDv08+VbPA/R5138xlJeyZaZxPA/Mr2ZMVnKfx6HuiDc+oOUkmevR
	i42fVwqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWOu3-00000003jos-3pnT;
	Tue, 01 Jul 2025 00:31:15 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWOnE-00000003jR9-2tUF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 00:24:13 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-60c6fea6742so9655139a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 17:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751329451; x=1751934251; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PY79EKzRYcaTfBmkEn1plelmE3wgG6iSvl/aBwK6Y9E=;
        b=E7kU2ijk3LAKavwmljoVcwKXtf/1lqP2tNhuvEtKS2VtDPRZmdjAlUZOUq6Pwy4eRi
         T97a9tHCN3KhbX2r89tWDuGeRN8k6aTls7Wqxe/eVwCQvVFRRAppd/qz396i65kRwMzU
         rNsxhQhhB0zzhDhwuUWXGTWUGt+Mf0NJ4ZjvX6ngZ6j2SVFkEmRZKU3PyZm73P3R4yJe
         yKsugzfIFfAFQNotHgLx9+G2FrD1OCLkqiBOWZ7gz4pIGW+O03QKyGonF0UsUh5MKLw9
         4gnp7/7vXV6CIS7C5RVMSTraTyTZgNIjzhKe72MszAdEFUmCIAnm6CWMBN1dkS/e9Gsd
         goBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751329451; x=1751934251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PY79EKzRYcaTfBmkEn1plelmE3wgG6iSvl/aBwK6Y9E=;
        b=tuGFSavR1aSSX4PSgc+KpDAUPeQLcBGlCjEcq3zV0ULKhgyskm0LIrjyz+VgNvHL+Q
         lUMCleZQtTylpOxKCdOm+t19fvhRBdDb6WDbbNH8++rAsZpgTuSg3rvtc5yP0QhDBbUN
         TGc/4eG816xc+T6DTeQ7+tKDG0VxsuSk6FprAhVAsCnzREUjxFHFZsUmO9E0z2+tUq4Y
         OoVUXknjZz0vThWt9lFs4c9YLQEltnQRl4E2G4Jn/81XLsLqk3q+DRL0bB5wJdFMylmq
         UMm55BdRfD1xNqiRB2uODU0IH7aq+EpY8XYVNYxRBF6cIfDDXNlBmoYrSu7UNfZU9W5v
         I1Bg==
X-Forwarded-Encrypted: i=1; AJvYcCXxJyD/wPfpzjUQfXTaBwkKAU+a6Nhb3AfnYKHicKxgGjXRomW07+m75sytGqZsyDmKhoVWwYLahVze04p5ZTKN@lists.infradead.org
X-Gm-Message-State: AOJu0YzPubBHxBnm+pe/u2HfA/YF5d9NuWKYJZuGxqtQp1pvPfadQFO/
	LwrcD9yg5cEzSlRLEuaW16cPkOBerLZORVf3xJxyOHkgLjvoaAolOlZ0
X-Gm-Gg: ASbGnctwQ7u0ecgVoY9Wx7OtNNcrkQAB0iykkaArcafvI8xYsDkTew+5DkQFgQ6QK74
	rKRWMWAOHpuw2thR04EyFx16Z6tF4pivIxDKUHFRj3kmz0KlvKXjXIXJUwn9WsSvLwk563pucHP
	J6+lz7TGIdINk1tDNo4BRLjiRVIBP5dTAZw1I+vUzVufs5hpD3Yp4a6MtjnIW4fvAWgGRmLAn7F
	BEMMZZRFuaD9jAHLGJecsesBESodhU3MkJW4DFFpwIgcXxon/roknvn8dp32kKWYg6vmmFrH5Ur
	SPdLzzfE+C3AbeJXdpFNFwZsRPx/Wo5oz9/bpmngILFMpsngUcq3n/xD6Zzzs+qfaIWur4nctto
	FZHd46f/kem28sQHOsDOxvfs=
X-Google-Smtp-Source: AGHT+IEAfpopEL8Ya8sEfPn6VusJkqolqPXZlhfkBFbQaxAdvhUnPxryh5fslzeOetzbNMf/U+Ltjg==
X-Received: by 2002:a05:6402:40d5:b0:606:dee2:42df with SMTP id 4fb4d7f45d1cf-60c88ddd2c7mr14791183a12.17.1751329451100;
        Mon, 30 Jun 2025 17:24:11 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60e26b7ac4esm979532a12.7.2025.06.30.17.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 17:24:10 -0700 (PDT)
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
Subject: [PATCH v3 2/2] arm64: dts: imx: add dts for the imx8ulp evk9 board
Date: Mon, 30 Jun 2025 20:22:39 -0400
Message-Id: <20250701002239.972090-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701002239.972090-1-laurentiumihalcea111@gmail.com>
References: <20250701002239.972090-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_172412_723532_5E4C69E1 
X-CRM114-Status: GOOD (  13.86  )
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

Add DTS for the i.MX8ULP EVK9 board.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../boot/dts/freescale/imx8ulp-9x9-evk.dts    | 69 +++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 4da7501ece17..4b288b324d38 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -322,6 +322,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8ulp-9x9-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
 
 imx93-9x9-qsb-i3c-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-i3c.dtbo
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


