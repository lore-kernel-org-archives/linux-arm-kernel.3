Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FBBCF45CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 21:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iw6w19NggGfdcTGAr6VzBYjAlYNoQi85b8t4AYXG+Jo=; b=dpXDSg+W12+GKTVj8ZxJ4QfEep
	dkMSfzinwYaBOwEp9NmKlpYcXf7s57rtdtyj2K1Q97ivhQwQB6co+Hx1Oqcy6QvI25M9HJZBZSzuU
	i02++JL884/IIZEydDL6Y0Bhuxjh3Bb3HNM0hwPqZzaW4P5QWpCkGSPYnc9SksjIX7w7IEj9SwMw/
	hEwOrwnR13rciWxDaGfGp9HBODRr6BRKKeCcWuNUPCDQ0+JptTG0cyBeQySIryoQTPCTnUISQvQxz
	14rZ7VIKFFcj3pf4d9sg8Bc+NPbR74muHGHsZYGW5xzYAEsYULw2Ry7/1D+zHGmfblwKuChIYkkWZ
	9M45JPHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfP2F-00000006C5h-0Lqt;
	Mon, 12 Jan 2026 21:01:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfP2B-00000006C51-2wd7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 21:01:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 44D49442B0;
	Mon, 12 Jan 2026 21:01:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2174BC19422;
	Mon, 12 Jan 2026 21:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768251665;
	bh=k7U6XE4P8/KYbGOb2zFtfsApeLHHAiP3CuB5iFN4w6U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Svj3EGCPDfuNEYP0Cybqqnx6ZvkmXYU/JQFPzf6nZJ4DOZco7xBEus9la0f3rCnRO
	 d4rJDvXi+sF8ShlnjiruBhGG74w/p91auQAuj5N8wqoxlOY1NncKOXfoqstP6KIK7f
	 VH/t1IGxvxg/u0SYBFyQgg21BRqJY+e2b+uGRHQPfz7Dip6NsKU2/R6XGa0lcdDIeN
	 pLA2dk3QXNHIqY7UYS4L+YcvgZMq5MlA0eEV4E57a6os6ARotNH3wu10dZ8zeiDF4P
	 6zm4xmJUP6ZVS7KTbihNBuZ37A/nRD753erH9fbL64u+t/VLiyGTYt+P8FjIXKJ3eF
	 7dBIOLmEKJOlg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3BAF7380CFD5;
	Mon, 12 Jan 2026 20:57:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: stmmac: convert to use
 .get_rx_ring_count
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176825145877.1092878.14865875892594291102.git-patchwork-notify@kernel.org>
Date: Mon, 12 Jan 2026 20:57:38 +0000
References: <20260108-gxring_stmicro-v2-1-3dcadc8ed29b@debian.org>
In-Reply-To: <20260108-gxring_stmicro-v2-1-3dcadc8ed29b@debian.org>
To: Breno Leitao <leitao@debian.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_130107_762036_D7AC0993 
X-CRM114-Status: GOOD (  10.10  )
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

On Thu, 08 Jan 2026 03:43:00 -0800 you wrote:
> Convert the stmmac driver to use the new .get_rx_ring_count
> ethtool operation instead of implementing .get_rxnfc for handling
> ETHTOOL_GRXRINGS command.
> 
> Since stmmac_get_rxnfc() only handled ETHTOOL_GRXRINGS (returning
> -EOPNOTSUPP for all other commands), remove it entirely and replace
> it with the simpler stmmac_get_rx_ring_count() callback.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: convert to use .get_rx_ring_count
    https://git.kernel.org/netdev/net-next/c/959728f9931e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



