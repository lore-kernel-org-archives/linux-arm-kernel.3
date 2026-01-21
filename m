Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3331CD262AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 02:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=beTsPV+dNgdWrcD7FNNVhR2hdFwDTMIalNPQRbW//U0=; b=ssjBeQh7yltzT9joWc3qH7jOyl
	fKo4y5Xu3EATM+uxpsazcQseIo+cAb0lL43jRI9x0T//T9a8v/q2QgulnSQuH3aZ7hQR8hr8fsnA+
	TYHQADX6W9JQqAJo6//tu1iUOcY4EOT4GrLq21CYGNd46HoK/vCo81jt/bdpPZI7/+O8R1wfMG0DI
	AE/oUunGcWvv7HO0WpeISjb7iot9G++OhVcmz7MoIuiT8AA2CrHlxsIgdgYM4kv1kmtreCWFcAkU3
	5czdZToFTbrh9Ka9/Ms5utQJ6WjPkN5gsyMkPh0p+8XGwBPuISwiQllKirigm8vNgkJ1AjiQg+CJ1
	9BDLGQxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viO8v-00000004ns2-2lbj;
	Wed, 21 Jan 2026 02:40:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viO8s-00000004nrZ-2xkC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 02:40:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CEAB84447B;
	Wed, 21 Jan 2026 02:40:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0B76C16AAE;
	Wed, 21 Jan 2026 02:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768963221;
	bh=s/nOpcZ2dfdGq9bwCoY+9+xn0XWm9mgVfH0e3fAKI6M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sjpyyPwXJ5C3OsB0Q+IQ5lrCfiDjLn6zML6BGD044LzqEo8yT1IhN9j19ndpRQpua
	 TPO3Ve5jlRquHDjKBTAY/5JbxxJyLTNDXMZnaXlyFtavAm3/5wzRVZeFknC8+ZYKX4
	 KztnTE68KDs2PNqfHTtxkeMrs+uLU2NKCYTvovWu8txCcInNl5DTdfYbUovhCA/Hpo
	 o0OLRDLap6Sc/8kpxRIrhVjgcsPclDDA7wcjm943TEVRPZdDxQ9WTW/5zB/HRHSnRV
	 MwThDU/bt6afJcBF3s6CiEop/LtMKQMJTPq5jxvAKZrWAt5bOAS5mK0DoP50gytCDL
	 5E1TfjavyulFQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4EECA380820D;
	Wed, 21 Jan 2026 02:40:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: stmmac: fix resume: calculate tso last_segment
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176896321885.699622.7276835234573904684.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jan 2026 02:40:18 +0000
References: <E1vhq8O-00000005N5s-0Ke5@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vhq8O-00000005N5s-0Ke5@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, tao03.wang@horizon.auto,
 alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, Jose.Abreu@synopsys.com,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, pabeni@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_184022_765243_E8CF74A1 
X-CRM114-Status: UNSURE (   7.72  )
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

On Mon, 19 Jan 2026 14:21:36 +0000 you wrote:
> Tao Wang reports that sometimes, after resume, stmmac can watchdog:
> NETDEV WATCHDOG: CPU: x: transmit queue x timed out xx ms
> 
> When this occurs, the DMA transmit descriptors contain:
> eth0: 221 [0x0000000876d10dd0]: 0x73660cbe 0x8 0x42 0xb04416a0
> eth0: 222 [0x0000000876d10de0]: 0x77731d40 0x8 0x16a0 0x90000000
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: fix resume: calculate tso last_segment
    https://git.kernel.org/netdev/net/c/5228e9faaed4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



