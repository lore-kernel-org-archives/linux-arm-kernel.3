Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08454E7FDFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 01:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cN1xWaZx4V5p1mmI+/Up+Gl4z1V9poFr+YMGEg1sZoQ=; b=hgtRVqzjm+EYB6J8KYkjtpGn0d
	p+AVH7l2XETkx95GkA3sj8m62z5q4mtKoNmzru0dpd5KG9azJohJ52fqgOkYygCdgSuA0gGDfvxVm
	pZMnAWc0xCuqjPTUGbu/kOSUFly+Nr3xnRUvtIaPteiugixfZGQ3VWRbco9jW3SJtpiMoaZCd2Otp
	R0OeTsSHfSOyUQDTIiusJ7uBmG7AaScUI9FIz5XBwJ+9fe9TW0ZUdYeZsf/zD9MaEg7N9Dt7FLw/J
	VU1jivFv4tpHTIhZmT+sVd+VdIdQPUY71UDCDvie5+D5hxU6XwcmbyxkT7EqXiZH5kf0WH2UluSM5
	SWnf7yRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn5F5-00000005qeg-48Za;
	Tue, 03 Feb 2026 01:30:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn5F3-00000005qeU-3qCI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 01:30:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DEC17600B0;
	Tue,  3 Feb 2026 01:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94099C116C6;
	Tue,  3 Feb 2026 01:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770082208;
	bh=yJVIJ4YS6UmkxQKb9LKEdsSjjzw7jw9gGAX8FKtHuB4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YCnqQ2eKMf9a/XkL3EHXTt2NJqgAGI14BWymwVDVZELXzfEz5CGP7X+SZAjw+4Llu
	 bYaEEN7CkclcIkzZCWTF5i6kOaIL9UVKrliTsFlxEq7y91WcRJkARO4GKPokWYlXql
	 KDlWyWDZSskwGqxzp3fdq8+qozqcjuGWz1+2kuyBiq4Nj6lAwQtq9lbxnn1WWzK3It
	 MFAiju7vlGsXfd9BQYbXtll8X8tSkFkB3LI+038dEj9XRnfU579xVPEARLOw0nz6sf
	 UoqtA7PKlW3eigNs+jV72JJsKvUCHYPoFfCGW8yTy4qME0lkXx91b3iJ6JI5NZIxQu
	 ZBz/XzkMKhJ7w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 90F013808200;
	Tue,  3 Feb 2026 01:30:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: stmmac: fix stm32 (and potentially others)
 resume
 regression
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177008220538.1265245.15446704290450615368.git-patchwork-notify@kernel.org>
Date: Tue, 03 Feb 2026 01:30:05 +0000
References: <E1vlujh-00000007Hkw-2p6r@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vlujh-00000007Hkw-2p6r@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, marex@nabladev.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, pabeni@redhat.com
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

On Fri, 30 Jan 2026 20:04:57 +0000 you wrote:
> Marek reported that suspending stm32 causes the following errors when
> the interface is administratively down:
> 
> 	$ echo devices > /sys/power/pm_test
> 	$ echo mem > /sys/power/state
> 	...
> 	ck_ker_eth2stp already disabled
> 	...
> 	ck_ker_eth2stp already unprepared
> 	...
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: fix stm32 (and potentially others) resume regression
    https://git.kernel.org/netdev/net/c/dbbec8c5a79f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



