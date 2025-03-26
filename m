Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07ACC36013
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 16:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZQWZZ/d/264Vfqr2kJZ5sjh9nN4q0oKg7TSSxlATaE=; b=rk73TTq8FnyLXXtNJjAC3p6pdD
	F72zZAHczh575dkwNFq/3vE4Wj1QaZWPeckpFxHfuIuNlzTWA7JS7TRingMdiZqg6JTUSNfqXwg7h
	3XfNropmcmiC0JIm6lK2nllv8LFxvXaneGSfD7p1FpZFuVNSvQi+6mVP8tJIYdG0Q3FlYWIixyLqz
	Q8b6yOaSdahF7LWfToTcNugJKqXhH213L3DDTweobxQzZW2sn6aeSL22VLcE1btbbDZYmHubQxto+
	2nFikHNVJP4R/rYdoKdwH8r0asUXj1ujDiyScfEn3Tvtw2/wl9JXCexeH0LILE/xnzuGbRLEHf9v9
	C3+OloaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTD2-00000008wOs-3rdK;
	Wed, 26 Mar 2025 16:02:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txSo0-00000008sfh-3gHy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 15:36:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1743003396; x=1774539396;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0dSNQmt/pmj+2I2/ldT6fVmUOsoQVpjXvWZBYr4mUX4=;
  b=n5aBpKKVPvr6ChAwjn6jPigwZD+YXj55YhNG4qtmrdkrqCALh7hf5E5/
   OAU/uQ6jjfQH9zzZYsxRMsQo+7NXoFwFphhJkniXNw3eXIselfdfPy0gu
   39/weEC6i7f94XBoRtlmJS0hLjQJVfES60m6PaMfNoKAIwi5poONSqkCA
   1n/M2BwjcMdv4EpZCkI6RIIomXlTcKv2RaCCJVyKrEL/6jVpidRzK3bdV
   Brk9DS/kePXYHByiKTS4gd11PlPZRl5Z0QAa3Tr6/m3MRmjdciNIKoH4D
   Crxy2hbJTV31ruaJejkJmGCZacMtXtRRvj1mbI6IoYUFm0K/ycCC0Rzdu
   g==;
X-CSE-ConnectionGUID: NRxSiTFnT3ucBnaYj7CaZg==
X-CSE-MsgGUID: 1gufScu5RJGEEVRHYn0edQ==
X-IronPort-AV: E=Sophos;i="6.14,278,1736838000"; 
   d="scan'208";a="44096115"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Mar 2025 08:36:33 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Mar 2025 08:35:52 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 26 Mar 2025 08:35:52 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <lee@kernel.org>, <sre@kernel.org>,
	<p.zabel@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v4 10/11] ARM: dts: microchip: sama7d65: Add RTT and GPBR Support for sama7d65 SoC
Date: Wed, 26 Mar 2025 08:35:43 -0700
Message-ID: <0a6ac5965a4422e82768579ee5a0540bcf15fa5b.1742936082.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1742936082.git.Ryan.Wanner@microchip.com>
References: <cover.1742936082.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_083636_936103_19813D27 
X-CRM114-Status: GOOD (  10.25  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Add RTT support for SAMA7D65 SoC. The GPBR is added so the SoC is able
to store the RTT time data.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index 7d71e7326e3a..59b43a633aef 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -132,6 +132,13 @@ shdwc: poweroff@e001d200 {
 			status = "disabled";
 		};
 
+		rtt: rtc@e001d300 {
+			compatible = "microchip,sama7d65-rtt", "atmel,at91sam9260-rtt";
+			reg = <0xe001d300 0x30>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk32k 0>;
+		};
+
 		clk32k: clock-controller@e001d500 {
 			compatible = "microchip,sama7d65-sckc", "microchip,sam9x60-sckc";
 			reg = <0xe001d500 0x4>;
@@ -146,6 +153,11 @@ rtc: rtc@e001d800 {
 			clocks = <&clk32k 1>;
 		};
 
+		gpbr: syscon@e001d700 {
+			compatible = "microchip,sama7d65-gpbr", "syscon";
+			reg = <0xe001d700 0x48>;
+		};
+
 		chipid@e0020000 {
 			compatible = "microchip,sama7d65-chipid";
 			reg = <0xe0020000 0x8>;
-- 
2.43.0


