Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C9DCCF2D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 11:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5bO4U+trkWr254I1Yj+4SsCvrERs9vmKIAeF7UeSbL8=; b=xPdIj3UVKYkLlucrMaDkjAqDL5
	zyz92w6AkDWxVWtVIJh2Pz5c7nMxwG8K71tJ4RsnDwsDyS0zwN3ENflkJIQvlEcgnGEINarj2ZpTo
	+EwvfmYXZLFhUyTkxUWoe/JYQy6d4I+9kUWYxup5hdy5ecfQ4gRy52q6CagjifPve0tnlpp2UTpXs
	4uN+HqXyeCfaB6KsEK/m1PzFrZWoOT2E6TNicc1uEsr7lpuQ3f0q989box7cITBZt06s6O8TT7xLA
	Nsri3R2d2ymetUZ9lePfQZGMQlDigk2rdQmuY7EFVBMXemJtBj6svtbCxOU+ZhRaS6FzyFiscjQTX
	QYzQvW4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlEO-00000007G5L-1zZV;
	Mon, 19 Oct 2026 11:08:40 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlEH-00000007G3q-1di2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 11:08:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7DBADA012B;
	Mon, 19 Oct 2026 13:08:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1792408102; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5bO4U+trkWr254I1Yj+4SsCvrERs9vmKIAeF7UeSbL8=;
	b=xBjblPJEXvZWghFd34CrF/W7QjSUcxZ4nOjuxKyN907/1xutdrSPOeIlyX9AA+6Cqfs5DJ
	vs/yOGugxIpjsQdEpotJjp8ACT2OqiyrVYNz20pzhl0e22V13ivz+s2s6if1BYg3rAg1B5
	8uhSYAIYgvLN63wa3DnkCDgyOWrK4aFr5Y1xJ4ovzDa51ruKv2rfFTzRAZfIhK3Sv38E7z
	oIyQGhN1FWCN9d1FQb8gw9SSheXEHVKWBA8+zdtmaidoyHOwRa2jCP25a/+ElVLYUixkpq
	j56hWYodLEySRQlDZzKY7wImTfpfCxi2X0avE1dA9S9jaPAr8RJ2qUAbt7jgdg==
MIME-Version: 1.0
Date: Mon, 19 Oct 2026 13:08:15 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer
 <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Stanislav
 Fomichev <sdf@fomichev.me>, Jose Abreu <Jose.Abreu@synopsys.com>, Ong Boon
 Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net-next v8 3/5] net: stmmac: drop multi-buffer frames in
 XDP mode
In-Reply-To: <20261018-stmmac-rx-mb-v8-3-5f58c0b25849@oss.qualcomm.com>
References: <20261018-stmmac-rx-mb-v8-0-5f58c0b25849@oss.qualcomm.com>
 <20261018-stmmac-rx-mb-v8-3-5f58c0b25849@oss.qualcomm.com>
Message-ID: <8af4012ae73827a721533e2734b80ea9@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_040833_588367_2033F94F 
X-CRM114-Status: GOOD (  17.69  )
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

On 18.10.2026 19:07, Lorenzo Bianconi wrote:
> stmmac_rx() runs the XDP program once per descriptor buffer and uses
> skb == NULL as the only marker for the start of a frame. A frame larger
> than one buffer is split by the hardware across several descriptors;
> GMAC4 enables jumbo frames unconditionally (GMAC_CONFIG_JE in
> GMAC_CORE_INIT), so an on-link peer can deliver such a frame even when
> the interface MTU is left at 1500.
> 
> When an XDP verdict ends a non-last descriptor, skb is cleared and the
> next descriptor of the same hardware frame is parsed as a new frame.
> For XDP_CONSUMED this happens via read_again with len preserved, so
> stmmac_rx_buf1_len() then returns min(dma_buf_sz, plen - len) for the
> last descriptor, which can be as small as 0-3 bytes. buf1_len -=
> ETH_FCS_LEN underflows and xdp_prepare_buff() puts data_end far past
> data; on XDP_PASS this produces an skb whose length is close to 4G that
> reaches the network stack (skb->tail and skb->len are 32-bit and wrap
> below skb->end, so skb_over_panic() does not fire). A 4+ byte tail is
> instead offered to the XDP program and delivered as a standalone
> mid-payload Ethernet frame on XDP_PASS. XDP_TX/XDP_REDIRECT instead
> falls through to the next iteration, resetting the running length, so
> the tail is re-parsed as a full-size new frame.
> 
> The same fault exists when a single descriptor uses its second buffer:
> GMAC4/XGMAC always provide a second data buffer per descriptor, so a
> frame up to 2 * dma_buf_sz can land on a single descriptor while the 
> XDP
> program still only sees the first buffer. XDP_TX then transmits a
> truncated frame, and XDP_PASS appends the second buffer only after the
> program has already run over the first one.
> 
> XDP does not support scatter-gather frames until the multi-buffer
> rework, so drop the whole frame instead: mark it as errored as soon as
> a non-last descriptor, or a descriptor using its second buffer, is seen
> while an XDP program is attached, drain and release every descriptor -
> including the last. Removing the re-parse lets both XDP verdict 
> branches
> simply complete the packet via next.
> 
> Note: the subsequent "net: stmmac: rework stmmac_rx to support XDP rx
> multi-buff" accumulates the whole frame into a single xdp_buff and
> supersedes this patch; the fix is kept so the net portion of the series
> stands on its own.
> 
> Fixes: 5fabb01207a2 ("net: stmmac: Add initial XDP support")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> ---
> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai

