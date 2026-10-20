Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C47F606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 10:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2BZm8qbB;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Drp4JXrl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bh9xFMrMUcNCltBKfyRaDPZe6ka6eyNBp32oRnvdPjk=; b=2BZm8qbBdc0z3dNHAY2uysjyfY
	tfFblPhcHOHNaCJ7hSkRpvXrz+T2x+Nr9ZgO4TS1rMnHiV9ZX6pLEkHQuxea7Pja5eqbWDgyE6Sww
	mA0QqbYMwj9aW7Pzep2ntJXRqXS49RFJH4nTTVfi0oN5lCLNaglXYx4yvl0lB43yrr8fT+fiAktxV
	nKC+IaVFciqVQIyFmzLiJnwphOfg+SJYuNKIAkTVjWA1SP9Ua3xziYL7Kuw8kAFmGyRRv3ddWZB0D
	pDM4YwVegGkXYKmFNIwJlMlKg9OVUmFHTexgztJ66iZuPaJjl+w/lqjb7hF5/PCMXdlq9j+uKdOGo
	LPNZ83Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6nx-00000009Odi-0Qtb;
	Tue, 20 Oct 2026 10:10:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6nr-00000009ObL-0rUc;
	Tue, 20 Oct 2026 10:10:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AF6E543406;
	Tue, 20 Oct 2026 10:10:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1DFE1F000C6;
	Tue, 20 Oct 2026 10:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792491042;
	bh=Bh9xFMrMUcNCltBKfyRaDPZe6ka6eyNBp32oRnvdPjk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Drp4JXrlplx+lS7qurSjPflAV3uulAv2Ndb12n1kdwtv/dR/0GXGs+foaoVDzbcSf
	 11YA3u9W5DHbjuLCLQJq4KcpW3KVgYwii7+v09FLtCCQK1bjqNosjOrkZHFtAUoL5n
	 DLrHgoGSDtf9k94/Ppf3GJN82r8Lv3k4qIajSWGG8ov6/lFooCakjjKrnjNapaY8bq
	 qKaY6wur20axcXFArlSgKY9wNb5TpapfUBeKSyYk1rYqyH69SCTENpprumfzY6QFOx
	 LHNbhY3SOzCKUdMQZD4rZ5Mp16xZePSccuZwozEy8QPCLWQohINyJEJTBDFIVLwUZQ
	 ageQ/3u8cCIlw==
Subject: Re: [PATCH net v5 2/5] net: ethernet: mtk_wed: fix reset condition
 for rx wdma
From: netdev-bot+sashiko@kernel.org
To: hujy652@gmail.com
Cc: nbd@nbd.name, lorenzo@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 sujuan.chen@mediatek.com, rex.lu@mediatek.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Date: Tue, 20 Oct 2026 10:10:41 +0000
Message-ID: <179249104136.3135.17477394405108454102@kernel.org>
In-Reply-To: <20261016-wedfix-v5-2-8b02e78fd34f@gmail.com>
References: <20261016-wedfix-v5-2-8b02e78fd34f@gmail.com>
X-sashiko-severity: Low
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message for "net: ethernet: mtk_wed: fix reset
  condition for rx wdma" only says the condition in mtk_wdma_rx_reset()…

--

net: ethernet: mtk_wed: fix reset condition for rx wdma

This commit inverts the check in the rx_wdma loop of mtk_wdma_rx_reset().
Allocated WDMA RX rings now have their CPU index cleared. Unallocated
rings are skipped.

> In mtk_wdma_rx_reset, only the wdma rings that weren't allocated are
> reset which is wrong.
>
> Fix this by inverting the reset condition so allocated rings will be
> reset.

[Severity: Low]
This isn't a bug, and the code change looks right. Could the commit
message say what goes wrong for users, and which paths are affected?

mtk_wed_start() sets up every rx_wdma ring that doesn't have a
descriptor yet:

drivers/net/ethernet/mediatek/mtk_wed.c:mtk_wed_start() {
    ...
	for (i = 0; i < ARRAY_SIZE(dev->rx_wdma); i++)
		if (!dev->rx_wdma[i].desc)
			mtk_wed_wdma_rx_ring_setup(dev, i, 16, false);
    ...
}

So once the device has started, all rx_wdma rings normally have a
descriptor. The exception is when buffer or ring allocation fails.

With the old condition, the loop in mtk_wdma_rx_reset() would then skip
every ring. MTK_WDMA_RING_RX(i) + MTK_WED_RING_OFS_CPU_IDX would never be
cleared for any live ring.

mtk_wdma_rx_reset() has two callers:

mtk_wed_reset_dma()
    /* 2. reset WDMA rx DMA */
    busy = !!mtk_wdma_rx_reset(dev);

__mtk_wed_detach()
    mtk_wdma_rx_reset(dev);

Could the message add a sentence on the symptom? For example: stale WDMA
RX CPU indices after a WED/SER reset, or after detach and re-attach.

That would help reviewers and stable maintainers judge how urgent this
Fixes: patch is.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261016-wedfix-v5-0-8b02e78fd34f%40gmail.com

