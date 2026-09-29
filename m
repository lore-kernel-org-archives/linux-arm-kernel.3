Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36904CA5FAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 01:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5GXLsHRwa/uiWR9gXSCFqUPaVMTCXPSoRNkmYXel1pM=; b=wwA45DI08ybV+nxd6XFZ4W4HDT
	WPYe6BQZFUsGpRmnRbtkmvttBj61QeIOH09TbMVdGZs63TGUL2Ym6tVTxrSBiK/mZZYfvej3L3BSg
	ymwUYaHH2nmc5L9k+4qhud5Qn1wN1+YmfRDpvJ2mxyqh6SSDXnWyZtUky3iJ+rjkGZ6WYDDDHQF0y
	v6Oaqa8fJ9QUu4M9SeAu9aFAxxB3jTdrx5qYji0hD5/dxmg4V/cuAWNp/OiAUgqLdaE7mCD/OjKyh
	PggaP+HmM+jfRwBxmOAZ2cfkXXnVUcUwoz2jQPeItEvxR41DeJDzyWGft+A5C8mmSNHX5fcv2FlMd
	2Na2I+kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBMpJ-0000000241J-2uT4;
	Tue, 29 Sep 2026 01:40:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBMpI-00000002412-3q1K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 01:40:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B2DA60216;
	Tue, 29 Sep 2026 01:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D4201F00893;
	Tue, 29 Sep 2026 01:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790646011;
	bh=5GXLsHRwa/uiWR9gXSCFqUPaVMTCXPSoRNkmYXel1pM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=kseBpQH1sZvpnkpmUR0DGwExC4M9xjqzM7cQCjYitlnkM8Hvu1sQJ0jAe+Gf9/dF0
	 ZP+qO183z9k6HINhMuzgRTtVOV6pBTqZan94OG81h2FIKIbPKTu3+aR4VIQG7fE6Qq
	 0Q1sEl5tov9BbgfU63TFPIG7+lQbZ3HEZCrTv4coucO8HO1+mLcYgBPYCkmjMOTPUz
	 HMyG29BZNNK32GOdwQxs7vWjAySivARUxZ+zSUjZVian1aBffgFzsOSHLYwPL15Huu
	 +G7NHOJqJxURngR2SJqvg0kCTp7bKgGn+oNvpJ3njQMidNBU54f7t10FDighUj4DVh
	 2Ll4DdjZBgZ6g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A46D3924FED;
	Tue, 29 Sep 2026 01:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3] net: stmmac: fix rx Scatter-Gather support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179064600978.210624.11551401846700650328.git-patchwork-notify@kernel.org>
Date: Tue, 29 Sep 2026 01:40:09 +0000
References: <20260923-stmmac-rx-sg-fix-v3-1-ed26fea7180d@oss.qualcomm.com>
In-Reply-To: <20260923-stmmac-rx-sg-fix-v3-1-ed26fea7180d@oss.qualcomm.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 Jose.Abreu@synopsys.com, ast@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, john.fastabend@gmail.com, sdf@fomichev.me,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
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

On Wed, 23 Sep 2026 11:14:28 +0200 you wrote:
> When a received frame is larger than dma_buf_sz, the DMA scatters it
> across multiple RX descriptors (rx Scatter-Gather). The secondary RX
> buffer (sec_page) was only allocated and programmed when split-header
> (SPH) was active, so for regular frames buffer2 was neither allocated
> nor backed by a valid mapping. As soon as an incoming frame overflowed
> buffer1, the DMA wrote the overflow into the unmapped secondary-buffer
> address, triggering an SMMU translation fault on IOMMU-based platforms:
> 
> [...]

Here is the summary with links:
  - [net,v3] net: stmmac: fix rx Scatter-Gather support
    https://git.kernel.org/netdev/net/c/88095728511e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



