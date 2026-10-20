Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BFA606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 20:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=buHzmejO;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wsyos3W6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4kBeYw1QN9RLpUkse88tUQ3URyvYGAihH6x26tvte7s=; b=buHzmejOCJrHV+9Uppd7I3HZz0
	wDVkRdR9qbIceddpJnHrdFf9lxd8h2CBhokDyuqAJ3xpmXninSP+v84n1Ly94XOZrhb9FedGvMi/a
	MCeGd7eR5puTu+rurEPAGgAdlcwtj3ctTHcGrsArDyALt0xXejhpCgF/flVtasNrR8Dlj96K4kAcm
	BSMEIUn+yYxz4V/f9OnJ6QT2HBru84YKzscwUO7gh1oJrB5hAOLy+2z9QzXO73bAIRHMrJrq1LAPQ
	PGdQPa8vTj9vtjcP9yIY88Pkg1i3HZcR9qm2ELWCRR0+Pg6XvHFOaHSyv5X2eQTjEmRFbwpmg1E6b
	wCXFzY0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJGmj-0000000Adql-454f;
	Tue, 20 Oct 2026 20:50:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJGmi-0000000AdqU-3sPj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 20:50:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 18BB5605F0;
	Tue, 20 Oct 2026 20:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C39431F000CE;
	Tue, 20 Oct 2026 20:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792529411;
	bh=4kBeYw1QN9RLpUkse88tUQ3URyvYGAihH6x26tvte7s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Wsyos3W6vCyeubB6c2YWrKr4wfiTG3RJqLkIPj+G3WrVMFGCyooyplR86mxQqqqVt
	 PU/kfFwK3u3Fkdig6SNbSJhM+DVxdzDlNC0J9k/Z3yxXlgg6MPI5gF+RVZI9HF9Fit
	 lQ/6PVRKeHiI349prrgERWlYCZYJ/yAbKtcCKfQIjLNlrH8flsgLfbfkYg3mLVqhw9
	 Fqn7kP6OxzdosCWtIgSq6p2+vKY3nTbTQ5gobA4f2mpt8dz2tRzbhw7Z3JiPQN4bn1
	 0/ZO/9tZsrXkPc4E5c9WZsKkid/RIdqgD8Mo8q/EFepDSWG/i1+T+gk295A0aaBb9A
	 4aKI1vwszk8Cw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B49033809A09;
	Tue, 20 Oct 2026 20:50:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: axienet: release every RX buffer in
 axienet_dma_bd_release()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179252941027.202014.1920735438863244312.git-patchwork-notify@kernel.org>
Date: Tue, 20 Oct 2026 20:50:10 +0000
References: <20261015084743.1798326-1-maimon.sagi@gmail.com>
In-Reply-To: <20261015084743.1798326-1-maimon.sagi@gmail.com>
To: Sagi Maimon <maimon.sagi@gmail.com>
Cc: netdev@vger.kernel.org, radhey.shyam.pandey@amd.com, michal.simek@amd.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, andre.przywara@arm.com,
 robert.hancock@calian.com, horms@kernel.org, joe@dama.to,
 suraj.gupta2@amd.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 15 Oct 2026 11:47:43 +0300 you wrote:
> The RX walk in axienet_dma_bd_release() stops at the first descriptor
> without an skb, assuming that such a slot and all after it were never
> filled.  That holds on the axienet_dma_bd_init() error path, but not once
> the ring has been running: when axienet_rx_poll() fails to allocate or
> map a replacement buffer it leaves the slot it emptied with a NULL skb,
> in the middle of a populated ring, until a later poll refills it.
> Closing the interface before then leaks the skb and the streaming DMA
> mapping of every descriptor after that slot, which can be most of the
> ring, and is most likely under memory pressure.
> 
> [...]

Here is the summary with links:
  - [net-next] net: axienet: release every RX buffer in axienet_dma_bd_release()
    https://git.kernel.org/netdev/net-next/c/b59787892d04

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



