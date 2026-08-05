Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEB1C55184
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 01:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tanJGOMFgccBzlCaqBOzJpMOkkSzoUZZ4+u7syZ88c4=; b=zHzCfOIUmTrukJRPAqSDUgKxRM
	il29j7AhzFrARN+kaClQYdaoc2G6EZdoeeRxYORu4vubu+tvcdxbiofEvSxMPJYj30I3XKEplWoca
	ITEWKE+/Ai8rz5XV3pZn95QlaY9F3Lw8uwQVNBx5gutF1cc2yrLRXkSB+rDnUIdOR0lgzZxmlk54P
	W4puNatTJnreOvm9QiI6QPe/6DcbwKNbJ4ulHEE9pWQwEG31YqBGACL8l0rQ7BbkULDFYMIxagL2I
	2jdbb7+sb+qep1V+A2/aEx36g1FGM40xlgbf5knZQQR5nRwGjw2k6ALQIKSOF+RPqXCM/82oUFSN1
	WJfjNlBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrQJT-0000000336h-0qod;
	Wed, 05 Aug 2026 01:20:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrQJR-0000000336E-2Gti
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 01:20:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ED02B41895;
	Wed,  5 Aug 2026 01:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE0C41F000E9;
	Wed,  5 Aug 2026 01:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785892852;
	bh=tanJGOMFgccBzlCaqBOzJpMOkkSzoUZZ4+u7syZ88c4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=hsYXvOiRMuG4uArviX7Kt8qnCS6+J3nhDWtW3ek2wtt4sWgnOerbnJyXir2IwGYAX
	 EsSeV64VFI3lPZ+8djB1aqXYUIrdx2XmDZf1sw4cyNjHtNOozAai66YbGMSBfw2gwp
	 crN14eMGNycUizlUt2pa8I8LYKj/bSbu2A5/B4D+Hbp2qb3hYuOGGRpLOfZjeg49ZO
	 CZdHGET8ziFxX0MNlibxR9pbKMtQ+IBdLN3EswwJSzg+CF1bPI9yxa3hy+zjuBbKci
	 1EuewEo553trBAjfADuJERMpHREvlaan6AUCM3O8ZYJJ2VZqa3hXd//doBmPqUVcwl
	 klyaGB9kXDGfA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568D93926666;
	Wed,  5 Aug 2026 01:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3] net: stmmac: resume PHY before hardware setup when
 opening the interface
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178589281289.3863162.5474751490038386802.git-patchwork-notify@kernel.org>
Date: Wed, 05 Aug 2026 01:20:12 +0000
References: <20260803095156.132827-1-stefan@agner.ch>
In-Reply-To: <20260803095156.132827-1-stefan@agner.ch>
To: Stefan Agner <stefan@agner.ch>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, rmk+kernel@armlinux.org.uk,
 maxime.chevallier@bootlin.com, j.raczynski@samsung.com,
 alexander.stein@ew.tq-group.com, ovidiu.panait.rb@renesas.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev
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

On Mon,  3 Aug 2026 11:51:56 +0200 you wrote:
> Since the referenced commit, changing the MTU on a running interface no
> longer disconnects and reconnects the PHY; __stmmac_release() merely
> stops phylink, which also suspends the PHY (BMCR power-down) when WoL
> is not enabled. __stmmac_open() then performs the DMA software reset in
> stmmac_hw_setup() before phylink_start() resumes the PHY again.
> 
> IEEE 802.3 22.2.4.1.5 allows a PHY to stop its receive clock while
> powered down, and stmmac requires a running receive clock for the DMA
> software reset to complete (the phylink config sets mac_requires_rxc).
> On such setups, e.g. the RK3566-based Home Assistant Green with an
> RTL8211F-VD PHY in RGMII mode, any runtime MTU change now times out and
> leaves the interface dead:
> 
> [...]

Here is the summary with links:
  - [net,v3] net: stmmac: resume PHY before hardware setup when opening the interface
    https://git.kernel.org/netdev/net/c/06232cb44bc8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



