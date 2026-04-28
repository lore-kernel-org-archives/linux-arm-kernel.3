Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9BBFF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 00:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vFsDqvfeNsGoUPWy4JYGx5bqHLvIX/+My2McbuUGuI=; b=aTh//HZvl3ERJRIxYZIXdT0Y3J
	Vg9T/KybtMj1Q7xFYw2MuvyumERccUvjqiZg8RnXXdfjm5Bnj+3Fx6eZyKIcG6je2XayRwWiirfLp
	v9e8eXSTxWHgQWhYT5FU5gg8uIb7J9Mb2Y1hxp5P8/CxokfTlfF9DzdCZ6YeLMqA42lWFpUPCBT+N
	u7doaEEf48S63AnVKUIIcGmlsSG8fprG0fxo5BuCuMmtFGVe/j/SDzCy0KsEB/ZV34i8cyzuHmTiU
	sM29YfVx8L/n+BvQAUrIiH4b2v1Bhbq25yPW/HpSsemFSqXumQbjN5Uz4ry0EOpaZkiJ2j4GP+qLz
	F76VSVMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHWfL-00000000MCo-26xM;
	Tue, 28 Apr 2026 00:51:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHWfF-00000000MAg-08Jv;
	Tue, 28 Apr 2026 00:51:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D018143A8A;
	Tue, 28 Apr 2026 00:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0CB8C2BCB4;
	Tue, 28 Apr 2026 00:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777337459;
	bh=lsFxvBdCYWNnGXrj0HAtYyc953fGogg+wwOtIHFtFYI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=D7Xm5TpNGXEpgaK4waMPxUfDpk5sKKjQkmp71nO1Q+F/BsHOCs5OabkDeH1avHQdJ
	 sl4OJiT80mB5UCRaKv0ZGg3j34dNZnmEhZ/96DfiMDl511wNEycRYy6T8GZ1tLqkre
	 QBjcrvO0BYxFDXwbTIvgvyfMAWhmacVelgKBEnTxe5hn35JEjbHFFiZz0vGUChC6nd
	 KLRMfWtJaT9C04MZ8OlRGkgkXrqjvQVC8vNYZD2LKRIh+QH4eoniR9NhJ8Nia1caps
	 RaUwkjboiGBm/vs1/+/rU+rLT+pAs8uVY4XIxZURMgnJ1v4+AADBGuGG2uaaOHWt/9
	 thCVlr8bUeXGQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FD4438119DB;
	Tue, 28 Apr 2026 00:50:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: airoha: Do not wake all netdev TX queues in
 airoha_qdma_wake_netdev_txqs()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177733741679.177472.12823234814515081752.git-patchwork-notify@kernel.org>
Date: Tue, 28 Apr 2026 00:50:16 +0000
References: <20260421-airoha-wake_netdev_txqs-optmization-v1-1-e0be95115d53@kernel.org>
In-Reply-To: <20260421-airoha-wake_netdev_txqs-optmization-v1-1-e0be95115d53@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_175101_090057_8174F5D2 
X-CRM114-Status: UNSURE (   8.70  )
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

On Tue, 21 Apr 2026 10:53:33 +0200 you wrote:
> Do not wake every netdev TX queue across all ports sharing the QDMA
> running netif_tx_wake_all_queues routine in airoha_qdma_wake_netdev_txqs()
> but only the ones that are mapped the specific QDMA stopped hw TX queue.
> This patch can potentially avoid waking already stopped netdev TX queues
> that are mapped to a different QDMA hw TX queue.
> Introduce airoha_qdma_get_txq utility routine.
> 
> [...]

Here is the summary with links:
  - [net] net: airoha: Do not wake all netdev TX queues in airoha_qdma_wake_netdev_txqs()
    https://git.kernel.org/netdev/net/c/e070aac63b42

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



