Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806BECA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 11:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+goRaF2BXPa3JUfS9zLLRMae1vMLp+fPIsr+Jmw+l8=; b=Mhn6FgByM9vYyE1/bJgS0yUscz
	FWNrFQhSZoLUWORkc21d/u2e3vx/9fw+aa1nmO+lt0dRWLOW+mKNruaKZp8iNxGDL2Ikb/2RpZFwO
	eG356pqOEIeWeBI8a9pXEWVo8fk3Zajuqbb7m30rIOLyApg451doJPyNzHP3w7kIu/qDoEyUWZHxo
	dXqeZKQZ1GbYpao+SD/k5dnHA2z30HlEl1lJxjnafa2SiK64LOBmWaVMY1hb1lMZ6k4eyC5Pvqr3W
	UFPaMtGxRlg5cSlC756H5PQCksMkacyX7/oFEaGpwaSnAEIwAP4zeaP46m52k27B7oBEO/CC1Hvzd
	3yccPIIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu87l-0000000BDsO-3Dx8;
	Thu, 04 Sep 2025 11:27:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7D0-0000000Atep-0ZoZ;
	Thu, 04 Sep 2025 10:28:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C7328445E6;
	Thu,  4 Sep 2025 10:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D167C4CEF0;
	Thu,  4 Sep 2025 10:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756981729;
	bh=ErbxO5/wHN1AdSE92UHPrTjG2PfFKUR4AzwDgopvUss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ixWBUIU0YQ6tHk3M8l4X1k2WTRKz+XCz6x17USQfH+ncdZ8e4t2Q3J+D+nBd3IM7Y
	 L79xi2dgRFC3nUjxYbvHDOQSIz4wokb7+6qhNNyFj+u7aXL8jh+5T5WWdTPZTvJdtf
	 UBqrZXOMiVxMAr1y1NXwzNsk8rQHLXWuuKhdH2y9QTBCPd56LWBOZ6l2aNZp5K/TSU
	 3m4czHUCYKZjBnVAGNKlID1oHbgnvpiaxD3wALS/L6W0x4t8EM8hGI8zscn5KAaZg5
	 sPKI+0kvR6HP1PNqZqYm53WHFvUfudFYgg+OLGHnzT6N5kaN6CQxiD7uU/u++e2zZZ
	 5qTCOt0zPLzTw==
Date: Thu, 4 Sep 2025 11:28:45 +0100
From: Simon Horman <horms@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Jonas Karlman <jonas@kwiboo.se>, David Wu <david.wu@rock-chips.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH net] net: stmmac: dwmac-rk: Ensure clk_phy doesn't
 contain invalid address
Message-ID: <20250904102845.GG372207@horms.kernel.org>
References: <20250904031222.40953-3-ziyao@disroot.org>
 <20250904095457.GE372207@horms.kernel.org>
 <20250904095657.GF372207@horms.kernel.org>
 <aLlleb271owHNIbt@pie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLlleb271owHNIbt@pie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_032850_194188_4E51C8E9 
X-CRM114-Status: GOOD (  25.89  )
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

On Thu, Sep 04, 2025 at 10:10:01AM +0000, Yao Zi wrote:
> On Thu, Sep 04, 2025 at 10:56:57AM +0100, Simon Horman wrote:
> > On Thu, Sep 04, 2025 at 10:54:57AM +0100, Simon Horman wrote:
> > > On Thu, Sep 04, 2025 at 03:12:24AM +0000, Yao Zi wrote:
> > > > We must set the clk_phy pointer to NULL to indicating it isn't available
> > > > if the optional phy clock couldn't be obtained. Otherwise the error code
> > > > returned by of_clk_get() could be wrongly taken as an address, causing
> > > > invalid pointer dereference when later clk_phy is passed to
> > > > clk_prepare_enable().
> > > > 
> > > > Fixes: da114122b831 ("net: ethernet: stmmac: dwmac-rk: Make the clk_phy could be used for external phy")
> > > > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > > 
> > > ...
> > > 
> > > Hi,
> > > 
> > > I this patch doesn't seem to match upstream code.
> > > 
> > > Looking over the upstream code, it seems to me that
> > > going into the code in question .clk_phy should
> > > be NULL, as bsp_priv it is allocated using devm_kzalloc()
> > > over in rk_gmac_setup()
> > > 
> > > While the upstream version of the code your patch modifies
> > > is as follows. And doesn't touch .clk_phy if integrated_phy is not set.
> > > 
> > >         if (plat->phy_node && bsp_priv->integrated_phy) {
> > >                 bsp_priv->clk_phy = of_clk_get(plat->phy_node, 0);
> > >                 ret = PTR_ERR_OR_ZERO(bsp_priv->clk_phy);
> > >                 if (ret)
> > >                         return dev_err_probe(dev, ret, "Cannot get PHY clock\n");
> > >                 clk_set_rate(bsp_priv->clk_phy, 50000000);
> > >         }
> > > 
> > > Am I missing something?
> > 
> > Oops, I missed that da114122b831 is present in net-next (but not net).
> > Let me look over this a second time.
> 
> Oops, yes. Though this is a fix patch, it should target net-next instead
> of net since the commit causing problems hasn't landed in net. Sorry for
> the confusion.

It's ok. I'm pretty good at confusing myself without any assistance.

