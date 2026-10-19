Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3263CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 12:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5YPK5QrD2Biz8WIt271WspbuAzVZVpswCa9MB98GM1c=; b=kKmWCG7iCELJCB6RtlFFj1jv+4
	LTCFjVjzZJohF+H68v3vlFgJMTMrICquUHnQ934Z7Hmzw+rwpGgAkou80yLWpxsQHUTwdvGCpRvNw
	utGNoDZisM94XkaKSCV7/m8gtr2ltN4Vbwk8uJaUAu1mKA1mDHYRwao58TI/G/LmH5Q6RRwysUwL6
	eLbrLBrNRXlr5gCUrULm+JPumw70NsUq9skfJA0FJ7BDyNQ6Szz9Xmg7vud0GLYrwIQTGHj1Ffyhk
	zyTY84E/S0Cq0bi6s9h/nNit5/NXax/3VKAW87vN4Vp7TzZX2gwiONYumwgjRQ3gSp6z3deJROXsG
	mZC4sz/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImW0-00000007OQq-08dJ;
	Mon, 19 Oct 2026 12:30:56 +0000
Received: from mail.tipi-net.de ([194.13.80.246])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImVv-00000007OPF-0JWS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 12:30:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2831A15A5;
	Mon, 19 Oct 2026 14:30:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1792413046; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5YPK5QrD2Biz8WIt271WspbuAzVZVpswCa9MB98GM1c=;
	b=JT7G+fFQL8UZU1tGRwhUPlEeeGyOPklh3lTZgt6QBqhkNKQ39YJWB2imB+euV3PKNylpXg
	8hmMFIebrSnkz0uxql1S/azwpbuV/4afb+FnCR4lSQBQEQc/WZij0O6tayPU0iz9Esa9G9
	gUaVR2o/Va51J13fFMSpzfnZsmBm+/geEvAXAngzKopeKTh+Uo1I0VRX9w6dmHM5O3Wjte
	nMdWFTFoEId761r9qoxQhjLP/g2dv1t7EfmwBz3MkqgBD8Zanl888bkv9qBjXhxRxhd4MF
	6RH30UV+a8QK98WkGlAVaOTxOZCGfvUWlnW+ulM3DM0NCwe4s0YyEGWfzcxSjQ==
MIME-Version: 1.0
Date: Mon, 19 Oct 2026 14:30:41 +0200
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
Subject: Re: [PATCH net-next v8 2/5] net: stmmac: drop split frames on AF_XDP
 zero-copy RX
In-Reply-To: <atYKPgSrad4jAsJM@lore-desk>
References: <20261018-stmmac-rx-mb-v8-0-5f58c0b25849@oss.qualcomm.com>
 <20261018-stmmac-rx-mb-v8-2-5f58c0b25849@oss.qualcomm.com>
 <8c9e47e535ecc8190fa1c93ad5b5e32a@tipi-net.de> <atYKPgSrad4jAsJM@lore-desk>
Message-ID: <f4009020a12df8e97fe87f03050839e2@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_053052_052396_5A9EBE80 
X-CRM114-Status: GOOD (  30.05  )
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

