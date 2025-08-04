Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BB5C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 10:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4w37L0rEUcK1WVQOJ3C/nilFvyUKOnW3lYarj20pT54=; b=YFEMkj0xRthDfcLuLyR0c74vnK
	iNc7NsbL2AY9/qwODSoQPb4smzrMCEe/rqng+LCW683sKnG+eAUxYD1ZFI2dbXTt9+XLmXQh9XJTU
	dLF7bBqjO/+c1WeW/L9aauxt6+gyFwN0D3c5+++XU9+ipjrp/VBn03mKFY1s8rm25WmVl2msTkoyj
	wY0BtA+XIAWo12sGts/4njJ0BSSakfevUEk4LupSaIzvarcwiAzn1m/eGzb9TU9+5dZm/93bCAG/N
	U8/O/Y751cyjq7IL/S8H3BWvPfkqeCW3HCQVMBUSlHx+uwPJrk56xxJTzX6YVr9C8+hvB6ROoCsxE
	6WvSeFoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uisHH-0000000AAjR-2moo;
	Mon, 04 Aug 2025 10:18:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uis2G-0000000A8sm-3VTt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 10:03:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1754301796; x=1785837796;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uuIRyOEdnRLBFCKPdTmHEOMyyB5YLO4QgF/4XXDW/LU=;
  b=xeQer+bHxQRcrUPuSexGinz6Ka4+GT8PNavgcqolTyMMxb3EXRgTo4Il
   wDWy3mc/JwBzxH7QhZv0EfjIEYgrdA4XyGWavy/HLphYTgeTt1FhCusTQ
   PkxuXq3WhW8fl48+ujj0vfvxoCDl750sGMfYu1cFFQ9KCBz9FDjTzbnq9
   jjSc+ULdeWDs5RbBirWOLoQ3cyA7WqjBQb/XGkdqeVpalHHRH8pQE2HFD
   KJ/WltCaLiFVjn2J9YWAMGYrIDCH6yWqvUjAKU+5+OLof1pEYbpNB5s26
   rxv5i85eugZ12KVQLtrBXVZtOOwFs4fOf8WutAjb0ofC01/V+x50vQ8jf
   A==;
X-CSE-ConnectionGUID: QrHuXWrSRt6GNRSNglLzJg==
X-CSE-MsgGUID: VL8QDnfmR6Kw70ZIcKKS6A==
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="44245503"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Aug 2025 03:03:14 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 4 Aug 2025 03:03:00 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 4 Aug 2025 03:02:54 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <eugen.hristev@linaro.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <varshini.rajendran@microchip.com>
Subject: [PATCH 05/15] ARM: dts: microchip: sama7g5: add packet tag as offset for calib
Date: Mon, 4 Aug 2025 15:32:09 +0530
Message-ID: <20250804100219.63325-6-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804100219.63325-1-varshini.rajendran@microchip.com>
References: <20250804100219.63325-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_030316_934225_8F903798 
X-CRM114-Status: GOOD (  10.40  )
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

Add packet tag as offset to access temperature calibration data from otp
memory for sama7g5.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7g5.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/sama7g5.dtsi b/arch/arm/boot/dts/microchip/sama7g5.dtsi
index 17bcdcf0cf4a..62f946f3f894 100644
--- a/arch/arm/boot/dts/microchip/sama7g5.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7g5.dtsi
@@ -1023,8 +1023,8 @@ otpc: efuse@e8c00000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			temperature_calib: calib@1 {
-				reg = <OTP_PKT(1) 76>;
+			temperature_calib: calib@41435354 {
+				reg = <0x41435354 0x4c>;	/* Temp calib data packet TAG */
 			};
 		};
 
-- 
2.34.1


