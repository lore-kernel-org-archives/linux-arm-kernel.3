Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E1BCA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 03:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ShfEOHoW9U4vRjY4DNhfOuRIQz95lQgSqqJkpln975g=; b=JSmAPDjn87j+wuNiN6cQ7v0ZNk
	2wZGqtMsTZJeztZEz6yEmB8y9OvukWadXH1XkyPQTYRF7dGWI+fuPovufV88QlQo77q7Ht2XZCYod
	sJpwNrTn+rMjmRWJEfQbBvsGKLi5bNkswrLyf4y2VXbH378g3EpRbtC6c/16viHWRLlmdOsmWczww
	sE7E+YYu+vjSH5xaAOlpMQb1q5JYLVGOXn5RbuvBicGm3DVV9bZUFaLm013hJLx/+NhPfAtLw+rkf
	HOv1c+FOrMeK1nSwtBMAIFCNOBNvWdpjjwmT7fGwSVzhJ7HFAC8SCY4sXkRJj6DAQ6BlaR5mMl1wl
	GhKAgNWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulfb5-00000009hzx-1i3v;
	Tue, 12 Aug 2025 03:22:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulfYP-00000009hbv-22qS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 03:20:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 63AF344392;
	Tue, 12 Aug 2025 03:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3438C4CEED;
	Tue, 12 Aug 2025 03:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754968800;
	bh=6A+jeyPnXO4AX6ZcycgzjX1K4rTdQsKw738pZ+L6V6Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=halp2w/8T0gvAzda6uNomNpUXHnhiG6miLpGMs1Ys53r8W/N4R2ccWOxIdvct14ta
	 Y0rY4PE9oLh6DauJzq+PB5cFu53b67nXF4KzfSKpMEjeJGCcIa4nKDSaA1Ml91drmy
	 Y4/AUu9PgKOw9idpCrXIZZ0m0qKcuUeofMMZsgpQzCJCzMM2R3/zCqJs2PShyWcZNj
	 L2mRj/PR8Jxf3ScUKCILXuZx97QDEWc6jBBQNi4hcFKRPDV2wPKajw1pR1pYuC3jhJ
	 cbl7r5y3TkbA92bZjieH5TAnxn3N9qSEad/8O8D6ZNj5z/nCz72p31Dt3u9PVIOmK6
	 Hhuv9L8A8soQw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70B35383BF51;
	Tue, 12 Aug 2025 03:20:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: stmmac: rk: put the PHY clock on remove
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175496881199.1990527.5027010954317382429.git-patchwork-notify@kernel.org>
Date: Tue, 12 Aug 2025 03:20:11 +0000
References: <E1ukM1S-0086qo-PC@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1ukM1S-0086qo-PC@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, david.wu@rock-chips.com, hkallweit1@gmail.com,
 alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_202001_571682_8AE19E6C 
X-CRM114-Status: GOOD (  11.49  )
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

On Fri, 08 Aug 2025 13:16:34 +0100 you wrote:
> The PHY clock (bsp_priv->clk_phy) is obtained using of_clk_get(), which
> doesn't take part in the devm release. Therefore, when a device is
> unbound, this clock needs to be explicitly put. Fix this.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> Spotted this resource leak while making other changes to dwmac-rk.
> Would be great if the dwmac-rk maintainers can test it.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: stmmac: rk: put the PHY clock on remove
    https://git.kernel.org/netdev/net/c/de1e963ad064

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



