Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C2FC55182
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 01:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VkGB+ach/sz+Qx+EPBIcvK5HnXNIKV8FeEl8ovVVHWQ=; b=gLcfLXTuQc8Nm3CTCccH3VYrEf
	B3t8zF9/yO+7ILfzWkanrcYq1iBPp0zBm4XjWg6Dh8I5NXp8LCifwQHmVG5sZBhEUCUDPbrnhbcdc
	FJDpOQtSyWD7eRRJAHQ7Vpywso1jJCWiEcc7LonR1a6PfdBYervVUg5Ry2s0XBxbutQ9UzAPMYSmF
	ODhRwgrtU3/Nq8a8im+zMB68QQO0h6rDqhe3oYaruH5VVCrUVaNFCQKmfFkwH1Xix4VGmVJl8Bh9x
	mSRQ3pr/BSlWW67r/p+yb/UE7wt16/AasrdpDahwi2KAtxs/0s8WrMLsBwQzH4IvTZJW6hPZ7aALy
	dGwRJFYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr4Iy-00000000nvn-3JzW;
	Tue, 04 Aug 2026 01:50:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr4Ix-00000000nvd-0d2v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 01:50:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1752A60A73;
	Tue,  4 Aug 2026 01:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB8461F00A3E;
	Tue,  4 Aug 2026 01:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785808253;
	bh=VkGB+ach/sz+Qx+EPBIcvK5HnXNIKV8FeEl8ovVVHWQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=FYTO2P35L7Sn/+YlXU5FkfKEUk1AZSeAEwrEC8GS7KyljQ96g+58XUXnS7k4A52A7
	 cV5D3U1AbMbv/o8Krk8vQMJgK5CJIr6eBLzBubwC7R1S4YweEGtA5R0CQu6imHBRND
	 RYJouYUwh5w0x+jqvRuojhxPPoU3TtygekF2Dhm2lg2le8kgedd3bdQCAg3NP5L/9A
	 V8sUKZIGkHQDQW9mPmK/NUM23JK59E+FOBle6Qej1u0crIRiyq8Kw1gDm4hC7CVAn1
	 +oYvTMx3bOe+0uPE1IOA7IRsMBO08US9GTT928ghWdimV5rwcqfdnmFZCM/dMb+CL9
	 nOk5Y+mVqE8gg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0BEE3924467;
	Tue,  4 Aug 2026 01:50:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/2] net: stmmac: Cleanup rx coalescing
 computation
 when using RIWT
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178580821438.2913307.10017683576948175054.git-patchwork-notify@kernel.org>
Date: Tue, 04 Aug 2026 01:50:14 +0000
References: <20260802114015.214212-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20260802114015.214212-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, thomas.petazzoni@bootlin.com,
 alexis.lothore@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
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

On Sun,  2 Aug 2026 13:40:12 +0200 you wrote:
> Currently when configuring interrupt coalescing on devices that relies
> on the Receive Interrupt Watchdog Timer feature of dwmac, the
> computation of the RIWT timings leads to off-by-one values when
> reporting the timings back to userspace.
> 
> RIWT works by arming a watchdog timer upon receiving frames with the RI
> bit not set in the descriptor. The timer duration is expressed in units
> of 256 stmmac clock ticks, and therefore requires a bit of computation
> to derive it :
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] net: stmmac: ethtool: Comment the magic numbers in RIWT computation
    https://git.kernel.org/netdev/net-next/c/b6a89c8ef34f
  - [net-next,2/2] net: stmmac: ethtool: Address off-by-one when reading the coal rx-usecs
    https://git.kernel.org/netdev/net-next/c/ae88f78bc4eb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



