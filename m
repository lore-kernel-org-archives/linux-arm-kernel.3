Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10573CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 14:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wvYcLJkuHRl+JJWgBaInem6yh55cSLJ48XVJQXNiERU=; b=xzU28JTpumtrOJedROAml3tBTg
	C4PTDciClU1SlBBH4aYWuV18eGZ6pk2Oi5azM6SiRZtUNbtk7SMEHrCXmsqUqDmDOUZ7FdAyH2XvM
	tyRQhHXJG04e17gz+lm2+Hy+7nmZl0/p5i9QX49YaJEnAu3ZbNJnzSYU7S/9ddhWC82uYfPkC6VOT
	5NzUZXjs574eBZ/AgreJyFyVilJ0SuRtPker2xhGnT84CAe2k8SWEsvl6ltb2WVYiVm08tVojg7hU
	aSdG7s7Sth9ph55Jy4xUYJO9fsVgPYg+SR58B9EN2tseSE1FUIh102jChQcS22U2Ho86N17WxuGNC
	oMe96hdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzbjU-000000034Hp-0e6F;
	Fri, 19 Sep 2025 14:05:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzbjO-000000034G9-3mx5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 14:04:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1469A60146;
	Fri, 19 Sep 2025 14:04:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113F9C4CEF1;
	Fri, 19 Sep 2025 14:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758290697;
	bh=Mu3X6SDuGph5K1j1mLlp/9JTLqynrqkE/LWUerH70cE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=H1PN94FPWADk7IHNpGADJDYdabllpgG5tVb4XC6vB6hFw3r/on8d+/kf0hlSjPoLB
	 Eu3KU6vTrqi4SYof5pUXo3DGa7hImHu5/Ehb0RZNB0z8wp2oQb4q9347whCwse8p5U
	 +NV1RG1bv5MB9oppnrE0wD4cce/KZelVxLymQsidhd1kNzj+8qRYGXQHGXhmwDEJM0
	 AIKoq9mcIwKDR2aOUsts1okv79YW1yNbL6oJHQQt4FxVN+IocOz9L1wEBXvbfRptVY
	 HaQW62TQGdgdhJr2kaFbLNNl5k+jLLRItBetJauDatR5a1p++cHHxz9JaYFmYYZpA/
	 M2RsdGjytjHMQ==
Date: Fri, 19 Sep 2025 07:04:56 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Roger Quadros <rogerq@ti.com>, MD Danish Anwar <danishanwar@ti.com>,
 Parvathi Pudi <parvathi@couthit.com>, Roger Quadros <rogerq@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Mohan Reddy Putluru
 <pmohan@couthit.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Basharath Hussain Khaja <basharath@couthit.com>,
 "Andrew F. Davis" <afd@ti.com>, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] net: ti: icssm-prueth: unwind cleanly in
 probe()
Message-ID: <20250919070456.197f3930@kernel.org>
In-Reply-To: <aMvVagz8aBRxMvFn@stanley.mountain>
References: <aMvVagz8aBRxMvFn@stanley.mountain>
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

On Thu, 18 Sep 2025 12:48:26 +0300 Dan Carpenter wrote:
> This error handling triggers a Smatch warning:
> 
>     drivers/net/ethernet/ti/icssm/icssm_prueth.c:1574 icssm_prueth_probe()
>     warn: 'prueth->pru1' is an error pointer or valid
> 
> The warning is harmless because the pru_rproc_put() function has an
> IS_ERR_OR_NULL() check built in.  However, there is a small bug if
> syscon_regmap_lookup_by_phandle() fails.  In that case we should call
> of_node_put() on eth0_node and eth1_node.
> 
> It's a little bit easier to re-write this code to only free things which
> we know have been allocated successfully.

icssm maintainers - please review

