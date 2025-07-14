Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA7EC83F2C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 18:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7pXpk0Mp7Dx7uxCDeDToJYOVtOi4i9AqbMhBxWCJmFk=; b=y7eNqBw9q9Wm/U5oRdBUTt8S3Q
	f/nYV+W4w76AHQCWNneINcy2aiTU2KFVvyBgdNUXh95z+UP8qibmkwzHhV/gwC7paRN5Cl5qXga90
	LpHVhE6KVtOQakII4FVFYuA0LbWL27U+yCiyrppEyyoasd58nOpTIAkcbORj0WKy9gT5WmyKrliBO
	ouF7lB2y0/TI75mSj6p3g3Eo/FDIDjCjJwYUHJ43B8M5Nx0w6JMSapJPUMTdU51rOnkKQHDTtKyx1
	Zh+IgiZjw7RFX2awXqM70XIvKixUmAxUHsGNY2tGjVpIKS0CFO3V9OfQcq0z+Atk6uzOB7FBatO2O
	zrgA72PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOFi-000000034F1-0szZ;
	Mon, 14 Jul 2025 18:50:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubMAz-00000002qix-2BWi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 16:37:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1752511033; x=1784047033;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5pPrl6QKhmk/QD+ET8LzO0pObwgIOomGvZko72FMz4U=;
  b=ZT6AMF6EoPQ0gZlATlsJujp40PXPo5zxb1QpS44jyj1UDxFwycrY3Wkx
   fMTh8QETWnxt25aNBWSh2P0wJFTqhIMcvpZ6MvSV/IAyNIMy/d0nrqzFI
   0SwcIcOU/P1PzfAeEErRCAPmuHAAW3zmj7HNzZWA53qrfNm9LI8x2x77g
   OGlvJmEuwlUvUTFTHr1EX1SHDnGZjX8xIN6CASjxlqplVX/AdZrW16sVb
   MibhHd3q1DhtG2YL6Ghb2nYgnFlMRv3eYOFHCf1Q4bdvmwliI5f9tVEMN
   5qOL4v4yXJOoBqm2/VgX/RqIyik9LALv8gOSNPQqsqvoeywk3sFvY2x+B
   Q==;
X-CSE-ConnectionGUID: hBq1ljEWSkqL674rDMJkcA==
X-CSE-MsgGUID: gp9RKsQNQa2rPkZIUjTdvA==
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="211399328"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Jul 2025 09:37:11 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 14 Jul 2025 09:36:28 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 14 Jul 2025 09:36:28 -0700
From: <Ryan.Wanner@microchip.com>
To: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 4/5] net: cadence: macb: sama7g5_emac: Remove USARIO CLKEN flag
Date: Mon, 14 Jul 2025 09:37:02 -0700
Message-ID: <1e7a8c324526f631f279925aa8a6aa937d55c796.1752510727.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752510727.git.Ryan.Wanner@microchip.com>
References: <cover.1752510727.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_093713_626699_982E4658 
X-CRM114-Status: GOOD (  11.33  )
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

Remove USARIO_CLKEN flag since this is now a device tree argument and
not fixed to the SoC.

This will instead be selected by the "cdns,refclk-ext"
device tree property.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 51667263c01d..cd54e4065690 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -5113,8 +5113,7 @@ static const struct macb_config sama7g5_gem_config = {
 
 static const struct macb_config sama7g5_emac_config = {
 	.caps = MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII |
-		MACB_CAPS_USRIO_HAS_CLKEN | MACB_CAPS_MIIONRGMII |
-		MACB_CAPS_GEM_HAS_PTP,
+		MACB_CAPS_MIIONRGMII | MACB_CAPS_GEM_HAS_PTP,
 	.dma_burst_length = 16,
 	.clk_init = macb_clk_init,
 	.init = macb_init,
-- 
2.43.0


