Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3955EFCD0A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 03:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/51J5/gP7MjzfAACd45no//LGG1KVdsTDD0Qz6Z9gQ=; b=jW6gav2LMrfrT8lUqDsdsElwAB
	YyfnBfCiIg0abyyh+lGFaZxskhpECQKmXXj/MKegEV6Bk3U5T3uCZENzqB4/R5Af3nxQ9enzgzbxb
	6GTbBmBe+m/xJmf0ANmUYrt6cRRpfUY3t7t+U4LDy2IEK1FL1wM5iMmNjk8JBJu6JzLGgEvyr2MSH
	vd8ZBc8v35GzK5ZSFGlxYT9cnfwj9aSojuppr8uDdTQhluw5zQlwN8Jy7eeTHDPY6eFT0CAhHeGnh
	MfofXQdxjJ287v4+GyI8rfSbmV2mkWg3b03mXT5tEg+7A47KFCxDwakldVJbe9j7EBGGRwY1fsQeU
	fWX3rChA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2hZ4-00000007iFh-2Gkx;
	Wed, 18 Mar 2026 03:27:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2hZ3-00000007iFa-2Txx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 03:27:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C57560051;
	Wed, 18 Mar 2026 03:27:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3818FC4CEF7;
	Wed, 18 Mar 2026 03:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773804439;
	bh=ROD3NFSVkWqgoO/ybbGGf/RRmJURirlhbsgU8LFOnbo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DXSflJNssMfvZKI0jNYIlF3G3Pi9Dld3v2U2jefE1t9afHcvl232I/eDDhWvwwIvU
	 A0bIKkEZhzVpip0sm9h1v/OpNI7R+sGkqOCBk3+lW8ghiFZcWA89ZL4qe2yhVM+/Mn
	 kvb/WarTxUsyA1661m6ekZQJnrkeR8LOslV/v8odHnjXqUO1syVLPKeDNijah/u8A2
	 R+eFT0IG19ckHA412urRZken25zSb8oKf8ayFTaQKgWnr+Bw8CtdJ7P0E8xiArKaMF
	 Lb9duwp2YahU8YfFdaUYW3JjTDcNC3I1pwaj3WwNHC4uCZeGxuRpCfPzBWDNGfI+56
	 4A1ff88u9AQNw==
Date: Tue, 17 Mar 2026 20:27:18 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sam Edwards <cfsworks@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <rmk+kernel@armlinux.org.uk>, Maxime
 Chevallier <maxime.chevallier@bootlin.com>, Ovidiu Panait
 <ovidiu.panait.rb@renesas.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Baruch Siach <baruch@tkos.co.il>, Serge Semin <fancer.lancer@gmail.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] stmmac crash/stall fixes when under memory pressure
Message-ID: <20260317202718.3a5433c4@kernel.org>
In-Reply-To: <20260316021009.262358-1-CFSworks@gmail.com>
References: <20260316021009.262358-1-CFSworks@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sun, 15 Mar 2026 19:10:06 -0700 Sam Edwards wrote:
> This is a pair of bugfixes for the stmmac driver's receive pipeline. These
> issues occur when stmmac_rx_refill() does not (fully) succeed, which happens
> more frequently when free memory is low.
> 
> The first patch closes Bugzilla bug #221010, where stmmac_rx() can circle
> around to a still-dirty descriptor (with a NULL buffer pointer), mistake it for
> a filled descriptor (due to OWN=0), and attempt to dereference the buffer.
> 
> In testing that patch, I discovered a second issue: starvation of available RX
> buffers causes the NIC to stop sending interrupts; if the driver stops polling,
> it will wait indefinitely for an interrupt that will never come. (Note: the
> first patch makes this issue more prominent -- mostly because it lets the
> system survive long enough to exhibit it -- but doesn't *cause* it.) The second
> patch addresses that problem as well.
> 
> The first two patches are minimal and intended for stable. The third is a
> general cleanup that removes the `limit` clamp and *solves* the issue of the
> loop mistaking dirty entries for filled ones, rather than *avoiding* it.
> Because this final patch changes the range of stmmac_rx_dirty()'s possible
> return values, it's intended for -next, not stable.

Please (ask your LLM to) read
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html

You can't submit fixes and next changes in one go.

Please have a critical look at the commit messages.
They are very bloviated and not slop looking.
-- 
pw-bot: cr

