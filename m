Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40B6C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 01:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PL4vLuVN0ieJR1wtgaFdgTaFWontBf4roejCfLnzVDs=; b=LQuxn/H6zUQE4AdZa3wopKXTnC
	LhbBTOrb8yQdalAUOnLE9o+eHuc37QZLDUzS8XXtaIhEMQho9ZYfiN3DKwt7gYHvzXpGcSRBEDiSI
	NeTlXP/kkJiGN5A709Epf9lUipGlXFcGt8UvDxVMWkagFxL6/z/a4PX3RuFs/V6ZFzVGJH5Y6NHEp
	9FukF+CAfUV9xXjuTpMto1YebtssgMfcUTqPfb5R9j2Cf6H3us4BI1UjIoplqsTg1rRAT60z922EQ
	/o4gBlvk2WOVbTv2GSsDLhr3ro8pbMu+Z2KamBgwORiNJ4iYMsMLOlKS56IpAvhc33DEyIU36m897
	AS/Mr5GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxE4V-0000000CQB1-3qvp;
	Fri, 21 Aug 2026 01:29:27 +0000
Received: from mail-pz2-x0b.google.com ([2607:f8b0:4864:3b::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxE4S-0000000CQAg-3jmj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 01:29:26 +0000
Received: by mail-pz2-x0b.google.com with SMTP id 41be03b00d2f7-cc150711112so73349a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 18:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787275762; x=1787880562; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PL4vLuVN0ieJR1wtgaFdgTaFWontBf4roejCfLnzVDs=;
        b=PjAkN1blz1E7MPh82PDcGT70YtlWQq2sSqgW4lBRL+aWj5pkg8/6tU+FknO36o15RG
         r+boY+P37UJY0HeguruQnngr9S/f0IQX6fGFdEDgUXO0Uv3/4xIhUPBwtUheFgZDqxTz
         rvBxJiJNtt2Hy45U/ojzEe8OBGGNkq77U9eTQ5FdBbznADOoABtRKQPsqyGdGIPYqngi
         EJny/Q390hzChPeoscj8vV1tFEqCM9puHqa0vmskozBqkXeQHBRLE7W7EapN9au7/rRM
         W0VQ5HUINAlq8jbCznnke+v9mWAQfyWclwC/OWGkrAa2Y57qSd3bg9HeE+SHM/rKDn/Z
         2NiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787275762; x=1787880562;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PL4vLuVN0ieJR1wtgaFdgTaFWontBf4roejCfLnzVDs=;
        b=Z/prkqa8A6XvJCZTIzU+yX2REO0c0h8f4+Qg3GVwab4zlzlReTO5xuip1WTo026neB
         CyV3G3czHubI/d9wD0I9ip7trj0+CmXYRUmYCSun0NA3dlC/FylW0sudQ+UkLa+GzHRr
         aDoXkQ2O9kQ4z5NIQVvA8eNthAu2s8iqJp1MGmyGw03qnIJ12bOwlSmJEGJeUiMYhMhf
         fgitEwrgRGG0mbmX26u89fu9LTyXZYQLYvMjHukPYZMYw9+E12kPuEkXMYavJ3w2gZHv
         qB7gEjqNOLmgy5YvzU8EPkSaDhCQROmjCdkhsO+tbu4Vj0ri2ceERJTIK+7Eu2z9LFRW
         HTNA==
X-Forwarded-Encrypted: i=1; AHgh+RrEqfuCJHRymjdrF7nHapw0oWA69ihEGxKD+6Zknd0hBm3OswbU3RR8yrXXFUEUFVMlmm/8OFdUFWsZ/PsvpudT@lists.infradead.org
X-Gm-Message-State: AFuF++m9jhUP7w/Nun5nktYbnrRtAWLhzqeoMRL5SoOdgc0XjShyrp9S
	xXaPCg2ky3A4z1ARXwcv2mvrxFfYE5Pwk4KDe+D7lEBtiUvQ6S7qxs82
X-Gm-Gg: AR+sD13jmI1tdMx0N5sUv038rV81eNiuNNJHnZ4QtlNXCGGXFm5NlBp0tjI+dGns7Qx
	rED/RBcokOGTlrT5pSGwmdb9/vtRx2IOKmUCz/CVB7m+ucGsy3+e03jNDV7yONFd8lR+ieGV3w6
	So09dO+WhsLuKP142/QxIfsq43w9FgFNN3HfPiCXUYh40TPZq+C1rrNZiMqcYX6MhSKXQvcX+/p
	2IsmQ0hASnTVuQaDPwDDHRHGMwLrVHVM4e/4/2uwwfJX63ScvVX/xYlhGOOubyjp+TETRIWuWdU
	ZvFiZMtzQH2j9nmwBlzAmPWVuSmMsLfDm1R74NSOh7+IYHm2R6Luor8jr+W+WKaxSN7aeqZBRgN
	i5fwhI4B06PXGuZY2ZLLnxnZFNPzu4UYedX54IamdML+qM/BJs94XEfK3TmTf7LksAGhj+z6K3S
	B9aV3Oz5+0c9Y9IQnv84PMtTtM2/dxaE5tzmuqO1oDWWWdWMFkv5Nm1QMLCIfbnIAz
X-Received: by 2002:a05:6a00:170c:b0:845:e440:d0ca with SMTP id d2e1a72fcca58-851f9f0db82mr3439334b3a.8.1787275761986;
        Thu, 20 Aug 2026 18:29:21 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:2::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3640dd4sm2169685b3a.41.2026.08.20.18.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 18:29:21 -0700 (PDT)
Date: Thu, 20 Aug 2026 18:29:16 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, anthony.l.nguyen@intel.com, 
	przemyslaw.kitszel@intel.com, andrew+netdev@lunn.ch, saeedm@nvidia.com, tariqt@nvidia.com, 
	mbloch@nvidia.com, maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, aleksander.lobakin@intel.com, horms@kernel.org, 
	magnus.karlsson@intel.com, sdf@fomichev.me, ast@kernel.org, daniel@iogearbox.net, 
	hawk@kernel.org, john.fastabend@gmail.com, guoren@kernel.org, dtatulea@nvidia.com, 
	witu@nvidia.com, martin.lau@kernel.org, yoong.siang.song@intel.com, 
	intel-wired-lan@lists.osuosl.org, linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
	linux-csky@vger.kernel.org, leon@kernel.org
Subject: Re: [PATCH net v3 3/3] net: stmmac: document oversized AF_XDP frame
 handling
Message-ID: <aoeoJ6-njBxcWs4w@devvm7509.cco0.facebook.com>
References: <20260819160535.1472459-1-sdf@fomichev.me>
 <20260819160535.1472459-4-sdf@fomichev.me>
 <aoceSoSFMx69Z9up@boxer>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aoceSoSFMx69Z9up@boxer>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_182924_937975_6BB048BF 
X-CRM114-Status: GOOD (  26.06  )
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

On 08/20, Maciej Fijalkowski wrote:
> On Wed, Aug 19, 2026 at 09:05:35AM -0700, Stanislav Fomichev wrote:
> > stmmac drops AF_XDP zero-copy frames that exceed taprio's queueMaxSDU
> > after xsk_tx_peek_desc() has reserved their completion entries.
> > 
> > Completing a rejected descriptor is unsafe because AF_XDP completions are
> > ordered: xsk_tx_completed(pool, 1) would complete the oldest outstanding
> > descriptor, which may still be owned by hardware. Instead, leave the
> > completion pending so the ring eventually wedges and increment the drop
> > counter to expose the application error without risking hardware
> > misbehavior.
> > 
> > Document this intentional ring imbalance at the check.
> > 
> > Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 62de03e65a90..6a532747c039 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -2713,6 +2713,10 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
> >  		if (priv->est && priv->est->enable &&
> >  		    priv->est->max_sdu[queue] &&
> >  		    xdp_desc.len > priv->est->max_sdu[queue]) {
> > +			/* Completions are ordered, so this descriptor cannot
> > +			 * be completed safely. Wedge the ring to expose the
> > +			 * application error instead.
> > +			 */
> >  			priv->xstats.max_sdu_txq_drop[queue]++;
> >  			continue;
> 
> Hmm. I read the discussion on v2. Maybe we could cancel cq entry here in
> this branch? Also it feels like something achievable at bind time when
> taprio is configured and vice versa?
> 
> Otherwise we over-commit cq entries.

What do you want to achieve with the cancel here? IIUC it will make it look
as if some (if the user has posted many) tx descriptor has not been consumed
by the kernel?

I do agree that a better idea is to probably do these checks during control
paths, but it's a bit more involved (and not sure if it's possible? if we
have a bunch of xsk sockets and we change that max_sdu, do we go over all
sockets on the system somehow?). My main motivation with this patch was
to make our LLM reviewers less chatty about preexisting issues.

