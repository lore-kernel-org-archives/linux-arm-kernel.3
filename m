Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C92CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 01:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ygg3GDdLHLLwrZPS+Uyqmft3vzEKyChkPs6vfBY/QVM=; b=ULOUwDYcKaY2a2yfykkyqeBGrk
	zeP1c/WguTTRqxXtSYa5suXtRWGmi5yv9xYAvvAdHQ7PqehhskvZvDtjN3Beyq3UwSWCTm2zsS4Ff
	Q6JK+vPNuCGGhCiQYyM4CQfAFDJcAzQBFB4U34zO+mkosJOSDhvBK+qAmj8F4vmb/UQ3U4VMPZi1u
	r4xpzXrLBDncqNcis4+qudY9T6nraYNwwgCVEHF5LWRNs98x0e67eDtpvoZloALcUCFuqsfr3U/S1
	z3lLTEzI7JZA9J5T0HWZAHTzyfx6z/DJx10rpTfnRBHIwlZ3yKpXnYFkZHwpRF7xKcGrt3adJC1u5
	IHwDUOZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waNuD-00000001ukz-0twC;
	Fri, 19 Jun 2026 01:20:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waNuB-00000001ukq-1irP;
	Fri, 19 Jun 2026 01:20:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 22FFF601E2;
	Fri, 19 Jun 2026 01:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBE5D1F000E9;
	Fri, 19 Jun 2026 01:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781832021;
	bh=ygg3GDdLHLLwrZPS+Uyqmft3vzEKyChkPs6vfBY/QVM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=W+EcR2VvZcnXAYv59XKSsZ7HwYbe9d+X8oi8oskxnhVfQb9txRukJ05TIxbWL5L6d
	 o1nqcoD9hENcvN9mz0/OV5bwPwkHnOrBb/zX1JOJ9zYxi8T2Mpt1RQRfVLq8AaeXjQ
	 aCMllzSUdsD0Aop2Cj+BHeMr5EjCO2iBHUxuPkJmaWswrucd2AYX2Q6Yw2uwsmvtL6
	 OanolixmpnZj1kob0wxcUozMf1UBJgNRf/i6aJvLvRFAe7VAy7R3qooUSsVqp7BZCV
	 Gz83WU6lvWm/epZsLQ1Y+LGkjSNxu3iC/q4wbPxV9GNcU4+PiIqNwPZWmg89E5KSkI
	 SwsAlfSHedXpg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56AAB3A78A7C;
	Fri, 19 Jun 2026 01:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] net: macb: add TX stall timeout callback to recover
 from
 lost TSTART write
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178183201489.3150917.15246467988851878585.git-patchwork-notify@kernel.org>
Date: Fri, 19 Jun 2026 01:20:14 +0000
References: <468f480454a314303bac6a54780b153f689f2267.1781598350.git.andrea.porta@suse.com>
In-Reply-To: <468f480454a314303bac6a54780b153f689f2267.1781598350.git.andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: netdev@vger.kernel.org, theo.lebrun@bootlin.com,
 nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, nb@tipi-net.de, lukasz@raczylo.com,
 sjaeckel@suse.de
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

On Tue, 16 Jun 2026 15:23:03 +0200 you wrote:
> From: Lukasz Raczylo <lukasz@raczylo.com>
> 
> The MACB found in the Raspberry Pi RP1 suffers from sporadic stalls on
> the TX queue.
> While the exact root cause is not yet fully understood, it is likely
> related to a hardware issue where a TSTART write to the NCR register
> is missed, preventing the transmission from being kicked off.
> 
> [...]

Here is the summary with links:
  - [v2] net: macb: add TX stall timeout callback to recover from lost TSTART write
    https://git.kernel.org/netdev/net/c/e438ec3e9e95

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



