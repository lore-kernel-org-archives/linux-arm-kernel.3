Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77511091904
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 18:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tlCReu0S/csjkL3628OmCFhensI/pGag/I8DUVwMu3g=; b=heEAnNnw9EJeTkQEMRfHlqWcmU
	5Z7IWj5eIz++B5aNroSVpE/c99wfLt7WuscPKxsCNg8AaYIBgaaS2jJCdUOkP3NVc4tCPdPU9sAzv
	XyGMxhmLGnhYAey+/bPqHmeAK0KravR3PzanCUhHWCw3hXDlWJZ3m/qhPiuuuNzHbmAh4qGZ5C+Yx
	gH20FDluGvtkZlpUMbYX02AknYou4pW6jwlkZTPB3QtNGbJG9m3k+U3YMyczbLxcJ6EYsywh2eWmE
	dYus5ldH47BOXX6nlnNXXOqdeCfaOc60SKiVVzlisX38Idv8ksNCAzJZNvMY9UkAWDQxbZEe7qzVc
	dg9mCvpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IJy-0000000BNbJ-1x0W;
	Thu, 19 Mar 2026 18:42:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IJr-0000000BNT8-3A63
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Mar 2026 18:42:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tlCReu0S/csjkL3628OmCFhensI/pGag/I8DUVwMu3g=; b=fEvtObXD0kCu+JiQGeIOanZ0a4
	Z1D2GRKmfblXd8T4yFql2wUISqPW+tl0j50gTGFs/4hqU8zc9Jw9Nr6osOn9LW9KKxhacQcHmxXYY
	bCs2A+VXs6SCg0dqNZB7xFzkv7bxna5ZHICRnS46d8F8aP4yXITymSt1PIesoPs4V2fH+00xhOmCQ
	Rs9fkNsckVm1s/O5/4YkneVOuXqxpMRjSuz3q8h+nYPz0Ia9Q/VqRWNyAEVHe+TtYxfQ+HRuBhGLu
	lwFDUkduIgVOXyneNtjN5quATcecbvYPLwaay4w/aNyxrhQ8SR2D6OjiA1lPfCPk9Zqc0vjGGcF7C
	dZj3lk2Q==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IJm-0000000EH80-2Eh9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 18:42:05 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-485445e80bdso11214345e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 11:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773945721; x=1774550521; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlCReu0S/csjkL3628OmCFhensI/pGag/I8DUVwMu3g=;
        b=AB2l1PyCCuDqWS51YcUHcfRSNM2Ub50gIlt2pfq1IHtp4FnCSqE1qLcc8TbRCm2DB0
         tkDfiU8LDkm/6E69O3h0Jk/7mKYRLgO0eawq1ysUyxaB/CY/JZI11Zl8/JCtU0ZKF0St
         A0CmZ8201VhbRTlNAQ8VgfM1hdMibNxj+tFYH+awsh6SLp1Lc4bLx4N3hbBzKDNi1eg6
         QXVVpz1TDcsdVVFtYSX//ooD7fSTgKOq2kPncdZnn+sjQIe0LWtNoiAlETqvyhtucGEc
         LHDycETJbxEYf7UtNilZ8SI58pOTRdCC4g5klUfrrB0LfkeVNqBUpJ2amP90RelwG4Xe
         i15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773945721; x=1774550521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tlCReu0S/csjkL3628OmCFhensI/pGag/I8DUVwMu3g=;
        b=HYgjB7qLYCZZkJWAIza5ba+Z/B45C+89W8+FYnTtgEZu0TAfNiDPDCR3L8+5DWQTZ0
         iHfHD8XGtJ6Zu+Ak5XCbfvk06k7jKmTQFWfW3L5BCJltF02Emc6Pg00nZZUkcQySDgxk
         j/ALujv/Xy5deo7juiOPVXzrWipCdrTdObpGMrJGtSotf9gpNjMoBJTajN8R2AXW2fhd
         JZsMrL85Lb5ax4lcKfQAEJ7rSfmoxSrJFdw865+pv11rYqtL+lR9dUo9nP0blxJlCdYN
         4PsvrMyW5yhyC6QX8qhKIjs8bNKgZ3lIYHG15vFQMiEyZhinfEio0ez1EI8cdcCDF/Oh
         Fd3g==
