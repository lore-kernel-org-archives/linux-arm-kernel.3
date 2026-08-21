Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43502C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 17:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RpCheSrOdysr+r97ve0JN+xVtWYbZrCXCOuzISS1Oo=; b=vjASNX1ZVt2cEsRi6qMKGgcoBu
	bbmhjAeDuoIN+r/INh5POIErKDE2xL4TfRJRxP7DPL48M8sAVTH7shNwkrc8k34IkXNxpajg6wryD
	7kacRb4E5D7Icfn3uF8C0DWoXGIIU3+pqxN+ZWbz9bKL+kNxumzN+cfnFl2VErymhtcg9UWZHsJHR
	cP8w76xObqE0ys2yMAfJ41VO+Ue2zGjC+RTFLnYnWArnuDXaR3a2dT9WJAPpgv6EOPJE1N3zVj8DT
	ZK6PXWhvA+pzUoWy65Hm8kn6ld5hw16aR3ZIWNQ/NVhbIr3QNIHrtWo39OA5P81/dfoX6LFvuboak
	hsHsEc1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxT31-0000000DuKT-0zfm;
	Fri, 21 Aug 2026 17:28:55 +0000
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxT2y-0000000DuJi-3ROo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 17:28:54 +0000
Received: by mail-pj2-x0b.google.com with SMTP id d9443c01a7336-2cf02ecb572so10804705ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 10:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787333332; x=1787938132; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+RpCheSrOdysr+r97ve0JN+xVtWYbZrCXCOuzISS1Oo=;
        b=mhFVAXYt+keLujlbvPThOi54raDK15zZ2KQbV0VQAC5Z46QYGyurJBNLZtj0DnMWDR
         x0n7jU79hEkhQfwM1QTBSV+/5YKlhlvE0bKcrfpBA1Aa4F4xeddop1/Z0aCLEsbXhECf
         VNkfyBVnv/9aVRuX156oojB4xjGvVOvsl4ayCLc5IMRKWf5xPxOrX+KR9AJ/Dd2SiTwE
         q4d6IK/wAfCzokctRm3v2nChn/g0akQ58tX8Tq1AfJog41/z6xAcewPAMP4m9C34+UQc
         7ZZKpgJ4aHJ3adfB1TYl3h3JNVKt4e8h+nJBVCEZ1GLAyb302fcktGL3sLOsPXgyJjRs
         f2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787333332; x=1787938132;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+RpCheSrOdysr+r97ve0JN+xVtWYbZrCXCOuzISS1Oo=;
        b=XvgV554Vg75juQsYiYBib06T4sUZzP0Bmus/1dyHW8fForSKx/wz9zHoHSbQbrBbEb
         R6RhQUiGQOW7xjYLuIIboMTrGJ9DgFpnmoTv5nzrw/HuXor5ucChJecK4Bt2aO1886Lp
         tJ68eFnyryQy5NCFiG4LjvDAV85faTdQfjHcAtg+8SdDLz8S5GdZ1uj8Qe7iDBQxsyU9
         MjMCs1FmMvts0e46YqSzzFJ3FepHOX+muHhGHsrorjHaoeBy/6fycKyhvouCa0VuV+I2
         xrLI5+62Kuz9iP/WpzNIN/JkkP15pUgx8z80L5u2ZtIDADZ6Yy12AuQcBfI3fX6UBWiW
         J7qw==
X-Forwarded-Encrypted: i=1; AHgh+Rp/GtXH4+nEMPvFoQOWDO1iQK51sfRGO7YknEaq3PEy8/g3Q4UWTn2vhig2d0Tmym4Bw4x+XiYkMX+YKxl5GZDw@lists.infradead.org
X-Gm-Message-State: AFuF++m2gaVMVG0iXmliou8RqXyPVK2LpwvLqTMEhnDXaJOPZHm272dS
	0L0KA7Ba64NuJSzc4d1z5+ms3ceK1RceMuYKpocvcr7tAKJFXE0Qj9EnwwWqLdCK
X-Gm-Gg: AR+sD11MU3WTEKw6euBOatcwBsYYOaLkPpv06ynmynviEGNcyHD3tejaldGA4i6waJi
	d/6BkZ+h6hHbE8wA2Ni7xRUHFi3WcdeYuLXMbu7Wd7nlXV+AwWjdr47X96zfSe2f7b1ammWxfJx
	7TGldER0LUsKH/qG6IS5tIyyHmtegvk8/XlsnOogFNnkLUyqTHiUTWe2a26XpuD0d9/K/2jX/DO
	zV40hzhAzKrYSDpT8FEOkKzAlh8M9Nrt7JufsyrNXd8tfzgbmRb1G7Jdcwt/OOSVNo6toYH99NX
	h3ZMI+6fobq2uRtg/VNVwYu4yzdGaTsYu8ET58a/Rg0tCO5llLgNMvSliCWRjdmdt/Mt6SaUQDw
	W5UYmPXgjSz0YLspgci07bDTaHjzJGLnLTL2L3zj4GyPBF4uOBEpRw/sGZPv2gsjUGv0pS8HRUQ
	OBjpC+4XTSB1JEEvsv2FKL15pnx/PQ3roCaFQKeS5PMIVjB2+K0wocYg==
