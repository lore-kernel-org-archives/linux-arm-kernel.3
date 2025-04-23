Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D47C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 02:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bk/s+utPrZXk75jQplGP1iOy93j5gkzCAYoXYP0wj5U=; b=2wkxYgm1qqFdtus1MYiF/Df2mQ
	rjhZGltl6Y76J7tjWCe0Cz+A3CJjgQE/lwj57RUS/URqA+6/1l2gP0K+ikT4TyR9uHFgXW8l5E4if
	+IVASotVdUx2K1wk7cFRPB/GlydgBGz6qmsJQH9rdcSgTDbYeh1vj2yRQmCHNwohbZz9LVcq37dNJ
	7qwvdIc8vMp8PhSh6yUIVBr7SLzOEs5edT97tiUrpycO1J18fVGWbMdkbA2xGnv3zTUp3MdCBeIVY
	vKixOLrF5F6t9wk9TaqxZ5giKsqX7vf2xRkO7zTbzAjkFUm7yxts1YKKvZI2qaz0MFovNIx6dZel1
	8CLdJTmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7PkB-000000092Ko-2tUs;
	Wed, 23 Apr 2025 02:21:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7PiK-000000092FJ-2gN6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 02:19:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 67853614B8;
	Wed, 23 Apr 2025 02:19:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7268BC4CEE9;
	Wed, 23 Apr 2025 02:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745374789;
	bh=PmqJ5fbv0Mb9f8TlIqRagmhuSF46zrJ7usQ1IDVuaXQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nfcvWSodfR9C9TKP3Gi15gNNyd4MIUK7B2Qgrdtr4CpFYjzCYQ4dispyNAct3JVnb
	 POFVgOA6ZBsQ+tKt9hFpfCStJ5CIx8m4hzGp8+0C0kwB1tV7MsEZYLg/luOUrYBTpL
	 QPosVAOjBf37Oyco78m4AD8++24zmFkRTZGJ7L3w2QYNerdHHif1x9OXxR1yMfc+81
	 nHN2SM4gDqpigTm/TP1UcYnGZ40C8Z+FCPFVoIUpU4GZWHXdjsfE4TVlbQYQuVTch3
	 XsLTTIdWXqwBv/+6n0AVJJb7mkAdc3HzrP2UB3UggSZACiHBB3M//OL3TKq6DObdQl
	 tg+1dA4c7xIUg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D86380CEF4;
	Wed, 23 Apr 2025 02:20:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3] net: stmmac: visconti: convert to
 set_clk_tx_rate() method
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174537482800.2117251.2809618036505175108.git-patchwork-notify@kernel.org>
Date: Wed, 23 Apr 2025 02:20:28 +0000
References: <E1u5SiQ-001I0B-OQ@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1u5SiQ-001I0B-OQ@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, nobuhiro1.iwamatsu@toshiba.co.jp, pabeni@redhat.com
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

On Thu, 17 Apr 2025 18:07:54 +0100 you wrote:
> Convert visconti to use the set_clk_tx_rate() method. By doing so,
> the GMAC control register will already have been updated (unlike with
> the fix_mac_speed() method) so this code can be removed while porting
> to the set_clk_tx_rate() method.
> 
> There is also no need for the spinlock, and has never been - neither
> fix_mac_speed() nor set_clk_tx_rate() can be called by more than one
> thread at a time, so the lock does nothing useful.
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: stmmac: visconti: convert to set_clk_tx_rate() method
    https://git.kernel.org/netdev/net-next/c/21b01cb8e88e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



