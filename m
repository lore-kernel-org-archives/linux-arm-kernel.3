Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1A010F92EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 02:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFoJyQsZBx8HuYYZIj2b+jz4Ie/y2Qx2t9SyTCBp8Ro=; b=dqBwRYEzqOEEKBdlvAqbPL2sym
	7MbzzESVMxeJka3Z8OfyVq7D2CPjeJ2u/n+MtTy93m+ECQm3IaSQdYT6nwPGZ/Pgvlt4fqW9CwMVp
	vX5/ELeqfX5lAKkJXoO6xezLqL+B7aUl5d8lGKOeBkefoCUFmpj4/SzDOaxOSENtoRaksxva5HA5q
	THk/uGuui0Sc3hBf0SJFlgN7na+T/iA5BENxRIPkNQNRYbQjp4lNhk4RlO2yEz+cuDIZ1UAyNZ/AL
	/4nvE15x4T4ZzcuyP69QSg1ANOpI5lpGS4p4ssnDVHXYncI2pBSIpHpIpQNsckobsKuisWr8WCLl2
	Ih+fSgBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7l2J-0000000Dp24-15JW;
	Wed, 01 Apr 2026 02:10:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7l2H-0000000Dp1u-36Zu;
	Wed, 01 Apr 2026 02:10:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C2AA060123;
	Wed,  1 Apr 2026 02:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74CFBC2BCB2;
	Wed,  1 Apr 2026 02:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775009424;
	bh=+Ksi1XCXIWGP3i90WnCVs3nm8z+EhgpN13aJj1UvCpQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rK8ywv1Q3UujMUyo4H6i9g2oOC/Eee9O8MOanKPQg2LaQ3pixi2EhOO+1+ABJhE3n
	 0mCbMCCmhQRdxC6LrVD5za9CVZwfyhAUieehk+iBB2ca/vL7lonC5/S4LvolywW2dl
	 8H8aMqc22w/rDlqjMMdjK+LkHQmBH/BSFmAesgb22frQg9aJM1FklGeNm9KNPd5Ux1
	 C9UK4UDrJOe1q/sP888Jo9Dz0FoE9P2xR8dSq+CQaXBTb8+6VJq10VC8WW/1KvzOFJ
	 u6BszL3zc/PC14ftPZDTqGGw6MtdXj15L0cmLukiDsTeJDvrUJx9OptSTknO5T39c8
	 6BEqlY2UspFTg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02D5C3808203;
	Wed,  1 Apr 2026 02:10:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/1] net: ipv6: flowlabel: defer exclusive option free
 until
 RCU teardown
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177500940754.3032542.13943967235330405291.git-patchwork-notify@kernel.org>
Date: Wed, 01 Apr 2026 02:10:07 +0000
References: <07351f0ec47bcee289576f39f9354f4a64add6e4.1774855883.git.zcliangcn@gmail.com>
In-Reply-To: <07351f0ec47bcee289576f39f9354f4a64add6e4.1774855883.git.zcliangcn@gmail.com>
To: Yang Yang <n05ec@lzu.edu.cn>
Cc: security@kernel.org, davem@davemloft.net, dsahern@kernel.org,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 afaerber@suse.de, mani@kernel.org, yoshfuji@linux-ipv6.org,
 yifanwucs@gmail.com, tomapufckgml@gmail.com, yuantan098@gmail.com,
 bird@lzu.edu.cn, enjou1224z@gmail.com, zcliangcn@gmail.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Mon, 30 Mar 2026 16:46:24 +0800 you wrote:
> From: Zhengchuan Liang <zcliangcn@gmail.com>
> 
> `ip6fl_seq_show()` walks the global flowlabel hash under the seq-file
> RCU read-side lock and prints `fl->opt->opt_nflen` when an option block
> is present.
> 
> Exclusive flowlabels currently free `fl->opt` as soon as `fl->users`
> drops to zero in `fl_release()`. However, the surrounding
> `struct ip6_flowlabel` remains visible in the global hash table until
> later garbage collection removes it and `fl_free_rcu()` finally tears it
> down.
> 
> [...]

Here is the summary with links:
  - [1/1] net: ipv6: flowlabel: defer exclusive option free until RCU teardown
    https://git.kernel.org/netdev/net/c/9ca562bb8e66

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



