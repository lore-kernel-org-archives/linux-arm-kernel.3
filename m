Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46653C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 12:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cbADDMxZOUl90eLH+497cEm5EOEWvROIQWQdHvcJbd0=; b=o5PeCPpVb779tfyJIqLV9T4aWe
	aH98yxbCUfDk0PtTDiU0qlPbnznTkaVBskL1AuQc3qSaGfExrqB7tVTvy3YS2nLxxHJlQlLM1XdEs
	UD4Qbsgqb6R9nexVBbrpWP8M9DQ87cOh0zBbH6ErldFSJpe6l+0WbvWgs0QK6iHsO3rzD3Soksxcs
	Fypevsj8A5PAH5e8JdQK87Fd2hiSV+F61dkNWVNbl327i42K7WPJ12XLNx1ZQzober9nAmG0xqDXU
	1yBNnjdWWETq9g3PzDDgwZ4nz92MWJq7AQvPmM+ty4HEC0wiBQ/2vLkC362YeF0r6Ge5v4aOMbi+8
	YotCs0Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4x6-0000000Exax-46cm;
	Tue, 07 Jul 2026 12:31:04 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh4x4-0000000ExZp-3EGk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 12:31:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=cbADDMxZOUl90eLH+497cEm5EOEWvROIQWQdHvcJbd0=; b=XIu7VbCJJ5FSDP+kiIZr7v7aZQ
	cWr5G4/+cmIowfkA/MRJl9l/ONJvX97HXe6BAvm3DSf4gZp8V8N/dRLpCvb2IS0Sq7aYqKcq0m1Vj
	QoIUOqLBlgAoyCzv7QKT6cyQvcXTgjpmzw2DIWuzfEhwV3fR82NxlcEnjcWy3udvAGIg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wh4wm-00B9uK-EB; Tue, 07 Jul 2026 14:30:44 +0200
Date: Tue, 7 Jul 2026 14:30:44 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Thompson <daniel@riscstar.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Alex Elder <elder@riscstar.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: Avoid freeing and re-requesting IRQ during
 XDP set prog
Message-ID: <9f949b97-da81-4bdc-8be5-68f7883d768c@lunn.ch>
References: <20260706-tc956x-stmmac-no_irq_teardown-v1-1-df009d0272bf@riscstar.com>
 <akzLgrzsw4xYmnLH@aspen.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akzLgrzsw4xYmnLH@aspen.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_053102_812116_F7347B3B 
X-CRM114-Status: GOOD (  22.56  )
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

On Tue, Jul 07, 2026 at 10:48:50AM +0100, Daniel Thompson wrote:
> On Mon, Jul 06, 2026 at 05:17:58PM +0100, Daniel Thompson wrote:
> > Currently stmmac will run a full cycle of IRQ tear down and setup when
> > setting up a new XDP program. This makes tuning TSN systems difficult
> > because whenever a new XDP program is installed then the irq threads will
> > be stopped and restarted which will undo any thread tuning.
> >
> > The problem is avoided by removing stmmac_free_irq()/stmmac_request_irq()
> > from stmmac_xdp_release()/stmmac_xdp_open().
> >
> > stmmac_free_irq() implicitly synchronizes interrupts and, with that
> > removed, I was unable to prove that later actions in
> > stmmac_xdp_release() are safe when there are concurrent interrupts. To
> > avoid problems let's also move the code to disable DMA interrupts earlier
> > in the sequence and explicitly sync the interrupts handler(s).
> >
> > Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> > <snip>
> > @@ -7156,10 +7201,8 @@ int stmmac_xdp_open(struct net_device *dev)
> >  	stmmac_reset_queues_param(priv);
> >
> >  	/* DMA CSR Channel configuration */
> > -	for (chan = 0; chan < dma_csr_ch; chan++) {
> > +	for (chan = 0; chan < dma_csr_ch; chan++)
> >  		stmmac_init_chan(priv, priv->ioaddr, priv->plat->dma_cfg, chan);
> > -		stmmac_disable_dma_irq(priv, priv->ioaddr, chan, 1, 1);
> > -	}
> 
> Sashiko picked up that stmmac_init_chan() has the effect of enabling DMA
> irqs, making this code unsafe.
> 
> Given stmmac_xdp_open() can only be called on a running interface (and that
> stmmac_xdp_open() explicitly sets sph) then re-initializing with stmmac_init_chan()
> should have no effect and we can drop that as well.

Something i like to see is symmetry. In theory, stmmac_xdp_open() and
stmmac_xdp_release() should be mirrors of each other. But i don't see
anything like the opposite of stmmac_init_chan() in
stmmac_xdp_release(). So i can well understand that something is
wrong.

Maybe rather than just fixing this IRQ issue, you can look at both
functions and see about making them symmetric? I've no idea what that
actually entails, it could be a can of worms, which is not so uncommon
with stmmmac.

     Andrew

