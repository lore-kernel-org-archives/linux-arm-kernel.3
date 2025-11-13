Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCFECD8C99
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 16:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0NnnmfmEUAYYN6upko1yUq+RFn79XsGJFxmZ6KPYhM=; b=OeHmhjtQMZy+Hg3x7U4LZrX/f3
	cnGjYnEfd6MqVpsIz4yT7h9DPx8L6NvDvsrWeA4IbVZqMVQekkKy86iRsnGvfCWDVGTAM/Km30GWo
	MsOGabJTGZj1pxCzn3d9+Ff+Wstl44HvzOfEgeHxMy20MJ8oOruDu044o4Ht0zzXro9M5zXHHDURV
	1TSr+mL4n8AW/J6q15P0iGlghulWJAZMGD+H3tYVnApQGpcT3zqFHpHVSHMySy0xYkT1O6JlusCQh
	HocoECtmt2XrLs0dEDk3Qm/2XxAeh4H3Xw0ox7buMEROQjbw9UJYBTO1MwK5axei5EsmhsOe61h6a
	M4A5IFdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZuH-0000000AmG4-3XSY;
	Thu, 13 Nov 2025 16:10:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZuG-0000000AmFd-26XP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 16:10:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F063B604D1;
	Thu, 13 Nov 2025 16:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92349C19424;
	Thu, 13 Nov 2025 16:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763050240;
	bh=veR8/nbDtLvQOcg0BwdTy39yB/WVz1ADHJK/sjmFuRY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hZ/w9DlzOSe155fEEvNIKgEaJAfii5826P755bO5SGR6Inmfarl8sWNLaK8wVLJ3V
	 6/nyyb+pM3M78fa3dtzU7kF7nZCviHQ8G66us/WC7nynQ72xVshcSPM1rNaY9+xRIB
	 /GEx2457CxujiDZJ9/CUOp00QqjpXbtyMw3NC2QoHbkgyjRSH8Alipk9T/Tayy0tug
	 gALnDJ+bd9H46n84MFtObcf3eW/tRH1qqszz/w7KiOmOEuEmdd+veSYp3CzwIoUe6T
	 gkOiZG7kdYZd9X5rZ+oeRphjhl/ytJKrLMbWuT6r0RRx4szDetORNhN3cU2DLnhOrQ
	 +mYyBnVCd/82A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD9C380DBD2;
	Thu, 13 Nov 2025 16:10:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: always allocate mac_device_info
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176305020974.908070.1045942084214006271.git-patchwork-notify@kernel.org>
Date: Thu, 13 Nov 2025 16:10:09 +0000
References: <E1vImWK-0000000DrIx-28vO@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vImWK-0000000DrIx-28vO@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, wens@csie.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, jernej.skrabec@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com,
 samuel@sholland.org
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
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 11 Nov 2025 11:26:44 +0000 you wrote:
> The ->setup() method implemented by dwmac-loongson and dwmac-sun8i
> allocate the mac_device_info structure, as does stmmac_hwif_init().
> This makes no sense.
> 
> Have stmmac_hwif_init() always allocate this structure, and pass it to
> the ->setup() method to initialise when it is provided. Rename this
> method to "mac_setup" to more accurately describe what it is doing.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: always allocate mac_device_info
    https://git.kernel.org/netdev/net-next/c/f694d215d340

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



