Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E01AC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 10:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vO+gzdw0VPCTZES8Nl7pIIbrp5OoLtnXI+qurPvmUgE=; b=GRc8se9prPjAOZbuwRGVRwjIke
	JU2zwZ5FG61suPjkXZb9fmOUI2twy3jBV79OClNB9dO6hZsbLy7B9GznPsADNQzMh7v7kLWZ38mzW
	GSfX/u0jBL4WIq9nLszFToMcQ6rXtgAoPLJp8zjP0eiaqpg+0lOO530WHHYRCcw47g+vAeusK2z/G
	B33BD7zO7jZDIYFOH9pPQAnDTgz/mqSAyWqB8vUA7zaW4fkPUqD95xwqHm1C0GvifWF5w/qXLXufU
	rwC27M+P6IJR4DIHsx7VT8UC9mGI6cA9i59pRDsXX0DQvmW0bdVkZnbEVySqm/yNb4tQmokgzuCAX
	oUL2HMhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uisdw-0000000ACvL-1Mle;
	Mon, 04 Aug 2025 10:42:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uis35-0000000A92a-3Tpq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 10:04:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1754301847; x=1785837847;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sNaoy8/stCR2oSveDjFYF8EHjZ9xs9dYDS7l9udDb0A=;
  b=McNGfx5hUGssm/W8/MTmYZKoLwvQ14G2tUvuQdHDYRSElfVTZXfwV/c5
   sb1qcor3yju6z1y/io/YuIDW//NCn1uoZ6XmmWCmskbFHt8VxqLAdjpgM
   +MJtcwpe3lTprN2F+7IxEbIS6QCz7DepDV1C6WcrHpfL9PGCFKQ8BB3Ng
   n7j9OBEAluFiU/IuRe6ad5WWj9093Uh3f7qAH4CqIZrNcXfdZLDQcKY5g
   6XCzhyOeBwhqTj/i/wc63RJojLkN7hQfbQ4LcxqDuY1KsT8DZw0KLiCpZ
   kwnsHOxtvyqRWngso3UeCP/63whP0zIv2/pknCralPZalwtn4U1O/YtjC
   g==;
X-CSE-ConnectionGUID: +866aF0tQ+SVcfcIeqWRcg==
X-CSE-MsgGUID: +JNh/NbuT3a9KNh0rf8oGw==
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="44245556"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Aug 2025 03:04:06 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 4 Aug 2025 03:03:58 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 4 Aug 2025 03:03:52 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <eugen.hristev@linaro.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <varshini.rajendran@microchip.com>
Subject: [PATCH 14/15] ARM: dts: microchip: sama7d65: add temperature sensor
Date: Mon, 4 Aug 2025 15:32:18 +0530
Message-ID: <20250804100219.63325-15-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804100219.63325-1-varshini.rajendran@microchip.com>
References: <20250804100219.63325-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_030407_937929_64421FAD 
X-CRM114-Status: UNSURE (   8.76  )
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
index 5d1f6684f64f..aefdd72cb59c 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -103,6 +103,13 @@ ns_sram: sram@100000 {
 		#size-cells = <1>;
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


