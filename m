Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EF8C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 20:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TXKi/O6yvT3TjVOfpUbchx35R4JMj2AQfiR+V10Slg4=; b=OSFISmZta5vQX4ZyoaqAWhM9AZ
	7/ey95hSci/qQ91s0b3l1Ez1ZOMD3dvPw++KI3EQXzqBw/4tUKbUo71mlyo6dk39QEBat4g/AlEj0
	PiROSciSEMlxhxC6c9b2yH6gKhabl6uF/T+S/RaMbqNMynGtwnVf7mC6kTRhPgam4M/vmdYnDtyAw
	gZ31bsGZOcCeotvSS0g6d77JH4I/S5Emz2VBBvysrhkTMUAHGCmxANe+8vYb0lAz0h05sjeOtA7mT
	ASVSULK2O1S56xT+006u/E9miJ57GU47WVlHK0WxpqPwuirrnQKj51dDv3HDaQL/3Rsojg3eZ7gFg
	HpIF2ziQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdHb-0000000CgOt-3yvx;
	Wed, 22 Jul 2026 20:11:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdHZ-0000000CgOl-42oZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 20:11:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4481E43EC4;
	Wed, 22 Jul 2026 20:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25E851F000E9;
	Wed, 22 Jul 2026 20:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784751069;
	bh=TXKi/O6yvT3TjVOfpUbchx35R4JMj2AQfiR+V10Slg4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=CPRs3R4UkyJKVIdSr6w02ia6cnQ5u2ndEXlwgMXQ//Uqt1uQ2Zo04SLRp4vxqzKul
	 S+YYP0ZVdkmrKiZQ+saUwmqNi/j31565OcKWrw25NjPYxxpgGjKvudxNdXgpsylzjg
	 qpdgOg9exTKXfW/ug/rkOyUihFE9YpG1ze99nW8O9/+InCuVo/gdizJBvg1/0dIFWe
	 iLIx/2kkxsX0IHZzy1k5gIl8EX+gYkfZ+UiTnN9f2Iao2d1TO5u/YvI7+LIHRltsW7
	 o8mPk4d5agiyOP1qkUx64kHobXggCK4AP/vk3Q7YUhO74WeutEgsc66vjHB0Tbdxr2
	 hKpPnqiZVHzUA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1990F380CECF;
	Wed, 22 Jul 2026 20:10:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: stmmac: dwmac4: mask interrupts when stopping
 DMA
 in suspend
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178475103764.2005094.13413137826625826430.git-patchwork-notify@kernel.org>
Date: Wed, 22 Jul 2026 20:10:37 +0000
References: <20260720111534.163416-1-luis.la@mail.de>
In-Reply-To: <20260720111534.163416-1-luis.la@mail.de>
To: luis.la@mail.de <luis.la@mail.de>
Cc: netdev@vger.kernel.org, andrew@lunn.ch, maxime.chevallier@bootlin.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 o.rempel@pengutronix.de, ovidiu.panait.rb@renesas.com,
 rohan.g.thomas@altera.com, linux-stm32@st-md-mailman.stormreply.com,
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 20 Jul 2026 13:15:29 +0200 you wrote:
> Since commit 1b9707e6f1a9 ("net: stmmac: enable RPS and RBU
> interrupts"), suspending causes an interrupt storm from the RPS
> interrupt.
> Fix this by adding a deinit_chan() op to stmmac_dma_ops, which
> masks all default dma channel interrupts. This is called from
> stmmac_stop_all_dma(), so interrupts don't trigger while suspending.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: stmmac: dwmac4: mask interrupts when stopping DMA in suspend
    https://git.kernel.org/netdev/net/c/59a57128ae52

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



