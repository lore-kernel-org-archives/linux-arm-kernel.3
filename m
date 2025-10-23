Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815E7CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 03:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGwGfZRu/HPQfbFlNayTFjFGlam9LoU9tX58WC6exJE=; b=i6rqtZNNkr7+C9Qj4fOfCXaRQQ
	HxgPlhV+PgQoqpGcMn/OsWjy9MMkG4aDjdl5Wz+ZtIDd44lAH2zs1bFDE2bz3BW1rXFyJEaW4ARJb
	wE3vF7f50HzeaIhazIww+KVEhuOCsMaUP/nP3cIqC0GHlgTbCDD7G1QmeuiqCQI+DPCrKlFysLpkc
	FH7iLhkowuZaKav3h9uj/4Hrx7pXel+NMWZNgZEZVLzA3Ejyf9rzWISumGqIFun7iWisiNEJ2ShCv
	QvbFTHKnAR/RMe3YofMkYxIsah8LhIbeblvNdkG2S1+SLRgcIJlguOJjasZ4dvYRXMsKT4Ly8NxfA
	C9rbBxJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBmHd-00000004ySq-05RW;
	Thu, 23 Oct 2025 03:46:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBmHb-00000004ySM-3o7l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 03:46:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 17BFF605CD;
	Thu, 23 Oct 2025 03:46:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B955CC4CEF7;
	Thu, 23 Oct 2025 03:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761191194;
	bh=l86IeJ3vP3EDYi7bu42IQQyF94BwHyCQ8KT6skv5odE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mMicCGIf+QkaQtTnDkGmUECePcMi76oudIsDNdOWs9wSC89J1wqCNlt8QfDhr4o+v
	 r/q1OPBk4qp+W553BOuwowDQoD5nADevx8RcJCnc58r8t72gF5XeZ5SDqLDo6H32XO
	 98Pvy6eVXIfh+lDC3IcwO4F7/IgIdl/8mWHJJXiXtevGqnN6SD0FeLStfSPyqz3VFX
	 jB2zS1ehXFLEgm8zzOLFhuvUsEx1gz+hzEBj3LcPTw193b0eqWP0MgoHo6EwPdfG66
	 DhHCesjq6Mi4QQd16114mp3zEwozN2jReaaSXjKcP0eGEqFNkvbewL0X78J+41bltD
	 cTbKVxgCwm4tw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE3BF3809A04;
	Thu, 23 Oct 2025 03:46:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: stmmac: replace has_xxxx with core_type
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176119117525.2145463.932539356241719482.git-patchwork-notify@kernel.org>
Date: Thu, 23 Oct 2025 03:46:15 +0000
References: <E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, wens@csie.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, jan.petrous@oss.nxp.com,
 jernej.skrabec@gmail.com, jonathanh@nvidia.com,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com,
 richardcochran@gmail.com, s32@nxp.com, samuel@sholland.org,
 thierry.reding@gmail.com, vkoul@kernel.org, vz@mleia.com
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

On Tue, 21 Oct 2025 08:26:49 +0100 you wrote:
> Replace the has_gmac, has_gmac4 and has_xgmac ints, of which only one
> can be set when matching a core to its driver backend, with an
> enumerated type carrying the DWMAC core type.
> 
> Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: replace has_xxxx with core_type
    https://git.kernel.org/netdev/net-next/c/26ab9830beab

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



