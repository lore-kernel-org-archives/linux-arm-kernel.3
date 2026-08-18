Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25402C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 16:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lAH3pJNXPJ/mpBu0kcIh+xNKTmt6P69p829a8VtOvMM=; b=Wq5gpsXU9bpd5eBXt1AaB8Wgy9
	PiOFCrYLEVcc84Q3HidCXcztaw1eS8cO33t75FZ9yzIGK2JHVHbi6Dy0WpP3giX5fWBfZ8gvEpbve
	2bIb1HAyN8pYktaTOHP8N/LVmY5jB899wudixd6uEI+ZzSbw5l1aobHSRsgJ+4lkX4A8NwPXnJwDC
	NalMcNHvtmY4gZ+INeWluDLUj1rv9+BczYx/YWeolEKRhBh2KJuEOpaGv9UQA0w55HkFnkqOHy4eh
	BmnqEurA5uccBHNqc7iKESBGQlV3q/PxbDs+POSiYoRU3hwZRxaR9mGoy6Vu0HibJ/vM0ZzIZa6ja
	UypIdsaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwMcI-00000008L3h-43g7;
	Tue, 18 Aug 2026 16:24:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwMcH-00000008L3J-2NZh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 16:24:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E671243224;
	Tue, 18 Aug 2026 16:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333431F000E9;
	Tue, 18 Aug 2026 16:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787070284;
	bh=lAH3pJNXPJ/mpBu0kcIh+xNKTmt6P69p829a8VtOvMM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Bvv2WUii6kPGfFMnUBHavzMRt6MiX+8jYJeKt3gdN0E+jnY/489pqoEyEbCGlX9w5
	 5PAmXWAcMQkPsTolXP1HaWwia1K0FQBRUaL2zyDeuowiqCQHMYYFGycASzWRV3xKYk
	 iSgPOhSmT4uD1Eww8lr5NT0f+n1Bw6eUbkYcZ/ZdWJwqKtCI0XKCXgPQ3+J/LDCfGf
	 KR1T5pQ8n1Rx6bAxoutfWwv/SOABcXWAzozbgyDI6dKUXhE3q+E2HGqNcxs5JUjzpR
	 u4u0pPlGpLvb0b4PP5FDsXwYFZ+pPDndH6iJj+mAxYzAdrgYg2M+6wGTp6lvyJy7y/
	 TOPlVERvk3/eg==
From: Jakub Kicinski <kuba@kernel.org>
To: sdf.kernel@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	andrew+netdev@lunn.ch,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	maxime.chevallier@bootlin.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	aleksander.lobakin@intel.com,
	horms@kernel.org,
	magnus.karlsson@intel.com,
	maciej.fijalkowski@intel.com,
	sdf@fomichev.me,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	witu@nvidia.com,
	martin.lau@kernel.org,
	yoong.siang.song@intel.com,
	rohan.g.thomas@intel.com,
	intel-wired-lan@lists.osuosl.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org,
	leon@kernel.org
Subject: Re: [Intel-wired-lan] [PATCH net v2 3/3] net: stmmac: skip queueMaxSDU check for AF_XDP
Date: Tue, 18 Aug 2026 09:24:42 -0700
Message-ID: <20260818162442.3980697-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813190800.222527-4-sdf@fomichev.me>
References: <20260813190800.222527-4-sdf@fomichev.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: stmmac: skip queueMaxSDU check for AF_XDP

This drops the per-queue max SDU length check from the stmmac AF_XDP
zero-copy transmit path, on the grounds that xsk_tx_peek_desc() has
already reserved a completion ring entry and the old "continue" skipped
both queuing and completion. The change is tagged for stable via a Fixes:
tag on c5c3e1bfc9e0.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 62de03e65a90c..4a82f4351303a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -2710,13 +2710,6 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
>  		if (!xsk_tx_peek_desc(pool, &xdp_desc))
>  			break;
>  
> -		if (priv->est && priv->est->enable &&
> -		    priv->est->max_sdu[queue] &&
> -		    xdp_desc.len > priv->est->max_sdu[queue]) {
> -			priv->xstats.max_sdu_txq_drop[queue]++;
> -			continue;
> -		}
> -

