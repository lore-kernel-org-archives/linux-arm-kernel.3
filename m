Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF3FCDB471
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 00:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7WwV7C+/RLdDadamoZpqAbgcBr1uPP2MLzfTS8DLY5Y=; b=hV2o4wXfNDT3Cs108X1Yepeujy
	vRuVEiqxcOqdjgpkZ4vDqNXCXzdYs654stOzLf9nhJq+8e1kPR5oyAGP6H0iStyV0hRwKawCQIJL6
	dkGsd5z6L94y4rRouLaC+YtuW+jYSnmJq6L2e5jmdiAem36/XFgmB0amwEQR5VzpgUcOH4bQbNl/B
	12GlI5G0Mtz69SyLb5b6/tVkPTUaGH2Y8I8mt5rISyOXmcz75J595VnDT7CdWkHcboOxPY5ZNjAa6
	J/T4g4vRtfVK0isFxjrO6pZzyhPn9+FunkudZk2ZYZfvaSQTt09C77e81SB2AVBgKbo9VrYyUkvWS
	arYPPNkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbpBc-00000005V3x-0NFu;
	Tue, 23 Jun 2026 00:40:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbpBa-00000005V3r-3QIH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 00:40:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AA116601FA;
	Tue, 23 Jun 2026 00:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6044F1F000E9;
	Tue, 23 Jun 2026 00:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782175217;
	bh=7WwV7C+/RLdDadamoZpqAbgcBr1uPP2MLzfTS8DLY5Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=bjdBRNaguj22PXjdacq/w3hYWxHJgbesC81IPiW8FGBjN9WHlCL0PDHIDRjpCrOZj
	 OMUiCwPqFi0UYz1sZPSX2aaGBsl0PRDJdXiymFUTLnsNfobvs6HjWcii1Y/Ghqz5QK
	 WYHlwMxHQ0Gmuh7rZr47pIsAOdoXNnZD3M5QZhVHVCsbmhax7aoPNWYv/S8lr6jL3w
	 kp0SiI+DN6xZg+Gk8mqkxbju9tzoiZgBKi5zpvv3+e9NGvOumh5/QZQ7BYc7ofsY+f
	 va56l+1DMJ655GupUq4KFdQf9lfODVQKX/pAqhLg6JxlTMK7szoY+1XxYFKAb2QdKy
	 VELpMfsq0/S0g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0B14393098A;
	Tue, 23 Jun 2026 00:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: ethernet: ti: icssg: guard PA stat lookups
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178217520750.1479120.9274219966916752634.git-patchwork-notify@kernel.org>
Date: Tue, 23 Jun 2026 00:40:07 +0000
References: <20260618093037.3448858-1-dev@pschenker.ch>
In-Reply-To: <20260618093037.3448858-1-dev@pschenker.ch>
To: Philippe Schenker <dev@pschenker.ch>
Cc: netdev@vger.kernel.org, philippe.schenker@impulsing.ch, horms@kernel.org,
 danishanwar@ti.com, rogerq@kernel.org, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org, andrew+netdev@lunn.ch, devnexen@gmail.com,
 davem@davemloft.net, edumazet@google.com, jacob.e.keller@intel.com,
 kuba@kernel.org, haokexin@gmail.com, m-malladi@ti.com, pabeni@redhat.com,
 vadim.fedorenko@linux.dev, linux-kernel@vger.kernel.org
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

On Thu, 18 Jun 2026 11:30:24 +0200 you wrote:
> From: Philippe Schenker <philippe.schenker@impulsing.ch>
> 
> icssg_ndo_get_stats64() unconditionally calls emac_get_stat_by_name()
> with FW PA stat names regardless of whether the PA stats block is
> present on the hardware.  emac_get_stat_by_name() already guards the
> PA stats lookup with `if (emac->prueth->pa_stats)`; when that pointer
> is NULL the lookup falls through to netdev_err() and returns -EINVAL.
> Because ndo_get_stats64 is polled regularly by the networking stack
> this produces thousands of log entries of the form:
> 
> [...]

Here is the summary with links:
  - [net,v2] net: ethernet: ti: icssg: guard PA stat lookups
    https://git.kernel.org/netdev/net/c/27b9daba5060

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



