Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913AFD637DF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 04:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KEhUSHleypyPLGz1+VpNrjtsebzXWGHdlp1pAD1cCm8=; b=HGXrg6NEwG24+xgAkUgiXuroDV
	CF506+Gr2kigtkErajkcD9ILuk9SOSEvYKIBy4bqLCK8/8AlbKxVumOCkrkbqTur4ampG8/YeapIV
	4OboOba1AJWEkSTNlr6BkhD5W69SVJa+cg/rII0CQxfqVhkmhUBltqPrnVoZ1u0s/nXKAEAsQzUOF
	tkWmjAbU1P+eukX8qKKjgIv0URdejGVFrtKykKbJXb2ozejHqoG6cNci0FHPhFRx/ohQCb7JWO+40
	5xnJG3k+198tSsR+qn4jCY7+dh32wlGizNcHenEWBc0qMEIU0Ep1UdXVETHaINZ5CcnWRHVzNIfa5
	EONX2Tww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBR5O-00000008iz8-1Ayy;
	Thu, 14 Nov 2024 04:04:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBR1n-00000008iMi-2OHs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 04:00:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A947AA41305;
	Thu, 14 Nov 2024 03:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 893A6C4CED6;
	Thu, 14 Nov 2024 04:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731556818;
	bh=PnNfyH7oj2zLbHLnS0rQSp9amgAB2vTxjz+mg5/8YQ4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gDfaDJzAMh+THnR6WKVi24HDZx6aSgpYS9mtgYKufIKyrOA4B3kxpfeAhZ320BBmU
	 3meMYIw2AQy73alGMq1QN5PLrzzf9yzOr+DisUwlHqbY3spq4m+iyfEpnqcQQ1Z/Y6
	 kvxmPCULxZpTRi+86oYG0wtHAFEZaySUtS5cz+iVA13jv0TAARVx2h7DLmwsqe+7/n
	 9+IdKnHlaqVsOKrbqzrV5w+nrA5ZEsjT/AIGmZFW9FuDI/E1AYe8pu8H6M0CfmXoI0
	 n55gzKLKwhI5F9IqNqlStr7f68bjy8iyYerXA1DOc6eI8OFYM9CTVJQfH0mjtNqgoz
	 cVePidPqpyyvA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 346383809A80;
	Thu, 14 Nov 2024 04:00:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2]: stmmac: dwmac-intel-plat: fix call balance of tx_clk
 handling routines
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173155682899.1476954.2028843277597147808.git-patchwork-notify@kernel.org>
Date: Thu, 14 Nov 2024 04:00:28 +0000
References: <20241108173334.2973603-1-mordan@ispras.ru>
In-Reply-To: <20241108173334.2973603-1-mordan@ispras.ru>
To: Vitalii Mordan <mordan@ispras.ru>
Cc: alexandre.torgue@foss.st.com, joabreu@synopsys.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, pchelkin@ispras.ru, khoroshilov@ispras.ru,
 mutilin@ispras.ru
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_200019_866626_BA89F95C 
X-CRM114-Status: GOOD (  11.19  )
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

On Fri,  8 Nov 2024 20:33:34 +0300 you wrote:
> If the clock dwmac->tx_clk was not enabled in intel_eth_plat_probe,
> it should not be disabled in any path.
> 
> Conversely, if it was enabled in intel_eth_plat_probe, it must be disabled
> in all error paths to ensure proper cleanup.
> 
> Found by Linux Verification Center (linuxtesting.org) with Klever.
> 
> [...]

Here is the summary with links:
  - [net,v2] : stmmac: dwmac-intel-plat: fix call balance of tx_clk handling routines
    https://git.kernel.org/netdev/net/c/5b366eae7193

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



