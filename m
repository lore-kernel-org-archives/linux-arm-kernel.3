Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC82CCCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 12:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sS2LjI0klDvVB0dmqXZyC5y5oOZGFa6LEUVwRcQNfyA=; b=TcJWcEGyIEdWZegIkxNPRzDh0c
	CQ10xoSgQh6CKQMSoUubY6lYfHDJp0xAMHU5ZKLUCTXGdvsi1aIIjULwwGmAxhc2Np08zrlCkSrRp
	eEDgZlInKkkjzYp/dD2sAkCItbk37p/otx/g2p66MmZuSLQhQBfJe/EK9fHhaamrFVOvIdeZjb7Id
	eJw9zJ+pdMsVK+o50yDqSMQX14vSmz2Dv2ZFiH1cfGxb/WbPmV8Krs1a7+3+EEf/cuMyGexIkYJwM
	p9d8JaSB2mH3V2FwVYhjj0LT8tqrA4B44E4uv5ggcwyJLWSqcipI7vUihQ7QRX1V9q6hwooTwkQww
	1gFQVPzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4f1Q-0000000CI0f-3z32;
	Fri, 03 Oct 2025 12:36:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4f1O-0000000CI04-0cjO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 12:36:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1759494986; x=1791030986;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=RC9HyGQ6QSohaeISaCdw19nbbVwsVyT87/EVmTYnn1g=;
  b=niFdZzPy7DT9dmFztsiwOcc5yNqtZonvaXyI9lXUHz21TfLtfd31jaF+
   1csTzYKyy1Nf6gzpXDuB9gF+//NoBnDQT1bzezWFLMD6VKdXP0iD7AM6W
   /Hfr1ca4PVsoby9CdgJmGsxU4rPgysv+YL4ZDAX0fShN2WWH+CP7jyi1Z
   kdmbPcOjnjqvzcMnpqR8dWd7hvyq/fGDdWkJkDGt5KLakz4A+zLJy/sXJ
   CFVwRCqUV4l59cVDOCYtjMtRNEqpFZh7QN7j6UThF3pPFKVnmj2eRNHVZ
   gZMp8JTdEqHSde/yCqldSyDMlf7HH33eDbBzxVf5f37F8tjaLr/Zn95pW
   w==;
X-CSE-ConnectionGUID: 0nDMz/hwSCOo3uHbo/xgMA==
X-CSE-MsgGUID: JVDXOMwZQtaJThf3BLML/A==
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; 
   d="scan'208";a="278678034"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Oct 2025 05:36:23 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 3 Oct 2025 05:36:02 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 3 Oct 2025 05:36:00 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 3 Oct 2025 14:35:59 +0200
Subject: [PATCH net] net: sparx5/lan969x: fix flooding configuration on
 bridge join/leave
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20251003-fix-flood-fwd-v1-1-48eb478b2904@microchip.com>
X-B4-Tracking: v=1; b=H4sIAC7D32gC/x2M0QrCMBAEf6XsswdpS631V8SHNLnYA71IIiqU/
 rtXH2fZmRWVi3DFuVlR+C1Vshq0hwZh8XpjkmiMznVD61xPSb6U7jlHSp9I/cTpNMYjT2OAOc/
 Cdvj3LlB+4Wrj7CvTXLyGZU89vCi27QdxuJLkewAAAA==
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	<UNGLinuxDriver@microchip.com>
CC: Steen Hegelund <steen.hegelund@microchip.com>, <jacob.e.keller@intel.com>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_053626_366981_29DD741E 
X-CRM114-Status: GOOD (  16.74  )
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

The sparx5 driver programs UC/MC/BC flooding in sparx5_update_fwd() by
unconditionally applying bridge_fwd_mask to all flood PGIDs. Any bridge
topology change that triggers sparx5_update_fwd() (for example enslaving
another port) therefore reinstalls flooding in hardware for already
bridged ports, regardless of their per-port flood flags.

This results in clobbering of the flood masks, and desynchronization
between software and hardware: the bridge still reports “flood off” for
the port, but hardware has flooding enabled due to unconditional PGID
reprogramming.

Steps to reproduce:

    $ ip link add br0 type bridge
    $ ip link set br0 up
    $ ip link set eth0 master br0
    $ ip link set eth0 up
    $ bridge link set dev eth0 flood off
    $ ip link set eth1 master br0
    $ ip link set eth1 up

At this point, flooding is silently re-enabled for eth0. Software still
shows “flood off” for eth0, but hardware has flooding enabled.

To fix this, flooding is now set explicitly during bridge join/leave,
through sparx5_port_attr_bridge_flags():

    On bridge join, UC/MC/BC flooding is enabled by default.

    On bridge leave, UC/MC/BC flooding is disabled.

    sparx5_update_fwd() no longer touches the flood PGIDs, clobbering
    the flood masks, and desynchronizing software and hardware.

    Initialization of the flooding PGIDs have been moved to
    sparx5_start(). This is required as flooding PGIDs defaults to
    0x3fffffff in hardware and the initialization was previously handled
    in sparx5_update_fwd(), which was removed.

