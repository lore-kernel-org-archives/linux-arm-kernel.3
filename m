Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2A9C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 00:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/Lj2O3Fl3V+yFfxK6lI8xQpWZAZ5Dqiye7be9pLZEM=; b=l1YzZlYD8YCk5nF4Vjhx8PsRRM
	XBAZQV0dv+TRE9KRAPa4jNVFMOsDpHsqadnhpBac/RjzfePljQDRzAfV/j5K4Amsh9K5uc9sduJoB
	wqXbjsBxV4qXJaohCjNOhpm4x7rsCOBWUUJdeTdOgn1of866l2Adb2hYQx654MTYcyyzdJJeZb8Yy
	UGiBGx1cNBXPYqSnowrxmRFuGlbrKQ3qHCpipGRTrkWYyHRyClRw337lyu+ebhsXw3bOnMMsJIOkT
	soeDJSmFxxf4hYVCxIfMM997fwE0cPkSer2j4WxGVDtyo6ejEv9IS5kE6cGWYOOTOJ+OxBh4UP71w
	UBZCxm6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUxJF-0000000DFfh-3nj8;
	Fri, 27 Jun 2025 00:51:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwop-0000000DBmm-2B3k;
	Fri, 27 Jun 2025 00:19:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DEFAC457C3;
	Fri, 27 Jun 2025 00:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE18CC4CEEB;
	Fri, 27 Jun 2025 00:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750983590;
	bh=A/GPq/k9Nay0IeBg/c26bLVz5zmhn+66UN35AjQ18KY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GPHakjTEzBgJZYFQzPu07aArQupswCEtrO40OOgknyCfhs7wzAbukHHOCtiIik1ra
	 anDHFJgX1j30s2e/PgCiC8BGB2i2C6gqwaeLyb7eDz3qb0ZnI+1i2VpG8BHruj2pvU
	 MIC+VrIUbmaqtochAcwS5svxt6d8nsOnn2wPflOpzvGQsOp35J+zZKWEV/GRsex5ma
	 lyJH0WM1TO837tJfisqPPN/HByu+mSvvs84Z5ef4b5nHB8sAbpRORG+VlF7UHiMcZt
	 rJ9EsWc1G/sbPPM5W0biLBCkucVokm/BFg6kbknpJ0xVr4QZeNFSSngYMRmela7uvl
	 0Unc7pcUINj/w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CE13A40FCB;
	Fri, 27 Jun 2025 00:20:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: airoha: Get rid of dma_sync_single_for_device()
 in airoha_qdma_fill_rx_queue()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175098361699.1380299.1821906889134866551.git-patchwork-notify@kernel.org>
Date: Fri, 27 Jun 2025 00:20:16 +0000
References: <20250625-airoha-sync-for-device-v1-1-923741deaabf@kernel.org>
In-Reply-To: <20250625-airoha-sync-for-device-v1-1-923741deaabf@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_171951_581533_60153EB7 
X-CRM114-Status: GOOD (  10.45  )
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

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 25 Jun 2025 16:43:15 +0200 you wrote:
> Since the page_pool for airoha_eth driver is created with
> PP_FLAG_DMA_SYNC_DEV flag, we do not need to sync_for_device each page
> received from the pool since it is already done by the page_pool codebase.
> 
> Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net] net: airoha: Get rid of dma_sync_single_for_device() in airoha_qdma_fill_rx_queue()
    https://git.kernel.org/netdev/net-next/c/4cd9d227ab83

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



