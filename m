Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D26C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 00:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZidAeh6e3eIpLoC1QaSjbsnbqROAERMOR/OKSDCyzE=; b=eyNPAY9xQGf6/RRXVTIuZ6JIbq
	lyZFzXQ4yA+nJgVr/4k554ONj2zJBtjLXcTffhXovDr2q/jUwyBwaxVBu0h97paGxJcJUh3b0aO4d
	5gpcTy4bMB/BLz3T1Nu8woAxmo4kCQ5jlmVk94B1IsLQTGB4AoryfAULKHHrtJOFMj6BHhBwHE4b/
	247XXwji1g21bckFX3SB+WA8cgm9wOQRmYfHuI4j4wsATFcLCV9uWLKj4IFPz8tpI1CInbtQapq88
	g2ymw73jG1T2APq3ZEbtIuQDR+qvBdyOTTojBB+72Xap6g8gFKn4QYo+aEJCmo0KPji3Hnl8iKK1x
	mzh7236g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqM0e-0000000ChjG-4BvT;
	Fri, 07 Mar 2025 00:56:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqLug-0000000CgV7-3rqH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 00:50:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 29C5A5C5AFC;
	Fri,  7 Mar 2025 00:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1166C4CEE5;
	Fri,  7 Mar 2025 00:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741308605;
	bh=k+QGs8UJazLvwtaSasdsV2fYOGm2zy64SGuQoDxyQqg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=a3q+bQgc7pQM+7XfeDpWgiRv8eL0ZlvII6KhdWJZDaachKhuGfMOpnaC2+TmfxH7I
	 MtiTttWHCGD73I0njm4+BvEljdRtd/2+xsOzrbMYpSBubI2sfBNUpBNt166bjxHaPQ
	 k5TAXd2okviQiArRXAhy3jVvI6dOUdqS6SJ73LpEFxngQTE3bI5ao+UULZTL/NLHok
	 ulgYjuQEh/0hgyESuom8GJmX9Ejo7VjY43kMyoG2gu+7HmWGFhah8n3V4Qiu7jBC2P
	 fuT7P8TjYkR+Pawm3F6hDi36CM/iS0ImItJWrPqGJ5stx82Uq12gBZkgcXXegxBfv9
	 MU9kAjBhZmBlg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C61380CFF6;
	Fri,  7 Mar 2025 00:50:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: simplify phylink_suspend() and
 phylink_resume() calls
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174130863899.1835493.10259048343165526348.git-patchwork-notify@kernel.org>
Date: Fri, 07 Mar 2025 00:50:38 +0000
References: <E1tpQL1-005St4-Hn@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tpQL1-005St4-Hn@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_165007_017566_2D7D50D3 
X-CRM114-Status: GOOD (  10.18  )
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

On Tue, 04 Mar 2025 11:21:27 +0000 you wrote:
> Currently, the calls to phylink's suspend and resume functions are
> inside overly complex tests, and boil down to:
> 
> 	if (device_may_wakeup(priv->device) && priv->plat->pmt) {
> 		call phylink
> 	} else {
> 		call phylink and
> 		if (device_may_wakeup(priv->device))
> 			do something else
> 	}
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: simplify phylink_suspend() and phylink_resume() calls
    https://git.kernel.org/netdev/net-next/c/f732549eb303

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



