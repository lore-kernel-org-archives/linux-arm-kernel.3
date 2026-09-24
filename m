Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59FCC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 02:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6gvHdYEmRjPiP5dUVlot/Tgw7DMA5AXZlbqPvZfhns=; b=EqYrxiS/F/prBtC5b/SnorfZGP
	pxi5tjNfklhFYHTRhqoVyqAp7FkSm+hK2pROzfHu/hXbA3STGa5WZlgItGud0xcvivYUTWDn2u/q9
	BZXSw09oxF0QSVuqUuVBHTmi1/wf8o6CAcBv1VRUV24iquEzx/7s8Q57lp6Wy80ZTYuY/Bjb4Um6e
	ae/V1pQgweb7w6iZuLUJ+XR2PxgDCxi9SjN5icqrIs6ARDqkQiHhjsnH/3mve7tcDUeyygwFYwgO0
	w2+FSo5+8j6fYCIL0+bN/ASnErVy7BcYuWqcmQOf0lVFgO900Q6IjLE2PAnOCywJGc6294GUnPWgr
	rp4t+ngg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Z5T-00000009r8A-0yVx;
	Thu, 24 Sep 2026 02:21:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Z5Q-00000009r7h-037c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 02:21:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E04824455C;
	Thu, 24 Sep 2026 02:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C69CC1F000FF;
	Thu, 24 Sep 2026 02:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790216482;
	bh=U6gvHdYEmRjPiP5dUVlot/Tgw7DMA5AXZlbqPvZfhns=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=F1O+mTZQ4GWxL7yvN44LO4K2bOvlyPpVrx0GJ0ZSooXRdl/w41qyIWKSZlaMeWuL4
	 xdpHU2N+OlmP2MoTgyLxD/LLvObyIBTxuOgEKueManOaVA6q/+dRInP5kYFdFp+fjQ
	 xQzBL+xYaZTVQYo0yFLrPw51hx6KfqfXPoRgy8wAzTsCrUWdkr37h/pPNvex+9TdY1
	 uBcGs7w1x5R52RRZMNNYs7gK6i/Hv0TL8Hlkn1+hMqi5BNWcyyf2afxYuGLIrxdspu
	 bIOE2j9eVur8NQgBnFp2BL3OlVAWlu7mDfuJtdfJ7PTk6A5zYbs23D1d7BXRcWGiYg
	 W44P/P3EMUhpA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9396139E9611;
	Thu, 24 Sep 2026 02:20:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: stmmac: clear stale buf->page after recycling on
 skb build failure
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179021641214.1281065.12234220924406890442.git-patchwork-notify@kernel.org>
Date: Thu, 24 Sep 2026 02:20:12 +0000
References: <20260921-stmmac-fix-napi-build-skb-error-v1-1-3d54bf6d9bb6@oss.qualcomm.com>
In-Reply-To: <20260921-stmmac-fix-napi-build-skb-error-v1-1-3d54bf6d9bb6@oss.qualcomm.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 si.yanteng@linux.dev, aleksander.lobakin@intel.com, 0x1207@gmail.com,
 larysa.zaremba@intel.com, netdev@vger.kernel.org,
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

On Mon, 21 Sep 2026 16:46:18 +0200 you wrote:
> In stmmac_rx(), when napi_build_skb() fails the descriptor page is
> recycled back to the page pool with page_pool_recycle_direct(), but
> buf->page is left pointing at the recycled page, unlike every other
> consumption site in the function which clears the pointer after handing
> the page away.
> 
> With the stale pointer stmmac_rx_refill() skips the replacement
> allocation and programs the already-recycled page back into the RX
> descriptor.
> 
> [...]

Here is the summary with links:
  - [net] net: stmmac: clear stale buf->page after recycling on skb build failure
    https://git.kernel.org/netdev/net/c/0a7822e34a0b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



