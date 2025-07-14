Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30A1C83F2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 18:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IasJyxSkXshcO+VKhSMBxmefFShzlgMTav2anEQ/+mw=; b=OiO9E2L5RkwQ9W8A+h74m96M97
	X98b4xALZMcaVR4SNW4o1iD1zjL9d4lcPP36wCxfAafG/CLMXw1Hdr4rVFhcQDK60k47O8PDXo8SL
	oEDigpQ021T6C/Oje3hWlyWzEV2SWwvetO0QDKsfm3xiBvHcW8ZoI18w4/fxN+dWppsYYIYUB27Tu
	Hwj2mD3HanaXxTZuvVFZA0eh6QhIAKMA+xnMB6QLbVrSTIzmM4IhdEojjnqDoS7yixR51dN/e+E2d
	f9ey0RPG1Ls1VzQHLTAcQbrsbEBE0CL/rIkSywJUIUGGb6ZtGIyozxq8mGo4TPze08MnyeqquuMca
	/45HST0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOFc-00000003494-1W70;
	Mon, 14 Jul 2025 18:50:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubMAz-00000002qjr-0WsF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 16:37:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1752511033; x=1784047033;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yReikR58Lp8W/7OGiLE+dcPuXMVnnclT1LFvehcRPsU=;
  b=dNIbFwJZ6ycZwk9Z7bDsWi2MG0+LfvUf0P9BEooVXbXTE6kJ2Yf2WeNL
   Hmjxj5XAmjIlnmJlEgb4UNKtUfHE3r/Z4moiZCVPBPP+mnHKshERoU6+g
   5wGendWgyX3W084grwWFlfDEMufzO9WU9sBdp64aefDwn+W1evqYkI/EE
   Sc550QfeSO/DX+i1YxpovxX69shp8hhOC2uVGG8F52j9WXHF9Recp5khX
   kmZd3lJrRU4WDzFRJYGxPX9bEAI9f0wr7x0MBCipO2z+H/gqoo3/dvKbt
   U2YeCzhxEze8pGO1koSybqaXu1+EzM6izSIEa2JR/iklzKo+kSap79yrb
   g==;
X-CSE-ConnectionGUID: hBq1ljEWSkqL674rDMJkcA==
X-CSE-MsgGUID: iEPb35OVRjOOUiIF1VgRIw==
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="211399323"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Jul 2025 09:37:10 -0700
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
Subject: [PATCH v2 2/5] net: cadence: macb: Expose REFCLK as a device tree property
Date: Mon, 14 Jul 2025 09:37:00 -0700
Message-ID: <7f9b65896d6b7b48275bc527b72a16347f8ce10a.1752510727.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752510727.git.Ryan.Wanner@microchip.com>
References: <cover.1752510727.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_093713_229606_3F6A199D 
X-CRM114-Status: GOOD (  13.93  )
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

The RMII and RGMII can both support internal or external provided
REFCLKs 50MHz and 125MHz respectively. Since this is dependent on
the board that the SoC is on this needs to be set via the device tree.

This property flag is checked in the MACB DT node so the REFCLK cap is
configured the correct way for the RMII or RGMII is configured on the
board.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index d1f1ae5ea161..9ebe1062b359 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4109,8 +4109,12 @@ static const struct net_device_ops macb_netdev_ops = {
 static void macb_configure_caps(struct macb *bp,
 				const struct macb_config *dt_conf)
 {
+	struct device_node *np = bp->pdev->dev.of_node;
+	bool refclk_ext;
 	u32 dcfg;
 
+	refclk_ext = of_property_read_bool(np, "cdns,refclk-ext");
+
 	if (dt_conf)
 		bp->caps = dt_conf->caps;
 
@@ -4141,6 +4145,9 @@ static void macb_configure_caps(struct macb *bp,
 		}
 	}
 
+	if (refclk_ext)
+		bp->caps |= MACB_CAPS_USRIO_HAS_CLKEN;
+
 	dev_dbg(&bp->pdev->dev, "Cadence caps 0x%08x\n", bp->caps);
 }
 
-- 
2.43.0


