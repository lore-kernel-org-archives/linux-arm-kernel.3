Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B69CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 13:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xoEjR6t5ELBV0Ehld1uRhN2++C9qxzbzrI+HEJf6tz0=; b=ivhGtGq803KwuOB2LfBuVwEclw
	jwDEZkok7i/+zw/4z92gxrz0akGSoIP/rKpZ8JJO98X+74YfNIrpW8cBOn/8Kvl+vzFbgmTgpfjLi
	RdPEGr30qumovcmx0kqpu62mM2K8aKVxks2xbZXd0V3qYuCAY0t6N6VM1IcVsKRJwzPZHsAqx0lYV
	Zq/OtfoJnmWCY2z9sIhLV0bdMHgQfBarWcFo0uN+KeW02TcMPjw1mIKmjfIxnU6/Cf0UWvNNEmcuC
	wCesrr10LPnsLB1V9M1R0cSYdPjEj8QdzLFRXPGFIOfsNVTXZnwceJSbPVxdAhy6aojtmzgUq6hCF
	yFRWrASw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInax-00000007XBx-2Scc;
	Mon, 19 Oct 2026 13:40:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInaw-00000007XBp-417t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 13:40:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 174426020A;
	Mon, 19 Oct 2026 13:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF7421F000C4;
	Mon, 19 Oct 2026 13:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792417205;
	bh=xoEjR6t5ELBV0Ehld1uRhN2++C9qxzbzrI+HEJf6tz0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=d6Rv15TourIfcTkDQL3m+iTso1zkZP8LN7F0q6Na/vSwDJ4/n4WqGvm8HprhfxcAU
	 u82mEx3jYGH5KatejGP3v8TplirpU/HvJmzLsgD60A8MNZUxajOqLqwByNPFslBK7f
	 ojrxIztwjGfW6BYXJCijRNIyxy8Qf9yWYGCVOI7GrDN5mm4426Rsw9+W6uoLc5Nim7
	 PgvInHCbSowZJ19KCkThCrDQGefNrk+nPD9HxH7Nmo3VGM2hCt9TXpJZbY9OU9oDiZ
	 QV+0NWzo1cU6dLI3TOXjam9YcFTnNYDUuIeSdWL02JT/3J9zHEEc6Z/BRj56AtkasO
	 azCOI1M5UpJVA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B44963811A5C;
	Mon, 19 Oct 2026 13:40:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3] net: stmmac: unwind the WoL IRQ after a
 safety
 IRQ request failure
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179241720453.2644569.6506845719154683565.git-patchwork-notify@kernel.org>
Date: Mon, 19 Oct 2026 13:40:04 +0000
References: <20261013-stmmac-irq-unwind-v3-1-fff4e2db805a@gmail.com>
In-Reply-To: <20261013-stmmac-irq-unwind-v3-1-fff4e2db805a@gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, pabeni@redhat.com, kuba@kernel.org,
 maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, edumazet@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 fancer.lancer@gmail.com, davem@davemloft.net, nb@tipi-net.de,
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
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 13 Oct 2026 11:37:11 -0600 you wrote:
> The safety IRQ is requested after the MAC and optional WoL IRQs. If its
> request fails, stmmac_free_irq() frees the unregistered safety IRQ and
> leaks the WoL handler. This can warn about an already-free IRQ and make
> the next open fail.
> 
> Move the safety and WoL cleanup labels into reverse acquisition order.
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: stmmac: unwind the WoL IRQ after a safety IRQ request failure
    https://git.kernel.org/netdev/net-next/c/ecb8b18051a1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



