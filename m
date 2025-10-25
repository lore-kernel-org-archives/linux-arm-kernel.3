Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BC9CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 02:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wdb8ps0bpdtCY3MntIy/cls93bqtG/jqZtsLTW+q77k=; b=Jv9RsvNPZRePMKLNCQ94pRzxb1
	IParkZ7iaEzWncl36lz8xLigACxYWg3wvUi2DSCWmzNP/rX0zyK2ODCxZvP8kxw2kjiPe8QHUlVKY
	a+QYMNcSxMRKEJEyvorE++TEWWt0b7Dx/p1wYh/VXSsAb+7lt6lx2Sp6R3NRjqEF6m03Ahh5oTZOA
	Od0G7DyRnf7NS2lwIijM+L1J9lR+7ohZ4C//G2JwLrO4GBrOngNalCm/z6OLCJc50ufjlnK0RqAhd
	CLKu1QxW4kfcStCBsYbmgyCWjlPUsGMPdEfk2gIUN0VI4d2A4TxuF/z6SM4KlF1O2ISysQnY2/1Fr
	+5a/93JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCTkH-0000000AonS-2WUy;
	Sat, 25 Oct 2025 02:11:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCTkC-0000000AolR-2AbE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 02:11:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D31360233;
	Sat, 25 Oct 2025 02:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 218BDC4CEF1;
	Sat, 25 Oct 2025 02:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761358258;
	bh=T+Ll2yJOvJipZ1CY2YovdDE7zLS7U/JxGi1g5MOaDY0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GQyXSBVNQ2gsh3VbvCWUJkxOtGBi2PvK5Uw2J8I/7Q6gYDbzftF5Mmb8R2ZuiO2iP
	 VmrhQUjxJ/GIuekc0+02OscV0BXaDpJPGZYM1OuYI/SDhVjIPRwB04P/hQ5rMpDLPi
	 owxEMYdolKhPn/Rk9WQBnzcpVK1AaugLKzTgxeCNkTO5l47JMbYd1u0s1/YZ+QpoFg
	 UTdtjIkbgebSFZqfzlK/jGhowr2zh3ICOPFavSd8aVnPU0gKRoK/A5R0adJyZhhDmF
	 WSXDevQpnjo4FSklWCyeBR/Yife6fP1EzCiAT1/0LG30ABaaa54dOqfDYuajcVf4IF
	 RYXIZDIbLPtTw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEA0380AA59;
	Sat, 25 Oct 2025 02:10:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/6] net: add phylink managed WoL and convert
 stmmac
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176135823749.4124588.15892332311706478682.git-patchwork-notify@kernel.org>
Date: Sat, 25 Oct 2025 02:10:37 +0000
References: <aPnyW54J80h9DmhB@shell.armlinux.org.uk>
In-Reply-To: <aPnyW54J80h9DmhB@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, florian.fainelli@broadcom.com,
 gatien.chevallier@foss.st.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, christophe.roullier@foss.st.com, conor+dt@kernel.org,
 davem@davemloft.net, devicetree@vger.kernel.org, edumazet@google.com,
 kuba@kernel.org, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com,
 robh@kernel.org, horms@kernel.org, Tristram.Ha@microchip.com
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

On Thu, 23 Oct 2025 10:16:11 +0100 you wrote:
> Hi,
> 
> This series is implementing the thoughts of Andrew, Florian and myself
> to improve the quality of Wake-on-Lan (WoL) implementations.
> 
> This changes nothing for MAC drivers that do not wish to participate in
> this, but if they do, then they gain the benefit of phylink configuring
> WoL at the point closest to the media as possible.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/6] net: phy: add phy_can_wakeup()
    https://git.kernel.org/netdev/net-next/c/330ce8ffc184
  - [net-next,v2,2/6] net: phy: add phy_may_wakeup()
    https://git.kernel.org/netdev/net-next/c/b344bfacf1de
  - [net-next,v2,3/6] net: phylink: add phylink managed MAC Wake-on-Lan support
    https://git.kernel.org/netdev/net-next/c/b79fbd86c849
  - [net-next,v2,4/6] net: phylink: add phylink managed wake-on-lan PHY speed control
    https://git.kernel.org/netdev/net-next/c/dc1a2a9ce5b2
  - [net-next,v2,5/6] net: stmmac: convert to phylink-managed Wake-on-Lan
    https://git.kernel.org/netdev/net-next/c/6911308d7d11
  - [net-next,v2,6/6] net: stmmac: convert to phylink managed WoL PHY speed
    https://git.kernel.org/netdev/net-next/c/d65cb2e27e6e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



