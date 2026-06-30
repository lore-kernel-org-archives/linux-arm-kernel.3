Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC77C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2a1mnDATU3rjNwrWQnwosxfWi/qt8kzSdDv1SrAIjcE=; b=IqQ4p9l5CsHz7cYU1t8OP+C/sn
	KyhqwQ0f9+ukyngKJK0GKg/TVs6AzRJbIBIUdczHTVxUSI+OPAsU9caGQXG4ac7Ut7suk5tXMqKEc
	QNO8jQ2+daZnCAQtt/mQOBWnlqEdAM9zVWcQ00g48/46lrTifKjRmlJPlVmWLKwGqebcFCDpC7HoZ
	xeZOxd546SsNOOb1yj+a6L1Vy+BBxXZGyhp20t+sat0OKCVtWhrXS7S8dFYtvVvVCuOuokvmMbyx6
	szAI/zpJAZoZTax23rDchqxECzI3wSmd4QuFWJqKelkgTmovN/5Qwy2jMm2/XZTeax/PNokoCvTVJ
	JBd9IO4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUv0-0000000GT5g-0Z5o;
	Tue, 30 Jun 2026 09:38:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUuq-0000000GSxR-3ULO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1782812284; x=1814348284;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=vyyTTSbuj5h3Q9OgBsXCtnnt+Yw0U/fLWgoQLk2IQLk=;
  b=shgLOXZEZxI9ybM/8X/VoOE7dECSoQgkR9PDUXej0SxhpAkIQIkcle1u
   28rpG1Z7yIC4R0jurzotaRR0LeQHTW/xqUcUE3/9ZcESEixaCpcTSs8rv
   Ub0FswnEzApJ8wtpQvzovwDrc+WSs5Gbd1dLJqepdzawZgHFeDDXDzCas
   EjzHbABuLNYjVRctQXLGlIBk9+TfQxM/VK7/z30pyvGIPUhTtHh6QYQFZ
   UR3ewxULhe73VW6I70IP4cCCWY0ArNNPPdIj8npxf9dfHmB5AiYZGr4ea
   dzjag7neG9Uk//bR4X7wt5GlrBUAZwIKV2BYcwS0huSP1K8B0p5MaKAmj
   Q==;
X-CSE-ConnectionGUID: lmxtWMPfT9qZ8eisWbDhNg==
X-CSE-MsgGUID: 4ZgRZ3I9Sl2FVcUhaLvleA==
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="227053725"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 02:38:03 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.43; Tue, 30 Jun 2026 02:38:03 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 30 Jun 2026 02:37:55 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <ehristev@kernel.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <marcelo.schmitt@analog.com>, <jorge.marques@analog.com>,
	<mazziesaccount@gmail.com>, <Jonathan.Santos@analog.com>,
	<jishnu.prakash@oss.qualcomm.com>, <antoniu.miclaus@analog.com>,
	<duje@dujemihanovic.xyz>, <varshini.rajendran@microchip.com>,
	<linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 09/13] ARM: dts: microchip: sama7d65_curiosity: Enable ADC, DVFS
Date: Tue, 30 Jun 2026 15:05:59 +0530
Message-ID: <20260630093603.38663-10-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630093603.38663-1-varshini.rajendran@microchip.com>
References: <20260630093603.38663-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_023804_953548_FEE86345 
X-CRM114-Status: UNSURE (   9.57  )
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
index 927c27260b6c..c2d1e5308170 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
@@ -79,6 +79,14 @@ reg_5v: regulator-5v {
 	};
 };
 
+&adc {
+	vddana-supply = <&vddout25>;
+	vref-supply = <&vddout25>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_adc_default &pinctrl_adtrg_default>;
+	status = "okay";
+};
+
 &can1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_can1_default>;
@@ -97,6 +105,10 @@ &can3 {
 	status = "okay";
 };
 
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


