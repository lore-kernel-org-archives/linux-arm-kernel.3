Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631D9C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 17:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q80BWnEZK8DYTRP4qPFCamRkQ8PTkFuflTPG4q2POi4=; b=HSCN2JxqINni8+ef4SEe/aTzYH
	W9SCTu0nnD0eE1ZhVNlmy6RsMrjyEJaVXeZu0p5u2hU2a8HEyPG7tf5Ia4X1Sa61CQiudqy/SuphU
	vxG0QOGrWTnyL/6DP6OyOPmD5csB9/DhjJYsrHS46xd5AnmYbcGVxYP+Hka7dkjG/8A7r1M96wMD1
	xFw0+HBlJr56UVz9gZnPEByfGXStWK10snqFDla6jUC017k0OImH0y2yUD7URfh4GiBu2bijQqeoR
	AFXDQGz77MZzcZ/wSKHnZCQZcjG2EEMa1z/KBtpyAkN6cMk3D2pf1zbDDsWslsUOoGNBern+6c+fj
	Sc1VuClg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwNEG-00000008OhP-2t5P;
	Tue, 18 Aug 2026 17:04:00 +0000
Received: from mail-pj2-x02.google.com ([2607:f8b0:4864:39::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwNEB-00000008OgU-46uz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 17:03:59 +0000
Received: by mail-pj2-x02.google.com with SMTP id d9443c01a7336-2cb3f5bb19aso240565ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 10:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787072634; x=1787677434; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q80BWnEZK8DYTRP4qPFCamRkQ8PTkFuflTPG4q2POi4=;
        b=XFSgQkhsF9a/orbxD47XPUTFSh9Bo416HOQ8EXrSA1Xqx4tnY66XQQk/Kj/pwfa0cz
         CsYWzO+vYzeRP5EUQKJ0552uEtAe1avKDroAAaQfREdVj0gGZZHdB7YVYsUMpRaEEScb
         dIFJp4CeCLxnj0Y1mYPXeiocnM5N0+AEZ3WtuFd6eEwvuBOX/09hEB9D9+LOIpU77V4N
         8skxbJ8SXwmuluAPFyUJBB4qxWyfuLm8+SkVikDCLQcBT+/5lJXnaxhKLSEBdCDEA7aP
         QciG1bZQE7P2dbOvR8EiT43oBCvOkXB9cyAsXXunQJRowoiW02aQ2wNOKVl8Bnp6xZ9j
         TJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787072634; x=1787677434;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q80BWnEZK8DYTRP4qPFCamRkQ8PTkFuflTPG4q2POi4=;
        b=HxxMH/QldiOxXZC6IK7aXKgygiBegMs04iwm2xUptu3muOrOb/WBmOVzVCQzfYR6VA
         rLkp6hoTf2n1nq6lVLpvmdCoapWmQWr9K2dyt01ewRVIBrlGM9Z3xUEC/12sanQTPtoH
         AitzhvGfmav9j4T9aWSEomBXXZOuTYZiHJjVMgLVRMHjWGBIRwnh/7xa2Z5+b6h9F4Nf
         tDsBKrVVovlH24RSnnJhRlFfnr8VfZarx1RRw6h6l7dPhSSbDAKowlNP/qct+jNTnBl7
         zOq1H8lswTNeDBjTC9mvIpAJcEoDEDtskUKFPpxasBum0aX4MqkXkGXPMIxDqZ2TYi47
         nlWg==
X-Forwarded-Encrypted: i=1; AHgh+RrTt2L9GHCSK+zBbuuRSM0rxTim3UZGvbWOLk0IzBH8eWnfLfvf0LcB6VT0WbanovHNcaJfDbD9RrbV50cZEQbK@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/rnTXZMsPtTtFvaAXK0MKi6bCDfGehP8qouNfhFVPxPGCivBZ
	jb3fi58+xxvN46d/JAnTZY+2vBuQotQz6mma2psn1g5sUq7nqro9K95P
X-Gm-Gg: AR+sD13oytcNR1Wu6nJt0rzoNDWq4jmE7NcA6D2wyieS3xdJlGcSVuAiYOESlITr/XP
	Z5QVKJe/SnUA4+WvavUJy1z5Uxt+lPRzaoWxirn0NjPirtqzTi0UHl3pC1Rh/+Qtl60+N4SHp0g
	Eln2fbWiwVRNiGRrqGE3kwGC35wQjlmOSqbRJrSM1HTMWeFl/Ds6TKpcAZwPbUqdm9cWfNeBAmn
	84FjWHH4/7tkIK7s67nzPowVRkvOE8IeIfuJFjGvIFdANC8fL51DjHrsni9HpdEbfBa9sExbn0T
	wGgcDGIS6PuqS1XCD6H7dy5jyUZCRbZ7eP6rN9l3eDsHB1YrTfHLqEma0I7+Gb1gHsTKZxPtHt3
	eliuJ8PLJJlzDd9+Wy5BgAmfdacW9n044x46p+deva2oOB7fIo/241XD2f/L/+rxFrYb19tP+qJ
	lGr8cSm0loKiLrv0iHk32yhLCk9YgbSsCTAWfxEsb7MkkQWS+tzhjh
X-Received: by 2002:a17:902:d4cf:b0:2ca:660:b1d with SMTP id d9443c01a7336-2d3b0d5eccfmr373846305ad.11.1787072634166;
        Tue, 18 Aug 2026 10:03:54 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:7::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb499d7bsm20728245ad.3.2026.08.18.10.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 10:03:53 -0700 (PDT)
Date: Tue, 18 Aug 2026 10:03:16 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com, 
	andrew+netdev@lunn.ch, saeedm@nvidia.com, tariqt@nvidia.com, mbloch@nvidia.com, 
	maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	aleksander.lobakin@intel.com, horms@kernel.org, magnus.karlsson@intel.com, 
	maciej.fijalkowski@intel.com, sdf@fomichev.me, ast@kernel.org, daniel@iogearbox.net, 
	hawk@kernel.org, john.fastabend@gmail.com, witu@nvidia.com, martin.lau@kernel.org, 
	yoong.siang.song@intel.com, rohan.g.thomas@intel.com, intel-wired-lan@lists.osuosl.org, 
	linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
	leon@kernel.org
Subject: Re: [Intel-wired-lan] [PATCH net v2 3/3] net: stmmac: skip
 queueMaxSDU check for AF_XDP
Message-ID: <aoSOau3NuHTLLxnL@devvm7509.cco0.facebook.com>
References: <20260813190800.222527-4-sdf@fomichev.me>
 <20260818162442.3980697-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260818162442.3980697-1-kuba@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_100356_030026_DA8BE16E 
X-CRM114-Status: GOOD (  28.05  )
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

On 08/18, Jakub Kicinski wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> ---
> net: stmmac: skip queueMaxSDU check for AF_XDP
> 
> This drops the per-queue max SDU length check from the stmmac AF_XDP
> zero-copy transmit path, on the grounds that xsk_tx_peek_desc() has
> already reserved a completion ring entry and the old "continue" skipped
> both queuing and completion. The change is tagged for stable via a Fixes:
> tag on c5c3e1bfc9e0.
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 62de03e65a90c..4a82f4351303a 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -2710,13 +2710,6 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
> >  		if (!xsk_tx_peek_desc(pool, &xdp_desc))
> >  			break;
> >  
> > -		if (priv->est && priv->est->enable &&
> > -		    priv->est->max_sdu[queue] &&
> > -		    xdp_desc.len > priv->est->max_sdu[queue]) {
> > -			priv->xstats.max_sdu_txq_drop[queue]++;
> > -			continue;
> > -		}
> > -
> 
> [Severity: Medium]
> The completion ring imbalance described in the commit message looks real:
> xsk_tx_peek_desc() reserves the cq slot with xskq_prod_reserve_addr() and
> only xsk_tx_completed() submits it, so the old "continue" left the cq
> producer permanently offset.
> 
> Was completing the reserved descriptor considered instead of removing the
> check, i.e. keeping the length test and doing:
> 
> 	if (priv->est && priv->est->enable &&
> 	    priv->est->max_sdu[queue] &&
> 	    xdp_desc.len > priv->est->max_sdu[queue]) {
> 		priv->xstats.max_sdu_txq_drop[queue]++;
> 		xsk_tx_completed(pool, 1);
> 		continue;
> 	}
> 
> That would fix the ring accounting without dropping the enforcement.

Don't think this suggestion would work. xsk_tx_completed(1) will complete
the first queued entry, no the current rejected one (completions are in order).

If it's not convincing, I can repost only patches 1 and 2. Or if it sounds
reasonable, can try to explain that part in the description.

> On stmmac, queueMaxSDU has no hardware table. priv->est->max_sdu[] is
> written only by tc_taprio_map_maxsdu_txq() in stmmac_tc.c:
> 
> 		for (j = offset; j < offset + count; j++)
> 			priv->est->max_sdu[j] = qopt->max_sdu[i] + ETH_HLEN - ETH_TLEN;
> 
> and read only by the length checks in stmmac_main.c. With this hunk gone,
> does an AF_XDP zero-copy socket now transmit frames above the configured
> per-queue limit while tc_query_caps() still reports:
> 
> 		caps->gate_mask_per_txq = true;
> 		caps->supports_queue_max_sdu = true;
> 
> That capability is what taprio uses to accept a queueMaxSDU configuration
> in the first place, and sch_taprio comments in
> taprio_skb_exceeds_queue_max_sdu() that "Devices with full offload are
> expected to honor this in hardware".
> 
> The "bypasses the qdisc" rationale also applies to stmmac_xdp_xmit_xdpf(),
> which serves XDP_TX and ndo_xdp_xmit and does not traverse the qdisc
> either, yet still enforces the same limit:
> 
> 	if (priv->est && priv->est->enable &&
> 	    priv->est->max_sdu[queue] &&
> 	    xdpf->len > priv->est->max_sdu[queue]) {
> 		priv->xstats.max_sdu_txq_drop[queue]++;
> 		return STMMAC_XDP_CONSUMED;
> 	}
> 
> Should that check be removed as well so the XDP paths agree? The cited igc
> precedent checks only in igc_xmit_frame_ring() and in neither of its XDP
> paths, so matching igc would mean touching stmmac_xdp_xmit_xdpf() too.

xdp_tx does not expose xsk-like descriptor rings, so it doesn't apply.

