Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89778C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 15:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djiO85oS8pp5OwgcWxxA+1nEL+n9+Dqo+t+O+D/6AZY=; b=WDELdcz5fbyqv7zve8pliewp90
	SRydTc6mswUNC3OQwqwFTseNcrzFazmh2oH7UHejNQhKo+IVzcmDd0MUbqVZemYDxE5gGDIE/JSy2
	6uAJqi9UuL5jOWcrSbynQshZaCkk4lwmQvvDSx3k8iEIDdhrM1CxdpaR975BVAe7B/WeYmEcwfAIt
	6Y6nhdOkbZ1LmR3l7gZRskZ90Ox1xywfkjXjoiV7am4B9TvsHyQD7pu5tG5TpFlcovJgZSOw9eSvg
	E413THAu8rqJNB9Hi6nGMQ9TwIQypkM+ElBN4JvWEwRWKFwWElp+Zk8agACgLv6/IPItrQFbwChiv
	4HQSOD+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gth-0000000EpdX-2Jbe;
	Thu, 10 Sep 2026 15:41:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gtg-0000000Epd8-1X6R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 15:41:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C168E41257;
	Thu, 10 Sep 2026 15:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3AE01F000FF;
	Thu, 10 Sep 2026 15:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789054867;
	bh=djiO85oS8pp5OwgcWxxA+1nEL+n9+Dqo+t+O+D/6AZY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=DovwmqI8gHCvbNpzUvvyH/y7BW/NuQXPK6xwohKCPqPQhTZawA2C5Vb8Wcr4LfJv/
	 Jeb7zVVwe2Z4greXVBAaZ/ifjDd9wBwiMB5Z8gjpadV5sQ1JLoogRIHDPmIX2T7wmq
	 P4saumim85AkOUgPC3hXikziyvq/qAG5kM8AGgWjFV+3gZHroECcmRt0p+sPTHDGye
	 84rX1LgDFOusE/cv/QROrFsW0Gyco/oIeRo2/HX2UrOXUN4l4fhh28+80fp10YZMCK
	 EE/5zjpDZAICAHwK4zF87BeAEZSCARrC0/uPfsEHAinpD1lrsNYxat2nlGF/6aoCsJ
	 lyxo8DinB1WGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56B40380CEF9;
	Thu, 10 Sep 2026 15:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: stmmac: fix TX descriptor availability check for
 TSO traffic
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178905480513.1504082.12531935982183581.git-patchwork-notify@kernel.org>
Date: Thu, 10 Sep 2026 15:40:05 +0000
References: <20260907-stmmac-fix-tso-nfrags-check-v1-1-328459906cdb@oss.qualcomm.com>
In-Reply-To: <20260907-stmmac-fix-tso-nfrags-check-v1-1-328459906cdb@oss.qualcomm.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 peppe.cavallaro@st.com, alexandre.torgue@st.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
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

On Mon, 07 Sep 2026 23:46:45 +0200 you wrote:
> stmmac_tso_xmit() estimates the number of free TX descriptors required by
> a TSO skb as:
> 
> 	(skb->len - proto_hdr_len) / TSO_MAX_BUFF_SIZE + 1
> 
> which assumes the payload is split into TSO_MAX_BUFF_SIZE chunks. This
> underestimates the descriptors actually consumed by stmmac_tso_allocator(),
> since each fragment is mapped individually and so it needs at least one
> descriptor regardless of its size. Moreover, one descriptor is used for
> the L2/L3/L4 headers and, when the MSS changes, one more is consumed for
> the MSS context descriptor.
> For a highly fragmented TSO skb the check can therefore pass even when the
> ring has too few free slots. stmmac_tso_allocator() then writes past the
> available descriptors, overwriting descriptors still owned by the DMA
> engine, corrupting the TX ring.
> Add stmmac_tso_get_num_desc() to compute the exact number of descriptors
> needed for the header, the linear payload and each fragment, plus the MSS
> context descriptor when required, and use it in the availability check.
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: fix TX descriptor availability check for TSO traffic
    https://git.kernel.org/netdev/net/c/5e38d732ec67

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



