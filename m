Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A7BC624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 15:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Cx4Dy1nmFKcgtqNSRFgaoJet66cDkh7jqtI5aH6VoQ=; b=WF2qwErdqH5jJ5ZoxNj4m1oj5n
	oLjRg61T1MmnCnDr1lL2LHqaNmE2Nbs3CozJ0xJBUF0aY/mfb476YWFAxorbsjuh5uUj7pq6tH4nB
	JlBTHEWh7AXHrfYsfpcDON9BinRxMM69F96CqRiXPG1QWqKZTOX6HLGk0B+QZ9CTU8ycdWacjFKca
	a0MVyvTHQsr2q0hg74cxaqfEYtq83k28RImvovL2QArvNp9RcCKkJU8d2uiwjK27bphaM9D/yTxsg
	9v2kNzGq4MczOrSU6hElugifWYZ2TVAjnjGJD0b5nN3Xw/zN6urq+xEuN6raDrIfaIHGTFTq1k2lI
	Y8yhWGpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x146W-00000009u74-1KKH;
	Mon, 31 Aug 2026 15:39:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x146V-00000009u5u-1Tei;
	Mon, 31 Aug 2026 15:39:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+Cx4Dy1nmFKcgtqNSRFgaoJet66cDkh7jqtI5aH6VoQ=; b=XFh6+G0bqrYZMlp6c7S5+dvmA4
	K6XZDQ8xjRa/mJgLLQXA/rWy26iPkv3Y2/JhkxXmG5iAfTx7NPLMOIh4xOKS1OiEqaDAJmoUpFXjz
	7xjjct7zlfPItfRnvQlHCK5wSi/YJ86PWcYL8qCNyshXApJqUNxQ2bybHiH0HoNV1D2wcxfQyx2xC
	rnNqmMPmBE+Gwpg1q7esR/YrE7Sz8m6335yWr8iMJjA0pW1r6VZ1wmxoph1TmCqv10Rvy6SHjW54f
	OsTmFptTWs91Ad5XYfKfmq6mP/X9cSQlPP6P8IV0sIeXnTnkBuz9zcnTF9ZLpRb6ntlZTuOoJRqxM
	kHSxiTfQ==;
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x146S-0000000A0ew-2mkw;
	Mon, 31 Aug 2026 15:39:22 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1x146O-000000007DC-1v6P;
	Mon, 31 Aug 2026 15:39:16 +0000
Date: Mon, 31 Aug 2026 16:39:13 +0100
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
Subject: [PATCH net-next v5 8/9] net: dsa: mt7530: implement port_fast_age
Message-ID: <60f83ade0e371dfe2d974d5d192056935c3ab5c9.1788190568.git.daniel@makrotopia.org>
References: <cover.1788190568.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1788190568.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_163920_810540_DD8D6FD7 
X-CRM114-Status: GOOD (  18.37  )
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
write-then-poll command sequence, and log a message should the command
fail.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v5:
 * poll via regmap_read_poll_timeout()
 * check the ATC command write like the other command sequences do,
   and report the error code
v3:
 * take reg_mutex around the ATC flush and log on timeout
 * align the ATC_MAT_NON_STATIC_MAC define
 * correct the commit message which wrongly claimed per-port parity
   with b53/realtek
v2: no changes
---
 drivers/net/dsa/mt7530.c | 21 +++++++++++++++++++++
 drivers/net/dsa/mt7530.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 4edb57676143..84e0e888f2d0 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -188,6 +188,26 @@ mt7530_fdb_cmd(struct mt7530_priv *priv, enum mt7530_fdb_cmd cmd, u32 *rsp)
 	return 0;
 }
 
+static void mt7530_port_fast_age(struct dsa_switch *ds, int port)
+{
+	struct mt7530_priv *priv = ds->priv;
+	u32 val;
+	int ret;
+
+	mutex_lock(&priv->reg_mutex);
+
+	/* Flush all non-static MAC address entries */
+	val = ATC_BUSY | ATC_MAT_NON_STATIC_MAC | MT7530_FDB_FLUSH;
+	ret = regmap_write(priv->regmap, MT7530_ATC, val);
+	if (!ret)
+		ret = regmap_read_poll_timeout(priv->regmap, MT7530_ATC, val,
+					       !(val & ATC_BUSY), 20, 20000);
+	if (ret < 0)
+		dev_err(priv->dev, "fast age failed: %d\n", ret);
+
+	mutex_unlock(&priv->reg_mutex);
+}
+
 static void
 mt7530_fdb_read(struct mt7530_priv *priv, struct mt7530_fdb *fdb)
 {
@@ -3358,6 +3378,7 @@ static const struct dsa_switch_ops mt7530_switch_ops = {
 	.port_bridge_flags	= mt7530_port_bridge_flags,
 	.port_bridge_join	= mt7530_port_bridge_join,
 	.port_bridge_leave	= mt7530_port_bridge_leave,
+	.port_fast_age		= mt7530_port_fast_age,
 	.port_fdb_add		= mt7530_port_fdb_add,
 	.port_fdb_del		= mt7530_port_fdb_del,
 	.port_fdb_dump		= mt7530_port_fdb_dump,
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 6a148938c60f..2bbbe617b52e 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -166,6 +166,7 @@ enum mt753x_to_cpu_fw {
 #define  ATC_MAT_MASK			GENMASK(11, 8)
 #define  ATC_MAT(x)			FIELD_PREP(ATC_MAT_MASK, x)
 #define  ATC_MAT_MACTAB			ATC_MAT(0)
+#define  ATC_MAT_NON_STATIC_MAC		ATC_MAT(4)
 
 enum mt7530_fdb_cmd {
 	MT7530_FDB_READ	= 0,
-- 
2.55.0

