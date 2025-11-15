Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5537BCE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 02:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IC8ra2WkCXTbox9QBmPWj03HY/eP1w0qxjSM9mRN5Fo=; b=U1CnezOY25fGZdlW9yNr5uM81O
	6JYhRhQTsQx7Pct/60/zStYWYI4qeKG02d/gEwtAm/Yms5pxRUC7gRTBtEKQdN9VRu6pi/fTvSx41
	+wwWJuCODJDjqQoWilGQuod/PxxBG9WFkX9vPbLRFUgVKw3gKczRolGPPRmyUsJP6C0sqzT6bJeXa
	i2YGLQTBhZ/oK56j5rzCR0h5ZETmDMlA51TvJRDKswM91EdeFf6iqGp9v7lRnUh75ik/5Z4V6nqx2
	s6a5ixFSf2cIMiDUT83HTIeTw7VOa67LHrn4MZW0kA9jhlkBIzcfGkerCHsYczuFEhFJpXHCn15TC
	CpVfz1mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK5uB-0000000DMBD-2JR0;
	Sat, 15 Nov 2025 02:20:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK5u8-0000000DMAq-28aI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 02:20:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7FC7343EC5;
	Sat, 15 Nov 2025 02:20:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 579E6C4CEF8;
	Sat, 15 Nov 2025 02:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763173242;
	bh=1nbnsS4EqlOU2qhDQ7Tb3xjj4GMZ9cC54/ecuLvYD6I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=vEEftl0tcrRC4jXXSWLWksXw53WnJvCpsY+wntW6mK2dpgZjNceyubJ71a8jB+tv/
	 8ZPe0JgiRR2gOv77GxmhSdaFi7wEZ2Tadt7XA/FVpOmqgrwleeNyW3mZ77Ob+jHpF6
	 oJYNviHJcHkA6HnQDTwqDBStRLV6GNHY9QMKHOIxsSH6VYaVlO8Qvjl9TzJG8NlnT6
	 3mlJSeph8OPia4cjLR3Gu3Unh+KL/fFjwglrR9ans9gxkYQ4YeHznXXBSW610RmP5Q
	 TShRFyWUGdWMnbhLyw+H9ENwegcjcAXQhI1xKdmVwGEVx684czfl5F+AEe9Y3ahNW1
	 DWN9439GWWxvQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD083A78A62;
	Sat, 15 Nov 2025 02:20:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net V4] veth: more robust handing of race to avoid txq
 getting
 stuck
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176317321050.1911668.3467356936047783737.git-patchwork-notify@kernel.org>
Date: Sat, 15 Nov 2025 02:20:10 +0000
References: <176295323282.307447.14790015927673763094.stgit@firesoul>
In-Reply-To: <176295323282.307447.14790015927673763094.stgit@firesoul>
To: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: netdev@vger.kernel.org, toke@toke.dk, eric.dumazet@gmail.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 ihor.solodrai@linux.dev, mst@redhat.com, makita.toshiaki@lab.ntt.co.jp,
 toshiaki.makita1@gmail.com, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel-team@cloudflare.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_182044_570777_31C6521A 
X-CRM114-Status: UNSURE (   8.95  )
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

On Wed, 12 Nov 2025 14:13:52 +0100 you wrote:
> Commit dc82a33297fc ("veth: apply qdisc backpressure on full ptr_ring to
> reduce TX drops") introduced a race condition that can lead to a permanently
> stalled TXQ. This was observed in production on ARM64 systems (Ampere Altra
> Max).
> 
> The race occurs in veth_xmit(). The producer observes a full ptr_ring and
> stops the queue (netif_tx_stop_queue()). The subsequent conditional logic,
> intended to re-wake the queue if the consumer had just emptied it (if
> (__ptr_ring_empty(...)) netif_tx_wake_queue()), can fail. This leads to a
> "lost wakeup" where the TXQ remains stopped (QUEUE_STATE_DRV_XOFF) and
> traffic halts.
> 
> [...]

Here is the summary with links:
  - [net,V4] veth: more robust handing of race to avoid txq getting stuck
    https://git.kernel.org/netdev/net/c/5442a9da6978

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



