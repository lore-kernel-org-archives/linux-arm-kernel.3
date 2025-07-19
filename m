Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932E7C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 00:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZcIM/Jd7q8ZE5hLxoBJlK3GKG4K2rbJyxCtQxbCcECo=; b=5EC2XqSr2xVxjoqDXFaXC9aZ+H
	KZb82BrOUrA8doOIWaVr0c8SnpHKXOIlQuYIikfhMB7J51fGtPhF1yyrnyiV67nxaE+ifmeRtRTS4
	5Bzcno3ScaGYXob+W7gZBevVNnkSCJ4E6eiJcRT1MnaAnlfOCjz+oSyIgPyuqn8GvsF1PiRNSo5NS
	/qgi7jGdDI1uEBoIR0TAMwT6FWoDOFauyXeKaKUSvrP5fVlxr+FtnnfXBjFCUgFJsYX0UfjJn0MMY
	EnWiwt4ljXR9LfPsJ5Jcb67NTzPHU63K722mOwZ7huQj4VORqVC/9qx3/V+6YsxxmOI7nUr0d9z9V
	5FSYMYpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucvUy-0000000DenJ-032p;
	Sat, 19 Jul 2025 00:32:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucvSV-0000000Deaw-2hFj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 00:29:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D60D45C6BE4;
	Sat, 19 Jul 2025 00:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F3B7C4CEF7;
	Sat, 19 Jul 2025 00:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752884986;
	bh=i2TQOPaND+67R0cRowE9uCFFBY1qMBcvE3cUgWagcHI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nRM53Wy5SDFc2fDatUbW08whvgOzD0pFhMKfKGsJW41LXTDpgqkZS8hZdOSZEr87I
	 yVFJixKVNMq16B+m+mEJB3Sltux+EEvKfR1UMptaHcvzCMnnx/nOqpRQPLoS2bYEmd
	 ABqR/+o7DjK7aOIVm2bPr+fqQXrhLeOU4WneglP1o9lOIPjZDEkDSMKbL/P94XiSXc
	 2oyUZaSHUgttr6FoCHlvZ1S2vK0k/tV/Fv0LRVn5eEWi8VhWgLgpDZ5Q/NlgyMa/Gc
	 S34WVG9Y2sv6PaSnj+d/IhilhwpEStNd5J53JsrmjBW2NLP4azqDHykXrBSrn8JC4S
	 XXZBfEi3vVRww==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70BD5383BA3C;
	Sat, 19 Jul 2025 00:30:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3] net: ti: icssg-prueth: Fix buffer allocation for
 ICSSG
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175288500601.2835800.2292924142843989751.git-patchwork-notify@kernel.org>
Date: Sat, 19 Jul 2025 00:30:06 +0000
References: <20250717094220.546388-1-h-mittal1@ti.com>
In-Reply-To: <20250717094220.546388-1-h-mittal1@ti.com>
To: Himanshu Mittal <h-mittal1@ti.com>
Cc: horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 davem@davemloft.net, andrew+netdev@lunn.ch, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, srk@ti.com,
 vigneshr@ti.com, rogerq@kernel.org, danishanwar@ti.com, m-malladi@ti.com,
 pratheesh@ti.com, prajith@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_172947_726639_596A92C6 
X-CRM114-Status: UNSURE (   7.86  )
X-CRM114-Notice: Please train this message.
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

On Thu, 17 Jul 2025 15:12:20 +0530 you wrote:
> Fixes overlapping buffer allocation for ICSSG peripheral
> used for storing packets to be received/transmitted.
> There are 3 buffers:
> 1. Buffer for Locally Injected Packets
> 2. Buffer for Forwarding Packets
> 3. Buffer for Host Egress Packets
> 
> [...]

Here is the summary with links:
  - [net,v3] net: ti: icssg-prueth: Fix buffer allocation for ICSSG
    https://git.kernel.org/netdev/net/c/6e86fb73de0f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



