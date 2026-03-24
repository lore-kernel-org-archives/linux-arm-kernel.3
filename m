Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBC7E9A76E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 11:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWV5YjD+mRXXUbUqgNtr8b6RZzLgdPPLGtJ5aH1U1WE=; b=0sgPBDujb7Ddzo6TisTzTubusU
	8mHpoLj0+QBOfX2T30mSObYp1W5hknnwu2ZvrtasEZun+ZQVvthincz02KN1lxPAR0wtKZqS6H5hm
	/LdhuCUMJW6Awp+rerPR53rP5s+Zibxg7ujC77dhgvM2+y6BGVPPj8soEfVG08KPGlZ6jisEQFyjV
	tuVO+a1tC9i/F0aNdg8FeELE/lNQkc+u8yl+BgsTSJr+fBIqlpK/occyb658L5N/pGS5/nfkhhB9y
	FG2facT5h8vzpzkeri+yxsUhpN5rdzF9e0PDrutKaMvtJ5zfVurIc0EmsOGbQiKU2RKxdKSqIuvMs
	hJYsoWDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4zoC-00000001H5w-2pnA;
	Tue, 24 Mar 2026 11:20:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4zoA-00000001H5a-039n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 11:20:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E6E943AFF;
	Tue, 24 Mar 2026 11:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23EFAC19424;
	Tue, 24 Mar 2026 11:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774351225;
	bh=/VGB9nDd+/GqixMK/Q1YavpbNhgLz5r5U6tvuEB+cXY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=l/hgYGwPIylBRr2b7EK+ZSRcvcDiOQEreu0KBHfd+RJFFiPiQ0w8YDUyOePjCxDRi
	 hKmfDCq57RRCm4s8eBPIfQ4j2o6O1YqxmPGABv5cg178ckxxyYG7IJ2XnGKKYFpZyW
	 Qfo7s+2pH5TAjHr7CqAM4GKDe3zPUVpUORp6peyu0sA4y6W54URZCCjk27IovDdBAB
	 jK3BmoajfAu1505VN89k1ESTMTl1ffMr381p7NN5MgCMG3oK/KoqUAoiIBWqP0mj1j
	 zIA64jnsZX1rmfuOB/BfR4SVvY8ffIBuxSkhW3gWr7tBXphL3CTY1p4BmIOxmg4ckB
	 wUZ4cqU71qtjw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FECB3808200;
	Tue, 24 Mar 2026 11:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/6] net: stmmac: cleanup stmmac_xmit()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177435121274.629137.16512237981909489281.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 11:20:12 +0000
References: <ab15_JvLGFtUH_3x@shell.armlinux.org.uk>
In-Reply-To: <ab15_JvLGFtUH_3x@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_042026_075187_C2CBF3EC 
X-CRM114-Status: UNSURE (   8.28  )
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

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 20 Mar 2026 16:46:52 +0000 you wrote:
> This series continues on from part 2 of the descriptor cleanups, making
> stmmac_xmit() more readable.
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 103 +++++++++++-----------
>  1 file changed, 52 insertions(+), 51 deletions(-)

Here is the summary with links:
  - [net-next,1/6] net: stmmac: move stmmac_xmit() skb head handling
    https://git.kernel.org/netdev/net-next/c/fcbf106189aa
  - [net-next,2/6] net: stmmac: move first xmit descriptor SARC and TBS config
    https://git.kernel.org/netdev/net-next/c/cafacdc48a74
  - [net-next,3/6] net: stmmac: move stmmac_xmit() first entry index code
    https://git.kernel.org/netdev/net-next/c/7b8683115034
  - [net-next,4/6] net: stmmac: move stmmac_xmit() initial variable init
    https://git.kernel.org/netdev/net-next/c/2e3bfeb1bc0c
  - [net-next,5/6] net: stmmac: use first_desc for TBS
    https://git.kernel.org/netdev/net-next/c/557ccd54ba14
  - [net-next,6/6] net: stmmac: elminate tbs_desc in stmmac_xmit()
    https://git.kernel.org/netdev/net-next/c/cd1f306e2815

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



