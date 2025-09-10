Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F4FCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 16:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kryj5TFPyUnrT7fKwNOKbYvqEYAvNPXw7E//d6pqv/g=; b=FlKnISKpv4Q/gJZ+Y2IsKGC6vq
	ibh9vdin0ZLklJxVhqfboWyg0YuSjRoWKX5TtLtVCsbsYfl6I4W6vaXd+1iozwLX2WXYDyD1rl5mc
	qSS+FST3JF8caW5yQhdyGTw/TUPaKdH83gbTRXeYvRLz8urBxjaQINmmUqEWtEMooTWU31MHRMOzu
	D+lAMkaJqSYiJax85qInlDNRRVHxgeIdeSkHINaUT5MDqre45hmoL8VwLS6QVkuzNymGLBE7tUmYz
	hRlkMFK04qVlMyq4RWvLnCQ9xYiU0Tjq5JzIbfUv3sEwaqwyoG1AB6gxAGC2CfbWZwkOhS03Nfk09
	W5Sdcrxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNad-0000000FRk9-2WFE;
	Wed, 10 Sep 2025 16:22:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNaY-0000000FRfd-2N22
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 16:22:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757521350; x=1789057350;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5pieibsRPJo/V0RuJcEOBHWPfpUwqYwCzxf8IMfkT2k=;
  b=BWmjNgExC4vpaF9WvcxbbccG9XnT32yNiOAcPMrM4vDUnKAuXmlHtCb6
   MJi25P85RTk+xkFnQ6QVN5ycD8nTc1nIqamm9tCuwBV1id7vOfOfKI748
   /HGRwWcRMHUZAtz0Lfdc8U+Az26Dw8K3LWZKAnANZotbCeUKyWcXIcOH3
   OTxH9G1N25vO1PAgJluMSWz5mkxWcGDAcrELjjEu/Eja7vcU9c3I0VGOu
   Idb6RoH9sGJfwUdE1uYxLRpkSybH0wDYdScGoFFfL/hniVBB3CUZI09Lb
   yt7wp0TMIu3U6v2LRqUgyekdbQHB5nJK2c0Hh2mVmCOrozLrF3tnwTVCe
   w==;
X-CSE-ConnectionGUID: tPE+SbpaSyCyxVMbhLqdoA==
X-CSE-MsgGUID: f2/xiDzdRj6Lx1CeFsmEmQ==
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="213715733"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Sep 2025 09:22:25 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 10 Sep 2025 09:22:11 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 10 Sep 2025 09:22:11 -0700
From: <Ryan.Wanner@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <sre@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <linux@armlinux.org.uk>
CC: <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/4] ARM: dts: at91: sama7g5ek: add microchip,lpm-connection on shdwc node
Date: Wed, 10 Sep 2025 09:20:39 -0700
Message-ID: <ded286a183a5111d8165727111577b088f5d67f3.1757519351.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1757519351.git.Ryan.Wanner@microchip.com>
References: <cover.1757519351.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_092230_668398_85E66679 
X-CRM114-Status: GOOD (  10.63  )
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

From: Claudiu Beznea <claudiu.beznea@tuxon.dev>

Add microchip,lpm-connection binding to shdwc node. On SAMA7G5-EK REV4
LPM is connected to GMAC1's PHY, 24MHz oscillator and PMIC. On board
PMIC is not listed here as it is only treated on BSR mode
uncoditionally.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/boot/dts/microchip/at91-sama7g5ek.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
index 3924f62ff0fb..50e9a5a5732a 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
@@ -872,6 +872,7 @@ &sdmmc2 {
 
 &shdwc {
 	debounce-delay-us = <976>;
+	microchip,lpm-connection = <&gmac1 &main_xtal>;
 	status = "okay";
 
 	input@0 {
-- 
2.43.0


