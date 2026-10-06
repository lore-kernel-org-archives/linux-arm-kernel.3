Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD09CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 00:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvj8SC5pqp6JhKvmMFRMNZvobw45umdTFKDtOkONq+w=; b=r+hlVNyGAo9RB6yE1BYYGTIeNv
	QUMmVL220UJAfaLFRRJG6zSqFweNyUA7P8s838HiAF2RDsNLPSN6u6MXj9NArosJDtCkAtyXUTCON
	Nuhgu0EUrHfVxvMY3dVe+rXH+Ptatp23zg2VSGAyzgmKvRgpLXJVTSUO/w4ALkmkn7lFHC8y7CGdm
	qI91eVj2DjcSED97G1Sfqo1s9yUjP51gYZglrmmoAJ932hRmeu3pUKPLyrglC7xVuwnCXBQttE9ns
	wl5TLkCHxaBo4TCnZOKTPPzq4VccKrXUajgGc5tRV0qubbYeAXHeQfSZzHGifMo0JV3j+x6o1DQoH
	oq+bVV8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDsbL-0000000HMP9-0tMO;
	Tue, 06 Oct 2026 00:00:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDsbK-0000000HMOy-0J0C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 00:00:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C8FF60229;
	Tue,  6 Oct 2026 00:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3F91F00899;
	Tue,  6 Oct 2026 00:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791244808;
	bh=lvj8SC5pqp6JhKvmMFRMNZvobw45umdTFKDtOkONq+w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=KC+2hntYUHKFuVDp/p0ly8uzmPbNrZmbLM1a5ZE9L7+2zSN5QSs8ETN7ltGEU4RfK
	 zSBH1tDCm5WXq1ZcwK+t8D4WX/m3H9yGbgSx0/R20qhy5AK5PlSvbVyFbUwgYFrgfj
	 0cYPfe7ULKWocMzMeNrBbfaDYxatg2AI7gtE1M4Pil3G9gCz3kwskNXoYB8L5LgnOM
	 RW8SK9tQ4dA/n+lug83Qy6aNFNEe0NlDj1Y3mf6i3g/fkoQmyFYP82NXGLXLlDJie/
	 ZK9XGOBLCH3RQadVK9pyymEUZEyDe8CD7jaxJ75YFJafEqW5gyfWV46PFnuNqyn/xr
	 wgAMvs0Y7C2Zg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A316392667F;
	Tue,  6 Oct 2026 00:00:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v6 0/5] net: stmmac: Fix double VLAN 802.1ad tag
 handling
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179124480678.1944959.18161635120847031238.git-patchwork-notify@kernel.org>
Date: Tue, 06 Oct 2026 00:00:06 +0000
References: <20260928203441.34876-1-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260928203441.34876-1-ovidiu.panait.rb@renesas.com>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: maxime.chevallier@bootlin.com, recv.jo@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, jun.ann.lai@intel.com, yi.fang.gan@intel.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 28 Sep 2026 20:34:36 +0000 you wrote:
> Currently, hardware VLAN stripping is broken for 802.1ad tags. vlan_rx_hw()
> hardcodes ETH_P_8021Q when putting the hardware tag into the skb, rather
> than using the actual protocol from the packet. Because of this, packets
> that contain an 802.1ad outer tag are incorrectly passed up the stack as
> having an 802.1Q tag.
> 
> This issue was observed on the Renesas RZ/V2H platform (which has a dwmac4
> IP), when testing QinQ ping:
> 
> [...]

Here is the summary with links:
  - [net,v6,1/5] net: stmmac: Remove VLAN perfect matching dead code
    https://git.kernel.org/netdev/net/c/11705541e7d4
  - [net,v6,2/5] net: stmmac: Stop toggling the EDVLP bit
    https://git.kernel.org/netdev/net/c/69aa9e76677c
  - [net,v6,3/5] net: stmmac: Rename double VLAN references to svlan
    https://git.kernel.org/netdev/net/c/354b07bc1dca
  - [net,v6,4/5] net: stmmac: Do not advertise S-VLAN stripping when it is disabled
    https://git.kernel.org/netdev/net/c/c63ce7b9c7e7
  - [net,v6,5/5] net: stmmac: Disable S-Tag processing on dwmac4
    https://git.kernel.org/netdev/net/c/da17990421d7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



