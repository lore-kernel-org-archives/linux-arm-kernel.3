Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95062C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 23:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LE2xIaLqxnpFgVyvqdHvlP5ZQvm4CTmfcfZq4aJDI5o=; b=2qmqAG2UYUfzuFh2YpbV+LiSC0
	vXjYCa61lWnkGqvqiztQGbQL4eWSPiSagmeB5ZMf/r4LUqUAeJ8YPGcWVm3xsv0oWk+MXQdY7eeP4
	Vb6bB6uM+WTUFd2ESML5lzusRDehDavjRCGhCWrTJ2Hs9UHRnO2ZOrVlbHk0i0tjrMOiMayPRwHkk
	uRrfJE7laBfp+O32YjCSzncZ/vP46uiV36V46kqASlcIjDEtN2r/XkRGV47kRsLHNufH1MW3D4+Cg
	/EfofOGXgBIEYxB0bnisTfcB78OT3Ry5PTzhNCsOvSNIzXcQIvHSkg3rB/5MQZ2uDn8zkgN2Fzz1L
	vbXwp04Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucBUL-00000008rFG-2BcO;
	Wed, 16 Jul 2025 23:24:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucBPf-00000008qmZ-2ibz;
	Wed, 16 Jul 2025 23:19:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 64766A56F35;
	Wed, 16 Jul 2025 23:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 058BDC4CEE7;
	Wed, 16 Jul 2025 23:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752707986;
	bh=kx+4ZYsQpDAmMk5ChkJlInSDwEN1VVHvPfCH1VnGMsI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YOxyIzggkLlEmH823frHhPnCuJX+XHd+xkJmlZN7KVcLFmeMS3qkBcvV8DohuVlNM
	 KXNbmyivPFWN/axz4zSbwAs86xg37rEWOCBq696h1fBfpPT+BCI+8f6ec7PRfOhVQv
	 e9jKzQblFVWoiRQF1WHKRaSzNpcZvv6rJNs21NJzk0A1Xk7JGsRBQuv0xaHzsBpc1u
	 NA95JQ6FmHl73FX7+y/+QrtWQH/U1FUyMgHlBjfJzbp+rrOlXoNbUdOkUSlJYzWrjz
	 mJtoXjFHwzEVMjfZfpE+oJE2DksOAcHOj2nBqPzZqReWp17bYvy7553HzQiS5arGJi
	 u24aszmuHZkTg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 710CE383BA38;
	Wed, 16 Jul 2025 23:20:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: airoha: fix potential use-after-free in
 airoha_npu_get()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175270800628.1359575.17421649701122534916.git-patchwork-notify@kernel.org>
Date: Wed, 16 Jul 2025 23:20:06 +0000
References: <20250715143102.3458286-1-alok.a.tiwari@oracle.com>
In-Reply-To: <20250715143102.3458286-1-alok.a.tiwari@oracle.com>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>
Cc: sayantan.nandy@airoha.com, lorenzo@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_161947_751239_9401B5AF 
X-CRM114-Status: GOOD (  10.72  )
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

On Tue, 15 Jul 2025 07:30:58 -0700 you wrote:
> np->name was being used after calling of_node_put(np), which
> releases the node and can lead to a use-after-free bug.
> Previously, of_node_put(np) was called unconditionally after
> of_find_device_by_node(np), which could result in a use-after-free if
> pdev is NULL.
> 
> This patch moves of_node_put(np) after the error check to ensure
> the node is only released after both the error and success cases
> are handled appropriately, preventing potential resource issues.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: airoha: fix potential use-after-free in airoha_npu_get()
    https://git.kernel.org/netdev/net/c/3cd582e7d078

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



