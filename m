Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E657C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rVhAxSVUHOKDK9EZPftq4nEUpfqS/Y2QXtudWHAfnSE=; b=q/5Hph1pHK0CxP/5yHoESQ5psO
	a+YIWKTUEzwAPfHbItFXjswtsEToIlkD9SdFSaiMgy/8BW8QD9dMFhI44nr77uOtlK38euNCWZSoY
	Ttu70fjfpaVKjZgFtwrbwFLMLsqPzxtg0eHCq0w9WlG+mgR1o287I0NyIs2IqMNhWgXyBNNWQnhlY
	erEveOL+LHX7V4C3a/vh5cJRt+bpDurtTPsIQVALRWu5DuPf3+WyPjhaoYa+aFQcXU44AgSDnRPN9
	XQNhRFAnrMUdEGZdS5XuL4FTX33fL4A5mtYypdmtc5m8LGnZeeOELeavOKHtfG5M1f0cvKBgIxW/R
	zEOoPpXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUvP-0000000GTN2-16oy;
	Tue, 30 Jun 2026 09:38:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUvH-0000000GTFw-1vNN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:38:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1782812311; x=1814348311;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=+JAI97nnRrQjRgPPWdsBYZeYFHJ400kcB7mRR/guJPY=;
  b=sP9kVJxJ8fcK76W5ZVrWriWoWyrWsdu55jlyd+gV7HlVhWWSPhJxCQzp
   68v67lhKPzRGRWgx9bJpHlWUgSY2+z/46//eLy691ie6dBGvCPVDeNYVK
   Lc7p9HzXpLhor5q9gTQn0LpLOHRUhKIqaRnUvbj5oduDiKd4b/E5OpZxu
   zw28783VOuzZcJgo2MxFbyR/QsbpAdvMV3hXnsM/NLqmS15S3z7wT/4gH
   bNxlFuB6nnnuDkKxikwmvnQ7UNdcK99SbYxtaRtJhth1ztwyyZoKCYVjR
   mrRf7gOo88T3Wer6Z5PQkka+8RzyuLWhE5MzmeRi3YX8VDQETUyMbidQr
   Q==;
X-CSE-ConnectionGUID: DUuy9YIyS4m07SSKsCxMVQ==
X-CSE-MsgGUID: FbaOAge8Qref46MdaSyAmg==
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="59032722"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 02:38:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.43; Tue, 30 Jun 2026 02:38:30 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 30 Jun 2026 02:38:21 -0700
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
Subject: [PATCH v3 12/13] ARM: dts: microchip: sama7d65: add temperature sensor
Date: Tue, 30 Jun 2026 15:06:02 +0530
Message-ID: <20260630093603.38663-13-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630093603.38663-1-varshini.rajendran@microchip.com>
References: <20260630093603.38663-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_023831_584883_EFEEA500 
X-CRM114-Status: UNSURE (   8.22  )
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

Add temperature sensor node.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index c336f863406d..89904397d021 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -120,6 +120,13 @@ pmu {
 		interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	thermal_sensor: thermal-sensor {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+		io-channels = <&adc AT91_SAMA7G5_ADC_TEMP_CHANNEL>;
+		io-channel-names = "sensor-channel";
+	};
+
 	soc {
 		compatible = "simple-bus";
 		ranges;
-- 
2.34.1


