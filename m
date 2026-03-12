Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF45FED2FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 10:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9p0rSsXOHVPiLPE9YB/i36bApTaz8+E8i1mIA/i01iU=; b=0DxE6InjueP1YWiKVcoFzPF47+
	9a6NDc/6/9KQu5bU82M+bwIt4FVBw1zU2G4rBgIv4zL0oBZFHTIL7mXV3dFS4wxu6jLpTO02zGrdW
	EZTipwx/X48tMcVvv+1ntK1R2pt5j4Bm/MtAnkP1k1765RAVuiy9hYDCNfGiIhO7iTpTlcTdPpmdd
	cbkzeJWV5axa6Kr1GPBi083VIN6aka0IM8EizTT201I9Kk6SCTxY+OoLjZ1HCeOMyt61NTP3abvjE
	MRG4O6Wf9sHHmlH+B1JCHtjSTwEgRI3rqkXfXDEnyCim8cTATfDFAUVu31ohZGgXs/ra5/Z/M8P2s
	nUFHlODQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cym-0000000DpBu-1qhy;
	Thu, 12 Mar 2026 10:09:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cyj-0000000Dp9q-2oju
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 10:09:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9p0rSsXOHVPiLPE9YB/i36bApTaz8+E8i1mIA/i01iU=; b=jp+Vl+DBpgpqzLEJs+C4roudXb
	rrQXsVo5EyLP8KVIDMFPVdN8UILHrSKNrVmifuG/vl3SVGJN9RW3qW2Vn+REJ2p7ebHVShuRTjSXW
	dhJz/dsgIQn4s6Eo9GFzf1iQlry3hMOIn6v+4z9uNaz2BmHXAs/YxfW6i3l2wirkvRk+pxJqasx4A
	2/Gpu8nWgvie6KNbZGpzitLFWwQvwTU0caMjK4X2bFKCOXzufWv0HV6WOX8oCjbiFiGsB31Sc55O3
	4KI5cjmungp9xp8IDWnVLFvxT/oNXa4C6Vm+CaFppoeLaB8cK22IOYSJ1omqJns94UJz7+dVt4rT3
	8qhoCTng==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51212 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w0cyX-000000007Xg-2B7s;
	Thu, 12 Mar 2026 10:09:05 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w0cyV-0000000CzG4-05JW;
	Thu, 12 Mar 2026 10:09:03 +0000
In-Reply-To: <abKQWloxp9_4OuJh@shell.armlinux.org.uk>
References: <abKQWloxp9_4OuJh@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: [PATCH net-next v2 03/15] net: stmmac: clean up
 stmmac_clear_rx_descriptors()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w0cyV-0000000CzG4-05JW@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Mar 2026 10:09:03 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_030917_707994_9475FDBC 
X-CRM114-Status: GOOD (  11.18  )
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

The two paths calling stmmac_init_rx_desc() are identical apart from
the way the pointer to the descriptor is fetched. Split this out.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 0dcf4a31e314..765b168df50d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1514,20 +1514,20 @@ static void stmmac_clear_rx_descriptors(struct stmmac_priv *priv,
 					u32 queue)
 {
 	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
+	struct dma_desc *desc;
 	int i;
 
 	/* Clear the RX descriptors */
-	for (i = 0; i < dma_conf->dma_rx_size; i++)
+	for (i = 0; i < dma_conf->dma_rx_size; i++) {
 		if (priv->extend_desc)
-			stmmac_init_rx_desc(priv, &rx_q->dma_erx[i].basic,
-					priv->use_riwt, priv->mode,
-					(i == dma_conf->dma_rx_size - 1),
-					dma_conf->dma_buf_sz);
+			desc = &rx_q->dma_erx[i].basic;
 		else
-			stmmac_init_rx_desc(priv, &rx_q->dma_rx[i],
-					priv->use_riwt, priv->mode,
-					(i == dma_conf->dma_rx_size - 1),
-					dma_conf->dma_buf_sz);
+			desc = &rx_q->dma_rx[i];
+
+		stmmac_init_rx_desc(priv, desc, priv->use_riwt, priv->mode,
+				    (i == dma_conf->dma_rx_size - 1),
+				    dma_conf->dma_buf_sz);
+	}
 }
 
 /**
-- 
2.47.3


