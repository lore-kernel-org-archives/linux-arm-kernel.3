Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191F8C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 07:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=daXUWiNhiN7cNvtBzAZ9KFArZ3GpfPxgFjFP5H8KqzI=; b=fTduOl4ZADjhK1MlIiyRU0C3LV
	tsnVZlimm8AWhUqU73/GH1IxpjU0/rwGX+oCXUNWWXUyvh0rL1W+Kh3ZVqSwF6hL2OsSYlm75+C9Z
	kHcLlnLzVFP27kryUw1c2i4WMkiehoZO0FBEV9yVcuSh8VZbUl1docJnRFYaMKM4lCZyjnA3pSWHO
	nUyrotcv2b7zLsehygRrC9Yt/iFeVq5BV3smrlHWDw8arSdXXYMd7/eRzFAiNs5kd4msIZ9cL8Jge
	m/B3EiPe5qTZ4VC411GtwNymRFtWBbNgi0nYnFN51scsKe/4kDlaP0j1p3vEPZT6zPA/bWi+uIqbh
	LNykr7Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wthE2-0000000DYHc-0UOH;
	Tue, 11 Aug 2026 07:48:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wthE1-0000000DYHR-1uvC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 07:48:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E047600AF;
	Tue, 11 Aug 2026 07:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469CB1F000E9;
	Tue, 11 Aug 2026 07:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786434520;
	bh=daXUWiNhiN7cNvtBzAZ9KFArZ3GpfPxgFjFP5H8KqzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DzgAtXk5RGh2onxOvP+qmdvGYDOuzPDI22Lv1njALZ47IygRgMoUvuOJQfPMVKLn5
	 7mMc7QLA+Pd0ih0lzmbQxDoYn2s4tiKoyjWRKgBz3MTHODVNrEmsKAay2KNqua/8iZ
	 frWOrLFaYN3YMTqmzlgGcCijl6w+jSgNDbGUULhFw4BUXQ8k/WKgF+N5u2u9yEHJuU
	 ZQ6cMwEuRfWCOHujhF3zXAqemucZ00SIa8426xPhGKAFoMIEBv1vxXEQ5OaV/VzjvL
	 qD1wugMLlYpB1YuqjCOCLyEuvtAwhvtIrYPPBn9mtwW508Uzwk2PYQ9NYpqZu5cMtX
	 XtAoL1dpDVHww==
Date: Tue, 11 Aug 2026 08:48:35 +0100
From: Simon Horman <horms@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, c-vankar@ti.com,
	vadim.fedorenko@linux.dev, v-singh1@ti.com, nm@ti.com,
	daniel.zahka@gmail.com, nora.schiffer@ew.tq-group.com,
	oss@vassilevski.com, grygorii.strashko@ti.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH net] net: ethernet: ti: am65-cpsw-nuss: Fix port_id
 extraction from SRC TAG
Message-ID: <20260811074835.GW51943@horms.kernel.org>
References: <20260807111738.2055900-1-s-vadapalli@ti.com>
 <20260810165629.788002-1-horms@kernel.org>
 <d7841492-7e2a-4f4e-ae82-8058c7f4c6a5@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7841492-7e2a-4f4e-ae82-8058c7f4c6a5@ti.com>
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

On Tue, Aug 11, 2026 at 10:38:55AM +0530, Siddharth Vadapalli wrote:
> On 10/08/26 22:26, Simon Horman wrote:
> > This is an AI-generated review of your patch. The human sending this
> > email has considered the AI review valid, or at least plausible.
> > Full review at: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260807111738.2055900-1-s-vadapalli@ti.com?part=1
> > ---
> > --- Patch [1]: [PATCH net] net: ethernet: ti: am65-cpsw-nuss: Fix port_id extraction from SRC TAG ---
> > commit b0ed959d350c90d8b49f6f81eba7461fbc86dcf4
> > Author: Siddharth Vadapalli <s-vadapalli@ti.com>
> > 
> > net: ethernet: ti: am65-cpsw-nuss: Fix port_id extraction from SRC TAG
> > 
> > The RX path extracts the ingress MAC port ID from the CPPI5 descriptor's
> > 16-bit Source Tag. Only the lower 8 bits carry the port ID, so the patch
> > masks the value with 0xFF before it is used as an index into
> > common->ports[].
> > 
> > > diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> > > index 434a31080855..6330540979d7 100644
> > > --- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> > > +++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> > > @@ -1310,6 +1310,8 @@ static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_rx_flow *flow,
> > >   	k3_udma_glue_rx_cppi5_to_dma_addr(rx_chn->rx_chn, &buf_dma);
> > >   	pkt_len = cppi5_hdesc_get_pktlen(desc_rx);
> > >   	cppi5_desc_get_tags_ids(&desc_rx->hdr, &port_id, NULL);
> > > +	/* Port ID is contained in the lower 8-bits of the 16-bit Source Tag */
> > > +	port_id &= 0xFF;
> > >   	dev_dbg(dev, "%s rx port_id:%d\n", __func__, port_id);
> > >   	port = am65_common_get_port(common, port_id);
> > >   	ndev = port->ndev;
> > 
> > [Severity: High]
> > [Finding: main-1-0]
> > [Sources: opus-5]
> > 
> > The missing range check on port_id is pre-existing and not introduced by
> > this patch, but since the change is specifically about avoiding the
> > out-of-bounds access, would it be worth validating the value instead of
> > relying only on the mask?
> 
> Hardware guarantees a valid Port ID in the lower 8-bits. A Software check is
> an unnecessary overhead and will impact performance since this is on the
> data-path and is not a one-time check during initialization.

...

Hi Siddharth,

Thanks for addressing the AI generated review.
This all looks good to me now.

Reviewed-by: Simon Horman <horms@kernel.org>


