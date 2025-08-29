Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330ADCA0FF6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 00:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X7XEngcm4WsYh+UIX9sDBfh096Gw3Q1egIdOb3GwOMc=; b=I5YGigOsjmLopYLMYml5wP7FIj
	tQoqY3YDPSh/WelJhILK3KBwursCtYKcttjlIRRcRGShOnSEedJW2zdwh1fhl1TE90XffQNfi9Xc6
	Vf1h0TekqMx9stNLI0VmNY8LRpN1MkF4mhA/1hn2uBPZ+r6neLIzZkrQMNaACUYNIvIb78vVyVXKD
	bs4B8JTUhecCCYVjOURZ3Wk9vfn+5auPzQR2a7l4+mQqdvP26Tmn1vApHKsl034gto3DQ8IfMl1+H
	tdJV54iqKVSgu2rUxXeLXAT38pUJYtZ2hBJRfpPZc0o/qbj4f0+ywctTCy2zyGX8T66JVzxpIf3tR
	zI0az/mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urma7-00000003mBv-08VS;
	Fri, 29 Aug 2025 00:03:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urmXP-00000003lBb-2kgc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 00:00:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C55966013D;
	Fri, 29 Aug 2025 00:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B1BDC4CEEB;
	Fri, 29 Aug 2025 00:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756425614;
	bh=EZzCIKy2lXRxIz8FZaNB0OLBRJoxff+kx2U+S4qIdmA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=aIW41zWEoKT/siuAPM8ufcYo6WlT/agjyfb8P83/trEt+RZwPidbMkL91TG0Veu3p
	 MdtCxCoR+f+6iasNAqxbgllbK+Twhn+jrFri/f5g5jEVT1Kaw6sbRK5fcO9WkmAF9y
	 txY4YAyo7ND8NFCxFhoLe6zzsn53taqmOJvFKwzNGbjGXpRdz0p/ghFJK5XaVWQasL
	 ItH0U3zl6N1FKe9lrym3jPEsCJzQQI1NACSxzuqAanND0sANqBJnowNGliALwn3ZGw
	 bGE9NRrm6nT0KyZ55hH271Ld7PIsM8gJBcMzqn3VHgQTMgjbaK7As7REXL7uKmsySL
	 q7ZCCLvjLNmbQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADC4F383BF75;
	Fri, 29 Aug 2025 00:00:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: mdio: use netdev_priv() directly
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175642562124.1653564.9988378849956987814.git-patchwork-notify@kernel.org>
Date: Fri, 29 Aug 2025 00:00:21 +0000
References: <E1urBj2-000000002as-0pod@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1urBj2-000000002as-0pod@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
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

On Wed, 27 Aug 2025 09:41:48 +0100 you wrote:
> netdev_priv() is an inline function, taking a struct net_device
> pointer. When passing in the MII bus->priv, which is a void pointer,
> there is no need to go via a local ndev variable to type it first.
> 
> Thus, instead of:
> 
> 	struct net_device *ndev = bus->priv;
> 	struct stmmac_priv *priv;
> ...
> 	priv = netdev_priv(ndev);
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: mdio: use netdev_priv() directly
    https://git.kernel.org/netdev/net-next/c/bafdd920a060

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



