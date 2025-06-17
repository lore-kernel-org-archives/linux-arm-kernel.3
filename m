Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0230BC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 23:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTxy/fO2byPhjDornIk9PVgz7A7fHQLR8Gt1w6oI848=; b=xj47NxwHE/b9wwLe5DdnNX9ZsY
	OqtMm5NarXye9jDMQ/ED4A9I4vjVyGfoGsh7vzCLZDz76B7b3xWhd7KPqwMempZvYXlRMywn3Dc5a
	QQBSCijoS+yX2gPeT4d9kJmZtTZ9JyCv7n7SGn+liBNdPMx1NMpMhBZmCfGMATyleS1LWR8uUPf0x
	U6edEjZycRyYwDwxXG7GhSCJ9He3bGa/Vi9gFff0NXs9PlHIXdHNP8HpgW7z02b2G7VXWXq6TVeND
	twZFIjn4+j5487CfCxMz23nIMRCEfg0l6avzkI/TAvaauj7cJLTnlWcxfxy4+tk++1cmR0YrN8Mxu
	Zcbhdjsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRfNV-00000008agw-1tBQ;
	Tue, 17 Jun 2025 23:06:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRfHg-00000008ZzZ-24mN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 23:00:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 52106A51F4B;
	Tue, 17 Jun 2025 23:00:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED55C4CEE3;
	Tue, 17 Jun 2025 23:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750201203;
	bh=eBnpcYHTpCSmU93N+2v6XceuO10N+zsU0JFmZnOplrI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BMal2/kG7p9adfLOYPsFlwx7QJcfAOR/JkzMnAEsvOTCyLuJg0BbFZ3Yhs+uc8bVZ
	 3qULv+TiUD5kWSaPW4zxoSkuuoSuUe25++naDUWIV54nGQjrvWsospg2xts38Q5pyF
	 Ot0ZnMOdXMIS8RIMJ5H6MtAIxgRFGdKpL0CeR18zpQX+ZlUBOtfNJ/cQgQTpRJ0P0B
	 36SKX0suGdi3objtJmAW2A5pcJ7LPLvVP8y+9bs5sGuGy2TjpcK7bxVhIzNxxZpDfX
	 DMTAbbFJVtifnOYfSyUIspcKUqLmr8PJ7KkKwqcULBhbFMqQOYwMzNuRBE7sl2uePG
	 DKDNQbYhAZq1w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADED838111DD;
	Tue, 17 Jun 2025 23:00:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: ti: icssg-prueth: Fix packet handling for
 XDP_TX
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175020123150.3727356.10882505957565617518.git-patchwork-notify@kernel.org>
Date: Tue, 17 Jun 2025 23:00:31 +0000
References: <20250616063319.3347541-1-m-malladi@ti.com>
In-Reply-To: <20250616063319.3347541-1-m-malladi@ti.com>
To: Meghana Malladi <m-malladi@ti.com>
Cc: namcao@linutronix.de, john.fastabend@gmail.com, hawk@kernel.org,
 daniel@iogearbox.net, ast@kernel.org, pabeni@redhat.com, kuba@kernel.org,
 edumazet@google.com, davem@davemloft.net, andrew+netdev@lunn.ch,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com, vigneshr@ti.com,
 rogerq@kernel.org, danishanwar@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_160004_606986_BAF469BF 
X-CRM114-Status: GOOD (  11.76  )
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

On Mon, 16 Jun 2025 12:03:19 +0530 you wrote:
> While transmitting XDP frames for XDP_TX, page_pool is
> used to get the DMA buffers (already mapped to the pages)
> and need to be freed/reycled once the transmission is complete.
> This need not be explicitly done by the driver as this is handled
> more gracefully by the xdp driver while returning the xdp frame.
> __xdp_return() frees the XDP memory based on its memory type,
> under which page_pool memory is also handled. This change fixes
> the transmit queue timeout while running XDP_TX.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: ti: icssg-prueth: Fix packet handling for XDP_TX
    https://git.kernel.org/netdev/net/c/60524f1d2bdf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



