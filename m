Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F0FCD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 01:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVlEg+idIlaAx1EdhQK83Op0V5ALA90zlD4FKnbBRIw=; b=rIGPN1qnHbmqMqdOGI53U1/s7D
	KjUKTCvdz/3XDrcUBsy6KHUEa01FLBPiM7NZVY0m6vxbSjh0I1WjMNSQw46etJfO5Udy8LRBoCinr
	rKHRQ9xm/rAXYmk429riqPL8O1q1h5aP9cL58fQ1zTe+TlxmxopoUxaHtmzIFT8vX9CvpZQHDgMjM
	VU/Rqtb/H0Mna5eUrwDLUfHCV2morujjUNK3Wv6xA8zeO9j3ktRPzqNLaN8Ru+Yqi1bAj/4596Q23
	O4TvCutjLxT8X4B16UwyzpIWM113EJ0RgAV0MDG6m8OOJj+uyF9N+mZPQswULEe/e65Mw78OmCaYf
	11kORjSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYCuh-0000000BsdI-352U;
	Sat, 13 Jun 2026 01:11:55 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYCue-0000000BsZ1-3PPh;
	Sat, 13 Jun 2026 01:11:55 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wYCuZ-000000007ND-3RCH;
	Sat, 13 Jun 2026 01:11:47 +0000
Date: Sat, 13 Jun 2026 02:11:45 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v2 8/8] net: dsa: mt7530: implement
 port_change_conduit op
Message-ID: <8dd8cfe32bc8e38b92c49e30a6255090fb0998fb.1781312667.git.daniel@makrotopia.org>
References: <cover.1781312667.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1781312667.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_181152_871151_FCC22B81 
X-CRM114-Status: GOOD (  16.09  )
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

Allow changing the CPU port affinity of user ports at runtime via the
IFLA_DSA_CONDUIT netlink attribute. This updates the port matrix to
forward to the new CPU port instead of the old one.

Limit the operation to MT7531. There, trapped link-local frames follow
the per-port affinity, as the MT7531_CPU_PMAP destination mask is
further restricted by the port matrix. A conduit change is hence fully
honoured by the hardware, for regular traffic as well as for trapped
frames.

The MT7530 switch, including the variant embedded in the MT7621 SoC,
instead traps frames to the single CPU port set in the CPU_PORT field
of the MFC register, regardless of the affinity of the inbound user
port. With user ports affine to different CPU ports there is no
correct value for that field, so per-port CPU affinity cannot be fully
implemented for trapped frames. Routing a WAN port via the second SoC
GMAC is conventionally covered by the PHY muxing feature on these
switches, which bypasses the switch fabric and does not involve a CPU
port at all.

The switches on the MT7988, EN7581 and AN7583 SoCs only have a
single CPU port, leaving no other conduit to change to.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2: extend commit message

 drivers/net/dsa/mt7530.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index c96420c291d5..2f3e734b9f53 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3206,6 +3206,34 @@ static int mt753x_set_mac_eee(struct dsa_switch *ds, int port,
 	return 0;
 }
 
+static int
+mt753x_port_change_conduit(struct dsa_switch *ds, int port,
+			   struct net_device *conduit,
+			   struct netlink_ext_ack *extack)
+{
+	struct dsa_port *new_cpu_dp = conduit->dsa_ptr;
+	struct dsa_port *dp = dsa_to_port(ds, port);
+	struct mt7530_priv *priv = ds->priv;
+
+	if (priv->id != ID_MT7531)
+		return -EOPNOTSUPP;
+
+	mutex_lock(&priv->reg_mutex);
+
+	/* dp->cpu_dp still points to the old CPU port */
+	priv->ports[port].pm &= ~PCR_MATRIX(BIT(dp->cpu_dp->index));
+	priv->ports[port].pm |= PCR_MATRIX(BIT(new_cpu_dp->index));
+	if (priv->ports[port].enable)
+		regmap_update_bits(priv->regmap, MT7530_PCR_P(port),
+				   PCR_MATRIX_MASK, priv->ports[port].pm);
+
+	mutex_unlock(&priv->reg_mutex);
+
+	mt7530_port_fast_age(ds, port);
+
+	return 0;
+}
+
 static void
 mt753x_conduit_state_change(struct dsa_switch *ds,
 			    const struct net_device *conduit,
@@ -3317,6 +3345,7 @@ static const struct dsa_switch_ops mt7530_switch_ops = {
 	.setup			= mt753x_setup,
 	.teardown		= mt753x_teardown,
 	.preferred_default_local_cpu_port = mt753x_preferred_default_local_cpu_port,
+	.port_change_conduit	= mt753x_port_change_conduit,
 	.get_strings		= mt7530_get_strings,
 	.get_ethtool_stats	= mt7530_get_ethtool_stats,
 	.get_sset_count		= mt7530_get_sset_count,
-- 
2.54.0

