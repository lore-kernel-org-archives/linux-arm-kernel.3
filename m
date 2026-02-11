Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA401EB5965
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 05:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Fx6lDqmzVI04/yqJXilV7HfTrE+QtPxhIYQykBJ7ac=; b=DUhVT6rdjVI62VltFrFfRpvpfB
	+BzFV8o91SOTBv7nlZ5tU5mhGOucQHXMKG1RFDQcyca7dRshBusYUhCz8GpUq8RcXzKltE2NH0a4S
	VmO2TDWlbhgMq39Qf8SAekp1hRU6MfVpsJl7cgXWwYQiAFcNk5wWplfVm35loH7t8fMuvze8jdHH5
	w9pTwZYM9TKcSxMvqdozMuNMswwpZ2SnKfXah1zwpsmmBuEXVEb1iT5ilca9Dcrf9bO3zU0v2Nix+
	dULzdBltW9N5WteLEOVOApcl/HCt3gik9JwVOeRdBanaLa8Vzlw5xLm7kBoUXBylAfczq24mC3j2p
	aGqCuhgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq2L0-00000000DAj-1Tu2;
	Wed, 11 Feb 2026 05:00:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq2Kx-00000000DAQ-3UTm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 05:00:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C602444BF;
	Wed, 11 Feb 2026 05:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAAC0C4CEF7;
	Wed, 11 Feb 2026 05:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770786026;
	bh=vcnXj3vz/pQ/LS/vRt2jiE8deQxJ3ugm6aER1Dd89ic=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KnsPAU6odC1a4bLLyUedoHUrD7wY3vuDwr6jbK/Vib5ICsvYB+9o9CqV6NyvLeL5a
	 npaaNTVmfbEWh8uD6uM0VrX1WBt6YA8eYJuIrdv6IQzziFQjJrOQH3ItLNxF9Iv3l8
	 1axo7iHvhKekVSF3WShVT4LoTuVZOGpiRnrASi1uk69FcqWRaZ6uYl37PSOuI7cCQr
	 CetX7rgIOL1fAxb3noQ7kdr2GC5YnfcimvqtbSWSqyeaebXaYCGV+F1OVwpc0idAP+
	 ZD5cE1NQnM04kao4DcBn49Xt51nslGL9ON5G9pBbjT8eg9Eq/I66H16nUr08/eqtY5
	 JqCbWBczu9JLw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 48431380AA50;
	Wed, 11 Feb 2026 05:00:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: fix
 qcom_ethqos_serdes_powerup()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177078602107.5556.17371002547331944869.git-patchwork-notify@kernel.org>
Date: Wed, 11 Feb 2026 05:00:21 +0000
References: <E1voPUH-000000083ji-25FH@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1voPUH-000000083ji-25FH@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mohd.anwar@oss.qualcomm.com,
 netdev@vger.kernel.org, pabeni@redhat.com, quic_snehshah@quicinc.com,
 vkoul@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_210027_916703_4963C432 
X-CRM114-Status: UNSURE (   9.42  )
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

On Fri, 06 Feb 2026 17:19:21 +0000 you wrote:
> Add cleanup for failure paths in qcom_ethqos_serdes_powerup(). This
> was missing calling phy_exit() and phy_power_off() at appropriate
> failure points.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c  | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [net-next] net: stmmac: qcom-ethqos: fix qcom_ethqos_serdes_powerup()
    https://git.kernel.org/netdev/net-next/c/3a4687366148

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



