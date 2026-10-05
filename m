Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636D6CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRcb9zLvElHXZtFmXPe9zupLvWQuZzujh+9iiVsBPh4=; b=pyfSyM5zE10uvRTTk3IaW2ftdp
	oF49l8WJOsPb2L5jhgtSPxnl2HVD2Ns7TERnEFqXXTyD4ciZiU+cfM/HG8mS5zb4Wy3yiiAvJq+h6
	wEfB2qYRfdvtJD6V6lN4vPUhomJenskfBv25PqwrDenkMjMSvXFhy69mhk/u+eRwCdCmycWZc/v7w
	zCzVvh46PkDj7U3/uahkZZOvEQTttODfLZKj0PHufVC9dv4U94FZyHfaT3kNiBXfsFUg2nsmrWyp2
	IIkQl6/oDDtw+Ux9RTsk9Vx61iLbqy1DgG/XtskBj3StykfFsqpow1cSl3c0BwAHL9igCQ+06aVwV
	l2XwRidg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfIX-0000000G4MU-3h8k;
	Mon, 05 Oct 2026 09:47:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfIW-0000000G4LO-0Jx0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 09:47:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 28E0160235;
	Mon,  5 Oct 2026 09:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E0F1F0089D;
	Mon,  5 Oct 2026 09:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791193670;
	bh=gRcb9zLvElHXZtFmXPe9zupLvWQuZzujh+9iiVsBPh4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ju3bQnsD4MbRoBThXUmageuiqholHbCt5hOtpn8b2giUuAhnJ9GbYNxnIClxgH0+E
	 RCDuc7sRvTT6Qxdx5ZwP2nhiSOcVr2YVvrYIdFvxBGrwQVGYQHkZT92PAR8omcq7eJ
	 6ju/VvTuMecQxRivAVDkceF1UrWu9tI7k0tiNreINhSVNJAfnhws0HVoLKYFJGE2e6
	 kCTRilci8KCS9f7fQ0phtH/fXSjGl9n96Rb+diZsI36ePLoNBO/Zkk2Cq3jlbEJXaX
	 hWD1PyMf1/7RI+IE+/rKfEMjuJSUWg+LnvDeZTyv1VMSPn4E6+j+onfqxqL73MBxQp
	 CpWJdOr0S2rRw==
Subject: Re: [PATCH net-next v4 1/2] net: stmmac: fix TX coalesce race and
 div-by-zero in XDP/legacy path
From: netdev-bot+sashiko@kernel.org
To: lorenzo.bianconi@oss.qualcomm.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, boon.leong.ong@intel.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Date: Mon, 05 Oct 2026 09:47:49 +0000
Message-ID: <179119366947.434549.18258387588944949725@kernel.org>
In-Reply-To: <20261001-b4-stmmac-xmit-mb-v4-1-664e0c3eb289@oss.qualcomm.com>
References: <20261001-b4-stmmac-xmit-mb-v4-1-664e0c3eb289@oss.qualcomm.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message says the stmmac_xdp_xmit_xdpf() divide-by-
  zero is "only theoretical", but a privileged user can trigger it and…

Pre-existing issues:
- [Low] __stmmac_set_coalesce() publishes tx_coal_frames[q] and
  tx_coal_timer[q] as two separate stores and shares no synchronisation…

--

net: stmmac: fix TX coalesce race and div-by-zero in XDP/legacy path

This patch wraps every access to tx_coal_frames[] in READ_ONCE() or
WRITE_ONCE(), since ethtool writes the array while the TX fast paths read
it without a lock. It also guards the modulo in stmmac_xdp_xmit_xdpf()
against a zero tx_coal_frames[queue].

> Both issues were found by code inspection while extending the XDP TX
> path with multi-buff support, and neither has ever been triggered, so
> they are only theoretical. Tested on the Qualcomm RB3-gen2 board.

[Severity: Medium]

Is the division by zero in stmmac_xdp_xmit_xdpf() really only
theoretical?

__stmmac_set_coalesce() only rejects the case where both values are zero:

	if ((ec->tx_coalesce_usecs == 0) &&
	    (ec->tx_max_coalesced_frames == 0))
		return -EINVAL;

So "ethtool -C ethX tx-frames 0" is accepted. tx-usecs keeps its default
of STMMAC_COAL_TX_TIMER, and stmmac_ethtool_ops advertises
ETHTOOL_COALESCE_MAX_FRAMES. After that, tx_coal_frames[queue] is 0.

>From then on, before this patch, every XDP_TX verdict
(stmmac_xdp_xmit_back()->stmmac_xdp_xmit_xdpf()) and every ndo_xdp_xmit
redirect into the device would evaluate:

	if (tx_q->tx_count_frames % priv->tx_coal_frames[queue] == 0)

On x86, for example the dwmac-intel platforms that advertise XDP
basic and redirect, this raises a divide error in NAPI softirq context.

On arm64, UDIV with a zero divisor returns 0 instead of trapping. That
may be why the RB3-gen2 board never hit it.

CAP_NET_ADMIN can trigger this with standard tools. Could the commit
message describe it as a reachable crash rather than a theoretical one?
Would it also make sense to send the div-by-zero fix separately from the
READ_ONCE()/WRITE_ONCE() annotations?

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> index 1cf0f8820b337..30e0d499326d8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c

[ ... ]

> @@ -887,14 +888,14 @@ static int __stmmac_set_coalesce(struct net_device *dev,
>  		int i;
>  
>  		for (i = 0; i < tx_cnt; i++) {
> -			priv->tx_coal_frames[i] =
> -				ec->tx_max_coalesced_frames;
> +			WRITE_ONCE(priv->tx_coal_frames[i],
> +				   ec->tx_max_coalesced_frames);
>  			priv->tx_coal_timer[i] =
>  				ec->tx_coalesce_usecs;
>  		}
>  	} else if (queue < tx_cnt) {
> -		priv->tx_coal_frames[queue] =
> -			ec->tx_max_coalesced_frames;
> +		WRITE_ONCE(priv->tx_coal_frames[queue],
> +			   ec->tx_max_coalesced_frames);
>  		priv->tx_coal_timer[queue] =
>  			ec->tx_coalesce_usecs;
>  	}

[Severity: Low]

This is a pre-existing issue and was not introduced by this patch.
tx_coal_frames[] and tx_coal_timer[] are still published as two separate
stores, with no synchronisation against the TX path.

Can a concurrent stmmac_xmit() see a mixed pair? Take a change from
(frames=N, usecs=0) to (frames=0, usecs=U). The TX path could read the
new frames value:

	tx_coal = READ_ONCE(priv->tx_coal_frames[queue]);
	...
	else if (!tx_coal)
		set_ic = false;

It could then read the old timer value in stmmac_tx_timer_arm():

	u32 tx_coal_timer = priv->tx_coal_timer[queue];

	if (!tx_coal_timer)
		return;

That frame would then get neither an IC interrupt nor the completion
timer. Its completion would wait for the next TX or NAPI activity on that
queue. The same window exists for stmmac_tso_xmit() and
stmmac_xdp_xmit_xdpf().

READ_ONCE()/WRITE_ONCE() make each field consistent on its own, which is
all the commit message claims. The window across the two fields is still
there.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261001-b4-stmmac-xmit-mb-v4-0-664e0c3eb289%40oss.qualcomm.com

