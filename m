Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C78CC6B2C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 21:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHXeb0vXLdnW9/JmwDK3OUmF9m3u5QpIN6VrE7BO30U=; b=U9LXa3o60sU7wZC7r6FjTjNhyC
	dLMoXsdM9hhq/EBrVKdBau6JXrmhXdBbS/5Y7iws3C01Dm4Zr/K4yteZj1GbfK/0/urr20eZgyMNh
	MnUcCZQXROUuKYnkDWe53rfZatbfcbv9r0gFfMkVvSnkf2rd3q8gBcAg07DisRGVe3cHh0rtJUOOh
	yXn+SwXKQea4n5NoaIl/jX9MrjJc7SaIiEAm5S73Vher7O6lnfu28VB+HKJpfkCBC/ultNeQjJgYc
	cf/ucmjK+l9rghCCbiov4FL1r8vLSFGTvHM6Qq52qqQXD8XRcC2ThXnq0YV8c6D4ViOnmdTZONv3e
	Np5kghOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH6hl-0000000GMNy-1W7b;
	Wed, 14 Oct 2026 21:40:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH6hk-0000000GMNR-01lK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 21:40:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 912AC60229;
	Wed, 14 Oct 2026 21:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44A0B1F000C4;
	Wed, 14 Oct 2026 21:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792014006;
	bh=MHXeb0vXLdnW9/JmwDK3OUmF9m3u5QpIN6VrE7BO30U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=WEqnW0jD3CDKzk3yyPkIENurtJb9u8+7v8LlYYTkhdBRxr/2gkDUhAEBBqQp4E8xu
	 +HIh91vYH+zfKfHaws/cpNrK+ULUVi+CXOf6V70q+aUVIeOkeazLh8pE8xC709ibUv
	 cpj2owkVVgbfK4ieN2QHTb6cd3QVZbtFH5rdtYzhs7alrXvnca8nzOG4DaO4JPnpG4
	 WX/hVErhC4xFhZJubFngDYKhq5HPuh9qq6WF9Hblj07ScGv7oAqBCmFAhE5uSlTDs7
	 DIV/qH5FkBcB8VSt/voFn7ykplx/lDaOIEjfp+dnnmzwIXaNLEpXvI81B5YuARnZPS
	 m8KyBhCCSBrug==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A4313803318;
	Wed, 14 Oct 2026 21:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/3] net: use skb_share_check() in loopback
 selftest hooks
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179201400467.3009952.9047387445003414493.git-patchwork-notify@kernel.org>
Date: Wed, 14 Oct 2026 21:40:04 +0000
References: <20261007-nb-net-selftest-shared-net-v1-0-458369bfa1ba@tipi-net.de>
In-Reply-To: <20261007-nb-net-selftest-shared-net-v1-0-458369bfa1ba@tipi-net.de>
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, o.rempel@pengutronix.de,
 maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 Jose.Abreu@synopsys.com, saeedm@nvidia.com, tariqt@nvidia.com,
 mbloch@nvidia.com, leon@kernel.org, dtatulea@nvidia.com, alazar@nvidia.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-rdma@vger.kernel.org
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 07 Oct 2026 20:29:21 +0200 you wrote:
> The loopback selftest hooks can get a shared skb when another handler
> is bound to the device. Linearizing a non-linear frame then hits
> BUG_ON(skb_shared()) in pskb_expand_head().
> 
> Stumbled over this on RPi CM4 (bcmgenet, with jumbo series applied +
> WIP selftest patches) with a packet socket open at the same time as
> running ethtool -t.
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] net: selftests: use skb_share_check() in the loopback receive hook
    https://git.kernel.org/netdev/net-next/c/fbd3a301b137
  - [net-next,2/3] net: stmmac: selftests: use skb_share_check() in the loopback receive hook
    https://git.kernel.org/netdev/net-next/c/a7a89019bac0
  - [net-next,3/3] net/mlx5e: use skb_share_check() in the loopback selftest hook
    https://git.kernel.org/netdev/net-next/c/16fb7aa6955a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



