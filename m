Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AB9CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 14:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ATzG+L8YsNUmOKoBB/0ap9vpolQt4BSY6mfBdVkuIBU=; b=ZEaEZ+9JehrTkjjbXcGbEvqj/w
	yDMCjTyTcQYRmCfDYwZ/Zba6EfWy9H1oeyZhqR0Hw9l1bc0qxyQ1sOIcLkjlGs5kRMazBOxcYhHUy
	lFz730DPXkZBEyAMhg4V/C0nAhxX/Is7+GmsffixWK1/uj8jXjPj7fYcoypHklDRUNwyxJ4M9uOyt
	t6IIv65NJXTSZlFT2E5hTo87I4FhoSZrwe6f6SvexymqG0pwHrNA1csQ6P9KaNxo2uK7lNjTXMjan
	Ox3GIpriXv+EQBzff0el1EGiFSsUDWSehgTKEqE2XWatx3lVOmQFPAC7JWwZv87WM3EE9EqZccBx0
	AM3qYRNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDjS8-0000000Gbu2-0aYR;
	Mon, 05 Oct 2026 14:14:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDjS6-0000000GbtF-1j68
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 14:14:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 87F366053B;
	Mon,  5 Oct 2026 14:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F6A1F000FF;
	Mon,  5 Oct 2026 14:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791209641;
	bh=ATzG+L8YsNUmOKoBB/0ap9vpolQt4BSY6mfBdVkuIBU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=nofCIAYhG7dNx6Jw6Tof83bZ3Q/+7konRGEISbyroRn1NByU6/aOAKmc0teLiI8lt
	 K6tsqsGxDeQcEDShasFyL66hB3qgvNpFedhW7YfO0UcexAJpg26kjhGEttcbwPgRsG
	 x3BPnfgN3VaS0D8pNgHIyuGwfBdTjxmYLVw+tqArtgDTkc459DVhh+9OP8yI6YPbqs
	 SJfhWhqj4LZhura48DtBsEZ9CGUqi/83qsbutwq/qJzlojUDwCaMw5MztiiLKaRiwH
	 cBXV0ZCS8qWievWHK3MgCjFQbDLhRoFP7AxcSNy5f7tQqfu9Vl0aD15ANj99os4pRU
	 3paQf3N7TilWg==
Subject: Re: [PATCH net-next v4 1/3] net: stmmac: set real_num_tx_queues to
 max(offset + count)
From: netdev-bot+sashiko@kernel.org
To: lorenzo.bianconi@oss.qualcomm.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, olteanv@gmail.com,
 0x1207@gmail.com, daniel@riscstar.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, dcaratti@redhat.com
Date: Mon, 05 Oct 2026 14:13:59 +0000
Message-ID: <179120963986.434549.17858114667686220816@kernel.org>
In-Reply-To: <20261001-stmmac-mqprio-prio-offload-v4-1-a74610d7f1e5@oss.qualcomm.com>
References: <20261001-stmmac-mqprio-prio-offload-v4-1-a74610d7f1e5@oss.qualcomm.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message describes only one of two failure modes.

--

net: stmmac: set real_num_tx_queues to max(offset + count)

This patch changes how tc_setup_dwmac510_mqprio() computes the number of
real TX queues. It now uses the maximum of offset[i] + count[i] instead
of the sum of the per-TC counts. As a result, real_num_tx_queues covers
the highest queue in the TC map even when the mqprio layout has gaps or
a non-zero first offset.

> netif_set_real_num_tx_queues() then passes this too-small count to
> netif_setup_tc(), which invalidates the mapping.

[Severity: Low]
Is this description complete? It seems to cover only layouts where TC0
itself ends up out of range.

In tc_setup_dwmac510_mqprio(), stmmac_set_ndev_tcs() runs before
netif_set_real_num_tx_queues(). It starts by calling netdev_reset_tc(),
which zeroes dev->prio_tc_map:

drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c:stmmac_set_ndev_tcs() {
	...
	netdev_reset_tc(ndev);
	...
}

So when netif_setup_tc() runs, every priority maps to TC0, and the TC0
check is the only one that can fire:

net/core/dev.c:netif_setup_tc() {
	...
	/* If TC0 is invalidated disable TC mapping */
	if (res.offset + res.count > txq) {
		netdev_warn(dev, "Number of in use tx queues changed invalidating tc mappings. Priority traffic classification disabled!\n");
		WRITE_ONCE(dev->num_tc, 0);
		return;
	}
	...
}

mqprio_init() installs the user's prio_tc_map only after the offload
callback returns.

Take a gapped layout where TC0 fits, such as "queues 1@0 1@2". The old
sum gives real_num_tx_queues = 2, and nothing gets invalidated. TC1
keeps offset 2, so on transmit:

netdev_core_pick_tx()
  netdev_pick_tx()
    skb_tx_hash()          /* returns 2 */
  netdev_cap_txqueue()     /* 2 >= real_num_tx_queues, warns, returns 0 */

stmmac does not implement ndo_select_queue. That traffic class,
including express or preemptible FPE traffic, would therefore go out on
queue 0 with only a ratelimited warning. Its mapping would not be
rejected.

The code change handles both cases. Could the commit message also
describe this misrouting case, so backporters can see the full impact of
the bug being fixed?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261001-stmmac-mqprio-prio-offload-v4-0-a74610d7f1e5%40oss.qualcomm.com