With this change, user-configured flooding flags persist across bridge
updates and are no longer overridden by sparx5_update_fwd().

Fixes: d6fce5141929 ("net: sparx5: add switching support")
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_main.c      |  5 +++++
 drivers/net/ethernet/microchip/sparx5/sparx5_switchdev.c | 12 ++++++++++++
 drivers/net/ethernet/microchip/sparx5/sparx5_vlan.c      | 10 ----------
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index 74ad1d73b465..40b1bfc600a7 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -708,6 +708,11 @@ static int sparx5_start(struct sparx5 *sparx5)
 	/* Init masks */
 	sparx5_update_fwd(sparx5);
 
+	/* Init flood masks */
+	for (int pgid = sparx5_get_pgid(sparx5, PGID_UC_FLOOD);
+	     pgid <= sparx5_get_pgid(sparx5, PGID_BCAST); pgid++)
+		sparx5_pgid_clear(sparx5, pgid);
+
 	/* CPU copy CPU pgids */
 	spx5_wr(ANA_AC_PGID_MISC_CFG_PGID_CPU_COPY_ENA_SET(1), sparx5,
 		ANA_AC_PGID_MISC_CFG(sparx5_get_pgid(sparx5, PGID_CPU)));
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_switchdev.c b/drivers/net/ethernet/microchip/sparx5/sparx5_switchdev.c
index bc9ecb9392cd..0a71abbd3da5 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_switchdev.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_switchdev.c
@@ -176,6 +176,7 @@ static int sparx5_port_bridge_join(struct sparx5_port *port,
 				   struct net_device *bridge,
 				   struct netlink_ext_ack *extack)
 {
+	struct switchdev_brport_flags flags = {0};
 	struct sparx5 *sparx5 = port->sparx5;
 	struct net_device *ndev = port->ndev;
 	int err;
@@ -205,6 +206,11 @@ static int sparx5_port_bridge_join(struct sparx5_port *port,
 	 */
 	__dev_mc_unsync(ndev, sparx5_mc_unsync);
 
+	/* Enable uc/mc/bc flooding */
+	flags.mask = BR_FLOOD | BR_MCAST_FLOOD | BR_BCAST_FLOOD;
+	flags.val = flags.mask;
+	sparx5_port_attr_bridge_flags(port, flags);
+
 	return 0;
 
 err_switchdev_offload:
@@ -215,6 +221,7 @@ static int sparx5_port_bridge_join(struct sparx5_port *port,
 static void sparx5_port_bridge_leave(struct sparx5_port *port,
 				     struct net_device *bridge)
 {
+	struct switchdev_brport_flags flags = {0};
 	struct sparx5 *sparx5 = port->sparx5;
 
 	switchdev_bridge_port_unoffload(port->ndev, NULL, NULL, NULL);
@@ -234,6 +241,11 @@ static void sparx5_port_bridge_leave(struct sparx5_port *port,
 
 	/* Port enters in host more therefore restore mc list */
 	__dev_mc_sync(port->ndev, sparx5_mc_sync, sparx5_mc_unsync);
+
+	/* Disable uc/mc/bc flooding */
+	flags.mask = BR_FLOOD | BR_MCAST_FLOOD | BR_BCAST_FLOOD;
+	flags.val = 0;
+	sparx5_port_attr_bridge_flags(port, flags);
 }
 
 static int sparx5_port_changeupper(struct net_device *dev,
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_vlan.c b/drivers/net/ethernet/microchip/sparx5/sparx5_vlan.c
index d42097aa60a0..494782871903 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_vlan.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_vlan.c
@@ -167,16 +167,6 @@ void sparx5_update_fwd(struct sparx5 *sparx5)
 	/* Divide up fwd mask in 32 bit words */
 	bitmap_to_arr32(mask, sparx5->bridge_fwd_mask, SPX5_PORTS);
 
-	/* Update flood masks */
-	for (port = sparx5_get_pgid(sparx5, PGID_UC_FLOOD);
-	     port <= sparx5_get_pgid(sparx5, PGID_BCAST); port++) {
-		spx5_wr(mask[0], sparx5, ANA_AC_PGID_CFG(port));
-		if (is_sparx5(sparx5)) {
-			spx5_wr(mask[1], sparx5, ANA_AC_PGID_CFG1(port));
-			spx5_wr(mask[2], sparx5, ANA_AC_PGID_CFG2(port));
-		}
-	}
-
 	/* Update SRC masks */
 	for (port = 0; port < sparx5->data->consts->n_ports; port++) {
 		if (test_bit(port, sparx5->bridge_fwd_mask)) {

---
base-commit: 07fdad3a93756b872da7b53647715c48d0f4a2d0
change-id: 20251003-fix-flood-fwd-39ef87d6e97c

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


