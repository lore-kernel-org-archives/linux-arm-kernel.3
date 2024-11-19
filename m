Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455F9D60D06
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 16:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jub4t3FHJblZVpHqfITLxAMhZiRVDu6Kccksgu43Mh0=; b=X9rwf87NHHw7xzyMd4tGjmG/8t
	4bFdc9l8oVPLPm5xVbn/q5iWVaQ0ujl1VQB11feUg/Kd4Oe82+qwT8szTYQ/a+UnCqqn69ougGj40
	C/vFpqvH7NqIqWFkmkP76jYTBR3N0flKwqo+bqJEtf8Pl515TcWJMK3u+vlpwF4F2pfy7r0TklHIC
	WHJLBbC1ie9vGeGycdN9/6X56+vmys1ICKE9Z35lmzm0ZkC9u02lvIz9pFmFovibsP2y9cEjg/Bgc
	GlDiRjEguninEWElgL5pjy07qrgU2/O5Ia2kCNc2zYgPNsD5TLy49FDU5FqRpwohUTKSPbtSznr/S
	q/0YhD8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDRRb-0000000D6Oa-2U3W;
	Tue, 19 Nov 2024 16:51:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDRHy-0000000D3d4-2wSP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 16:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1732034478; x=1763570478;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/kPjU2RV4uq/wNXU/xWY88VGBSGxpXiwd7zUh0prKt0=;
  b=iGMkG0Ym5C8W66QDDXrkHhHExIenhQEUjD/M6AgHQuCuQ75PuC1aCozD
   fKIvl0MV8D4sZ9i7/7y1Duez9mmDpwcYLrj6dpXOvGip7ymkflkBTYsCc
   CIcq2k3Qofpqtsq0NOG6MY3di3Gj+ZYrOXag/vPC2U6B0/i8RXoomGyNt
   G3au5dV6kvlPQWbSGqTXs1pB2DWcblzMg7QrIepRutpj5Pecz1CzPM0Dh
   CciTo6VwrgGy14jNPV3N2+OhZf3i1QtuT58xG4jXpifmIGfX2RQ8A9lVQ
   gEPtHfQITtzRsQAQG4u2vZT7Zu88ppJ+PgCwbjEcTuQbMlSIfwfCwnAEu
   Q==;
X-CSE-ConnectionGUID: jnnvkeRdTYaD0RwnHEXOug==
X-CSE-MsgGUID: jSLleud5Tyu3wGvAWw1gEA==
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; 
   d="scan'208";a="35018898"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Nov 2024 09:41:14 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Nov 2024 09:40:54 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 19 Nov 2024 09:40:54 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<arnd@arndb.de>
CC: <dharma.b@microchip.com>, <mihai.sain@microchip.com>,
	<romain.sioen@microchip.com>, <varshini.rajendran@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>
Subject: [PATCH 09/15] dt-bindings: clock: at91: Allow MCKs to be exported and referenced in DT
Date: Tue, 19 Nov 2024 09:40:15 -0700
Message-ID: <726533dbd5663e95b768bd19d2d544a197e5781d.1732030972.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1732030972.git.Ryan.Wanner@microchip.com>
References: <cover.1732030972.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_084118_797716_A8096ABB 
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

From: Varshini Rajendran <varshini.rajendran@microchip.com>

Export MCK3 and MCK5 to be accessed and referenced in DT to assign to
the clocks property for sama7d65 SoC.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 include/dt-bindings/clock/at91.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/at91.h b/include/dt-bindings/clock/at91.h
index 6ede88c3992d..e37f1b9cdabf 100644
--- a/include/dt-bindings/clock/at91.h
+++ b/include/dt-bindings/clock/at91.h
@@ -42,6 +42,10 @@
 #define PMC_PLLADIV2		(PMC_MAIN + 11)
 #define PMC_LVDSPLL		(PMC_MAIN + 12)
 
+/* SAMA7D65 */
+#define PMC_MCK3               (PMC_MAIN + 13)
+#define PMC_MCK5               (PMC_MAIN + 14)
+
 #ifndef AT91_PMC_MOSCS
 #define AT91_PMC_MOSCS		0		/* MOSCS Flag */
 #define AT91_PMC_LOCKA		1		/* PLLA Lock */
-- 
2.43.0


