Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7C0CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 04:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FC4mvdamaNMlB11ZIIj1ov41tTjkf80/yMFQScuPxD4=; b=W9SKujDO1FTs49uGovZGciREMv
	okb6xP0CWafgRpkk68TE0S2gVz5odAiy86QRiOp9fyxjwFC7IoX/cq2OF6qcPzLjZhFcbkp4VA3e1
	jt/JQSFVxpcHQhYZheeidHfc7z68buLkjnk+L4oBXB6S6J7p671EFKkWHgRFTwaNIsptBP0+sZN55
	yzfq3hVNhdFimNtSUMLneRI4z3qpAXRgMFS1YLyH4RNZ0fgz4hYEulPEbcGUNQe53qgUUiTEJcTmD
	HLfUwY3CpKU5lLvUIzgfuNxXvOI2rwosqioGCY7+kYO1un0izZ5l0HMHQDX+SSDIzOYJoRwAvHQdR
	moUK+7jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLCtq-0000000HKoa-19UC;
	Tue, 18 Nov 2025 04:01:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLCtn-0000000HKnc-0Bvk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 04:00:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DA211605E8;
	Tue, 18 Nov 2025 04:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9026EC116D0;
	Tue, 18 Nov 2025 04:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763438457;
	bh=F4b0uEqOqFj1s5GHGqft9QBk76aJhOT/4bbfeDN+fD4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=EVj55QexA1j6BraMVP2dlwMLN2CRv/d0/XGEpHooJ1Yep11lNKf3yEUw+fd74fQb0
	 0PUhZI/fW2p0yuHqQd3q+NUU3+AdT3QojoSXQprU7AWQSoI0r45Wt+HIOFqI0L5awv
	 Su4ZfcZEn6yptm61rjpMFZ9FlapiYRmCE/EuReG8l62zx9vGMT9SfNPeIK8mPd83+2
	 wPtLT1zFknOTZxQ/bPuO1EjtB9r41MWNVGQYLyTiKPtPqKMakQvowEA13SUjkzthic
	 2N/xdmvS2WmI4SzYmVNqDO2bgV8nFV0j56D5T2DF4w09WXfsSiZdzl+SZpc10DAP3U
	 sWTwPiVgRZEPA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70FE93809A1C;
	Tue, 18 Nov 2025 04:00:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 00/11] net: stmmac: clean up plat_dat
 allocation/initialisation
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176343842426.3578356.2997761543219536696.git-patchwork-notify@kernel.org>
Date: Tue, 18 Nov 2025 04:00:24 +0000
References: <aRdKVMPHXlIn457m@shell.armlinux.org.uk>
In-Reply-To: <aRdKVMPHXlIn457m@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, unicorn_wang@outlook.com, davem@davemloft.net,
 edumazet@google.com, inochiama@gmail.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com, sophgo@lists.linux.dev
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

On Fri, 14 Nov 2025 15:27:16 +0000 you wrote:
> This series cleans up the plat_dat allocation and initialisation,
> moving common themes into the allocator.
> 
> This results in a nice saving:
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c  | 43 +---------------
>  .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   | 22 +-------
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c |  1 -
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  2 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 34 ++++++++++++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c   | 39 +-------------
>  .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 60 ++++------------------
>  7 files changed, 53 insertions(+), 148 deletions(-)

Here is the summary with links:
  - [net-next,01/11] net: stmmac: add stmmac_plat_dat_alloc()
    https://git.kernel.org/netdev/net-next/c/511171e47f8b
  - [net-next,02/11] net: stmmac: move initialisation of phy_addr to stmmac_plat_dat_alloc()
    https://git.kernel.org/netdev/net-next/c/99e6ddaabdb4
  - [net-next,03/11] net: stmmac: move initialisation of clk_csr to stmmac_plat_dat_alloc()
    https://git.kernel.org/netdev/net-next/c/ae4f29712bf3
  - [net-next,04/11] net: stmmac: move initialisation of maxmtu to stmmac_plat_dat_alloc()
    https://git.kernel.org/netdev/net-next/c/528478a746a5
  - [net-next,05/11] net: stmmac: move initialisation of multicast_filter_bins to stmmac_plat_dat_alloc()
    https://git.kernel.org/netdev/net-next/c/07cedb9eed41
  - [net-next,06/11] net: stmmac: move initialisation of unicast_filter_entries to stmmac_plat_dat_alloc()
    https://git.kernel.org/netdev/net-next/c/bcb145c69690
  - [net-next,07/11] net: stmmac: move initialisation of queues_to_use to stmmac_plat_dat_alloc()
    https://git.kernel.org/netdev/net-next/c/d5e788e86fe3
  - [net-next,08/11] net: stmmac: setup default RX channel map in stmmac_plat_dat_alloc()
    https://git.kernel.org/netdev/net-next/c/b6d013b3260b
  - [net-next,09/11] net: stmmac: remove unnecessary .use_prio queue initialisation
    https://git.kernel.org/netdev/net-next/c/c03101cb1bf0
  - [net-next,10/11] net: stmmac: remove unnecessary .prio queue initialisation
    https://git.kernel.org/netdev/net-next/c/0a20999ed452
  - [net-next,11/11] net: stmmac: remove unnecessary .pkt_route queue initialisation
    https://git.kernel.org/netdev/net-next/c/6409249ccc15

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



