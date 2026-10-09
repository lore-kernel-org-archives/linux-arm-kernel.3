Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12589CA601D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 16:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+BbB+5V1DDE74DWo4AdI8hldCRXKuou9E7wAUg4Z9Ls=; b=uetEG5sM60fiLd96cIovrZVGTw
	xI4Md/A5vIJaovrr5T30CmA1HDX1p39b/F1pXDWGhozagONTnirBF+NwIX5I+tl7qDAjLRvC49/wS
	Yi+H0UhtokIEJK+5OBD4Gjnn0IMHiD04TD2UaWsm6P0qwuct83d5lj0nmr1ONMVp/O6NaBPRQdyD7
	uP/M1MjLfQGavd1xo9GlxyukgPcsXLW/+thSCSF7eJGf/2omk4kQu6szqHgeG0MwAkZ8KhZExNjFb
	iPk6fD19mONiLpjxcq2YPhBB1Je6VNSmuzZBWQxxWEzuoJ9W77yq+PI+RwiI6ZEDshX7crZX6vSPY
	BDhHeKTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDwn-00000006jzf-0XvU;
	Fri, 09 Oct 2026 16:59:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDwm-00000006jzB-0qa2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 16:59:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AC6C242A87;
	Fri,  9 Oct 2026 16:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB8941F000FF;
	Fri,  9 Oct 2026 16:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791565191;
	bh=+BbB+5V1DDE74DWo4AdI8hldCRXKuou9E7wAUg4Z9Ls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=chtnWsYin7j3tISjqYSPw9WzoFctpPMc/kleUrQaf9M1veFXAXBd1SBaJlTK8Fk3e
	 X0j7ZFmZnT6P1WURoFLqgvayj80vQVshPh4n3lKJLE/Y6znMWuZAA98linXTtJgkou
	 PtARy39gJebp4DVGvpQxKqbHSEX3xjlkBX3dR98HtywE6G63s2tM9N3RYEYdg3zBPv
	 Pxy2QGfT/1Xr/oSg3mxw0KZws7zpCPPjHiGTJhciqW5JteyhzSbimddJbg3FSEyK5q
	 /zj2a6yK/rftr/SrNBTVKUpbCz8Ncj0ZdKAaDO4q2qidbdHfRrfRsSk4uROEAE9x9C
	 NdwH/vB9UW2uw==
Date: Fri, 9 Oct 2026 17:59:45 +0100
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
Subject: Re: [PATCH net-next 2/3] net: stmmac: selftests: use
 skb_share_check() in the loopback receive hook
Message-ID: <20261009165945.GJ83879@horms.kernel.org>
References: <20261007-nb-net-selftest-shared-net-v1-0-458369bfa1ba@tipi-net.de>
 <20261007-nb-net-selftest-shared-net-v1-2-458369bfa1ba@tipi-net.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-nb-net-selftest-shared-net-v1-2-458369bfa1ba@tipi-net.de>
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

On Wed, Oct 07, 2026 at 08:29:23PM +0200, Nicolai Buchwitz wrote:
> The loopback hook gets a shared skb when another ETH_P_IP handler is
> bound to the device. skb_unshare() does not unshare it, so
> skb_linearize() on a non-linear frame hits BUG_ON(skb_shared()).
> 
> Use skb_share_check() instead.
> 
> Fixes: 091810dbded9 ("net: stmmac: Introduce selftests support")
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Simon Horman <horms@kernel.org>


