Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B73ACD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 05:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VUNN+EqeCrI6hshkSelZ/2fH5SjAy+d4lENSjiwz3L4=; b=T4l5vtKUM6PgVEv3RrD2OhaOaX
	hGYdYuIrDAft3s7XjZ8rlP/E7KKgNTckWIG1z9xlDhWf8tWUd1wupEwUcTYGEMp+8Wa8HFKre5Rwb
	EIKqsEqPWKBS8MjWoc0Taw16+Apn32I442rsXI8I320eax1/N0NEoo2Q3feIdvOz1e4ODh641JvTz
	9o7S7yLy6r+nObU8vD8atYP7VMu579PfgzjxfndYrxd+OP8ar4m6wjnjfFe6pAfW9sVAfl+7m9y8Q
	n/EVqD2u8m5kVJfh825OvsTgbflgWJSpG5C1phw6UxwfVzo64eCBpGe6XVwyaX79Eki7nF3I5QIP1
	UhZJi8yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYzly-0000000DcFH-2Lbp;
	Mon, 15 Jun 2026 05:22:10 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYzlw-0000000DcBw-2kl3;
	Mon, 15 Jun 2026 05:22:09 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wYzlr-000000000yt-2vQw;
	Mon, 15 Jun 2026 05:22:03 +0000
Date: Mon, 15 Jun 2026 06:22:00 +0100
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
Subject: [PATCH net-next v3 7/8] net: dsa: mt7530: implement port_fast_age
Message-ID: <e43f2531f3117055563dcb246b015630c44a8308.1781500517.git.daniel@makrotopia.org>
References: <cover.1781500517.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1781500517.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_222208_696094_4A402971 
X-CRM114-Status: GOOD (  16.49  )
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

Implement the .port_fast_age DSA operation by flushing all non-static
(dynamically learned) MAC address entries from the address table.

The switch does not offer a combined "non-static AND per-port" match
mode, so the flush is global and the port argument is not used. Unlike
b53 and realtek, which flush the dynamic entries of the affected port
only, an STP topology change on one port therefore also flushes the
dynamically learned entries of the other ports; they are quickly
relearned.

Access the address table control register under priv->reg_mutex, as done
by all other ATC users (FDB and MDB add/del/dump), to serialise the
write-then-poll command sequence, and log a message should the flush
time out.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v3:
 * take reg_mutex around the ATC flush and log on timeout
 * align the ATC_MAT_NON_STATIC_MAC define
 * correct the commit message which wrongly claimed per-port parity
   with b53/realtek

v2: no changes

 drivers/net/dsa/mt7530.c | 23 +++++++++++++++++++++++
 drivers/net/dsa/mt7530.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 397f5c5e17e5..98fdd8dcd81c 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -193,6 +193,28 @@ mt7530_fdb_cmd(struct mt7530_priv *priv, enum mt7530_fdb_cmd cmd, u32 *rsp)
 	return 0;
 }
 
+static void mt7530_port_fast_age(struct dsa_switch *ds, int port)
+{
+	struct mt7530_priv *priv = ds->priv;
+	struct mt7530_dummy_poll p;
+	u32 val;
+	int ret;
+
+	mutex_lock(&priv->reg_mutex);
+
+	/* Flush all non-static MAC address entries */
+	val = ATC_BUSY | ATC_MAT_NON_STATIC_MAC | MT7530_FDB_FLUSH;
+	regmap_write(priv->regmap, MT7530_ATC, val);
+
+	INIT_MT7530_DUMMY_POLL(&p, priv, MT7530_ATC);
+	ret = readx_poll_timeout(mt7530_mii_poll, &p, val,
+				 !(val & ATC_BUSY), 20, 20000);
+	if (ret < 0)
+		dev_err(priv->dev, "fast age timeout\n");
+
+	mutex_unlock(&priv->reg_mutex);
+}
+
 static void
 mt7530_fdb_read(struct mt7530_priv *priv, struct mt7530_fdb *fdb)
 {
@@ -3319,6 +3341,7 @@ static const struct dsa_switch_ops mt7530_switch_ops = {
 	.port_bridge_flags	= mt7530_port_bridge_flags,
 	.port_bridge_join	= mt7530_port_bridge_join,
 	.port_bridge_leave	= mt7530_port_bridge_leave,
+	.port_fast_age		= mt7530_port_fast_age,
 	.port_fdb_add		= mt7530_port_fdb_add,
 	.port_fdb_del		= mt7530_port_fdb_del,
 	.port_fdb_dump		= mt7530_port_fdb_dump,
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 804c2e0991a0..241e3d460357 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -165,6 +165,7 @@ enum mt753x_to_cpu_fw {
 #define  ATC_MAT_MASK			GENMASK(11, 8)
 #define  ATC_MAT(x)			FIELD_PREP(ATC_MAT_MASK, x)
 #define  ATC_MAT_MACTAB			ATC_MAT(0)
+#define  ATC_MAT_NON_STATIC_MAC		ATC_MAT(4)
 
 enum mt7530_fdb_cmd {
 	MT7530_FDB_READ	= 0,
-- 
2.54.0

