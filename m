Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB05E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 01:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkH0hWog3OUP5wVbo52jPlikYO2BLOJfEOqjSowtcv0=; b=3b8KfVIy/2vP1xpD3webUjad5v
	IRqryqFhnxvMWf6p849jxEczg5s/D4V/CVbZZE3//iIAt+tPEHoqdoZkHWUpwZBuGzXgfa821BHs2
	OyWyPRtcv67iBpljGlMdj6FRiLuTOUJLUrtdYY+uRTC701wdt7PCj0VpMgjJbM2pqWh7tnaX2+bOJ
	7/j9fi3n7GncwWXufhYqutuo2l20xV1Tpz7+xT12kIsuzIhDvvQnFpgWQeve10c2rbgn2jMBnenAr
	BzkZsJQouVxVcol/6ATVuT1csYI+qwQRcny8eVNr//96+XQN6vJToa12pSmEd/pUWF8yTR3RrUM/D
	SFkDuSxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tK6IR-00000004fsf-1VtM;
	Sun, 08 Dec 2024 01:41:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tK6HP-00000004fmG-0YSA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Dec 2024 01:40:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E27745C4B60;
	Sun,  8 Dec 2024 01:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455B2C4CECD;
	Sun,  8 Dec 2024 01:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733622012;
	bh=VyiblBiYlxn7Uc7Og93Odk9bRuYvCt+pFQYcjLF4aak=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FsUEyrDIc2ScY6FxH2CjAQDZ4naGABhNjTw5cFRzwDX6PCnQREtJYZKyrNLnHQS8k
	 wbFY7pli1+pGibZtL2W6TgPNrZbNCEtdfj3Pjt9rhKB9TDteEZ7vxK4wsPXFCpOjX/
	 0C2v/QAmDU90Sk850SOcKn63o1MZyzuK1w/snlL3GTKH7R5Vx5ARDHVgi9P6+Qns5a
	 f70ZQhrXO4PrDl2VEM858n6PF3TjNcMzKZror2MJyq4L0+M4KehUnsMIP4g3POK2FQ
	 STQbj27fCQxX9IasnwAoWofeBs5pgSa4UyoJ+vmskbwIWWMo+1hfFrzCpeDnWFlTtH
	 mVnjehQ56KCaA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE941380A95D;
	Sun,  8 Dec 2024 01:40:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: stmmac: fix TSO DMA API usage causing oops
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173362202750.3128634.12775021527593555165.git-patchwork-notify@kernel.org>
Date: Sun, 08 Dec 2024 01:40:27 +0000
References: <E1tJXcx-006N4Z-PC@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tJXcx-006N4Z-PC@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, xfr@outlook.com, 0x1207@gmail.com,
 jonathanh@nvidia.com, thierry.reding@gmail.com, horms@kernel.org,
 hkelam@marvell.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_174015_367059_F1013D26 
X-CRM114-Status: GOOD (  11.55  )
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

On Fri, 06 Dec 2024 12:40:11 +0000 you wrote:
> Commit 66600fac7a98 ("net: stmmac: TSO: Fix unbalanced DMA map/unmap
> for non-paged SKB data") moved the assignment of tx_skbuff_dma[]'s
> members to be later in stmmac_tso_xmit().
> 
> The buf (dma cookie) and len stored in this structure are passed to
> dma_unmap_single() by stmmac_tx_clean(). The DMA API requires that
> the dma cookie passed to dma_unmap_single() is the same as the value
> returned from dma_map_single(). However, by moving the assignment
> later, this is not the case when priv->dma_cap.addr64 > 32 as "des"
> is offset by proto_hdr_len.
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: fix TSO DMA API usage causing oops
    https://git.kernel.org/netdev/net/c/4c49f38e20a5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



