Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4DC606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 10:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ddp0tWSZ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S9V7JYW3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5EL4xcpEAaTLBP9HyYnzoNI2lvu1UvL/iwtcQQL4HvU=; b=ddp0tWSZvKEyRK4VkgfADFSgUP
	SPIYXvsYIwP7b8p+wt3Ekt02tTJeXbARFFRqHEXSH/nndzmv1MjeQfNKQu/8Wq36Czo5Npyto4JmF
	+O25Fa29lUlY8KwP9MWi/mgSqmvFCVNZAImGyBAA9w2+YpYr/FDdQQPMKhntCG+Haa1BD5te6YIWL
	Hq89KIZUeVhnqN+bKYgYvZ2CwZRT7Cx4lpxR5SXxGcqEnmt0Ng6JkLvHrMjKzrktJ3mucTBG/YxLN
	N1cUmazywCa0feV7g9ciJncgm62wDpXBOqdKLHfdch/4UE5vZsR8PnN9PJBVN6tzSQk55A6rZSw55
	y50yEJZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6nq-00000009ObM-3hhk;
	Tue, 20 Oct 2026 10:10:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6np-00000009ObC-3WdP;
	Tue, 20 Oct 2026 10:10:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B698406C9;
	Tue, 20 Oct 2026 10:10:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 564461F000C4;
	Tue, 20 Oct 2026 10:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792491041;
	bh=5EL4xcpEAaTLBP9HyYnzoNI2lvu1UvL/iwtcQQL4HvU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=S9V7JYW3J5QXsgoaZUgvWdJVADjrvM9bjyxqXiHF+e/lbyGC4czDQuIr82jsBH3D7
	 4sdNyrht6TnJCO9hIxYM1u90t6bMX+gBGrouuvW8p+JqLeaSqr9TMImfss9w+2BOq4
	 btXMWQsGxlamT1Y8XCc5Eff5RjGgiKvOvgiELLsdr142LU+0EI6hRivdBzzhaS8jzw
	 pjSwQOroBeuiYbm3bNI/UwHXJyxXTc8fJDHiEl0w32dElxckkfrbANK0hpZZCNn3LZ
	 EnJFRGUQjmLjcRepZUTrid3mWgsVcGNnovKLEwtqFjlLQ2J7HnwfRGrtHQYQuo5iDe
	 fu6ArfV1nLdsg==
Subject: Re: [PATCH net v5 1/5] net: ethernet: mtk_wed: skip ring reset in
 wdma_tx_ring_setup for WED v3
From: netdev-bot+sashiko@kernel.org
To: hujy652@gmail.com
Cc: nbd@nbd.name, lorenzo@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 sujuan.chen@mediatek.com, rex.lu@mediatek.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Date: Tue, 20 Oct 2026 10:10:39 +0000
Message-ID: <179249103985.3135.17834274932669029718@kernel.org>
In-Reply-To: <20261016-wedfix-v5-1-8b02e78fd34f@gmail.com>
References: <20261016-wedfix-v5-1-8b02e78fd34f@gmail.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] net: mtk_wed: memory leak of rx_ring and tx_ring on setup
  failure

--

> diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
> --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
> @@ -1938,7 +1938,7 @@ mtk_wed_wdma_tx_ring_setup(struct mtk_wed_device *dev, int idx, int size,
>  	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_CPU_IDX, 0);
>  	wdma_w32(dev, MTK_WDMA_RING_TX(idx) + MTK_WED_RING_OFS_DMA_IDX, 0);
>  
> -	if (reset)
> +	if (!mtk_wed_is_v3_or_greater(dev->hw) && reset)
>  		mtk_wed_ring_reset(wdma, MTK_WED_WDMA_RING_SIZE, true);
>  
>  	if (!idx)  {
>

[Severity: High]
The change here looks fine to me. Since mtk_wed_wdma_tx_ring_setup()
is one of the failure points involved, I'm raising the ring teardown
changes later in this series here. That is the patch that gates
mtk_wed_free_ring() on MTK_WED_RING_CONFIGURED.

First, mtk_wed_free_rx_rings() walks dev->rx_ring[] but tests
dev->tx_ring[i].flags before calling mtk_wed_free_ring() on
dev->rx_ring[i]. That looks like a copy/paste slip. If tx_ring[i] was
never configured, an allocated rx_ring[i] is never freed. Should that
be dev->rx_ring[i].flags?

Second, mtk_wed_tx_ring_setup() and mtk_wed_rx_ring_setup() call
mtk_wed_ring_alloc() first. They then call
mtk_wed_wdma_rx_ring_setup() or mtk_wed_wdma_tx_ring_setup(). If the
wdma step fails, they return -ENOMEM before MTK_WED_RING_CONFIGURED
is set on the ring that was already allocated.

Once the free paths only call mtk_wed_free_ring() for rings with
MTK_WED_RING_CONFIGURED set, __mtk_wed_detach() skips those partially
set up rings. Their coherent DMA descriptor memory is then leaked.
Before this series, mtk_wed_free_ring() keyed off ring->desc, which
handled this case.

I see two options:

 - Keep relying on the ring->desc check in mtk_wed_free_ring() for
   freeing, so the flag gating is not needed in the free paths.
 - Free the just-allocated ring on the error path in the setup
   functions.

The right choice depends on what the flag gating is meant to protect
against, so could you explain the intent there?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261016-wedfix-v5-0-8b02e78fd34f%40gmail.com

