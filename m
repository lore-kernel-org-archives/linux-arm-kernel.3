Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF4910A62F3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 14:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=voyTd2jlBJQRP74fcWPlpmyrOn7UyuGjlvcgxGUNLvA=; b=GOED8kFDytkRkDc7oRM0BaGQhb
	9BS64iC5tY+Bhve9t1YEX4NucLZGHBHdK4YwOVgmUM0FE3BY56mzWpV52XYNfzVnmMCk/qgxwczeC
	L2iGd/OrUfJzXG4F7FLRel3Pz7tjbZF4ewaGXt+9glOGSLHIz9ND/B1pSfLZbwV31DJBxt0Clo5Uh
	AXk2CbJ/QzXiEJXeFceXZNuHzUh2YLzQVcX75pdl0HGTLk0vwfWr292Rtg+QDaREyGNw7t2LGGuCt
	1YwoNoq3CDjE3QT36Nsom65jnisSpOUYXuo7ZSyLRXMSmCEaaypgyucHXbPYV7t9Dot0dMU2liKgA
	s+KkIS9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lqC-00000005fRE-14fM;
	Thu, 26 Mar 2026 14:37:44 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lq4-00000005fO6-3fv5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 14:37:38 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-486fb112c09so10847125e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 07:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774535855; x=1775140655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voyTd2jlBJQRP74fcWPlpmyrOn7UyuGjlvcgxGUNLvA=;
        b=FFsYgr1/ccht/n/Y9vqXxZ8FNJkK2dQP4PpqEgQ2ZoLKt7KLlIpt/vE77ZSVQQzf4B
         /KwRQ811NlBpxNyQaEqfK3V1as70Im1wjBe4XGx1xwU4tl1J0L4+vK9hjbQOI7Wy1to4
         4WJPBgQaqeSigjXrvconnmFG+KKxFsa6hK0FvLAO74wNUE0gIuYU7OsB/rXb3RSZ9v0I
         HvdeQd8hqrAnFCoQfd1RN4sLX1Muuzaws6vfIJFy+uaYHTGdCP7ZFQizFp7ta3cS/Zkg
         0Psr/cl2onbM2Zm9SgNE2Y6OmeYf3hy35a1MEj07eDj9nPtacBvBohrDHWwcYRhTrq2z
         6iUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535855; x=1775140655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=voyTd2jlBJQRP74fcWPlpmyrOn7UyuGjlvcgxGUNLvA=;
        b=kWq237ZCuerzMVMODhu1wsjuJeGfhOAzPbRXmMIdaHmQiP6zHK2jzjMtymj9HXeWSR
         Cwg7/SGcpOrvmZ3ii+E21dVsc14MmqSFiOW8ensKeJOR5QA47PQqjr2AlB4fF2ZLCi2p
         VsezNfhERV6+i/Gzf1ldGY1TLe256VRY381FmjrvBxQr/AeVIJZBuCJ9HCKZ+PJt1Du/
         zIVuHM+yprzm+/6Il/R6Ra1nq++2IQxn6MRzWQFIy/EoTp6i+UgFc8S1CBWtRW6YwMNW
         6xhHcrChXnd2xSG4QGIYyx71KyykliaUEYyiTlRo1nN6+MmDq24+kE/eqtpiK8O1YIm8
         MKLw==
X-Forwarded-Encrypted: i=1; AJvYcCXkbylrT/bZ3JNfaG8yAZ8p+hXmo3eSBo2TBfkPDPBZXo2TKe3D8KvM4Vt7TuORElUG1/LWHOk/cwiJwxqAuOKd@lists.infradead.org
X-Gm-Message-State: AOJu0Ywehuj8HIqrYJLfgOzlKEaMc1zTCKhLg0OQL4yRTimYINd4J67r
	EB2rNXb/YEVIb6JdUufknXLfY94TBbpir8y/Tcy/Z63jLumljRvgOKNdPR/LYgKa
