Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AD1C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 18:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pV0pRHkh85Ff9HhCfHZIfVEfYvyq5xEy/SHGr3RHpPo=; b=IIccD0dtWl9TTLQ+Ql1gVX+LIU
	AFyTPIQzT/WSi0hCxk9eSw5G476CQ497CNY63M7sSMca5xcyBBjNrbd46gUcJyfeSCVJBmYnvfcnn
	lh+LXs9DmJTYImgrXt3T48Wa/SI2JN52Jd+hczFD/0pPEch9XGB/T/WYqjI71XmjxjX7sCNk7W87C
	t5hOahszaLwImk0GgSR9GhYMndRD56wvgTD+7G7WnisaSS/mC+X1CLzmIuIsBGZlIKHeBQhLSS+Dx
	D633cLHOt9ASWtTx2de6zsHrR+3bu9gnE0vWMWBaeODmG3vWWezC8iQsGFAgbZ6dTDGYyd5roOZKc
	AwQ8GQ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyZlO-0000000HHcM-11NI;
	Mon, 24 Aug 2026 18:51:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyZlH-0000000HHbd-0pCP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 18:51:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DE9E36013A;
	Mon, 24 Aug 2026 18:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941DC1F00A3A;
	Mon, 24 Aug 2026 18:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787597468;
	bh=pV0pRHkh85Ff9HhCfHZIfVEfYvyq5xEy/SHGr3RHpPo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=WFLf23hNQ5ohUBMekPTltKccmu2Ttu0cj8vgkChvcUU1CirEJiZr+hDiawq4wbK+8
	 uVMuEGQtEN7sCXQfCYjFltc+eOeemsFFfmiP4Kh4pi4AwiC6uVyq66a93JXCVw277T
	 fgg5XVcpBkYAWSFZLieJ4TNffHjkjTdDd4VwZEKEQJbOowipesO8/rEBuawcdwNAIM
	 uhNl8xRoqV6sNZ/U9bIwaC8t5DkQq7xKQcCv4BCKexGjYTlglWCN2jEGG6bCxaGu68
	 wOA/EkHIxmFIfHmx7If0yywlSlP/yeIrdsl/AJEeoD9BTtjXEI8JnDDSeSVF+zsn0x
	 u7kJgZOlRH3bA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569B43924A4C;
	Mon, 24 Aug 2026 18:50:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: stmmac: fix device node reference leaks in
 stmmac_mtl_setup()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178759741588.3062482.17874707106135640490.git-patchwork-notify@kernel.org>
Date: Mon, 24 Aug 2026 18:50:15 +0000
References: <20260821055718.57-1-rabbanyhmm@gmail.com>
In-Reply-To: <20260821055718.57-1-rabbanyhmm@gmail.com>
To: Md Rabbani <rabbanyhmm@gmail.com>
Cc: maxime.chevallier@bootlin.com, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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

On Fri, 21 Aug 2026 11:57:18 +0600 you wrote:
> In stmmac_mtl_setup(), q_node is shared across the RX and TX queue
> parsing loops. When the RX queue loop breaks early because the number
> of parsed queues reaches plat->rx_queues_to_use, q_node retains an
> acquired reference count. If the error check passes
> (queue == plat->rx_queues_to_use), execution proceeds directly to the
> TX queue loop, where of_get_next_child() immediately overwrites q_node
> with the first TX child, permanently leaking the retained RX child
> device node reference.
> 
> [...]

Here is the summary with links:
  - net: stmmac: fix device node reference leaks in stmmac_mtl_setup()
    https://git.kernel.org/netdev/net/c/317fe168f4c0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



