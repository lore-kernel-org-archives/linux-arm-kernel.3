Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B833AC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 11:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=38wKAyJpUZ+v15BtZQhYo+REQajwTbN5pJiNx7WIgok=; b=Z0yqAKroNFdP1DNNqyreGRJnyg
	c7Fa+ARjndVDNWTkdQQp141Ea2Et5ml7F29vhJbkHx13KDVNJfofvKbA0wmv8Pc6u9/cyxfsUclwl
	vGT+Z/bmojVQJn5pX99K3Uf0lVFq3iE9e7PlOxK2BElNKvIlH4uy4PmNpGSApyxOR8PJrbiyR+ks2
	sOYbXky7NJl9xhA/56y+Po4BoHF983OFwl1YzbFMteEu0bj1ZGPVLlVmvcm1GD54iPkHvbl+Wqh8X
	WvHDd2oC4Pas2WFH4BXQbZGgy1t+7eYbjErTHtL/ZE7j5wHxctecinH5NeZTfy3kUW15c5qhThkdx
	cbf0m0yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ehA-00000005b96-3GhX;
	Tue, 15 Apr 2025 11:43:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dNs-00000005In4-3XXR
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Apr 2025 10:19:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=38wKAyJpUZ+v15BtZQhYo+REQajwTbN5pJiNx7WIgok=; b=ZzzIUCCA0xLiQm2woyqtLLk+pA
	RU7m3BOpVjCpIDLJZsIlgUcTrEzsHBqJrHIotJFPRXI7y92658iqPGBTfzpkUOGJ1XClSSSOfBvon
	xAcRcKVr0x5Hzi0CoyiyCZWJXDQzHQt2cyVSJJnkF1vLqJ96U/29O6lXZk/wn+w4JjvL2rsqKB5fg
	d4qRaXDCtvbriGwRz6bukkGdXHhabVosN3ww3P/b+9kAp8Xmfn63LCl5GaZlUxlIXwaKNQsaqnkD3
	Y7wvJEbRkrErgyguR593cUcqY2SXwxnYnBcnRBn1T9/ySAK6Z92Do1LlvnMEPy73An2cpif6bWwlM
	1dEeq+9Q==;
Received: from mx1.tq-group.com ([93.104.207.81])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u4dNp-00000009qy8-1MII
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 10:19:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744712352; x=1776248352;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=38wKAyJpUZ+v15BtZQhYo+REQajwTbN5pJiNx7WIgok=;
  b=qxukwvQoFP17VD6HAo7VVCzIwqpx0NS53uZKqjyWj8M6zJwlCy6U48Kp
   18L7gMikZMqc9OmH475hW0Ysoyu9SC2rWo/yxjPkiuavDnOo7kNRtTc8S
   ykdnTlNqBz2BRQwTUvPrx6QrEW98BY2Nymcv59nn9mwdWx4LZwYg+yl/J
   TT4vUkaAagj+og+2jWFaKWhLepCx8MMlBtkxUQ15B4rGfmQp4w1GEbIwA
   DLoIWUtN4ZzxyDELnzTkifAFY5Pm294UXnQ/FnUTvvasyHWs8wxOjmakt
   1TPRz8Sp2pPRf5DHTMuTyh2LC9VuSrTvGc6N2F7IJZSjZMeBFQLBbBv3w
   g==;
X-CSE-ConnectionGUID: chtD1w7vRP6Ofi0sMP3uTA==
X-CSE-MsgGUID: LQIoltfBSHO2OCu1S8ThUw==
X-IronPort-AV: E=Sophos;i="6.15,213,1739833200"; 
   d="scan'208";a="43537787"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 15 Apr 2025 12:19:11 +0200
X-CheckPoint: {67FE32A0-0-903EAEAC-E04C76C8}
X-MAIL-CPID: 8CC79B74E1AFEF81D94ED3F9DF1A712D_5
X-Control-Analysis: str=0001.0A006399.67FE32A2.0015,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C055F164816;
	Tue, 15 Apr 2025 12:19:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744712347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=38wKAyJpUZ+v15BtZQhYo+REQajwTbN5pJiNx7WIgok=;
	b=KK4EGTVu4CbxJVmujnwSirrfhq0EqShvSvfGWnE8LgSityWXXC5qLDANzGW0Eh7eJoZX3K
	Y+Otmv/TEVe/L6AsWh9ezRZAu9tr4rlqnCmBEcA2M9JJsfEsVLl8chv375o/WOhgrFCjFW
	39v2mwrodLOGB9+m0BN1zkWWHH6QUVOFkjKOCntAYQ6pMPpALEKIJkVITLw0KQspDB9EyI
	qCEKpd4vg/wlcIgg1gzByjLL8EES7FzHtp8LL6Gkdpa7gKZPqTFbqQ6Bf4ApS3P9QEgUQn
	idATjL60jpohE9Vxtz21552FBsfGMXiDgitQT54YkZIk8GS0sQY1EAXsDsJwnQ==
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
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH net-next 3/4] net: ethernet: ti: am65-cpsw: fixup PHY mode for fixed RGMII TX delay
Date: Tue, 15 Apr 2025 12:18:03 +0200
Message-ID: <32e0dffa7ea139e7912607a08e391809d7383677.1744710099.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_111913_629342_5C6A747E 
X-CRM114-Status: GOOD (  13.86  )
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
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 27 ++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index c9fd34787c998..a1d32735c7512 100644
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
 		port->slave.port_np = port_np;
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


