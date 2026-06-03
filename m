Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC006CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 02:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zslATiuQUoQ2ecIXBPpBnr1n5ssTXiki4SD5XB/9EKY=; b=BPtwjzPFrIIy9Q65ZN409JRz5i
	MMBRzQ1Pm9OK0gg+3NTtf6uS8YDi7Xua3AUywL5f/+qf1ZKsVzziwta3GZkhm3W11BN/bJH6yCj/Z
	OXw0ye3WagjxgoS1EPtze4dJEZhtvUIVyh8DNbw4j3UAnjX2BX2gl+gfdCqWBv5gssfwj1qDGfhAr
	VwCiaa/t5qaoPcfCXnOj4HrAO7MZX0fUeKFCI+W6yPU/HBYTly0EXF2yMmvMzE8WND9E6eHr3bIqI
	JKI+ozN3x9D6oBo7F/ENWpNWbtluas13KaONhRH19oIULmVl1YmYBWAOZwMbXPJtMGz7zokgWsxLf
	S0MNCHlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUbN6-0000000E6pK-2eMA;
	Wed, 03 Jun 2026 02:30:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUbN3-0000000E6oU-3RBA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 02:30:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 530EC43C7E;
	Wed,  3 Jun 2026 02:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32F161F00893;
	Wed,  3 Jun 2026 02:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780453816;
	bh=zslATiuQUoQ2ecIXBPpBnr1n5ssTXiki4SD5XB/9EKY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=X6YY1Z/Uq+hO232LGzWrVs4nQ8gGEE18O7LnEzsUclcqtvgD4sNPaa5sN+4VEyYX5
	 bI+0MIvg5I3yycNHcMjYwgxZA+7lum0MN8GTbww3vwteGP6Io/v26LYr5AEbD85dst
	 XRNUDKY1uvF219CscOiNn4EWYXqi2bnF9FaOMvxY52eTvAFMxOv9SEZSuN8t4RZSiZ
	 A0WjNTGUSqpYmfUcYe3m0LkVaBoIbOkyAimcTLTZSYqR5NwjTh+bvAnLV6Uj/ATG1K
	 E6vs13bugSzt5WsUuwZRFN7A27J29Z3qJk4I3rpfvAdAbGS90RZCr/y+FZn2uZJdxb
	 6RAnWW85RZEfA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1993C393003B;
	Wed,  3 Jun 2026 02:30:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] net: stmmac: Improve Tx timer arm logic further
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178045381764.1178989.10990235373154874362.git-patchwork-notify@kernel.org>
Date: Wed, 03 Jun 2026 02:30:17 +0000
References: <20260529064659.32287-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
In-Reply-To: <20260529064659.32287-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
To: Nazle@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	Asmade@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	Muhammad Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, maxime.chevallier@bootlin.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_193017_882136_CC4C3058 
X-CRM114-Status: GOOD (  10.52  )
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

On Thu, 28 May 2026 23:46:59 -0700 you wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> Calling hrtimer_start() on an already-active txtimer is unnecessary
> and expensive. Skip the restart if the timer is already active by
> adding an hrtimer_active() check before hrtimer_start().
> 
> Previously, each packet reset the timer to tx_coal_timer in the future,
> acting as a sliding window that delayed NAPI under burst traffic. With
> this change, an already-active timer is left to fire sooner, scheduling
> NAPI within tx_coal_timer of the first packet and freeing TX descriptors
> earlier.
> 
> [...]

Here is the summary with links:
  - [v3] net: stmmac: Improve Tx timer arm logic further
    https://git.kernel.org/netdev/net-next/c/edceeba4af3d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



