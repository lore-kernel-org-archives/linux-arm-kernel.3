Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD12C54756
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 01:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=emWvQEeHRjU7RqpCeuc+qBrLLuyp0JEke24+bAqKUAg=; b=qBalHIDFODmGAJNotfKXR3yxU9
	MO9qvvbcE1qqSu5vbM7QH6kf6R1Dkpz8T2L937QxiqJb1XDpHwT/FRx3yzIATkMRDsJcE8bx3x54f
	FekgMVJOb5mvN4O+sn3KqLJXDOs+vc3on7EKXIfYnkRQkkVDL5LZSjmPruo+HC+5rtwFBxYwGenk7
	X23NnVJLpctkRyfPp8MWw0KN1ivmALRvzPMfu2e9IB1EqsQHQN0TQQq5rd+ByAD2wXpvC/xc/TEZQ
	qO07H5Qjer+l1xEJRj/Shck4rcYEVDxw0QEsWVcnNUb+KaqlwZxyYK+/cSIbhFLKcJJnh7NPIlDwg
	kyIsJxHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHYTI-0000000EWD7-47rW;
	Wed, 21 May 2025 01:42:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHYR5-0000000EVzW-15kp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 01:40:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7D253A4E30C;
	Wed, 21 May 2025 01:39:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F1B7C4CEE9;
	Wed, 21 May 2025 01:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747791598;
	bh=4AtQcRMMFt/TxSF9wLGYAAdGE1Q6TOLHf7/oWt7wMNg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MrzBD5D86GqbY5ifWbOU6YggYpbHQNSgCkXze5Bu9fzQO5SS/DExk5UTQwLOdSsiJ
	 EMrSsaLv9ESxAmGqDHC72KWDhdmBh67/1z4O13WFi/bZdgbr/cwgAZrG2WRlyCMDtR
	 1tXp3O9vZYxJFxNZ4SBj+wGlhfNsq889CoSYfPWeUVxmRyI0bLPTr0NJ27FT0pI5MO
	 vXaI2SZ+u/VGrURad6CRJayZWizaZp0Yc75vKIdkfZNzCuewZjkvCnsce1+nlXusDF
	 Wz762sk2s6eJPVfayfTU16kNPE7q3T4hM2HQo1X7guM01kxirEL7hZ3kv6o5gIkdLF
	 XBfQ3JKcIun2g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D0B380AAD0;
	Wed, 21 May 2025 01:40:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: dwmac-sun8i: Use parsed internal PHY address instead of
 1
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174779163374.1531331.18316141953380951353.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 01:40:33 +0000
References: <20250519164936.4172658-1-paulk@sys-base.io>
In-Reply-To: <20250519164936.4172658-1-paulk@sys-base.io>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, clabbe.montjoie@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_183959_367053_5FB6808B 
X-CRM114-Status: GOOD (  10.26  )
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

On Mon, 19 May 2025 18:49:36 +0200 you wrote:
> While the MDIO address of the internal PHY on Allwinner sun8i chips is
> generally 1, of_mdio_parse_addr is used to cleanly parse the address
> from the device-tree instead of hardcoding it.
> 
> A commit reworking the code ditched the parsed value and hardcoded the
> value 1 instead, which didn't really break anything but is more fragile
> and not future-proof.
> 
> [...]

Here is the summary with links:
  - net: dwmac-sun8i: Use parsed internal PHY address instead of 1
    https://git.kernel.org/netdev/net/c/47653e4243f2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



