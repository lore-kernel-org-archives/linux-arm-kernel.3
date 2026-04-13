Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C0AF531C0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 18:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/4Rz38FYHztW6Uw1aNeN0nYjBCQSBspRwjLSoc/tsM=; b=twvGAk3XyP+PXPDNz6oIZpirEu
	LkYr9mju9XobYKO3+l3fSIYj/PvoKhq3NMzS4OdKg+kCtsnnbW2Cpuf7CotcelVt7SUW/vxIpQ4pK
	A9a3JtaMci9oMhgLGYkeGy5WoneMZ03KzJlzdIfEIgDN6V96g1Zoo2HXvww8aU2jHSRU3UdcdRz9Z
	Z1rDxSa/+7R3Wy4f42we8EClmFv3eorMR3dRZRZ0vUIhSvg/i4/8zQ4RTUUVpXJCGKhQs1YybO9Op
	jY7SsevxiyAnT79tjx6bWvJDq9NnVxM/3MvV0lq3YVXzn1AOPxYgjXR3unxw/4dFjY17tchVrwWLt
	nT4IfGbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCMMB-0000000GEii-264l;
	Mon, 13 Apr 2026 18:49:59 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCMM9-0000000GEi7-1Rak
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 18:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7/4Rz38FYHztW6Uw1aNeN0nYjBCQSBspRwjLSoc/tsM=; b=AGyOB4mgu+d1VyICZUwGFZYT7Y
	K5ED2R/bZWOpa+WMGx1kypTsJun3aoDxwDmxuspMMi8EcrLx1zd1lR8YLlhb6vKyT0RW5WvpZKuYq
	cxURkcwXpCCLK6PzcmdaXdvjY/fnwnH6ieYN/E/WxIgSs3Exs3lizWZqArxy6t4V4LSnl7kvTLdPi
	NKPNRBKpUga6LGv9FxnneG2EIS6+HJjFwAgo8/2b0g9npPpfKIpu8RmkZ8uMhMciskcsRToRnu9Wz
	iV7yFrXKyKrG90eT1uK1AjJuoACzDOrH/29hAbh8zTS44fWhJtdDYIe1zAkCWmVTUzk3GCYry9qXn
	0LkeLXpw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51338)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wCMM1-000000000Bu-2Naq;
	Mon, 13 Apr 2026 19:49:49 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wCMLy-000000000RD-22Jt;
	Mon, 13 Apr 2026 19:49:46 +0100
Date: Mon, 13 Apr 2026 19:49:46 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Sam Edwards <cfsworks@gmail.com>
Subject: Re: [PATCH net-next] net: stmmac: enable RPS and RBU interrupts
Message-ID: <ad06yiZZbLC9k3jY@shell.armlinux.org.uk>
References: <E1wBBaR-0000000GZHR-1dbM@rmk-PC.armlinux.org.uk>
 <20260413110222.49fc3759@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413110222.49fc3759@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_114957_407145_0B7B41A8 
X-CRM114-Status: GOOD (  30.09  )
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

On Mon, Apr 13, 2026 at 11:02:22AM -0700, Jakub Kicinski wrote:
> On Fri, 10 Apr 2026 14:07:51 +0100 Russell King (Oracle) wrote:
> > Since we are seeing receive buffer exhaustion on several platforms,
> > let's enable the interrupts so the statistics we publish via ethtool -S
> > actually work to aid diagnosis. I've been in two minds about whether
> > to send this patch, but given the problems with stmmac at the moment,
> > I think it should be merged.
> 
> Sorry for a under-research response but wasn't there are person trying
> to fix the OOM starvation issue? Who was supposed to add a timer?
> Is your problem also OOM related or do you suspect something else?

It is not OOM related. I have this patch applied:

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 131ea887bedc..614d0e10e3e6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5095,14 +5095,18 @@ static inline void stmmac_rx_refill(struct stmmac_priv *priv, u32 queue)
 
 		if (!buf->page) {
 			buf->page = page_pool_alloc_pages(rx_q->page_pool, gfp);
-			if (!buf->page)
+			if (!buf->page) {
+				netdev_err(priv->dev, "q%u: no buffer 1\n", queue);
 				break;
+			}
 		}
 
 		if (priv->sph_active && !buf->sec_page) {
 			buf->sec_page = page_pool_alloc_pages(rx_q->page_pool, gfp);
-			if (!buf->sec_page)
+			if (!buf->sec_page) {
+				netdev_err(priv->dev, "q%u: no buffer 2\n", queue);
 				break;
+			}
 
 			buf->sec_addr = page_pool_get_dma_addr(buf->sec_page);
 		}

and it is silent, so we are not suffering starvation of buffers.

However, the hardware hangs during iperf3, and because it triggers the
MAC to stream PAUSE frames, and my network uses Netgear GS108 and GS116
unmanaged switches that always use flow-control between them (there's no
way not to) it takes down the entire network - as we've discussed
before. So, this problem is pretty fatal to the *entire* network.

With this patch, the existing statistical counters for this condition
are incremented, and thus users can use ethtool -S to see what happened
and report whether they are seeing the same issue.

Without this patch applied, there are no diagnostics from stmmac that
report what the state is. ethtool -d doesn't list the appropriate
registers (as I suspect part of the problem is the number of queues
is somewhat dynamic - userspace can change that configuration through
ethtool).

Thus, one has to resort to using devmem2 to find out what's happened.
That's not user friendly.

For me, devmem2 shows:

Channel 0 status register:
Value at address 0x02491160: 0x00000484
bit 10: ETI early transmit interrupt - set
bit 9 : RWT receive watchdog - clear
bit 8 : RPS receieve process stopped - clear
bit 7 : RBU receive buffer unavailable - set
bit 6 : RI  receive interrupt - clear
bit 2 : TBU transmit buffer unavailable - set
bit 1 : TPS transmit process stopped - clear
bit 0 : TI  transmit interrupt - clear

Debug status register:
Value at address 0x0249100c: 0x00006300
TPS[3:0] = 6 = Suspended, Tx descriptor unavailable or Tx buffer
		underflow
RPS[3:0] = 3 = Running, waiting for Rx packet

Metal Queue 0 debug register:
Value at address 0x02490d38: 0x002e0020
PRXQ[13:0] = 0x2e = 46 packets in receive queue
RXQSTS[1:0] = 2 = Rx queue fill-level above flow-control activate
		threshold
RRCSTS[1:0] = 0 = Rx Queue Read Controller State = Idle

> Firing interrupts when Rx fill ring runs dry (which IIUC this patches
> dies?) is not a good idea.

Well, I'm thinking that at least on some platforms, such as the Jetson
Xavier NX, unless a different solution can be found, we need the RBU
interrupt to fire off a reset of the stmmac IP when this happens to
reduce the PAUSE frame flood on the network.

If we can't do that, then I think stmmac on these platforms needs to be
marked with CONFIG_BROKEN because right now there doesn't seem to be any
other viable solution.

My intention with this patch is merely to start collecting the already
existing statistics so other users can start seeing whether they are
hitting the same or similar problem. If we're not prepared to do that,
then we should delete the useless statistics from ethtool -S, but I
suspect they're now part of the UAPI, even though without this patch
they will remain stedfastly stuck at zero.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

