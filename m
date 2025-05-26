Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93B0C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 17:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ioFZifM8dRn5AWzFoATN3MruIDugkGoasnnViHSdO4U=; b=4UUZkpIqKgm2heoP0uIV5zco1J
	TgZJuf9Zqg6ITr+vS6tHO63Yfn7yp8Kdzaf1X5T8fZn/iTvlGXwFReg88rGAEZkTEvZIMrYdHsVuK
	ROz99KVJhMppIxApoUtcnZ4wqr4DNyhLYGIBsrwzSpJaxEbKZB/sg5pDkx+seu62INI3KAGB8yJEH
	fTzfHqwM4O3zg9MNKccKEzx9WG/oXAvaJFJsLOpr34F+rRXlkmzkC3ULJy8Wl1XLVTb9SE6gswReg
	MLRjls/0TO4aV/G5ujjhmm22uMLmBpxQQxg0xhc8TzF5wlUrL1k9jieow0T/1bQZqpQIBGMCtQsZL
	XfFq9Ouw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJbTJ-00000009JHm-0Qha;
	Mon, 26 May 2025 17:18:45 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJbGa-00000009HXk-0hrc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 17:05:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=ioFZifM8dRn5AWzFoATN3MruIDugkGoasnnViHSdO4U=; b=Xo
	UVqXbDL5alO3ZRLdDwEsTqGkuUqfngzF3nvIPtjcGk64MlCq1PrAgzorqFFgRmkQiKcYOWOq+F9v+
	ciFpZNU1tQJNrb87mAtHPoAgDUVNViOZiyJsZ1wzXvyKB5jZ9Gn4mOqigWuKnuzzpyxAfQtT7WzQM
	tjqlmt2Gnp+lw+0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uJbG8-00E117-QC; Mon, 26 May 2025 19:05:08 +0200
Date: Mon, 26 May 2025 19:05:08 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?5p2O5ZOy?= <sensor1010@163.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, jonas@kwiboo.se,
	rmk+kernel@armlinux.org.uk, david.wu@rock-chips.com, wens@csie.org,
	jan.petrous@oss.nxp.com, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: dwmac-rk: No need to check the return value of the
 phy_power_on()
Message-ID: <e178677c-c8aa-462b-8d12-e0b4b8b6c7b7@lunn.ch>
References: <20250526161621.3549-1-sensor1010@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250526161621.3549-1-sensor1010@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_100536_203261_8BDFB055 
X-CRM114-Status: GOOD (  15.43  )
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

On Mon, May 26, 2025 at 09:16:21AM -0700, 李哲 wrote:
> since the return value of the phy_power_on() function is always 0,
> checking its return value is redundant.
> 
> Signed-off-by: 李哲 <sensor1010@163.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 700858ff6f7c..6e8b10fda24d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -1839,11 +1839,7 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
>  		dev_err(dev, "NO interface defined!\n");
>  	}
>  
> -	ret = phy_power_on(bsp_priv, true);
> -	if (ret) {
> -		gmac_clk_enable(bsp_priv, false);
> -		return ret;
> -	}
> +	phy_power_on(bsp_priv, true);

I suggest you go one step further and turn phy_power_on() into a void
function.

net-next is closed for the next two week due to the merge window.

	Andrew

