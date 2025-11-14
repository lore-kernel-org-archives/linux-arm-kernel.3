Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78280CE7AA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 10:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nC8UTxZicoaLj+gHj5PDV9Jqhe0Z6rG1WKRuxO8ygG0=; b=VA4l2jCJ1WxdOryfZfjMrgGZyY
	CfvYVIsehPh6SOTNxCxQBrmeDikLdivJgMM1CF6EHA27AgOrBYrX9spVq5aFzaj7h5NNDcsqdMynw
	q3tmN9SoXvG+BWQwPF3tpeGzw3LRuu8dFh8hO86Z8AgwunePRMm8Iqo9WYBFEti3JLN4GVmL229yN
	ErmPbgpHjmYRmkw8VoiFmy6Cjk/th2uyFHkuYRLunRKX4zDXpisgb+fIr7MiWUXPnjI66FmeGBRTF
	aoiLuIgLn7sA6ow69YSeTNPYZMWGVcLnd2sDAkIx7DzQAD4pAmpWgE7cW+KFaKt63GgDV07+KTg7g
	JSotQz1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJr86-0000000C1km-3vUZ;
	Fri, 14 Nov 2025 10:34:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJr81-0000000C1ix-2y4I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 10:34:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1763116445; x=1794652445;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=D9cxNLkNziaEdzUnkoYLDeMaPHjBAxKPggl+Zh8QZpU=;
  b=Q7LYIPILAJ4GdO3mWFzxbMpx1o8hOR/9G8qDpHQiRA7JKaySu7uokgDl
   W6YtZduZthdJcES8srze4JmUzTSj6yOMHmQ5vPsA/EABzuRAQig4UKbGS
   ycLy5aSIxX/9tWYiQIMbQljHHoeYoYyR8CEkuDDKTGDacmnZEk3R2/xqV
   tstli2KSLKsotCRO2VijY39v6ux3AyXwogD4hGHJtqRD2aJhmoaMS+4XM
   SqGN2cKu7xJ5KtKdTTiyyLLzQd6KdrOnaufms96MYsbitg0AC9TWRa3/4
   g5J05kyiHXvy2oL+ohUEQQADe7QAwdMbFmLHGnWiv7jPHJAblkHTtn2Vz
   A==;
X-CSE-ConnectionGUID: Bmgk/fX/QBGabdIqtVBXBQ==
X-CSE-MsgGUID: wIk1cWa8SLKfj1V6vLzLuw==
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="49627358"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 03:34:00 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Fri, 14 Nov 2025 03:33:30 -0700
Received: from ROU-LL-M43238.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 14 Nov 2025 03:33:29 -0700
From: <nicolas.ferre@microchip.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Ryan Wanner <ryan.wanner@microchip.com>, Cristian Birsan
	<cristian.birsan@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	<stable@vger.kernel.org>
Subject: [PATCH 1/2] ARM: dts: microchip: sama7d65: fix uart fifo size to 32
Date: Fri, 14 Nov 2025 11:33:12 +0100
Message-ID: <20251114103313.20220-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_023405_977854_FDCD8F4D 
X-CRM114-Status: GOOD (  10.87  )
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

From: Nicolas Ferre <nicolas.ferre@microchip.com>

On some flexcom nodes related to uart, the fifo sizes were wrong: fix
them to 32 data.  Note that product datasheet is being reviewed to fix
inconsistency, but this value is validated by product's designers.

Fixes: 261dcfad1b59 ("ARM: dts: microchip: add sama7d65 SoC DT")
Fixes: b51e4aea3ecf ("ARM: dts: microchip: sama7d65: Add FLEXCOMs to sama7d65 SoC")
Cc: <stable@vger.kernel.org> # 6.16+
Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
 arch/arm/boot/dts/microchip/sama7d65.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
index e53e2dd6d530..cd2cf9a6f40b 100644
--- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
@@ -557,7 +557,7 @@ uart4: serial@200 {
 				dma-names = "tx", "rx";
 				atmel,use-dma-rx;
 				atmel,use-dma-tx;
-				atmel,fifo-size = <16>;
+				atmel,fifo-size = <32>;
 				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
 				status = "disabled";
 			};
@@ -618,7 +618,7 @@ uart6: serial@200 {
 				clocks = <&pmc PMC_TYPE_PERIPHERAL 40>;
 				clock-names = "usart";
 				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
-				atmel,fifo-size = <16>;
+				atmel,fifo-size = <32>;
 				status = "disabled";
 			};
 		};
@@ -643,7 +643,7 @@ uart7: serial@200 {
 				dma-names = "tx", "rx";
 				atmel,use-dma-rx;
 				atmel,use-dma-tx;
-				atmel,fifo-size = <16>;
+				atmel,fifo-size = <32>;
 				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
 				status = "disabled";
 			};
-- 
2.43.0


