Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C80E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 13:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ee4Cqltsq/x2Af7TPnSmQhx70toxX6wzwgokxBfDpew=; b=mup/ntihSzOcQRutpwhd5JXI1E
	jszCqBSCNpzfQfIJksvJT+RMlisBkqQxvBNGY5j/kwlyL5A2MSO7RhHxk+9T+jJrNvpQFiXxxWMAe
	DhW886Hpj5eJChAY1wUUa9G9iMv70kmJ/+2BAT0RdVYx0G70PgPKfspW47HYMX4YuCqIUw53WpGe2
	a7XBiJ7BKVg2zTQ/R6uYqwWP9008Y8Nu0nbzVXTumkA7Ote11vSiCr451iJjux4eUnt12Ehhnjxr5
	kSWH+DeG37IRoPF52CvhN5C/RCdfRGTdtEGPUDMFn9TuYQP1IPUnteofiKgx0kGBPzRHEv/RyD3yZ
	sLsaJC5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdSu-0000000541e-3G4q;
	Fri, 20 Dec 2024 13:54:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdNm-000000052zO-00WL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 13:49:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1734702574; x=1766238574;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=DQqXsBk8sYDOENdYyi6xpxkvVQxjssr0ADx5wWVj0Lw=;
  b=sMaBmDXgW8nuM770AQeUNKM66ZtKfgJMlEGERmHzFQbT0Tvve6tXKeB4
   45DbQBMIAErHD3xg1yxtFyXaefBcQi+Hh8qJM3Mc4yuX3b+Q5DHZwN9Zr
   OLJz5PQYKRlqDShXwqhkeSvoO4jCYzTijhx0hRNK6mB2KCW1j4ckYnzn4
   RXmS1/vnZ+zGB0f678zpR1B8yk2zCXMYv6YL0MYzOlC4um78b9EkNRMIN
   IDLYZYYggTeHm9kZV9LjFPe4bKCHZxLADRaBCCB350hyXJmvfVEt4ZG88
   ZHR8/PeLX0kPRhncpfp6gftcvmqH/S11xuIPCAW+MUm8WPwRVXXvesTUv
   A==;
X-CSE-ConnectionGUID: mIAoSPyhQLi+IAfuQfXUsw==
X-CSE-MsgGUID: mOJ13HshSOSgpieaCq6k9g==
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="267028401"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Dec 2024 06:49:33 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 20 Dec 2024 06:49:08 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 20 Dec 2024 06:49:05 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 20 Dec 2024 14:48:44 +0100
Subject: [PATCH net-next v5 5/9] net: sparx5: only return PCS for modes
 that require it
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241220-sparx5-lan969x-switch-driver-4-v5-5-fa8ba5dff732@microchip.com>
References: <20241220-sparx5-lan969x-switch-driver-4-v5-0-fa8ba5dff732@microchip.com>
In-Reply-To: <20241220-sparx5-lan969x-switch-driver-4-v5-0-fa8ba5dff732@microchip.com>
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
	<robert.marko@sartura.hr>, "Russell King (Oracle)"
	<rmk+kernel@armlinux.org.uk>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_054934_056531_8ADB42E8 
X-CRM114-Status: UNSURE (   9.76  )
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

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Tested-by: Robert Marko <robert.marko@sartura.hr>
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