X-Gm-Gg: ATEYQzw+UIYOZLkm4I4mBgfBVVkTE3Sa/TBZ363D/2WY0um398AVzd1s/1Utimrm3xT
	Hw83Kfbo8kVEqIvrZvi4TO0Ls5gu0rLIyQvXu5l0RGvri55lQ8wyJZTY+Bdb/Syn2HKBCairBlO
	t5+7ouFz88SGeGD7x8GjK/ni79EgsYeiA9fuAQmJXS4WMGHo94BPXZmLJY7lOumZ3ZaSaNL0HyK
	+bcXqP+OKv1VIgovwQGt2k4u4JGMdX+pfag/l4BuXSqJCazzhepfciFNy2uc6t7ov3ASRfWrZ5b
	nd5BCIEHZjcx/Mh+KQ9Zf36fJAnLZ/5BTy4h+9TYdFMhjXhRF6qcqN8cf0a6MoxQBNmiC6Mi3bi
	BB5oZIQP8hDzcu4bkKDmePS6LRR+oGgfx+JNbD03uVFzDbmEfrovGZj7NbJqe/+ynqxfEiyZBsI
	xCrtXW+idJX1a7PduXihIUliEUoGDaZYAxiV6aWiIVCCoi72GMj1h2JQbQcGbXzWFIb5/B/QjkY
	3pPOxDwkCRDPZeXSbTnyXdWl3dxK/fl3L5lfYetMn6hSnE+BOWmSCghuInX1GBwuKUyyKdDYrcu
	96mnG/l9pfm7gBi8tGNj
X-Received: by 2002:a05:600c:3516:b0:485:3bc7:a231 with SMTP id 5b1f17b1804b1-48716084829mr125286925e9.29.1774535854830;
        Thu, 26 Mar 2026 07:37:34 -0700 (PDT)
Received: from franzs-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722cb5845sm34024185e9.15.2026.03.26.07.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:37:34 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Franz Schnyder <franz.schnyder@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco@dolcini.it>
Subject: [PATCH v2 2/3] arm64: dts: freescale: imx95-toradex-smarc: Enable bluetooth on lpuart5
Date: Thu, 26 Mar 2026 15:37:05 +0100
Message-ID: <20260326143711.143462-3-fra.schnyder@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326143711.143462-1-fra.schnyder@gmail.com>
References: <20260326143711.143462-1-fra.schnyder@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_073736_969468_34C954F7 
X-CRM114-Status: GOOD (  12.29  )
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

From: Franz Schnyder <franz.schnyder@toradex.com>

The Toradex SMARC iMX95 uses the MAYA-W260 WiFi/Bluetooth module, which
uses the UART interface for Bluetooth.

Add UART support to enable bluetooth functionality on the MAYA-W260.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
Although Documentation/devicetree/bindings/dts-coding-style.rst
recommends an empty line between status and latest property, leave it
unchanged for consistency with the rest of the file.
v2: no changes
---
 .../dts/freescale/imx95-toradex-smarc.dtsi    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 1d369983cf7d..a90edefc5197 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -616,6 +616,19 @@ &lpuart3 {
 	pinctrl-0 = <&pinctrl_uart3>;
 };
 
+/* On-module Bluetooth */
+&lpuart5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_bt_uart>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+		fw-init-baudrate = <3000000>;
+	};
+};
+
 /* SMARC SER2 */
 &lpuart6 {
 	pinctrl-names = "default";
@@ -830,6 +843,14 @@ &wdog3 {
 };
 
 &scmi_iomuxc {
+	/* On-module Bluetooth, UART pins shared with JTAG */
+	pinctrl_bt_uart: btuartgrp {
+		fsl,pins = <IMX95_PAD_DAP_TDO_TRACESWO__LPUART5_TX	0x31e>, /* WiFI_UART_RXD */
+			   <IMX95_PAD_DAP_TDI__LPUART5_RX		0x31e>, /* WiFI_UART_TXD */
+			   <IMX95_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B	0x31e>, /* WiFI_UART_RTS# */
+			   <IMX95_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B	0x31e>; /* WiFI_UART_CTS# */
+	};
+
 	/* SMARC CAM_MCK */
 	pinctrl_cam_mck: cammckgrp {
 		fsl,pins = <IMX95_PAD_CCM_CLKO1__CCMSRCGPCMIX_TOP_CLKO_1	0x51e>; /* SMARC S6 - CAM_MCK */
-- 
2.43.0


