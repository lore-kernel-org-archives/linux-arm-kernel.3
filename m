Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69D2606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 00:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lC6uMcaZ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HtYfjjAq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wofT5zkebqyVszVlAt1/ONTLPuvX9LaDgUNffCT1rws=; b=lC6uMcaZvYt3GS4JPtjBY3RfVJ
	19jpfroBqc6+wZ6R3FzKJybEcPhdBvDWgcMQs+vEx6jTsrqsKH1uepAGKVzUXoyBupLG3O3X3d10x
	MtBlcaMZr/rJmPsO1raLfJCFRWFVsO6m8gPO2FzdMutyVFQ1Ws0Qx+nL6NWBmNr74jXDRJCpvUxwQ
	xVdwYcRY7M2zKBvKG/UfyzEmfsPPNc/iZy+/7d/Jyj0wujITL8zuWFAFAkZQhO6scZVZso3TtlcDl
	0bHC5J3HMyK2W29lPswAhTXqBblpBx3+D500OLJCR6X0qHrCKt2lrqMZqnL5SBJ0pYwhubUobWgj5
	qsLaVKgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJJuL-0000000Aqbk-3qle;
	Wed, 21 Oct 2026 00:10:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJJuK-0000000AqbP-3gEm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 00:10:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F49A60A7F;
	Wed, 21 Oct 2026 00:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455101F000CD;
	Wed, 21 Oct 2026 00:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792541415;
	bh=wofT5zkebqyVszVlAt1/ONTLPuvX9LaDgUNffCT1rws=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=HtYfjjAqAkOchhnCE/U8yb6mVONCWharGasG5A++W2fDi3VgEVM7mb/V1N9jvIis6
	 jKdYQ4jkWqGrj3OtAFE2VsR/pUnWQhwqcJ1CeWTzPNhm/JJ/JDsRjCZwZaLS7tFzUN
	 yTTpnWUG58OcC6oWjg88fJGgS0WBQmLHOsfYgobIDrMLCfSXG2rgjyxz+t6VARO7cj
	 L9qyo0bN1jJbfK+qA6BqFKeynBiTlHCiR5JMCe/Y+VFXUacwYu9oRbTnGkb5sMyHNc
	 /G0YnUt2vBTWQiyKJ/8v5kNOEcESxNAb6h5NlvKcefi5y0+a7EKBf1r6CL7Y+xpirA
	 TvVnDChQ/YB0A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A4563809A0C;
	Wed, 21 Oct 2026 00:10:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 0/2] net: stmmac: Track and report the TX DMA
 threshold
 per queue
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179254141377.280032.3757273474047179369.git-patchwork-notify@kernel.org>
Date: Wed, 21 Oct 2026 00:10:13 +0000
References: <20261013114503.57487-1-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20261013114503.57487-1-ovidiu.panait.rb@renesas.com>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 xiaoliang.yang_1@nxp.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 13 Oct 2026 11:45:01 +0000 you wrote:
> On the Renesas RZ/V2H platform, which has two dwmac4 controllers, we
> observed sporadic iperf3 TCP TX failures on one of the controllers, with
> throughput dropping from >900Mbit/s to ~1Mbit/s due to TX underflows and
> the resulting retransmissions.
> 
> Commit 3a6c12a0c6c3 ("net: stmmac: bump tc when get underflow error from
> DMA descriptor") made dwmac4 raise the DMA threshold of the queues that
> report TX underflows, by increasing a global module parameter 'tc'.
> However, this logic does not work correctly across multiple queues and
> controllers, and can leave the TX DMA threshold stuck at 64 bytes.
> 
> [...]

Here is the summary with links:
  - [net,1/2] net: stmmac: Track the TX DMA threshold per queue
    https://git.kernel.org/netdev/net-next/c/9dd534187819
  - [net,2/2] net: stmmac: Report the TX DMA threshold per queue
    https://git.kernel.org/netdev/net-next/c/aee7b59e6e7b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



