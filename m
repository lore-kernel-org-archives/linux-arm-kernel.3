Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E267BC53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oKR5EQZaAb5JzRjyGYBccfjPcYcwdvM+SxPKeULRWj0=; b=gF25vu3mUKY2omNmuOqHk6IXg8
	I2JOSAnwbJIRp3G+fM+R9yBAlVfC8Jx452LTNL/kwNxddXQUErLOBjRerxxrd8iSJ7sYzkqGC2zHi
	ape7QlNYbYO0sz4SNGJNO3GvLEa/HDHpGYhx88sBDYiH9xiH/1YazdktKtaUiOUyIWyq/c4l4GFCb
	ebAdhRaPTWpn8I9oV99rA/gPxTLxOopRs4AQURwbovlW4WyUq143b2DYHlWxxYGiip8YxPPww8mii
	s91wBK4+qrdvhPCemKz3UqRuHGyusnruNMQaC6GqakvKAfVbkOV20fqdpECFwm8L6rXHZ+COzzoFI
	8fKEs17A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKRw-00000002guk-3eEf;
	Mon, 27 Jul 2026 12:28:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKRs-00000002gru-3Bap
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 12:28:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1785155328; x=1816691328;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=JkNlRyaOOV3pTgI7mHQS2o4Wmw7D4SylfoNccbioFoY=;
  b=QVLo7VmyEWxmvxd7680zltWawZKAPpa2LGcwnFJ5uVsTEOvYK2cxin17
   sf+CRaMkCd8gq1PgeLa/zaJ5+3KRY38LMn40AEJkdIXB5icQ6caJYEjc5
   gm9Xnq9pfuV8RPKWbZsfPbkHgq2bwr58tTE5/zUydxci9XCcRbEMvFlyx
   mqWKJxI2QwbFe3N1Ag8cU0SKExr6oqb8t4Npv7luaegQhbQlDo24Exfir
   lI1rP87Sue3NVH3FTPy3nuiwx732y/SzM+AWwE/QdrRSi+CA9bgutVRBO
   NOWQm3U4MeCXL5llzm2DSL2g4L9zha5TUTlFIVrTfTlO1SAfxx1iJl+lc
   A==;
X-CSE-ConnectionGUID: U3OljsMlTKOz9+ezaOmjlw==
X-CSE-MsgGUID: jXrG0ybbSSG1OAtGd+RPqw==
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="61530882"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Jul 2026 05:28:47 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 27 Jul 2026 05:28:46 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 27 Jul 2026 05:28:36 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <ehristev@kernel.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <marcelo.schmitt@analog.com>, <radu.sabau@analog.com>,
	<Jonathan.Santos@analog.com>, <jorge.marques@analog.com>,
	<joshua.crofts1@gmail.com>, <jishnu.prakash@oss.qualcomm.com>,
	<antoniu.miclaus@analog.com>, <varshini.rajendran@microchip.com>,
	<mazziesaccount@gmail.com>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v4 12/16] ARM: dts: microchip: sama7d65_curiosity: Enable ADC, DVFS
Date: Mon, 27 Jul 2026 17:56:29 +0530
Message-ID: <20260727122633.117435-13-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260727122633.117435-1-varshini.rajendran@microchip.com>
References: <20260727122633.117435-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_052848_867088_50EFBBCD 
X-CRM114-Status: UNSURE (   9.36  )
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

Enable ADC and DVFS on SAMA7D65 Curiosity board. Configure the necessary
power supply (vddana, vref) for the ADC, and enable cpu-supply for DVFS.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
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


