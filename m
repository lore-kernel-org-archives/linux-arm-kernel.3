Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148E0E7C6F2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 22:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2jjDx7cmA1OjjbH63o11FyZDbc/I33fHyxIuhZHsKkI=; b=fTyz4BZx+i5vF3HVAVbJvS7G1I
	ke2m6DMdqe64W1QcCVvcYcJlWT8g8nktP4s6l3fmsHnbioLR53CTv+TVH+TVIk3hua4XjS1uOouLT
	xN5ZMV9e0c/eT/h1gAWRjUFyxTjcQZB5rr19Fn0tH4ld4VjgVuQhwBWZ2O35ewT0e4oGweEUdnhQy
	wz1j2mTVp4wJ5QSNQ/DFPFA9CV3Zs4XUW/RBDUrxlAWH5JS4okMsJXdFJ1hKi10fdg16jzH3UVTZD
	8Hqf1Mi4qABci/rDFTVEy0Bij9ZUHGqu7p/d2MrlLaHutaiFL/PlWBbl2fbl+RDvyfRTxB82VgzC4
	Y8AV1rmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmJ9C-000000032mG-2vmw;
	Sat, 31 Jan 2026 22:08:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmJ9B-000000032m4-0j9r;
	Sat, 31 Jan 2026 22:08:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A9DF60136;
	Sat, 31 Jan 2026 22:08:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B85BC4CEF1;
	Sat, 31 Jan 2026 22:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769897331;
	bh=Hn8w/ZxgQKZB1pqDOktEsWsMFqCOzwf2moKrHkSKVE8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=H9r9IU5+7sYqoinIEQH1ySie6BgWaECZAb0Q5MFZ1kMuAG6Qi2n+B6TLTquqRSagO
	 RYdz3jEFc1sZXCOExF0vvuG2y73z+DD/8DJIxht6zCN3pMoed+nWMYduJNKkUzZf09
	 VeR7Fu8CxztCorCGYB+q5jDNozzNl71ADEmdyVAq7n+3TOlDo7T7ikgSVCR7gKt/0V
	 wVhGk2UJ2iX3gyIMCW6NjYfuJtKyCMRIhHFSykO/Gcly78dpZHR4hw7k35DtHY3UoW
	 K9e0O6JV0VdGx3hErxZ5mKc3t3Cs4b++DRXAoXSY73aSnNPPSSmlbcpNdDrX/T7P7U
	 oEO1ggyX1v7Ig==
Date: Sat, 31 Jan 2026 14:08:50 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Heiko
 Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org, Paolo
 Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 01/10] net: stmmac: rk: convert to mask-based
 interface mode configuration
Message-ID: <20260131140850.3c35f95a@kernel.org>
In-Reply-To: <E1vlmEY-00000006znn-0N0Q@rmk-PC.armlinux.org.uk>
References: <aXyPK9rlMt8h_fze@shell.armlinux.org.uk>
	<E1vlmEY-00000006znn-0N0Q@rmk-PC.armlinux.org.uk>
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

On Fri, 30 Jan 2026 11:00:14 +0000 Russell King (Oracle) wrote:
> +	ret = rk_get_phy_intf_sel(bsp_priv->phy_iface);
> +	if (ret < 0)
> +		return ret;
> +
> +	intf = ret;
> +
>  	ret = gmac_clk_enable(bsp_priv, true);
>  	if (ret)
>  		return ret;
>  
> +	if (bsp_priv->gmac_phy_intf_sel_mask ||
> +	    bsp_priv->gmac_rmii_mode_mask) {
> +		/* If defined, encode the phy_intf_sel value */
> +		val = rk_encode_wm16(intf, bsp_priv->gmac_phy_intf_sel_mask);
> +
> +		/* If defined, encode the RMII mode mask setting. */
> +		val |= rk_encode_wm16(intf == PHY_INTF_SEL_RMII,
> +				      bsp_priv->gmac_rmii_mode_mask);
> +
> +		ret = regmap_write(bsp_priv->grf, bsp_priv->gmac_grf_reg, val);
> +		if (ret < 0)

missing
	gmac_clk_enable(bsp_priv, false);
here?

> +			return ret;
> +	}
-- 
pw-bot: cr

