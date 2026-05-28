Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03291CD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 12:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FwpPKrXQ70T1twLFwNf8lR/i2OUb1jZoS9ZO8mh+Lqw=; b=HfJkUjjOtZ7gNAZmoWo6g7zpIS
	qSupYEGx1oJ9QysoNle136rZzzxahXNMd+9LhEv/5uO3g+OnzMi29aHh4fhepN5D0VB+QUPNYSnBG
	0xou2HmBV5/l6fy8u1BNespKM/Kba5PzEsNIYznFFbu+clbFBK3372BrHAMcSGYPsJSF4AcefVo1G
	7AI3k59XLcZmft/FWENIJk7WqkrPwazVcmNw72meHtOCTgGM/jesONcntTKVBKrY5KJELMVGu6zXY
	Cu5mxukIobM3F4UmQjRoNcJYPoxPKBGdh8AQwEEEzYCEcU1Xd+OFD19+AXpe0/+pFuzN76TBK0idl
	a3x4SrIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSZRY-00000005hI9-07fz;
	Thu, 28 May 2026 12:02:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSZRU-00000005hHo-3gHV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 12:02:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779969746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FwpPKrXQ70T1twLFwNf8lR/i2OUb1jZoS9ZO8mh+Lqw=;
	b=YdXshZD7ghfe2iKHnaIZbAlar8hN8YQ6RKOtSfx3HCgZTLpJn0ECoylXb9INDhlTqIOiPN
	aT447vYGfns53PEStrlzisFVz77sWvJ5vmq4ZSaQw73zt6RDeKhh6FDeiY46qH4dfTjMXF
	1aMfZOd+M1P9FkpxEvO8gyJSbjgJuho=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-351-pl0e5186NvS9R3RHH2gBjg-1; Thu,
 28 May 2026 08:02:20 -0400
X-MC-Unique: pl0e5186NvS9R3RHH2gBjg-1
X-Mimecast-MFC-AGG-ID: pl0e5186NvS9R3RHH2gBjg_1779969738
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5A8B819560B1;
	Thu, 28 May 2026 12:02:17 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.44.32.235])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B990219560AB;
	Thu, 28 May 2026 12:02:09 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: dinghui1111@163.com
Cc: andrew@lunn.ch,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk,
	maxime.chevallier@bootlin.com,
	dinghui@lixiang.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	xiasanbo@lixiang.com,
	yangchen11@lixiang.com,
	liuxuanjun@lixiang.com
Subject: Re: [PATCH v2] net: stmmac: fix fatal bus error on resume by reinitializing RX buffers
Date: Thu, 28 May 2026 14:02:02 +0200
Message-ID: <20260528120203.245762-1-pabeni@redhat.com>
In-Reply-To: <20260526022620.501229-1-dinghui1111@163.com>
References: <20260526022620.501229-1-dinghui1111@163.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: sO_spsEPiwWoUqqvdYLR1IzWHe66EV8PnL1tb8Ez2kg_1779969738
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_050229_007880_140B1ECC 
X-CRM114-Status: GOOD (  24.70  )
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

From: AI Reviewer <ai@example.com>

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://netdev-ai.bots.linux.dev/sashiko/
---
net: stmmac: fix fatal bus error on resume by reinitializing RX buffers

This patch adds stmmac_reinit_rx_descriptors() and calls it from
stmmac_resume() before stmmac_clear_descriptors() to re-program the RX
descriptor buffer-address fields from buffers that survived across the
PM transition, avoiding any allocation in the resume path.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 3591755ea30b..0dc27d8c66a0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1642,6 +1642,79 @@ static void stmmac_clear_descriptors(struct stmmac_priv *priv,
>  		stmmac_clear_tx_descriptors(priv, dma_conf, queue);
>  }
>  
> +/**
> + * stmmac_reinit_rx_descriptors - re-program RX descriptors from existing
> + *				   buffers (allocation-free)

[ ... ]

> +static void stmmac_reinit_rx_descriptors(struct stmmac_priv *priv,
> +					 struct stmmac_dma_conf *dma_conf,
> +					 u32 queue)
> +{
> +	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
> +	int i;
> +
> +	for (i = 0; i < dma_conf->dma_rx_size; i++) {
> +		struct stmmac_rx_buffer *buf = &rx_q->buf_pool[i];
> +		struct dma_desc *p = stmmac_get_rx_desc(priv, rx_q, i);
> +
> +		if (rx_q->xsk_pool) {
> +			dma_addr_t dma_addr;
> +
> +			/* The XSK pool may not be fully populated (e.g.
> +			 * xdpsock TX-only); skip empty slots.
> +			 */
> +			if (!buf->xdp)
> +				continue;

