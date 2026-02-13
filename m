Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FC1EF48C0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 03:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LymxEcSqvBzDLPtH/hUCC/Naj9mztl5O43Qjtq2y3/c=; b=gkvYV9fYj5DzAVpw40QHxvzQpY
	tsH6+pxic14Oh/Ki9aaVtIkTDzzWIjJAoX93ScWkhuDRV6jR0rLaJhhVJn2TDrlNMv4W/5hi0ByBp
	POJj3jbcaUe4w+HPHCpgGiApo0BzogJJFlCuXkkdVSz/JlI/iQocbRjRurAqvpXOXqVEfJo7WpjNL
	Ic5wukN3LT3wGzD4boHF1Gp7sld5LL6Otnctvq7z3LEXtXEVhKJigOblxFVmpRJY1q0PgMvXrJcaN
	y65DO7bQhOXP8sZoF/rlaURsAPgzXqjRVYqcqkWCEPb8reRIEvQVJhPd9va34U7HlJUflGJWMbFK1
	MLhb9F0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqjPj-00000002skh-2IyJ;
	Fri, 13 Feb 2026 03:00:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqjPh-00000002skX-2okI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 03:00:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4FB086091C;
	Fri, 13 Feb 2026 03:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6BEDC4CEF7;
	Fri, 13 Feb 2026 03:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770951612;
	bh=5ZSl2pzWhiB6N4VZMYvSeGipvdIFBBlDtOiOeOJ5RDU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=konDU/TfJYyklZA52QAaVg05izA4Q2bja597l5d9mwicKHUkYOt0hdXOIF9QFcvXO
	 D8QnOQOMuIVDU46HCCq4Ovtp8rxQVbC5BQxRnFLyFt8UwvnmWhn4cWZCTRwEiCx4Dl
	 HSg2KnOISqjDEIN3liZ65jPTQlmtfZ6bBdUMh8Ts2rY0Gl2BoekoyaYmPZn025upzL
	 ENNC0FnN7fT9YtwXy+h7APYiIYtstdAE89HP6GAtei2XmpkMeG6vgvQzYEyrOAqm7N
	 QnCif+Bgni7lXIn6LbziaCol5BCCelN4u+q23zujlv0eJ3xGu1qhJiHrUduRStu8SR
	 rC5uJbjvpq3wQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 483323931095;
	Fri, 13 Feb 2026 03:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3] net: stmmac: fix oops when split header is enabled
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177095160583.1822665.14143768748258402663.git-patchwork-notify@kernel.org>
Date: Fri, 13 Feb 2026 03:00:05 +0000
References: <20260209225037.589130-1-jie.zhang@analog.com>
In-Reply-To: <20260209225037.589130-1-jie.zhang@analog.com>
To: Jie Zhang <jzhang918@gmail.com>
Cc: netdev@vger.kernel.org, jie.zhang@analog.com, horms@kernel.org,
 jacob.e.keller@intel.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, maxime.chevallier@bootlin.com,
 vladimir.oltean@nxp.com, Jose.Abreu@synopsys.com,
 linux-stm32@st-md-mailman.stormreply.com,
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  9 Feb 2026 17:50:32 -0500 you wrote:
> For GMAC4, when split header is enabled, in some rare cases, the
> hardware does not fill buf2 of the first descriptor with payload.
> Thus we cannot assume buf2 is always fully filled if it is not
> the last descriptor. Otherwise, the length of buf2 of the second
> descriptor will be calculated wrong and cause an oops:
> 
> Unable to handle kernel paging request at virtual address ffff00019246bfc0
> ...
> x2 : 0000000000000040 x1 : ffff00019246bfc0 x0 : ffff00009246c000
> Call trace:
>  dcache_inval_poc+0x28/0x58 (P)
>  dma_direct_sync_single_for_cpu+0x38/0x6c
>  __dma_sync_single_for_cpu+0x34/0x6c
>  stmmac_napi_poll_rx+0x8f0/0xb60
>  __napi_poll.constprop.0+0x30/0x144
>  net_rx_action+0x160/0x274
>  handle_softirqs+0x1b8/0x1fc
> ...
> 
> [...]

Here is the summary with links:
  - [net,v3] net: stmmac: fix oops when split header is enabled
    https://git.kernel.org/netdev/net/c/babab1b42ed6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



