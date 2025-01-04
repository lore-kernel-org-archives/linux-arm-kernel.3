Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C525E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 16:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uabDuztTqdXSRutHL7iN6uqUdPFDaSGz5sWwI8QdqWs=; b=XYr4eTqkeRFlLC/TR6UY+6hm5+
	IBfv6GnAziMucQFGBc08MrA9LYXMrjkjXVQPYv0wlBgW0p9qu0+k+s4a5PXCkL/Tx87ceF3kK310w
	UsXhpGCimPz11aXv6rXxkTbzuhxUVcpuv8oRplA4DCnFD0CxKj6M+0HYfFUFZ5qbIG+1uYdabqigb
	YemDKEaoSMy4ZRsMTU3pNujz4lIrz5tVAabgMt3R7YWs/IcECvEiuEHQkBGpnkXP6+msNe5Xyry1k
	+0eQOlWruxv4uPWfSMGvqtstNQ+bEH54xgMuZEQVSybkQPbc3/foNhqAiRnswgbyZx2pi1eOX4VB5
	i1N8dd0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU7DL-0000000FHjD-0sM2;
	Sat, 04 Jan 2025 16:41:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU7CA-0000000FHWz-0jfw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 16:40:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A54455C4C2B;
	Sat,  4 Jan 2025 16:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C8F1C4CED2;
	Sat,  4 Jan 2025 16:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736008812;
	bh=tCT+7Os+RfJEqwMhOzVKsW5XxM91BFqHnsUi9tzq2kA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oy5Ey4K/rJxBiok5Y26aq2c/JBdNJxBbpvZS1uXWMh20I9iys5W5hqsFYHW/eUHHd
	 v6ZOaZjH0QXOtztLErB4hHvKWZ4EJC0JYqxewwkswSUuw1JL7Y1H/F8EKXFR+Al8fM
	 vfJkxYHjMO15shYbx6mNK52yMbekrMDrzerPB389rbERkWaV1Ejvz16UGeEVLhu++s
	 nqxfzuwZJCQ5j/PJPRmDGLL8E4FhT0u6U9zFCKvO13Zr88ZXEQSj4WcYgfsg5rH/R1
	 Ztmrntfq2NUoD9c6xJ8+q8lbxwVYSxNHQm3cFTxiFSSGUTSN671BANUyeixxGXbY34
	 MFTMC3T5e+i4w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 716E8380A96F;
	Sat,  4 Jan 2025 16:40:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: stmmac: TSO: Simplify the code flow of DMA
 descriptor allocations
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173600883331.2467289.14997468976709274364.git-patchwork-notify@kernel.org>
Date: Sat, 04 Jan 2025 16:40:33 +0000
References: <20241220080726.1733837-1-0x1207@gmail.com>
In-Reply-To: <20241220080726.1733837-1-0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, xfr@outlook.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_084014_262559_53435361 
X-CRM114-Status: GOOD (  10.13  )
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

On Fri, 20 Dec 2024 16:07:26 +0800 you wrote:
> The TCP Segmentation Offload (TSO) engine is an optional function in
> DWMAC cores, it is implemented for dwmac4 and dwxgmac2 only, ancient
> dwmac100 and dwmac1000 are not supported by hardware. Current driver
> code checks priv->dma_cap.tsoen which is read from MAC_HW_Feature1
> register to determine if TSO is enabled in hardware configurations,
> if (!priv->dma_cap.tsoen) driver never sets NETIF_F_TSO for net_device.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: TSO: Simplify the code flow of DMA descriptor allocations
    https://git.kernel.org/netdev/net-next/c/356939999438

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



