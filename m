Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D65FCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 02:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1CAotGB+TzON5KGBcCB8oifZXWUcbHEN6IwcbuSBxU=; b=1uSpQzuH/bSw/RHkqIHXN2aTxh
	M4nulbbFKAz3wGcGa4fOUwhx/DTxuFkwDsf1ccHSjGO3gYlbD6Mrsgodak0PO76aTMGJHNd3Bc5ce
	RlzUxWVKkZEQSRq7Swg0oeLVXF2zoiDVT64tJ9izeuatx7urWcmWhVWyBEqTqvBGcWwZUSf/wvf42
	v0h26S5sFRGBftijGHa1aPAbU18rYRnSc5qBi8NfGh4eh8+fbjacRKDYHaz/7AcresJmJGxq2f+j5
	755IqF3vazx/xS+1LL3gbN9QPStkf7tMjigkgCFdMbajJN4K94gQ5ofwf2PIfX8Hw01R1MFD3m0B2
	f0hGZwEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLWX0-00000007uUI-3w48;
	Sat, 09 May 2026 01:31:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLWWy-00000007uTn-3wiz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 01:31:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8DE9C443EF;
	Sat,  9 May 2026 01:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69FDBC2BCB0;
	Sat,  9 May 2026 01:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778290259;
	bh=8VtEfOq4+3Bu5H/tOFNf85i6LoitYdZqgbNIwepkvBc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SeX+V58iSa605oQODWnG2AYPykzxP+8Y9Uf07NJ/ZBhUzOVlZHrb1myLf+eJnejsx
	 vPdqpCaVyp4FCx0ZDh364iYWq4iRUxY/SrgOgzX9cIc353lRVWIaPWRY8NcM6vv9yg
	 KouyY1eTEVaFKiJp5rYdjB++KLMZk13N2q5tx/ed4QTbkBoYeKXPBpdD/WzD1GBuVS
	 IWZXPgX745cte4XQNnott+XnuhlWfiskp/dLI2Pntj4PMT5uS2wU0AvHNjwqzmJcRa
	 8pFuNZFRMZp51HeLzJUVBwf6315Z4Ls+xVSkfHhNL8t51PN3sLj/E76C5zD85oukBS
	 oMn7uTq2uFdew==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02CC238119E4;
	Sat,  9 May 2026 01:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ti: icssm-prueth: fix eth_ports_node leak in
 probe
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177829020754.925974.10822695616677362142.git-patchwork-notify@kernel.org>
Date: Sat, 09 May 2026 01:30:07 +0000
References: <20260506195813.641610-1-shitalkumar.gandhi@cambiumnetworks.com>
In-Reply-To: <20260506195813.641610-1-shitalkumar.gandhi@cambiumnetworks.com>
To: Shitalkumar Gandhi <shital.gandhi45@gmail.com>
Cc: danishanwar@ti.com, parvathi@couthit.com, rogerq@kernel.org,
 pmohan@couthit.com, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, andrew@lunn.ch, horms@kernel.org,
 dan.carpenter@linaro.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shitalkumar.gandhi@cambiumnetworks.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_183101_008278_C4635D1E 
X-CRM114-Status: UNSURE (   8.70  )
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu,  7 May 2026 01:28:13 +0530 you wrote:
> The error path on of_property_read_u32() failure inside
> icssm_prueth_probe() returns without putting eth_ports_node,
> which was acquired before the for_each_child_of_node() loop.
> 
> Drop it before returning.
> 
> Fixes: 511f6c1ae093 ("net: ti: icssm-prueth: Adds ICSSM Ethernet driver")
> Signed-off-by: Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
> 
> [...]

Here is the summary with links:
  - [net] net: ti: icssm-prueth: fix eth_ports_node leak in probe
    https://git.kernel.org/netdev/net/c/6635fa84403c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



