Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FC1C3DA7A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 20:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J74yMVdROHOSqDpQt8vzdEHyhc79HiSag/0ZDT/dVDY=; b=JkFs/KMbdegPc00Ovq/NFd/syk
	e4gSxJLgbutTgj2WmrneXg88qawkx9DDg3+0Jf20KCbeB3UG0zpJiacku2IScQ988spUgCXqCrgmd
	EFi+a90kJrFPoHkoKeky8vN1Cf4LIgXI5DLJ1pb+L3fZ1ZuoOmJohAtT3QgEE1EWlISLb0vRbIIKU
	cXNUm+tYSuoLlWZylAoFyGVfcWzPSHdmPqiQbS52gnvRvs18VnRHNohRssJWPBOxVO/+W/bKcEK2k
	FgiTWv4O8jKpLixjJjIr/2ajlXBREA/pQdSgXFShu23+XRW0Uon+FYG6BQocxAynwmCTbwTfEuuZ9
	Tr2SeBxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH5F2-0000000GFFH-20XD;
	Wed, 14 Oct 2026 20:06:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH5Ez-0000000GFF8-2Iaq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 20:06:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E1FB060098;
	Wed, 14 Oct 2026 20:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23E51F000C4;
	Wed, 14 Oct 2026 20:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792008380;
	bh=J74yMVdROHOSqDpQt8vzdEHyhc79HiSag/0ZDT/dVDY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=UimVmlXi6yp/94y2kx8+9uB1XS4sKw3as8nM/huU5VvzIfpO6YQj+6B/3woC3x+bo
	 Ia83E6ptRq9nK09Ko/BAX3FEKoa/QyxBRSogLPpNKX4yY8Iipqh/+raj6DPo//etlG
	 nZlFs+4m7TVIRKP9ik9L32WGXvL/2eEPpx5Vsh1vRl5ONRXe7vuWNsVS2BvDA4L9JV
	 xBYyx5X3Y8PBKWfhiJAvBwHNjNsElFDqKrGJnx1tvNrIzlEAFunLD5ackAoLgTholU
	 8dFVU+1xGaRBSeyt+lV4BN1u2oUpiLZ4LnzQaopEz8AORu2Snv5R9sS/CWhwgIXomt
	 CMX1cbJ/FGrHA==
Date: Wed, 14 Oct 2026 13:06:18 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>, Maxime
 Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <Jose.Abreu@synopsys.com>, Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan
 <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky
 <leon@kernel.org>, Dragos Tatulea <dtatulea@nvidia.com>, Alexei Lazar
 <alazar@nvidia.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-rdma@vger.kernel.org
Subject: Re: [PATCH net-next 0/3] net: use skb_share_check() in loopback
 selftest hooks
Message-ID: <20261014130618.4c50f817@kernel.org>
In-Reply-To: <20261007-nb-net-selftest-shared-net-v1-0-458369bfa1ba@tipi-net.de>
References: <20261007-nb-net-selftest-shared-net-v1-0-458369bfa1ba@tipi-net.de>
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

On Wed, 07 Oct 2026 20:29:21 +0200 Nicolai Buchwitz wrote:
> The loopback selftest hooks can get a shared skb when another handler
> is bound to the device. Linearizing a non-linear frame then hits
> BUG_ON(skb_shared()) in pskb_expand_head().
> 
> Stumbled over this on RPi CM4 (bcmgenet, with jumbo series applied +
> WIP selftest patches) with a packet socket open at the same time as
> running ethtool -t.
> 
> stmmac and mlx5 seem to have the same pattern, xgbe already handles
> shared skbs. Patches 2 and 3 are compile tested only.
> 
> As the impact is pretty limited and doesn't seem to bother anyone in
> the wild, I've chosen net-next, but kept the Fixes tags. That matches
> what Paolo suggested during the LPC track.

Wonder if we should follow up and rename skb_unshare to skb_unclone_full
or some such? The "share" in the name is quite confusing for people who
haven't been around for 10+ years..

