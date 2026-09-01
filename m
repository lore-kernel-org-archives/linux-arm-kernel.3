Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41286C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 00:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6bD9pjtuRl9hU9C5HPULWpXB9xdeI4tOkxBYaaThOYk=; b=P8ceMM7fi4840swRHLNM0m8IIy
	cY9aqb8QO9pqW8ETF5+2B1VnyT8w3XZeQzjzN8AoA3peSDl4PHI1mTGUtvnKwMkU4Cy9bI+IJZAb3
	rP6v3A6XjTxzfVA5vRxYqlnfVX/k+9SUVNGP8m42umn/sMmihVf/QB1QgdccknVB/pK1gSa/N7IIz
	B8eOBGQmUiRzPvB9WRtnO30wclv+KZWc4h5AW5kH8xFdpWhfFBeVNUE3UzQMTof9j38TSFzSAmd6o
	oTb3jFbcQfB05bt27A9nnds1GBwfvSw/bb0CHlT9BcWMpG4bPWUTSTyHS8fzSVHKgbilwXkOtwRi3
	1U4zXqYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1CFU-0000000AiQJ-2nVJ;
	Tue, 01 Sep 2026 00:21:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1CFU-0000000AiQB-0wm2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 00:21:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F01A406DC;
	Tue,  1 Sep 2026 00:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 710561F000E9;
	Tue,  1 Sep 2026 00:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788222071;
	bh=6bD9pjtuRl9hU9C5HPULWpXB9xdeI4tOkxBYaaThOYk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=itSMjdzeLVU9wIpAKN8ugLqjY7/+glY+jcu8UsobxN5MylrXuYCy0VcO6ku9iKjX2
	 E9FW9R+gUUFttJZVJsITkrEcTfBYWVhUewDAT6oMTPkK5mo9dWamCFf2pCg1evpC8i
	 GUxYRlQqwtzmdexmVEHcFLf3jrtW0Elcx8wZlvRB+tq4FEUzjRRumV9vDophjhuL3g
	 Zc855y4daC4J8G30FkIQ7lKxY0w5UlsxgJemLuPrH67mkP1WmGsNpSnL+ZjaCGfpat
	 IXxgCNkG3PIpkZPpZ4wLaVfYtjeChKMCNuEDz3DeYnKNLjX0jk4mND75YX0lda3RD2
	 K3cmTzrqTZoUA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93924392447E;
	Tue,  1 Sep 2026 00:20:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: stmmac: stop DMA before freeing descriptors on open
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178822201413.848040.18166339908544983659.git-patchwork-notify@kernel.org>
Date: Tue, 01 Sep 2026 00:20:14 +0000
References: <32EB352EB66D74E7+20260827025415.2684733-1-zhaojinming@uniontech.com>
In-Reply-To: <32EB352EB66D74E7+20260827025415.2684733-1-zhaojinming@uniontech.com>
To: ZhaoJinming <zhaojinming@uniontech.com>
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com, andrew@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 boon.leong.ong@intel.com, weifeng.voon@intel.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, joabreu@synopsys.com,
 f.fainelli@gmail.com
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

On Thu, 27 Aug 2026 10:54:15 +0800 you wrote:
> In __stmmac_open() and stmmac_xdp_open(), the DMA engine is started
> before stmmac_request_irq() is called.  If the IRQ request fails, the
> clean-up paths free the DMA descriptor rings via dma_free_coherent()
> without stopping the DMA engine first.
> 
> With the DMA engine still running, hardware may continue to access the
> descriptor ring memory after it has been freed.  Add stmmac_stop_all_dma()
> to both error paths, matching the teardown order in __stmmac_release().
> 
> [...]

Here is the summary with links:
  - net: stmmac: stop DMA before freeing descriptors on open
    https://git.kernel.org/netdev/net-next/c/25c1f6111034

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



