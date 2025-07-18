Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B32CC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 20:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5VaE/XPgYyPNasgE3RFOoo39AL/P1S7YmLqgPmbexM=; b=cJxBNKgsRsxdfEktZIduyxmK4D
	3LyQE5+P8C8sXMv5VMAnt6QWTMNjhkGTUclkTWTw3AOUFul+JcePYRtX8M2SAz1alo0kegv2MHPZU
	XXqXZoSk9/KI0Mq6wlxeQd3C5BASPIXnx2aCjsI1OnPhUlLbCXS3s5HtycrIQhGv0obYGiG315pdy
	ioDvEu0eNBVQjbEOJilp12mYH+XuxK5CQqLcIWJJLqlQbxfcnQCpiOnksiZECpZiBQaaeV1lydCU6
	JVYHCIWaOr7c5AOvPi9Un68cJMDTv3mLCe0xy/fOkb4ltWjWP1SZhn92YaDk7Neiesac0PPGEvLn+
	28MT/S9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucrNm-0000000DPPw-3in7;
	Fri, 18 Jul 2025 20:08:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucrLM-0000000DPGD-0K5H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 20:06:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E6B245C12;
	Fri, 18 Jul 2025 20:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A2DFC4CEEB;
	Fri, 18 Jul 2025 20:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752869167;
	bh=iM/cBfn6qf7kJPZApTF05wjQcPVP4ARh8oIYFBvOnbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y9sovkPL7D4ADsST94stWH0zK+qSnkGSP7rTG4uGBOET4Estd53I+YmUj05eVidQY
	 Z+vhivYCZzdG4JK+0+6+msMFyJNHK0jd9mJWkgZjsA0rWpbTLQod7CrLL/6t4CGjlg
	 WrBVfNMJ/dnR3gXbbikXOA620EjvAhW2I3S8j55lPP9Ac0ModgGoAYg7tSOm+89kbx
	 8KW1iUdiwkv/vYGZ5+SIlNRxNvKXtkEX/dfo3XC8eIJM7pp91a1JUHBYV38eZXUUdO
	 wRgL1XMesXepYg8WKV12cra7adqTbHIwuMPNInU5hpbA2zD1TOoriaAY73a9RXqiGl
	 MGp/HZUCpQj3w==
Date: Fri, 18 Jul 2025 21:06:02 +0100
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
Message-ID: <20250718200602.GM2459@horms.kernel.org>
References: <20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com>
 <20250714-xgmac-minor-fixes-v1-3-c34092a88a72@altera.com>
 <20250714134012.GN721198@horms.kernel.org>
 <9f4acd69-12ff-4b2f-bb3a-e8d401b23238@altera.com>
 <20250716082209.GH721198@horms.kernel.org>
 <38d05790-eb4a-482a-89ec-8c17cf2e9680@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38d05790-eb4a-482a-89ec-8c17cf2e9680@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_130608_161188_261D0FC5 
X-CRM114-Status: GOOD (  40.24  )
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

On Thu, Jul 17, 2025 at 11:50:06AM +0530, G Thomas, Rohan wrote:
> Hi Simon,
> 
> On 7/16/2025 1:52 PM, Simon Horman wrote:
> > On Tue, Jul 15, 2025 at 07:14:21PM +0530, G Thomas, Rohan wrote:
> > > Hi Simon,
> > > 
> > > Thanks for reviewing the patch.
> > > 
> > > On 7/14/2025 7:10 PM, Simon Horman wrote:
> > > > On Mon, Jul 14, 2025 at 03:59:19PM +0800, Rohan G Thomas via B4 Relay wrote:
> > > > > From: Rohan G Thomas <rohan.g.thomas@altera.com>
> > > > > 
> > > > > Currently, in the AF_XDP transmit paths, the CIC bit of
> > > > > TX Desc3 is set for all packets. Setting this bit for
> > > > > packets transmitting through queues that don't support
> > > > > checksum offloading causes the TX DMA to get stuck after
> > > > > transmitting some packets. This patch ensures the CIC bit
> > > > > of TX Desc3 is set only if the TX queue supports checksum
> > > > > offloading.
> > > > > 
> > > > > Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> > > > > Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
> > > > 
> > > > Hi Rohan,
> > > > 
> > > > I notice that stmmac_xmit() handles a few other cases where
> > > > checksum offload should not be requested via stmmac_prepare_tx_desc:
> > > > 
> > > >           csum_insertion = (skb->ip_summed == CHECKSUM_PARTIAL);
> > > >           /* DWMAC IPs can be synthesized to support tx coe only for a few tx
> > > >            * queues. In that case, checksum offloading for those queues that don't
> > > >            * support tx coe needs to fallback to software checksum calculation.
> > > >            *
> > > >            * Packets that won't trigger the COE e.g. most DSA-tagged packets will
> > > >            * also have to be checksummed in software.
> > > >            */
> > > >           if (csum_insertion &&
> > > >               (priv->plat->tx_queues_cfg[queue].coe_unsupported ||
> > > >                !stmmac_has_ip_ethertype(skb))) {
> > > >                   if (unlikely(skb_checksum_help(skb)))
> > > >                           goto dma_map_err;
> > > >                   csum_insertion = !csum_insertion;
> > > >           }
> > > > 
> > > > Do we need to care about them in stmmac_xdp_xmit_zc()
> > > > and stmmac_xdp_xmit_xdpf() too?
> > > 
> > > This patch only addresses avoiding the TX DMA hang by ensuring the CIC
> > > bit is only set when the queue supports checksum offload. For DSA tagged
> > > packets checksum offloading is not supported by the DWMAC IPs but no TX
> > > DMA hang. AFAIK, currently AF_XDP paths don't have equivalent handling
> > > like skb_checksum_help(), since they operate on xdp buffers. So this
> > > patch doesn't attempt to implement a sw fallback but just avoids DMA
> > > stall.
> > 
> > Ok, fair enough.
> > 
> > As per Andrew's advice elsewhere in this thread.
> > This patch also looks like it should be a fix for net,
> > and should have a Fixes tag.
> 
> Thanks for your comments.
> 
> You're right—this patch is a fix for the TX DMA hang issue caused by
> setting the CIC bit on queues that don't support checksum offload. But
> I couldn’t pinpoint a specific commit that introduced this behavior in
> the AF_XDP path. Initially, there was no support for DWMAC IPs with COE
> enabled only on specific queues, even though there can be IPs with such
> configuration. Commit 8452a05b2c63 ("net: stmmac: Tx coe sw fallback")
> added software fallback support for the AF_PACKET path. But the AF_XDP
> path has always enabled COE unconditionally even before that. So, do you
> think referencing the commit 8452a05b2c63 in the Fixes tag is
> appropriate and sufficient?

Hi Rohan,

Perhaps I'm missing the point, but my thinking is as follows:

As this patch only addresses the AF_XDP path I think we can take the
approach of asking "in which patch would a user of AF_XDP with this stmmac
observe this bug". (Or some variant thereof.) And I think the answer to
that question is the patch that added AF_XDP support to stmmac driver.

So I think we can use:

Fixes: 132c32ee5bc0 ("net: stmmac: Add TX via XDP zero-copy socket")

