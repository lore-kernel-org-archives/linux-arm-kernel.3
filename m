Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA74CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 02:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTwrD0he+f24KqlpT3Ss1w3zmdwF2PBi99LPn1qOni4=; b=TGB4kYdHvm0YmKghNk67Nfe77j
	BmoqwYDv9nBOLHIZpGnOGvzs/mtGlbu/BbIAGyhepwGwp/DCsl/xJYZuYjFCLUwnY87XO4mzNd1nz
	fMhdA+9YNn1OnMNTb1tadhrlXNhmuf060qopdhtmPnPlYaj6RftO1VuDWNsF2eZaS41U2/lXRzEDO
	xxKDl0eBsQxUQab2hvOWR3IV5Akm5Cl/8/U8H+PeunGbY5TMC+dZ9To4CpPK0z00YCFq8U9co3HoE
	M2AJ+ufeYp9Ti1t+wDGY2nE/xVim9f5jSyUDGRwLdEvkjEMUOH6rtXstA3MgsTGyiJyHeiuikz2ZO
	cCmSMLkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ0AM-000000080FQ-0xtm;
	Wed, 12 Nov 2025 02:00:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ0AI-000000080EH-3M6E;
	Wed, 12 Nov 2025 02:00:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CCBF043C33;
	Wed, 12 Nov 2025 02:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A715EC4CEFB;
	Wed, 12 Nov 2025 02:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762912853;
	bh=Juz6pLF7SAhgmhKL45ZMU0F5tm2E81SzTf1c2RwwZA4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HokDcZybggXfHF3SNp/0uNcSapDRBFf1O6vQpLIU2pojcO61vWpR9HJibg4Jz1e+0
	 e5+Ku76PdB46WqZ3+F5yNqCQM9hzqrgxbhYCYxFD3YKCirmK/4doMpl7B8nxNq0292
	 dhM22tKgktPPd0poKBVbgQQqVepMjJlT8dDtrkaPO4vdaiEy24+QpkXoWIhQxsxXJC
	 suVvdv+GEjcBErCTq5sgx09mK0LhrHvx5K0xHlai1nc87B7x/S1gHQQ1z3n9FTnuc1
	 piFo0/axYSBrVrAdE0ExxJ7FwpaLCiVOYg3SWBd5wdX+fK1iMCqwUC33+xIGFm4dTU
	 Reyi7X//KPopw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB14A380DBCD;
	Wed, 12 Nov 2025 02:00:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/3] net: stmmac: convert meson8b to use
 stmmac_get_phy_intf_sel()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176291282374.3632748.15831065649442897979.git-patchwork-notify@kernel.org>
Date: Wed, 12 Nov 2025 02:00:23 +0000
References: <aRH50uVDX4_9O5ZU@shell.armlinux.org.uk>
In-Reply-To: <aRH50uVDX4_9O5ZU@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, jbrunet@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, martin.blumenstingl@googlemail.com,
 mcoquelin.stm32@gmail.com, neil.armstrong@linaro.org, netdev@vger.kernel.org,
 pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_180054_861677_9B3DAB05 
X-CRM114-Status: GOOD (  11.31  )
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

On Mon, 10 Nov 2025 14:42:26 +0000 you wrote:
> This series splits out meson8b from the previous 16 patch series
> as that now has r-b tags.
> 
> This series converts meson8b to use stmmac_get_phy_intf_sel(). This
> driver is not converted to the set_phy_intf_sel() method as it is
> unclear whether there are ordering dependencies that would prevent
> it. I would appreciate the driver author looking in to whether this
> conversion is possible.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/3] net: stmmac: meson8b: use PHY_INTF_SEL_x
    https://git.kernel.org/netdev/net-next/c/12f42597ab14
  - [net-next,v2,2/3] net: stmmac: meson8b: use phy_intf_sel directly
    https://git.kernel.org/netdev/net-next/c/52d639da6fee
  - [net-next,v2,3/3] net: stmmac: meson8b: use stmmac_get_phy_intf_sel()
    https://git.kernel.org/netdev/net-next/c/da3d1501235d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



