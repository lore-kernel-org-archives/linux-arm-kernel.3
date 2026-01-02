Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2202FA3728
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 17:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VSmPqVNTnBjhIVXfobqokP88AkkG9BV/FYeKkeFDdIs=; b=yDv/9px2p5iNyC6yUwuTG0JU+0
	mO3P66RPFPJWIMiPnH6kNVcm5Qn/YHZZXzNB87ta5sWGbxTgl8C02VGu4VCed4z8glXAxdbhzCd/r
	4d5nRkN3TqBr8hIiQw2iL+E08eqPs1ez7MY4/glLhgBgxs59iDfrp1sqcRWlvFlS3ExAzcGrLB6Wq
	w71n9mmHboWwtgCt09ZGLtlye004lEuW8/dZPXzng0Dt+vyY541y+W4s+ByiuB0//YtEdUEy4O3NH
	C/EVZlekWIigozCHC2tFLvhes4GFNo3nScUwtdTxWC2c1in25juG12z/QHFaOGS+ImReKMqZ43UaY
	GbM3rkuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbiXs-00000008Wv0-0CQE;
	Fri, 02 Jan 2026 17:02:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbiXp-00000008Wth-27jE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 17:02:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1767373352; x=1798909352;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b2FcMDI/Onb6TJ2aAIjlXHZ4EvhM59xQTjBh6PFYK+8=;
  b=v9PIpiBMXIEb4wuyuC6usniS/opNy2qSA6WapTg8iXlE4SAigQ8UlsdI
   yRbsVkh8Z5tY1JH5OiJ78dU0FFcHBIDiweHRnljFT0xbgoE2s9adDslmc
   ec0mbF5P3Z6KYLc8nX+9taxp+dkchvr4bmQoKm8WnsWohPtnlcPz/EURQ
   5x5TuzTuUbEVkWcsDn7BJ8ZqdEpOdgL/Jj9XPBkHeLMaimjogYXJ2Evq8
   giUi1ApQM1Ut9vxKxFDIv87cL+IyAzSCKoeTHVodlXSZKty3q9se2K5cT
   ic9uzN4dIq5G7wvcVNwqNqv79LTx9YK7g39j0Y8qG8SAjHVBc3PS/LgUJ
   w==;
X-CSE-ConnectionGUID: AQIGzmznQ9aRzmgEiLNGFw==
X-CSE-MsgGUID: C2HUDPFbRKOMTMajxM987w==
X-IronPort-AV: E=Sophos;i="6.21,197,1763449200"; 
   d="scan'208";a="282656849"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Jan 2026 10:02:32 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 2 Jan 2026 10:01:38 -0700
Received: from ROU-LL-M43238.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 2 Jan 2026 10:01:35 -0700
From: <nicolas.ferre@microchip.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Balamanikandan Gunasundar
	<balamanikandan.gunasundar@microchip.com>, Ryan Wanner
	<ryan.wanner@microchip.com>, Conor Dooley <conor.dooley@microchip.com>, "Hari
 Prasath Gujulan Elango" <hari.prasathge@microchip.com>,
	<stable@vger.kernel.org>
Subject: [PATCH 1/5] ARM: dts: microchip: sama7d65: fix the ranges property for flx9
Date: Fri, 2 Jan 2026 18:01:30 +0100
Message-ID: <20260102170135.70717-2-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260102170135.70717-1-nicolas.ferre@microchip.com>
References: <20260102170135.70717-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_090233_550081_7E94AEB2 
X-CRM114-Status: GOOD (  11.59  )
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

From: Hari Prasath Gujulan Elango <hari.prasathge@microchip.com>

Update the ranges property for the flexcom9 as per the datasheet and
align with the reg property.

Fixes: b51e4aea3ecf ("ARM: dts: microchip: sama7d65: Add FLEXCOMs to sama7d65 SoC")
Cc: <stable@vger.kernel.org> # 6.16+
Signed-off-by: Hari Prasath Gujulan Elango <hari.prasathge@microchip.com>
Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
Note: Hari's email address will bounce. Change to whichever suits you.


 arch/arm/boot/dts/microchip/sama7d65.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index cd2cf9a6f40b..5f3a7b178aa7 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -676,7 +676,7 @@ i2c8: i2c@600 {
 		flx9: flexcom@e2820000 {
 			compatible = "microchip,sama7d65-flexcom", "atmel,sama5d2-flexcom";
 			reg = <0xe2820000 0x200>;
-			ranges = <0x0 0xe281c000 0x800>;
+			ranges = <0x0 0xe2820000 0x800>;
 			clocks = <&pmc PMC_TYPE_PERIPHERAL 43>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.43.0


