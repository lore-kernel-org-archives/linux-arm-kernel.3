Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D49CFA46B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 02:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/QBXMxi4aTiF86gHeX+FCJpE6hjq2/kP7NQCC+c4KJo=; b=NE+mg5zY4NSV2FmBuUC6jisu5H
	WW+zZzuQKfMrMI9d0r4fHhB2D5nn1oP9a8dhnBtb903FCskBVzxHS+KUETBwaziDnpuKRSNhSteUS
	31xkez18ZM5HUkxLlF2mGQ8iH9Cqlj4wRByoDNbnizzcUu7jWMFQrQOO9jO/fGE59D/YIwB6iame7
	usF5lI0MyXXmhshLlJ8UU4kfOaQmmu8+Tr+CGDz51Y5iyqEYLb1QybrKkK0FBBWlwW++Wwmjd7QOr
	OPodjVY+ompme4Evk2G4ySjWcK822COZvrSvFaGQ/1jOh1EITaWhQcU03elsHXFV3yaTE4ra6K3vx
	cM4Yavng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMGbs-00000007gPS-1adC;
	Fri, 21 Nov 2025 02:10:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMGbp-00000007gP3-1ukZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 02:10:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 29B8843C96;
	Fri, 21 Nov 2025 02:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F68C4CEF1;
	Fri, 21 Nov 2025 02:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763691049;
	bh=kvQa++p6gglRftEUktn9riubSNfwD3W32cZEi9pBAWY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Twk/p/gYlYP/EAWT4XmRrWKgonGQLRZk4KA6jUI/fJ6FBAjFd3oAePormezFh4aqF
	 yYTovm5a3b3obx99AnDkhX+iIl6xdknkkqQJ4RDmVmFf1J+fbES1ATO2Uf/09y8oc/
	 /4PSNZf2OqOVJk005Vj7PyDkJ/ghko3Hu3cvkWTCjN7TC3EKD1yp9zgSkRAEOpHDvo
	 rK3dj3MFy/a2qMrFtB2aN2lX+KHvElo630SKk1mjt0JpbOJNCCmMZ+JqwcHmFuISu3
	 6LFZIl+eUCBIt0qVE1cp8I5KnMJipdNnJmFOAAzLfw5yhbHqmPn1GP63R3hQoF/3bK
	 WTYj4OE0xzPog==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3553B3A41003;
	Fri, 21 Nov 2025 02:10:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/6] net: stmmac: simplify axi_blen handling
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176369101402.1860510.18224805167286449640.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 02:10:14 +0000
References: <aR2aaDs6rqfu32B-@shell.armlinux.org.uk>
In-Reply-To: <aR2aaDs6rqfu32B-@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_181049_519009_2FB3ED5D 
X-CRM114-Status: UNSURE (   8.75  )
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
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 19 Nov 2025 10:22:32 +0000 you wrote:
> stmmac's axi_blen (burst length) handling is very verbose and
> unnecessary.
> 
> Firstly, the burst length register bitfield is the same across all
> dwmac cores, so we can use common definitions for these bits which
> platform glue can use.
> 
> [...]

Here is the summary with links:
  - [net-next,1/6] net: stmmac: dwc-qos-eth: simplify switch() in dwc_eth_dwmac_config_dt()
    https://git.kernel.org/netdev/net-next/c/f7ac9a0bbe3f
  - [net-next,2/6] net: stmmac: move common DMA AXI register bits to common.h
    https://git.kernel.org/netdev/net-next/c/8c696659f47a
  - [net-next,3/6] net: stmmac: provide common stmmac_axi_blen_to_mask()
    https://git.kernel.org/netdev/net-next/c/2704af20c8e5
  - [net-next,4/6] net: stmmac: move stmmac_axi_blen_to_mask() to stmmac_main.c
    https://git.kernel.org/netdev/net-next/c/6ff3310ca282
  - [net-next,5/6] net: stmmac: move stmmac_axi_blen_to_mask() to axi_blen init sites
    https://git.kernel.org/netdev/net-next/c/e676cc8561c8
  - [net-next,6/6] net: stmmac: remove axi_blen array
    https://git.kernel.org/netdev/net-next/c/efd3c8cc52bb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



