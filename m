Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45F2CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 10:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9q1soGZ7n1R1ym2j0tUxiWSbg3wSew1kg43scVXH4no=; b=SzU2g2OHNQtO/2y7rIxgDNzRRH
	p5sNAQbq6iKYDfuzS6k8C/11OMpLxZpWsLuCZCe7rLJkc+X0iN1I1hb/WnMrZUhVwXmU1F55t5HJT
	pIRPFBsBSZeA2p5Y6V8SnuX47opkKeGBaEWCTaYtyuAgBK+EKtZh3i3eI8mivzuzEDUpO+OMeXAXO
	w9FGjmjivVnl5luzR4yOYEYn/AF1SvNUpxGMppm7MpAJjkXP1Rl2xR9+ptrviWJe7qSf4XdvOFxb6
	rLNICe1pCMK4fV8waQnySVlVlEBjSjnwFu4hPZ9apC1BFxYFJr+ZzLLT+fzYIEiez3pdJYOxWrGNJ
	RnMLq7OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7dy-0000000B2yQ-0Kk2;
	Thu, 04 Sep 2025 10:56:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu6gJ-0000000AhSh-1c8c;
	Thu, 04 Sep 2025 09:55:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A53A660202;
	Thu,  4 Sep 2025 09:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B5FC4CEF1;
	Thu,  4 Sep 2025 09:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756979702;
	bh=PkwoREsB9/pKPRtysjzXpw88sUFZQqfBBJxGudm+f48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TD0N2AfykrOHqznsu9h1ZxeWsqAwTt0PUB0Iftz9PpWRbfPjknJt4qVMDq3BLA81i
	 eI6ZQHOafWau1RyiBiHCISdcsQ8n2ALkLIW9Xbq5b+gQu66zDctJG17dCXnH9QxPMU
	 B2Ay/I4KM9GO+/+4LVDKXTDq2iGmDidL3t6eHAZHpvpOcpyimiT0DmK2wIYU0OoTSo
	 33enSCOo3P57BkyNnRf16VpjQHzu9zrL0IH4g+B520euaqSqIFnSDVi93kNZ4MFvVo
	 XxOE+R6Fn74sYv34SsqQxiE96EdBQOeUXUsMGDuKIl8stF4HG0e45zYe2r91WJqNoJ
	 0f+lTV2ZzxXog==
Date: Thu, 4 Sep 2025 10:54:57 +0100
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
Message-ID: <20250904095457.GE372207@horms.kernel.org>
References: <20250904031222.40953-3-ziyao@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904031222.40953-3-ziyao@disroot.org>
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

On Thu, Sep 04, 2025 at 03:12:24AM +0000, Yao Zi wrote:
> We must set the clk_phy pointer to NULL to indicating it isn't available
> if the optional phy clock couldn't be obtained. Otherwise the error code
> returned by of_clk_get() could be wrongly taken as an address, causing
> invalid pointer dereference when later clk_phy is passed to
> clk_prepare_enable().
> 
> Fixes: da114122b831 ("net: ethernet: stmmac: dwmac-rk: Make the clk_phy could be used for external phy")
> Signed-off-by: Yao Zi <ziyao@disroot.org>

...

Hi,

I this patch doesn't seem to match upstream code.

Looking over the upstream code, it seems to me that
going into the code in question .clk_phy should
be NULL, as bsp_priv it is allocated using devm_kzalloc()
over in rk_gmac_setup()

While the upstream version of the code your patch modifies
is as follows. And doesn't touch .clk_phy if integrated_phy is not set.

        if (plat->phy_node && bsp_priv->integrated_phy) {
                bsp_priv->clk_phy = of_clk_get(plat->phy_node, 0);
                ret = PTR_ERR_OR_ZERO(bsp_priv->clk_phy);
                if (ret)
                        return dev_err_probe(dev, ret, "Cannot get PHY clock\n");
                clk_set_rate(bsp_priv->clk_phy, 50000000);
        }

Am I missing something?