[High]
Does the continue here regress to the same fatal bus error this patch
sets out to fix?

When the slot is skipped, its descriptor address fields keep whatever
HW writeback left behind. Then stmmac_clear_descriptors() runs right
after stmmac_reinit_rx_descriptors() in stmmac_resume() and unconditionally
re-arms OWN on every slot. For dwmac4 that is dwmac4_set_rx_owner():

	p->des3 |= cpu_to_le32(RDES3_OWN | RDES3_BUFFER1_VALID_ADDR |
			       RDES3_INT_ON_COMPLETION_EN);

and for enh_desc / ndesc the equivalent OR of RDES0_OWN / RDES1 fields.
None of these clear the address fields.

When stmmac_hw_setup() restarts the DMA, the controller sees an owned
descriptor with VALID_ADDR set and a stale address — the exact failure
mode the commit message describes. Could the skipped slots be cleared
(stmmac_clear_desc() or zeroing des0/des1/des2) instead of left intact,
or arranged so clear_descriptors() does not arm OWN on them?

> +
> +			dma_addr = xsk_buff_xdp_get_dma(buf->xdp);
> +			stmmac_set_desc_addr(priv, p, dma_addr);
> +			stmmac_set_desc_sec_addr(priv, p, 0, false);
> +		} else {
> +			/* Theoretically unreachable: napi_disable() in
> +			 * stmmac_suspend() ensures all initialized slots
> +			 * have a valid page before we get here.
> +			 * Defensive check only.
> +			 */
> +			if (!buf->page)
> +				continue;

[High]
Is the comment "Theoretically unreachable: napi_disable() in
stmmac_suspend() ensures all initialized slots have a valid page"
accurate?

stmmac_rx() assigns buf->page = NULL at multiple points when handing the
page on to the stack or to XDP, for example:

	buf->page = NULL;

in stmmac_rx() after the page has been consumed.

stmmac_rx_refill() allocates with GFP_ATOMIC | __GFP_NOWARN and breaks
on allocation failure without advancing dirty_rx, leaving the failing
slot (and any subsequent slots) with buf->page == NULL:

	if (!buf->page) {
		buf->page = page_pool_alloc_pages(rx_q->page_pool, gfp);
		if (!buf->page)
			break;
		...
	}

stmmac_disable_all_queues() only does synchronize_rcu() and
napi_disable() — it does not retry refills. Under the memory-pressure
scenario this patch is explicitly designed to make safe, a prior
GFP_ATOMIC failure can leave the ring with NULL-page slots at the
moment suspend happens.

If such a slot is then skipped here, the same OWN-with-stale-address
condition described above applies on resume. Should the page_pool path
also clear the descriptor for skipped slots, or allocate a replacement
buffer rather than leave a stale-address descriptor for
stmmac_clear_descriptors() to arm?

> +
> +			stmmac_set_desc_addr(priv, p, buf->addr);
> +			stmmac_set_desc_sec_addr(priv, p, buf->sec_addr,
> +						 priv->sph_active &&
> +						 buf->sec_page);
> +
> +			if (dma_conf->dma_buf_sz == BUF_SIZE_16KiB)
> +				stmmac_init_desc3(priv, p);
> +		}
> +	}

[ ... ]

> +}
> +
-- 
This is an AI-generated review.


