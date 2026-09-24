Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2DCC98310
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 06:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+aDnBPe6Fe8ZVXl+yIt16LOFB9XYRmkMboC0hDkoW0=; b=ACH031TccXVcsFj1vZ98zWRa5L
	MpUeCBaUSB2IT5k7h14qBYTFLFzCXWPHkhn0o33aFE4tNmie7+dRstjjrajGEZwgK0saQwIKGErFp
	cQG2YYRxJcwjr5OBzeeKikd9o3XBAO+TniL3q7EHRZTJZ3iDLGo5nPT2x5TtOubbNRN4pVepnNYCb
	Fl3XthyqgRRY7P5292yM2AkjUJspTQwxm3+tWS4SrBsQTuJgvC1aod+ApUbz4x3lu+f7Dx04GU/pf
	BKjn6dKF/qIKUdm5pCwKrEFnSnEsCP6/QAfIGMhNqrgWPf97kl8WImOBwJNrpBt5G+ePY+NZvkogI
	OpaeUAiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dBQ-0000000AAl2-1QJL;
	Thu, 24 Sep 2026 06:43:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dBP-0000000AAks-1LUL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 06:43:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 65C6A600AA;
	Thu, 24 Sep 2026 06:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1AF01F000FF;
	Thu, 24 Sep 2026 06:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790232230;
	bh=8+aDnBPe6Fe8ZVXl+yIt16LOFB9XYRmkMboC0hDkoW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WVxUBLLEsP97RLZPooJ8iLZlylwhI3IHUEcRwN90QZNfoMLn49qpcrlGtA7/TtLFu
	 mXifHSgg+0RI0KmPwytBN5yDS39a8uwDkniVYuUzqiR+8TIPsLg8OlWckb4FaGTK6+
	 G/wVW55tOOSi+zGXFJlrev0sVcekMW3fQ4k328plRClRFnjhQVjvJibIwzf72QHEhB
	 WRG+d3Dr6KajQzV9cTA6/zhXHgxAFz8KU9/hUgeD2PW0SV1xLb9E26D3FK5uYPDtBN
	 dnWTZu58Av0FO7t5i937AyYVVtoKjq5bubYxd2nGJYQ2181qwVQDpBJFghdiQ2zDpO
	 nvRrAxWoyEKFA==
Date: Thu, 24 Sep 2026 07:43:43 +0100
From: Simon Horman <horms@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: netdev-bot+sashiko@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horatiu.vultur@microchip.com,
	steen.hegelund@microchip.com, UNGLinuxDriver@microchip.com,
	ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
	john.fastabend@gmail.com, sdf@fomichev.me, herve.codina@bootlin.com,
	arnd@arndb.de, gregkh@linuxfoundation.org, mohsin.bashr@gmail.com,
	richardcochran@gmail.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v7 11/14] net: lan966x: add PCIe FDMA MTU change
 support
Message-ID: <20260924064343.GX13925@horms.kernel.org>
References: <20260918-lan966x-pci-fdma-v7-11-0ecc179c8a2c@microchip.com>
 <179008205354.2160803.17637640817184992984@kernel.org>
 <20260923094622.gmxyw46ligz4rsyd@DEN-DL-M70577.microsemi.net>
 <20260923193929.GW13925@horms.kernel.org>
 <20260923200712.jirfdepdpv5vm45m@DEN-DL-M70577.microsemi.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260923200712.jirfdepdpv5vm45m@DEN-DL-M70577.microsemi.net>
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

