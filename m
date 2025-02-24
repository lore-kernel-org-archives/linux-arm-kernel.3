Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C549FC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 22:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YMTyyljeSoeEZ1qX/m1e4DsAMF9julblfGhRWJUGgNs=; b=0vqhWfb8WjLNqb/AI8TRJVBHUB
	xSO9aAQYZnVorZCeMqvMHXzdZdeFO4+U9+4JlbZnGIgNKrZBtiPO/Hink/senpC0zUjQh9SKyXKgz
	9JK/dvYZvrPt7y/SD+RJWCKtgUnWGWtUXNBfl88Rfh34OPAn7JxXQbxYzQZe96bYB6FiCPuftepJT
	eyZ6ttBpTK/SSqvY5SFlb9OE2xHdPtt7lxLMS3kK87d3mpW4uXJnJPFT3p7PCuwogrJ1mSVO9Ido4
	VnmczuFvn8p6EO64ZPSoGxWR38nTvQVd3Jgv1BGTNzwPEL3uEH+RYDTJceEKjcK+sxZv+9CyCQgZ8
	g7bXit+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmgW6-0000000FJAX-41m5;
	Mon, 24 Feb 2025 22:01:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmgUc-0000000FIvZ-2f7Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 22:00:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F3C005C6CF8;
	Mon, 24 Feb 2025 21:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93592C4CED6;
	Mon, 24 Feb 2025 21:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740434399;
	bh=QJ6yGM33Uq3KSv4SQnLLE1QPSeX+HvMHB5AJdp87OT4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MOgJHU6OfhBTuNWGYBpN4QLCNtIs17/THkJ+6x6bx8RUfpOh7xdPbjpeENfeDA9Ky
	 uecn4B8DXoySXeGB+nTKrv7bkPZm7h/t1g7fGr1wMu5v1p41AGlAlV+aD6Q+K/h5Q/
	 W/KIkyAMAj9giaakzEasG8fEwLVkP0HDmoL1x9kk6VH1/FaNmfHyZxoI6RAzGlG4C/
	 do2qowMpLI6zNCIhZmJhq71WliEwpbxBFVMtV0ecgHF4qeR7meDTgNhQ+cCEyDnZIB
	 MQsXWK1EuZY29du1OeSjHNkIqmPzME5ejcvoMkbgGHF7utE2P4LTcbEZIoGDLQ/6CM
	 CBz0QvKnTSgyw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D6F380CEDD;
	Mon, 24 Feb 2025 22:00:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: use rgmii_clock() to set
 the link clock
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174043443104.3623128.840309022243977791.git-patchwork-notify@kernel.org>
Date: Mon, 24 Feb 2025 22:00:31 +0000
References: <E1tlRMK-004Vsx-Ss@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tlRMK-004Vsx-Ss@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com,
 vkoul@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_140002_714386_EECB4EC4 
X-CRM114-Status: UNSURE (   9.37  )
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

On Fri, 21 Feb 2025 11:38:20 +0000 you wrote:
> The link clock operates at twice the RGMII clock rate. Therefore, we
> can use the rgmii_clock() helper to set this clock rate.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 23 ++++---------------
>  1 file changed, 5 insertions(+), 18 deletions(-)

Here is the summary with links:
  - [net-next] net: stmmac: qcom-ethqos: use rgmii_clock() to set the link clock
    https://git.kernel.org/netdev/net-next/c/98f992884333

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



