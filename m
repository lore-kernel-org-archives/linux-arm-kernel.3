Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516C9FD0040
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 22:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pDBJH4XTnA7gthrEXBCpeBZXInQMjAKJzk0GBLDuMiU=; b=ZdnuMnHgJbyVsWXALCDS8bBC/b
	yx3ffWk4E1kPuC2x471CpyW+w4sWaViXfNOFLL1zAv3RD+DOKvYgWDQs6USymkgOzqjO8qTIv3diL
	yUnH3szBm41iPokgyB7PN7dzcZWgZ5oM9KpSnjfuPt4gfvIPfiMcQZ0YVfPK/phfS38vJw9GfjDX2
	fPqsuvu7FjIs545yragLWA5yHsw2BOLlYjv+GAKvX+GY7CNhOYRMF2O53CGJELGcNgvWM9JaU13DJ
	1ZXK3V0xo7rtFeAIKjS+irt46e1DLpBQx3vAcTMaeM6AtwR7hEM2riejJ2usJVS6U59LxuyvCOmmh
	l8/8o9yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwSjl-0000000AKtz-114t;
	Sat, 28 Feb 2026 22:24:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwSji-0000000AKtG-2LbN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 22:24:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 60A5E43F66;
	Sat, 28 Feb 2026 22:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED3DC116D0;
	Sat, 28 Feb 2026 22:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772317473;
	bh=llnjNSfGxRyFGCgLYaB7FnkVfp7KlpDX31mcCMQUUHU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EDXJbExgKRsodDyd0oYabMAPqPcWDV+K6clMtXqS2fQ/AcUtxbCt8Z2OvFz+5r3pR
	 P2aT0Sn+qF/6aqkaR6PAxOOYtS7dILJYtx5tEFrxRkCXoxTYuSBxCeIeHLFZUtfkYk
	 0LeKX/UR4jlsywenrB6dtZcZRo+8V9hLoa+vRNFk03e0V18W2efL+bItcTbeMM7y2N
	 HFhoF2C+ck80YGauRN1Foxj7th/vmuo4O75xtuFO9q4bu76jsAzv9pEWSzxq78hZVc
	 TwfRnvDZAS8TPeeaMQdlyz4JR0OE3rwwdmZtv4swWG7nMi08zDq8c8Ub3oeXufEHv8
	 gFy7xwH3M7IlA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CF6139F2024;
	Sat, 28 Feb 2026 22:24:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ti: icssg-prueth: Fix ping failure after offload
 mode setup when link speed is not 1G
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177231747630.3111473.16483515662325090090.git-patchwork-notify@kernel.org>
Date: Sat, 28 Feb 2026 22:24:36 +0000
References: <20260226102356.2141871-1-danishanwar@ti.com>
In-Reply-To: <20260226102356.2141871-1-danishanwar@ti.com>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, m-malladi@ti.com,
 jacob.e.keller@intel.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, srk@ti.com,
 vigneshr@ti.com, rogerq@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_142434_620982_6D23A02D 
X-CRM114-Status: GOOD (  12.70  )
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

On Thu, 26 Feb 2026 15:53:56 +0530 you wrote:
> When both eth interfaces with links up are added to a bridge or hsr
> interface, ping fails if the link speed is not 1Gbps (e.g., 100Mbps).
> 
> The issue is seen because when switching to offload (bridge/hsr) mode,
> prueth_emac_restart() restarts the firmware and clears DRAM with
> memset_io(), setting all memory to 0. This includes PORT_LINK_SPEED_OFFSET
> which firmware reads for link speed. The value 0 corresponds to
> FW_LINK_SPEED_1G (0x00), so for 1Gbps links the default value is correct
> and ping works. For 100Mbps links, the firmware needs FW_LINK_SPEED_100M
> (0x01) but gets 0 instead, causing ping to fail. The function
> emac_adjust_link() is called to reconfigure, but it detects no state change
> (emac->link is still 1, speed/duplex match PHY) so new_state remains false
> and icssg_config_set_speed() is never called to correct the firmware speed
> value.
> 
> [...]

Here is the summary with links:
  - [net] net: ti: icssg-prueth: Fix ping failure after offload mode setup when link speed is not 1G
    https://git.kernel.org/netdev/net/c/147792c395db

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



