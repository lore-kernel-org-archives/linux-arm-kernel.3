Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F8DC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 17:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R1QUL3Cp4z5Z35OV8PRDAXU83AeOkFadcN8Z7QOJv98=; b=4VqvwJn8IZbmutymk7roxEkWPP
	fbMF/nYnu5yI/QZzPQKUyFE2x0yzQxCQQlN+tvswG2zsB+XlwU4+Qh5Ju/auYb7zOwL0+Cm5xbBVD
	HaU2frPe7RyQ9rcrxqM+/1L5zR603XJIM3yNY0gfAA6zOmYoY9cLKCLgxKWqUnKvnw+Dr8GbK52om
	b1aiyxSd/+67O3UbGywsz4PvbVVwNC21fHM9h4JHM7iEMlKS08uR3Gy4r+tUS5AvMrmvFLaCudu0Q
	STjBDKY7pZ1Xn42+lu+WtJAn0iz/EEN92CgJVSedtsSAAZSSBgfCQUaMqlztVWcH550x4c8C5eVam
	Z3zaPMTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZByW-000000066Ae-26GL;
	Tue, 08 Jul 2025 17:19:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZAt7-00000005vRS-1oMU;
	Tue, 08 Jul 2025 16:09:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B57835C5A59;
	Tue,  8 Jul 2025 16:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6415FC4CEED;
	Tue,  8 Jul 2025 16:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751990984;
	bh=w7uZ8LAu1UM9qlOa4hCypCdhlhhJjNzQsr0NYy+DYvM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GUYiqeCa7ewmMxeJQTgKZasiENZyVFJtn0w71QUUFAi7NTPexPYDIr2+LQfExo5YF
	 neQFZFunrKl7R4LTAvHa2SzT/PInphc77Q/jaGSCJG4znEgTo9GyvgmyCVw+qHl/w5
	 NpaMg8i4rrQU+u9aK2JS5TAcxy6bg4KzacT1eJlIq2+kiznqJ3sGUzYdkb1FXU1ejn
	 Pd2+CLDO80IgZX89+87tA7nnrU7RAn02bIAc336PCFKF1MQC0owC8tIsmMs22ioQGC
	 LVxoBsB1bGCVQjRB/QwZBcxek3qkxPuQPVGjXW4MNFPh23VI3UZkVwXmZN2V7tjzMt
	 3htp0H7msVmZQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F26380DBEE;
	Tue,  8 Jul 2025 16:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 net] net: airoha: Fix an error handling path in
 airoha_probe()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175199100737.4122127.16143501388505360128.git-patchwork-notify@kernel.org>
Date: Tue, 08 Jul 2025 16:10:07 +0000
References: <1c940851b4fa3c3ed2a142910c821493a136f121.1746715755.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <1c940851b4fa3c3ed2a142910c821493a136f121.1746715755.git.christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: lorenzo@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 horms@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_090945_509197_C30D796B 
X-CRM114-Status: UNSURE (   9.97  )
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

On Sat,  5 Jul 2025 10:34:32 +0200 you wrote:
> If an error occurs after a successful airoha_hw_init() call,
> airoha_ppe_deinit() needs to be called as already done in the remove
> function.
> 
> Fixes: 00a7678310fe ("net: airoha: Introduce flowtable offload support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Simon Horman <horms@kernel.org>
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [v4,net] net: airoha: Fix an error handling path in airoha_probe()
    https://git.kernel.org/netdev/net/c/3ef07434c7db

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



