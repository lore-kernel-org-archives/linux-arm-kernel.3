Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705111091916
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 22:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0yp23tNbPW94JMNdRGMZBEkiUIPkf8ue7dSq7oobTEQ=; b=bueo6cRF1bM7wG9aXtPTAq3ivY
	5V7W2qHZOF9KM3AGtIik/XAwgdNP7Yo8+XkM/sm9UxgTLMN4xR3xDJE0igotzRWr6RwHUGJf5DCPy
	j5QQYemFs4RVtEeXH8ZBjc9cN7/6ZoLS3tffAZ+OlLAVnGNulWrFlYXfSP0zb+0xKDElnvHWiKihf
	Xay7JGxsdBSsNSZYtpUY2DiVeb5wSc16MRbzC4uQlN/RxebiYIlHxdBQgTxed+4GjOADG3rugoOU1
	9+VBh/AGY79XGh3TGjiZLvEaisyIVxLhW97VaRv5rX+2tB9gQtpTUf+kfLOmHfZNQlntwWL+EmDxI
	z1CtyHuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3LPK-0000000Bc2m-0whL;
	Thu, 19 Mar 2026 21:59:58 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3LPG-0000000Bc1i-3H6t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 21:59:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0yp23tNbPW94JMNdRGMZBEkiUIPkf8ue7dSq7oobTEQ=; b=weV3nqI7chBqru/dlHBoOpFFn3
	xshJScE+Z/b4faKZyekCELpOCgC109DFD4+6JYL6xn/mVHHv5AQ1Q6hYtr3o8Ju7ZVH28Gk3uRa5+
	voQiCnmMiErPZfckGZhef6YsihnyV13ZoybKYjvTG8a2NDOPgvdfeiuA7sKx6DGOVzWb14LTKnzxo
	VHQiIyorzK6RcDnFuC7Lgr/tYhk0RZ7NfngmXG3X86idQmG+wfpLArb58r514rquGwA5KwhmUI7Li
	UCKgfb3oDY8bKXDGd2xhZbuNZP7ns8jZJ3NUY4Tzo9FuyEhFYcMXpp1YbeCK7o0iV0dehkagz6tLl
	rdyOkYkg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60868)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w3LP2-000000005Mx-2VQf;
	Thu, 19 Mar 2026 21:59:40 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w3LOy-0000000008l-2rCx;
	Thu, 19 Mar 2026 21:59:36 +0000
Date: Thu, 19 Mar 2026 21:59:36 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sam Edwards <cfsworks@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Serge Semin <fancer.lancer@gmail.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH net v2 1/2] net: stmmac: Prevent NULL deref when RX
 memory exhausted
Message-ID: <abxxyHVXp6QpPue5@shell.armlinux.org.uk>
References: <20260319184031.8596-1-CFSworks@gmail.com>
 <20260319184031.8596-2-CFSworks@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319184031.8596-2-CFSworks@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_145955_105405_11999447 
X-CRM114-Status: GOOD (  24.02  )
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

On Thu, Mar 19, 2026 at 11:40:30AM -0700, Sam Edwards wrote:
> The CPU receives frames from the MAC through conventional DMA: the CPU
> allocates buffers for the MAC, then the MAC fills them and returns
> ownership to the CPU. For each hardware RX queue, the CPU and MAC
> coordinate through a shared ring array of DMA descriptors: one
> descriptor per DMA buffer. Each descriptor includes the buffer's
> physical address and a status flag ("OWN") indicating which side owns
> the buffer: OWN=0 for CPU, OWN=1 for MAC. The CPU is only allowed to set
> the flag and the MAC is only allowed to clear it, and both must move
> through the ring in sequence: thus the ring is used for both
> "submissions" and "completions."
> 
> In the stmmac driver, stmmac_rx() bookmarks its position in the ring
> with the `cur_rx` index. The main receive loop in that function checks
> for rx_descs[cur_rx].own=0, gives the corresponding buffer to the
> network stack (NULLing the pointer), and increments `cur_rx` modulo the
> ring size. After the loop exits, stmmac_rx_refill(), which bookmarks its
> position with `dirty_rx`, allocates fresh buffers and rearms the
> descriptors (setting OWN=1). If it fails any allocation, it simply stops
> early (leaving OWN=0) and will retry where it left off when next called.
> 
> This means descriptors have a three-stage lifecycle (terms my own):
> - `empty` (OWN=1, buffer valid)
> - `full` (OWN=0, buffer valid and populated)
> - `dirty` (OWN=0, buffer NULL)
> 
> But because stmmac_rx() only checks OWN, it confuses `full`/`dirty`. In
> the past (see 'Fixes:'), there was a bug where the loop could cycle
> `cur_rx` all the way back to the first descriptor it dirtied, resulting
> in a NULL dereference when mistaken for `full`. The aforementioned
> commit resolved that *specific* failure by capping the loop's iteration
> limit at `dma_rx_size - 1`, but this is only a partial fix: if the
> previous stmmac_rx_refill() didn't complete, then there are leftover
> `dirty` descriptors that the loop might encounter without needing to
> cycle fully around. The current code therefore panics (see 'Closes:')
> when stmmac_rx_refill() is memory-starved long enough for `cur_rx` to
> catch up to `dirty_rx`.
> 
> Fix this by further tightening the clamp from `dma_rx_size - 1` to
> `dma_rx_size - stmmac_rx_dirty() - 1`, subtracting any remnant dirty
> entries and limiting the loop so that `cur_rx` cannot catch back up to
> `dirty_rx`. This carries no risk of arithmetic underflow: since the
> maximum possible return value of stmmac_rx_dirty() is `dma_rx_size - 1`,
> the worst the clamp can do is prevent the loop from running at all.

Isn't the limit equivalent to:

	space = CIRC_SPACE(rx_q->cur_rx, rx_q->dirty_rx,
			   priv->dma_conf.dma_rx_size);
	limit = min_t(unsigned int, space, limit);

(Think of the "full" and "empty" cases as "space" which can be
consumed to provide entries for the refiller to action.)

I think the same applies for patch 2 - when the above returns zero
it means we have no entries in the ring that aren't due for refill.

Have you checked whether stmmac_rx_zc() also buggy in this respect?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

