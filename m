Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C34CA601D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 16:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I2u5RYrLi5Vo1HxinX/08L+8VcsTjPu5sczVSHgh/yQ=; b=BXZg5owVJwr6yTmSvzyzKX/pE9
	f+7Z+ooP/rKLuJajLR5+tmybSlM6pd6hZII+Zl/vOvv+oOlH1Xspf2zyXgxnSggrJy/RfchT4XOqy
	zXz+mTQ9BhQGcASusJWua6K2Ghr/lZz/+irsalykkrhv+Zo19K1xl/eoo7AjWKWGUtpObk3ejNRRb
	JXNx5BHR79Vg+87xpqbIQ7QvDzYU4HIPSuEMruJuHQhIC0mdBYTdb8iqrf6dk4vGgzZl20148eprA
	z5cvNiE7AmfSlpWH+CQ3YIZ5KemoNakQ5QYz/aIKdy7ZEWccTiWYF2kQEOFrqQYNwmqaOfGuXbyw5
	c3X05UHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDwX-00000006jvu-3tLy;
	Fri, 09 Oct 2026 16:59:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDwX-00000006jvn-1qU5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 16:59:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 76A8E6053E;
	Fri,  9 Oct 2026 16:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73EDA1F000FF;
	Fri,  9 Oct 2026 16:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791565176;
	bh=I2u5RYrLi5Vo1HxinX/08L+8VcsTjPu5sczVSHgh/yQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KvESlhRhXMB5RiySjeMmv2OIoc8Gdi7xij7cwSN+xkUh1YZXYI4t1SSwGRERnhIHK
	 a2w0Y7RWh1XH8pGXI0HX8wGG9I1PEDnrbhhANmRg2VYIfurkM2ecrahSvL5OX0Uu55
	 aahX3lJERxdLwRpZyHBPjSp2QVkbZbW9KY5hV1pQIQklnSqBXQ0ZTUAdGlwxxwZe4O
	 9KQfFPafjPSS4CXVJNsZezhFqZ8IG7YrUvm1zbssjNXD6uv6s4lYBFTORj+nTbEOaM
	 RBoqa46+1lALyGhrBKu5ddwzH/U5yEy5yliXcEeLdPr2CkCzUzRYhg0xtvFRAFCX/b
	 BglZe/PJJa9Kg==
Date: Fri, 9 Oct 2026 17:59:30 +0100
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
Subject: Re: [PATCH net-next 1/3] net: selftests: use skb_share_check() in
 the loopback receive hook
Message-ID: <20261009165930.GI83879@horms.kernel.org>
References: <20261007-nb-net-selftest-shared-net-v1-0-458369bfa1ba@tipi-net.de>
 <20261007-nb-net-selftest-shared-net-v1-1-458369bfa1ba@tipi-net.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-nb-net-selftest-shared-net-v1-1-458369bfa1ba@tipi-net.de>
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

On Wed, Oct 07, 2026 at 08:29:22PM +0200, Nicolai Buchwitz wrote:
> The loopback hook gets a shared skb when another ETH_P_IP handler is
> bound to the device. skb_unshare() does not unshare it, so
> skb_linearize() on a non-linear frame hits BUG_ON(skb_shared()).
> 
> Use skb_share_check() instead.
> 
> Fixes: 3e1e58d64c3d ("net: add generic selftest support")
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Simon Horman <horms@kernel.org>


