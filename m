Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77422C55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 13:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wTNiZqsPvsvAsqdJI3NYqaSJTMEuvNjWMEi2TBFAAqs=; b=NDJwHCY3J6fTS6wUffKqdz6bgb
	rMiODCdC++yk+a9TyP3Pmka4PcCqnei/mH9wbhyW/DlUMJcq53jSD+ux1x+CBzFiv4c8UbicjG83T
	v/lzYLMeEOZussZmL5lWKLOVALdjoZtsX+KVe/eQigVzwZO6aGosghegU+Ugml1klmO+MeK1VhHw/
	6oxw8kp2/6/6QiBi5TdR7ntd4B1HZHv9Eep0bXFJJFVoMKt+ZPInw0h09D9a6om1IPEXB/HWkFErZ
	JWPN8MihTw4JLNGTkn/RzhTziBLCpMiauacBnC4cPsZefpvAtw5C1e8BTyzhH7Fad2sksuW0vT1sm
	6/vIBFwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQkX-0000000AaSx-1jHm;
	Thu, 30 Jul 2026 13:24:37 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQkU-0000000AaSF-0Zsu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 13:24:36 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so10285585e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 06:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1785417872; x=1786022672; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wTNiZqsPvsvAsqdJI3NYqaSJTMEuvNjWMEi2TBFAAqs=;
        b=mSMK7gGDpfoMF5G2bSmec88gMkq2J/WfddAosYUgdwKeu8+g7ayKsvE8iTw7eXqaBZ
         LDezDQIkj12sn9P8P3agnJEr32TcuI7HY5VRtGzju9Ay9X6L3GAvdGFYLOChqkUpgFsf
         LBRfsVjIZC9PSVIx3OQN85BdUMNpSWc1b5xeKBvyTWyvIx5C10xJT0NlX3sxTNXQH3E9
         zJwHpWmQwa8aG0ZOCpUPyhIuGlxwNeKsqI+ZeV0V/SDEiUeXrJvQGRaj6a4rOsx9LmZF
         m1Q4jeeuJFP/V5KZ3NScVPD2j4WIz4IaorDytVyNdfMOKiEjxxZrs7/Y2KtLVX3I8dIK
         4Sjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785417872; x=1786022672;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wTNiZqsPvsvAsqdJI3NYqaSJTMEuvNjWMEi2TBFAAqs=;
        b=JaOR83qDoXWuu+RK1RRnRG2pre+b1TcAV3nGjwoXdMOE6txf4CaevqxrPk5wQFYqr3
         VFjye4cyriViS3PpJ6fzkZ3RtjZIgmfM+25o9hEARUO+Zbsp5DnatK6zyLzgxRMuXfON
         ln3aso8z9pozPZYsHMy81Jh12gOnZW3vGu+mIQMdKnYNy/UZBacra2im0KeUUuSb+qQS
         Ii+bze1sGgblvH+azUlhvlYqVrNvd7Wxa1NnPwkli3le+4OMHEL0caTDtWaJERIJ6soL
         tQHI1/v0KOQN9Ipdl1xm2mQBqPfTZwIFb1ZH23rNy3fh85YQv5AfzRCv+PDa7EMHltSf
         mp3w==
X-Forwarded-Encrypted: i=1; AHgh+RpnrvQDw90OpnM+BCB7RxSWSM9d+M0Kkk62Kkuyrjp9Y6wz6YEaV2p4kh6b3HTcEjMdhjpyzZILVMJib18/Y6kb@lists.infradead.org
X-Gm-Message-State: AOJu0YwcBIe5s0Is4IBIuIf8wN6DrHBY3d2Z/JtKCzZ01usjzaENfQzo
	wjPmZVWO+6aDe+3VhxXY64GB2NJThdoGq2VozIO1yZwamuFAaXuo7XP/OmeWi+hRzSw=
X-Gm-Gg: AR+sD10Zy1LYok7Fh8Ov74Flxs7d5iS7ESd3gAtRFyK71UevaanW4qG7JqOrlENI60T
	qtzMZY6HWxNUuskS3AnKHCSa71ghNNGTixp+Ayh8oO895q7r3sR9UWUijpbXVG3pM5/bNkW7spa
	5XV/3YAKWyPpxJgp74ebWbe7hwb3arofYln7aS96wrXSM3xUom9qLJRfIICGQriSPCLgmfczJxh
	kcHUXfeszgW+feZUYlZG+80uu4cSi2pBPzW5kh494VAfi/ZmNqsz1a5MWjkdfOgifDKEr2v9cHg
	tZkqV9nrefAFnvd9xOu5ORm4vOnGTbSGGv4w5tniYxC6kPdAFpI0GR/p5AsqXS8Ki4Sbz/HQQHU
	Ct3ycgisQOaXHsuKcwhoxtkrIz9dR55Vzbq2uhe2MvELsqmCAmjSQ1aEeC1yTBErmYZIueHXI2Z
	tQYezmMPfZqwU16fN3DTr9hQsyRsdQ6nCQ9H9uU1ea6hJ6eY+HJa9yahc2O729jyW3pnUQUC/fY
	Dxke0DKb51H5aIcwNGaagoKNpDcQwSLZh/S6byHOSXDB3r/q4316djTI3R/+4kQAqKoDaZRB779
	wPzIFQzDTrgEJJ3juiQQOdYR0TX5LZ1HW4lMoVcFrsBaCw==
