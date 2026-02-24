Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0BAEFB819
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 09:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w0Xla7YvpmY0GVAfkZRw6ajF/x6+DgW95hZFJKTbQfA=; b=X137O8GDYhLIM4CWnQWze49oSC
	vaR1hsqWdWPqjO6Te3/gpX2z/ieaAvkx7yWXMu2yuTj/HD2fg7JcFuAqmo5eNbxVhDVuTXdVqm3jZ
	Kz2A0FIUyW0gJsaVHu0S/JW05KqymBDMJ3a2qFoyI3u0tIXbdFyNy4TldshiA72GzJ0iAbpTTZ8o/
	MOStfAWLOxsYlTFJrFyo1IgQQbGr0rsfaR5IET58U39c+wsBLIJ1ujEdGwuaXD3WiBOgovpPmL1bj
	Ud4qaSDmrfhPO43KUVt8Ky1DhwFVk+vHVkkFSeA7zZJI8PgLcQ3ilA3dzG03u1KJuOqFpzREblxj2
	BFUyGjBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoIq-00000001hZN-49Vi;
	Tue, 24 Feb 2026 09:02:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoIl-00000001hY9-3mPH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 09:02:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=w0Xla7YvpmY0GVAfkZRw6ajF/x6+DgW95hZFJKTbQfA=; b=1aCWlMMJBacFbSbFPTBQdkRKLN
	A0dtOVoLdZA2uO+DfN02/Rl0qYJMP0hjWjHhU0cEItXKbXoWKUC7DgM3ax1RJMJEyW+Rn3BfZlASL
	Xdy/d9R7PuBNn74bWevkBnFX9FoV5uNMZaYh+2if5FM/pzTpZwx+zSf1zHr9mwtla3jNP55F2j5fA
	75FTZwiEmVey/R7+pjgGy6b3jsgMnUH4i/9Zc3GXM2JzAzgJ+ACKuh3dTpncSIqbLoJvUPBw31qv7
	MWmo/YR2si/Nb0wXQQrTyRufAV6WgBE+l+LCbYwcb3f2+KDAJc88ocDHpF6dy3PoI+k0wS7a1zTKa
	z6EYTX1g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41976 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vuoIg-000000004yF-3QIo;
	Tue, 24 Feb 2026 09:01:50 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vuoIg-0000000Aout-0LyS;
	Tue, 24 Feb 2026 09:01:50 +0000
In-Reply-To: <aZ1o2dmfpeiubCik@shell.armlinux.org.uk>
References: <aZ1o2dmfpeiubCik@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 1/2] net: stmmac: use circ_buf helpers for
 descriptors
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vuoIg-0000000Aout-0LyS@rmk-PC.armlinux.org.uk>
Date: Tue, 24 Feb 2026 09:01:50 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_010155_941266_60887A3D 
X-CRM114-Status: GOOD (  13.02  )
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

The stmmac descriptor queues are circular buffers, operated as far as
the hardware is concerned as either a ring, or a chain that loops back
on itself. From the software perspective, it forms a circular buffer.

We have a few places which calculate the number of in-use and free
entries in these circular buffers, for which we have macros for.
Use CIRC_CNT() and CIRC_SPACE() as appropriate to calculate these
values.

Validating, for stmmac_tx_avail(), which uses CIRC_SPACE():

  dirty_tx = 1, cur_tx = 0 -> 0
  dirty_tx = 0, cur_tx = 0 -> dma_tx_size - 1
  dirty_tx = 0, cur_tx = 1 -> dma_tx_size - 2

dirty_tx passed as end, reduced by one. cur_tx passed as start.
Output on sane computers is identical.

For stmmac_rx_dirty(), which uses CIRC_CNT():

  dirty_rx = 1, cur_rx = 0 -> dma_rx_size - 1
  dirty_rx = 0, cur_rx = 0 -> 0
  dirty_rx = 0, cur_rx = 1 -> 1

dirty_rx passed as start, cur_rx passed as end. Output is identical.

Same validation performed on the is_last_segment calculation, which
also gets converted to CIRC_CNT().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 23 ++++++-------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a2a0985e8c37..2d74fe98ad61 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -14,6 +14,7 @@
 	https://bugzilla.stlinux.com/
 *******************************************************************************/
 
+#include <linux/circ_buf.h>
 #include <linux/clk.h>
 #include <linux/kernel.h>
 #include <linux/interrupt.h>
@@ -355,14 +356,9 @@ static void print_pkt(unsigned char *buf, int len)
 static inline u32 stmmac_tx_avail(struct stmmac_priv *priv, u32 queue)
 {
 	struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[queue];
-	u32 avail;
 
-	if (tx_q->dirty_tx > tx_q->cur_tx)
-		avail = tx_q->dirty_tx - tx_q->cur_tx - 1;
-	else
-		avail = priv->dma_conf.dma_tx_size - tx_q->cur_tx + tx_q->dirty_tx - 1;
-
-	return avail;
+	return CIRC_SPACE(tx_q->cur_tx, tx_q->dirty_tx,
+			  priv->dma_conf.dma_tx_size);
 }
 
 /**
@@ -373,14 +369,9 @@ static inline u32 stmmac_tx_avail(struct stmmac_priv *priv, u32 queue)
 static inline u32 stmmac_rx_dirty(struct stmmac_priv *priv, u32 queue)
 {
 	struct stmmac_rx_queue *rx_q = &priv->dma_conf.rx_queue[queue];
-	u32 dirty;
-
-	if (rx_q->dirty_rx <= rx_q->cur_rx)
-		dirty = rx_q->cur_rx - rx_q->dirty_rx;
-	else
-		dirty = priv->dma_conf.dma_rx_size - rx_q->dirty_rx + rx_q->cur_rx;
 
-	return dirty;
+	return CIRC_CNT(rx_q->cur_rx, rx_q->dirty_rx,
+			priv->dma_conf.dma_rx_size);
 }
 
 static bool stmmac_eee_tx_busy(struct stmmac_priv *priv)
@@ -4571,8 +4562,8 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	/* If we only have one entry used, then the first entry is the last
 	 * segment.
 	 */
-	is_last_segment = ((tx_q->cur_tx - first_entry) &
-			   (priv->dma_conf.dma_tx_size - 1)) == 1;
+	is_last_segment = CIRC_CNT(tx_q->cur_tx, first_entry,
+				   priv->dma_conf.dma_tx_size) == 1;
 
 	/* Complete the first descriptor before granting the DMA */
 	stmmac_prepare_tso_tx_desc(priv, first, 1, proto_hdr_len, 0, 1,
-- 
2.47.3


