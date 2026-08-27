Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3247C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 19:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4jIpGuvU/UsNaCaMDbLeLw5b82ZBqhbyFl1ubw748ns=; b=VRzhyLBGq/cc0qHgLg9Ad7dMib
	6IfzWIsN/w6GEy5DrK5oyFGF/Ryy8T+fj2dbcfiM6ZkVKq0Kue6cwvK28dyt0EK8Uvu+osPb0MmAy
	ij3osYFJwztoFabXn0v0qdCgSx5wKQlv5wF9tnmU7WgnUvl3R5Axynhe3iIkNi3uhnxfl3oSUhV2m
	Vsi1iodSJ59maY4IaZL0DgTXKx4gpR2GjJPrz7y+WqZz6ymWJCCthAtlxhrbVa9Cp4ptHD5C9SDiJ
	CZ8MCsoSTK7w9mvHnP75MVXoNcPrXv+DJVjwVW/ihszGdbJ0CGFcLNlHGDY4fXBihZOeUlL9dVSEk
	ffUdj/eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzfyT-00000004jGF-1BLX;
	Thu, 27 Aug 2026 19:41:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzfyR-00000004jFU-0Itg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 19:41:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 75A04601EF;
	Thu, 27 Aug 2026 19:41:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29D101F000E9;
	Thu, 27 Aug 2026 19:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787859678;
	bh=4jIpGuvU/UsNaCaMDbLeLw5b82ZBqhbyFl1ubw748ns=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=KsC/ztD0B+zlMuLKGcfxZNISNH2rF3UZjNVgTBjnnO3qc2vCaWnyY3wASrayAxOzE
	 F4JzolewCGvT6kZO3BB8GQRuxX3XrHwQsDk4Wnw3RB+IUeQW6ho89DpWkPRkAq2diD
	 JfK2yAsG9N6gZvUis/kSCnzurmz95tjAZhQ5NrYcC0KKbzUyHMiA76UQyNxzB1r3oX
	 iKznW8nCupvJaDHN45BUtMpswzvWidL0iqXCGOnosto66n+uQOOluNK72fkUglBNGS
	 6IP5MICqoLqRrXI/MjM6+68bwbjQjD50K0DQ/5HOMK3IX+pkJokBytD/Wma8k6kE6T
	 gNJ9KzgqiKdvg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D09663809A8D;
	Thu, 27 Aug 2026 19:40:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: stmmac: restore NET_IP_ALIGN in the RX DMA
 offset
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178785962339.1816627.16266435775453733564.git-patchwork-notify@kernel.org>
Date: Thu, 27 Aug 2026 19:40:23 +0000
References: <20260824125014.47862-1-PKneuper@dspace.de>
In-Reply-To: <20260824125014.47862-1-PKneuper@dspace.de>
To: Pascal Kneuper <PKneuper@dspace.de>
Cc: kuba@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 maxime.chevallier@bootlin.com, 0x1207@gmail.com, si.yanteng@linux.dev,
 larysa.zaremba@intel.com, aleksander.lobakin@intel.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 DBaldin@dspace.de
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

On Mon, 24 Aug 2026 14:50:14 +0200 (CEST) you wrote:
> Since the RX path was converted to zero-copy, the page pool page is handed
> to the stack directly as the skb head, and the offset the DMA engine writes
> at is what determines the alignment of the packet headers.
> 
> Before the conversion the payload was copied into an skb obtained from
> napi_alloc_skb(), which reserves NET_SKB_PAD + NET_IP_ALIGN. The
> conversion moved the headroom into stmmac_rx_offset() but did not carry
> over NET_IP_ALIGN, so on architectures where NET_IP_ALIGN is 2 the IP
> header now lands misaligned:
> 
> [...]

Here is the summary with links:
  - [net,v2] net: stmmac: restore NET_IP_ALIGN in the RX DMA offset
    https://git.kernel.org/netdev/net/c/23680bf5f8c6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



