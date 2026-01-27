Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1422D19511
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 00:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOelw5A+TDHV0v/cJbYEPVYXwn43626zGv3kYC/dxwE=; b=cTRt28kRr6WrfMczkWMlsnRkGO
	Fp5kEsSC5o0Dg1MyWE+w9ybC8k6aVdbkgHo00Rwm/ympMSu49a4urzQvSRLLd4wkyeSFucANxszAb
	v13+U2j0J5mCknjR2WdgBGK1/wiPnsh/EzlF13IICpYe/QR3aa7z3spri3gZVS+16xv5bHF1B64Nc
	6I5cKZAAzC23qOzgp8zEmhFlMKo3WSgwFIx+Gkhh/iASq+zpBZNn6Hby1UpX0JbLZEmyUAJufSQF2
	amKh40wB2uEMUiGu63DLOf1LjjgVfqteIZY+JLQDxQBhyp7SCv6I/idOc4d9iCxOi+hSfYtgfuVLi
	QZPxAA2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkXL1-0000000DPGs-2McR;
	Tue, 27 Jan 2026 00:53:47 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkXKz-0000000DPGQ-2oL7;
	Tue, 27 Jan 2026 00:53:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gOelw5A+TDHV0v/cJbYEPVYXwn43626zGv3kYC/dxwE=; b=AzjxNU6h42QGqLhgZkUoGP5Rxq
	dyyBenXI5avgGV0jK3U+tRAL4OGup9CV04oCHWYYBVYQFlvAhg3nVFQNZgb7qiWMzgQdFqbcuyF+0
	owixY3bTixCW+Ql2jGQFP4RjWbfLXA+A+ttTm/fRbbGF4wLbEfGhmo1G5cwLTn0HEcXcUKmk3M1XJ
	YNF2P2pz31mQiWC7PcuCyL2jObC99lbG+ktJ9zqlnmbeH00LN05irT3JtbyA/mVB/lzV5wKuLwvj/
	+6nBxgacMDkB8b5LFcLrHFrQYqr1pAn9sP/2E4aVSwe674QpFgdUBq8jcLmHJhtctDp3U4uHhCE2M
	C+x9oelQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55834)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vkXKv-000000005Tw-3ER2;
	Tue, 27 Jan 2026 00:53:41 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vkXKt-000000005Qo-2p86;
	Tue, 27 Jan 2026 00:53:39 +0000
Date: Tue, 27 Jan 2026 00:53:39 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	pabeni@redhat.com, linux-rockchip@lists.infradead.org,
	heiko@sntech.de, alexandre.torgue@foss.st.com, andrew@lunn.ch,
	davem@davemloft.net, edumazet@google.com
Subject: Re: [net-next,v2,07/22] net: stmmac: rk: convert to mask-based
 interface mode configuration
Message-ID: <aXgMkyo3UhuEnnjG@shell.armlinux.org.uk>
References: <E1vkL2D-00000005uso-3W6y@rmk-PC.armlinux.org.uk>
 <20260127004057.3785761-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127004057.3785761-1-kuba@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_165345_710949_3DFF6EEB 
X-CRM114-Status: GOOD (  17.69  )
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

On Mon, Jan 26, 2026 at 04:40:57PM -0800, Jakub Kicinski wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> 
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> ---
> net: stmmac: rk: convert to mask-based interface mode configuration
> 
> This commit consolidates PHY interface mode configuration into common
> infrastructure by introducing mask fields for phy_intf_sel and rmii_mode,
> moving the register writes from SoC-specific functions into the common
> rk_gmac_powerup() function.
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> > index 4117f6863ff0..35836ffdfc1d 100644
> 
> [ ... ]
> 
> > @@ -1654,7 +1685,9 @@ static int rk_gmac_check_ops(struct rk_priv_data *bsp_priv)
> >  static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
> >  {
> >  	struct device *dev = bsp_priv->dev;
> > +	u32 val;
> >  	int ret;
> > +	u8 intf;
> >
> >  	ret = rk_gmac_check_ops(bsp_priv);
> >  	if (ret)
> > @@ -1664,6 +1697,26 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
> >  	if (ret)
> >  		return ret;
> >
> > +	ret = rk_get_phy_intf_sel(bsp_priv->phy_iface);
> > +	if (ret < 0)
> > +		return ret;
> 
> Should this error path call gmac_clk_enable(bsp_priv, false) before
> returning? The clocks were enabled just above, and the existing error
> handling for rk_phy_powerup() later in this function disables the
> clocks on failure:
> 
>     ret = rk_phy_powerup(bsp_priv);
>     if (ret) {
>         gmac_clk_enable(bsp_priv, false);
>         return ret;
>     }

This piecemeal review by AI is like death by a thousand cuts. Can we
please either stop using it, or find some way to have _all_ the
problems discovered at once.

I fix one problem in this patch, and the bloody AI reports another.
And with the 10 sodding hour turn-around time, this is beyond a joke.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

