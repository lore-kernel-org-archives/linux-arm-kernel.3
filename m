Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5CDCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 12:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aCQ+H0c+wVftlMBVRbtm3uG4VWV5k7egRAeD7StXg4Y=; b=d+NRKT2ahHnXCgU/w/QXq9L/Hm
	nqmP9LstFIVacOCCg/sRNyihcNx18MXN2mfKwQ8Z6TKmgrGma6aDQzZ/zqo2Z6DVCZbmgZMzF0qlt
	jS47vRtbn6LBdtEmNZTJuueuaoSc+g0a8PQn26UZxJcwVwAIaZHNMD613gAH0T7I26jwA8ezhMHkB
	A+TUVUQETtcb1lMtgCf0bMoi0cLPJXf6TiRa/xKejuLag4DO2hyqa+Cgi8MzxQCvQwHoC3gWgzQIQ
	tiE9pH3hFoQ7HKE4cG4X0w4T48HB8sIt41UZDpaTBYUnXMtZBH4GBM6+tXYtw7S2cJtSAlJOHZ9+R
	8uk0UhAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBAXN-00000000Z2A-1l3M;
	Mon, 28 Sep 2026 12:32:53 +0000
Received: from m16.mail.126.com ([117.135.210.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBAXK-00000000Z0F-2YQV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 12:32:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=aCQ+H0c+wVftlMBVRbtm3uG4VWV5k7egRAeD7StXg4Y=;
	b=n1Ukvfpz6YJb1tXnfP6VyeZouJ/gQl9yilQdCaZ2yCKmna6ZXRzvSjRhuRtH4O
	b2UzA6Z4sTBjxVHzO+2D9c6UuYN7wNYlPDTxq/dfrhWCpGa3KtHXzx+jbuoV6kIU
	Umv9UeC7wgfOCGR1B7e7i0lIgXhRJ+8WBlGm791iBx7DY=
Message-ID: <9ae72d05-dd76-42d6-ae29-b49cfddf85e9@126.com>
Date: Mon, 28 Sep 2026 20:32:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] net: stmmac: do not cache the new TSO MSS before
 it reaches the DMA
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 xiaolinkui@kylinos.cn, stable@vger.kernel.org,
 lorenzo.bianconi@oss.qualcomm.com
References: <20260922124408.645496-1-xiaolinkui@126.com>
 <179016759614.2160803.12192059495158802876@kernel.org>
Content-Language: en-US
From: Linkui Xiao <xiaolinkui@126.com>
In-Reply-To: <179016759614.2160803.12192059495158802876@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: PikvCgD3n_5AXrpq+9lyAg--.58147S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJF48tFWkWw47uw47Kr1UAwb_yoW5WF15pa
	y3Kwn0kr1DGFWSqF4xCw40ya4rZw4rtFy5Ar98KrW5Aws8WryIgrW3Ka4Y9Fy7Cw4kX34Y
	yr4Yg3sxZFWDZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UuCJQUUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBqALwx2q6XkJr0AAA3q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_053251_068785_FB15B9E0 
X-CRM114-Status: GOOD (  13.40  )
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

 > [Medium] Can this new write position re-publish a stale non-zero
 > tx_q->mss after a concurrent TX channel reset has invalidated it?

Agreed, and v4 no longer moves the store: the value is now dropped on the
paths that never hand the context descriptor to the DMA, which is what the
commit message was claiming in the first place.

Two things are worth separating though.

The interleaving itself is not introduced by the patch.
stmmac_tx_err() is called from the DMA interrupt handler without any
serialisation against ndo_start_xmit(), so a reset can land anywhere
inside stmmac_tso_xmit(), and a reset that lands before the early
"tx_q->mss = mss" -- anywhere between the entry of the function and that
store, which includes stmmac_tso_get_num_desc() and the availability check
-- leaves a non-zero cache for the channel that was just re-initialised
with the old placement as well. So it is not true that "with the old
placement a later reset always won"; what the patch did is widen that
window by roughly the length of the mapping section holding the two
dma_map_single()/skb_frag_dma_map() calls, and that is what the new
placement has to answer for. Which it now does not: v4 keeps the store
where it was and invalidates the cache on the error paths instead. Zero is
what stmmac_reset_tx_queue() leaves behind, so it cannot republish
anything even if the reset lands in between, and the next TSO frame
programs the context descriptor again.

Second, in that interleaving the cached MSS is not the only thing left out
of step: the transmit path keeps running from its local first_entry, writes
tx_q->cur_tx = entry and lets stmmac_flush_tx_descriptors() push the tail,
while stmmac_init_tx_chan() has pointed the channel back at tx_q->dma_tx_phy
-- the software ring state and the hardware no longer agree, which is what
the reset is supposed to establish. Fixing that means the reset must stop
racing ndo_start_xmit() altogether, and it cannot be a lock taken in the
handler: the interrupted transmit path already holds the queue's
_xmit_lock, so the handler would be waiting for the context it interrupted.
That needs the channel reset moved out of hard IRQ context, and I would
rather send it as a separate change than fold it into a -net fix for the
ring wedge.

v4 therefore:

   1. drops tx_q->mss on the error paths of stmmac_tso_xmit() (new),
   2. keeps filling the context descriptor at the slot tx_q->cur_tx points
      to and releasing it explicitly on those paths (unchanged from v3),
   3. leaves the store ahead of the mappings, so the patch no longer changes
      the timing with respect to your interleaving at all.

The subject changed accordingly: the patch no longer moves the store, it
invalidates the cached value. Code changed, so the Acked-by from Lorenzo
Bianconi is not carried over.

pw-bot: cr


