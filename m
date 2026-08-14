Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC348C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 03:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7mkYw3MhVvZznrtz4d6TGUxxwBotmFtBYc81IbTb0g=; b=d3ZXVpMIUxdKxWmEoiZjz+keKa
	uLUkg18rywV0vO0bJDY19jM6cQ0Pz+QX/uzFY2Tq27Na2nW5mw6BLzWFw8YQGf/aNYCu1i1JB/OjH
	RKkMPieHnkqml68DBidM69edXzbwnyYYe1OzbdexpiNEup5wo36euBIFRiR52G8kqpJBA6NOHJM8P
	4UmQlV9A1NUEpRyFopMaiSguweIX+1qPPlfq3meTIBYKApb5Ang7RgpUGcNGZCv1XrIEXugu6GCdX
	+LhcUhBGqWnC+p5iyRnT/IJIhDJ2U+QKFZ0kxRW+PItqoI8yU47qQJTbTbQXDYXMBN28ZNOYKv3jd
	Gh2x+ejw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuiXg-00000001tss-1WW0;
	Fri, 14 Aug 2026 03:25:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuiXe-00000001tsV-1fli
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 03:25:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BE81740D6E;
	Fri, 14 Aug 2026 03:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1B5E1F000E9;
	Fri, 14 Aug 2026 03:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786677909;
	bh=y7mkYw3MhVvZznrtz4d6TGUxxwBotmFtBYc81IbTb0g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=RGSR6aXo1jDngPqEJfL+/IGOmZkLbTGR2b3y10vC9VhRt5s/VnrjSZubjyTwBSTaX
	 nNTXxzs5Zlg3LS3kfoMsSThNNG3ELVbnPSSpFR7L8/0Q6kfMFAaSUGlHDAueqn0MCy
	 BxraMzy7gXOauYYAnU/72DZVBKAIGuKA6jRpI2p8a9HEZwTTX1Mphey5yEGv2CXOoF
	 BuJ9AjmbWEmHEaqWiJeGarp8YR+bVimaf6ica02KscgUEZ8i5Ru1w+dg8yxDPml8ow
	 uW4yU4B9QPQkoM2apZ3ELwTNK2qWLCt4PjmF6ZYvtjK8noSZwPVQeAd7dMvHxlh1OH
	 rc01Puez3vihg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56A613810900;
	Fri, 14 Aug 2026 03:24:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: stmmac: intel: Add missing
 pci_free_irq_vectors() calls
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178667786389.3150297.7630316511132151539.git-patchwork-notify@kernel.org>
Date: Fri, 14 Aug 2026 03:24:23 +0000
References: <20260810-flo-net-stmmac-default-affinity-core-v2-1-d2105780b8ca@siemens.com>
In-Reply-To: <20260810-flo-net-stmmac-default-affinity-core-v2-1-d2105780b8ca@siemens.com>
To: Florian Bezdeka <florian.bezdeka@siemens.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, boon.leong.ong@intel.com,
 weifeng.voon@intel.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Mon, 10 Aug 2026 15:19:17 +0200 you wrote:
> The IRQ vectors allocated in stmmac_config_multi_msi() or
> stmmac_config_single_msi() where never explicitly cleaned up. As
> pcim_enable_device() is used, all sorts of other functions are switched
> to managed mode. The missing cleanup here isn't actually missing, it's
> buried in the depths of PCI code.
> 
> But: There are some ongoing activities to remove that cleanup magic.
> See the linked discussions below.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: intel: Add missing pci_free_irq_vectors() calls
    https://git.kernel.org/netdev/net-next/c/a7c44619c697

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



