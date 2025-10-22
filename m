Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0F8CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 01:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bcufayJBIfPbfOyGZacNgUaBrYqZKKmhv7AUiFc+ug=; b=Dyq7120PUrLIdtSjDT3rxXyU+l
	bhjPNpwW9k3tZIl4jh6HsTPFUp6I9UleN6EQ/fPU6apM2f2Z5qgVLT82A79UZW6/7lp5Hn8/Z9MIl
	maj7M4/xNhWiMKiRw/+3v0Jt3Su3hi7WhDehvCB66oHFa6kJ/3pa7UYeWxYt1J7fvm6jlsDOd+rd+
	NXNNq8WRQeOZoZe9hwGMs203Vyf/yRRy9UYeR6mTQlIjNtTgbDfIPKVGlA13oaFBwSKy+H5Df2/zF
	yCx113zW5Dxn2H6O6iFb2NvEJxZdirhE9/XvmhMxbU+3kMqrwHj5oOzKjYtnuC33WenkfzxFL9Gha
	si1HqjVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBNzq-00000001B8T-3XDa;
	Wed, 22 Oct 2025 01:50:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBNzo-00000001B7y-3DS5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 01:50:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 18FD24538F;
	Wed, 22 Oct 2025 01:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECABCC4CEF1;
	Wed, 22 Oct 2025 01:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761097836;
	bh=/eTy4JtMv/vr6iqZocb7lPKZoXLwzYl/RYQlWEEt4bQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gITWc2OepTEpTH4QeVoo+w086E3kiGzcJG00wK8LBjY2B4lJptF5+B+uD+kE84QQx
	 HpzOaME48fucUHFOuR2cS+JxAAd7rCvc7exS4onFB62gaqgLJ0wMy5wCs6cGyPCvVm
	 9bG3cA7mMyI3FJhPoQgao/V80EL8ceQNGMiq6SSHb3fnbG+JNOC96kD8WRJMdzgX0+
	 X3RHum0oDVWqfHVPPUarE97kpYjSjdw+CJsP1nxEYsd1g9TJqOE4ZrkHARCV4DVogY
	 qVmJ3WJQVLAq/JPWwUi1J8vNKzokw+1aaXpmWYd/fLnXzngKJpWsH5T0ElbSrI+EFt
	 8Dj6Y0ZPc821A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DE03A55FAA;
	Wed, 22 Oct 2025 01:50:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 net-next] net: stmmac: mdio: use phy_find_first to
 simplify
 stmmac_mdio_register
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176109781700.1305042.6815334207593742023.git-patchwork-notify@kernel.org>
Date: Wed, 22 Oct 2025 01:50:17 +0000
References: <20ca4962-9588-40b8-b021-fb349a92e9e5@gmail.com>
In-Reply-To: <20ca4962-9588-40b8-b021-fb349a92e9e5@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: andrew+netdev@lunn.ch, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, edumazet@google.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, netdev@vger.kernel.org, linux@armlinux.org.uk,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_185036_823641_FE683E2B 
X-CRM114-Status: UNSURE (   9.88  )
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

On Sat, 18 Oct 2025 20:48:07 +0200 you wrote:
> Simplify the code by using phy_find_first().
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - remove variable addr and use phydev->mdio.addr
> 
> [...]

Here is the summary with links:
  - [v2,net-next] net: stmmac: mdio: use phy_find_first to simplify stmmac_mdio_register
    https://git.kernel.org/netdev/net-next/c/4a107a0e8361

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



