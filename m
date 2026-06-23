Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73089CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 11:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ajgOGUJv9E70qzuN1Ayyd91FsOg/9niwoGshRkWAwhM=; b=GMkh/64poUNfCVXWbZdC5HXR5i
	0KaTppZhl1VIl9HZWNx43l9S/tKQYcx3vt8qtfNP1pOVRYPF5WYPXP0QSwNXcmL9Tv95UjhyhVCu4
	BZcd8KsFlSX4yfx/R2qc0d+Aj1KrzWc6bwqQ8CO+6MJEt6B6w0uqZ3jwha2OI7h+TdSlzZ4mSZPf6
	EQ+cSp/Y7w+vHp7pq0brwxhb//Nc5olDI4Z+HrhvFQlXsAnc9VwT7mTFAgVJ7dDct0BQUYDeR10q2
	5zuKhz9PChIhgjLoBn12oCcbapDYh1CWyYY7s3LcJwB2jk/8qmKhGqCnynWCey5yp2MlZsBjIf2dP
	bLsWmxaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbysI-000000068K3-3eHj;
	Tue, 23 Jun 2026 11:01:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbysG-000000068Hz-2QqQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 11:01:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1782212461; x=1813748461;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=76fKafXWvc1aSYTTJPHdfReuEfuwfXsri5RbkV/LPFQ=;
  b=HpzlVqUKH5IjRVrjAhuEqU40VfotCVAR5g0W+hxwpnJcirQ9ssT8iqpd
   rkZGFetLl6fSPLZjxvFAMSUb+IVTDcUUzv2KU7kgMIydB0iyCw+5hdBYY
   FYz8JIwxbSs7owkephHaizemmexlkmsdABsvZkXkURT/zRgzIH8LuW7wc
   +OITUa8mUtN8b0LHF91VfDL629MMblFHqQuK//oMIN5u3qv913wu9BoJq
   KLD5zGwlVcVzAwz7hT1jEGfcKm/22lG+RhuH/0FSWM6KdWo7j9g99z9Xw
   DjspSR1//MJzw9+B2ZAsFlH6LQlkaW65imLKxdcIZfWkrK9kh7dQc2WjN
   g==;
X-CSE-ConnectionGUID: sHVLvk6LQBK/ABYqEBOqcA==
X-CSE-MsgGUID: b4JSZ4FeQy2DsBzZDMqtaA==
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="58700392"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Jun 2026 04:01:01 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 23 Jun 2026 04:00:59 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 23 Jun 2026 04:00:53 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <ehristev@kernel.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <varshini.rajendran@microchip.com>
Subject: [PATCH v2 08/12] ARM: dts: microchip: sama7d65_curiosity: Enable ADC, DVFS
Date: Tue, 23 Jun 2026 16:29:40 +0530
Message-ID: <20260623105944.128840-9-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260623105944.128840-1-varshini.rajendran@microchip.com>
References: <20260623105944.128840-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_040100_691726_491354F3 
X-CRM114-Status: UNSURE (   8.93  )
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

Add regulator, pinmux and enable ADC for sama7d65 curiosity. Add
cpu-supply regulator for DVFS.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 .../dts/microchip/at91-sama7d65_curiosity.dts | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
index 927c27260b6c..a6a44a176f56 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
@@ -97,6 +97,18 @@ &can3 {
 	status = "okay";
 };
 
+&adc {
+	vddana-supply = <&vddout25>;
+	vref-supply = <&vddout25>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc_default &pinctrl_adtrg_default>;
+	status = "okay";
+};
+
+&cpu0 {
+	cpu-supply = <&vddcpu>;
+};
+
 &dma0 {
 	status = "okay";
 };
@@ -334,6 +346,16 @@ &main_xtal {
 };
 
 &pioa {
+	pinctrl_adc_default: adc-default {
+		pinmux = <PIN_PC5__GPIO>;
+		bias-disable;
+	};
+
+	pinctrl_adtrg_default: adtrg-default {
+		pinmux = <PIN_PB7__ADTRG>;
+		bias-pull-up;
+	};
+
 	pinctrl_can1_default: can1-default {
 		pinmux = <PIN_PD10__CANTX1>,
 			 <PIN_PD11__CANRX1>;
@@ -457,3 +479,8 @@ input@0 {
 &slow_xtal {
 	clock-frequency = <32768>;
 };
+
+&vddout25 {
+	vin-supply = <&vdd_3v3>;
+	status = "okay";
+};
-- 
2.34.1


