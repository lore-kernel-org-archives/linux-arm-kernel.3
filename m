Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589F1E92734
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 16:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H5mqLTmcYfD6gU8E+DY2677YVhmEXZFSAcJzKoAMieU=; b=03OoZq05vyA+iQh4M+V6QUYIeG
	Ti1ltlFlvkZKpUwQXt5nExV43Nu6VmNJSMMBAFAEcSHZ3zFcyuy8U1gBOHsoaBVOkRD/RJWWqxMau
	fOJqwmCnOlIhwmvqx/pHfhFY89TFCfA36fBsWAknwsbIZapzSzsbQfDkY+N2VOVseY/YqYopVvUBJ
	uis1TPlZX/7sjRFPmZWdAFByZB3kNg2UGU5sH3itJvWCA35GR+l8HWFNnR3wq2eVnmOyQ23ENSA4Y
	ALhPm0VocZGau7jl0GrkID3oXZoHZT2e6rOKo+jAz5dfPQdeXbIP6rxc1z01I2zEQcllFlqu1FU1u
	MqsM5pTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaGL9-00000003tJA-2Xin;
	Mon, 29 Dec 2025 16:43:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaGL7-00000003tIj-0AR5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 16:43:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8DD6D4411A;
	Mon, 29 Dec 2025 16:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6683DC4CEF7;
	Mon, 29 Dec 2025 16:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767026603;
	bh=lnxWlId6PQ4och+lJMqlnXFu7vv7RTBCRW9v7SAjrAw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ESIE5I3D4iCVueW0ZOTmyF5JoDd4C/Y64q8wc4ZoqPn8wHI3MKG9a8LsB5mQ6wylG
	 0NGjl4SvV/TuAJ0/O6e2IZOWObzK4fNNbsUxr2G0zQNcLiZ1fNt9im0+ViUGN3zdBY
	 OPLN9LRIFOozLmpN0Inwdn86KpgAa0mkjuHMME0FGyydwH3jFegS7GeVlpfCba8WDe
	 C/G27X7lfv5+nw+klTFAgAS/LNwrCVLMMu2NilvlHEXBDdyltmHTZx0IhsmMH4fsGW
	 8ltZKP7o6oqMhyzV2yoEDYQGqlNeQsBpvfm82YMlWwfGuMzCJy2zXul57aIniQdt2S
	 0rh58ElxoMBZA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3B7C63808200;
	Mon, 29 Dec 2025 16:40:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: stmmac: fix the crash issue for zero copy XDP_TX
 action
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176702640604.3003866.8845654519033252561.git-patchwork-notify@kernel.org>
Date: Mon, 29 Dec 2025 16:40:06 +0000
References: <20251204071332.1907111-1-wei.fang@nxp.com>
In-Reply-To: <20251204071332.1907111-1-wei.fang@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, john.fastabend@gmail.com, sdf@fomichev.me,
 rmk+kernel@armlinux.org.uk, 0x1207@gmail.com, hayashi.kunihiko@socionext.com,
 vladimir.oltean@nxp.com, boon.leong.ong@intel.com, imx@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_084325_101997_94F8081D 
X-CRM114-Status: GOOD (  10.33  )
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

On Thu,  4 Dec 2025 15:13:32 +0800 you wrote:
> There is a crash issue when running zero copy XDP_TX action, the crash
> log is shown below.
> 
> [  216.122464] Unable to handle kernel paging request at virtual address fffeffff80000000
> [  216.187524] Internal error: Oops: 0000000096000144 [#1]  SMP
> [  216.301694] Call trace:
> [  216.304130]  dcache_clean_poc+0x20/0x38 (P)
> [  216.308308]  __dma_sync_single_for_device+0x1bc/0x1e0
> [  216.313351]  stmmac_xdp_xmit_xdpf+0x354/0x400
> [  216.317701]  __stmmac_xdp_run_prog+0x164/0x368
> [  216.322139]  stmmac_napi_poll_rxtx+0xba8/0xf00
> [  216.326576]  __napi_poll+0x40/0x218
> [  216.408054] Kernel panic - not syncing: Oops: Fatal exception in interrupt
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: fix the crash issue for zero copy XDP_TX action
    https://git.kernel.org/netdev/net/c/a48e23221000

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



