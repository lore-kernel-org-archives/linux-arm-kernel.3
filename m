Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05136C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 06:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6AlwPJawfpR3U+cdOv4RKE9YOMJZA+992VBpzHMSa0=; b=eEoSuBuzEQxJvcWA7GDIKENhiK
	RhjNAiaR7GV1xMqjGMdB+cugRYKhs0gNlevTaF5ZYSku/GHSqU4pk3gwbG5tGzdUnCSkMol4ijgdq
	PBEeGbdJWVx67sXJfamnZQHR9U/v6MXx8l8RzebeTCCO39W3qTua4mjOZLm6AOZEL0dgaulsMUgLG
	4Dk+6D2mTbZKtBiU6JUMNoivRExF3b6sATLVUVWmDlgbfmfhABQXAXK520NpXd0iJyeVgYmF3Xuab
	qkad4ewxSDvzH2SK9cE4RVYj732Bl5nGRxTNVU2xfWZLtNvsuLyE0iZtZVZ2STykqPySrTdFUbx5v
	b/i+7DKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJnr5-0000000A2YL-1dMI;
	Tue, 27 May 2025 06:32:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJnow-0000000A2SO-3pp1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 06:29:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E2F54432C;
	Tue, 27 May 2025 06:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB132C4CEEA;
	Tue, 27 May 2025 06:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748327393;
	bh=j4lf4jCkvu/xgxJtOXNOG+vFtHlCvFWj59WF2/DGwE0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fgxTFf4W2QKNuqEjxCZ3vcDQAw/YlAyIkEETdinVLn5hAC+S4UYByDJzMWqTNpUFu
	 vg3mKo51V7fF3DHIBIsNyRFeVY4Q4bbNQIplJkducPOFAESJvadUwLePt1nqm+2EgX
	 x5HNjW7joxvPwUQ2qI1uwqhm5SCydOzUOnVLbuzduHnw9klu6cSjK6WQDZauAvZwtn
	 3IOhN8F5OM9WTbQTYRjBLM4ttWtgc97es8KLXA/cu6zGF53g9rgw27QCrlcZEQCWIH
	 Bhhs2dGayCsY1P5Bx5gtCW0tuwFZ3rQEfU+PdxUTCHGOAJyausFp0BGyDvDrD5lmu+
	 kdkdXy/IEs0iA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CF7380AAE2;
	Tue, 27 May 2025 06:30:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: xilinx: axienet: Fix Tx skb circular buffer
 occupancy check in dmaengine xmit
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174832742825.1178251.17763156769981181807.git-patchwork-notify@kernel.org>
Date: Tue, 27 May 2025 06:30:28 +0000
References: <20250521181608.669554-1-suraj.gupta2@amd.com>
In-Reply-To: <20250521181608.669554-1-suraj.gupta2@amd.com>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com,
 sean.anderson@linux.dev, radhey.shyam.pandey@amd.com, horms@kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, git@amd.com, harini.katakam@amd.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_232954_969725_FD7674DD 
X-CRM114-Status: UNSURE (   9.22  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 21 May 2025 23:46:08 +0530 you wrote:
> In Dmaengine flow, driver maintains struct skbuf_dma_descriptor rings each
> element of which corresponds to a skb. In Tx datapath, compare available
> space in skb ring with number of skbs instead of skb fragments.
> Replace x * (MAX_SKB_FRAGS) in netif_txq_completed_wake() and
> netif_txq_maybe_stop() with x * (1 skb) to fix the comparison.
> 
> Fixes: 6a91b846af85 ("net: axienet: Introduce dmaengine support")
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> 
> [...]

Here is the summary with links:
  - [net] net: xilinx: axienet: Fix Tx skb circular buffer occupancy check in dmaengine xmit
    https://git.kernel.org/netdev/net/c/32374234ab01

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



