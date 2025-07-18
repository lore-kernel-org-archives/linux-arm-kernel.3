Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1B7C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 02:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ueAgdkProTBpmTFh5bIN9Jo5xx4fn3Bjn9l43Z1UsDA=; b=OTp7zwzciO5ssRSlRJ2nALFDOa
	5rdKSmkmnE62Qf2+PgE5nvD/cKE7h5OuxYiKwc/WakdUuKBiW35HsgQv1oaxUfERZ18y7CddXNAI6
	PDlXFcqYboSvh/CWUX/UeEBkJ1SgxpEeNvBCjAxeKUiV/tsVzGj4KzD3vWQjqdllGrXZ7EClNDnWp
	YdPRGk5v+S22VA/Da9m2bxYeaiqjlVy/r7qZD4BHxc2kNoglhbk2xvQruNUkt4SONH988+Wy7wMPr
	DW3R5pngGUlQIgeqvem9RIUSaLqjMvMTBl5NTV9ItrxmXmKIOZazuBX7h0r6wNBh8sV40/juV+Khu
	gLIQn8Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucab6-0000000BWd4-2WnB;
	Fri, 18 Jul 2025 02:13:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucaOJ-0000000BUuz-3g5h;
	Fri, 18 Jul 2025 02:00:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BB07AA57A87;
	Fri, 18 Jul 2025 02:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53251C4CEE3;
	Fri, 18 Jul 2025 02:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752804002;
	bh=SetBbtHXbVjZbmiyk0fpeigIcr80OzEqkRC6pQfTTTo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=H6Hp2NN0qSoS08Ezwyaaae0ALZyNHDflwHoRDeC3FJ4y1AIl5BV5CmV0stAEB9hgd
	 nejk0vs+I0lriY3Ou2g9fgTHO15C68fXP6YW5vzaBHne8xH2rb9EFdJaAnpTmTYQVr
	 1B9H9+YJkQcYTRNLbkTZUu/R5l89NllR4wHOho112EvSr+Hnf5Cmwp+1XvuYGualhn
	 y4o8ZJlhKAS38T7LLZS7Lmjo6GEml6n1fv8UAFZ+omT3s/dy6NMcx1hK3lzEiPk51V
	 REZT2929lolW4QtgNUgfFjvlGc5Yn+ub8xdXUvVf2p6QzMugj9vWgnr1T5OYRC1d1F
	 euZUy2fhJYsEw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D1E383BA3C;
	Fri, 18 Jul 2025 02:00:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: ethernet: mtk_wed: Fix NULL vs IS_ERR() bug
 in
 mtk_wed_get_memory_region()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175280402175.2141855.8758462175684517580.git-patchwork-notify@kernel.org>
Date: Fri, 18 Jul 2025 02:00:21 +0000
References: <87c10dbd-df86-4971-b4f5-40ba02c076fb@sabinyo.mountain>
In-Reply-To: <87c10dbd-df86-4971-b4f5-40ba02c076fb@sabinyo.mountain>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: robh@kernel.org, nbd@nbd.name, sean.wang@mediatek.com, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_190003_987469_C3A85F8B 
X-CRM114-Status: UNSURE (   9.03  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 15 Jul 2025 18:01:19 -0500 you wrote:
> We recently changed this from using devm_ioremap() to using
> devm_ioremap_resource() and unfortunately the former returns NULL while
> the latter returns error pointers.  The check for errors needs to be
> updated as well.
> 
> Fixes: e27dba1951ce ("net: Use of_reserved_mem_region_to_resource{_byname}() for "memory-region"")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> [...]

Here is the summary with links:
  - [net-next] net: ethernet: mtk_wed: Fix NULL vs IS_ERR() bug in mtk_wed_get_memory_region()
    https://git.kernel.org/netdev/net-next/c/c2fe3b2a7c71

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



