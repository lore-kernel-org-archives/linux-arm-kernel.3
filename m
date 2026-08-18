Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432B7C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 18:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ETkdxpF0tWteog/KgiT1FsO7wpghpPcJQS69iR4Nkr4=; b=IpVj0q1LIxtCY+oSOf+NMPWC/q
	nGUsjXydD+gSZfFY+ri6ylI5GW0cXi65gHVCOjOLjbtot2MCwLlt9zWv5YxSSCahhPogMzfVp7MUb
	aycoSyH78PNCSPooqLlGUZW3kzsvlMdD+51OCPvwuErCx+AEmMH4oAkZD9K4qj+EFkjRIkxs6mtfO
	A5WimyU/uK85UzMEzbFjphhxYTjj8l/mES1y9QlIFmuqba0HRtwn7G6MBKlzm4/B0w3e+dTxQnlt0
	SZl3XUvJ8Lxrxi9nRedB3R24+8CtIWnCOTtI8eopDjZKnP8+r5oYdFf/0O6dVSZEfOr7M/WN9IsKh
	0OoE83ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwOPZ-00000008Uvl-41tH;
	Tue, 18 Aug 2026 18:19:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwOPY-00000008UvY-1C8q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 18:19:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A778601DE;
	Tue, 18 Aug 2026 18:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5101F000E9;
	Tue, 18 Aug 2026 18:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787077183;
	bh=ETkdxpF0tWteog/KgiT1FsO7wpghpPcJQS69iR4Nkr4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Sux8edeCFCaJcTjEbYr3gqRoxfK1jSE1/+SPmVdBg0gfzcEYZv7X8zVv+9UEiGGpT
	 3vhTFsYy4zlxy9/PdHazRIEdqv0cERm2YiN0kz1mjdr8k/Yy9CMgSQVGe2vZ99nmqE
	 cIZpn4lk0O66W3g/6exvx/aQOCx+UUTj4sw9uGR7bIiONOE2c1c98oNfrmtU0Y/Yi+
	 mcynAMzj1tH97qegngbomLgMtsNYL26DoBRuluoSfdf8x5GHodQUeZu7fI6YR958Uc
	 WkHBjqnw5A88hJF+4GOHo7AcoXBZS8mdA39P7lYnSn/qKNQq4n0n/WXIikyAqZ3f3p
	 h5ey7nS4LrDqA==
Date: Tue, 18 Aug 2026 11:19:40 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, anthony.l.nguyen@intel.com,
 przemyslaw.kitszel@intel.com, andrew+netdev@lunn.ch, saeedm@nvidia.com,
 tariqt@nvidia.com, mbloch@nvidia.com, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 aleksander.lobakin@intel.com, horms@kernel.org, magnus.karlsson@intel.com,
 maciej.fijalkowski@intel.com, sdf@fomichev.me, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 witu@nvidia.com, martin.lau@kernel.org, yoong.siang.song@intel.com,
 rohan.g.thomas@intel.com, intel-wired-lan@lists.osuosl.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, leon@kernel.org
Subject: Re: [Intel-wired-lan] [PATCH net v2 3/3] net: stmmac: skip
 queueMaxSDU check for AF_XDP
Message-ID: <20260818111940.2e280a6b@kernel.org>
In-Reply-To: <aoSOau3NuHTLLxnL@devvm7509.cco0.facebook.com>
References: <20260813190800.222527-4-sdf@fomichev.me>
	<20260818162442.3980697-1-kuba@kernel.org>
	<aoSOau3NuHTLLxnL@devvm7509.cco0.facebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 18 Aug 2026 10:03:16 -0700 Stanislav Fomichev wrote:
> > Was completing the reserved descriptor considered instead of removing the
> > check, i.e. keeping the length test and doing:
> > 
> > 	if (priv->est && priv->est->enable &&
> > 	    priv->est->max_sdu[queue] &&
> > 	    xdp_desc.len > priv->est->max_sdu[queue]) {
> > 		priv->xstats.max_sdu_txq_drop[queue]++;
> > 		xsk_tx_completed(pool, 1);
> > 		continue;
> > 	}
> > 
> > That would fix the ring accounting without dropping the enforcement.  
> 
> Don't think this suggestion would work. xsk_tx_completed(1) will complete
> the first queued entry, no the current rejected one (completions are in order).
> 
> If it's not convincing, I can repost only patches 1 and 2. Or if it sounds
> reasonable, can try to explain that part in the description.

Hm, I see. No strong preference but I'd probably just add a comment
above the checks saying that we are leaking there semi-intentionally
because it's an application error to send packets HW/schedule can't
handle. We expect user to fix their app. IOW if we can't handle this
well I think it's better to wedge the SW and bump the drop counter
for visibility, than risk HW silently misbehaving.

