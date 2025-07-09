Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8024CC83F10
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 01:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a8nFHEa/VZoBXkWwUh0jKR67PPEc+8ePja19IZ0t4eo=; b=V08Pd+Nt99kipEs7ULuIjB6dD6
	rXpy8Y14JwFCCibXtk15kPWEX8K0nziXoSQHx6QGiTeS/544qAvPYoVn8pc1Nsvn+trYP3AhQREKt
	2T0wHWbHBlBTJ2Rb7GOPn149bAMAMm+11WC8Ku7EQaA02bpqQYHEZ9xidmLy2NxxV8Du3KKboyZ2X
	IyrJRx4i6dljLkqHUFUzE4X8JCKi5vxUwKEHO5FwU/hV+Phk0y8OkOWChtPwa6O7cVguwMoz7Y/j+
	rHyi/ggQ0rFUEHwtR/rdzd3S9/FpS9y+AKEBio5EK1MF5csBqZtG1R7psH+xfOuZzqQV/0SozkbtA
	baGGvAqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZJfW-0000000773s-0Bws;
	Wed, 09 Jul 2025 01:32:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZJd9-000000076ne-2Ai0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 01:29:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A5D5A469E1;
	Wed,  9 Jul 2025 01:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82E03C4CEED;
	Wed,  9 Jul 2025 01:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752024590;
	bh=7dXDS5QBly9oO2sE1NM/JgPZtBGwsyEdMtJpZ+LZ7Tk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hBxye0uMCrEUrTeWl/Qf/7v1u4kA0MVIgjCW4N8ffwujCLYS1JwAbATanCZtksnVH
	 ZW4QoF0m/I0TgKgFAqUz4gPFy2KEg3SwR6G38x/dCDa4qHhO29SB2jZ4Vi3EPdTGR9
	 ypdy370jSOrKTuTrHl6CkLehzNHQUqmevR5VgDD/yyaR0EPHamkM4UOAP71RtpijlD
	 4xZmxtKHhIR1g/y89Gq61JU4/Rh9qFDQgekmBdkznEVKu7fn6d2p5krt4EaAfUYT99
	 PbUfUfcHbdZUdLIC9u7t/+Uvqh9wEzB7wvHnq2LmKeCahh0IW52prFYf42kPnmRCHN
	 8GPS8n4NsR49Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71845380DBEE;
	Wed,  9 Jul 2025 01:30:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] net: stmmac: Fix interrupt handling for
 level-triggered
 mode in DWC_XGMAC2
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175202461300.186229.18400851039185559146.git-patchwork-notify@kernel.org>
Date: Wed, 09 Jul 2025 01:30:13 +0000
References: <20250703020449.105730-1-chenchuangyu@xiaomi.com>
In-Reply-To: <20250703020449.105730-1-chenchuangyu@xiaomi.com>
To: EricChan <chenchuangyu@xiaomi.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, fancer.lancer@gmail.com,
 guyinggang@loongson.cn, chenhuacai@kernel.org, si.yanteng@linux.dev,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, xiaojianfeng1@xiaomi.com,
 xiongliang@xiaomi.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_182951_573794_A12BC03D 
X-CRM114-Status: GOOD (  11.28  )
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

On Thu, 3 Jul 2025 10:04:49 +0800 you wrote:
> According to the Synopsys Controller IP XGMAC-10G Ethernet MAC Databook
> v3.30a (section 2.7.2), when the INTM bit in the DMA_Mode register is set
> to 2, the sbd_perch_tx_intr_o[] and sbd_perch_rx_intr_o[] signals operate
> in level-triggered mode. However, in this configuration, the DMA does not
> assert the XGMAC_NIS status bit for Rx or Tx interrupt events.
> 
> This creates a functional regression where the condition
> if (likely(intr_status & XGMAC_NIS)) in dwxgmac2_dma_interrupt() will
> never evaluate to true, preventing proper interrupt handling for
> level-triggered mode. The hardware specification explicitly states that
> "The DMA does not assert the NIS status bit for the Rx or Tx interrupt
> events" (Synopsys DWC_XGMAC2 Databook v3.30a, sec. 2.7.2).
> 
> [...]

Here is the summary with links:
  - [v2] net: stmmac: Fix interrupt handling for level-triggered mode in DWC_XGMAC2
    https://git.kernel.org/netdev/net/c/78b7920a0335

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



