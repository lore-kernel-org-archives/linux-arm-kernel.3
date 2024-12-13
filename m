Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CD3E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 13:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XB71BhNfnnh1xp+rWG2Y6fpbqpLYIWbZ0wcypShpXag=; b=rFts71FYotmwAeyUMzG69D/Veb
	TB3qx+OOcGk2PZuHfNhicUkx5JwCy99TVzAiSriz7s9D5hrqp7Jb7UZxlt7e2Y5x/mg12BoxUz/SB
	l7qdOMkcX3owLMEC5etmBByWqNzZPehV80YNII9+nBd98B9QI8PmH9bf4cPue9mgGgcz0bXtVSJ+f
	fW8hmVsdYNxtCelCcWY3dz/B/u5N2bNm0JqWQnLeSHZyux6qVwvn71kPcK70h1EmywIxk9A3M0btM
	hEGH67Jii4v8BlJ5Bts1cyYNBxVLDW9UMCepgcDrNt8MTaLIqBkevrO1xr/ahL14QOnwikJkuvzyC
	6KXEx3nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM60X-00000003sJc-21N4;
	Fri, 13 Dec 2024 13:47:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM5vR-00000003qvZ-2E88
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 13:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1734097309; x=1765633309;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=e2K9xQ3ZvYEJWrTowWR9ILxUeHoj5YBQVIgtoHUtVjk=;
  b=qHpRKhAn6Y1QqzxI90U1xU1q6mS7+U/lBMcJ1jt5epGlGqPJX3u5J25d
   blKUAvLYWhDchsL18Mk9yzTjkILZwnI7ImHoR3G6v3/dlmtl2nis/byRH
   gJRRuOm0wc4/KffILNdU708kl1F+EJuVoLXSK5pFs37zzP1weGCW16pnN
   8obiqtFf3FMs+GL5sLd97hNGEQa+NeIbEe7QRwHvHSYMyETWLa918RC0Z
   AtskEEX+mkJr1MAdfrtKN39baKx51d8McpQqzAekEn7oEDpiLh4NWN9o9
   hygvuTSEykiw7533p6FUcBv+uHCubijIRkQM+vjui+NI8ocDtyfP5oW1M
   A==;
X-CSE-ConnectionGUID: J8E2tOzOTwasRwDCNa1A1Q==
X-CSE-MsgGUID: WEyjgUW9T2y381Bq/3UP+w==
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; 
   d="scan'208";a="202965479"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Dec 2024 06:41:48 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 13 Dec 2024 06:41:33 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 13 Dec 2024 06:41:29 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 13 Dec 2024 14:41:04 +0100
Subject: [PATCH net-next v4 5/9] net: sparx5: only return PCS for modes
 that require it
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241213-sparx5-lan969x-switch-driver-4-v4-5-d1a72c9c4714@microchip.com>
References: <20241213-sparx5-lan969x-switch-driver-4-v4-0-d1a72c9c4714@microchip.com>
In-Reply-To: <20241213-sparx5-lan969x-switch-driver-4-v4-0-d1a72c9c4714@microchip.com>
To: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Lars
 Povlsen" <lars.povlsen@microchip.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Russell King <linux@armlinux.org.uk>,
	<jacob.e.keller@intel.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<robert.marko@sartura.hr>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_054149_634714_DAFFECB1 
X-CRM114-Status: UNSURE (   9.95  )
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

The RGMII ports have no PCS to configure. Make sure we only return the
PCS for port modes that require it.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_phylink.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_phylink.c b/drivers/net/ethernet/microchip/sparx5/sparx5_phylink.c
index f8562c1a894d..035d2f1bea0d 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_phylink.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_phylink.c
@@ -32,7 +32,19 @@ sparx5_phylink_mac_select_pcs(struct phylink_config *config,
 {
 	struct sparx5_port *port = netdev_priv(to_net_dev(config->dev));
 
-	return &port->phylink_pcs;
+	/* Return the PCS for all the modes that require it. */
+	switch (interface) {
+	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_QSGMII:
+	case PHY_INTERFACE_MODE_1000BASEX:
+	case PHY_INTERFACE_MODE_2500BASEX:
+	case PHY_INTERFACE_MODE_5GBASER:
+	case PHY_INTERFACE_MODE_10GBASER:
+	case PHY_INTERFACE_MODE_25GBASER:
+		return &port->phylink_pcs;
+	default:
+		return NULL;
+	}
 }
 
 static void sparx5_phylink_mac_config(struct phylink_config *config,

-- 
2.34.1


