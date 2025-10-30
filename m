Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E150CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 02:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JGk6FxzWwchXcv08k2ZskC7/Oc9f/Luk20tMjKG58+A=; b=FiaDB4PKp8i3dVFni8oaoKYGyc
	dkVYm4hLEIYEyzuibLY1eJBrAVvSrqzx+8XfG89seHbFB6qtpttSdUHqB5l28NvrQCpAa/gIcCvFY
	F5gJpm77yf0vExIqBjAY79ADzr8RT3Tkgo5zLHrCFVpV8d1VhJ2EQwvTa5iw+sOgaQuu5KUX+n8Zv
	uTRB5OvAtCOuOVqtIldpMIeZUa6VZdomEjj30qnRa5gwZqs1ivZV1mRq/pxRbemZqXh9SR8BQNFh/
	4gMvIGdrWqnR+So45HAAGIRyqAhUqC0bMuZhjpnvCMnIYvvIrybOM+OLuUy/mQhekuFb7N99kM//0
	jBCUZ4Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEHy0-00000003M3V-43bC;
	Thu, 30 Oct 2025 02:00:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEHxx-00000003M2T-061O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 02:00:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B8490404C7;
	Thu, 30 Oct 2025 02:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9743BC4CEFD;
	Thu, 30 Oct 2025 02:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761789640;
	bh=TF+xR6KkE5OxIUkvy+8hHfKZ6+KB/cpOjzBZ3NfVqqU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IRTOC1bpzA0kKLl18DqZ2dgnna/3cQnn4+WjtiR4iC1LuGUru3GrZx9p8l8KGMkZ+
	 q5A2hgO6cs8ZuchhZNhelEp5cceJPktfnyn/p1MskQDcVFnt8NDh+TR4jpgA82kHLV
	 a44FDRqic4yuZZbwVTcTJzh1hwstNCOFjJ9m16p9GsiGvnJclrPEIXxktoNbY12EcC
	 a/lGzfZ7Xka8HlEbGNsXBjdp1ZF39BwjhFficNpwajotUCJwMA01UA//eePWi1tVHu
	 NFlogkCIy53t9ZMe25+8MNhX89gz6g44JAKASaSS8Nf0CzI8Q9PYiHVAEosoAUoF+1
	 xT6250KQsYmUg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id CBAC43A55ED9;
	Thu, 30 Oct 2025 02:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 net-next] net: stmmac: mdio: fix incorrect phy address
 check
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176178961774.3282477.10436173337048887248.git-patchwork-notify@kernel.org>
Date: Thu, 30 Oct 2025 02:00:17 +0000
References: <e869999b-2d4b-4dc1-9890-c2d3d1e8d0f8@gmail.com>
In-Reply-To: <e869999b-2d4b-4dc1-9890-c2d3d1e8d0f8@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, pabeni@redhat.com, edumazet@google.com,
 kuba@kernel.org, davem@davemloft.net,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux@armlinux.org.uk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_190041_080933_1EB2D9B4 
X-CRM114-Status: GOOD (  10.05  )
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

On Sat, 25 Oct 2025 20:35:47 +0200 you wrote:
> max_addr is the max number of addresses, not the highest possible address,
> therefore check phydev->mdio.addr > max_addr isn't correct.
> To fix this change the semantics of max_addr, so that it represents
> the highest possible address. IMO this is also a little bit more intuitive
> wrt name max_addr.
> 
> Fixes: 4a107a0e8361 ("net: stmmac: mdio: use phy_find_first to simplify stmmac_mdio_register")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reported-by: Simon Horman <horms@kernel.org>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> [...]

Here is the summary with links:
  - [v2,net-next] net: stmmac: mdio: fix incorrect phy address check
    https://git.kernel.org/netdev/net-next/c/cf35f4347ddd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



