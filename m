Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE35C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 18:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FuHDJj5qxamd3szPOMXBLy9r+dIbi36X7BRcEam5xuk=; b=RwF0GHj62f59EKjbbX7KVSYrpR
	lBJeMxsA83dgAOghQAjRTmGW8wKvZ30Hv25NEZ0vYqvkKFqky6wZ7dIt+leV0DqKciadblzBF/iUv
	tvcJL7ppcaCdCYXSPUDgP3g9ZJgKxMLgquFKdftZwuxWdSBOxGlGPz56PGA4IWkKqJ9a2oUCbe+Er
	dHhlA9z6YF8+kINyIrcg+c94MFN/p3nTpRk4fic6MYwilZc0MvCzSn6WF/u0WWHEsHBLpoxFJ5W32
	CTxORe04mGvITPNHG0ErCyL+XOojwa4+UY7cGkJpXRgxX/bF88Hon6zV63KhDE8rjSTf6G+P2f+m2
	WlWmScvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuy2t-00000009pMe-0a5f;
	Wed, 19 Mar 2025 18:21:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuy1D-00000009pHH-1YhX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 18:19:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F063682C6;
	Wed, 19 Mar 2025 18:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540ACC4CEE9;
	Wed, 19 Mar 2025 18:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742408394;
	bh=1uv1URa/oRq4i2/FSY/Z0hXKn2aDIlpZ/PJX3KA9iqs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Ogkry/uLGFZPAuy9ejUxn3abPrdKF6wuiAYtx7Ke5zGAoP9cciScohsOPprgiOBHj
	 Mq2O9kLJliQOawhOYOX0HV4eHyeqyahRbkeBdvQRW/QrcYCNbMATJElWb1iEJhQ6De
	 Yc1hgyUQmpXnj7PlAexV3FvsN7LZ70bJHmRP7CzJUPB4/XLAI0s0XorSnA/fxgSRom
	 WYU+okgQyi/zJLo7oBxhHXo+ZcUUVvBLe9VsBXdTSaa2LQzettZzLnvnT24mLFwc+0
	 uj9+duZ2Xo6/NN2M94mFN2E+Lykvv7lArfUaBdIAfoB9eurJ9/C/uh8mK5oJU7lU7/
	 sblt3k6OiHOFQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 369E1380CFFE;
	Wed, 19 Mar 2025 18:20:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: stmmac: dwc-qos-eth: use devm_kzalloc() for AXI data
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174240843003.1143902.13702964341385385111.git-patchwork-notify@kernel.org>
Date: Wed, 19 Mar 2025 18:20:30 +0000
References: <E1tsRyv-0064nU-O9@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tsRyv-0064nU-O9@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, jpinto@synopsys.com, larper@axis.com,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
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
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 12 Mar 2025 19:43:09 +0000 you wrote:
> Everywhere else in the driver uses devm_kzalloc() when allocating the
> AXI data, so there is no kfree() of this structure. However,
> dwc-qos-eth uses kzalloc(), which leads to this memory being leaked.
> Switch to use devm_kzalloc().
> 
> Fixes: d8256121a91a ("stmmac: adding new glue driver dwmac-dwc-qos-eth")
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: dwc-qos-eth: use devm_kzalloc() for AXI data
    https://git.kernel.org/netdev/net/c/c9cb135bc604

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



