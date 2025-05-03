Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0B5C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 01:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0uJASVDW8Oaub7VFdAcbuo6tXJf36uKIgji+ugPQnjU=; b=3Cbn/D2iIlGPWnOtSTP04ZYNjP
	scY17jrsQ+GG0eJ/BnSj056iMg1ywanoPUxfB7GDVEQEkhVItjH3b30J9vPxo8O6LhER0n2alrrel
	U2dxKR350ui/JEHHFjvnBcFOe85OLlU0R/ocIRDSo/Nip9gJUTHl3AqoWl3+bp61JarcYeZlKfdBC
	qRWQzplvYlsmqBJiSQvSqwVXQQVuarKo4+kXbNaX4rE/ZbeUfJ+0wIECINvo7w3nMlCZ2Xwo0031N
	OqCVYlPOxnfQXhJeblB6AQ/nd2XC242pkb//ghWzUiX8EDvtO0pqRnyUhtu+exx2zd3vrJwmsh2rD
	m0xriwuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uB1jg-00000003Nbx-3djn;
	Sat, 03 May 2025 01:32:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uB1hm-00000003NY0-0cTm
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 03 May 2025 01:30:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0uJASVDW8Oaub7VFdAcbuo6tXJf36uKIgji+ugPQnjU=; b=nb3UvdKpMcQts3WkAwnacKWr67
	eW0CSmO4qXDHDiUEK3b4j2C+cysVBOW5Z75hqfJT1LrvEVKzswH/WrMDobotU6Scwx++OQfplwg2K
	wto2UJSlUZVet2/kSkJ0SBky0ns2jFJ7vIGdkT51toNl6itq5r6UCauNLX1ZSs7A5uEY/aiEzXiFf
	nyPBPcqPYbGAh+Bhx/gcRMYewoYV8pZN+8Hm8zuTzYV+iXMlrv58KI/3pa3CroSlmWiaSZgyIyCaj
	QQhU6PtEFKIn85F1BgCLiGKlXoFWWhKZUe2RPHVgKr1LA6Kp8M1OzjHr/P+MO7D/7WjuFLZECpLRl
	6RXcm4Og==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uB1he-0000000F9wE-3XIS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 01:30:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE5B749F1E;
	Sat,  3 May 2025 01:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E6C7C4CEE4;
	Sat,  3 May 2025 01:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746235797;
	bh=ckSRd/Z1qnGR5wOXMVaoNwn10WAMsGKB1bQB2+988VI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dYBU9/NCWhZT9cEjrZ/wwIvulZvVimgDEDPtNxu5T/H7Gzd8/Z64POfrz+Bvgbs6f
	 MB72dWx4d/9CklUKdQ0/rjWzddt9bhkzZMTrAYouMti9W0vwq+chHA8hilvNpJzTPG
	 0ApbmwCIEr0wIoHxP3W+WZmoFN3lWJubLBpSdz5UXOvB7olLl4REF3b3UlIKlO993s
	 j6Tn6Z58KboK8DCCdnVmKsIqGfhLihnTtvfGDL1R23dsZf4DijJSBlumm6M3R86z8E
	 0vfPmCv1lHOaZoX5p0i9E0RcInCPYY5YzuaCsyBKWhI7njUoY6EPykgVxR5O9mHt2H
	 Q4oDSB9UI4/cw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C66380DBE9;
	Sat,  3 May 2025 01:30:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/6] net: stmmac: replace speed_mode_2500() method
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174623583625.3773265.4045311227752993763.git-patchwork-notify@kernel.org>
Date: Sat, 03 May 2025 01:30:36 +0000
References: <aBNe0Vt81vmqVCma@shell.armlinux.org.uk>
In-Reply-To: <aBNe0Vt81vmqVCma@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_023008_844848_6BAD1CBF 
X-CRM114-Status: GOOD (  11.66  )
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

On Thu, 1 May 2025 12:45:21 +0100 you wrote:
> Hi,
> 
> This series replaces the speed_mode_2500() method with a new method
> that is more flexible, allowing the platform glue driver to populate
> phylink's supported_interfaces and set the PHY-side interface mode.
> 
> The only user of this method is currently dwmac-intel, which we
> update to use this new method.
> 
> [...]

Here is the summary with links:
  - [net-next,1/6] net: stmmac: use a local variable for priv->phylink_config
    https://git.kernel.org/netdev/net-next/c/5ad39ceaea00
  - [net-next,2/6] net: stmmac: use priv->plat->phy_interface directly
    https://git.kernel.org/netdev/net-next/c/1966be55da5b
  - [net-next,3/6] net: stmmac: add get_interfaces() platform method
    https://git.kernel.org/netdev/net-next/c/ca732e990fc8
  - [net-next,4/6] net: stmmac: intel: move phy_interface init to tgl_common_data()
    https://git.kernel.org/netdev/net-next/c/0f455d2d1bbe
  - [net-next,5/6] net: stmmac: intel: convert speed_mode_2500() to get_interfaces()
    https://git.kernel.org/netdev/net-next/c/d3836052fe09
  - [net-next,6/6] net: stmmac: remove speed_mode_2500() method
    https://git.kernel.org/netdev/net-next/c/9d165dc58055

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



