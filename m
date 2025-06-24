Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358F5C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 11:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZDrXoWnndqa2vP7h7oVAnPKn8tyXmeoTROzM7osLRaQ=; b=3F+JpuLthH1Haqq0N+E7OFudQh
	1guaTr8qjU1omLBeREpr1cPB/eS7+ivAvy/TmTJL1egiDbxyoKBo6gkZErSjXdUT5vSbiwKXPAmuR
	wfSc5hIpeGEP2kyA9Zv9mxQCV14krHSaXCQTtwtlsrUDhsyC0p/CnKHIOtK/qS+NBXPzSz58iPbKL
	7wHeP8Ja1oo8PtVneMFhgP/yMBcxduavSc3+1CQc3m7Ljj9dr2nFFa1pFXo2ZUylpnT4O2dcQx6Dt
	f3G5G46GTkWgjhjUM/SeUciVOntVQyboGGSYiW/WG9n8b4A72pt+9+DqTW21x9L+Nyx696cMMNb7g
	G44Yi+zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU1k8-00000005QPk-0OBd;
	Tue, 24 Jun 2025 11:23:12 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU1IP-00000005McL-1u72
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 10:54:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1750762473; x=1782298473;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZDrXoWnndqa2vP7h7oVAnPKn8tyXmeoTROzM7osLRaQ=;
  b=LZGMasI6g3aVgOWdja1R0dNalHnI4tw6aoZhs8iqaQS14cVjT71i4TcZ
   03O0k/pXm4oasGP8xAZ6DRK/QowgeLMe2m4j4psK8reDg8LfwiHo2uSBu
   ZiGdQruWgyVQuDPwc6qEymZNBJqdoAPtH6biBLV211VefmmllFiBKVYBo
   SrRKk7UT5Kgbgo35gAe9eYSvYJNSTjPtXmP0CJwg237lcStDt0E+rXCeL
   nv6LGDpDT9mf4ppVU40vQCm/Xq56Y8oby6doykKudQKZZXtyUvA0xD2wt
   dt6LXQ0bf4oO/Rgjm9JWD8uHkYClcxHaKBN8PXzMc61XJJzZbdUP1mygh
   A==;
X-CSE-ConnectionGUID: Y/2Wc9ADSIyEQrYh8V8o/Q==
X-CSE-MsgGUID: 1k+kQCi2QAmp/xf/Q3TUQg==
X-IronPort-AV: E=Sophos;i="6.16,261,1744063200"; 
   d="scan'208";a="44816894"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Jun 2025 12:54:32 +0200
X-CheckPoint: {685A83E8-18-ABFC28F4-D6731B76}
X-MAIL-CPID: 88C29F62DA19E3BAB304661456A96FB2_5
X-Control-Analysis: str=0001.0A006377.685A83F4.000A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A3FCB165D2D;
	Tue, 24 Jun 2025 12:54:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1750762468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZDrXoWnndqa2vP7h7oVAnPKn8tyXmeoTROzM7osLRaQ=;
	b=jJg2hfggHCq7Sw+mIkyHvnYh4/i0uwxuatemB8F1wswlM1Oms4HrGNv59UmxlguwbOys6u
	F5pg3LDXahas4XtUOGPQjjROiQRsQ9kH5rxLLR6aep6MljqRHeLUYPnjs01qMhjSNwCPEf
	VWk7idJ3uHXt+6VEc5qFqwE+B0/LP344Z2TDpXPjwfMd8iZWOXx/f5o8gC/qnIIbmlG9Gk
	qe1l2uszG1BQVMIRU87uywZo859O3blj096aVCi/ex/BPz3OQ2Tp7GE6LG34hLYcAGyB5Y
	HrGUdsLpcdIQbtXFthtk4Lolwn3m8jivYmb2OR0Tfz6LBMwfwd3SyKfq0db7xg==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Whitcroft <apw@canonical.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tero Kristo <kristo@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v2 2/3] net: ethernet: ti: am65-cpsw: fixup PHY mode for fixed RGMII TX delay
Date: Tue, 24 Jun 2025 12:53:33 +0200
Message-ID: <9b3fb1fbf719bef30702192155c6413cd5de5dcf.1750756583.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750756583.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1750756583.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_035433_805347_6DA52D95 
X-CRM114-Status: GOOD (  13.87  )
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

All am65-cpsw controllers have a fixed TX delay, so the PHY interface
mode must be fixed up to account for this.

Modes that claim to a delay on the PCB can't actually work. Warn people
to update their Device Trees if one of the unsupported modes is specified.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 27 ++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index f20d1ff192efe..519757e618ad0 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -2602,6 +2602,7 @@ static int am65_cpsw_nuss_init_slave_ports(struct am65_cpsw_common *common)
 		return -ENOENT;
 
 	for_each_child_of_node(node, port_np) {
+		phy_interface_t phy_if;
 		struct am65_cpsw_port *port;
 		u32 port_id;
 
@@ -2667,14 +2668,36 @@ static int am65_cpsw_nuss_init_slave_ports(struct am65_cpsw_common *common)
 
 		/* get phy/link info */
 		port->slave.port_np = of_node_get(port_np);
-		ret = of_get_phy_mode(port_np, &port->slave.phy_if);
+		ret = of_get_phy_mode(port_np, &phy_if);
 		if (ret) {
 			dev_err(dev, "%pOF read phy-mode err %d\n",
 				port_np, ret);
 			goto of_node_put;
 		}
 
-		ret = phy_set_mode_ext(port->slave.ifphy, PHY_MODE_ETHERNET, port->slave.phy_if);
+		/* CPSW controllers supported by this driver have a fixed
+		 * internal TX delay in RGMII mode. Fix up PHY mode to account
+		 * for this and warn about Device Trees that claim to have a TX
+		 * delay on the PCB.
+		 */
+		switch (phy_if) {
+		case PHY_INTERFACE_MODE_RGMII_ID:
+			phy_if = PHY_INTERFACE_MODE_RGMII_RXID;
+			break;
+		case PHY_INTERFACE_MODE_RGMII_TXID:
+			phy_if = PHY_INTERFACE_MODE_RGMII;
+			break;
+		case PHY_INTERFACE_MODE_RGMII:
+		case PHY_INTERFACE_MODE_RGMII_RXID:
+			dev_warn(dev,
+				 "RGMII mode without internal TX delay unsupported; please fix your Device Tree\n");
+			break;
+		default:
+			break;
+		}
+
+		port->slave.phy_if = phy_if;
+		ret = phy_set_mode_ext(port->slave.ifphy, PHY_MODE_ETHERNET, phy_if);
 		if (ret)
 			goto of_node_put;
 
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


