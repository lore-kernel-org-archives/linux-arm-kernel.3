Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F7AC9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 16:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tVfug9vL0EnznpwJlFJQTc0dnpuna469mEFLzwTiUa0=; b=kLnw1N5+KtQRz5BE1Y81H+94Em
	Gvk74Wu0wkLCiBQLgvjhDQtR5KjIJMn8jQSGfMCzlEG0trcW0McWp/JA/py0TwbvsZoQvWAltgZoY
	NfW09yu52RFzhbqIqqgR73Cj4Xyh0Iw9BQlad7nCJ050jsxaHEmn5rRo673rhuO/4PKxl0aYZ2Y4B
	L6/uPfP39fvAOEJl3iTrrrkKQlMv+AHUnaHnMovOG/pbcASR+uAXoSSuGMX6NDDhGiuY1VmtagvCR
	VZcSMhM37JZZSLiGkQylnDXwzhRNG+ZgKds2vHfowp9KjvD4fptYWc0RkCFp54iQ6FScfH9ipweJ6
	POO8IIXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaPE-0000000415L-0lgn;
	Tue, 29 Sep 2026 16:10:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaPC-00000004158-32Gj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 16:10:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 26F02400A7;
	Tue, 29 Sep 2026 16:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 122081F000FF;
	Tue, 29 Sep 2026 16:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790698210;
	bh=tVfug9vL0EnznpwJlFJQTc0dnpuna469mEFLzwTiUa0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=E9dN69jCqQ1TTva2Kf/0s32EJmwt3JngztURfOXayFT1RgPJyu8QU18vsdDLUUvcd
	 rAoMmyEdRhiJJqfs0GL1YxNyFQza2do8aKJhya4JXoxLKR5V5aroCGbc3MlkXCdgh0
	 RxmksthVQPWEfLtIj4dhwAOCL+DwZz67dyjWw0SwXfZmCw7uOd7AYfszjN0pCQt3mG
	 BjdyNP1S+IHeSuCz+rCizGaaCjBzCVDh+++gI3Qdks91JN9A/D+621SWpL8xEprvcx
	 2dLmAao03DgCnkvzqecBk5VCcxsyQRriUb5bstwyZsgCgeHmAawOK05DRPFgrM2DDW
	 86dhY/dPsmfPg==
Subject: Re: [PATCH net-next v3] net: stmmac: add XDP multi-buff support for TX side
From: netdev-bot+sashiko@kernel.org
To: lorenzo.bianconi@oss.qualcomm.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Date: Tue, 29 Sep 2026 16:10:08 +0000
Message-ID: <179069820857.434549.2531492906306099121@kernel.org>
In-Reply-To: <20260925-b4-stmmac-xmit-mb-v3-1-ca08f029e81c@oss.qualcomm.com>
References: <20260925-b4-stmmac-xmit-mb-v3-1-ca08f029e81c@oss.qualcomm.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The patch fixes a divide-by-zero crash in the XDP TX path
  without saying so and without a Fixes: tag.
- [Low] In stmmac_xdp_xmit_xdpf(), the new coalescing check reads
  priv->tx_coal_frames[queue] twice with plain loads: once for the zero…

--

net: stmmac: add XDP multi-buff support for TX side

This commit extends stmmac_xdp_xmit_xdpf() so it can transmit XDP frames
that carry fragments. The frame head and each frag get their own TX
descriptor. The driver now also advertises NDO_XMIT_SG for the redirect
target.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 3ad9252bf6aea..f1e9ac2f98598 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5241,77 +5241,118 @@ static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
>  static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
>  				struct xdp_frame *xdpf, bool dma_map)
>  {

[ ... ]

> +	tx_q->tx_count_frames += num_frames;
>  
> -	if (tx_q->tx_count_frames % priv->tx_coal_frames[queue] == 0)
> -		set_ic = true;
> -	else
> -		set_ic = false;
> +	if (priv->tx_coal_frames[queue] &&
> +	    (tx_q->tx_count_frames % priv->tx_coal_frames[queue]) < num_frames) {

[Severity: Medium]
The old code here divided by priv->tx_coal_frames[queue] without checking
it for zero. That code came in with be8b38a722e6 ("net: stmmac: Add support
for XDP_TX action").

Can tx_coal_frames[queue] be 0 here? __stmmac_set_coalesce() only rejects
the request when both values are zero:

	if ((ec->tx_coalesce_usecs == 0) &&
	    (ec->tx_max_coalesced_frames == 0))
		return -EINVAL;

So a command like "ethtool -C ethX tx-usecs 100 tx-frames 0" is accepted
and stores 0 in priv->tx_coal_frames[]. Before this patch, the next XDP_TX
or ndo_xdp_xmit frame would then do a modulo by zero in softirq context.

The new priv->tx_coal_frames[queue] guard fixes that, but the commit
message only describes multi-buff TX support. stmmac_xmit(),
stmmac_tso_xmit() and stmmac_xdp_xmit_zc() already have this check.

Could the fix be split into its own patch with a
"Fixes: be8b38a722e6" tag, so it can reach stable?

[Severity: Low]
This check does two plain loads of priv->tx_coal_frames[queue]: one for the
zero test and one for the divisor.

__stmmac_set_coalesce() writes this field under RTNL. It does not hold the
TX queue lock that stmmac_xdp_xmit() and stmmac_xdp_xmit_back() take, and
it can store 0.

If the compiler reloads the field between the two reads and a 0 is stored
in that window, can the modulo still divide by zero? Would taking a single
snapshot help, for example:

	u32 coal = READ_ONCE(priv->tx_coal_frames[queue]);

and then using coal for both the test and the division?

stmmac_xmit(), stmmac_tso_xmit() and stmmac_xdp_xmit_zc() read the field
twice in the same way.

> +		struct stmmac_txq_stats *txq_stats;
>  
> -	if (set_ic) {
> +		desc = stmmac_get_tx_desc(priv, tx_q, entry);
> +		stmmac_set_tx_ic(priv, desc);
>  		tx_q->tx_count_frames = 0;

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260925-b4-stmmac-xmit-mb-v3-1-ca08f029e81c%40oss.qualcomm.com