On 19.10.2026 14:17, Lorenzo Bianconi wrote:
>> Hi Lorenzo
>> 
>> On 18.10.2026 19:07, Lorenzo Bianconi wrote:
>> > stmmac_rx_zc() assumes a 1:1 mapping between a received frame and an
>> > XSK pool buffer and drops any frame that spans more than one RX
>> > descriptor:
>> >
>> >         /* XSK pool expects RX frame 1:1 mapped to XSK buffer */
>> >         if (likely(status & rx_not_ls)) {
>> >                 xsk_buff_free(buf->xdp);
>> >                 buf->xdp = NULL;
>> >                 dirty++;
>> >                 count++;
>> >                 goto read_again;
>> >         }
>> >
>> > The non-last descriptors are freed and dropped, but the frame is not
>> > marked as errored. When the poll reaches the last descriptor of the
>> > same frame, error is still 0, so the fragment is handled as a complete
>> > frame: it is passed to the XDP program, copied into an skb on XDP_PASS,
>> > or converted for XDP_TX. The tail starts in the middle of the original
>> > payload at a predictable offset and, parsed as a fresh frame (len == 0),
>> > stmmac_rx_buf1_len() reports the full dma_buf_sz length for it even
>> > though the DMA engine only wrote the tail remainder into that buffer, so
>> > the reads extend past the received bytes and can reach beyond the end of
>> > the XSK pool buffer. GMAC4 always enables jumbo frames (GMAC_CONFIG_JE
>> > in GMAC_CORE_INIT), so an on-link peer can trigger such a split even
>> > when the interface MTU is left at 1500.
>> >
>> > Set error when the 1:1 mapping check drops a descriptor, so the
>> > remaining descriptors of the frame - including the last one - are
>> > drained and released with xsk_buff_free() instead of being processed as
>> > a new frame. Account every freed buffer with dirty and count the
>> > dropped frame once in the poll budget / rx_pkt_n. The direct 1:1
>> > mapping drop also increments rx_dropped.
>> >
>> > Normalize the legacy normal and enhanced descriptor callbacks to report
>> > rx_not_ls together with discard_frame for non-last descriptors. This
>> > allows both stmmac_rx_zc() and stmmac_rx() to drain split frames on
>> > dwmac100 and dwmac1000 instead of reparsing the final fragment as a new
>> > packet.
>> >
>> > Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
>> > Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
>> 
>> This grew quite a bit since v6 (legacy desc changes, stmmac_rx() etc),
>> so my R-b should have been dropped. I had another look and two small
>> notes below.
> 
> Hi Nicolai,
> 
> ack, right.
> 
>> 
>> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>> > ---
>> 
>> > [...]
>> 
>> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> > @@ -5695,18 +5695,21 @@ static int stmmac_rx_zc(struct stmmac_priv
>> > *priv, int limit, u32 queue)
>> >  		if (priv->extend_desc)
>> >  			stmmac_rx_extended_status(priv, &priv->xstats,
>> >  						  rx_q->dma_erx + entry);
>> > -		if (unlikely(status == discard_frame)) {
>> > -			xsk_buff_free(buf->xdp);
>> > -			buf->xdp = NULL;
>> > -			dirty++;
>> > +
>> > +		if (unlikely(status & discard_frame)) {
>> >  			error = 1;
>> >  			if (!priv->hwts_rx_en)
>> >  				rx_errors++;
>> >  		}
>> 
>> There's no !error check here, so on the legacy descriptors a split
>> frame now counts once per descriptor in rx_errors. stmmac_rx() in 3/5
>> counts it once. Could you add the !error check here too?
> 
> ack, I agree we should align stmmac_rx() and stmmac_rx_zc(). In order 
> to avoid
> reposting the full series for this change, do you agree to address it 
> as a
> follow-up patch?

Would be ok for me if nothing else is flagged in this version. In the 
end it will
be Maxime's / the net dev maintainers decision :)

> 
> Regards,
> Lorenzo
> 
>> 
>> > [...]
>> 
>> > @@ -5883,7 +5887,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int
>> > limit, u32 queue)
>> >
>> >  		if (priv->extend_desc)
>> >  			stmmac_rx_extended_status(priv, &priv->xstats, rx_q->dma_erx +
>> > entry);
>> > -		if (unlikely(status == discard_frame)) {
>> > +
>> > +		if (unlikely(status & discard_frame)) {
>> 
>> AFAIU this also changes GMAC4: a frame with an error plus an IP header
>> error returns discard_frame | csum_none, which the old "==" let
>> through. Dropping it is right, but maybe worth a line in the commit
>> message?
>> 
>> > [...]
>> 
>> With the !error check added:
>> 
>> Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
>> 
>> Thanks,
>> Nicolai

