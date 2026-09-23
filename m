Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C03C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 01:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hvLyBIZlI4M3HZZ+3BYKdeiiZqGAKGp8Army6XuZzek=; b=AqE61g2sN6PNkaUs4rs0UuLtR0
	pWxLE8bEsTarrHEhQv2Rpgc0xfkktbo9CiLN8XjyG+45bn9/XJ1YBB9S990Il+3bzSDLAouO3ZYb7
	P2kHUvtiDa9ByjI/CjPfB8VIJZzan0mtMYgXtToQLw4C7iC43l0LMpyVEhOHmFXRTAxFG/Htm1+Ud
	Oo9Gx7/WQAGfQ3PqdiVvnIi0+y9KAkdCkY78Z/oFrC+GciDfFd0Qnl0DHtbwGlmhGF7LdLcVlcXpP
	6shssCNT/rbPm49EpVVrcLh4WDhIVaehsmDsby8tNq2pYCIDOr3Xp9ucXEuzaywGYPZ42DvLFfFXJ
	ZWKJXjmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Bfw-00000006qM5-39th;
	Wed, 23 Sep 2026 01:21:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Bfv-00000006qLj-0Eqc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 01:21:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5ECE441445;
	Wed, 23 Sep 2026 01:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E50F1F000FF;
	Wed, 23 Sep 2026 01:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790126490;
	bh=hvLyBIZlI4M3HZZ+3BYKdeiiZqGAKGp8Army6XuZzek=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=W5mLL55HqMCrTCHIpEiCkhYCq+pc2qDxZgkmMraGm1rlu2JN5zMdk3ZdVbM9acUis
	 guRN8a/qFL70GVWyGX1Z2hRTvkoMa7CsvqkBNBHIWedU53zeSVgqUqgQoOxjrQ2kbh
	 /oULwbr3WJcxBcdNthKPRBrdhYzAMI/DYsyFAm1DWaaAzeFGpeXKHo1qbA3mPDcT5Q
	 zXCqvkVyWXdsA7l29nfkv8J/hmfToD39g24ljBLPi/jEazTvRpd7G5JIWtWpFKM9WH
	 r8lpfDweAtRonw03bXWvGu/rjVyYyHwvitwCJM6O1wPSNhf9nBj1YbaalOwcTgCtoG
	 +yh9+3CA4Gd1w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19A8B3924463;
	Wed, 23 Sep 2026 01:20:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: stmmac: dwmac-sun8i: Fix EPHY clock leak in
 get_ephy_nodes()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179012642070.161587.7205232345665822833.git-patchwork-notify@kernel.org>
Date: Wed, 23 Sep 2026 01:20:20 +0000
References: <20260917113654.2149268-1-vulab@iscas.ac.cn>
In-Reply-To: <20260917113654.2149268-1-vulab@iscas.ac.cn>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 clabbe.montjoie@gmail.com, davem@davemloft.net, edumazet@google.com,
 jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com,
 samuel@sholland.org, wens@kernel.org, stable@vger.kernel.org
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

On Thu, 17 Sep 2026 11:36:54 +0000 you wrote:
> get_ephy_nodes() stores the clock returned by of_clk_get() directly in
> gmac->ephy_clk before the reset control is obtained. When the reset
> lookup fails, the loop continues or returns without releasing that
> clock, and sun8i_dwmac_probe() then jumps to dwmac_remove, which does
> not call clk_put(). Keep the clock in a local variable and release it
> on the error paths.
> 
> [...]

Here is the summary with links:
  - net: stmmac: dwmac-sun8i: Fix EPHY clock leak in get_ephy_nodes()
    https://git.kernel.org/netdev/net-next/c/d9750b3c4c27

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



