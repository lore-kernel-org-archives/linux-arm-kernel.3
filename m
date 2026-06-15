Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2075CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 22:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+UuQVCAyUvse1CZNlmPDFh59OEsUZB+xGlZxHGND+n8=; b=O0NP5cRxXJcGLfyd3qr/06pX4U
	RZEUbhAF+Ng34FnXO11tGfFVGpR8Z0jqSB533iQm0NrVLxeIbaEKyVj3doLWKFkcAVvXnkqR9Otyf
	GMzAGrwPHKupQzJdzR3Yt8xrTzH0JD2WIJRewq80NoyuQMKzf85rPnls7/sNPe58l8RBRsddcb/u3
	EbvPrhuC/bfHsGBxkG9bcd3/jqOauwxvrzmcfuZAHwh8AbdrO8N1K5NF01RQl08a+wh4Oj44PfAis
	EUK/ZbIktnROS56hqw4QZCwdUeucJf+ik4RZ8gNo/X5hZIrK0/NgCHaWQwjBe/XEWJ6FhrXpdSXcv
	NsuEAOIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZG8D-0000000EuOr-1QA2;
	Mon, 15 Jun 2026 22:50:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZG8C-0000000EuOi-1vUJ;
	Mon, 15 Jun 2026 22:50:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 28D56600AB;
	Mon, 15 Jun 2026 22:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D18121F000E9;
	Mon, 15 Jun 2026 22:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781563810;
	bh=+UuQVCAyUvse1CZNlmPDFh59OEsUZB+xGlZxHGND+n8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=G/eSgO6vZTW3YbchjfabTrxKMJadLhtgPRAsobGJN8TnxIW2rMClT9+2+M/Tkm4+X
	 RiIV6X3pqHoJoK5yotO8qkx7cnS9Ur23r8FraMx3w/mviMytAN/2uVBzdkVuPUxNkc
	 ePFQpu84tp8hATKLJdM6RTpAeGoCNLhV3fMUicW+DffIIAyOj119ouhie1h06wq0k2
	 ZVx2XbXoNl0JurGU2OfW9VG32vJLFiMbQrVHdUf5uLD0mciXNobQfnqRYcdQi2op1k
	 zMog6+d1Y8fNI1wYeH+sQiMAGuN5uZImpEsFlJKahJdiHIfASg5hhNIE4Kqj3SCIZa
	 K+1x7ZVauUC7w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 199623839A08;
	Mon, 15 Jun 2026 22:50:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: airoha: Fix always-true condition in PPE1 queue
 reservation loop
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178156380564.325968.12566495684945605433.git-patchwork-notify@kernel.org>
Date: Mon, 15 Jun 2026 22:50:05 +0000
References: <6a2ca3de.ad59c0a6.147df9.2ac1@mx.google.com>
In-Reply-To: <6a2ca3de.ad59c0a6.147df9.2ac1@mx.google.com>
To: Wayen Yan <win847@gmail.com>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, horms@kernel.org,
 pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
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

On Sat, 13 Jun 2026 08:23:12 +0800 you wrote:
> In airoha_fe_pse_ports_init(), the inner condition for PPE1 queue
> reservation is identical to the for-loop bound, making it always true
> and the else branch dead code:
> 
>   for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_PPE1]; q++) {
>       if (q < pse_port_num_queues[FE_PSE_PORT_PPE1])  /* always true */
>           set RSV_PAGES;
>       else
>           set 0;  /* unreachable */
>   }
> 
> [...]

Here is the summary with links:
  - net: airoha: Fix always-true condition in PPE1 queue reservation loop
    https://git.kernel.org/netdev/net/c/c66f8511a810

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