[Severity: Medium]
The completion ring imbalance described in the commit message looks real:
xsk_tx_peek_desc() reserves the cq slot with xskq_prod_reserve_addr() and
only xsk_tx_completed() submits it, so the old "continue" left the cq
producer permanently offset.

Was completing the reserved descriptor considered instead of removing the
check, i.e. keeping the length test and doing:

	if (priv->est && priv->est->enable &&
	    priv->est->max_sdu[queue] &&
	    xdp_desc.len > priv->est->max_sdu[queue]) {
		priv->xstats.max_sdu_txq_drop[queue]++;
		xsk_tx_completed(pool, 1);
		continue;
	}

That would fix the ring accounting without dropping the enforcement.

On stmmac, queueMaxSDU has no hardware table. priv->est->max_sdu[] is
written only by tc_taprio_map_maxsdu_txq() in stmmac_tc.c:

		for (j = offset; j < offset + count; j++)
			priv->est->max_sdu[j] = qopt->max_sdu[i] + ETH_HLEN - ETH_TLEN;

and read only by the length checks in stmmac_main.c. With this hunk gone,
does an AF_XDP zero-copy socket now transmit frames above the configured
per-queue limit while tc_query_caps() still reports:

		caps->gate_mask_per_txq = true;
		caps->supports_queue_max_sdu = true;

That capability is what taprio uses to accept a queueMaxSDU configuration
in the first place, and sch_taprio comments in
taprio_skb_exceeds_queue_max_sdu() that "Devices with full offload are
expected to honor this in hardware".

The "bypasses the qdisc" rationale also applies to stmmac_xdp_xmit_xdpf(),
which serves XDP_TX and ndo_xdp_xmit and does not traverse the qdisc
either, yet still enforces the same limit:

	if (priv->est && priv->est->enable &&
	    priv->est->max_sdu[queue] &&
	    xdpf->len > priv->est->max_sdu[queue]) {
		priv->xstats.max_sdu_txq_drop[queue]++;
		return STMMAC_XDP_CONSUMED;
	}

Should that check be removed as well so the XDP paths agree? The cited igc
precedent checks only in igc_xmit_frame_ring() and in neither of its XDP
paths, so matching igc would mean touching stmmac_xdp_xmit_xdpf() too.

There is also a hardware side to this. An oversized frame on an EST-gated
queue raises MTL_EST_STATUS.HLBF, and est_irq_status() in stmmac_est.c only
counts it and clears the error register:

	if (status & EST_HLBF) {
		value = readl(est_addr + EST_FRM_SZ_ERR);
	...
				x->mtl_est_txq_hlbf[i]++;
		/* Clear Interrupt */
		writel(feqn, est_addr + EST_FRM_SZ_ERR);

There is no queue flush or EST reprogramming. est_configure() programs only:

	if (cfg->enable)
		ctrl |= EST_EEST | EST_SSWL | EST_DFBS;

and no DDBF (drop-on-frame-size-error) definition exists in the tree, so
the drop-versus-retain response is left at the reset value. If the IP
retains the frame after the doorbell was rung and cur_tx advanced, does
dirty_tx stop advancing and xsk_tx_completed() never run for that
descriptor, reintroducing the same ring imbalance from the hardware side?

One related side effect worth mentioning in the changelog: for zero-copy
traffic, taprio window_drops attribution moves from max_sdu_txq_drop to
the HLBF counters reported through stmmac_tc.c.

Also, in the commit message:

>     The assumptions is that AF_XDP zero-copy traffic bypasses the qdisc, so

"The assumptions is" should be "The assumption is".
-- 
pw-bot: cr

