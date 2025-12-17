Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F36FD64094
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 08:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e8+/cZk0H8N2WAzWr4PEnz6SuI6lU+scC72gDf6sJvg=; b=AbAheMbT6dACu5D9B06m2oN7yN
	3kJysTGCv691DD3T3YwSCR+nTFKd2n9QOwFx8dWiovUS/PHEde7OhWn6/mNjLV6g/UCmF4wyLK2HR
	v+0FO3PUaCmnUQ7kSGWxgJA7WoEJKtDD2DLxrMWlUlm2IJqJqFvUKMtm6k5Lb/f3NXYSoDQQKu9sG
	YAYdjm5rzd3WrsSFijR+/uekdcYrV0h7xuoA2/MIB9sktHRlJ4dkzynmRMiK6DolV5m+lutQsR3mq
	Xm/oyllbblxV45Ew9V2KUoRx6WXSj1ZR2o0shiEFYiHXdN7mYV7LDbb6wrMkgBKOKWHZTVuH3cXPk
	SaTqB9kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVnD5-00000006NIk-3wT4;
	Wed, 17 Dec 2025 08:48:39 +0000
Received: from mx-relay96-hz2.antispameurope.com ([94.100.136.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVnD1-00000006NIL-2iph
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 08:48:38 +0000
ARC-Authentication-Results: i=1; mx-gate96-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=e8+/cZk0H8N2WAzWr4PEnz6SuI6lU+scC72gDf6sJvg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765961304;
 b=Ltoq19IDo1mXEyuGWwLrdmJGBvtTk46BW7ajl7hWjuAp7MQkafx+Lzr30Y9U0U/b/VkhFjZT
 7HGDUk4EcNvBdZtu9fM1gugAWi9ofmrd+fAqyBpG5R1B9tFrBk8wKJ9m87ZUHQDi3EkCvCeaQVQ
 ABOwqYmgz5ba7IIZbC44KTx+jfijsLgRTi9LLU9+9GXPwIphoHT0bU3rkf0EToPvMgPhbcifUp8
 vjYtImQv245j15/t+YMwHTNPeOER9B/WJ5EMY8dafZlWJzDHSkMdiCf2WuOwKe6TqcrKrnNPCJm
 1B9d6qQAct1i9qaJISlrXtaMA6UAAxJvLS2WlmiYV20TQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765961304;
 b=F3Sgu0fCjgSF6iIdqJy6vWAvP/iiQ1g+KOuLeQ//el/36eBtk6De55yKTdMhLk7Mg681Iuys
 kfcyLAVZT16B4xWQK165MM8zhWpuQaHIWNma+SIbiNN2GxLSHZ+5HytM1GptVKqrxax8DF85Gsy
 9KzrqayyfcCO8c4QmwtfOIixZuR3wz8CWkhHi2W/kG7ri9LOBsqWpDRaYbFWyMt6ufIFMSaK1wP
 0zsANlZeY8VquiWWUqDO/s7w3ydyEyFvgdeCX5xfZfSpabbw/7WkgCEQSdMFgcgsS3D2zs9V3tI
 dq4BFkyfXbrBibePYLSAPp+E4p8v1Cgq42YXt+nbhn1Rg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay96-hz2.antispameurope.com;
 Wed, 17 Dec 2025 09:48:24 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 5FB5A220CD8;
	Wed, 17 Dec 2025 09:48:09 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: mb-smarc-2: Add PCIe support
Date: Wed, 17 Dec 2025 09:48:04 +0100
Message-ID: <20251217084806.41853-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay96-hz2.antispameurope.com with 4dWSB20czCz1TMgh
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 1eff63407a427bebdc6c421623ea4ad2
X-cloud-security: scantime:2.164
DKIM-Signature: a=rsa-sha256;
 bh=e8+/cZk0H8N2WAzWr4PEnz6SuI6lU+scC72gDf6sJvg=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765961304; v=1;
 b=sUxypVaXBSTXUx0IeHtKyekGwKmei5YxFKK1bi7Q2ebDYi+f2ktv6E29lI8AXTiuWxA012gu
 /AYeMyDXNID7vEa1HIygb67141mCCzxQoMSs3WJ/wMoXAGQc4X2x9WNhJKFqiyZcie3SIFljnHX
 QVjYFXF7dE0+Yi2SfHcfMBvvuOFllAdMtizk6edLOQ6yafO7OChjNhy6/cinGncAAjJzs6/ZAmb
 V3+RuEDeZFYDcm4ugd5Ha47gHBXzgvHR5SyWa5Sm3gUz06m+n9EGHaKJyM6xR5pdda+MnBb68/P
 E7VafVWJxukR7OgkEHNjDeggzH3CTEtpSxa6ZWRrYLAYw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_004836_066321_28C4CE35 
X-CRM114-Status: GOOD (  11.21  )
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

TQMa8XxS on MB-SMARC-2 supports mPCIe on X44.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi    | 10 ++++++++++
 arch/arm64/boot/dts/freescale/tqma8xxs.dtsi        | 14 +++++++++++---
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi b/arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi
index 8bfe77113d64b..050ae23c4dc1e 100644
--- a/arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi
+++ b/arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi
@@ -126,6 +126,12 @@ &flexcan3 {
 	status = "okay";
 };
 
+&hsio_phy {
+	fsl,hsio-cfg = "pciea-x2-pcieb";
+	fsl,refclk-pad-mode = "input";
+	status = "okay";
+};
+
 &i2c0 {
 	tlv320aic3x04: audio-codec@18 {
 		compatible = "ti,tlv320aic32x4";
@@ -156,6 +162,10 @@ &lpuart3 {
 	status = "okay";
 };
 
+&pcieb {
+	status = "okay";
+};
+
 &reg_sdvmmc {
 	off-on-delay-us = <200000>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi b/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
index ebf20d5b5df9c..bfc918f18d011 100644
--- a/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
+++ b/arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
@@ -402,6 +402,14 @@ &mu1_m0 {
 	status = "okay";
 };
 
+&pcieb {
+	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
+	phy-names = "pcie-phy";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcieb>;
+	reset-gpio = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
+};
+
 &sai1 {
 	assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
 			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
@@ -646,9 +654,9 @@ pinctrl_i2c0_gpio_mipi_lvds0: mipi-lvds0-i2c0-gpiogrp {
 	};
 
 	pinctrl_pcieb: pcieagrp {
-		fsl,pins = <IMX8QXP_PCIE_CTRL0_PERST_B_LSIO_GPIO4_IO00	0x06000041>,
-			   <IMX8QXP_PCIE_CTRL0_CLKREQ_B_LSIO_GPIO4_IO01	0x06000041>,
-			   <IMX8QXP_PCIE_CTRL0_WAKE_B_LSIO_GPIO4_IO02	0x04000041>;
+		fsl,pins = <IMX8QXP_PCIE_CTRL0_PERST_B_LSIO_GPIO4_IO00		0x06000041>,
+			   <IMX8QXP_PCIE_CTRL0_CLKREQ_B_HSIO_PCIE0_CLKREQ_B	0x06000041>,
+			   <IMX8QXP_PCIE_CTRL0_WAKE_B_LSIO_GPIO4_IO02		0x04000041>;
 	};
 
 	pinctrl_pwm_mipi_lvds0: mipi-lvds0-pwmgrp {
-- 
2.43.0


