Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2D4C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 00:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNsC/tQeO4Z2q9Gr+EzNpNBfohb764BQYC5T8GbHjuc=; b=moryMsi6e2fxhwL8OsxhN2Stvv
	Kd/OtowYVNB26pusO5biTMTXLAHx1Tkng+AYQssZgrgq2rvr+iq6WUnKXp6MINvaQ5NhxZiyupKqW
	lgL+5TtKKh8cvKdGw/wU6Je3NnkIigTSRsHQO9INnQ/YETi0LHThuJAyn3kWRDa5EbtV0mVfuRfMA
	NLMdRo4UkbYTMf8c0boEd5wGoWi9+3S9UcynHrIahz2uKBZ011fscXyBBDSOvQT644XxiY/r1UgzK
	0I5zgQ2DLC4coYID7wVC1QprzMs4T+Pe6lSEWSDz7kZJkKXzBqfiH4y9zalqmF9K64iAtUm6Zj3f+
	L4PKJ8bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ifk-0000000FjTY-3JUh;
	Sat, 19 Sep 2026 00:11:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ifj-0000000FjTK-1o2N;
	Sat, 19 Sep 2026 00:11:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A24860A64;
	Sat, 19 Sep 2026 00:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA6C1F00898;
	Sat, 19 Sep 2026 00:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789776674;
	bh=oNsC/tQeO4Z2q9Gr+EzNpNBfohb764BQYC5T8GbHjuc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ZHVwhOt4T/8yFYuI/TFbaANyEu03xeeoqWrPtrCZShwzKOaWoS7onZ5GfFlIDwqMt
	 hkQ/TFweqS4kdi6GKE6v0yMPSV5YqUp5VRmBQNSw4fd2X+AKJm03UR2SkFTs/xw4j/
	 Ke8r6DdTE6fyd8I5wivJzQU7thDOuGrH/caxxpxfF3Y3t+nBsD0Vh+VblXhc90kYqb
	 Gw1NtUVLil3s+ozCbTlEGJ4jpsyg+WRN76qIOvMRwfbQRmNhXWFyAEIlGnXmpYeyiS
	 stsV2nFA1a4T2gQnDwnbc68crROur7Iu4OfPYshBuamZ3IV1JHLQsTbrHMHThuaGKo
	 52P15XOhDOo4Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56A423811977;
	Sat, 19 Sep 2026 00:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: unregister net_devices in
 case of probe failure
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178977660689.1197442.4867572793099583443.git-patchwork-notify@kernel.org>
Date: Sat, 19 Sep 2026 00:10:06 +0000
References: <20260916-mtk_eth_soc-netdev-fix-v1-1-5dac50eb65b1@oss.qualcomm.com>
In-Reply-To: <20260916-mtk_eth_soc-netdev-fix-v1-1-5dac50eb65b1@oss.qualcomm.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 sean.wang@mediatek.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
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

On Wed, 16 Sep 2026 15:30:13 +0200 you wrote:
> If register_netdev() fails for one of the MTK_MAX_DEVS devices in
> mtk_probe(), the error path jumps to err_deinit_ppe, skipping
> mtk_unreg_dev(). The previously registered net_devices are then freed by
> mtk_free_dev() while still in NETREG_REGISTERED state, hitting the
> BUG_ON(dev->reg_state != NETREG_UNREGISTERED).
> 
> Route the register_netdev() failure to err_unreg_netdev so the net_devices
> registered so far are properly unregistered before being freed.
> 
> [...]

Here is the summary with links:
  - [net] net: ethernet: mtk_eth_soc: unregister net_devices in case of probe failure
    https://git.kernel.org/netdev/net/c/310d1ac61a4d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



