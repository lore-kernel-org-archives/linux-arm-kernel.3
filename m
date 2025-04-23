Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84164C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 23:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGtdN9ZHoP72bHyMg2qtgLNKQaSCvOy2qU1A/TehErE=; b=P2M7ts02WxJ8hy/u+SbkOunEmK
	fXz8kiIY8F9UNFvIFTqqtoKg8CzjgQKI0qO1TNYp4Q2NgSpF7c+p8V9D6/jyKGEZiWdGReoz1bhs0
	wvcaqL7w/iHthtrSYZ8k+L2KqCK5jGqaDLs5X8nol3U81ydP+4uOq9MrmdEwSR+2Az2eIuGCNZkkf
	aGRholI3HowXOei2MO0sLJJgq5r5Om0kAx+YA1mO6XWz+MyBot0rrPjxMeYzSP8Co3hgFKyRUpKdV
	k89Wcqp49yeznbSj1eCxoCLDieV34eev30PHntt+xLyWKLlDJC+GnEOWE/pJ+N/+4wSDJMEp3kr0i
	XqBs3SlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7jLf-0000000CFpV-0pZx;
	Wed, 23 Apr 2025 23:17:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7jIh-0000000CFUH-3vdF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 23:14:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C13D448EC;
	Wed, 23 Apr 2025 23:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EECF0C4CEE2;
	Wed, 23 Apr 2025 23:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745450083;
	bh=NwPdaUZJAZ+ANYSzIVj7rk7f0HACGHmAdYi8K/KSyN4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qv/8ndts6AWpsTgPCu6Jakxn7NPuQaBNcVpasq4/qTXXHgOztPsHznio1aG6RTyu8
	 RMvihSJ6Fq7WoxvWIBVKu0WpJhChmGHvBFBAYP4VfvQQmicQrB9PHiDSdhknXcrt2g
	 UrYbiS48yUDw6HqP0KKOQSP+WjFwZpTe5yjZ6YYk9RvAiv3nh/HaCO6f1pydRKvtRb
	 MrnWYM4NqWimy7zxCACmzj02FJXdtTsCO7qPwb+/rsKC5ZIqGPXb1LxEIVAAogKRim
	 kSywYzYlmcViwf38b11U2+DmxJTF/ecq3c63JXjUb2YzAg/WhkpQB8tJT8Rgvzoq5d
	 hwsz4st979i6w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD63380CED9;
	Wed, 23 Apr 2025 23:15:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: dwc-qos: calibrate tegra with mdio bus
 idle
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174545012150.2793299.8349789230420012979.git-patchwork-notify@kernel.org>
Date: Wed, 23 Apr 2025 23:15:21 +0000
References: <E1u7EYR-001ZAS-Cr@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1u7EYR-001ZAS-Cr@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com, treding@nvidia.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_161443_998143_16A22BDB 
X-CRM114-Status: GOOD (  10.20  )
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

On Tue, 22 Apr 2025 15:24:55 +0100 you wrote:
> Thierry states that there are prerequists for Tegra's calibration
> that should be met before starting calibration - both the RGMII and
> MDIO interfaces should be idle.
> 
> This commit adds the necessary MII bus locking to ensure that the MDIO
> interface is idle during calibration.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: dwc-qos: calibrate tegra with mdio bus idle
    https://git.kernel.org/netdev/net-next/c/87f43e6f06a2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



