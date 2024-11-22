Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEA0E65D32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 08:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkUYvKyBRlVihkd0Zafql9DKHO6tdChaWnjOVcgHrfI=; b=j+AXjfjOJ3GSvcIXZh2t018YXf
	z3BBI2+e3rD6LHjc6s7IR+Ni3KkWzz+C6+N/IdZODJy56jeq361DkoC6Ofgr4tOkQ5QmtD8qhDVw2
	qsu1Ltmx05dTHktXhzmcHlD37lWCjycc0DxEGcDf8BKbxDSfQH5DrCbqEBhZhO+msafS6lzGzpp5e
	86QNcbeVTIjGU2wJqVS3jCkyBCqz1VACBSy4YrpyVXAYCqphDBzY0G9F+HJqX3SMIIAs5fVUnSVix
	TuFJvsDn4l5O4s9H6S/Pi0T6KMUdL70n9K7ReeXwquwBa6AkYQpk2C5RolD+9ilwEuwntzo20YJZc
	TWv6fgqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEOia-00000001tED-1vIx;
	Fri, 22 Nov 2024 08:08:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEOfv-00000001sgM-3ptc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 08:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1732262760; x=1763798760;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x1b5yns0kG4sf7nOEqgzB78tAxBQeRDGz4ZSwFyrogM=;
  b=bl0QVVYPkj5Ji2Md8QlfB5AC3k8pG9KvKAIXzVRpVlWuMq8j9BxAEtQ3
   l8JHuoH9t4UvlogTqNfdEJH4w0fDZ0kD/ho032eKMAPrdrP7IJR+S4DGv
   3/IEEBecl0dJ7a7Jokt669kD8OmZZ9EAcbZ1m2Q2M2mzV0xa7Zg8cXusU
   JthnCEyZ0gviaN4pK1mzkdGZtb0IW8u7gUPsYVfthwynio4KUFtHhm5+q
   iRrDPmTMCyTdJ57XQtxGycHJHkFzd8DmYq7GpfhoCdHsQ4NcZXhHiFeL4
   EZFCmjTqgYvLI30m+hYsUTNRJkrvXLZFbV1D6KeWDLYSCjExIeh7ASbmQ
   A==;
X-CSE-ConnectionGUID: 1R1gq0hdRfOMYCXRCiBJmQ==
X-CSE-MsgGUID: l0P3LG4iRe6wOxoKJnSVXA==
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="265826808"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Nov 2024 01:05:59 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Nov 2024 01:05:47 -0700
Received: from archlinux.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 22 Nov 2024 01:05:45 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 2/2] ARM: dts: microchip: sam9x75_curiosity: Add power monitor support
Date: Fri, 22 Nov 2024 10:05:23 +0200
Message-ID: <20241122080523.3941-3-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241122080523.3941-1-mihai.sain@microchip.com>
References: <20241122080523.3941-1-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_000559_954340_48552D24 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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

Add PAC1934 support in order to monitor the board power consumption.
Device is connected on flexcom7 in twi mode.

[root@SAM9X75 ~]$ awk -f pac1934.awk
VDD3V3 current:   10.675 mA, voltage: 3295.41 mV
VDDOUT4 current:  5.7625 mA, voltage: 1196.78 mV
VDDCORE current: 115.442 mA, voltage: 1243.65 mV
VDDIODDR current: 29.585 mA, voltage: 1345.21 mV

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 .../dts/microchip/at91-sam9x75_curiosity.dts  | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dts
index d453800f8e35..76d7a756e08c 100644
--- a/arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sam9x75_curiosity.dts
@@ -198,6 +198,52 @@ regulator-state-standby {
 	};
 };
 
+&flx7 {
+	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_TWI>;
+	status = "okay";
+};
+
+&i2c7 {
+	dmas = <0>, <0>;
+	i2c-analog-filter;
+	i2c-digital-filter;
+	i2c-digital-filter-width-ns = <35>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flx7_default>;
+	status = "okay";
+
+	power-monitor@10 {
+		compatible = "microchip,pac1934";
+		reg = <0x10>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		channel@1 {
+			reg = <0x1>;
+			shunt-resistor-micro-ohms = <10000>;
+			label = "VDD3V3";
+		};
+
+		channel@2 {
+			reg = <0x2>;
+			shunt-resistor-micro-ohms = <10000>;
+			label = "VDDOUT4";
+		};
+
+		channel@3 {
+			reg = <0x3>;
+			shunt-resistor-micro-ohms = <10000>;
+			label = "VDDCORE";
+		};
+
+		channel@4 {
+			reg = <0x4>;
+			shunt-resistor-micro-ohms = <10000>;
+			label = "VDDIODDR";
+		};
+	};
+};
+
 &i2s {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2s_default>;
@@ -231,6 +277,12 @@ pinctrl_flx6_default: flx6-default {
 				<AT91_PIOA 24 AT91_PERIPH_A AT91_PINCTRL_PULL_UP>,
 				<AT91_PIOA 25 AT91_PERIPH_A AT91_PINCTRL_PULL_UP>;
 		};
+
+		pinctrl_flx7_default: flx7-default {
+			atmel,pins =
+				<AT91_PIOC 0 AT91_PERIPH_C AT91_PINCTRL_PULL_UP>,
+				<AT91_PIOC 1 AT91_PERIPH_C AT91_PINCTRL_PULL_UP>;
+		};
 	};
 
 	gpio-keys {
-- 
2.47.0


