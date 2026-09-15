Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0972C88E73
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 08:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+QTrGAjnE0V//r4JrSXSGm3ZRQ6wgxOqWmOaBIZHAN4=; b=oB3zoZziFfX2oz7xMz7UquWeWp
	7GE6VUBxeDUcXcwCxDz2hZBNr0bFvsZMk2NdbID5yj/SaTJSVj4PvAlBi+2x02TebiZWhymQXyKQJ
	S0+k5fi10vhamks6OZ4R4B3Q2FRmzJIBBwgbBOujzUIXzp1bBR5xlTXxt5lZIKkfBfFigP/ZZ0TL5
	NaRRAFcrVVnG13b3bKYZlIEtRTUEMpNmzZdP6jc/1HpAQqfk3agUJISPy4Y2SF80hUWy9w61CsiXx
	XjD9aoHf0KU6pNvpqhe673yK0fwdofQk5ZpSqMs3pE+nqxbtsicbWVQawfC3/HdOVfZcqby08zy2+
	wPgyBBMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Oo5-00000005gYv-1A5l;
	Tue, 15 Sep 2026 08:46:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Oo1-00000005gWs-2X67
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 08:46:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789461980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+QTrGAjnE0V//r4JrSXSGm3ZRQ6wgxOqWmOaBIZHAN4=;
	b=MhcwO5xKCuc+dKf4nApRYgl/W3QM7SYlwqyQ0BkXMhYXOwiWkcbVlIFA/XQxiJCx8mUED+
	ZBYcqGvRaxv9nf3YvkwhoHnf11hrwcwknT1HDOwd+iAPGgS1C1f4jE0iSqfkGajsmVR0Oy
	e4914L7qSQR1q55jRypmOR1isga3qW0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-691-j0e9A_w5MW2vkqYrdSRhQg-1; Tue,
 15 Sep 2026 04:46:17 -0400
X-MC-Unique: j0e9A_w5MW2vkqYrdSRhQg-1
X-Mimecast-MFC-AGG-ID: j0e9A_w5MW2vkqYrdSRhQg_1789461974
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A4BA7180130E;
	Tue, 15 Sep 2026 08:46:12 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.44.48.83])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7587E195604F;
	Tue, 15 Sep 2026 08:46:03 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: maxime.chevallier@bootlin.com
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux@armlinux.org.uk,
	hkallweit1@gmail.com,
	alexis.lothore@bootlin.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	kernel@esmil.dk,
	minda.chen@starfivetech.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	jan.petrous@oss.nxp.com,
	ovidiu.panait.rb@renesas.com,
	Jose.Abreu@synopsys.com,
	nb@tipi-net.de,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	PKneuper@dspace.de,
	david.laight.linux@gmail.com
Subject: Re: [PATCH net v3 5/6] net: stmmac: size the RX buffers from the frame length, not the MTU
Date: Tue, 15 Sep 2026 10:45:58 +0200
Message-ID: <20260915084558.75283-1-pabeni@redhat.com>
In-Reply-To: <20260911212028.1497613-6-maxime.chevallier@bootlin.com>
References: <20260911212028.1497613-6-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: BYmBpyQ58Sk2aGJZNMUv2A3LSa3jD-ZlCrnv6iVC5Hs_1789461974
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_014622_565284_7BB5982C 
X-CRM114-Status: GOOD (  30.25  )
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
Full review at: https://netdev-ai.bots.linux.dev/sashiko/
---
net: stmmac: size the RX buffers from the frame length, not the MTU

The patch stops feeding the bare MTU into the RX buffer size selection and
instead computes a frame length that includes the L2 header, two VLAN tags,
the FCS and NET_IP_ALIGN.  stmmac_set_bfsize() is renamed to take a length
and its boundary comparisons are switched from '>=' to '>'.

