Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287DFCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 01:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZZYVdmG1wgRg2kMjwjTShW0GgJR6NYKRTUj1rdKukE=; b=d/RxfYJdhFqLHu62rSPdMyT0lD
	mtqndE1E4/AleGqk25zh0MiqAi5gtqlSVImDuz8bZcOHCaBhe/LPxYQwZnp8Ps8Whyb3bvREg+0uU
	pJ68KCeJloqFcuFIXTfHiBbPkTFAwUDL88gqA7WL8zJHCBG4xJQ/F0TjeDLP8RDbTRSNlbeWlUH0H
	yIQ213oWuVzC4QXRbNHIJxX1n00dMZwapSBwxfqi4Cn/X3obX21DnN0e5HovzrOmYjGbJe6TJoHND
	fDsu+gt3QcOi3mkGLM39No1MshLKhjkZdawA6el3IOljXMuSklFFN8A1n3ZWyv3vqVeQ6EAHConrb
	udnxisdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umj2R-000000011Sw-00B4;
	Fri, 15 Aug 2025 01:15:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umidq-00000000x3F-1LZM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 00:49:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7F6F1A579D0;
	Fri, 15 Aug 2025 00:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B1F1C4CEED;
	Fri, 15 Aug 2025 00:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755218997;
	bh=eBjfGJFAIB9PNSuG226jlmZoI98zEZdasUPmN3XCETk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ttth/RDTtdSmxz2nATU/O9UwTv9OrskOMAnAvixmPgts/tgloNF0ZJjkPfwX+9M/6
	 DcopTv5J4Pn9CnOWr1qKO6YMgbDoBK20V4A+C5mcTJYfrKn+3IrPBfHyRG0ClnHA+t
	 WbcHNpjlFJZmC9eviHGZmW/G7N20ZSI/2p4xMwnLmkmQi0GRyuOHvVe/ixoQhpXXii
	 gMbz7/Qh++9s1kTHTNt2HnPD7gBo90HJb4m6VqVciJcoG8MvHXLYiCYRojQGpafzWI
	 G6UUS0va9Tct7vP7srXgW2iyQ9xrjAROa+WZE3VwdgXfvaZchXUtPGMMrKg07BfOER
	 Ur6/Ww7CIaQtQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id A518E39D0C3E;
	Fri, 15 Aug 2025 00:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net V2] net: xilinx: axienet: Fix RX skb ring management
 in
 DMAengine mode
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175521900824.500228.10283078380078516780.git-patchwork-notify@kernel.org>
Date: Fri, 15 Aug 2025 00:50:08 +0000
References: <20250813135559.1555652-1-suraj.gupta2@amd.com>
In-Reply-To: <20250813135559.1555652-1-suraj.gupta2@amd.com>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com,
 sean.anderson@linux.dev, radhey.shyam.pandey@amd.com, horms@kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, harini.katakam@amd.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_174958_424767_7D23A5BC 
X-CRM114-Status: UNSURE (   8.15  )
X-CRM114-Notice: Please train this message.
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

On Wed, 13 Aug 2025 19:25:59 +0530 you wrote:
> Submit multiple descriptors in axienet_rx_cb() to fill Rx skb ring. This
> ensures the ring "catches up" on previously missed allocations.
> 
> Increment Rx skb ring head pointer after BD is successfully allocated.
> Previously, head pointer was incremented before verifying if descriptor is
> successfully allocated and has valid entries, which could lead to ring
> state inconsistency if descriptor setup failed.
> 
> [...]

Here is the summary with links:
  - [net,V2] net: xilinx: axienet: Fix RX skb ring management in DMAengine mode
    https://git.kernel.org/netdev/net/c/fd980bf6e9cd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



