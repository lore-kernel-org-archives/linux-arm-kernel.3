Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943CDCA0FF6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 00:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7RThAvhW47ClaFk0Ppc2YL382QqxIANC1JHDPuD3DOk=; b=pwx/BkPVWdueDWnczgD+z5hBL+
	Ufy+HiKLAzSXXp6T+0KqofYZC929rIOVVAZSAPJD3N7rFgNbyyi7wboiLF/djKNhRRwyQ7d2Crxks
	lF+oXvSbBj4Tx+JGAoIL0OErr5NrEHOe0qUeyYKKBRaRbnDycRcoa2xOPkOtI9xjmzxcTOYepXILt
	a9KB139ZL2HYBN8erBJdl9a5hMR4OTBOmfoumtNbwzLRurmyhuZC9qq2FjyMAHE2l8Bd3RApywO6v
	WQnGxJarwwsUau/uMtx5YTfPncz8zKstykzfpP2TijpeqOXa9kNWo7b6CcikZNwfYrcee/zGwfjaJ
	n9/69kXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urmiB-00000003pDb-3trK;
	Fri, 29 Aug 2025 00:11:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urmXW-00000003lD5-1UdS;
	Fri, 29 Aug 2025 00:00:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7RThAvhW47ClaFk0Ppc2YL382QqxIANC1JHDPuD3DOk=; b=NuNu5kyS5aoYYc8dj18PI3ZEOO
	B//oSaVOH9V16ngRpM0RbZX4gXEwsA5VHqXu6FYK+EtBrXEapplBE3pKdT+0moIwEXCaj62DBxZ3N
	9UUAX94uOSno+UY3yPnyhH30wtZesiVA4TyJjeaD7cwngbbi79/xWbTG6PHe3GxRUUC/KfJjLfVLR
	xMQsjmLj/x27a5wShQic+gPGpKG78qxvKfXUn55SEMsvNETT/XggnLolb9XmBiIif+bH3qz7KGR/h
	v9fCA2rvKx7NXQSZIcMhkgOs20Zs3BJAEkHvJjB6nTHGrFPO/GDkY27EonnmdhlQy+0e7wJGvT370
	/Xkf3W9w==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urmXS-00000002ymC-40Lw;
	Fri, 29 Aug 2025 00:00:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E2B1451C7;
	Fri, 29 Aug 2025 00:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D15AC4CEF4;
	Fri, 29 Aug 2025 00:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756425617;
	bh=wGToxozqbazFFH0LvF7E6rK1PxvN4J76FMletJpx26k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AzJF0nHA6QWTQ+fqIlN0wvNV1pY0RW5bxF9OiSU5btQOxErb0yHcb57uALHw9nEGe
	 N/wRGgjaYG8E04rd9biTI8BqVXIe6GI5fu/rG+9IyhluAI0ZOn5JCgiMhu62lI+gXg
	 d3H0cs6M99dniymI1+aHiwHOqdHL6Hn3RhOpNnUS06AJlwVBSRW2LX4d4QmrK2pnSa
	 xfMRefwbUFatM9SASZ8kL2g75tiOjrGPlaKR7s6K8aevel7KQNw0ICeP1qTESS9pvb
	 ZWbCinfGjR26uARQfE7I8TpY9rWOpHPWYohQMnnnG5o8rVsdKQRIcfmGWKFEDyYlTQ
	 M/6qli/V58UCw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD74383BF75;
	Fri, 29 Aug 2025 00:00:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 1/1] net: phy: mtk-2p5ge: Add LED support for
 MT7988
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175642562424.1653564.8322178452241904171.git-patchwork-notify@kernel.org>
Date: Fri, 29 Aug 2025 00:00:24 +0000
References: <20250827044755.3256991-1-SkyLake.Huang@mediatek.com>
In-Reply-To: <20250827044755.3256991-1-SkyLake.Huang@mediatek.com>
To: Sky Huang <skylake.huang@mediatek.com>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 daniel@makrotopia.org, dqfext@gmail.com, SkyLake.Huang@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_010019_209461_7BC37CFA 
X-CRM114-Status: UNSURE (   8.45  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 27 Aug 2025 12:47:55 +0800 you wrote:
> From: Sky Huang <skylake.huang@mediatek.com>
> 
> Add LED support for MT7988's built-in 2.5Gphy. LED hardware has almost
> the same design with MT7981's/MT7988's built-in GbE. So hook the same
> helper function here.
> 
> Before mtk_phy_leds_state_init(), set correct default values of LED0
> and LED1.
> 
> [...]

Here is the summary with links:
  - [net-next,1/1] net: phy: mtk-2p5ge: Add LED support for MT7988
    https://git.kernel.org/netdev/net-next/c/5e3aae2d3271

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



