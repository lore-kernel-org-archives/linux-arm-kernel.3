Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E506B606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 19:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A+6HzcB6;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JGD+exYz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RikwiHz8q0HsJLZT4M1TLtOxNEmvzvr/D1bXpPlVyRQ=; b=A+6HzcB6Y5hJ4hmVkoxAdbScgj
	f3wXMRD4QQ6l9Xk+lHRanQwJv45Gdw7pW0UFWYYg5lL3j2izbP2WmwdTXmeHdV1odx2v1H8R2aNlp
	DyYKT+0F9S+OfT79zFTPchdtmtsVzipCqCkZdwKpY/UWzXj95iD9QiaFrHgOtWLCCNWWRRdV+H6O7
	gvTS+ItZq7tEk9N1+1enV6HhSY0S/mq/7QGLK6PwFLa7ZcZVrmaLnKbr4pfcTms8AO5hhxws4vkbw
	tt3mZmS1Lvy7blsrZ/8nOYlvCsF43ZVvEd4uUz+Uu/sXUT7GC5dRTQC8adpABapBodeq6cqUtB+q9
	pVKQYLUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJFE5-0000000AWEE-3pNX;
	Tue, 20 Oct 2026 19:10:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJFE1-0000000AWDt-1iBf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 19:10:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CAF4260416;
	Tue, 20 Oct 2026 19:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 827821F000CB;
	Tue, 20 Oct 2026 19:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792523416;
	bh=RikwiHz8q0HsJLZT4M1TLtOxNEmvzvr/D1bXpPlVyRQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=JGD+exYzyW4tiqpfSdvc17FGbOLrNAui31N3Pd3wbiZmeAg0oiwaeqRx8/A7H9sQy
	 EL9zoZRX/YCXV9eQSe1NsRTHMfBr5v2LvI6AFtpHpSjKkNaB185L8tz1kwTwUQRyFh
	 UaEYafu0HvH8vb98Gz6k3qoHy76+oQpXqMes43QR/5xROMRI83ke/R793tL5/8+3HA
	 AfmI4U4M79vhPNhJM1shgA0kJPKvNhC249pRnlkZachKeJnrIq4nuwfAglAeypG8O9
	 cFSvZWLMI0HcrWfz7RpcGm/vodesqH8qmrrOSJUhIzFtZAvcr4m3xcr2JjPmr6TLrm
	 RILPQhjzPUI6Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 774413808209;
	Tue, 20 Oct 2026 19:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: axienet: don't advance the TX ring head before
 the descriptor is ready
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179252341531.164064.14961781434199526406.git-patchwork-notify@kernel.org>
Date: Tue, 20 Oct 2026 19:10:15 +0000
References: <20261013-b4-axienet-dmaengine-ring-head-v1-1-7add24e74477@toxicpanda.com>
In-Reply-To: <20261013-b4-axienet-dmaengine-ring-head-v1-1-7add24e74477@toxicpanda.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 michal.simek@amd.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
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

On Tue, 13 Oct 2026 18:25:06 +0000 you wrote:
> axienet_start_xmit_dmaengine() bumps lp->tx_ring_head before
> skb_to_sgvec(), dma_map_sg() and device_prep_slave_sg(), and none of
> their error paths undo it.  The skb is freed and nothing is submitted,
> but the slot stays claimed.  axienet_dma_tx_cb() walks tx_ring_tail
> once per completion, so the next completion lands on the abandoned slot
> and dereferences whatever skb pointer is left there: NULL if the slot
> was never used or was already completed, or a stale skb that gets
> consumed a second time.  Every completion after that is accounted
> against the wrong slot.
> 
> [...]

Here is the summary with links:
  - [net] net: axienet: don't advance the TX ring head before the descriptor is ready
    https://git.kernel.org/netdev/net-next/c/cb790252f8e1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



