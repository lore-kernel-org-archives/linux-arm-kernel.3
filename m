Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D88FC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 09:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MRJeClSzTsXd+vpIT+g1wHR3OXQZ/GfWxf+zQ5XPLEg=; b=WKMbp0Q0hwztZ1xB3vQ+lsr7Pb
	qB5mx62SDZ3EQm7knYqijcNpj7FG++6ZMqwKGxq1ZyKbQGwyI/Oxd/YwsGOPuCHCswW+h4fV5zMjk
	xij6Dc7lBAS+3pEfJsbeqjAjnCC4qbbFjtVrp5+pbLlVK6OcgLolyjnShjO3QctNtER1BFvSFEV1D
	kW1x/o3XfzpEX4yN2abjqjsQQ7F8JYAVWYDoSIVWzI2Rq7zGa+rlJHTzhsBnIuWTs+lCFcDaiMCgJ
	rraC+Jp+eZJNySjBmt8Xu9lzGHRBI+4HW0V4Kr7yAd80JEexxur8QYC419T0rrgNG8AxB687oCLx3
	h2NWv5ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3AQQ-0000000D9EX-0chu;
	Fri, 11 Apr 2025 09:11:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3AOa-0000000D8th-0yXI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 09:09:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E2869A4A928;
	Fri, 11 Apr 2025 09:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 211D4C4CEE2;
	Fri, 11 Apr 2025 09:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744362595;
	bh=6VnD0MPm4z7HbKIrJbYr9StRxLA9SvujgHNIYJ4TYBc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HJSTH6oG6BDrxeCL7BF0NekHosHOpetxnUp8beRbC/F3+drW98xQW5LKVkAxCY71c
	 P/jGHOYiFxGVhetwoBg2Ti3FqJOgEPUxcgzU2rbWX4q69XXrS/ad7Hf28L7kjizdzn
	 fXoxfwnsMS0IeiSJB+l/iZN7GtxxV7OVhtWNCyCXRLg2g9Bc8rZIE+lk5K2yRMBh+v
	 rBY4ytt6/lV12/BZVSmNkwqDeGT+yl0BXsKRTyYxtYNjwYzDcQWBN3gBfYYwr3dpdk
	 ao92avTf4P1IneuaRoPmAFwy9RS39eYPjTKDf4djeY39im+0SFn/XPOCr+H8tEUG/6
	 5NK4p7C/Y+HdA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADFE38111DF;
	Fri, 11 Apr 2025 09:10:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: stm32: simplify clock handling
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174436263279.184109.16205129107386423128.git-patchwork-notify@kernel.org>
Date: Fri, 11 Apr 2025 09:10:32 +0000
References: <E1u1rwV-0013jc-Ez@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1u1rwV-0013jc-Ez@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_020956_334545_D671C878 
X-CRM114-Status: GOOD (  11.34  )
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
by David S. Miller <davem@davemloft.net>:

On Mon, 07 Apr 2025 20:15:35 +0100 you wrote:
> Some stm32 implementations need the receive clock running in suspend,
> as indicated by dwmac->ops->clk_rx_enable_in_suspend. The existing
> code achieved this in a rather complex way, by passing a flag around.
> 
> However, the clk API prepare/enables are counted - which means that a
> clock won't be stopped as long as there are more prepare and enables
> than disables and unprepares, just like a reference count.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: stm32: simplify clock handling
    https://git.kernel.org/netdev/net-next/c/61499764e5cc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



