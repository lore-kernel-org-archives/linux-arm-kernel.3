Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97ABAC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 20:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O0cXs0eAHuTrxmWFblyzUjMhvupO6dFK64gLCvypebM=; b=Upsb5jYeJmbfvRfqkgoQt52PEA
	l4ncQfk/5oKQ0qHUAiqcGB7RkbXrhsTEk1zza848JwOIFvFBH7k1cyxJYpdarnLsZ4hTTNdwJ/9cA
	djJ9OhbcSPUg7mpqLlWa5sNyPFEwtODhqo/pZPwjP11gvdWJ9wtUfDMN6iJIt7tz4gBbKfHQHNqv3
	G0bA5kpamfGlA6zVsa8q4w2RRoSDow9nfRUKGVGf+cfI/f1hQrN81rU+RK//nv77DPt4VaFlmiRiK
	Umz7tD/mME1ZCsA3jNnnba+3RGKHf6c6xQo4FvFn4JMu3qhNiMEycxSzjMgrbBRYoH0maMJ+nSlHu
	PVwSq2Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuHRA-00000003xcf-3A58;
	Mon, 17 Mar 2025 20:51:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuHPT-00000003xCe-2lm6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 20:50:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2109B5C5646;
	Mon, 17 Mar 2025 20:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B654C4CEE3;
	Mon, 17 Mar 2025 20:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742244606;
	bh=ZzO7p0E05LqQUhj5I6ptRTxYrMDxibfEvE+IQLvcR2I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WIqYclAprWpnECcYa5u9U47KpvZIh/uYc7FUI98D9SPU+XMWuYF0oHzqs98Kadm+0
	 c5gWw5vft86A+ajmHFdQSSmnV3J1R1LRlnnEUZCFmiTMkzkSmJzLokDEePHn1LkaQH
	 IqPUX7aAya8KdA1U5U6V9yTv20h1ldmReo8jxoutz3WK7IDJQvsOtHrwd5JTEFZS5k
	 4S+B8m0B7xuXCW8YElOA3R30Qo/YzYRMo5goaA3b6AhIOjv6cH5CFaS1/ABkgvnSxj
	 Z4GH0M3GPNE6WvQfVO+3cEp6xSIlDhO3eDU7Ao3RAVsZy3SSW7C3lhdvRcShLw4O6z
	 UPHsb7FWky0Bw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F98380DBE5;
	Mon, 17 Mar 2025 20:50:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/2] net: stmmac: avoid unnecessary work in
 stmmac_release()/stmmac_dvr_remove()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174224464199.3909531.2901969920115907730.git-patchwork-notify@kernel.org>
Date: Mon, 17 Mar 2025 20:50:41 +0000
References: <Z87bpDd7QYYVU0ML@shell.armlinux.org.uk>
In-Reply-To: <Z87bpDd7QYYVU0ML@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_135007_739178_30E9550D 
X-CRM114-Status: UNSURE (   8.86  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 10 Mar 2025 12:31:32 +0000 you wrote:
> Hi,
> 
> This small series is a subset of a RFC I sent earlier. These two
> patches remove code that is unnecessary and/or wrong in these paths.
> Details in each commit.
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 -----
>  1 file changed, 5 deletions(-)

Here is the summary with links:
  - [net-next,1/2] net: stmmac: remove redundant racy tear-down in stmmac_dvr_remove()
    https://git.kernel.org/netdev/net-next/c/180fa8d0a2cb
  - [net-next,2/2] net: stmmac: remove unnecessary stmmac_mac_set() in stmmac_release()
    https://git.kernel.org/netdev/net-next/c/39b0a10d80d6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



