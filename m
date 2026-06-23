Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE97CDB471
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 21:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LXSocJl1DkUecLpKUrBX/5IU8myxKdn4oCv6XfckMg=; b=BkusCqJnw4q7nADbmg5BWNknUp
	7YqcEmLECKdMW4I0Qdwi0SHsw9euX68Y+dFtG1AX6l2vThq87L3WqgFcPp4dg4Pzc8XAIUdUN3yjx
	LcMuN8BuRxcaHsus0YksITZeNHXMe7TUPKHCq1zKH01UUv1CGpT76cbvB6vz3dHIYS8XEJhOeoOlc
	IbrzJLPzR4gD04H7g9/5WUOCbpT3wyWWfg3kqnt99MfSu9UwQyvvHgkLy1WqGrmjXaY7Meofhm0/j
	bdBj4TVw316ChA36iZ0FGyxOJw0tXQU7O91OlIMDQ0coXy9orDndws1gm6VqWWI3V0GTcXrqhpHZO
	kbJAC3Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc90p-00000006vWA-2nRA;
	Tue, 23 Jun 2026 21:50:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc90o-00000006vVy-1Q92
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 21:50:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 941F544462;
	Tue, 23 Jun 2026 21:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 712271F000E9;
	Tue, 23 Jun 2026 21:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782251429;
	bh=+LXSocJl1DkUecLpKUrBX/5IU8myxKdn4oCv6XfckMg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=K1aVNYNxSseuSmNJu3SIiuKdy9KPhkniusTgjlTF1i9b6Cy7e7vBDCuq/g5ciPwf1
	 GM56/nloS2qyhhPo9txQEeMbWecUnD6ea8RJgfRX36ZTPIrUQPlVR05rwdnZxnsGrv
	 ytfVgMYhGS180l2MIiL6QEnWtFDbjPNmBfmrITAj805s6JtnVAfMxyMlqRWGN7A57p
	 4vf76bMfM/0lJ2/37X5l7j9PQW085LN3i/cDRrZxKdYEamZU+cwT8h6204WDpEj8aA
	 I+Hvu7huQnDp8KAu28FFr53eyfmzRL/j6LXbUW27F8DUXxtvKigfXmnLpnqbqqtsLB
	 meRSLNOaq+KWQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198D9393101D;
	Tue, 23 Jun 2026 21:50:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: ti: icssg: Fix XSK zero copy TX during
 application wakeup
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178225141876.2433118.2854305018338051876.git-patchwork-notify@kernel.org>
Date: Tue, 23 Jun 2026 21:50:18 +0000
References: <20260618100348.2209907-1-m-malladi@ti.com>
In-Reply-To: <20260618100348.2209907-1-m-malladi@ti.com>
To: Meghana Malladi <m-malladi@ti.com>
Cc: diogo.ivo@siemens.com, vadim.fedorenko@linux.dev, haokexin@gmail.com,
 devnexen@gmail.com, horms@kernel.org, jacob.e.keller@intel.com,
 pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
 andrew+netdev@lunn.ch, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com, vigneshr@ti.com,
 rogerq@kernel.org, danishanwar@ti.com
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

On Thu, 18 Jun 2026 15:33:48 +0530 you wrote:
> emac_xsk_xmit_zc() handles tx xmit for zero copy and gets called
> inside napi context. User application wakes up the kernel while
> initiating the transmit which triggers napi to start processing
> the tx packets. The num_tx check inside emac_tx_complete_packets()
> returns early if no packet transfer happen hindering the call
> to emac_xsk_xmit_zc(). Remove this check to let application
> wakeup initiate zero copy xmit traffic.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: ti: icssg: Fix XSK zero copy TX during application wakeup
    https://git.kernel.org/netdev/net/c/d95ea4bc09e8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



