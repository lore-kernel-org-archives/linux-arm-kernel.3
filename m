Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F762C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4cOLPLODyeaZekERL0OYLhTbgANEJqaz7Pl7+zSZ+0=; b=r3k4dQsvykiIB9yM7+Ubdhutm0
	cCtslTuSKzYEo4BqtJLPEtx39pEOAJbsNGU0fDWaapzvVqZjbHiQ9dQ5kjlcIBBuJ+X/UAyukcd0L
	uJhJrrFCvNE85PvS2UZ2rEzjsFfO9TflJCw5A1yNqWlOH4vj2vmXGRV+ru4Bwlao4oLTSL9M/MW4i
	peAxBLT9QGggFF2BFsFbg2siNAud3/0tRYoYdL/UPlxlaGHAwizNTDpp7qqSTCSGuxpRcYIAtNZvX
	xk/8UODY5pA7AQlPIDi+W074LwIBE68lC2B+jUxvfo5cSM31HuvgnKURyqkKpwq7HCKi0gAuUsUsu
	u/KXDn+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7kI-00000009BdZ-1Uln;
	Tue, 21 Jul 2026 10:30:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7kG-00000009Bd4-20Ux;
	Tue, 21 Jul 2026 10:30:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B9C9410AF;
	Tue, 21 Jul 2026 10:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CAD01F000E9;
	Tue, 21 Jul 2026 10:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784629840;
	bh=d4cOLPLODyeaZekERL0OYLhTbgANEJqaz7Pl7+zSZ+0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=aERziS7sSsOVVje+jV7j5sXkBk6cESK9Fsy5mMg6OeeAWm0zcNIIro2Zj1Qf/Y0M5
	 q4nulIaT9U0bLR9Az+UES0tsuwHlty0s6PdUlWNFRswBDA+ocKTb0xsCdG6MVtCHuN
	 cBBoEcZT3WpbqwxhzIFZFSK5KCQDqQ+hPT6P0W+Lu1TzTf0uXjaFkyTcBoE1W9Pezj
	 lKIvNzIHaIKQHgdnq0EHGxm/n/TXFAXMO6tvdYag4+96906Pd+Gqn8kC8NMgNFtKN5
	 Y50vH8pUuig6wnpcQI6WIlTdNTA+c5F8QuZ9folB1qlGAgnZxoUaU/vblgHSH6lF0v
	 V+qvP5tcjeSow==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19A8C3924A64;
	Tue, 21 Jul 2026 10:30:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: airoha: Fix potential use-after-free in
 airoha_ppe_deinit()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178462980990.215603.3787793287900751289.git-patchwork-notify@kernel.org>
Date: Tue, 21 Jul 2026 10:30:09 +0000
References: <178351022574.97989.6880403520276841703@gmail.com>
In-Reply-To: <178351022574.97989.6880403520276841703@gmail.com>
To: Wayen Yan <win847@gmail.com>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, horms@kernel.org,
 pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
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
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 8 Jul 2026 19:16:16 +0800 you wrote:
> airoha_ppe_deinit() replaces the NPU pointer with NULL via
> rcu_replace_pointer() but does not wait for existing RCU readers
> to exit before calling ppe_deinit() and airoha_npu_put(). This can
> cause a use-after-free if a reader in an RCU read-side critical
> section still holds a reference to the NPU when it is freed.
> 
> The init path (airoha_ppe_init) already calls synchronize_rcu()
> after rcu_assign_pointer(), but the deinit path introduced in
> commit 6abcf751bc08 ("net: airoha: Fix schedule while atomic in
> airoha_ppe_deinit()") omitted the matching barrier when switching
> from rcu_read_lock()/rcu_dereference() to rcu_replace_pointer().
> 
> [...]

Here is the summary with links:
  - [net] net: airoha: Fix potential use-after-free in airoha_ppe_deinit()
    https://git.kernel.org/netdev/net/c/2484568a335c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



