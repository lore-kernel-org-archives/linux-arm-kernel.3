Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E78AC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 00:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1tn9tCG8b2zXx+4CLQfoRK/XdzrLaCJyKbrN2e5OXw=; b=R/IEny64g5MZiePLnWdyLTHqjV
	THznKQWSrLHABOKDz+oA3zzGGf7k7pprD4HzHI739hedDqmDNMUO6uI0UUq1bvdRMB6ZTd+lCUBaV
	uoHBjIG2BvczO5BULeHJlGWLB65EAEyWvLZTjshEAclxEWzizVxOsCSgw5d/iQroWygdya2pOVmif
	SdyL/T9cmxe/RYz5Jm5sn+5CVlkEatZRUX87BGFO2Hoa62nMim3Y4ep8VRLArT70KYfs4QgKwT9XS
	y6eI/fN9ijFdq+iNxUnof99duRvI2Rj1HdIUCeREGNrUaa7yFTiN7LxWzFom841bdgp1NAMJUrDuv
	b83jITxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2I9G-00000000pAT-02ny;
	Fri, 04 Sep 2026 00:51:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2I9E-00000000pA6-1689;
	Fri, 04 Sep 2026 00:51:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EB06142B6E;
	Fri,  4 Sep 2026 00:51:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD63E1F00A3D;
	Fri,  4 Sep 2026 00:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788483074;
	bh=A1tn9tCG8b2zXx+4CLQfoRK/XdzrLaCJyKbrN2e5OXw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Ax9ViBNA6Ar7XTnhk4bXi3MS98KaXekFSCjFZ7Fw+SaQZASueHBr75AoAK296lSZp
	 34e4f7A8/q3rNZAiD5MJP3UmAMk5sWRaaNBQghUCaS7zwzDxxVDMja4OvRgGvPLWVk
	 AGm5N10OuRH3XeXi3uHLGVOVt2z7gtao/eQAOu5a+XAVK4FzIgs7Y3u5JaVHueXH3X
	 xrPON6e1wVEaoOPp3o+yLw8dTSBeBBclsTw5/pxoXzuCgeG09mk03KA+HX8mQbgsrf
	 NzJFdbsvos0/d++rhlrKK6B33JtJlIcTyxVEtRFKRtFiBSE8IZYcbGf8hVXdDSb4Cc
	 rUvb8zjqLq1CQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 2D4F938119E3;
	Fri,  4 Sep 2026 00:50:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3 1/2] net: airoha: handle RX_NO_CPU_DSCP interrupt,
 not just RX_DONE
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178848301589.4094353.8627471932045802930.git-patchwork-notify@kernel.org>
Date: Fri, 04 Sep 2026 00:50:15 +0000
References: <17f1beec505b87a4acf16557386a978c98f94b97.1788286284.git.sochnev.v.74@gmail.com>
In-Reply-To: <17f1beec505b87a4acf16557386a978c98f94b97.1788286284.git.sochnev.v.74@gmail.com>
To: Vitaliy Sochnev <sochnev.v.74@gmail.com>
Cc: lorenzo@kernel.org, netdev@vger.kernel.org, upstream@airoha.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-mediatek@lists.infradead.org,
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  1 Sep 2026 19:32:53 +0100 you wrote:
> airoha_qdma_hw_init() unmasks the per-ring NO_CPU_DSCP interrupt, which
> fires when an RX ring runs out of free CPU descriptors, but
> airoha_irq_handler() only extracts the RX_DONE bits from the same status
> word. The NO_CPU_DSCP bits are acknowledged and dropped.
> 
> Once a ring is drained to zero posted descriptors no further RX_DONE can
> fire for it - nothing is left for hw to receive into - so NAPI is never
> rescheduled, airoha_qdma_fill_rx_queue() is never called again, and the
> ring stays dead until the interface is reconfigured.
> 
> [...]

Here is the summary with links:
  - [net,v3,1/2] net: airoha: handle RX_NO_CPU_DSCP interrupt, not just RX_DONE
    (no matching commit)
  - [net,v3,2/2] net: airoha: grow the small RX rings
    https://git.kernel.org/netdev/net-next/c/e84b89f17a12

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



