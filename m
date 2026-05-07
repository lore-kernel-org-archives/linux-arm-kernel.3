Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85603CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 15:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7Pccnh6sraLegujOm73Wovfh0hPhYT4BiceMvhV+Kg=; b=k1X8tsorbcoBZusxNN/PNiQiHC
	LPp28q3djD1WovYvukE5L6yA0UFLOEoXfmh56VVDMGRtthnrwNnQNgekaXKkcQK8mtPr8GevDK4QP
	yuerMii6YrX928n+tVSoHree2He9uLCbxEvkuy+gYQeLOrbvgPCY+3xOntw7T7IUx3LjGqZPaZxO7
	kzQJNtkzqUUw020wDKW8o8IO3PH4mUggd3iQkrZaOZ2rRsU9flsJ3aMwSI3V8rjz0i5+MkKi5M2R7
	1QBpN1+wN6Xf3AH3fDc2OOBDmXgtgw8J0/baeIdiZDDFH9Kc1iPZ84il5SYDHGTka6PJp8mGTFBpa
	jZA2a4xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL10G-00000004FsP-3yKj;
	Thu, 07 May 2026 15:51:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL10F-00000004FsC-3P7j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 15:51:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E87F060181;
	Thu,  7 May 2026 15:51:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96EC8C2BCB2;
	Thu,  7 May 2026 15:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778169066;
	bh=uhsrqHOzky90E/GDDipH5Wy+SbXWe48XToRSzO5ocXc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SWFLloY1hDgLvsbtrLAkKZUk0AANEkyO1ZfSAaYQl8uewJBobEtm/GWWIqnCvuqmX
	 ho2jhhdIpSKU7Gc7gtbNTEfGepPaXtgnanA6rlc53jkLcx+VJwUCtufuFJZzxS0KuF
	 Pf44SrBMwI5cBhRcR+xkihNFpGMoSBkfeNMvaSqaCMESCR6sWjIZkfUMHgvThfe5SF
	 SaLzSEhHXWWjWbRtBloFRr0/OFHB3/mHuv7CNKyyIt36Yoegl5mzC3gxitJn5Zh9Cf
	 kA59oqbNGxfPy2pMWks5lQF+u526+Bv7qgfMAwmfyAeROe6kMksk/VK+wMsiPsRxMQ
	 HsZzvO/s1/CwA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02CC33930909;
	Thu,  7 May 2026 15:50:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 0/1] net: stmmac: dwmac-nuvoton: fix NULL pointer
 dereference in nvt_set_phy_intf_sel()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177816901553.4048611.3374770303118328705.git-patchwork-notify@kernel.org>
Date: Thu, 07 May 2026 15:50:15 +0000
References: <20260506084614.192894-1-a0987203069@gmail.com>
In-Reply-To: <20260506084614.192894-1-a0987203069@gmail.com>
To: Joey Lu <a0987203069@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org
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

On Wed,  6 May 2026 16:46:12 +0800 you wrote:
> This series fixes a NULL pointer dereference bug introduced in the
> initial dwmac-nuvoton glue driver. The struct nvt_priv_data::dev field
> was never initialized after devm_kzalloc(), leaving it NULL. When
> phylink later calls nvt_set_phy_intf_sel() for interface selection,
> the callback dereferences priv->dev via nvt_gmac_get_delay(), triggering
> a NULL pointer dereference.
> 
> [...]

Here is the summary with links:
  - [net,1/1] net: stmmac: dwmac-nuvoton: fix NULL pointer dereference in nvt_set_phy_intf_sel()
    https://git.kernel.org/netdev/net/c/dedf6c90386d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



