Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A897C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 15:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6kFiOyl3mCK6cw9o4LxP6/hgcZuL0FaC5vJyvR8E9U=; b=H7Q6jixWIdIjInzTNJSUpWlxiI
	rxLRLEKITLogCvfv89zU5CUgJkGr2i3qNkPl9SWUdLf5EpawEiIWJ5iaKms1KpX0EsuLIRi/rdodG
	oASRVpjxYLbF3lmIhqouL6M+OusQ+wqQSSG8n/K+QT+1ACgImhvgBM8UyG2OwJUjNIt6laMhXPJ/0
	goDC9VboH25iVJZt6zI+CnHqxmcTTrGW3DEj70KewEx6CSjMROC32T0I0Yju+Y2ZYq1IYInpdXlKg
	tL7T0Ttj7ApRHiLXv2xgqXCfaK8kkHc9GoxZoYUYy0keS/Ssp05cUQfISjc0PVtMPt2JjaXuecFHZ
	hi+cm2ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x146i-00000009uD8-3BmO;
	Mon, 31 Aug 2026 15:39:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x146i-00000009uCa-0qnQ;
	Mon, 31 Aug 2026 15:39:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=z6kFiOyl3mCK6cw9o4LxP6/hgcZuL0FaC5vJyvR8E9U=; b=M/FdZckC/EqvWHITqg7vcvrHTG
	BqQcuk6bqOlLN90c/Pc5x87mCg/uUTamj2GEBmKW824H8yQedL1EpS+QoEs8FP6+NTK7xwrqpXD51
	jyxok3idflZbKwRMXqukNq8tPWORoWmqd+ya9lPjDaYLy7PN1PnrJicJ1m3hxPg+eT7jjddJXPcwT
	+aY0p3AVd1AkN8wQnYlsajTI9HRfoVLbMbZ+vmcap172M9xDUXz19dCapoPBLG99ySEwB2r8m1RBt
	V2/3gcfU8H01lb/Cl/tTCkNT7Ofx3Wue4nIlkhMSlRBS0IrtPKNMTzRN20K2k2s3WGbly/s1XeDiG
	YRGs/3xA==;
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x146f-0000000A0gR-0h2z;
	Mon, 31 Aug 2026 15:39:34 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1x146b-000000007Dl-0Vr2;
	Mon, 31 Aug 2026 15:39:29 +0000
Date: Mon, 31 Aug 2026 16:39:26 +0100
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
Subject: [PATCH net-next v5 9/9] net: dsa: mt7530: implement
 port_change_conduit op
Message-ID: <cfc6a478a384a7f309f08d9f76be8fd029c1f202.1788190568.git.daniel@makrotopia.org>
References: <cover.1788190568.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1788190568.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_163933_395598_B2153695 
X-CRM114-Status: GOOD (  19.00  )
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

The switches on the MT7988, EN7581, AN7583 and EN7528 SoCs only have a
single CPU port, leaving no other conduit to change to.

As the op lives in the shared mt7530_switch_ops, populate the extack
when rejecting the unsupported variants instead of returning a bare
-EOPNOTSUPP. Also reject a conduit that belongs to a different switch
in the tree, whose port index has no meaning in the local port matrix.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Acked-by: Chester A. Unal <chester.a.unal@arinc9.com>
---
v5: list EN7528, added by commit cf23fcc9437e ("net: dsa: mt7530: add
    EN7528 support"), among the single-CPU-port switches
v4: no changes
v3:
 * populate the netlink extack on rejection
 * refuse a conduit that lives on a different switch
v2: extend commit message
---
 drivers/net/dsa/mt7530.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 84e0e888f2d0..28f94cd25b95 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3249,6 +3249,43 @@ static int mt753x_set_mac_eee(struct dsa_switch *ds, int port,
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
+	if (priv->id != ID_MT7531) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Changing DSA conduit is only supported on MT7531");
+		return -EOPNOTSUPP;
+	}
+
+	if (new_cpu_dp->ds != ds) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Cannot assign a conduit on a different switch");
+		return -EOPNOTSUPP;
+	}
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
@@ -3361,6 +3398,7 @@ static const struct dsa_switch_ops mt7530_switch_ops = {
 	.setup			= mt753x_setup,
 	.teardown		= mt753x_teardown,
 	.preferred_default_local_cpu_port = mt753x_preferred_default_local_cpu_port,
+	.port_change_conduit	= mt753x_port_change_conduit,
 	.get_strings		= mt7530_get_strings,
 	.get_ethtool_stats	= mt7530_get_ethtool_stats,
 	.get_sset_count		= mt7530_get_sset_count,
-- 
2.55.0

