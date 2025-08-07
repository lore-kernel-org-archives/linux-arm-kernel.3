Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC110C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 18:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VmXQyKQBMrLbZgZDmXZegSlMFY2fw5+yszpPRSgNjjc=; b=IaEGqVMjDEerrzG9V1+TYl8mKQ
	UvQiGanK8W8GjXECVL733UWaFFhdrbO5xNusnx8vUwLaYtobQN6Vl0d7kQ5+mpvKs6Hs/ztiyVbMd
	iTkjj7XePUKtP55GvI+R6HmLd/UkzhKQ9bRP0GyzcAd9AWowPrtI4/w9QztDgz6I1BLYEvPXUSER8
	Sr8DiruFo75Px9SUgQqvPqPT4Jyp+SYmI5ZkORTDV327Wpv5e/M5RY/ecXIIo17jYWwAuax2Mpg34
	2Wkz8lm3g9RLcrNvdmBBb3LaODE/gNUsiP7Jae+qZ+EJl+3sNP6etDBwfdj9CpqpVh3Wk79FHqaWU
	CPCSE5GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk5WA-00000001LcO-1tWP;
	Thu, 07 Aug 2025 18:39:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk5RF-00000001LG0-3yBt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 18:34:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CE6075C10F8;
	Thu,  7 Aug 2025 18:34:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF1F9C4CEF6;
	Thu,  7 Aug 2025 18:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754591644;
	bh=loZ2Dv1nU1wHg8IXgsAmVe1JV3DP7oTgPbO/b4U/h1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CpmPWgtNr6JME9JZZzgXleZTqAeizkiuPh+hBP0wMVFh6Kx1clun8/mB0+srli9cF
	 iVEjDKD3FUZFp6vN3dnM2+mddVmgrvuFAjDEmaUspyPnYhXh4rsCf3PC3wQCnaUzIT
	 bIp8aTpekWizMp5S7ubJshcrZRFcJeLo22Wy2LPSKHDmHW5F5egGSfpEPsiTMCxaE4
	 b9l2E9D30swgyyX0QYaqu7NV+yRUiVTRs872rZa134SbSDplPhbz8iy0sVy+ublcZP
	 qIYECWImVuKooyKXWddzPlJBIhKyH5ZD0JOc9VFME5xtGphWq++8c5tdmetEbwGHwj
	 VxJTRm4IumZxA==
Date: Thu, 7 Aug 2025 19:33:59 +0100
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, David Wu <david.wu@rock-chips.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net] net: stmmac: rk: put the PHY clock on remove
Message-ID: <20250807183359.GO61519@horms.kernel.org>
References: <E1ujwIY-007qKa-Ka@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1ujwIY-007qKa-Ka@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_113406_026979_47FFB9B1 
X-CRM114-Status: GOOD (  18.69  )
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

On Thu, Aug 07, 2025 at 09:48:30AM +0100, Russell King (Oracle) wrote:
> The PHY clock (bsp_priv->clk_phy) is obtained using of_clk_get(), which
> doesn't take part in the devm release. Therefore, when a device is
> unbound, this clock needs to be explicitly put. Fix this.
> 
> Fixes: fecd4d7eef8b ("net: stmmac: dwmac-rk: Add integrated PHY support")
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> Spotted this resource leak while making other changes to dwmac-rk.
> Would be great if the dwmac-rk maintainers can test it.
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 79b92130a03f..4a315c87c4d0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -1770,6 +1770,9 @@ static void rk_gmac_remove(struct platform_device *pdev)
>  	stmmac_dvr_remove(&pdev->dev);
>  
>  	rk_gmac_powerdown(bsp_priv);
> +
> +	if (plat->phy_node && bsp_priv->integrated_phy)
> +		clk_put(bsp_priv->clk_phy);

Hi Russell,

Something seems a little off here.
I don't see plat in this context in net.

>  }
>  
>  #ifdef CONFIG_PM_SLEEP
> -- 
> 2.30.2
> 

