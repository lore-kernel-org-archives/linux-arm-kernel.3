Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEEFCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 03:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/AokfN08eUT41S8mCgoh7WscRYXj/iF4906etzKQXc=; b=LT+zKxNLKS9sAKbgIhjAqOI5k7
	jCzv8eAtnjHQ2CrXAsSg1s/5Rs2MCbOpaRyekePunWHdzOFEzLq026mIoWo0xuiN8bCmT3MzhWLzd
	fmgDs0/n+IupYQt2FW/VId15oamdrquMUSwPEeqUtJHqL1b7WnK1CmMIa+2madQhtAHkaCUp8ACNj
	uiWnMDc6SlWSxa321xtGMvX9R1InJOX5HrNOcc+4q0DR3yM3X4zIXViyT85pf6xuSq9ySbj1qfSCU
	HzJHOObxnCAKfaAmMioyKFHKTqjT4Z+tsdN0KsnGB1wCfBQp4nHja8h1j8F/bpYWXRkZN0IvT5IbW
	nNP0UtLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulfdg-00000009iFZ-1m1s;
	Tue, 12 Aug 2025 03:25:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulfYS-00000009hca-03IC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 03:20:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 634B85C6596;
	Tue, 12 Aug 2025 03:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10E46C4CEED;
	Tue, 12 Aug 2025 03:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754968803;
	bh=RWpIXohTMH+rLKlU0Q9IIWKlNizcxyUtaCMlb8/X/T8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rqFUv+h5p7BXqG3wQRl3h/371b7LINHtZlFCII5AQOTSMSulDHuS4n8THBqaQcYTA
	 l9D02iS++8PHE1T5DXed3WzUWVTkFwHgx6SxKbFBNLTtuwhQOyVriEhttuZqpPJdmv
	 F23LAkqJgDr14mkenFPkbGXYo+bNxbtBsUcWek5DL1xXDFOOlv5zqpoWMYMIM4qmmR
	 ou0iSlbKjKvG81PohbYBpSpBkJZbYC1Ld2xc0NZtGNtYjauu3MpJtBvh4e5w+NIb+R
	 cZ7N/WScjyocPXu0D1fk4X2FJ4n6LOhSUMR35+dqyfoSB/IDtUHVmFX6DvZI5zP9tw
	 4wA6cUelkgrUQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C04383BF51;
	Tue, 12 Aug 2025 03:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: stmmac: dwc-qos: fix clk prepare/enable leak on
 probe failure
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175496881499.1990527.15915957162598750086.git-patchwork-notify@kernel.org>
Date: Tue, 12 Aug 2025 03:20:14 +0000
References: <E1ukM1X-0086qu-Td@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1ukM1X-0086qu-Td@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, jonathanh@nvidia.com,
 treding@nvidia.com, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_202004_113904_9EBB9C1C 
X-CRM114-Status: UNSURE (   9.34  )
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 08 Aug 2025 13:16:39 +0100 you wrote:
> dwc_eth_dwmac_probe() gets bulk clocks, and then prepares and enables
> them. Unfortunately, if dwc_eth_dwmac_config_dt() or stmmac_dvr_probe()
> fail, we leave the clocks prepared and enabled. Fix this by using
> devm_clk_bulk_get_all_enabled() to combine the steps and provide devm
> based release of the prepare and enable state.
> 
> This also fixes a similar leakin dwc_eth_dwmac_remove() which wasn't
> correctly retrieving the struct plat_stmmacenet_data. This becomes
> unnecessary.
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: dwc-qos: fix clk prepare/enable leak on probe failure
    https://git.kernel.org/netdev/net/c/89886abd0734

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



