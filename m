Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A78F55438
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 01:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BqNKSXNVYPAQ56g0qzE+lFuR4blBfxQbjNBOPfxZ9TM=; b=SI5AW5OZk5scGr+oW28tmXwI1Y
	uKits5znhpG50sJzUjbeNcA4hs8PZj5899Pkfb2d5ReVuVuAPv7kj6pjdVeaZsORmgebM9zyFOTrt
	1LVBbBqY+5Xz6o41ohgVLvWhZ36N6UUUpe6S8uu1dONTXazmffHKkV+Ug91pJejmMgvI5MguPNQ1X
	UeNCUhO8AW9D+V/yskuq67afGxPVrQ7BnbLD5F2jzrBQlt9u+ZEwHh2djqi3jTzAoouttV/faaRHI
	/IYkMBhbPGA/oTgPRntJ8FuBJnnMPELlNJ5bBDm2p1ffAZ63rtvsOxQA46TMR60+XGm3u6fv3B0oQ
	9QC5sjVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv42O-000000033HP-2ESl;
	Wed, 25 Feb 2026 01:50:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv42L-000000033GL-1zEU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 01:50:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D7122437C8;
	Wed, 25 Feb 2026 01:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF86DC116D0;
	Wed, 25 Feb 2026 01:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771984199;
	bh=ddK31AyZnHETg4NLq71bUz5Xx+K/KKCyYtF+CrTfIAU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YFBnq+SYbXX0En6K6IpMQgPebiPaotATLy13t6lE8GoeAwLIoLJfFwZyAGqFPp3Qx
	 rTSRGMEp7YRkFltd6+HDzTBvPYcN0JFI70qxNNGk2ZfThmZpafoNhwk75bF11odLg3
	 EXctO3A3EYKpRmSl7Ukw95BEqSK0Sj4Pc98zIj0dj15T2a5nHp1S1u0qptzCv+jGt1
	 tkZN7/WNwm54COvN8QEnwlcCXVXpVaBG2/9GQKjPJGBupxaTHMgWVhRYh/ARMIgqo+
	 DfcEXUjvPgLInpwCi1weXEcbI9SbiPe7yvAZ6XgzLrLTzEnltCmyRalX+sugl5CZ/Z
	 oYtRrUraYXNKQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FDD03808203;
	Wed, 25 Feb 2026 01:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: fix timestamping configuration
 after
 suspend/resume
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177198420505.31093.8056819283468946737.git-patchwork-notify@kernel.org>
Date: Wed, 25 Feb 2026 01:50:05 +0000
References: <E1vuUu4-0000000Afea-0j9B@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vuUu4-0000000Afea-0j9B@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_175001_543554_F4BBEE7A 
X-CRM114-Status: GOOD (  11.01  )
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

On Mon, 23 Feb 2026 12:19:08 +0000 you wrote:
> When stmmac_init_timestamping() is called, it clears the receive and
> transmit path booleans that allow timestamps to be read. These are
> never re-initialised until after userspace requests timestamping
> features to be enabled.
> 
> However, our copy of the timestamp configuration is not cleared, which
> means we return the old configuration to userspace when requested.
> This is inconsistent. Fix this by clearing the timestamp configuration.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: fix timestamping configuration after suspend/resume
    https://git.kernel.org/netdev/net/c/2f61f38a2174

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



