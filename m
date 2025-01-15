Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B877E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 01:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBxZxljwDU+KIR+UsnwxVoPNeZaqi/HZzZ0T0Gr9MlI=; b=s2BGkPWWN7ypOFZ+0XMzok5cN+
	fpiPzX1+kSkQ1lapk7leKXwK4OvXSvtCRJPIfvwoGTGBoP7dmdTTia5oNPNVd/HoBYPWG6WvcTEtU
	65JqngSadtTeu6hAzwckTbUrQO1iM+bF94l8cl8L+ERiK3tj4jfxxU8JKoZAWMEIQdt0JHAokbiaN
	syKy2i8bBDL1h7Zn3wWxEMnLPfC3vs5KA69Hh7S6geheb9ur/7Uxc2KHUpqMzRI4c5OwrxcH2t1O1
	BOovrWFAFSjD5zymssMUqcAf8C/DIr4MvI4UoX9xttUoNdEJ8eBfGtIMGK6nvoZYabAaloB3cvmje
	8/yg7iVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXsZJ-0000000ALe2-3MP9;
	Wed, 15 Jan 2025 01:51:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXsY3-0000000ALKS-2lRJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 01:50:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3D7805C5A8B;
	Wed, 15 Jan 2025 01:49:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4F22C4CEDD;
	Wed, 15 Jan 2025 01:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736905822;
	bh=piXgpZsu1F/VKSRIMaXHHc5VRrrN0OQ0DI+orsEVKEA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NqYFeHvnUbrbwEe9MnhQ5QwV17U1SsNW4Vi1GPp62xsEHYPkte5sn5hpEw0jICsTs
	 XZuhZZevJveav4qQdykRFrBuXtIcGlk/BgwfHmGLaVmYXbPvL6qdrCeLyE/4op9dYS
	 Xytlt0aDPhYlayYTrZJanrkMAq9jSgXtqRG9+hMMzPUAqCDGd6Mq4VmHTXFlFmwlxc
	 nOivOjh+x+QEsM6qGhucyghxXt7msTBuikpoWebE8DX99Vw6cr0kRZ/b+/HCUdFtWs
	 rCPI7ibIIwmHmTm2/tBwNEywokJHdO9UqIuFBqLxi6SUUYcOewoCmsqEvd4ZIdpk+8
	 9SNlZIUhVYvxw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AEAB8380AA5F;
	Wed, 15 Jan 2025 01:50:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v5] net: xilinx: axienet: Fix IRQ coalescing packet count
 overflow
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173690584559.216599.7734406079004798430.git-patchwork-notify@kernel.org>
Date: Wed, 15 Jan 2025 01:50:45 +0000
References: <20250113163001.2335235-1-sean.anderson@linux.dev>
In-Reply-To: <20250113163001.2335235-1-sean.anderson@linux.dev>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: radhey.shyam.pandey@amd.com, shannon.nelson@amd.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 horms@kernel.org, michal.simek@amd.com, linux-kernel@vger.kernel.org,
 daniel@iogearbox.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_175023_739204_1FB65393 
X-CRM114-Status: UNSURE (   9.65  )
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

On Mon, 13 Jan 2025 11:30:00 -0500 you wrote:
> If coalesce_count is greater than 255 it will not fit in the register and
> will overflow. This can be reproduced by running
> 
>     # ethtool -C ethX rx-frames 256
> 
> which will result in a timeout of 0us instead. Fix this by checking for
> invalid values and reporting an error.
> 
> [...]

Here is the summary with links:
  - [net,v5] net: xilinx: axienet: Fix IRQ coalescing packet count overflow
    https://git.kernel.org/netdev/net/c/c17ff476f53a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



