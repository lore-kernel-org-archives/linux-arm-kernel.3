Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524FAD6CFB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 02:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jdt2KhH5OLcCL4lepF7+4GDNndnA41Sn5nG+WeXtnz4=; b=JJ6ejqSXoH6O7P9AlPU8DNU6/+
	RD5dC2McjnV87/poL7cDdlRCVkHVVzRa3ZW+5LOQbbClBodKtbU8u/hcW59t0G/m2EKsgteMmqUgw
	hTf5SitKB6jwl5LVCIOdkA3lyGToqSXSTfglSjaCr5wtP3VRyWs6ddSKSzn2S18sp1IQe9cwc1zKH
	+mYZgy4T+89eplXr+TtrvoZKAPsW9VRSJXEUktGwxjN40Q30BsgNsP2yFntN9+bJ8++B8xyD1ClWh
	LfazlREI/spbPqNENiKMMIgvU0Yhg8bWbJXL/ePCS+pjGtyQcoj70QQvnEAftJ8K96/a1KnjmUBp6
	k+o2SX/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj75z-000000083P1-1i7U;
	Fri, 23 Jan 2026 02:40:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj75y-000000083Oh-05yE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 02:40:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 288216012B;
	Fri, 23 Jan 2026 02:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBE9CC116C6;
	Fri, 23 Jan 2026 02:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769136020;
	bh=rYnv4zqtY0mBEcBw1/7t7CTHC/pA41/mg6zxkbHmxPU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=k+jWSwZ1eP5mqHx46Ett5/lsqxNiOQvUKebp39gWeNwTDWF+FbtqphuXqQfAhOznQ
	 y+d6HtrISdQBTWgG2viM4t07WWlSQjd1264x2g5I/Ykz7nDh/HW7H4tPjhEGdcnjxm
	 U3Lf8AFX9CRS1hUzcS/5SEf8ASUlTnzuFZZNcDsOTPH5Di026hPLQ9RFqsGtz4RdMy
	 chb6Z1E65xYv/WT4Z8I0S2S4MPWpXiKmFfGopDZPRHO4LugRq7H4KQVoNr/DIAopaL
	 nPWJcQlYgW9J4pHG0JKXGdiBbof6EK1MJ4VDLc1XKJlpmTViHxqYoEvaxuUDn9dayu
	 7xahaO4HWKUBQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4ED5F3808200;
	Fri, 23 Jan 2026 02:40:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/3] net: stmmac: dwmac: enforce preamble
 before
 SFD for i.MX8MP
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176913601709.2368645.17411798603536969153.git-patchwork-notify@kernel.org>
Date: Fri, 23 Jan 2026 02:40:17 +0000
References: <20260120203905.23805-1-eichest@gmail.com>
In-Reply-To: <20260120203905.23805-1-eichest@gmail.com>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, linux-stm32@st-md-mailman.stormreply.com,
 maxime.chevallier@bootlin.com, francesco.dolcini@toradex.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
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

On Tue, 20 Jan 2026 21:30:01 +0100 you wrote:
> This series adds a new phy_device flag PHY_F_KEEP_PREAMBLE_BEFORE_SFD
> that allows a MAC driver to request to keep the preamble bytes before
> the start frame delimiter (SFD) when receiving frames from the PHY.
> 
> This flag is set in the stmmac driver for the i.MX8MP SoC due to errata
> (ERR050694), which causes it to drop frames without a preamble.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/3] net: phy: add a new phy_device flag to keep preamble before sfd
    https://git.kernel.org/netdev/net-next/c/2153e151c27c
  - [net-next,v3,2/3] net: phy: micrel: add option to keep the preamble before sfd for KSZ9131
    https://git.kernel.org/netdev/net-next/c/fa1197a09496
  - [net-next,v3,3/3] net: stmmac: dwmac-imx: keep preamble before sfd on i.MX8MP
    https://git.kernel.org/netdev/net-next/c/dc6597fab3e3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