X-Forwarded-Encrypted: i=1; AJvYcCWlu4VJVhRz6I82S2B2d7Td8/EjqwyMHiwgsO5cmqCND3IHpj5AUPl/8MkTTz7Xrl8ZGrUfFql4lTYhJxq4aT2L@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn82us237kbXPIhZxPR3a38UGJ9KcSy2TelzggkwHvK6rMOR9m
	2tfwuXgwwwCWlVLZhCY+C5zQFv7cRI8L0GwsBouvKMtFMKNlzlvdJKES
X-Gm-Gg: ATEYQzy+VTYWI0xEQEyhU6pw1yBHybPLE9kqdnsoD9ysmZ6eRN/ijmCfknSvhXZInla
	fIEfDxQQskJr2AYzSJGEMmRHle557PtbHoQA0ylHUA6HmTXBoAX1La0iveZLUTX2vzLNgWD8Uvo
	KmW/eoU1zS16gJnVjNXA/XGcwc3HekERsOXPdzcnF6+v7GS/Ma+SisBzzYxh2lVfRFZBgS6h9a4
	tLWMEuj4oxKtHtpnJqbTYiy6TDM/HgWDR8Z3rcRSZJFeQuis45wP0G+3uj+COVlJ1WtDKzCevYv
	AW53Qw9T6ZRm7l+HM8G3eEzsmBOGaUSkq6AFV5UhMhi4CR9Az2W0iWbA5NpMw2AeBTfjQuTCkzm
	dfsIpDNMtKQ5hm+WvKQoZr33V9ioVTXOnC3ENJfusx8wBeEN2Z/VVY51edHzNsQpkkzGtpI9yWm
	rdLFYGEplUcT4uLWTJpwoVjQ2ry9bQXWmIv7fj2EoiMZaXnXdYruTCSE9bRIutt6nAkZvU9+/Jk
	bgeK67mYE8kx3cy5Dt4CBGh1HZwTVnL50Znk9Y=
X-Received: by 2002:a05:600c:19d4:b0:485:4278:24f0 with SMTP id 5b1f17b1804b1-486ff03d9d4mr2150745e9.30.1773945721076;
        Thu, 19 Mar 2026 11:42:01 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b1fe65sm77289195e9.5.2026.03.19.11.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:42:00 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 11/11] arm64: dts: imx8mm-var-som-symphony: Enable PCIe
Date: Thu, 19 Mar 2026 19:40:31 +0100
Message-ID: <6c4f4ee33a3c8cf2c36de57bf4f0a706334c10ed.1773944896.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773944896.git.stefano.r@variscite.com>
References: <cover.1773944896.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_184202_637848_32F73792 
X-CRM114-Status: GOOD (  11.27  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Enable PCIe support on the VAR-SOM Symphony carrier board by adding the
external reference clock, configuring the PHY and providing the required
clock and reset properties.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Move vendor properties to the bottom

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mm-var-som-symphony.dts | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index fbad5d2d4a97..857325ef4461 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/phy/phy-imx8-pcie.h>
 #include "imx8mm-var-som.dtsi"
 #include "imx8mm-var-som-wifi-bt-iw61x.dtsi"
 
@@ -17,6 +18,12 @@ chosen {
 		stdout-path = &uart4;
 	};
 
+	pcie0_refclk: pcie0-refclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -198,6 +205,29 @@ &i2c4 {
 	status = "okay";
 };
 
+&pcie_phy {
+	clocks = <&pcie0_refclk>;
+	clock-names = "ref";
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
+	fsl,tx-deemph-gen1 = <0x2d>;
+	fsl,tx-deemph-gen2 = <0xf>;
+	fsl,clkreq-unsupported;
+	status = "okay";
+};
+
+&pcie0 {
+	reset-gpio = <&pca6408 1 GPIO_ACTIVE_LOW>;
+	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
+		 <&clk IMX8MM_CLK_PCIE1_AUX>;
+	clock-names = "pcie", "pcie_bus", "pcie_aux";
+	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
+			  <&clk IMX8MM_CLK_PCIE1_CTRL>;
+	assigned-clock-rates = <10000000>, <250000000>;
+	assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_50M>,
+				 <&clk IMX8MM_SYS_PLL2_250M>;
+	status = "okay";
+};
+
 /* Header */
 &uart1 {
 	pinctrl-names = "default";
-- 
2.47.3


