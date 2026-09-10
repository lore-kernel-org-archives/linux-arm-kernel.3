Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A310DC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 09:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZxkW5GeT9xy9ss0aS1FMlsgqN+mLBhYVrrO86lDB4s=; b=W9nVmR+ipsINNUK6xogoHTNsMh
	Te3B0EI8tj3kUwoaVOkMDr/VkH2A15MAcdeN66SbVZeuHRXKTB9k3LNnn848UzkZNCZsea3MSp0vg
	VgwIZwfWIgQkja871xd4Y1hD0d77RfBxF+pXO2a8R8Rz3J64wpUW2U2ZXZqGlib7YkHd/GFeTxgGq
	jZp2g0zvIZdU6Fh5G9zAVg9HWMM5otU7rR+dBBu1F4LM0s7YM39XfmpjbusIkx5tCH9wU/ZHgRq39
	cgDPGr1YywSgtoH5ykf8N38jIMhQZ7i9Fqf4HJuHvI406XCj/+g7uIBhvgWWD39RZoWF502Hy7wJH
	2w0pvz0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4b8R-0000000DtoD-10rx;
	Thu, 10 Sep 2026 09:31:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4b8P-0000000Dtnn-27Ha
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 09:31:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9FA4D60202;
	Thu, 10 Sep 2026 09:31:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DDBD1F00898;
	Thu, 10 Sep 2026 09:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789032716;
	bh=PZxkW5GeT9xy9ss0aS1FMlsgqN+mLBhYVrrO86lDB4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ERwGEOxHWiQGog/UdC/VYZzMN6BoUvUitPcnl+yPgoF5Glx2rodYkMW5cTiu3fkYw
	 vO6Ge1WwpskL+y+6CstiE1tS45B7Ito2Jo6ITsYQ9t79pBJBluz+VGr6EJWyx7dgRR
	 Mdf/aiw2UFXtuO9LfnrRKSXhBCwOhzg2O+yTlhDxVlJQK0k7fA7WOM01RvKoXr1q34
	 PcH0Gjuzy5Z40u7attUQni/H6e0QL3wPHncFcYpqwQQS6t6TFj0q4hXg/X7HHCfrKj
	 +Hj/TP+9urLqSzEJ1ci8XY7lyKLYZfw28Jttl99Tb6U3EALPy1B0kERtWa7czFsCUF
	 jI3zfdrCIaVQQ==
Date: Thu, 10 Sep 2026 10:31:51 +0100
From: Simon Horman <horms@kernel.org>
To: Li Youhong <dayou5941@163.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Li Youhong <liyouhong@kylinos.cn>
Subject: Re: [PATCH] net: sun4i-emac: fix missing of_node_put() for phy_node
Message-ID: <20260910093151.GO40544@horms.kernel.org>
References: <20260904080758.2432748-1-dayou5941@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904080758.2432748-1-dayou5941@163.com>
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

On Fri, Sep 04, 2026 at 04:07:58PM +0800, Li Youhong wrote:
> From: Li Youhong <liyouhong@kylinos.cn>
> 
> of_parse_phandle() returns a node pointer with an elevated refcount.
> Add the missing of_node_put() on the probe error path after
> register_netdev() fails and in emac_remove().
> 
> Fixes: 492205050d77 ("net: Add EMAC ethernet driver found on Allwinner A10 SoC's")
> Signed-off-by: Li Youhong <liyouhong@kylinos.cn>

Reviewed-by: Simon Horman <horms@kernel.org>