X-Received: by 2002:a17:902:e943:b0:2d6:3c2f:69b with SMTP id d9443c01a7336-2d64af6f8cemr156390915ad.8.1787333331890;
        Fri, 21 Aug 2026 10:28:51 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:48::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d555b51sm21790945ad.7.2026.08.21.10.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 10:28:51 -0700 (PDT)
Date: Fri, 21 Aug 2026 10:28:47 -0700
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
Message-ID: <aoiIarzdjk92RkCN@devvm7509.cco0.facebook.com>
References: <20260819160535.1472459-1-sdf@fomichev.me>
 <20260819160535.1472459-4-sdf@fomichev.me>
 <aoceSoSFMx69Z9up@boxer>
 <aoeoJ6-njBxcWs4w@devvm7509.cco0.facebook.com>
 <aogpDsa8hz6CPpD3@boxer>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aogpDsa8hz6CPpD3@boxer>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_102852_863098_6C61FD27 
X-CRM114-Status: GOOD (  40.02  )
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

On 08/21, Maciej Fijalkowski wrote:
> On Thu, Aug 20, 2026 at 06:29:16PM -0700, Stanislav Fomichev wrote:
> > On 08/20, Maciej Fijalkowski wrote:
> > > On Wed, Aug 19, 2026 at 09:05:35AM -0700, Stanislav Fomichev wrote:
> > > > stmmac drops AF_XDP zero-copy frames that exceed taprio's queueMaxSDU
> > > > after xsk_tx_peek_desc() has reserved their completion entries.
> > > > 
> > > > Completing a rejected descriptor is unsafe because AF_XDP completions are
> > > > ordered: xsk_tx_completed(pool, 1) would complete the oldest outstanding
> > > > descriptor, which may still be owned by hardware. Instead, leave the
> > > > completion pending so the ring eventually wedges and increment the drop
> > > > counter to expose the application error without risking hardware
> > > > misbehavior.
> > > > 
> > > > Document this intentional ring imbalance at the check.
> > > > 
> > > > Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> > > > ---
> > > >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > > 
> > > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > > index 62de03e65a90..6a532747c039 100644
> > > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > > @@ -2713,6 +2713,10 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
> > > >  		if (priv->est && priv->est->enable &&
> > > >  		    priv->est->max_sdu[queue] &&
> > > >  		    xdp_desc.len > priv->est->max_sdu[queue]) {
> > > > +			/* Completions are ordered, so this descriptor cannot
> > > > +			 * be completed safely. Wedge the ring to expose the
> > > > +			 * application error instead.
> > > > +			 */
> > > >  			priv->xstats.max_sdu_txq_drop[queue]++;
> > > >  			continue;
> > > 
> > > Hmm. I read the discussion on v2. Maybe we could cancel cq entry here in
> > > this branch? Also it feels like something achievable at bind time when
> > > taprio is configured and vice versa?
> > > 
> > > Otherwise we over-commit cq entries.
> > 
> > What do you want to achieve with the cancel here? IIUC it will make it look
> > as if some (if the user has posted many) tx descriptor has not been consumed
> > by the kernel?
> 
> Oof. My bad. I meant completely different thing :D
> 
> Right now the semantics are that we post invalid/dropped addrs to cq (the
> rationale was that dropped descs are gone and unreachable which might
> eventually lead to dying traffic).
> 
> We should submit xdp_desc's addr to cq.
> 
> Regarding the comment included in code I must disagree. CQ entries no
> longer imply that 'this particular descriptor has been successfully sent
> by HW'.

But then we need to support some sort of out-of-order completions, no?
This looks similar to
https://lore.kernel.org/netdev/20260818162442.3980697-1-kuba@kernel.org/

We write desc to cq at xsk_tx_peek_desc, so when we get an error here
we might have already "queued" a bunch of cq entries (which will be
xsk_tx_completed(num) from sirq). So unless we rewrite the way
we do completions, there is no easy way to put that desc on cq without
breaking the order and racing with real completions from the HW.
Am I missing something here?

> > I do agree that a better idea is to probably do these checks during control
> > paths, but it's a bit more involved (and not sure if it's possible? if we
> > have a bunch of xsk sockets and we change that max_sdu, do we go over all
> > sockets on the system somehow?). My main motivation with this patch was
> > to make our LLM reviewers less chatty about preexisting issues.
> 
> I hear you, however I feel like we do not know this driver too much and
> probably we don't have a HW to test out such changes, so maybe let us try
> to fix existing behavior?

Let's definitely fix it properly if you have better ideas. But since we
don't have HW, I'm not super confident doing anything sophisticated
myself :-D