X-Received: by 2002:a05:600c:8b66:b0:496:c1f3:e8f9 with SMTP id 5b1f17b1804b1-49800ea1378mr34361415e9.20.1785417871594;
        Thu, 30 Jul 2026 06:24:31 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49801c073a3sm8655585e9.4.2026.07.30.06.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 06:24:30 -0700 (PDT)
Date: Thu, 30 Jul 2026 14:24:28 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Andrew Lunn <andrew@lunn.ch>
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
Message-ID: <amtQjCV6Oi7UI97t@aspen.lan>
References: <20260706-tc956x-stmmac-no_irq_teardown-v1-1-df009d0272bf@riscstar.com>
 <akzLgrzsw4xYmnLH@aspen.lan>
 <9f949b97-da81-4bdc-8be5-68f7883d768c@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f949b97-da81-4bdc-8be5-68f7883d768c@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_062434_335706_550CB3C5 
X-CRM114-Status: GOOD (  31.31  )
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

On Tue, Jul 07, 2026 at 02:30:44PM +0200, Andrew Lunn wrote:
> On Tue, Jul 07, 2026 at 10:48:50AM +0100, Daniel Thompson wrote:
> > On Mon, Jul 06, 2026 at 05:17:58PM +0100, Daniel Thompson wrote:
> > > Currently stmmac will run a full cycle of IRQ tear down and setup when
> > > setting up a new XDP program. This makes tuning TSN systems difficult
> > > because whenever a new XDP program is installed then the irq threads will
> > > be stopped and restarted which will undo any thread tuning.
> > >
> > > The problem is avoided by removing stmmac_free_irq()/stmmac_request_irq()
> > > from stmmac_xdp_release()/stmmac_xdp_open().
> > >
> > > stmmac_free_irq() implicitly synchronizes interrupts and, with that
> > > removed, I was unable to prove that later actions in
> > > stmmac_xdp_release() are safe when there are concurrent interrupts. To
> > > avoid problems let's also move the code to disable DMA interrupts earlier
> > > in the sequence and explicitly sync the interrupts handler(s).
> > >
> > > Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> > > <snip>
> > > @@ -7156,10 +7201,8 @@ int stmmac_xdp_open(struct net_device *dev)
> > >  	stmmac_reset_queues_param(priv);
> > >
> > >  	/* DMA CSR Channel configuration */
> > > -	for (chan = 0; chan < dma_csr_ch; chan++) {
> > > +	for (chan = 0; chan < dma_csr_ch; chan++)
> > >  		stmmac_init_chan(priv, priv->ioaddr, priv->plat->dma_cfg, chan);
> > > -		stmmac_disable_dma_irq(priv, priv->ioaddr, chan, 1, 1);
> > > -	}
> >
> > Sashiko picked up that stmmac_init_chan() has the effect of enabling DMA
> > irqs, making this code unsafe.
> >
> > Given stmmac_xdp_open() can only be called on a running interface (and that
> > stmmac_xdp_open() explicitly sets sph) then re-initializing with stmmac_init_chan()
> > should have no effect and we can drop that as well.
>
> Something i like to see is symmetry. In theory, stmmac_xdp_open() and
> stmmac_xdp_release() should be mirrors of each other. But i don't see
> anything like the opposite of stmmac_init_chan() in
> stmmac_xdp_release(). So i can well understand that something is
> wrong.
>
> Maybe rather than just fixing this IRQ issue, you can look at both
> functions and see about making them symmetric? I've no idea what that
> actually entails, it could be a can of worms, which is not so uncommon
> with stmmmac.

After review I found that moving the disable to stmmac_xdp_release()
does and removing the call the stmmac_init_chan() gets things most of
the way there. After these changes every action in stmmac_xdp_release()
can now be traced by to corresponding restore code in stmmac_xdp_open().

It's not fully symmetric because activity in open does not appear in
reverse order compared to release. However it definitely moves things
in the right direction because the new stmmac_disable_all_dma_irq()
function pairs nicely with stmmac_enable_all_dma_irq().


Daniel.

