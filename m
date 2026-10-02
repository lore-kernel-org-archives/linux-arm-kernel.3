Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0D3CA5FE5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 20:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jxjwPiIKbDU6MasNt4osX21VBe+cd6oHzOjlTu73SmI=; b=cNARyFjgcQk6+A3EqyuWneq8CX
	NOiDpHt2Arh87ddgSy5XDlCXCJXleBEJDtcDf4AtInMwWInCQXYYZR2lYnoVOLO3GWAE5mdcIHOUF
	5oP8/ckAUDPu6G7Gl9JMjEmJroJB9kMURAKfekyxqDR4mpP1HfhIK+mi3cUSSeI0PEFzGo2qOh3qS
	LsItJyJdkl8qlq/Z0dLlZfA3mfOWbBoDNvj06ZAHuchq1G1FnbhXSXPkLc5IsmCYJMS/uQfcBf2Z5
	lYdOjwnJhdzj51u7RRGXLUlYPKjDkdHXRvs6I6tV5FTCPQHfbhJ+qM/Wp0vHh6hgVA2RMYCofwsZx
	ixgB3rsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCja7-0000000CST0-2Qlf;
	Fri, 02 Oct 2026 20:10:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCja6-0000000CSSc-3Wq7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 20:10:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6315D41A37;
	Fri,  2 Oct 2026 20:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442651F00893;
	Fri,  2 Oct 2026 20:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790971808;
	bh=jxjwPiIKbDU6MasNt4osX21VBe+cd6oHzOjlTu73SmI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Hjuwagk9La0PlJpyZlFaaLG/EPnfiL5Om9kQFRXuOpENKWtvlydE+l54pbq1e8tAr
	 m5T4DYAkPWbNsihZdAnQifeDv30oDgqgYPfOFQOBhnYr2NuOX8jbI43RKcFF4DZ1kU
	 e45gv0Z1tzsDmAAjvHs+POd4VDgrr9bJ/P8+ROSs3WiKUe/+oia367/AIGSE0bLJGa
	 +7jHzRgH5/SfWSam0ky2sK6uGXU/k6I/5jnWGH8xIPNsm10vHUB4gdVv1EqZ924bsU
	 l6sVvwJffF0zf/CtSH7l5QEJO27ouGPSe688DYesO9gLVHuEcaIXb9W9QFd0/3mCVn
	 9bzb+L9pMcxBg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A3AF3811A72;
	Fri,  2 Oct 2026 20:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v4] net: xilinx: axienet: Free outstanding DMA buffers
 on
 dmaengine stop
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179097180677.3568371.6111049801339254960.git-patchwork-notify@kernel.org>
Date: Fri, 02 Oct 2026 20:10:06 +0000
References: <20260928184207.2361931-1-suraj.gupta2@amd.com>
In-Reply-To: <20260928184207.2361931-1-suraj.gupta2@amd.com>
To: Gupta@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org,
	Suraj <suraj.gupta2@amd.com>
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 michal.simek@amd.com, netdev@vger.kernel.org,
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 29 Sep 2026 00:12:07 +0530 you wrote:
> In the dmaengine path the driver pre-submits RX buffers and holds
> in-flight TX buffers whose SKBs are DMA-mapped by the driver and freed
> only in the completion callbacks. On ndo_stop() dmaengine_terminate_sync()
> aborts these descriptors without running their callbacks, and the driver
> then frees only the ring shells, leaking every SKB still owned by the
> engine and its DMA mapping on each ifdown. With 128 RX buffers pre-posted
> per channel, the mapping leak can eventually exhaust a limited IOMMU
> aperture.
> 
> [...]

Here is the summary with links:
  - [net,v4] net: xilinx: axienet: Free outstanding DMA buffers on dmaengine stop
    https://git.kernel.org/netdev/net/c/bcf2573a68a8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



