Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00AB606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 03:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J7Qb2IV/;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XSKQrgUG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eYhpFhCV1vkP+5Z5Z8wHRbiIDOGVJbobZIYMKB9tLZY=; b=J7Qb2IV/8OyY4eLoguOH/FHt2N
	4KxiJo31hdNGQhUAYR6Hd13FHayBFmPQM4khx3n8y7IZQrj4O6hwZUgpMZ6vlEKAKSq1audhpWhgr
	SvLYcRSTdIfQOlOSfr4JKhSLXI/ZkxhjAjH1Y8A9Lbh3wX6MbPrqMBGJ92uw14PnwoHHQyg5HJDks
	NF/cZ27dumHWftUuTxCUkzo7b9U2ZjOteD1PxPU187FhwSd1bKC67uOFgAhCat1FQ1TtWoDwK1Rwc
	5wBqIQmUyvuTHi6d0s1ngpnbqgMXF/9tFHw1PmuimK9L/hbmYP27mpOGxTt/CMhPCT9ARLPoQmPEH
	/7MsLZcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ0X8-00000008n8Y-1H4g;
	Tue, 20 Oct 2026 03:29:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ0X6-00000008n8I-1COf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 03:29:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 927374019A;
	Tue, 20 Oct 2026 03:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 877581F000C5;
	Tue, 20 Oct 2026 03:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792466939;
	bh=eYhpFhCV1vkP+5Z5Z8wHRbiIDOGVJbobZIYMKB9tLZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XSKQrgUGH/vud0NN4jnQ5CZIK6KTjKqy0BRlpbRhVKNnj4v0bVWBb+Avzcb2qEBUW
	 m45bzOoiGv+wH2OjTiwNBlCPLIjGVEMJNSpEXeF5RKgG6cOC3PXF3S3d3LdlXlhjXJ
	 Wlnro1p4sJH927Cl1e3sLhEJLgj4cnxBui5nQlVE9LCrUX3Ikc1fmPYcY/gHtDCP4x
	 X9Tu5NDX+qQmkegmfLtEwJmUY/iOlhQXa7aXruy0J/Fn1VNKdREfGXCLELl+dr4uoC
	 xmwItsj5+5HNstG6De1zlVCD26TutAkE5EW/8+xqPkS8s9HqXJamhjmxL5HpyQxKT0
	 IVb8uS6oufAxg==
Date: Tue, 20 Oct 2026 11:08:54 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: stmmac: disable TX checksum offload
 for jumbo frames on bugged cores
Message-ID: <atbbRqSJIJ_glwuf@xhacker>
References: <20261012-stmmac-xdp-tx-pre-fixes-v1-0-05fd0c90f7e1@oss.qualcomm.com>
 <20261012-stmmac-xdp-tx-pre-fixes-v1-2-05fd0c90f7e1@oss.qualcomm.com>
 <6d1d99b5-1c3c-4e59-a0b2-e4d671e594ce@bootlin.com>
 <ata8k2EVDCDTmeE6@xhacker>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ata8k2EVDCDTmeE6@xhacker>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 08:57:55AM +0800, Jisheng Zhang wrote:
> On Fri, Oct 16, 2026 at 04:18:06PM +0200, Maxime Chevallier wrote:
> > Hi Lorenzo,
> > 
> > On 10/12/26 17:24, Lorenzo Bianconi wrote:
> > > stmmac_xdp_xmit_xdpf() decides TX checksum insertion from the queue COE
> > > capability only:
> > > 
> > > 	csum = !priv->plat->tx_queues_cfg[queue].coe_unsupported;
> > > 
> > > and lets the enhanced descriptor set TX_CIC_FULL accordingly. On the
> > > bugged_jumbo cores (snps,dwmac-3.40a, snps,dwmac-3.610 and
> > > snps,dwmac-3.710) hardware checksum insertion is broken for jumbo
> > > frames; the skb path works around it by clearing NETIF_F_CSUM_MASK in
> > > stmmac_fix_features() when the MTU exceeds ETH_DATA_LEN, so skbs are
> > > never marked CHECKSUM_PARTIAL and no checksum is inserted. The XDP TX
> > > path bypasses that workaround, so once XDP is allowed at MTU >
> > > ETH_DATA_LEN, jumbo frames sent via XDP_TX or redirected into the
> > > device would leave the interface with a full checksum insertion enabled
> > > on those cores - exactly what the workaround is meant to avoid.
> > > 
> > > Disable checksum insertion for oversized frames on bugged_jumbo cores in
> > > the XDP TX path too.
> 
> Here I want to query a generic rule from netdev maintainers:
> can XDP frame enable HW checksum on dwmac IP? Per my understanding, the
> dwmac can only do HW checksum for normal particular packets layouts, such as
> TCP, UDP. What about if XDP transmits a non-IP frame?

or a generic XDP guide from netdev maintainers:
Since XDP can tranmist arbitrary Eth frames, so how does the eth driver cope
with HW checksum if the HW checksum is intended for supported IP packet
layouts rather than arbitrary layer2 frames?

choices:
c1. Simply disabled HW checksum by default. Then XDP prog must provide
checksums themselves, lost the HW offload cap for IP packets.

c2. detect the frame in eth driver's xdp code path, then enable/disable
HW checksum accordingly. Then how? Any example in exisiting eth drivers
is appreciated.

Thanks in advance

> 
> Correct me if I misunderstood something.
> 
> Thanks
> > > 
> > > Fixes: be8b38a722e6 ("net: stmmac: Add support for XDP_TX action")
> > > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> > 
> > Looks cleaner to me than the alternative patch from Jisheng :
> > 
> > https://lore.kernel.org/netdev/20260929121025.20821-1-jszhang@kernel.org/
> > 
> > It sure seems there're a lot of people interested in getting XDP/XSK
> > working properly on stmmac :)
> > 
> > Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > 
> > Maxime
> > 
> > > ---
> > >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > index ca61ab449e32..0e29c5d04714 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > @@ -5276,6 +5276,14 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
> > >  		return STMMAC_XDP_CONSUMED;
> > >  	}
> > >  
> > > +	/* Disable TX checksum offload for jumbo frames on cores where
> > > +	 * checksum insertion is broken for oversized frames, matching the
> > > +	 * stmmac_fix_features() workaround used by the skb path.
> > > +	 */
> > > +	if (priv->plat->bugged_jumbo &&
> > > +	    xdp_get_frame_len(xdpf) > ETH_FRAME_LEN)
> > > +		csum = false;
> > > +
> > >  	while (true) {
> > >  		skb_frag_t *frag = i ? &sinfo->frags[i - 1] : NULL;
> > >  		int len = frag ? skb_frag_size(frag) : xdpf->len;
> > > 
> > 

