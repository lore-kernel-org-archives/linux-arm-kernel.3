Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73626C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 23:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFstvIMs/UFjtgJYo5bu/dWM6Jmn4cmpf1U+qSmRq6M=; b=Ds1ZaT3CkGriXDhHvkaAKr2Zoh
	rdBdct3I1b1uc2j9DtR+nSm1cpzc1ctM63WUSc8Ssr5dJJtFkHpFCd8uQYfWHkVH7IL3etqaZArHL
	CyxDBH6esfvmGZVrhmwUX3KNk78neY/rrNY5x9U5/D8cKajesJ7gYOM/UnKeWsEt/0x9biTjS+Bd0
	wOEs7Fmr0k4zyJ69+H4JFc06SAzZJcpf4sx27oNo1V+Q3uUsMU1SjauGguBV6A5RTg73zDqB7gU+l
	lw2xEC6TQq4oGisWcXLmygiwbEgK+b1EG7UqRgQkdEzOLxNVdqCL70iy0Oe+h+bXvLxLNL9ngHHxC
	wVjDpmHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x05ZV-00000006TtG-1W3t;
	Fri, 28 Aug 2026 23:01:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x05ZT-00000006Tsx-29Ut
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 23:01:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8963043EE8;
	Fri, 28 Aug 2026 23:01:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696051F00ACA;
	Fri, 28 Aug 2026 23:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787958074;
	bh=xFstvIMs/UFjtgJYo5bu/dWM6Jmn4cmpf1U+qSmRq6M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=dDCcBG36VRwyA0V/ovYTbGuuc73BvjEP3E0aplIrPASaQA7+Bu01n9XsGIZCqBHGl
	 H4Ut9j8joQ/2htbX3XeZ9JE++TKFwD7LkgVMrIhgAeG5TJBUdc/bsT0VWOhVYk4+Qj
	 Yz0/kkOCZnfIjobbWQESdec4YZtAh8sPHrt2pgl2DA78AFQuIbQLRfxeK/PbyeyO8E
	 X4DgQoscxatiSzQ64v7pbWuthITIm870X9faKrs9c7nnRskQKXx5ssE0XJDHBoziOL
	 dyJ1J6JBflIiFfoBvysqdc/x+Pp6u24r8zKqiog3M+n2RDkm5VANXHxEkBlnYIBQrJ
	 s601fNC1VNqBA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56BE7380AA69;
	Fri, 28 Aug 2026 23:00:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: stmmac: fix dma mapping leak in
 stmmac_tso_xmit()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178795801914.2832451.15311149426122781543.git-patchwork-notify@kernel.org>
Date: Fri, 28 Aug 2026 23:00:19 +0000
References: <20260826-stmmac_dma_unmap_tso-v1-1-a2753d1576ba@oss.qualcomm.com>
In-Reply-To: <20260826-stmmac_dma_unmap_tso-v1-1-a2753d1576ba@oss.qualcomm.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, hkelam@marvell.com,
 0x1207@gmail.com, horms@kernel.org, peppe.cavallaro@st.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
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

On Wed, 26 Aug 2026 15:03:15 +0200 you wrote:
> In stmmac_tso_xmit(), if the DMA mapping of an skb fragment fails, the
> frame is dropped but the DMA mappings already created for the linear
> part and for the fragments mapped before the failure are never
> unmapped, leaking DMA mappings.
> 
> Fix the leak by walking back over the descriptors used by the frame and
> releasing each of them with stmmac_free_tx_buffer(). Moreover, release
> the descriptors with stmmac_release_tx_desc() unmapping the DMA buffers.
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: fix dma mapping leak in stmmac_tso_xmit()
    https://git.kernel.org/netdev/net/c/a5d946466a95

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



