Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E910D4921B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 13:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S4i4A9d9EMVpmaXXJfllCHHREcBTRuHjXfL72ShVYSs=; b=J34+zMxtqSufD1nxEyF0hmB+48
	X8YdgE+Gshiw6/qQpr8oM2e0D6jiq5KAFIXbkJkiztNtiCx1UYn3d3pY74hMDNz0NXO1F1JhxGA+m
	NW/s+SOalCgdOFz0b3mwt2ZQ98Q1OxkL+DG3kLL8IwXsEFVmdifshYPJNzJjSuDmCgJVwpwAOyico
	6Vs/5tGlX6fD6dJ4w2e5NrF7JAQpZ0+rdTZCBxHR5ycUceFrq91fsHh44z03dwhfOW4uc9iyihlf7
	1VwmWES9isLCy1hCrLK7VGPpSuqdKvD5+zYpJKhcwZCU4B3A4JhhbxIdB38rG0rDvJ9GlV6NgdqbX
	SJTm0wzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1U1-00000009VIF-3MGf;
	Mon, 18 Nov 2024 13:08:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1Nf-00000009TLB-0B5u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 13:01:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1731934887; x=1763470887;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=gZ500P10yVXIKdiPBJoAEnTl8gEfa/8nVoOA0fZ9N88=;
  b=kHR976T7fIdMh++9PPMkh1g2yS135ULEaGhL7wBAdupUviz2qf7b+s2p
   tUJycQx2XUsXTt+VMRI9+QK5+e9LQGQl6HcoBQi/ae3JsQYxUP2ybxdbL
   i3lccjhC5YB/ufr58BQ2b3n7Fd/Alf5Dr+JFjq1GpoU8DXROaO0sWr2EK
   EkV1/tx3E6cAXMXxWfUCimh3IMbEkG3y9qqUyoVpLxAZeRGsRqAG6oNe/
   n2WWE4mRWLoELkXEBwBzyvo5nhdaPn8j5IVft4d0NC7eNmv6/BBTJkLaN
   YEaS3NDtnS4aATYhAAD86viY2xhl3UeDcs+bolbblpRlEQq6PrCDxEV8B
   A==;
X-CSE-ConnectionGUID: pV1s/Z6yQPOamzioY1xjCw==
X-CSE-MsgGUID: i7jMq5UWQsG/P94Fk0Tifg==
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="34953031"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Nov 2024 06:01:18 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Nov 2024 06:01:09 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 18 Nov 2024 06:01:06 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 18 Nov 2024 14:00:50 +0100
Subject: [PATCH net-next v3 4/8] net: sparx5: use
 phy_interface_mode_is_rgmii()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-sparx5-lan969x-switch-driver-4-v3-4-3cefee5e7e3a@microchip.com>
References: <20241118-sparx5-lan969x-switch-driver-4-v3-0-3cefee5e7e3a@microchip.com>
In-Reply-To: <20241118-sparx5-lan969x-switch-driver-4-v3-0-3cefee5e7e3a@microchip.com>
To: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Lars
 Povlsen" <lars.povlsen@microchip.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Russell King <linux@armlinux.org.uk>,
	<jacob.e.keller@intel.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_050127_154127_F43806EE 
X-CRM114-Status: GOOD (  16.87  )
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

Use the phy_interface_mode_is_rgmii() function to check if the PHY mode
is set to any of: RGMII, RGMII_ID, RGMII_RXID or RGMII_TXID in the
following places:

 - When selecting the MAC PCS, make sure we return NULL in case the PHY
   mode is RGMII (as there is no PCS to configure).

 - When doing a port config, make sure we do not do the low-speed device
   configuration, in case the PHY mode is RGMII.

Note that we could also have used is_port_rgmii() here, but it makes
more sense to me to use the phylink provided functions, as we are
called by phylink, and the RGMII modes have already been validated
against the supported interfaces of the ports.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Reviewed-by: Horatiu Vultur <horatiu.vultur@microchip.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_phylink.c | 3 +++
 drivers/net/ethernet/microchip/sparx5/sparx5_port.c    | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_phylink.c b/drivers/net/ethernet/microchip/sparx5/sparx5_phylink.c
index f8562c1a894d..cb55e05e5611 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_phylink.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_phylink.c
@@ -32,6 +32,9 @@ sparx5_phylink_mac_select_pcs(struct phylink_config *config,
 {
 	struct sparx5_port *port = netdev_priv(to_net_dev(config->dev));
 
+	if (phy_interface_mode_is_rgmii(interface))
+		return NULL;
+
 	return &port->phylink_pcs;
 }
 
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
index 8f4f19a2bd65..b494970752fd 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
@@ -994,6 +994,7 @@ int sparx5_port_config(struct sparx5 *sparx5,
 		       struct sparx5_port *port,
 		       struct sparx5_port_config *conf)
 {
+	bool rgmii = phy_interface_mode_is_rgmii(conf->phy_mode);
 	bool high_speed_dev = sparx5_is_baser(conf->portmode);
 	const struct sparx5_ops *ops = sparx5->data->ops;
 	int err, urgency, stop_wm;
@@ -1003,7 +1004,7 @@ int sparx5_port_config(struct sparx5 *sparx5,
 		return err;
 
 	/* high speed device is already configured */
-	if (!high_speed_dev)
+	if (!rgmii && !high_speed_dev)
 		sparx5_port_config_low_set(sparx5, port, conf);
 
 	/* Configure flow control */

-- 
2.34.1


