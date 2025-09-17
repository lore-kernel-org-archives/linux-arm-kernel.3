Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629EFCA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 11:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZRj/4H91whAlv/2FSqyzU0rq195daF1/S6HV3aykM0k=; b=Fy0dk8FLvgo7Mley33X1nING+l
	xWfCk5nC5jxH21oL9olL5fB+5aUajba+LmBsGXolpgobzNY56nrIlgjYqhc3dYcsoFp+pwUwY8Ooh
	gSi0kh77fELvUT4UMLimNcJkoJnHXWtWQm/LP3d7ia1H5U7Ik9fWe6+BcOkRocyFhDPcGfhsNY/Tr
	5DJOHgD7d6VCswJVc9KumorGhpfDHSWS50vDSCSKMuwXTyw2Ko3PCk58oAAgNc97RYLLScj+BbdtS
	DNxBKS0h8R4PRlIIcSdBNlzoJeWpHhUhCrCu7gI1laK8wO06QQzdS6VzyPknwaSUCkweIdI+OZgr5
	2pI38qDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyqgO-0000000BBJs-1Jnk;
	Wed, 17 Sep 2025 11:50:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyqgL-0000000BBJ6-1l1F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 11:50:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758109841; x=1789645841;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=BmWJ8dm6tF3d7RA48fjDGm1mzg7DGhaw55N9cwl8YL8=;
  b=iDcyKBwG9tilaS217AxKN+RbSBW3m4IAwOXBc/K6vhfH9wX/7WipyFu9
   6Jcl5WRVuDpDMNMwbMjzYpPfYhgy25JMpJmcIQNl5eZEhPh03ScABrqqe
   qahENTj5D300el2uh2qQyssKqKrm5mlqG0BwANCE+yXoJ+fttCG97bhP5
   Q+7LXzQG87NwkD/HT/Th7zke70409pY0TbCrdwd4pmuVh0S1cswIKTGdJ
   ZYlJQuqDKpKYnf+GZ0dxWyL0xddtXR7M3/YVvqPnPvCMigb8UX5KVlUZQ
   cJ2Wkf1Usdtg4cS8EaAMB4dKXvMxidvRp1JGcD5SGNg9sdx6h2PHEQCBT
   Q==;
X-CSE-ConnectionGUID: xPqELcc0QeOcVfzESf+PTg==
X-CSE-MsgGUID: lC9pw1FtSr+km1Jn39f1Nw==
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; 
   d="scan'208";a="47157749"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Sep 2025 04:50:39 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 17 Sep 2025 04:50:23 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 17 Sep 2025 04:50:20 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Wed, 17 Sep 2025 13:49:43 +0200
Subject: [PATCH net-next] net: sparx5/lan969x: Add support for ethtool
 pause parameters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250917-802-3x-pause-v1-1-3d1565a68a96@microchip.com>
X-B4-Tracking: v=1; b=H4sIAFagymgC/x2MQQ6DMAwEv4J8rqXEUVToV6oeDJjiQ12UQBUJ8
 fcGjqPdmR2yJJUMj2aHJD/N+rUK/tbAMLO9BXWsDOQous7fsXWEoeDCWxb0HY1TbCOFEKAqS5J
 Jy5V7gsmKJmWFV116rvc+sQ3zmfuwGhzHHyPOYGR/AAAA
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, Russell King
	<linux@armlinux.org.uk>
CC: <jacob.e.keller@intel.com>, Robert Marko <robert.marko@sartura.hr>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_045041_527311_3C03E036 
X-CRM114-Status: GOOD (  12.01  )
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

Implement get_pauseparam() and set_pauseparam() ethtool operations for
Sparx5 ports.  This allows users to query and configure IEEE 802.3x
pause frame settings via:

ethtool -a ethX
ethtool -A ethX rx on|off tx on|off autoneg on|off

The driver delegates pause parameter handling to phylink through
phylink_ethtool_get_pauseparam() and phylink_ethtool_set_pauseparam().

The underlying configuration of pause frame generation and reception is
already implemented in the driver; this patch only wires it up to the
standard ethtool interface, making the feature accessible to userspace.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_ethtool.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_ethtool.c b/drivers/net/ethernet/microchip/sparx5/sparx5_ethtool.c
index 832f4ae57c83..049541eeaae0 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_ethtool.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_ethtool.c
@@ -1212,6 +1212,22 @@ static int sparx5_get_ts_info(struct net_device *dev,
 	return 0;
 }
 
+static void sparx5_get_pauseparam(struct net_device *dev,
+				  struct ethtool_pauseparam *pause)
+{
+	struct sparx5_port *port = netdev_priv(dev);
+
+	phylink_ethtool_get_pauseparam(port->phylink, pause);
+}
+
+static int sparx5_set_pauseparam(struct net_device *dev,
+				 struct ethtool_pauseparam *pause)
+{
+	struct sparx5_port *port = netdev_priv(dev);
+
+	return phylink_ethtool_set_pauseparam(port->phylink, pause);
+}
+
 const struct ethtool_ops sparx5_ethtool_ops = {
 	.get_sset_count         = sparx5_get_sset_count,
 	.get_strings            = sparx5_get_sset_strings,
@@ -1224,6 +1240,8 @@ const struct ethtool_ops sparx5_ethtool_ops = {
 	.get_eth_ctrl_stats     = sparx5_get_eth_mac_ctrl_stats,
 	.get_rmon_stats         = sparx5_get_eth_rmon_stats,
 	.get_ts_info            = sparx5_get_ts_info,
+	.get_pauseparam         = sparx5_get_pauseparam,
+	.set_pauseparam         = sparx5_set_pauseparam,
 };
 
 int sparx_stats_init(struct sparx5 *sparx5)

---
base-commit: 5e87fdc37f8dc619549d49ba5c951b369ce7c136
change-id: 20250917-802-3x-pause-192df5852333

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


