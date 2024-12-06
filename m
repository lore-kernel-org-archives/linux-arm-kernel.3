Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33003E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 12:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fOGpSJqozf26dVxmBeF8vIRHibOPe4MJoalCqug07Qc=; b=NHYjnstDB5onVNKZl5eUsCneYW
	EBzTp6bHoMS68UUP9NHfD3dbBu4OfjkWRIMK7ZK5knl+aLOq4eQg+npaDBDUtXW8gbiDcLlsrWIGf
	qo0LjvZUTM8qrn2JHgxaGHV4ai5v33lSI7/KEosGDI0FZxGwpVXSDpu9D901DmhwSGLKtuVl86ahc
	qxtT0YhRDcDbzCwcI9RVFR1uYAga57fVuYIEOnUkWDjeTETNfeP16xpMOfIJxZhM44THr3dnzFqZS
	xslTxjacLtqIwGaTFDUXTPWFiotiuq5yLGZv76KpL0GMfg6w3TftiksFr0HFnzGfn0q/DG5rJ4X4/
	wE2aI+FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJXh4-00000001bwn-227H;
	Fri, 06 Dec 2024 12:44:26 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJXfI-00000001bJL-2uZ1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 12:42:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fOGpSJqozf26dVxmBeF8vIRHibOPe4MJoalCqug07Qc=; b=lWrWWtWtS6V8FLcQmZwm+noR35
	caPPCLFIo+KloRv5ELucm544Cratny6sAhIU1iCcOxXbPSJ0DMF8sAInugAWqMwlnxdT4hgjI/ObL
	0SmvTOIdcnl6L8XQbucsfe4erswIwnipyAIfKTbFqLPtGGYn8WiFlD0rhK2d6Nw/5tUZsea8hnnSN
	jC3RHvpam93LPXgHMqz/jj77I2j2lzpOaT3gbxYVMw9zJa+mQm7ZFINypFJELKn+TsTHf373i92Gj
	hgyTGP4LgIA9cYT/danRMYVkMYHZaLidpkK9Azb21EfwDt6unjj434eX7W6AwojJGb5WxObeof53M
	gJaw1ETA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:59856 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tJXcz-0006FN-0B;
	Fri, 06 Dec 2024 12:40:13 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tJXcx-006N4Z-PC; Fri, 06 Dec 2024 12:40:11 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: netdev@vger.kernel.org,
	 linux-stm32@st-md-mailman.stormreply.com,
	 linux-arm-kernel@lists.infradead.org,
	 linux-kernel@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	 Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	 "David S. Miller" <davem@davemloft.net>,
	 Eric Dumazet <edumazet@google.com>,
	 Jakub Kicinski <kuba@kernel.org>,
	 Paolo Abeni <pabeni@redhat.com>,
	 MaximeCoquelin <mcoquelin.stm32@gmail.com>,
	 xfr@outlook.com,
	 Furong Xu<0x1207@gmail.com>,
	 Jon Hunter <jonathanh@nvidia.com>,
	 Thierry Reding <thierry.reding@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Furong Xu <0x1207@gmail.com>,
	Hariprasad Kelam <hkelam@marvell.com>
Subject: [PATCH net] net: stmmac: fix TSO DMA API usage causing oops
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tJXcx-006N4Z-PC@rmk-PC.armlinux.org.uk>
Date: Fri, 06 Dec 2024 12:40:11 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_044236_725576_F1886F52 
X-CRM114-Status: GOOD (  12.86  )
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

Commit 66600fac7a98 ("net: stmmac: TSO: Fix unbalanced DMA map/unmap
for non-paged SKB data") moved the assignment of tx_skbuff_dma[]'s
members to be later in stmmac_tso_xmit().

The buf (dma cookie) and len stored in this structure are passed to
dma_unmap_single() by stmmac_tx_clean(). The DMA API requires that
the dma cookie passed to dma_unmap_single() is the same as the value
returned from dma_map_single(). However, by moving the assignment
later, this is not the case when priv->dma_cap.addr64 > 32 as "des"
is offset by proto_hdr_len.

This causes problems such as:

  dwc-eth-dwmac 2490000.ethernet eth0: Tx DMA map failed

and with DMA_API_DEBUG enabled:

  DMA-API: dwc-eth-dwmac 2490000.ethernet: device driver tries to +free DMA memory it has not allocated [device address=0x000000ffffcf65c0] [size=66 bytes]

Fix this by maintaining "des" as the original DMA cookie, and use
tso_des to pass the offset DMA cookie to stmmac_tso_allocator().

Full details of the crashes can be found at:
https://lore.kernel.org/all/d8112193-0386-4e14-b516-37c2d838171a@nvidia.com/
https://lore.kernel.org/all/klkzp5yn5kq5efgtrow6wbvnc46bcqfxs65nz3qy77ujr5turc@bwwhelz2l4dw/

Reported-by: Jon Hunter <jonathanh@nvidia.com>
Reported-by: Thierry Reding <thierry.reding@gmail.com>
Fixes: 66600fac7a98 ("net: stmmac: TSO: Fix unbalanced DMA map/unmap for non-paged SKB data")
Tested-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 9b262cdad60b..c81ea8cdfe6e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4192,8 +4192,8 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	struct stmmac_txq_stats *txq_stats;
 	struct stmmac_tx_queue *tx_q;
 	u32 pay_len, mss, queue;
+	dma_addr_t tso_des, des;
 	u8 proto_hdr_len, hdr;
-	dma_addr_t des;
 	bool set_ic;
 	int i;
 
@@ -4289,14 +4289,15 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 
 		/* If needed take extra descriptors to fill the remaining payload */
 		tmp_pay_len = pay_len - TSO_MAX_BUFF_SIZE;
+		tso_des = des;
 	} else {
 		stmmac_set_desc_addr(priv, first, des);
 		tmp_pay_len = pay_len;
-		des += proto_hdr_len;
+		tso_des = des + proto_hdr_len;
 		pay_len = 0;
 	}
 
-	stmmac_tso_allocator(priv, des, tmp_pay_len, (nfrags == 0), queue);
+	stmmac_tso_allocator(priv, tso_des, tmp_pay_len, (nfrags == 0), queue);
 
 	/* In case two or more DMA transmit descriptors are allocated for this
 	 * non-paged SKB data, the DMA buffer address should be saved to
-- 
2.30.2


