Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50647C88E66
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 13:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wY5Nz9XEGslGUcH04yT6JyKjGbyw8os8u8f4LLuB7CI=; b=opU7eqIpcsaB7MlGDW5wluJ/HY
	6rehZTZRtACUbL7n5hR3EeZw8ZvBr3596ma2UlrxMaWyTSh55iO7CnU/hioG8j0lh9LhbHsxTI3da
	knD479Ze5O0ENf3UT1aS1Xu1e39vUtRuwpOeGyEKLd3iXzRU/ziOCQRCIwPkDbvQjoeSyIsH1ZbBC
	um1P5kOmSueTxcvwlOGBtjQGMzVrdUYylSPF9uV3LJJA+rYlLQbTCjqSsrEbi8SjCIb/xVlm6pOjr
	8V6T9m7H+PbKX8Xqk3vfp6i2tP7OtXCdCl2dZIQ30Zn+dbVYJ5IY1OjnxmaML3lU9EErGnvgU6b+N
	weJiS7sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5kM0-00000001gvb-2ak7;
	Sun, 13 Sep 2026 13:34:44 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5kLw-00000001gut-2imE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 13:34:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=wY5Nz9XEGslGUcH04yT6JyKjGbyw8os8u8f4LLuB7CI=;
	b=FOJT8Km0f+O34m9o29Qk4tpgLLazC9rp5IUvWt3JvjMrjK+o6cns9NABWmO4lD
	Jh0EonvXSrxukEyv92lEvrnX7sacBJf0U37hHqGHfa7QUcbr8CTE29becR/a8wch
	2FWBpZN07bkVnkOPZAzAme3QyU44M+4bPxdokHLg/fxDQ=