A few questions below.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 62c3441911e71..29b970574a380 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1536,17 +1536,17 @@ static unsigned int stmmac_rx_offset(struct stmmac_priv *priv)
>  	return NET_SKB_PAD + NET_IP_ALIGN;
>  }
>  
> -static int stmmac_set_bfsize(int mtu)
> +static int stmmac_set_bfsize(int len)
>  {
>  	int ret;
>  
> -	if (mtu >= BUF_SIZE_8KiB)
> +	if (len > BUF_SIZE_8KiB)
>  		ret = BUF_SIZE_16KiB;

[Severity: High]
This isn't a bug introduced by this patch, but the 16 KiB selection here is
reachable in configurations whose descriptors cannot express a buffer that
large, and this patch moves the threshold about 28 bytes of MTU lower.

In chain mode mac->mode points at chain_mode_ops, which does not implement
set_16kib_bfsize, so stmmac_do_callback() returns -EINVAL, bfsize is forced
to 0 and stmmac_set_bfsize(len) runs unconditionally.  For enhanced
descriptors the programmed buffer 1 is clamped:

drivers/net/ethernet/stmicro/stmmac/enh_desc.c:enh_desc_init_rx_desc() {
	bfsize1 = min(bfsize, BUF_SIZE_8KiB);
	p->des1 |= cpu_to_le32(bfsize1 & ERDES1_BUFFER1_SIZE_MASK);
}

and for normal descriptors:

drivers/net/ethernet/stmicro/stmmac/norm_desc.c:ndesc_init_rx_desc() {
	bfsize1 = min(bfsize, BUF_SIZE_2KiB - 1);
	p->des1 |= cpu_to_le32(bfsize1 & RDES1_BUFFER1_SIZE_MASK);
}

while the RX path still reports the software value for every non-last
descriptor:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_rx_buf1_len() {
	/* First descriptor, not last descriptor and not split header */
	if (status & rx_not_ls)
		return priv->dma_conf.dma_buf_sz;
}

That value then drives dma_sync_single_range_for_cpu() and
skb_add_rx_frag().  Can this hand the stack more bytes than the engine
wrote, padding the frame with recycled page pool contents?  Chain mode is
reachable through the chain_mode module parameter and is forced for
dwmac-sun8i, which uses normal descriptors.

> -	else if (mtu >= BUF_SIZE_4KiB)
> +	else if (len > BUF_SIZE_4KiB)
>  		ret = BUF_SIZE_8KiB;
> -	else if (mtu >= BUF_SIZE_2KiB)
> +	else if (len > BUF_SIZE_2KiB)
>  		ret = BUF_SIZE_4KiB;
> -	else if (mtu > DEFAULT_BUFSIZE)
> +	else if (len > DEFAULT_BUFSIZE)
>  		ret = BUF_SIZE_2KiB;

[Severity: High]
This is a pre-existing issue and not something this patch introduces, but
the new thresholds widen the MTU range in which it applies (the step up to
BUF_SIZE_2KiB/BUF_SIZE_4KiB now happens roughly 28 bytes of MTU earlier).

For normal descriptors in ring mode, a second data buffer is advertised
whose bus address is never programmed:

drivers/net/ethernet/stmicro/stmmac/descs_com.h:ndesc_rx_set_on_ring() {
	if (bfsize >= BUF_SIZE_2KiB) {
		int bfsize2;

		bfsize2 = min(bfsize - BUF_SIZE_2KiB + 1, BUF_SIZE_2KiB - 1);
		p->des1 |= cpu_to_le32(FIELD_PREP(RDES1_BUFFER2_SIZE_MASK,
						  bfsize2));
	}
}

RDES3 is only ever written through ring_mode.c init_desc3()/refill_desc3(),
and the driver only calls those when dma_buf_sz equals BUF_SIZE_16KiB:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_init_rx_buffers() {
	if (dma_conf->dma_buf_sz == BUF_SIZE_16KiB)
		stmmac_init_desc3(priv, p);
}

Devices on ndesc_ops are capped at max_mtu = SKB_MAX_HEAD(NET_SKB_PAD +
NET_IP_ALIGN), so they can only pick 2048 or 4096 and RDES3 stays 0 from
dma_alloc_coherent().  Since the second-address-chained bit is not set in
ring mode, does the RX DMA spill the part of the frame beyond the 2047-byte
buffer 1 to bus address 0?  This is driven by an inbound frame on cores
using normal descriptors (MAC100, or GMAC with plat->enh_desc == 0) with an
MTU above ~2 KiB.

>  	else
>  		ret = DEFAULT_BUFSIZE;
>  
> @@ -4063,7 +4063,7 @@ static struct stmmac_dma_conf *
>  stmmac_setup_dma_desc(struct stmmac_priv *priv, unsigned int mtu)
>  {
>  	struct stmmac_dma_conf *dma_conf;
> -	int bfsize, ret;
> +	int bfsize, len, ret;
>  	u8 chan;
>  
>  	dma_conf = kzalloc_obj(*dma_conf);
> @@ -4073,13 +4073,15 @@ stmmac_setup_dma_desc(struct stmmac_priv *priv, unsigned int mtu)
>  		return ERR_PTR(-ENOMEM);
>  	}
>  
> -	/* Returns 0 or BUF_SIZE_16KiB if mtu > 8KiB and dwmac4 or ring mode */
> -	bfsize = stmmac_set_16kib_bfsize(priv, mtu);
> +	len = mtu + ETH_HLEN + 2 * VLAN_HLEN + ETH_FCS_LEN + NET_IP_ALIGN;

[Severity: Low]
Should NET_IP_ALIGN be part of this sum?  It is head room that lives
outside the window described by dma_buf_sz, and it is already reserved
separately:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:__alloc_dma_rx_desc_resources() {
	dma_buf_sz_pad = stmmac_rx_offset(priv) + dma_conf->dma_buf_sz +
			 SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
	...
	pp_params.offset = stmmac_rx_offset(priv);
	pp_params.max_len = dma_conf->dma_buf_sz;
}

with stmmac_rx_offset() returning NET_SKB_PAD + NET_IP_ALIGN, and
stmmac_init_rx_buffers() programming the descriptor at page dma address
plus buf->page_offset == stmmac_rx_offset(priv).

Counting it again inside len makes the selected buffer class, and therefore
the page pool order, depend on the architecture for a 2-byte wide MTU
window at each boundary.  For example MTU 4069/4070 with NET_IP_ALIGN == 2
gives len 4097/4098 and selects BUF_SIZE_8KiB, whereas the same MTU on
x86 (NET_IP_ALIGN == 0) selects BUF_SIZE_4KiB.

The commit message also lists "the NET_IP_ALIGN" alongside ETH_HLEN, the
VLAN tags and the FCS as if it were part of the frame.  Would it be more
accurate to describe it as head room, or drop the term?

> +
> +	/* Returns 0 or BUF_SIZE_16KiB if len > 8KiB and dwmac4 or ring mode */
> +	bfsize = stmmac_set_16kib_bfsize(priv, len);
>  	if (bfsize < 0)
>  		bfsize = 0;
>  
>  	if (bfsize < BUF_SIZE_16KiB)
> -		bfsize = stmmac_set_bfsize(mtu);
> +		bfsize = stmmac_set_bfsize(len);

[Severity: Medium]
The argument handed to the set_16kib_bfsize callback changes unit here from
MTU to frame length, but neither the ops prototype nor the two
implementations were updated.

hwif.h still declares:

	int (*set_16kib_bfsize)(int mtu);

dwmac4_descs.c:set_16kib_bfsize() keeps the inclusive test:

	if (unlikely(mtu >= BUF_SIZE_8KiB))
		ret = BUF_SIZE_16KiB;

while ring_mode.c:set_16kib_bfsize() uses the other operator:

	if (unlikely(mtu > BUF_SIZE_8KiB))
		ret = BUF_SIZE_16KiB;

Since dwmac4/dwmac5 use dwmac4_ring_mode_ops, does the new comment "Returns
0 or BUF_SIZE_16KiB if len > 8KiB" match what actually happens on those
cores?  A len of exactly BUF_SIZE_8KiB (MTU 8160 with NET_IP_ALIGN == 2)
fits an 8188-byte buffer and stmmac_set_bfsize() would return
BUF_SIZE_8KiB, but the unchanged '>=' returns BUF_SIZE_16KiB and the
'if (bfsize < BUF_SIZE_16KiB)' guard then skips the corrected helper, so
dma_buf_sz becomes 16368 instead of 8188.  That roughly doubles the pages
backing each RX buffer (order 2 to order 3) across the default
dma_rx_size of 512.

The commit message says the change lets us "use more consistent comparison
operators in stmmac_set_bfsize" - should the two set_16kib_bfsize
implementations and the 'mtu' parameter name be converted at the same time?
-- 
This is an AI-generated review.


