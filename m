Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D6AC98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rf3NcYvAmItVxbqtkxxzSpUPurh9H42FsWoY744N9zk=; b=L7AvRFftMlZAywowTRKWEsB1VM
	KUSh0j1GdBsunIkEGcVXX4fSw4kfTmTnBldyT63FVZ/ziHOJ9BVT0jSwL3228sqex4b4Th6NFYaSl
	1MfRD4K2IiRBUpGY/zrL+0MnIU21MOd39QpomQYggyH22U8JnZAuxszsDaAq9wgOPdx2oAt2d6gX6
	Kz037gkkG+pRckmFQm+HpYri4NDDJe3IuY2HYtqKDdcJ/Q1J2rdwy7oPi2DX42NZNVZzxe3vmemuF
	ZVW6zWY+hfCwSNAkUUzPopnBfhrK8lsir5ad0xoP4lkbOR291Zb0r8TBGBTChhlNvtV2vJsk2Q3GV
	CjSyaHKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90pv-00000005agd-2Zp0;
	Tue, 22 Sep 2026 13:47:07 +0000
Received: from mail-pz2-x0c.google.com ([2607:f8b0:4864:3b::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90pt-00000005afU-0Gzm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:47:06 +0000
Received: by mail-pz2-x0c.google.com with SMTP id 41be03b00d2f7-cc5256c2a4bso2844779a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790084824; x=1790689624; darn=lists.infradead.org;
        h=content-transfer-encoding:lines:status:content-disposition
         :content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rf3NcYvAmItVxbqtkxxzSpUPurh9H42FsWoY744N9zk=;
        b=i/5wrm6Fp5iCtU1TxIub0W1UYls+TOUusLI0axGG5Fa1/bUIEfOn3GAZRRfMCTExqB
         Z0FlptCWcmob0YpAaKMfgpyyfVC50kqrB3IAgcprcXQAB2CU7SXeMJMNKuDbWae/2tNf
         Sf76tP61OTrrkgXoBh56RE6kWj+PCcrQ6MM4jWQ880oQpTiWNuEEazd++k0qIPseoKim
         PJLtSFCojRyllsrHhRx63OEndh9J/GCNK/dRJh6NWfDU/hInSWDCRYnaZeeXM8Lt5aP5
         8aAAx3ThCkqiz7mozpA9XYSWjqCho4K0eRt5uSmbTykmWoBLLIEW4Jx6qYlsK3jWSjPw
         6OuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790084824; x=1790689624;
        h=content-transfer-encoding:lines:status:content-disposition
         :content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rf3NcYvAmItVxbqtkxxzSpUPurh9H42FsWoY744N9zk=;
        b=CVPdIdo5AHLikKST9IMIZBJesvI/4UZ6xiviS6okKgcEKjl4fzocyGL91zFRJfogHF
         Xp0JM4dKWcWvLSHQrf9WrA6JkfNuyjRlhv/RfFScbbHs5OtMCKQXLL2BLFEUJoaASiMb
         bwqzupwa5YkQZjX8krQV6Q83kxZxpQG13MghnidmyO8mq4b/tFjrgK0AMwrze0ZvwZdP
         it95dRA9oPygNdk1RdPoAGvk5Qipl+FQauBChhp2VgoES3cFkZKcdJzPR4QNP69qDG8d
         dcWpeae8DKALhT8FjV3w6/rI06+sIGqINO/Kw0l5fWUvAFBjh+kB/e9Jw28cg1vv2gIF
         ZgoQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4kj7kVAs+O3ds45glNcDfl7u+0GtOmXmWr4xlzuomjH4FYoxzasTPIRac7AeU5rzzurhmtvSgCU2DQQc32hvE@lists.infradead.org
X-Gm-Message-State: AFuF++lCTEC22HwQAfF/kXa6STJ2Vw7YZCbtQe219XIxlNG7qmcusaaI
	BzoboGq8mBklcN63J0aEkL1dIUjxNcv7a3MkXzSK65/Cihxfo7KTnykl
X-Gm-Gg: AYBFou3mVFoJGAKEw3aijC5uPigel5h9G5pMmQ3b4EL4e5doLJJBjGfAGCCtg9O7BFV
	k8c22tatF2askYy9wMgpngua96jQAK039Us6J4uOJzwpYfidzRGlqDNGlbH/fMCJptbiAy7ltXH
	lEO2Z0W2AOQ2hiITp316l173fpK3ict9BiXd8e4jgsI2pgDVJs9r0IXMSdjFxAi4HwTCbgdc85H
	B3FthYHfWBWCG1ZaOWMuP5ojLvQJDLqgwu0P1gKkELQYgt9GRUYK2oVIZgvyeFhUQtscvk8SfpQ
	rSgzVnAuRfcIVNIojWAw2lp10Om+VqhjX6PJMSQwLWPvVJ/cNFpvQagT63uzIgPkzN8gi/oXcy8
	YEUxdV7G6/TKnbdTrZpHU17pMrjveAIqMsUIiO5MsnFN7huV5atl8Rvs4o0yRJNZaX2RRRvm+j/
	qmVlsxhNXZ/wnGtu0OqkNOnfz4k/6GwXTJgM2YkPyHPJFXdcZyS7V9RM2RljzVFF4KlENrHZiuV
	nf37pXPzOaNRJ90bneTA+3t3Lrlm7YE8Fvq7F0=
X-Received: by 2002:a17:90b:35cb:b0:39e:6c69:f479 with SMTP id 98e67ed59e1d1-3a073262d85mr1337283a91.56.1790084823601;
        Tue, 22 Sep 2026 06:47:03 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.lan (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06caf4a73sm1381225a91.2.2026.09.22.06.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 06:47:03 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: Rex.Lu@mediatek.com,
	andrew+netdev@lunn.ch,
	angelogioacchino.delregno@collabora.com,
	davem@davemloft.net,
	edumazet@google.com,
	hujy652@gmail.com,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	lorenzo@kernel.org,
	matthias.bgg@gmail.com,
	nbd@nbd.name,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	sujuan.chen@mediatek.com
Subject: Re: [PATCH net v4 3/3] net: ethernet: mtk_wed: setup WDMA_RING_TX(0) for non-DBDC MT7986
Date: Tue, 22 Sep 2026 21:46:04 +0800
Message-ID: <20260922134604.617-1-hujy652@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <179000700034.2160803.10594281691384015089@kernel.org>
References: <20260917144335.19466-3-hujy652@gmail.com> <179000700034.2160803.10594281691384015089@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename=v4reply
X-Mutt-References: <179000700034.2160803.10594281691384015089@kernel.org>
X-Mutt-Fcc: ~/sent
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_064705_111621_7524240F 
X-CRM114-Status: GOOD (  40.59  )
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

On Mon, Sep 21, 2026 at 04:10:00PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 (1) · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] In mtk_wed_start()
>   (drivers/net/ethernet/mediatek/mtk_wed.c:2346-2347) the newly added…
> 
> Pre-existing issues:
> - [Medium] This problem wasn't introduced by this patch, but the patch
>   widens it: dev->tx_wdma[] descriptor rings are allocated with…
> 
> --
> 
> net: ethernet: mtk_wed: setup WDMA_RING_TX(0) for non-DBDC MT7986
> 
> On a non-DBDC MT7986 only rx_ring[1]/tx_wdma[1] get set up, so
> WDMA_RING_TX(0) is never programmed even though WED needs it for RX
> offload.  The patch adds a call to mtk_wed_wdma_tx_ring_setup() for ring 0
> from mtk_wed_start() when the device is WED v2 and rx_ring[0] was not
> allocated, passing reset=true when tx_wdma[0] already exists.
> 
> > diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
> > index 3f0be70c3f145..3800e602d3c48 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
> > @@ -2339,6 +2339,13 @@ mtk_wed_start(struct mtk_wed_device *dev, u32 irq_mask)
> >  		if (!dev->rx_wdma[i].desc)
> >  			mtk_wed_wdma_rx_ring_setup(dev, i, 16, false);
> >  
> > +	/*
> > +	 * non-DBDC MT7986 allocates only rx_ring[1] and tx_wdma[1] during setup
> > +	 * but tx_wdma[0] is also needed for WED to function.
> > +	 */
> > +	if (mtk_wed_is_v2(dev->hw) && !dev->rx_ring[0].desc)
> > +		mtk_wed_wdma_tx_ring_setup(dev, 0, MTK_WED_WDMA_RING_SIZE, !!dev->tx_wdma[0].desc);
> 
> [Severity: Medium]
> Should the return value of mtk_wed_wdma_tx_ring_setup() be checked here?
> 
> On the first start of a non-DBDC v2 device dev->tx_wdma[0].desc is NULL, so
> reset is false and the helper takes the allocation path:
> 
> drivers/net/ethernet/mediatek/mtk_wed.c:mtk_wed_wdma_tx_ring_setup() {
> 	wdma = &dev->tx_wdma[idx];
> 	if (!reset && mtk_wed_ring_alloc(dev, wdma, MTK_WED_WDMA_RING_SIZE,
> 					 dev->hw->soc->wdma_desc_size, true))
> 		return -ENOMEM;
> 	...
> }
> 
> mtk_wed_ring_alloc() does a dma_alloc_coherent() of
> MTK_WED_WDMA_RING_SIZE * wdma_desc_size (32 KiB on MT7986), and on failure
> the helper returns before writing MTK_WDMA_RING_TX(0) BASE/COUNT/CPU_IDX/
> DMA_IDX and before the "if (!idx)" block that programs the WED side
> MTK_WED_WDMA_RING_TX window.
> 
> Since the status is dropped, mtk_wed_start() keeps going through
> mtk_wed_hw_init(), mtk_wed_configure_irq() and mtk_wed_dma_enable(), which
> arms MTK_WDMA_GLO_CFG_TX_DMA_EN and, for rx-capable v2,
> MTK_WED_WDMA_GLO_CFG_TX_DRV_EN | MTK_WED_WDMA_GLO_CFG_TX_DDONE_CHK, and
> then sets dev->running = true.  Can the hardware then fetch descriptors
> from a ring whose base register was left at 0 by the preceding
> mtk_wdma_tx_reset()/mtk_wed_reset(), leaving the WED offload silently
> non-functional with no message?
> 
> The other caller of the same helper propagates the failure:
> 
> drivers/net/ethernet/mediatek/mtk_wed.c:mtk_wed_rx_ring_setup() {
> 	if (mtk_wed_wdma_tx_ring_setup(dev, idx, MTK_WED_WDMA_RING_SIZE,
> 				       reset))
> 		return -ENOMEM;
> 	...
> }
> 
> and mtk_wed_start() itself already bails out on mtk_wed_rx_buffer_alloc()
> and mtk_wed_rro_cfg() failures.  Since mtk_wed_ops.start is void and
> mt7915_dma_start() cannot observe the error, would it make sense to abort
> the start sequence locally here (skipping mtk_wed_dma_enable() and
> dev->running = true) and log the failure?

ACK I will add error messages and return when there's an error.

> 
> [Severity: Medium]
> This isn't a problem introduced by this patch, but does this new call add
> another leak of dev->tx_wdma[0]?
> 
> dev->tx_wdma[] rings are allocated by mtk_wed_ring_alloc() via
> mtk_wed_wdma_tx_ring_setup(), but the ring-release helpers never free that
> array:
> 
> drivers/net/ethernet/mediatek/mtk_wed.c:mtk_wed_free_tx_rings() {
> 	for (i = 0; i < ARRAY_SIZE(dev->tx_ring); i++)
> 		mtk_wed_free_ring(dev, &dev->tx_ring[i]);
> 	for (i = 0; i < ARRAY_SIZE(dev->rx_wdma); i++)
> 		mtk_wed_free_ring(dev, &dev->rx_wdma[i]);
> }
> 
> drivers/net/ethernet/mediatek/mtk_wed.c:mtk_wed_free_rx_rings() {
> 	mtk_wed_free_rx_buffer(dev);
> 	mtk_wed_free_ring(dev, &dev->rro.ring);
> }
> 
> __mtk_wed_detach() calls those helpers and then does
> memset(dev, 0, sizeof(*dev)), so tx_wdma[].desc/desc_phys are discarded and
> the 32 KiB coherent allocation can no longer be released.
> 
> The existing allocation site is mtk_wed_rx_ring_setup(), so the omission
> predates this change, but non-DBDC MT7986/MT7981 previously never allocated
> tx_wdma[0] at all, and now every attach/start/detach cycle would leak one
> more ring.  Would adding dev->tx_wdma[] to mtk_wed_free_tx_rings() be the
> right way to restore alloc/free symmetry?
> 

There is a patch in MediaTek SDK fixing this exact issue.
I will pull the patch from there.

Link:https://github.com/mediatek/mtk-openwrt-feeds/blob/main/25.12/files/target/linux/mediatek/patches-6.12/999-wed-04-Fix-reinsert-wifi-module-cause-memory-leak-issue.patch

Best regards,
Zhi-Jun

pw-bot: cr
> -- 
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260917144335.19466-1-hujy652%40gmail.com
> 