On Wed, Sep 23, 2026 at 10:07:12PM +0200, Daniel Machon wrote:
> > On Wed, Sep 23, 2026 at 11:46:22AM +0200, Daniel Machon wrote:
> > > > Thank you for your contribution! Sashiko AI review found 4 potential
> > > > issue(s) to consider.
> > > >
> > > > Critical: 0 · High: 2 (2) · Medium: 1 (1) · Low: 1
> > > >
> > > > If you believe none of the issues are legitimate, please reply to each
> > > > issue of Medium severity or higher and explain why the AI is wrong.
> > > > If any of them are legitimate and you plan to respin, please let patchwork
> > > > know by including "pw-bot: cr" as a separate line at the end of your reply
> > > > (one such reply per series is enough).
> > > >
> > > > - [High] MTU change during or after PCIe FDMA teardown runs the full
> > > >   reload on freed/quiesced state: unbounded napi_disable() while holding…
> > > > - [High] The new resize readiness check publishes lan966x->rx.lan966x
> > > >   before the PCI FDMA rings exist, so an MTU change can race with ring…
> > > > - [Medium] The new PCIe resize path retires DMA rings and tears down
> > > >   their ATU outbound window without ever confirming the hardware is…
> > > > - [Low] FDMA_PCI_DB_SIZE_MAX / FDMA_PCI_MAX_MTU perform unsigned
> > > >   arithmetic with no underflow guard and no BUILD_BUG_ON, even though…
> > > >
> > > > Pre-existing issues:
> > > > - [High] The hazard the new PCIe reload path documents and avoids is
> > > >   still live in the sibling platform reload path, which this series…
> > > > - [High] The two implementers of lan966x_fdma_ops::fdma_resize now
> > > >   disagree about the 'rings not built yet' precondition, and the…
> > > > - [Medium] Window in which DEV_MAC_MAXLEN_CFG exceeds the DCB buffer
> > > >   size, combined with a missing SOF/EOF check in…
> > > >
> > > > --
> > > >
> > > > net: lan966x: add PCIe FDMA MTU change support
> > > >
> > > > This adds MTU change support to the PCIe FDMA path by reallocating the
> > > > contiguous ATU-mapped RX and TX rings at the new size and falling back to
> > > > the old buffers on failure.  It also caps the PCIe DCB ring at 256 entries
> > > > and advertises a derived dev->max_mtu (FDMA_PCI_MAX_MTU) when the FDMA is
> > > > in use.
> > > >
> > > > A few questions below about the new reload path and the new size macros.
> > > >
> > > > > diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c
> > > > > index 5d6902459f20..940425beec2f 100644
> > > > > --- a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c
> > > > > +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma_pci.c
> > > > > @@ -358,7 +358,7 @@ static int lan966x_fdma_pci_init(struct lan966x *lan966x)
> > > > >       lan966x->rx.lan966x = lan966x;
> > > > >       lan966x->rx.max_mtu = lan966x_fdma_get_max_frame(lan966x);
> > > > >       rx_fdma->channel_id = FDMA_XTR_CHANNEL;
> > > > > -     rx_fdma->n_dcbs = FDMA_DCB_MAX;
> > > > > +     rx_fdma->n_dcbs = FDMA_PCI_DCB_MAX;
> > > > >       rx_fdma->n_dbs = FDMA_RX_DCB_MAX_DBS;
> > > > >       rx_fdma->priv = lan966x;
> > > > >       rx_fdma->db_size = FDMA_PCI_DB_SIZE(lan966x->rx.max_mtu);
> > > >
> > > > [Severity: High]
> > > > Can an MTU change race with ring construction here?  lan966x_fdma_pci_init()
> > > > sets rx.lan966x before it fills in channel_id/n_dcbs/n_dbs/db_size/size and
> > > > before the two sleeping allocations in lan966x_fdma_pci_rx_alloc() and
> > > > lan966x_fdma_pci_tx_alloc().
> > > >
> > > > The netdevs are already live at that point: lan966x_probe() runs the whole
> > > > port loop, including lan966x_probe_port()->register_netdev() and
> > > > lan966x_port_init()->lan966x_fdma_netdev_init()->netif_napi_add()+
> > > > napi_enable(), and only calls ops->fdma_init() afterwards, without holding
> > > > RTNL.
> > > >
> > > > So an rtnl-held ndo_change_mtu in that window sees rx.lan966x != NULL, passes
> > > > the new guard in lan966x_fdma_pci_resize(), finds a max_mtu that differs from
> > > > the partially initialised rx.max_mtu, and enters __lan966x_fdma_pci_reload().
> > > > Both contexts then write the same lan966x->rx.fdma / lan966x->tx.fdma:
> > > >
> > > >   lan966x_fdma_pci_reload()
> > > >       lan966x_fdma_rx_disable(&lan966x->rx)   /* channel_id still 0 */
> > > >       lan966x->rx.fdma.atu_region = NULL;     /* under probe's feet */
> > > >       lan966x_fdma_pci_rx_alloc(&lan966x->rx) /* second ring */
> > > >
> > > > Does this leak probe's ring plus its ATU region (only
> > > > FDMA_PCI_ATU_REGION_MAX == 6 exist), or trip WARN_ON(fdma->atu_region) /
> > > > -ENOSPC in fdma_pci_atu_region_map()?  And on the failure branch,
> > > > lan966x_fdma_pci_reset_mem() dereferences tx->fdma.atu_region->base_addr,
> > > > which is NULL in a snapshot taken before probe allocated it.
> > >
> > > Yes, same issue as adressed in #4. Theres a race because netdevs are registered
> > > before initialization (in this case FDMA) has happened. The proper fix is a
> > > reordering of the probe initialization.
> > 
> > Hi Daniel,
> > 
> > I'm wondering if you could expand on this a little. I'm unsure what #4
> > refers to. And I'm unclear if you are planing the reordering as part
> > of this patchset.
> 
> Hi Simon,
> 
> Yes, sorry for being vague here.
> 
> #4 refers to patch 4, where I explained that the issue reported there was really
> due to the existing probe initialization order and netdev registration order.
> Sashiko seems to report multiple race issues that can happen since the netdevs
> are registered before the HW is fully initialized. This is real, and something
> that needs to be fixed, just not in this series, IMHO.

Understood. I think that from the perspective of avoiding scope-creep
your approach makes sense.

> For Sparx5 and lan969x, I fixed this not long ago, and made sure that netdevs
> were registered last in probe, as they should be. Now, lan966x should get the
> same treatment, as a separate fix series for net. :-)

Reviewed-by: Simon Horman <horms@kernel.org>




