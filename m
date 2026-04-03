Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2DDE88D6E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 22:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UD4iYKr0RwJBdjOq5o2iO00xILNUZb0+054xIjHpbMk=; b=DjY1/OmIl0hBtrpfndvr+Pzh/r
	eBWd/FQjdrVmppei+z16wYnmGxSUer9KZEfBAYxY+zAxdCejZj0KX3uuJL7iUmF/FZ9ZCdFYRiObW
	DkLzlCiiWmFrsHNtUlCFhKpS5WbKODzjQFG+HwpvzBzR/rLHdhK6Q2Uj+ChUz5JzHJhA+CaA+tkA6
	PxkVI72HE08F1TS+yrMiAxUUWRm77J3Hbw59p+ozKNvhpuDkQbipKjojnlnHRK5JBkHsLsmQrv8EU
	AbKnYumTz3E/U/vx33KkpcrlzBglsABI9TQHfYUjlPeO/jdyhbdLI2zMlzRI+XI4FAYbh5zuFvo7K
	yH8sWuPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8mZG-00000002g7R-0cd1;
	Fri, 03 Apr 2026 22:00:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8mZD-00000002g6z-0pPC;
	Fri, 03 Apr 2026 22:00:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D3F9544581;
	Fri,  3 Apr 2026 22:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA7A4C4CEF7;
	Fri,  3 Apr 2026 22:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775253637;
	bh=XQhuRFS5BhcmVEdMuLawsRfUu2jHBVhVjnMXYwC/UYE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mWulMMjS+GA+sce/alHYMe7S7502pEHOwPO1e/XgbBPylsuwU8FChqi9PUMkVsHRG
	 1t39RpQV8EObJa9vFGWjc2iuJfAitb9hGEGomEZQL2NaRc8WrqNubIuaEbeVeuV/2H
	 MIglKDpeW7SrwzMbeTJalPgTHzExCK5WkQOQvMr90Q4qkMHJ6MHFQ0PYkuJ/eXU0qD
	 RZpsxw3MP5jDdl9kkb08OZKfYebprt/FG9JMnz4oyZqqT7+oNfDcxVEDsr1/MeOBkk
	 mOLc1Od6wjUdQuC/vd5VWi3F3ZcBwm9dVcIIbc9NOQTk8HWKmKKUfJsYCENYWzAoTP
	 jEtS2nofA9Y+Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CD813809A14;
	Fri,  3 Apr 2026 22:00:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: airoha: Fix memory leak in
 airoha_qdma_rx_process()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177525361903.1466030.1505141844783892898.git-patchwork-notify@kernel.org>
Date: Fri, 03 Apr 2026 22:00:19 +0000
References: <20260402-airoha_qdma_rx_process-mem-leak-fix-v1-1-b5706f402d3c@kernel.org>
In-Reply-To: <20260402-airoha_qdma_rx_process-mem-leak-fix-v1-1-b5706f402d3c@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_150039_285489_3DB4D8BB 
X-CRM114-Status: GOOD (  11.82  )
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

On Thu, 02 Apr 2026 14:57:10 +0200 you wrote:
> If an error occurs on the subsequents buffers belonging to the
> non-linear part of the skb (e.g. due to an error in the payload length
> reported by the NIC or if we consumed all the available fragments for
> the skb), the page_pool fragment will not be linked to the skb so it will
> not return to the pool in the airoha_qdma_rx_process() error path. Fix the
> memory leak partially reverting commit 'd6d2b0e1538d ("net: airoha: Fix
> page recycling in airoha_qdma_rx_process()")' and always running
> page_pool_put_full_page routine in the airoha_qdma_rx_process() error
> path.
> 
> [...]

Here is the summary with links:
  - [net] net: airoha: Fix memory leak in airoha_qdma_rx_process()
    https://git.kernel.org/netdev/net/c/285fa6b1e03c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



