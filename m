Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3625CF3959
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZSJShUyIxlzOHKK2W/SfIZ/gulsdmRfpb1nBHVSMbE=; b=jYyxZ4uwGt3AAE8lbocaw6tu4Z
	P7EzS/g8bpQzTdTKWtpLctZk5rZJ6iWlJa+WpdhwqX8UZwJZy7vBWpK9dWp4djKOz265cZGjPi93y
	urfoT1164qfkz74dqFN7BF7oFB8E6Bask3Y1orBUCq0pIstEJNtfX5wKrNGrpv5pLczegzrDh6APJ
	KhOAu8duy1SHQ2ahuhus+uuNRk4TmV1aRu4wvG4v4X+Mqgj/uN8FO202ljU9VX0bV16A+BnQ/OH5A
	5IvlJ/ezsxJ36yJnx2Ckw8KrBNiV0LkuRbY/KLBTPPmabixTjD7XR5up+8s9RuKeHA6Jm0b4SZDKP
	ecUZUgew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlEk-00000003ioF-0iEV;
	Wed, 19 Nov 2025 16:40:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLlEe-00000003imu-1Mip
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:40:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4DD5F601F0;
	Wed, 19 Nov 2025 16:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EECA6C113D0;
	Wed, 19 Nov 2025 16:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763570447;
	bh=iUjwqaammSlItw6iy0AGcOa7+3IBT44TGBC6u0+zcoQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BEBEeLg1vESjR0s8FUiMwIazpXhPwRquWGltWffJgUMmUC+O44PiandHyICVyMY4B
	 vzRRi9opZ1ZEnFRqVqoT3iJiFATo2lBrPg8uu0xHOscWBA2DJidUHZC4VPFql8Sr5F
	 YpXD8uHa3YVt6rbJuGILc4YUWbAmlBVNh07dK1nOEIL/CphqNtCVgQtcSHf/TF7V5k
	 hjGVMLVu0fKb8nwBQNl0HqJ2pzxWz/elx0V+hc3g/0ycqvNcUC+8y0fUNkq1JBtebi
	 IVVyerddZaXKA4OyOG09CP+3xTrs6qoybhIuDDDxwfUmoVeNe4eqonV1BndsNneo+b
	 nLGDXSlNNm36Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB06239D0C22;
	Wed, 19 Nov 2025 16:40:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/2] net: stmmac: sanitise stmmac_is_jumbo_frm()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176357041250.873046.17131882776763838281.git-patchwork-notify@kernel.org>
Date: Wed, 19 Nov 2025 16:40:12 +0000
References: <aRxDqJSWxOdOaRt4@shell.armlinux.org.uk>
In-Reply-To: <aRxDqJSWxOdOaRt4@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
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
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 18 Nov 2025 10:00:08 +0000 you wrote:
> stmmac_is_jumbo_frm() takes skb->len, which is unsigned int, but the
> parameter is passed as an "int" and then tested using signed
> comparisons. This can cause bugs. Change the parameter to be unsigned.
> 
> Also arrange for it to return a bool.
> 
>  drivers/net/ethernet/stmicro/stmmac/chain_mode.c  | 9 ++++-----
>  drivers/net/ethernet/stmicro/stmmac/hwif.h        | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/ring_mode.c   | 9 ++-------
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++---
>  4 files changed, 10 insertions(+), 16 deletions(-)

Here is the summary with links:
  - [net-next,1/2] net: stmmac: stmmac_is_jumbo_frm() len should be unsigned
    https://git.kernel.org/netdev/net-next/c/b5adada61e02
  - [net-next,2/2] net: stmmac: stmmac_is_jumbo_frm() returns boolean
    https://git.kernel.org/netdev/net-next/c/bf351bbec57f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



