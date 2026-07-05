Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D76C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 07:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g0zqh/4IWoGPglrnJGkQTqXcAtUbh6knkgcgOB1qXSM=; b=Q19weLg8yt2zBCA6JsAQAC2RxY
	L9yC9Mpmw1DJ2LYa86USYW2jZRZc0BcUrhurmBvwNUTi6sYKbPjH/51KHjjtRdmMbbPmz+UmHcLkR
	smFk4aQfpxzYDDIYLGvwB7Sb9fOJqYG30zcOFWd5QaN0pQhmcCVJPtJfJeT0uItr4csokAzwB8dJK
	eUZ+DfVH/NeQqDPF6Y9s2ZMRpBPnUW5cDHrMebKwdEXOHPIWQ9bmEXWPzS/MAR9HL4NIOoNcza0SG
	3ECPHHWdp0j6aEV7uWy2V8pt0gEOSuCJS9x3Sbyj5zTNyly/ZE44nKcFfzHL841yjfph90m5FH4op
	WKEx6B5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHJ7-000000093FK-0JTK;
	Sun, 05 Jul 2026 07:30:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHJ5-000000093FC-3TXt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 07:30:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EF908409F6;
	Sun,  5 Jul 2026 07:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B061F000E9;
	Sun,  5 Jul 2026 07:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783236624;
	bh=g0zqh/4IWoGPglrnJGkQTqXcAtUbh6knkgcgOB1qXSM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=mcy2mpHwfSK2vn8lH1FXiRvw/QZLxBdrolI7dmAwoe+h0pclkxx0sFBMpZTdVgyCS
	 nzbftg9r/383Lxzt7zcVNWhnWd/T5z8DnK5chK9tRBpFbOO8H+SF1ahW9S5jXXLwBD
	 4ExTm49txx1aCcB3p+s6/hsod99LrrXoJetXrCEgiMg4rqLK53bHRLqTuOtCDa0u95
	 bPW/zcULgeW80k+W4b1N1SgfOQD2NEv+Nz/ocWp/1D7ot/kL7EE4QmjZuF/nGVkkHt
	 pJG7vsQEOl4xb8/C9NpWYzejIKik+1oxNriZIhlUj8q966um8FPADQaUQIJZaQBBRY
	 /kH0L0f0kX1eg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5698C393A94F;
	Sun,  5 Jul 2026 07:30:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: microchip: vcap: fix races on the shared Super
 VCAP block
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178323660590.3752073.10824310525866470753.git-patchwork-notify@kernel.org>
Date: Sun, 05 Jul 2026 07:30:05 +0000
References: <20260630-microchip_fix_vcap_locking-v1-1-f60a4596734d@microchip.com>
In-Reply-To: <20260630-microchip_fix_vcap_locking-v1-1-f60a4596734d@microchip.com>
To: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard_=3Cjensemil=2Eschulzostergaard=40?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	=?utf-8?q?microchip=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: horatiu.vultur@microchip.com, UNGLinuxDriver@microchip.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 daniel.machon@microchip.com, steen.hegelund@microchip.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

On Tue, 30 Jun 2026 14:20:13 +0200 you wrote:
> The VCAP instances on a chip are not independent, yet they are locked
> independently. On sparx5 and lan969x the IS0 and IS2 instances are
> backed by the same Super VCAP hardware block and share its cache and
> command registers: every access drives the shared VCAP_SUPER_CTRL
> register and moves data through the shared cache registers.
> 
> Accessing one instance therefore races with accessing another. The
> per-instance admin->lock cannot prevent this, as each instance takes a
> different lock.
> 
> [...]

Here is the summary with links:
  - [net] net: microchip: vcap: fix races on the shared Super VCAP block
    https://git.kernel.org/netdev/net/c/d7a8d500d7e4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



