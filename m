Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB551606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 01:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D6wuIJ0b;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iye2npiI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gVKlbXZWCw8qO2LC4n2LKk2ZzmgfYZxvObuGjMQnSGY=; b=D6wuIJ0b+SsDgnShqJnBxVQP/G
	H1lga8kzFUWWg+JfZNpeAAkY7L7gXWhlEmDyNSv+GA3uf7NJ+Mmucwh4iJzN4hL5h02j2/gDK99fb
	6N3QALxPC26Rv0Mpo1mrJ+BX5yGghM4/vptVxUOhe4OYGdC4MblhX3b7n6ZFdxVrRoH7ZQbKwVRtK
	iGlVktqPWrmrU6xQt8gBiFbj3dG4E1MRxhZ6JE/iYvMb9KG3cJOyEIc/rc0LwwlPLTP0IJ/BJ+Ci5
	l3XAxd523ieqFoiKF4iaeotZDSTQkbDnAyx8tcQ6137lAfwcg9HZMDM6Dso0h3FyY7tyRfGNRvb5a
	nUlkpqUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyUT-00000008bhe-2HvC;
	Tue, 20 Oct 2026 01:18:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyUR-00000008bhW-1XEG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 01:18:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 57600600AA;
	Tue, 20 Oct 2026 01:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1324D1F000C4;
	Tue, 20 Oct 2026 01:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792459085;
	bh=gVKlbXZWCw8qO2LC4n2LKk2ZzmgfYZxvObuGjMQnSGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iye2npiIIcGb2r8dG0dJ0aD7shMe74LoGxfkV2IRkJq+SXuU+RCGS1FFnCGYrT98E
	 6CNw3LBP4EPJnzNgA266EaBkoBDAG2o00Iaok+4JuE/iU7TGTTeFzSUPVFPy8Wt2KB
	 Xjdi5Qimm6qpCx8SHpW7lwe2l0w6LEsHWzW9OR+F/zZ/+cldGyWbADWKGEX5URsoYA
	 PCkjzEO4HAv7fai8qjQXM4MMDhexVEMykVEfdk78VV0gv0RvJwf5HrxbBeoq0i7BVU
	 yZ2Hx/+PIC2MfBg3SvkbH8UNg3odB+yP4QgVwT8I+9XzSQqfe8lMptVB8OAnlKo+UF
	 EAcM3GmYGF97Q==
Date: Tue, 20 Oct 2026 08:57:55 +0800
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
Message-ID: <ata8k2EVDCDTmeE6@xhacker>
References: <20261012-stmmac-xdp-tx-pre-fixes-v1-0-05fd0c90f7e1@oss.qualcomm.com>
 <20261012-stmmac-xdp-tx-pre-fixes-v1-2-05fd0c90f7e1@oss.qualcomm.com>
 <6d1d99b5-1c3c-4e59-a0b2-e4d671e594ce@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6d1d99b5-1c3c-4e59-a0b2-e4d671e594ce@bootlin.com>
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

On Fri, Oct 16, 2026 at 04:18:06PM +0200, Maxime Chevallier wrote:
> Hi Lorenzo,
> 
> On 10/12/26 17:24, Lorenzo Bianconi wrote:
> > stmmac_xdp_xmit_xdpf() decides TX checksum insertion from the queue COE
> > capability only:
> > 
> > 	csum = !priv->plat->tx_queues_cfg[queue].coe_unsupported;
> > 
> > and lets the enhanced descriptor set TX_CIC_FULL accordingly. On the
> > bugged_jumbo cores (snps,dwmac-3.40a, snps,dwmac-3.610 and
> > snps,dwmac-3.710) hardware checksum insertion is broken for jumbo
> > frames; the skb path works around it by clearing NETIF_F_CSUM_MASK in
> > stmmac_fix_features() when the MTU exceeds ETH_DATA_LEN, so skbs are
> > never marked CHECKSUM_PARTIAL and no checksum is inserted. The XDP TX
> > path bypasses that workaround, so once XDP is allowed at MTU >
> > ETH_DATA_LEN, jumbo frames sent via XDP_TX or redirected into the
> > device would leave the interface with a full checksum insertion enabled
> > on those cores - exactly what the workaround is meant to avoid.
> > 
> > Disable checksum insertion for oversized frames on bugged_jumbo cores in
> > the XDP TX path too.

Here I want to query a generic rule from netdev maintainers:
can XDP frame enable HW checksum on dwmac IP? Per my understanding, the
dwmac can only do HW checksum for normal particular packets layouts, such as
TCP, UDP. What about if XDP transmits a non-IP frame?

Correct me if I misunderstood something.

Thanks
> > 
> > Fixes: be8b38a722e6 ("net: stmmac: Add support for XDP_TX action")
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> 
> Looks cleaner to me than the alternative patch from Jisheng :
> 
> https://lore.kernel.org/netdev/20260929121025.20821-1-jszhang@kernel.org/
> 
> It sure seems there're a lot of people interested in getting XDP/XSK
> working properly on stmmac :)
> 
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> 
> Maxime
> 
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index ca61ab449e32..0e29c5d04714 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -5276,6 +5276,14 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
> >  		return STMMAC_XDP_CONSUMED;
> >  	}
> >  
> > +	/* Disable TX checksum offload for jumbo frames on cores where
> > +	 * checksum insertion is broken for oversized frames, matching the
> > +	 * stmmac_fix_features() workaround used by the skb path.
> > +	 */
> > +	if (priv->plat->bugged_jumbo &&
> > +	    xdp_get_frame_len(xdpf) > ETH_FRAME_LEN)
> > +		csum = false;
> > +
> >  	while (true) {
> >  		skb_frag_t *frag = i ? &sinfo->frags[i - 1] : NULL;
> >  		int len = frag ? skb_frag_size(frag) : xdpf->len;
> > 
> 

