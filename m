Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32061EFCE43
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 03:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmlOcq9+FZnDPMD1cSoPpcAVCqsH0iDNDgFNTuPVsvk=; b=le7tcSjybn79UkOTaQbPVJET6h
	SVq3J1SrNo0Lz8baQMqu15Gdxf0YhUd3p7RPim/WYxUbsF3e0ZdmDflK5hc6dJF4KkJ+lMiVIDUvb
	4GCxzTbk9PzGtf4ay+eHOHMcSKqfgmIIwWfm9ZmIYC3D0FzWMRC9k8t4ktsRgew84inafMtLbdhBv
	ilB9QdJK/jcQ52TvnutznaVcY1QSsd+rKmgJcn9fnfaIxrN0a3fG5aw3xUScSqwLtJN/g+rZkj+WK
	cb3JrQz6h1Bsu2qFhEXDW7kI2ieqrpuxIvDuQkWeY/20ktR9YCSdJ6QsZTGXNyf2CE+O6K/M5MgHi
	AXNhuEQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxywi-00000000oU5-0Qn5;
	Thu, 05 Mar 2026 03:00:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxywf-00000000oTc-1cYi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 03:00:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C16E404DA;
	Thu,  5 Mar 2026 03:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70ABCC4CEF7;
	Thu,  5 Mar 2026 03:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772679611;
	bh=bi1pYv3Bgq+ShmDzGX+GwIzVgs550SZNCxuwrCsn5Zw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XKQSdhPxdqmBP2Ac+rDlVNGMBaCuZAwx7jzg/ZotPWi2eFf9gQYQCBKOmRJNUmWXq
	 g2U3tIzsNRK/2t8mrOCj9AMSueyYC+TWq28yY6D5DRjm6G8g8wvVbEVwDNnh/eYdko
	 l6o1U8khaB+tVZFlxUUjbn7R6VmKaS+2kPuRlLB1XbhXJXPYGGo8xSb1tXkSuYE5E6
	 Gth30+xotWb1C0xZB033o2BMfBcPRaQqCXYvsXgQxl7RnMzyIN8jnK1weviP5OKWC+
	 TR7MoX4WFI0qQPC8ecCF5x5mzjTJ837zeu4wONFRbHyUYqkyZ/TF531sf1BSAkAqoW
	 m/e+V7xwe49xg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02D543808200;
	Thu,  5 Mar 2026 03:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3 0/4] net: stmmac: Fix VLAN handling when interface
 is
 down
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177267961155.2494418.12039829007710678123.git-patchwork-notify@kernel.org>
Date: Thu, 05 Mar 2026 03:00:11 +0000
References: <20260303145828.7845-1-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260303145828.7845-1-ovidiu.panait.rb@renesas.com>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux@armlinux.org.uk,
 rmk+kernel@armlinux.org.uk, maxime.chevallier@bootlin.com,
 boon.khai.ng@altera.com, rohan.g.thomas@altera.com, vladimir.oltean@nxp.com,
 hayashi.kunihiko@socionext.com, boon.leong.ong@intel.com,
 kim.tatt.chuah@intel.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_190013_448375_FF271591 
X-CRM114-Status: GOOD (  10.59  )
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

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  3 Mar 2026 14:58:24 +0000 you wrote:
> VLAN register accesses on the MAC side require the PHY RX clock to be
> active. When the network interface is down, the PHY is suspended and
> the RX clock is unavailable, causing VLAN operations to fail with
> timeouts.
> 
> The VLAN core automatically removes VID 0 after the interface goes down
> and re-adds it when it comes back up, so these timeouts happen during
> normal interface down/up:
> 
> [...]

Here is the summary with links:
  - [net,v3,1/4] net: stmmac: Fix error handling in VLAN add and delete paths
    https://git.kernel.org/netdev/net/c/35dfedce442c
  - [net,v3,2/4] net: stmmac: Improve double VLAN handling
    https://git.kernel.org/netdev/net/c/e38200e361cb
  - [net,v3,3/4] net: stmmac: Fix VLAN HW state restore
    https://git.kernel.org/netdev/net/c/bd7ad51253a7
  - [net,v3,4/4] net: stmmac: Defer VLAN HW configuration when interface is down
    https://git.kernel.org/netdev/net/c/2cd70e3968f5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



