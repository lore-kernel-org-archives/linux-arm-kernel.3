Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F98C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 19:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KqEsQoEB+8fU7vJblTwby6vgzSs2bvv1OQhLWyP+QNc=; b=Q2vJ9hqTNeEgKn143/grlBbFsT
	1QmhnArzquewiVO7R8VjGwz8ceGglb5P2F7dQkE5iSpi0TpZqw21nnyJvI34tuXyE2g5idwerQOl9
	8pHxxjMspMoRjw4uAsJAPG6YeMGGEIK1oy0HmZs6izdsvkHlU9f0anbx0wW+3PnT8NLZZGnkJZq/+
	45vGxUVF0oXXxNcrMQrIUM84UE7qU8QLmPcFunS/d+dHIsqf4bx2inK4U5NbvU8LSCs8rVCmu9UU9
	G12eCkfjWVMXtJmgArHqtdYwjkto66DCx/CIikMZ161pEXprOIF65aeZBQ3c94GzeJ0mdrWp0UBvP
	j8aOkFgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzfyy-00000004jMa-24Us;
	Thu, 27 Aug 2026 19:41:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzfyX-00000004jHB-1dbb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 19:41:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7465B601FD;
	Thu, 27 Aug 2026 19:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A1C01F000E9;
	Thu, 27 Aug 2026 19:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787859684;
	bh=KqEsQoEB+8fU7vJblTwby6vgzSs2bvv1OQhLWyP+QNc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=KZIVIuC/FrGsNhPIIJrdIqKy2c5htetienMypa7/1X+jMMAypklzKO8yFHgIexMBY
	 VqTptL3T40xYDqevShKmm7jC7yDiFRdCGuiFsDjzUCQ1rIR2THe1SAFzZ0GJzUdkgK
	 csA/0yGvWc9a0Sy01GoUjp64FjcDSA6ab7FceY3k+kQB5twAbmiYw8k2WVLMmENCXg
	 8Iv3sQfSDr5dbFrUrpqE1ybABICYMm2ZAQpzjumubRObKcXGrIuO405ptnhajHLlSz
	 O1kn2+lZaiAGIum2x2x9ACTDXWb7/ADVnFitDU6OKBuVmbZoPAMWZ/akhaJRtDBxxB
	 FiBdEb26jQmTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0C763809A8D;
	Thu, 27 Aug 2026 19:40:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3] net: stmmac: drop gso_enabled_types and rely on
 netdev features
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178785962939.1816627.13162485413764982392.git-patchwork-notify@kernel.org>
Date: Thu, 27 Aug 2026 19:40:29 +0000
References: <20260824-stmmac-fix-tso6-features-v3-1-c73a7a4a0ec7@oss.qualcomm.com>
In-Reply-To: <20260824-stmmac-fix-tso6-features-v3-1-c73a7a4a0ec7@oss.qualcomm.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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

On Mon, 24 Aug 2026 11:59:08 +0200 you wrote:
> The gso_enabled_types field is used by stmmac_xmit() to decide whether a
> GSO skb should be passed to stmmac_tso_xmit(). It is updated in
> stmmac_set_features() based solely on NETIF_F_TSO, so disabling IPv4
> TSO while keeping IPv6 TSO (NETIF_F_TSO6) enabled zeroes the mask. As a
> result IPv6 GSO frames, which the networking stack still generates since
> NETIF_F_TSO6 is enabled, fall through to the non-TSO xmit path where
> they are not handled.
> 
> [...]

Here is the summary with links:
  - [net,v3] net: stmmac: drop gso_enabled_types and rely on netdev features
    https://git.kernel.org/netdev/net/c/9c24a504a3af

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



