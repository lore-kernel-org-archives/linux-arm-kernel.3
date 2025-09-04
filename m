Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70A6CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 10:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCnUhoLhH2iAXsz4KNcfQ0H4sIO00ewZKPIhOKZ6GkU=; b=pRpnHUecaQT3jFp8cnLXYG+hOk
	m5nhjxZx62BY8jZrabFftJpvkrcU+1cQdcHgos3+tXVQMEcLFDe28DVqhQxlY7SpS/+bESI+yY8HK
	l+iuOfxL4wdbNN0nNBqE0dmF7zjAq9pyPswB0OC+qe+qXh3ZTl5HKNs4tAimI94jXUveQ4ySJK4DH
	qMehInGDtEC49tjjqcZ3T7ghFG6hL8bLQhqibmlkTL/GGA9TQvcuqa2B+EzcWEMz/sBtiSRXAs/1x
	C+DgTzEAf0kPyU152rkaMYmNbP27kSsGka8A+6kSzrzbz8O+kdhn3/T2MKrj2y0NvD5DYRJmToroy
	rw97zCoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7gf-0000000B3rL-3GAB;
	Thu, 04 Sep 2025 10:59:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu6iG-0000000Ai6H-2Kot;
	Thu, 04 Sep 2025 09:57:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A3BC260202;
	Thu,  4 Sep 2025 09:57:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5508C4CEF0;
	Thu,  4 Sep 2025 09:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756979822;
	bh=Mr3XGbhvMQum++WN/lI8qNzkak39gyYMn/Hwp8A8pV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fj8sq+mgo4dfxA5yYQzsWdjJrzopo8xjxcP55pLDVCdIYJX23w2mbI5w9ZBiWursc
	 jbB4qXTb+q9JVhmeeUHzq57A0DfFP75EugVf4ShFtHyWrx9pvig6V/du2iNQ5L6CvH
	 fh1LjNoheXSZvmggQwqStAds4c0Xz4imFgNEqBbQ99ZeLlDN++1/ksDWDRJbekGnUY
	 vUcHGKCHV2ImQEGxjjdSNxVNY84eWqNxaev0mtKagsTLaZ9V8+2yN9dvnua6p/uU0W
	 lw1SOQdyZaH0GHe5ccvEJh4ruq+DYW6X9HytsBHc7O+VaImvtkInuY1ZB0gLW5Hbza
	 EnLwKSRA5uohQ==
Date: Thu, 4 Sep 2025 10:56:57 +0100
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
Message-ID: <20250904095657.GF372207@horms.kernel.org>
References: <20250904031222.40953-3-ziyao@disroot.org>
 <20250904095457.GE372207@horms.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904095457.GE372207@horms.kernel.org>
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

On Thu, Sep 04, 2025 at 10:54:57AM +0100, Simon Horman wrote:
> On Thu, Sep 04, 2025 at 03:12:24AM +0000, Yao Zi wrote:
> > We must set the clk_phy pointer to NULL to indicating it isn't available
> > if the optional phy clock couldn't be obtained. Otherwise the error code
> > returned by of_clk_get() could be wrongly taken as an address, causing
> > invalid pointer dereference when later clk_phy is passed to
> > clk_prepare_enable().
> > 
> > Fixes: da114122b831 ("net: ethernet: stmmac: dwmac-rk: Make the clk_phy could be used for external phy")
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> 
> ...
> 
> Hi,
> 
> I this patch doesn't seem to match upstream code.
> 
> Looking over the upstream code, it seems to me that
> going into the code in question .clk_phy should
> be NULL, as bsp_priv it is allocated using devm_kzalloc()
> over in rk_gmac_setup()
> 
> While the upstream version of the code your patch modifies
> is as follows. And doesn't touch .clk_phy if integrated_phy is not set.
> 
>         if (plat->phy_node && bsp_priv->integrated_phy) {
>                 bsp_priv->clk_phy = of_clk_get(plat->phy_node, 0);
>                 ret = PTR_ERR_OR_ZERO(bsp_priv->clk_phy);
>                 if (ret)
>                         return dev_err_probe(dev, ret, "Cannot get PHY clock\n");
>                 clk_set_rate(bsp_priv->clk_phy, 50000000);
>         }
> 
> Am I missing something?

Oops, I missed that da114122b831 is present in net-next (but not net).
Let me look over this a second time.


