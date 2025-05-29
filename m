Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39074C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 10:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUaGzQSQIr1eLMt9M2T1F9Lo08/3wx/C+PnRzg1d9bQ=; b=EB3DYPV0PYWL0EUj5ndPc5ijiN
	U5ldX2t0c6aKhumJjSvmvyHAOaRiG/t/Kz2CQAIPOTT8rDI1MmrB+ZaT4FkDfJNKJjrB+gmz8geey
	jz0LavQDBaJpRvSq4rHrCI42zKmwy+fm2zTj1ZQMu6TWV7iIdFufljmZ/19oDCbHZVCnbgsvF7glm
	7TEclVwLdVzzI3np7/tf9qPNlmVWNtvHY08aWM96sqBi6jyDwKNzNjHlPxfsIgj6I2WW7zAZjgb+U
	y+U6S4yTAkCzoMCWcjb/TYcRacU7dPjRPuXxQ2i4Jazv2TJQKWka9cUVqBsLAZUqLrT78lRLI9X1D
	7/qifmqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKaYT-0000000FVuq-0uF8;
	Thu, 29 May 2025 10:32:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKaWM-0000000FVft-0Epa;
	Thu, 29 May 2025 10:29:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 76402615F2;
	Thu, 29 May 2025 10:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CF21C4CEE7;
	Thu, 29 May 2025 10:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748514597;
	bh=riHvhwPiH5V6qKln4d0cb8sN5WbGv/6Yin393zmcsl0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NIIt6U3Mz7JfYs6BhrDomKTfQW5Hs7Dk/3Y5KJAhY9nK68ageTVQLd/fkk2e1tCDP
	 Bx2ZKdJckBn5gFir9KGvk2vj/JkTJpuwjTbwTAZPqCWAyUdqWPXEJ7ZVJbte/yqr9U
	 B17xzrJCe7fzPEmBqbBhRW0S9nbi7LXDfpab432tWRHdEwyCWGcsAw9Bl3Rhv2y7/v
	 w4KVjKDUDS0Mh4GTR/ff1aXdSqPVByYhm2+zl7Lm26HxoX93zDn2PnVCPwzy9AJdfb
	 zaZ7HqjLsIXVFOMBLy2laIlUMLcHqtQBm87hmU5FnT0dm64y97dxMFAZ2uo0xzUr++
	 XUll5MCL9JSlQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3685F39F1DEE;
	Thu, 29 May 2025 10:30:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] driver: net: ethernet: mtk_star_emac: fix suspend/resume
 issue
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174851463074.3219366.15490415696108954366.git-patchwork-notify@kernel.org>
Date: Thu, 29 May 2025 10:30:30 +0000
References: <20250528075351.593068-1-macpaul.lin@mediatek.com>
In-Reply-To: <20250528075351.593068-1-macpaul.lin@mediatek.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: nbd@nbd.name, sean.wang@mediatek.com, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, brgl@bgdev.pl,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 bear.wang@mediatek.com, pablo.sun@mediatek.com, ramax.lo@mediatek.com,
 macpaul@gmail.com, stable@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 ot_yanqing.wang@mediatek.com, biao.huang@mediatek.com
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
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 28 May 2025 15:53:51 +0800 you wrote:
> From: Yanqing Wang <ot_yanqing.wang@mediatek.com>
> 
> Identify the cause of the suspend/resume hang: netif_carrier_off()
> is called during link state changes and becomes stuck while
> executing linkwatch_work().
> 
> To resolve this issue, call netif_device_detach() during the Ethernet
> suspend process to temporarily detach the network device from the
> kernel and prevent the suspend/resume hang.
> 
> [...]

Here is the summary with links:
  - driver: net: ethernet: mtk_star_emac: fix suspend/resume issue
    https://git.kernel.org/netdev/net/c/ba99c627aac8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



