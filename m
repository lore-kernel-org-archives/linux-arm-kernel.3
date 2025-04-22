Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5ABC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 10:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mCMI1hMwa1cZHpHrOG6mTVsJX8qRiYU4dV5mbIa6V50=; b=ItjBk+0DjRM6fu61/nuPN7lz1u
	6Kqf1yHGlDeS9SL4x5LYuPlxJDeiHk1dsPfgC4OIebkgkf6AJ35+DVjEFE8/aKKDIGi0A+9F6nBSP
	gWKTvXbwTjtnjY5ttPHjFwSwVjR8b2zutp3L2luixEjXOm7vyze2nxjCCfJ6BSV3DpfZmBT7xDvrP
	bAzW7gbsdYvtKdbMnGr+SAT6ZhpAuhO55jK1w/fPZh62P5KTyANCIkaJUaHiqbFETRVdfoWafGxBx
	luZawTkL0b9CyGf247U7l6droEPiQ8w0VKpROm9l+M4NmgWLtruOm4bW7v9mFyellk90YGp89BSuA
	M4SbGYBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7AnK-00000006jwO-2i4d;
	Tue, 22 Apr 2025 10:24:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79dx-00000006VW2-3Riy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 09:10:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 03758614AC;
	Tue, 22 Apr 2025 09:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F1CC4CEEB;
	Tue, 22 Apr 2025 09:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745313015;
	bh=dvvqu9VLExHyZ9ZpJuxQQarkDv+LB3yDV1x4fu+Cwlc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iTJ9QcxT0so1Db8Fy7lsZ7VDn5rmlNLNMyPTXCQhzwqnPsuEuaKlHRvtyyXrnYKrI
	 Tg3qXRKEqsZi4Pckz0IVQTEE0QGdcR+Ho/vJdrIbudtBzCezXagstworTNHwykUn6p
	 p2n74qpUWvMwrgN7dKbjaTPQ+z28jdgibIyE7/A2HW5aYddYwzX26fmqJiFWx1tB4v
	 4C5BbI5z7gdnIHLfzVGdeKeXuJh8so6HGHxzLhkIHu+nKehq8TdxtREv4IO3owMo75
	 b6CoGfNHZ4L8viOzbGn+0Lf1ge0jj9hCXP9aQHt0EuELl1P5SXzOSAEnUoA3Cu992+
	 U9AdTmBZa8NAw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BFF39D6546;
	Tue, 22 Apr 2025 09:10:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/5] net: stmmac: socfpga: fix init ordering and
 cleanups
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174531305373.1477965.16027981733032970963.git-patchwork-notify@kernel.org>
Date: Tue, 22 Apr 2025 09:10:53 +0000
References: <aAE2tKlImhwKySq_@shell.armlinux.org.uk>
In-Reply-To: <aAE2tKlImhwKySq_@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com
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

On Thu, 17 Apr 2025 18:13:24 +0100 you wrote:
> Hi,
> 
> This series fixes the init ordering of the socfpga probe function.
> The standard rule is to do all setup before publishing any device,
> and socfpga violates that. I can see no reason for this, but these
> patches have not been tested on hardware.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/5] net: stmmac: socfpga: init dwmac->stmmac_rst before registration
    https://git.kernel.org/netdev/net-next/c/9276bfc2df92
  - [net-next,v3,2/5] net: stmmac: socfpga: provide init function
    https://git.kernel.org/netdev/net-next/c/0dbd4a6f57c2
  - [net-next,v3,3/5] net: stmmac: socfpga: convert to stmmac_pltfr_pm_ops
    https://git.kernel.org/netdev/net-next/c/6bf70d999aa9
  - [net-next,v3,4/5] net: stmmac: socfpga: call set_phy_mode() before registration
    https://git.kernel.org/netdev/net-next/c/91255347bba9
  - [net-next,v3,5/5] net: stmmac: socfpga: convert to devm_stmmac_pltfr_probe()
    https://git.kernel.org/netdev/net-next/c/1dbefd578d8b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



