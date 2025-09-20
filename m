Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC529CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 00:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJ6B6mlIFjX/lkPTcOY32q3VFDcG4QkNDocDx1ZVeTw=; b=w3mDV0NF2SzwZKBv/PG114oZNk
	7sLrRmCneA/Zzpk9imv/HpeUqIsXcauczG/QCROr6ngQMr68IaQi9DyW7IRkWsHjzv9TRbMNl1Czb
	TwX2rTOj4XFEaOR300cwDWrkFIo+yXy8R/5qnqD3o96S+cXtd2O1vrRj3lDvUR+47E0nRfA9wfMj7
	BLCTAobRrN1IKR3rpjpPGU+VZCKvG9wqZbi7OyaqVBZMavwjvxpBPmsDM/DPkM+Km3O7mk4AGuqoF
	HY8l8SyBdl8AyM5juImx3oGnnz/IikWpIMnNuB/CsWPch5F+hHnbBKtJ/daesU3W3oVEyS3LVBv1p
	uTDQAxSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzlB2-00000004Not-3N56;
	Sat, 20 Sep 2025 00:10:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzlB1-00000004Nog-2vTD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 00:10:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C7BF46019D;
	Sat, 20 Sep 2025 00:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76931C4CEF0;
	Sat, 20 Sep 2025 00:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758327006;
	bh=JkPWbXg69iqhHJ900MWi2o+UGPJDKtEJ6OfUOR2VnvU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=O6o/BW0f+45gy85lsSLjU/GGU1Ffl/8HM1Hzm3G6DtcQnrAitBE5cylJWjovMWmd2
	 wodY0mkQFvBGjUNoXLW1szKmFA7pRRGitzepybn++o8eggPDz610EuRWH/wLDM2xHL
	 9e24r09owmVp4Y+4zq2ZzETxFMxerIMWbyP6ORsbPndLvZMpiCXim7AnGYyLglEDZF
	 dw7iDFdcFXT8BKiNelca1APnGtfdKQk8DMW5tXuulsMMw3bSq9wJ7jFK21DWkJZMz1
	 97ijZXCoES4sZBqRc7NBtVUcMeqg5PD4W4KhC60gv0M502895rRuGZTC6wPklKvEC3
	 jR8F4T1xEkRVQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB07F39D0C20;
	Sat, 20 Sep 2025 00:10:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: ti: icssm-prueth: unwind cleanly in probe()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175832700584.3744610.12963791321568877888.git-patchwork-notify@kernel.org>
Date: Sat, 20 Sep 2025 00:10:05 +0000
References: <aMvVagz8aBRxMvFn@stanley.mountain>
In-Reply-To: <aMvVagz8aBRxMvFn@stanley.mountain>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: rogerq@ti.com, danishanwar@ti.com, parvathi@couthit.com,
 rogerq@kernel.org, pmohan@couthit.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 basharath@couthit.com, afd@ti.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
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

On Thu, 18 Sep 2025 12:48:26 +0300 you wrote:
> This error handling triggers a Smatch warning:
> 
>     drivers/net/ethernet/ti/icssm/icssm_prueth.c:1574 icssm_prueth_probe()
>     warn: 'prueth->pru1' is an error pointer or valid
> 
> The warning is harmless because the pru_rproc_put() function has an
> IS_ERR_OR_NULL() check built in.  However, there is a small bug if
> syscon_regmap_lookup_by_phandle() fails.  In that case we should call
> of_node_put() on eth0_node and eth1_node.
> 
> [...]

Here is the summary with links:
  - [net-next] net: ti: icssm-prueth: unwind cleanly in probe()
    https://git.kernel.org/netdev/net-next/c/5fc7fa743dbf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



