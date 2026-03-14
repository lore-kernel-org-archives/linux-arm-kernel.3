Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908E4105F79E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 19:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/goX/dlFuPnopoo0eP8wASmQbxWtSHWawYsQi14SQk=; b=4CvHkmZVREP62PtFD/0yjDXTxk
	ecNzsTc6Qwl0Bog+573AhB0tXsU+KDLby3LOxqtSXTA7M2zgvgb8i2XwW+Of8jN+ZH5/udD4wMrHp
	nBLOFCAelBIWRYApgaxTQzc2XbxDwx5G9CE1JkpRGlitTohGc2VOvImYu9bpSkXzBmtCsUA8Y1Vwc
	+DPmNpEdwUAKxKPuKT2Wr4Q3J8N1RqrouLWJa1wZTAiKGGXlFjYxleI7oL3qNAv14RqJ19CpfesZJ
	hP9Y7dBX7gLpxjY78zz1AhqI5n34ldQo5CDlUZIM3DXuor/qPbBDi1lTtc8VilSys6BXiNrBTZMmJ
	wFLTRdog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1UWz-000000026s1-2Cjq;
	Sat, 14 Mar 2026 19:20:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1UWy-000000026ru-1whY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 19:20:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3CAAD60121;
	Sat, 14 Mar 2026 19:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD3C6C116C6;
	Sat, 14 Mar 2026 19:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773516010;
	bh=mv9gRneToAJrV7gs2ldMrUIGYl8qxv9erSyv2O03I8k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JioKRn5phSWN+Pg9U/nDu8tULPa8K/S0HTFil7Iprr7qTyQHyzv+J5oZgqCPv6PGD
	 Yt6nsRToT/SapJ8I3iW/WBWOTNQpSz2qdvOUrd339/V46piNjJbn2JPDts3Hjc5paA
	 gy7akA7lp4vI5HSRoeT+Roqmc083GavdEgFU6Kn3w7Uc+xhVcENMQ2vij5rpxLLsUS
	 JqNT85OoUoGKr1BFSaTsigUQ9XR4uleIe7anm0c8tpXPhWT8+zWYKUw1BEYI0Ad32D
	 Kys43C2V2pGjqsuCs6ZxAcmZzmzpf0Ic31sRHMoYO6nS5NzWf0OuYG92c/ahINweDI
	 8beNP4I73VXtg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FFD53808200;
	Sat, 14 Mar 2026 19:20:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ti: icssg-prueth: Fix memory leak in XDP_DROP
 for
 non-zero-copy mode
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177351600505.1761235.8171503216454901330.git-patchwork-notify@kernel.org>
Date: Sat, 14 Mar 2026 19:20:05 +0000
References: <20260311095441.1691636-1-m-malladi@ti.com>
In-Reply-To: <20260311095441.1691636-1-m-malladi@ti.com>
To: Meghana Malladi <m-malladi@ti.com>
Cc: vadim.fedorenko@linux.dev, haokexin@gmail.com, jacob.e.keller@intel.com,
 sdf@fomichev.me, john.fastabend@gmail.com, hawk@kernel.org,
 daniel@iogearbox.net, ast@kernel.org, pabeni@redhat.com, kuba@kernel.org,
 edumazet@google.com, davem@davemloft.net, andrew+netdev@lunn.ch,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com, vigneshr@ti.com,
 rogerq@kernel.org, danishanwar@ti.com
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 11 Mar 2026 15:24:41 +0530 you wrote:
> Page recycling was removed from the XDP_DROP path in emac_run_xdp() to
> avoid conflicts with AF_XDP zero-copy mode, which uses xsk_buff_free()
> instead.
> 
> However, this causes a memory leak when running XDP programs that drop
> packets in non-zero-copy mode (standard page pool mode). The pages are
> never returned to the page pool, leading to OOM conditions.
> 
> [...]

Here is the summary with links:
  - [net] net: ti: icssg-prueth: Fix memory leak in XDP_DROP for non-zero-copy mode
    https://git.kernel.org/netdev/net/c/719d3e71691d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



