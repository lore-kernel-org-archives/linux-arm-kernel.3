Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509A1C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 06:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4cTrkejZqjO54vzP9W02sQt9N5PF/Wx2jSHjrZFM5k4=; b=FGVmfNZQIBUjxmAUCaVjDsZ1f2
	i3iCMpqjqv8UnRLx5VMB1av63LYortMd2uvQ5dzpgazh9/dadu5r1JFNIYgKL2e2037L+GYa7SzlO
	xt0LfaQMaPAXSsP+n++UoDJspFR7EGzBPLZfRAiTAkOoKwva8DqX6LYd5i5qOa/V+N4CKj8bRPpII
	AbCJG5MBuxdWLM6yYP98L1R9uR4Cy61WF9uLKwNeIW2mh/dlyizG4KWYgy1zQN3078RqiOAvV30Qh
	c5lxARWJBVfpLj+4/brSNCeSh2eSWRkSS2nIa/YkHJNhb8NF5E11mdYtYuvZFrKOdpHQFLN2wjjWw
	BDG3Onkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8XMe-000000010tP-39MP;
	Mon, 21 Sep 2026 06:18:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8XMd-000000010tJ-1xA1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 06:18:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 91D44601F1;
	Mon, 21 Sep 2026 06:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B581F000FF;
	Mon, 21 Sep 2026 06:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789971534;
	bh=4cTrkejZqjO54vzP9W02sQt9N5PF/Wx2jSHjrZFM5k4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CY2RMC+DNz9xNIoZK14hBmxfCcFt6QyKdMK/xwH5iNIzCNzArlB984Q+Wfv6djmVw
	 CBv/hUadhRgr8wviJST5L7mhqEb7aE2XqFrn438zP2nipDhlChd/kdatBBSyIoomeG
	 DegjBaIaAaEXCVxmgvEno4PK7FbEfhqDjHRBsfdUoIlf2AUM+rNuHmUj6W6a90E+df
	 LjDFF2Di7jyxTwpYJZxzLPj1DS/Pz3Y5DxUTEHQoC9g2OxbPOiXE4e2nBgVOuAfLk+
	 zPXijxa2lrTKU3HN41BSqZhwz7Q8G+1D29b3oN/qZqzME2iPDzPSAnUHKXd4ftqfXH
	 TKzTisJAeiT1w==
Subject: Re: [PATCH net v2] net: stmmac: do not cache the new TSO MSS before
 it reaches the DMA
From: netdev-bot+sashiko@kernel.org
To: xiaolinkui@126.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 xiaolinkui@kylinos.cn, stable@vger.kernel.org
Date: Mon, 21 Sep 2026 06:18:53 +0000
Message-ID: <178997153300.2160803.9722094587431911734@kernel.org>
In-Reply-To: <20260920061609.1919876-1-xiaolinkui@126.com>
References: <20260920061609.1919876-1-xiaolinkui@126.com>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message of "net: stmmac: do not cache the new TSO
  MSS before it reaches the DMA" describes a failure mode that cannot…

--

net: stmmac: do not cache the new TSO MSS before it reaches the DMA

The patch moves the tx_q->mss update in stmmac_tso_xmit() so it happens
only after the MSS context descriptor gets its OWN bit, keeps tx_q->cur_tx
parked on the context descriptor slot while the frame is being built, and
releases that descriptor explicitly on the error paths.

The code change itself looks fine; the question below is only about the
changelog.

>     The next skb carrying the same MSS then compares equal to the cached
>     value, so no context descriptor is emitted and the hardware segments the
>     TCP stream with a stale MSS, generating frames whose payload size does
>     not match what the stack accounted for.

[Severity: Medium]
Can that on-the-wire symptom actually be observed before this patch?

Before the patch, the abandoned context descriptor sits at the slot that
tx_q->cur_tx had when stmmac_set_mss() was called, and cur_tx was already
advanced past it, so every later frame is queued behind that descriptor.
Neither dwmac4_set_mss_ctxt() nor dwmac4_release_tx_desc() ever sets the
OWN bit, so the slot stays at OWN=0.

The error paths in stmmac_tso_xmit() return without calling
stmmac_flush_tx_descriptors(), and that is the only place the tail pointer
is written:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_flush_tx_descriptors() {
	...
	stmmac_set_queue_tx_tail_ptr(priv, tx_q, queue, tx_q->cur_tx);
	...
}

so the engine stays parked on the abandoned context descriptor. When a
later xmit bumps the tail, the DMA re-fetches that slot, finds OWN=0 and
suspends again.

Meanwhile stmmac_tx_clean() reclaims the OWN=0 context slot in software and
then stops at the first descriptor the DMA still owns:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_tx_clean() {
	...
		if (unlikely(status & tx_dma_own))
			break;
	...
}

which pins dirty_tx just past the stuck slot, so cur_tx can never wrap
around and rewrite it.

Doesn't that mean no frame queued after the mapping failure is segmented at
all, stale MSS or otherwise, and that the real pre-patch consequence is a
wedged tx ring recovered only by the watchdog / stmmac_tx_err() path, which
resets the channel and clears tx_q->mss via stmmac_reset_tx_queue()?

The patch does fix that by keeping tx_q->cur_tx on the context slot and
releasing mss_desc on the error paths, but the changelog does not mention
the stall. Since this carries a Fixes: tag and Cc: stable, could the
changelog describe the tx stall and controller reset instead of the
mis-sized segment description?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260920061609.1919876-1-xiaolinkui%40126.com