Received: from 4CV529F122.company.local (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wBH+xUzpqZq8u2xAQ--.25040S2;
	Sun, 13 Sep 2026 21:33:53 +0800 (CST)
From: Ding Hui <dinghui1111@163.com>
To: netdev-bot+sashiko@kernel.org
Cc: alexandre.torgue@foss.st.com,
	andrew+netdev@lunn.ch,
	andrew@lunn.ch,
	davem@davemloft.net,
	dinghui1111@163.com,
	dinghui@lixiang.com,
	edumazet@google.com,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	liuxuanjun@lixiang.com,
	maxime.chevallier@bootlin.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	xiasanbo@lixiang.com,
	yangchen11@lixiang.com
Subject: Re:Re: [PATCH net-next v2] net: stmmac: fix error path cleanup in DMA descriptor ring allocation
Date: Sun, 13 Sep 2026 21:33:39 +0800
Message-Id: <20260913133339.1607659-1-dinghui1111@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <178891488143.219967.12581003227734181738@kernel.org>
References: <178891488143.219967.12581003227734181738@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBH+xUzpqZq8u2xAQ--.25040S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTRfR6wUUUUU
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC8wH9KmqmpkHtYgAA3B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_063441_194368_93ACBD5E 
X-CRM114-Status: GOOD (  33.71  )
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

At 2026-09-09 08:48:01, netdev-bot+sashiko@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 2 potential
>issue(s) to consider:
>
>Critical: 0 · High: 1 (1) · Medium: 0 (1) · Low: 1
>
>- [High] The newly added NULL guards encode the contract 'NULL == not
>  allocated', but the free helpers never establish it:…
>- [Low] Missing `Fixes:` tag (and no stable routing) on a patch that
>  fixes a user-visible NULL-pointer dereference.
>
>Pre-existing issues:
>- [High] This problem wasn't introduced by this patch, but the patch
>  makes it deterministic: `stmmac_enable_rx_queue()`…
>- [Medium] This problem wasn't introduced by this patch, but the sibling
>  error path in `alloc_dma_desc_resources()` (stmmac_main.c:2445-2457)…
>
>--
>
>net: stmmac: fix error path cleanup in DMA descriptor ring allocation
>
>This makes __alloc_dma_rx_desc_resources() and
>__alloc_dma_tx_desc_resources() unwind their own partial allocations on
>failure, and adds NULL checks in the buffer free helpers so they can be
>called on partially-initialized queues.
>
>A few questions below about the new error paths and the surrounding
>callers.
>
>[Severity: Low]
>The commit message describes three concrete NULL dereferences that are
>reachable today, when a kzalloc_objs() inside
>__alloc_dma_rx_desc_resources() / __alloc_dma_tx_desc_resources() fails
>and the err_dma: labels in alloc_dma_rx_desc_resources() /
>alloc_dma_tx_desc_resources() run the bulk free helpers over every
>queue.
>
>Should this carry a Fixes: tag so it can be routed to the stable trees?
>Without one it is hard for a backporter to tell how far back the
>dereference exists.
>
This patch targets net-next rather than net, as the issue only triggers
under memory allocation failure during initialization when there is memory
allocation pressure. A Fixes: tag is intentionally omitted to avoid
triggering unwanted stable backports.

>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> index 07a6fab6460ed..8d03eb7904ef1 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>
>[ ... ]
>
>> @@ -1761,6 +1761,10 @@ static void dma_free_rx_skbufs(struct stmmac_priv *priv,
>>  	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
>>  	int i;
>>  
>> +	/* buf_pool may not be allocated if alloc failed early */
>> +	if (!rx_q->buf_pool)
>> +		return;
>> +
>>  	for (i = 0; i < dma_conf->dma_rx_size; i++)
>>  		stmmac_free_rx_buffer(priv, rx_q, i);
>>  }
>
>[Severity: High]
>These new guards assume "NULL means not allocated", but do the free
>helpers ever establish that? __free_dma_rx_desc_resources() releases
>everything without clearing the fields:
>
>	dma_free_coherent(priv->device, size, addr, rx_q->dma_rx_phy);
>
>	if (xdp_rxq_info_is_reg(&rx_q->xdp_rxq))
>		xdp_rxq_info_unreg(&rx_q->xdp_rxq);
>
>	kfree(rx_q->buf_pool);
>	if (rx_q->page_pool)
>		page_pool_destroy(rx_q->page_pool);
>
>__free_dma_tx_desc_resources() does the same for tx_skbuff_dma,
>tx_skbuff and the coherent TX ring.
>
>That matters because these helpers also run on the long-lived
>priv->dma_conf, and it is re-used for the next allocation:
>
>  stmmac_xdp_set_prog()
>    stmmac_xdp_release()
>      free_dma_desc_resources(priv, &priv->dma_conf)   /* pointers stay set */
>    stmmac_xdp_open()
>      alloc_dma_desc_resources(priv, &priv->dma_conf)
>
>Unlike stmmac_open(), which works on a freshly kzalloc'ed dma_conf,
>nothing zeroes priv->dma_conf here. So if any per-queue allocation fails
>mid-way (for example page_pool_create() for queue 1, which is the one
>early return this patch leaves as-is), alloc_dma_rx_desc_resources()
>jumps to err_dma: and free_dma_rx_desc_resources() loops over all queues
>0..rx_queues_to_use-1:
>
>	for (queue = 0; queue < rx_count; queue++)
>		__free_dma_rx_desc_resources(priv, dma_conf, queue);
>
>The queues that were not touched in this pass still hold the pointers
>freed by the preceding release. Since those pointers are freed but not
>NULL, does the new guard fire at all for them?
>
>Following that path through, stmmac_free_rx_buffer() would read
>buf->page out of the freed buf_pool object and pass it to
>page_pool_put_full_page() on an already-destroyed pool, then
>dma_free_coherent() runs a second time on the released coherent memory,
>kfree(rx_q->buf_pool) becomes a slab double free, and
>page_pool_destroy(rx_q->page_pool) is called on a freed pool. Can that
>corrupt the slab and DMA state?
>
>The TX side looks symmetric via the new "if (!tx_q->tx_skbuff_dma)
>return;" guard and the tx_skbuff/xdpf tests added in
>stmmac_free_tx_buffer().
>
>Would it make sense for __free_dma_rx_desc_resources() and
>__free_dma_tx_desc_resources() to NULL the fields they free, so the new
>guards actually hold?
>
It's right. Currently __free_dma_rx_desc_resources() and
__free_dma_tx_desc_resources() free the resources without NULLing the
pointers. Since priv->dma_conf is reused across xdp open/release cycles,
stale pointers could defeat the new NULL guards. I'll add NULL
assignments after each free in __free_dma_rx_desc_resources() and
__free_dma_tx_desc_resources() in v3.

>[ ... ]
>
>> @@ -2296,10 +2312,27 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
>>  	ret = xdp_rxq_info_reg(&rx_q->xdp_rxq, priv->dev, queue, napi_id);
>>  	if (ret) {
>>  		netdev_err(priv->dev, "Failed to register xdp rxq info\n");
>> -		return -EINVAL;
>> +		goto err_free_dma;
>>  	}
>>  
>>  	return 0;
>> +
>> +err_free_dma:
>> +	if (priv->extend_desc)
>> +		dma_free_coherent(priv->device, size, rx_q->dma_erx,
>> +				  rx_q->dma_rx_phy);
>> +	else
>> +		dma_free_coherent(priv->device, size, rx_q->dma_rx,
>> +				  rx_q->dma_rx_phy);
>> +	rx_q->dma_erx = NULL;
>> +	rx_q->dma_rx = NULL;
>> +err_free_buf_pool:
>> +	kfree(rx_q->buf_pool);
>> +	rx_q->buf_pool = NULL;
>> +err_destroy_pool:
>> +	page_pool_destroy(rx_q->page_pool);
>> +	rx_q->page_pool = NULL;
>> +	return ret;
>>  }
>
>[Severity: High]
>This isn't a bug introduced by this patch, but does the patch turn it
>into a deterministic NULL dereference?
>
>stmmac_enable_rx_queue() and stmmac_enable_tx_queue() return void and
>simply drop the allocation error:
>
>	ret = __alloc_dma_rx_desc_resources(priv, &priv->dma_conf, queue);
>	if (ret) {
>		netdev_err(priv->dev, "Failed to alloc RX desc.\n");
>		return;
>	}
>
>After the new labels above, the failed queue is left with
>rx_q->buf_pool == NULL, rx_q->page_pool == NULL and
>rx_q->dma_rx/dma_erx == NULL (tx_skbuff and tx_skbuff_dma on the TX
>side).
>
>The caller in stmmac_xdp.c continues regardless:
>
>	stmmac_enable_rx_queue(priv, queue);
>	stmmac_enable_tx_queue(priv, queue);
>	napi_enable(&ch->rxtx_napi);
>
>	err = stmmac_xsk_wakeup(priv->dev, queue, XDP_WAKEUP_RX);
>
>and stmmac_xsk_wakeup() reaches __napi_schedule(&ch->rxtx_napi). Its
>only precondition is:
>
>	if (!rx_q->xsk_pool && !tx_q->xsk_pool)
>		return -EINVAL;
>
>which does not help here, because dma_free_tx_skbufs() only clears
>tx_q->xsk_pool when xsk_frames_done is non-zero.
>
>Does the scheduled poll then dereference rx_q->buf_pool[entry] and
>tx_q->tx_skbuff_dma[entry] in softirq context on a queue whose arrays
>were just set to NULL? Should the enable helpers propagate the error and
>skip the napi_enable()/wakeup instead?
>
>[ ... ]
>
>> @@ -2369,6 +2402,14 @@ static int __alloc_dma_tx_desc_resources(struct stmmac_priv *priv,
>>  		tx_q->dma_tx = addr;
>>  
>>  	return 0;
>> +
>> +err_free_skbuff:
>> +	kfree(tx_q->tx_skbuff);
>> +	tx_q->tx_skbuff = NULL;
>> +err_free_skbuff_dma:
>> +	kfree(tx_q->tx_skbuff_dma);
>> +	tx_q->tx_skbuff_dma = NULL;
>> +	return -ENOMEM;
>>  }
>>  
>>  static int alloc_dma_tx_desc_resources(struct stmmac_priv *priv,
>
>[Severity: Medium]
>This is a pre-existing issue, but the sibling function in the same
>family still does not follow the rule the commit message states, namely
>"making each allocation function responsible for undoing its own
>allocations on error".
>
>alloc_dma_desc_resources() allocates RX first and returns the TX error
>directly:
>
>	int ret = alloc_dma_rx_desc_resources(priv, dma_conf);
>
>	if (ret)
>		return ret;
>
>	ret = alloc_dma_tx_desc_resources(priv, dma_conf);
>
>	return ret;
>
>On TX failure only free_dma_tx_desc_resources() has run (inside
>alloc_dma_tx_desc_resources()), so every rx_q->page_pool,
>rx_q->buf_pool and coherent RX ring is still allocated. The caller then
>takes the alloc_error: path:
>
>init_error:
>	free_dma_desc_resources(priv, dma_conf);
>alloc_error:
>	kfree(dma_conf);
>	return ERR_PTR(ret);
>
>which only kfree()s dma_conf and drops the only pointers to those RX
>resources; free_dma_desc_resources() is reached only via init_error:.
>
>Does this leak the RX page pools, the buf_pool arrays and the
>dma_alloc_coherent RX rings when a TX allocation fails during ifup or an
>MTU change? stmmac_xdp_open() has the same shape, except the resources
>stay reachable through priv->dma_conf, which feeds into the stale
>pointer question above.
>
>Would adding a free_dma_rx_desc_resources() call to
>alloc_dma_desc_resources() on the TX failure path fit the pattern this
>patch establishes?

The above two suggestions are valid. The error handling in
stmmac_enable_rx_queue()/stmmac_enable_tx_queue() (returning void and
dropping allocation errors) and the RX resource leak in
alloc_dma_desc_resources() on TX failure are real pre-existing issues.
However, they are beyond the scope of this patch, which focuses on
making the per-queue allocation functions clean up their own partial
allocations. I plan to address them in follow-up patches.

Thanks,
Ding Hui


