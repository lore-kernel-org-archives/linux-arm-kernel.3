Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7429EFF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 10:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1YCFK9fOfX8J7o+4fYxKzID9fqVqxpauY96f73T749E=; b=kzV+WRYxfDKuDHyTlTzqClgkHQ
	rRqc7m9OWpwpV5vr6S2hLmTf7UEWAJ/ptkiLfJ7G8nC0Bm7zdtAp8S0aQFGLSlb54c+oK/wEb3D9/
	d7xzSFpd816clG9AhSZ/wVmD/LPDSHRUhvTgFVmQd+PyoEJvFsst00z/ZeunsDupQZ0C6406pQVsa
	pUHsKykCXUaQ+LVP3ries9jclKeKQ/nPOaqvO0IwpXlJGHhFzLtmuRIr2Qc+k5dNa3mGvISN4XBFW
	g2QaaqjckEhuV0rc4bqzv319HIMtRCUTS0L9SKJ0GU9f6WVLxwEK4R35IZAgrIlMI0O/gebiWDhs9
	9VTJLlPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHg1k-00000001DSj-2E2k;
	Tue, 28 Apr 2026 10:50:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHg1i-00000001DSd-2zCR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 10:50:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BC94960154;
	Tue, 28 Apr 2026 10:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B326C2BCAF;
	Tue, 28 Apr 2026 10:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777373448;
	bh=0cuZ4nY0AbQu+qq/AL+Yse47A4Z10Pa0BfVJC9kTurM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DKk5tgQcak2+Ipn1aFgnj+gK7y+qMU+mqZLdurDKXospQQm0b5lWg5kEVOCh0yFrS
	 wnHyeh3o/G4zbZ2Nmg45NX7CL1ZMKo/9AEjeF14WvsAS6XF6+NWqYqSq2D9BPpzIT0
	 Bn0yalC9+9y0a1Zqiupd590wdA0HMUTwaGAGTXthW9ErGIR1yRv/5MOJWu138jEVo2
	 5wLR5pPWwDPM6ZOHgaWY1jaG4Aizuyxpe5Q9lJJWn7qWb7vaKDaWPqlMSs6bEkKFAF
	 /YP4yhNGwwXwSqCcdRQnu4RvU/SWFHSUq9qEXPaz79u6//BKT7qcbDAb6Uilyre+ke
	 aKW+ZiL5MMiLA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CD903930196;
	Tue, 28 Apr 2026 10:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v6] net: stmmac: Prevent NULL deref when RX memory
 exhausted
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177737340530.407008.57733216818450708.git-patchwork-notify@kernel.org>
Date: Tue, 28 Apr 2026 10:50:05 +0000
References: <20260422044503.5349-1-CFSworks@gmail.com>
In-Reply-To: <20260422044503.5349-1-CFSworks@gmail.com>
To: Sam Edwards <cfsworks@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
 maxime.chevallier@bootlin.com, ovidiu.panait.rb@renesas.com,
 vladimir.oltean@nxp.com, baruch@tkos.co.il, fancer.lancer@gmail.com,
 peppe.cavallaro@st.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 CFSworks@gmail.com, stable@vger.kernel.org, linux@armlinux.org.uk
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

On Tue, 21 Apr 2026 21:45:03 -0700 you wrote:
> The CPU receives frames from the MAC through conventional DMA: the CPU
> allocates buffers for the MAC, then the MAC fills them and returns
> ownership to the CPU. For each hardware RX queue, the CPU and MAC
> coordinate through a shared ring array of DMA descriptors: one
> descriptor per DMA buffer. Each descriptor includes the buffer's
> physical address and a status flag ("OWN") indicating which side owns
> the buffer: OWN=0 for CPU, OWN=1 for MAC. The CPU is only allowed to set
> the flag and the MAC is only allowed to clear it, and both must move
> through the ring in sequence: thus the ring is used for both
> "submissions" and "completions."
> 
> [...]

Here is the summary with links:
  - [net,v6] net: stmmac: Prevent NULL deref when RX memory exhausted
    https://git.kernel.org/netdev/net/c/0bb05e6adfa9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



