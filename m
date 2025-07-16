Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEC9C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 08:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZaWeSIQ1ptx/KeTTpJD9e4ELx0X/wlrZF8/OCCCIU/U=; b=WLiLZQhPCu0gFoLCXBNEbRjMiH
	kRyQicKacLAwJXriOcULnoSnjtYgjIaiTts+DcHTBi2EqxX574FkNe4jc5JG+r4YffhXeaYj5aeeU
	IyDLkb2eAGBRZ6/1H8ZH1KdRUy5dEnCAuoR2k1apboePjHc08gQGLT8p19raoGV5HGEohHiMyuXm4
	NCUc+Z7XLnr0JBeLqCkxTxiLPOiADMoYv49+Aos1AeNjTwTfvIaBhH4SP1SunanT8oSnXU0+lUc2r
	myg32B09s44fFwhNfr4nJXdKBn7lx1xnGVqFjO9Zfh3vvNAlLv/oXlILwlC9z7U21FwRbHS1q28hs
	jd8RtgSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubxeV-00000007Bs5-1PLz;
	Wed, 16 Jul 2025 08:38:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubxP5-000000079fM-2wSk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 08:22:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F07F8A52F6F;
	Wed, 16 Jul 2025 08:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAA6EC4CEF0;
	Wed, 16 Jul 2025 08:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752654134;
	bh=cnOqqRyy8qapop2aj8Jh9qYqoK7bu5+GswzkuuErweY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YxNr8dV8utIpB32/zJ1R+YimFzAuZwRROQZBqfJHoDS1ouPaDNML/T8mkaNtZMorC
	 kPTe0Y1t6Iey7AUMZP7C5z0XxnTIjBMTw/w+h+6SFXB0B1AwAfN33HXIgy28zIE6Py
	 RyPQ33zcZhyWh/Zbgw+mAuB4HhAhx+GgIkjvmpgzyIc9k5uJadbiBJyJ3TPXEiPZ+N
	 gt+wfW/KeOkvC+pDiV/pYPoCG4OGTZgGyqAmSuTJyH1V1IuwYfH7Up4a+Z11t3vYYC
	 a6VuvwUWYzY1djopIhfce3XbH4hsyUXakJfB45GOZK8PpEl6aE56MoeJ3BsFJ2cRnI
	 MNn3jyoDwNqiw==
Date: Wed, 16 Jul 2025 09:22:09 +0100
From: Simon Horman <horms@kernel.org>
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Matthew Gerlach <matthew.gerlach@altera.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Set CIC bit only for TX queues
 with COE
Message-ID: <20250716082209.GH721198@horms.kernel.org>
References: <20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com>
 <20250714-xgmac-minor-fixes-v1-3-c34092a88a72@altera.com>
 <20250714134012.GN721198@horms.kernel.org>
 <9f4acd69-12ff-4b2f-bb3a-e8d401b23238@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f4acd69-12ff-4b2f-bb3a-e8d401b23238@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_012215_868933_612C70D5 
X-CRM114-Status: GOOD (  29.08  )
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

On Tue, Jul 15, 2025 at 07:14:21PM +0530, G Thomas, Rohan wrote:
> Hi Simon,
> 
> Thanks for reviewing the patch.
> 
> On 7/14/2025 7:10 PM, Simon Horman wrote:
> > On Mon, Jul 14, 2025 at 03:59:19PM +0800, Rohan G Thomas via B4 Relay wrote:
> > > From: Rohan G Thomas <rohan.g.thomas@altera.com>
> > > 
> > > Currently, in the AF_XDP transmit paths, the CIC bit of
> > > TX Desc3 is set for all packets. Setting this bit for
> > > packets transmitting through queues that don't support
> > > checksum offloading causes the TX DMA to get stuck after
> > > transmitting some packets. This patch ensures the CIC bit
> > > of TX Desc3 is set only if the TX queue supports checksum
> > > offloading.
> > > 
> > > Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> > > Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
> > 
> > Hi Rohan,
> > 
> > I notice that stmmac_xmit() handles a few other cases where
> > checksum offload should not be requested via stmmac_prepare_tx_desc:
> > 
> >          csum_insertion = (skb->ip_summed == CHECKSUM_PARTIAL);
> >          /* DWMAC IPs can be synthesized to support tx coe only for a few tx
> >           * queues. In that case, checksum offloading for those queues that don't
> >           * support tx coe needs to fallback to software checksum calculation.
> >           *
> >           * Packets that won't trigger the COE e.g. most DSA-tagged packets will
> >           * also have to be checksummed in software.
> >           */
> >          if (csum_insertion &&
> >              (priv->plat->tx_queues_cfg[queue].coe_unsupported ||
> >               !stmmac_has_ip_ethertype(skb))) {
> >                  if (unlikely(skb_checksum_help(skb)))
> >                          goto dma_map_err;
> >                  csum_insertion = !csum_insertion;
> >          }
> > 
> > Do we need to care about them in stmmac_xdp_xmit_zc()
> > and stmmac_xdp_xmit_xdpf() too?
> 
> This patch only addresses avoiding the TX DMA hang by ensuring the CIC
> bit is only set when the queue supports checksum offload. For DSA tagged
> packets checksum offloading is not supported by the DWMAC IPs but no TX
> DMA hang. AFAIK, currently AF_XDP paths don't have equivalent handling
> like skb_checksum_help(), since they operate on xdp buffers. So this
> patch doesn't attempt to implement a sw fallback but just avoids DMA
> stall.

Ok, fair enough.

As per Andrew's advice elsewhere in this thread.
This patch also looks like it should be a fix for net,
and should have a Fixes tag.

