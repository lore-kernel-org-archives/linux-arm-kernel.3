Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62156CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 07:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BAJzzdhvugzKkYVj8KyEXPZU8qeSPJVqLHbWNfyLaQ0=; b=KIbqIbyeQstgXFN26sCHSa+z1i
	S9V3DywDfcWFPOj8RsdK3aYSYk1t69dwC3tVvBOJc4PCQuc+ZB4Ac/2AVb3THop4lRAkyGEj79jDM
	Ngdo10GeRaX6AXuRdlKhijYdX0F0HGCG9DRNMSp2rByh3DtwpDhBYg/RLuHBOOKO+UAdstWOFDUby
	iFIsxtdkktzVfJQOT0PRgLzCPAv9t8L1Si7X87adsmebO7s4FLusySQ2mDTxehj29ZcXTe9jhnia7
	3G1rwKv3IHs64lStlyjzDWdDHHnTj3Xb/ABnwABKb3Tp05iwhqcpKLPSv9RK83h8ZhWNhidA/Sid0
	whGMi3uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFuh-0000000H2H9-3pCq;
	Thu, 15 Oct 2026 07:30:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFug-0000000H2H2-2OEO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 07:30:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DE18B402D7;
	Thu, 15 Oct 2026 07:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFC8C1F000C4;
	Thu, 15 Oct 2026 07:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792049405;
	bh=BAJzzdhvugzKkYVj8KyEXPZU8qeSPJVqLHbWNfyLaQ0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=fXNrCSz0zq2geIvGS/pywMuHMsDLj1yhzBf4O6e9/XBzukiNkTy1BTyigOJCPhMP4
	 WW+FJSpnjGvneReRPWaKcAsHFAaz8mF5+TdoeVycQ6wlsfJpoZ6+rCovjM51UIwlCv
	 aJebFMJ/KskssLDZkdTwFY8hdnOaNcM1NGk4DF45M7Q7I317L6W9kH6uKoZ0fYqYWZ
	 xC6MqFaVPBYr806LnRENGyoDlU7dZkPBVQw5FJddKR3yljCs+sKfFBciQOVms7OWx6
	 FYZWtWia+4EsOwyK8Dg1STurD/HvZpaKvauVqev4IZlM0s6WDbE1b/wMdR9QcmfH3o
	 K+7GuDsyhkaOA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B458F392E9C3;
	Thu, 15 Oct 2026 07:30:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v4] net: axienet: free outstanding TX buffers in
 axienet_dma_bd_release()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179204940452.3240332.8918425911650346441.git-patchwork-notify@kernel.org>
Date: Thu, 15 Oct 2026 07:30:04 +0000
References: <20261007034620.1360542-1-maimon.sagi@gmail.com>
In-Reply-To: <20261007034620.1360542-1-maimon.sagi@gmail.com>
To: Sagi Maimon <maimon.sagi@gmail.com>
Cc: netdev@vger.kernel.org, radhey.shyam.pandey@amd.com, michal.simek@amd.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, daniel@iogearbox.net,
 jacob.e.keller@intel.com, joe@dama.to, suraj.gupta2@amd.com,
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

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed,  7 Oct 2026 06:46:20 +0300 you wrote:
> axienet_dma_bd_release() walks the RX ring to unmap and free every
> receive buffer before releasing it, but frees the TX descriptor ring
> with dma_free_coherent() alone.  Any descriptor that
> axienet_free_tx_chain() had not yet reclaimed still holds its skb and
> its streaming DMA mapping, and both are lost.
> 
> axienet_stop() disables TX NAPI and stops the DMA engine before calling
> it, so nothing reclaims those descriptors afterwards.  Bringing the
> interface down while frames are in flight therefore leaks up to
> lp->tx_bd_num skbs and mappings each time.
> 
> [...]

Here is the summary with links:
  - [net,v4] net: axienet: free outstanding TX buffers in axienet_dma_bd_release()
    https://git.kernel.org/netdev/net-next/c/0c20cb4cfb40

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



