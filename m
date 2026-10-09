Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC23CA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 17:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PoY3aqr6DG621pLXXsvlPveTjmtP6GG3qEUPuZfhjU4=; b=bMrYiKDEFdw8mqLOkZD6PPAUMq
	dzgi8fNJ8MUGgkFJ1704RYzJK72E4WcjC9KfHRWZT+s0s92BaGgdvoxStDb5S464Pi/LljsFHmLou
	3Z5lm8+9G57vgUk3UKCekav0fKRTJrMLygyYThVRnuegE3/DIP6nelGv95ddc/HfYUoktkfRmTLBH
	XtS0iostc7bVyTVW6qtWx3w81IEFGodMEswVYNVNPxb5m2W5erNo6ov1In75fCYrVUk5bwq0VW5fB
	4m97mmdU0Ay/wh0ErN7XD/2myAKbB1LByLa3YZ0No1rToZD6dgwHDTIw/suMUx3A/sN5Yl8w1hxnO
	CaFwla3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDx4-00000006k6o-2G4x;
	Fri, 09 Oct 2026 17:00:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDx3-00000006k62-0fKW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 17:00:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 87BDE60DA3;
	Fri,  9 Oct 2026 17:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89BF21F000FF;
	Fri,  9 Oct 2026 17:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791565208;
	bh=PoY3aqr6DG621pLXXsvlPveTjmtP6GG3qEUPuZfhjU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WhJitxzey9fFvZssGdVh4OkxbcK556oIMxrOSJlkd+cuyE1a1yL+4hn1TD2yKSvMW
	 w81ayDZtb3I1ndEYxELbhe2BRdAPrZHe4UpCpW4ZtbK4bkhPYECiN6oGw+pZhCnXb2
	 r9zooJiczfnv33ZtP2Qu4rhoYFgjBxosZPA9kZijL6ekYf7BQ1r6r0HGPiN7DBrZeb
	 dusOP75IyE5DYdEb3lcVl9It/HS2k0cq50wPqlfKyWPXj4iPRkk1n6L0rIDkXuh1wv
	 qJOoHafPffUVYnApVyFHS3vCD0mo96TboHLsXlXXIO44Z8i6n/EP7z/lr2D41qaWM3
	 m/JtRc9gaRJBw==
Date: Fri, 9 Oct 2026 18:00:02 +0100
From: Simon Horman <horms@kernel.org>
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Alexei Lazar <alazar@nvidia.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-rdma@vger.kernel.org
Subject: Re: [PATCH net-next 3/3] net/mlx5e: use skb_share_check() in the
 loopback selftest hook
Message-ID: <20261009170002.GK83879@horms.kernel.org>
References: <20261007-nb-net-selftest-shared-net-v1-0-458369bfa1ba@tipi-net.de>
 <20261007-nb-net-selftest-shared-net-v1-3-458369bfa1ba@tipi-net.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-nb-net-selftest-shared-net-v1-3-458369bfa1ba@tipi-net.de>
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

On Wed, Oct 07, 2026 at 08:29:24PM +0200, Nicolai Buchwitz wrote:
> The loopback hook gets a shared skb when another ETH_P_IP handler is
> bound to the device. skb_linearize() on a non-linear frame then hits
> BUG_ON(skb_shared()).
> 
> Call skb_share_check() before linearizing the skb.
> 
> Fixes: 95b9606b15bb ("net/mlx5: Extend Ethtool loopback selftest to support non-linear SKB")
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Simon Horman <horms@kernel.org>


