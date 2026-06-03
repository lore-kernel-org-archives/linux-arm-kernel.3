Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0242CD6E6C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 14:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SfUZSTS0CZscO6d5l/TdgGte3dejtKMX2oAoiuKxV7U=; b=P/OhCm11idD50Fn4u65cl5YYMF
	ayNejy2CdZs5g9/3b7SAk4gLpZvmD2QHKi8mJ8FkSPF6nsJ6vTyUZnHX4vz5n25I9alM71YLdUUzX
	/lQULWVREREAi6hNIHS0qDaGAa90IenJt7PeUyS/dLVXFtk6ljWXKby1JGxXXOXM2piiDo7B8LLA7
	TmrpIn78LcRLd5EEauyNb8NFChKWOQRhj08oGZq8qs5+EckzaiPfT1sf5jalAHKRevmJDPg1ugrKG
	AyO2w+bSMTpDCG1/+rys2lt6awjSu6I/HwDJs9X/SrifbkSWOjDBuLa+mSUqdHI/NAS31R+pWhTcy
	ia9IC0Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmiz-0000000FGwd-0ta7;
	Wed, 03 Jun 2026 14:37:41 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmis-0000000FGnj-0616
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 14:37:35 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4905529b933so102587005e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 07:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497452; x=1781102252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfUZSTS0CZscO6d5l/TdgGte3dejtKMX2oAoiuKxV7U=;
        b=AHI46cwibIksGntLBO5JzDsM2K0BuuDMRpbAKRy4FtuZsJCCYiZaXMRQbAXxf/88Kj
         wSGqPzNyGHf9g1VHH8az3LJxOMWCPzB+RL6yczNVSUnoDckvrnh6rxQJ+Qxpdlzwq/L9
         VibNSZSvjCxBXjMx6kEIRG9jYI6i+tzybGXfQ4rQN+QTbC0sao+WT58yL4BvGT6Xay49
         XC+FSdwV3PnwZkN/LHIw0OhLLQS9lE+VIChnc+S8OVwbtahYwanECCEqrGFCMkevcc+J
         LvKKQDcibo+XzrFAb5evGS6XraMIvXpZpJCTUs9GN9Mfb6ocn/aihAp2ZOA/k7LV5rBx
         Wo6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497452; x=1781102252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SfUZSTS0CZscO6d5l/TdgGte3dejtKMX2oAoiuKxV7U=;
        b=aQM5xyOQA1OmtYkCMwVJ9zswAndIgnkejpB0g7mFgAk6a1NKruPiLw/uwl9KPvAaD9
         KRVubGy3VtEVfcLbXUa76clzGC/6iiJUO7MvXoUHZNtgNa29j31vYiiEXR6iqfkhm3Di
         dAsKzXY71oMSwEha8cX3zJTIkop5LRi1TEdJ6D4vZ0V6hlS0p85rgtWpO/IQtQJftr6D
         r3EGpJeKyKzp2cWADTUNG1DShPv/76btmyigiHYaG2euDh8vd1Lh52OuMNEnJKzXwZM4
         R7ngGFpNbe7bWOHi6qaVKzzi92AMjiiKa3J/yj6lFiQq14E03zdxDDxCabFldy+07Taz
         Yu+w==
X-Forwarded-Encrypted: i=1; AFNElJ+Y6VE9nxt64tcYGKYfdcrzNTO7jBm6tMH6y96/pySY02ldlJu1zo6WA9haPjM9Y81xRyjy0H+VqeSYc8xlEwqQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwV/C9KLEEfWcv+Hr0POE7vSpcubj/gpbQkzg+9j2mr5C/XMTQs
	vG+qOpnktljZhi8ODCzzEo2DbRBtpzDKATWiVVnc9N4coJzfSTQSUuZz
X-Gm-Gg: Acq92OF/QuKwwPvoc1Z7yu2zKBmKJjZdaQbRs2DB5bveSN/Cttak4x6Eji2TxIV0KM2
	FHwlZSVZvlEWoex49JeVU0dwRr3K25OYx8+HZNk0rtM97U9pJmt3Xfn5X5W56ZAiZ1tn+XzbD7m
	/gOTwRVNPooS2MYro3NSKkvtU1ETj9dPtsDxCtqdo92vpx/DscAvUH3LrbiLaeNM/lRkd33a0Qw
	8DNHalxh6nF5i2Frq5LPOyV9kY4GlfcjbO4at3tL5INx/yPIihPZBh5MrwIO1JFCn2gPZQ8c3ZY
	ygRz1gPdRyMFBKPg9nY/ShUmjBLJnXghT2LEsx34/IPft2CXfNYAbh96Jmnu+IogWxlL78neGAW
	4195WsJK9YWK3QN4vsC2CYzAY3qR9/TXTcqt4UIOXAYzJ6V1dMV++gDwPmFQe4ttKbDdLN3hZPT
	/wWXLMiUHnNBjaGP+ewpP6zzFwrOirtHnzPdzgRSEelEVMOGeXslv2QJ8rRu7bgfFzInzQifwbR
	RAO8HkaVVKub1INwwjwBD9UskFw1mBYpyHx+QvOvi/gOz4eTbIIqrxTe2A=
X-Received: by 2002:a05:600c:5288:b0:48a:53ea:140b with SMTP id 5b1f17b1804b1-490b5ed01damr61804125e9.28.1780497451711;
        Wed, 03 Jun 2026 07:37:31 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:31 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 05/14] arm64: dts: imx8mp-var-som-symphony: enable header UARTs
Date: Wed,  3 Jun 2026 16:37:12 +0200
Message-ID: <52dc9b387d337c646718378306e76a1bb70616e2.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780497188.git.stefano.r@variscite.com>
References: <cover.1780497188.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_073734_078463_1545071F 
X-CRM114-Status: GOOD (  11.70  )
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

Enable UART1 and UART4 on the Symphony carrier board and add the
corresponding pinctrl configurations.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index b15ca44b9a92..9500c9bf0f42 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -154,6 +154,13 @@ &snvs_rtc {
 	status = "disabled";
 };
 
+/* Header UART */
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
@@ -161,6 +168,13 @@ &uart2 {
 	status = "okay";
 };
 
+/* Header UART */
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+	status = "okay";
+};
+
 &usb3_0 {
 	status = "okay";
 };
@@ -261,6 +275,13 @@ MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05				0x10
 		>;
 	};
 
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX				0x40
+			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX				0x40
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX                            0x40
@@ -268,6 +289,13 @@ MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX                            0x40
 		>;
 	};
 
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX				0x40
+			MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX				0x40
+		>;
+	};
+
 	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14                             0x1c4
-- 
2.47.3


