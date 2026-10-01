Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49DDCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 00:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNfChoSajGhfWOPVeoF7VAoXyvssorcmQEafSm+VYUo=; b=HMPP3J15nwRr9OFszlY8y83BrQ
	JXFRdIOanPZgjUSDwCwGykBC3qArIeeH7Z+dqF+WNpUeZZnU9hnvqAi6ES7e8PmbM2mK8FZciZrsM
	A3MzIQVixymKVNOtO8Zr7GPj0SJZ+AzVlz5Zz4BvbKyg/UGlXIlP7WHm0Sq54B5YuuSxx1LIK1JZL
	LgYEO+dJzSHq/2HyByeKEDY3eGkxHoFU4XZgZWwqH/L5Iv9fIFbs0cWZrkd4looBf1m9M25Ziz5gn
	wB0R4oAVZJ1jFwmGeS7w0gydXx9YV2ygtETl3XvAMcbJSoKmMftZ9QZTGdhV63cGC5+dWlHXN/MjL
	NAiS+P3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC4Dg-00000007UK5-0Bz5;
	Thu, 01 Oct 2026 00:00:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC4De-00000007UJv-2m34
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 00:00:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 92E3C6057A;
	Thu,  1 Oct 2026 00:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 447D61F000FF;
	Thu,  1 Oct 2026 00:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790812813;
	bh=pNfChoSajGhfWOPVeoF7VAoXyvssorcmQEafSm+VYUo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=bcf1pbfwcWcawFJkZIGjRvaUURr/Vo25kHP7x6cJMv3xItSKFrfqw/Y99eYkWpeKf
	 7gZb4Ke2Ks6JgzpZm+5vHJxt4YaKup7sgtu9DjSEvNgAKaI0WO10JQnHjzdY0+mpyd
	 uMy8Ttusc9aHg5fnW935ayV580xSpfS8qxonrQ3XLVLLVudMh2MvwkoMk9CIqRO+o5
	 1igTcgkGAHEW3p1F8lIlgH/J/HeEXdPefghrpUfPLTNwepgU/ilGq6JocooAoUZJPg
	 GzRQEQ8PMw4Y8tNLo05aEwj3RuUQm770ZQ7VZrPo+RVQgRXNBlcl5tjfYTh1NbJOH9
	 JQjOvNG+P0CKA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A3E03AA6A61;
	Thu,  1 Oct 2026 00:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v4] net: stmmac: do not keep the new TSO MSS cached on
 mapping failures
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179081281177.2182141.16737247267026791615.git-patchwork-notify@kernel.org>
Date: Thu, 01 Oct 2026 00:00:11 +0000
References: <20260928123422.1698785-1-xiaolinkui@126.com>
In-Reply-To: <20260928123422.1698785-1-xiaolinkui@126.com>
To: Linkui Xiao <xiaolinkui@126.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 xiaolinkui@kylinos.cn, stable@vger.kernel.org
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 28 Sep 2026 20:34:22 +0800 you wrote:
> From: Linkui Xiao <xiaolinkui@kylinos.cn>
> 
> stmmac_tso_xmit() fills the MSS context descriptor and stores the new MSS
> in tx_q->mss right away, but the descriptor only gets its OWN bit much
> later, right before the frame is handed to the DMA. Every error path in
> between - the dma_map_single() of the linear part and the
> skb_frag_dma_map() of each fragment - returns with tx_q->mss already
> updated while the MAC is still programmed with the previous MSS.
> 
> [...]

Here is the summary with links:
  - [net,v4] net: stmmac: do not keep the new TSO MSS cached on mapping failures
    https://git.kernel.org/netdev/net-next/c/6b76e4efe73f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



