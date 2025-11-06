Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D404CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 16:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXwwifMuJRUDb7KmvtawtR806QeBdY8uUdUB6PHNMGk=; b=MnqT6ozNUMuYS6qxUPuyBf/uFz
	m+R6hz3Ghs/Za/eV5kXT2KRHOa+n+GDqkdO98lIY0OMuSuB4m0LX5fW8XPw2zkLk5TjqEx1dM4LKX
	JpW+j/hyvVvDGQ4Y7Zw9Ve7PmAsGKgCfGsk+t9SaRfARSDLv1+tK1/GGDtdBx2Jk3ntYQV+9pBt4R
	eAte3Xw19TNKjvhFkz0RRunWlk7zWBE4FQ93JrcN26xj1KHco6taCVMD/Lqemzxo3ubL+RiXE4SB/
	xzMii2iy5XvKpQVj+/7gqDyjCjpH/TttmUzFIYeVUjpdBV6d3sIra0syTx6ragRJYy33HW4jnX5dS
	J6yT+Inw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3A5-0000000FxeY-2RQW;
	Thu, 06 Nov 2025 16:48:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3A5-0000000FxeN-09ix
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 16:48:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 73408618FF;
	Thu,  6 Nov 2025 16:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE72C4CEF7;
	Thu,  6 Nov 2025 16:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762447716;
	bh=/4FiJ6f4TJaczdM9ytFvrqq6aZ2yS1FDznxDzKEei/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n2hzfVWNCgssw0kO7ViuyxSePza4gd1TziiqxcEy+VihxmqregtZ0f2I5UyFVRe/l
	 BxMdDMmGR1KTotHicZSKkN2Q6DDslnC3ldcc6lRSN4fqNpmR1z3f/Fr6uQo+0By4Y5
	 oIxKVJv+w2iOmlA4fKLSBXK6J3cVeTJesy8dS+atlvbK4iKDqksmaXeywJ5H83jG4M
	 8q7gI5sFzH9BBXY0KGDF0Kh/+X1X8bt0cf1gPKAarT7qt1EG89aNSs7bWc1daJFQ0S
	 SVTrnil1nerWwq9TJ7F3N+6WbRXpRZKK2Iy3Yngbnvh2M0sjIgPAo3nH/WQGRML16L
	 3Vgtodby78kGg==
Date: Thu, 6 Nov 2025 16:48:31 +0000
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 11/11] net: stmmac: ingenic: use
 ->set_phy_intf_sel()
Message-ID: <aQzRX6qHy5Yo7T5x@horms.kernel.org>
References: <aQxinH5WWcunfP7p@shell.armlinux.org.uk>
 <E1vGvoo-0000000DWpK-47nP@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vGvoo-0000000DWpK-47nP@rmk-PC.armlinux.org.uk>
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

On Thu, Nov 06, 2025 at 08:58:10AM +0000, Russell King (Oracle) wrote:
> Rather than placing the phy_intf_sel() setup in the ->init() method,
> move it to the new ->set_phy_intf_sel() method.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 33 +++++++------------
>  1 file changed, 11 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> index 41a2071262bc..957bc78d5a1e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> @@ -134,32 +134,21 @@ static int x2000_mac_set_mode(struct ingenic_mac *mac, u8 phy_intf_sel)
>  	return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
>  }
>  
> -static int ingenic_mac_init(struct platform_device *pdev, void *bsp_priv)
> +static int ingenic_set_phy_intf_sel(void *bsp_priv, u8 phy_intf_sel)
>  {
>  	struct ingenic_mac *mac = bsp_priv;
> -	phy_interface_t interface;
> -	int phy_intf_sel, ret;
> -
> -	if (mac->soc_info->set_mode) {
> -		interface = mac->plat_dat->phy_interface;
> -
> -		phy_intf_sel = stmmac_get_phy_intf_sel(interface);
> -		if (phy_intf_sel < 0 || phy_intf_sel >= BITS_PER_BYTE ||
> -		    ~mac->soc_info->valid_phy_intf_sel & BIT(phy_intf_sel)) {
> -			dev_err(mac->dev, "unsupported interface %s\n",
> -				phy_modes(interface));
> -			return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;
> -		}
>  
> -		dev_dbg(mac->dev, "MAC PHY control register: interface %s\n",
> -			phy_modes(interface));
> +	if (!mac->soc_info->set_mode)
> +		return 0;
>  
> -		ret = mac->soc_info->set_mode(mac, phy_intf_sel);
> -		if (ret)
> -			return ret;
> -	}
> +	if (phy_intf_sel >= BITS_PER_BYTE ||
> +	    ~mac->soc_info->valid_phy_intf_sel & BIT(phy_intf_sel))
> +		return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;

nit from Smatch: phy_intf_sel is unsigned and thus cannot be negative

> +
> +	dev_dbg(mac->dev, "MAC PHY control register: interface %s\n",
> +		phy_modes(mac->plat_dat->phy_interface));
>  
> -	return 0;
> +	return mac->soc_info->set_mode(mac, phy_intf_sel);
>  }

...

