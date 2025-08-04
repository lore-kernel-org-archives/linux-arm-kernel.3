Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589A6C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 10:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E/nQ4rl/o6iInk+mGZPjoimFfsXlnxgQTEu/q4G6QFE=; b=NRgkGKg/FmGEAM7sozc/UHpbM3
	28tmguAXrIIPwIOVWJorvfG399FQ5Y+OpHhNQq8jBn6a2CkCOJ9lCPXQ5CuYnYKD0kyNIXcnaIQvU
	66qvmM2deiKGqqKczqZvQuw29Z2R7qtA8aMaPv3EPspopgHLApvN5Z0YiltBTmY/hzpZOI/AgwIj3
	smeCmWupOHmVwWKDs+LBJVsHNuMngunqFO/ePXFseeNlTvt6jFLjEcLQJDcVQ+p2c4cl/alC31QH7
	TBte2IZBV7wKJ6d+tRf25Xy5arBcAqqLfnKRBX5KRmaznSJb9Oy20fkOVqKbwhFZ60gNc6s3515jU
	F3B9L1Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uis4d-0000000A9K3-1vns;
	Mon, 04 Aug 2025 10:05:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uis22-0000000A8od-1zQd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 10:03:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1754301783; x=1785837783;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QiaSZaDg5pwD3xGJiJSSgLa32uZMitwv/bGano/kVtc=;
  b=yc0ITSZAtiO9uew/20i0DKbNiYx/NAg/aZGvjQuJpjJQFJQJltNX2kOr
   1we1QAr0quxvrfKrvyNiZdcfSlcZSZe3yKszpdNlbEkYR7YrhjIBOuNVn
   SeUMlvIlJJ3YlTqFeJeHRw/rkHJNSD838Ui2cOczRD6SmAouu23CO1S0K
   e8qFwYQSzC9XPaHcCpm1+l5Strzupc0Xil3VvoPZI3dt6kY1Tu2+9XBWg
   CQf0T+qfiRPMt6DKb87asCrWHarN2mFSk67phKVLdlbaLG1OCSGPq6tPM
   /Lfil9PeuAtzrew/S3JLKulqE5TXRoxpEyMvDF9S1FGDUf2nlhQ5J+8Tr
   A==;
X-CSE-ConnectionGUID: GJeNwV3dT46CHM5uTLCa7g==
X-CSE-MsgGUID: B4x9i4pqTW2Ob+bdOk4Cew==
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="276166361"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Aug 2025 03:02:59 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 4 Aug 2025 03:02:28 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 4 Aug 2025 03:02:22 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <eugen.hristev@linaro.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <varshini.rajendran@microchip.com>
Subject: [PATCH 00/15] Add thermal management support for sama7d65
Date: Mon, 4 Aug 2025 15:32:04 +0530
Message-ID: <20250804100219.63325-1-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_030302_729634_1601E3E0 
X-CRM114-Status: GOOD (  11.25  )
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

The thermal management system of sama7d65 includes

- Temperature sensor as a part of ADC channel
- Temperature calibration data retreived from the OTP memory for
  improved accuracy of the readings
- DVFS implementation
- And finally a thermal system with DVFS as cooling cell.

This patch series adds support for the following

- New and improved version of the OTP driver
- Adaptation of the above in existing DT, DT doc and ADC driver
- DVFS, OTP, ADC, Thermal system support in DT of new sama7d65

Varshini Rajendran (15):
  ARM: dts: microchip: sama7d65: add cpu opps
  nvmem: microchip-otpc: rework to access packets based on tag
  dt-bindings: microchip-otpc: update dt node example
  iio: adc: at91-sama5d2_adc: update calibration index, validation
    condition
  ARM: dts: microchip: sama7g5: add packet tag as offset for calib
  dt-bindings: nvmem: microchip-otpc: remove stride details
  iio: adc: at91-sama5d2_adc: add temp init function as callback
  dt-bindings: iio: adc: at91-sama5d2: document sama7d65
  iio: adc: at91-sama5d2_adc: adapt the driver for sama7d65
  ARM: dts: microchip: sama7d65: add node for the ADC
  dt-bindings: microchip-otpc: document sama7d65
  ARM: dts: microchip: sama7d65: add otpc node
  ARM: dts: microchip: sama7d65: add cells for temperature calibration
  ARM: dts: microchip: sama7d65: add temperature sensor
  ARM: dts: microchip: sama7d65: add thermal zones node

 .../bindings/iio/adc/atmel,sama5d2-adc.yaml   |   1 +
 .../nvmem/microchip,sama7g5-otpc.yaml         |  17 ++-
 .../dts/microchip/at91-sama7d65_curiosity.dts |  23 ++++
 arch/arm/boot/dts/microchip/sama7d65.dtsi     | 128 +++++++++++++++++
 arch/arm/boot/dts/microchip/sama7g5.dtsi      |   4 +-
 drivers/iio/adc/at91-sama5d2_adc.c            | 123 ++++++++++++++++-
 drivers/nvmem/microchip-otpc.c                | 130 ++++++++++++++----
 .../nvmem/microchip,sama7g5-otpc.h            |   6 -
 8 files changed, 383 insertions(+), 49 deletions(-)

-- 
2.34.1


