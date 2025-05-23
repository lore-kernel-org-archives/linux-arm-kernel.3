Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10197C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 16:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKSYcBDrAVeosFiXivZE6eLg3M7cJpM8m8qO+mm0CJw=; b=mXlwyMZTkA9TNH51kET614VExI
	qw5EFwz2WcFpncN2uSeKlgq3mhr3q5I7fzXBgSXYKWWBv/+yOVk/PC3DKe61eYmonbQZd8oz425YO
	J0Abz/ZfaxExx1xbIQGi56j194RrMincJ2hpDS4OjxrWk53Osw7hTH40P58h8oW0yxhsVrW62Osw3
	naEg+ppPOv0RV12AalEs/GZpG3aBmmN0KBgvdw5Zwpyk9TWEe4ODwYX9t9NJrDnPOs5OoqZ8FLUU7
	kNHZz8cgJJe4cqDZv0Px6vIW6J7YqwoRgPV1qr65FOLW2PhaqFgOSv2KhiF82AlczqGQebA6LulGf
	bDe4R6Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIVae-00000004S48-0WgF;
	Fri, 23 May 2025 16:49:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIV8Q-00000004NUP-2hw0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 16:20:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=FKSYcBDrAVeosFiXivZE6eLg3M7cJpM8m8qO+mm0CJw=; b=rR
	twtHAXcENvE9yW6v25dXUilX104IemQqVM7uHNhpLnfEdMBnz+GV0+AaooNJhCNj9WkBK/30N89v/
	zfdNuPB+qxeGf9ymvJWF5UGU9erpoRCQB+bxaE7CHJCeRq/EyzIArpOxfR7bdcI9JJtbTCTyQiqeW
	ekCkuM3pfbt1Liw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uIV81-00Dd47-36; Fri, 23 May 2025 18:20:13 +0200
Date: Fri, 23 May 2025 18:20:13 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?5p2O5ZOy?= <sensor1010@163.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, jonas@kwiboo.se,
	rmk+kernel@armlinux.org.uk, david.wu@rock-chips.com, wens@csie.org,
	u.kleine-koenig@baylibre.com, an.petrous@oss.nxp.com,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: dwmac-rk: MAC clock should be truned off
Message-ID: <d5325aba-507e-47b6-83fb-b9156c1f351e@lunn.ch>
References: <20250523151521.3503-1-sensor1010@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250523151521.3503-1-sensor1010@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_092038_680944_CE0477EB 
X-CRM114-Status: GOOD (  16.99  )
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

On Fri, May 23, 2025 at 08:15:21AM -0700, 李哲 wrote:
> if PHY power-on fails, clockassociated the MAC should
> be disabled during the MAC initialization process

The Subject: line has a typo.

> Signed-off-by: 李哲 <sensor1010@163.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 700858ff6f7c..036e45be5828 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -1648,7 +1648,7 @@ static int gmac_clk_enable(struct rk_priv_data *bsp_priv, bool enable)
>  static int phy_power_on(struct rk_priv_data *bsp_priv, bool enable)
>  {
>  	struct regulator *ldo = bsp_priv->regulator;
> -	int ret;
> +	int ret = 0;
>  	struct device *dev = &bsp_priv->pdev->dev;
>  
>  	if (enable) {
> @@ -1661,7 +1661,7 @@ static int phy_power_on(struct rk_priv_data *bsp_priv, bool enable)
>  			dev_err(dev, "fail to disable phy-supply\n");
>  	}
>  
> -	return 0;
> +	return ret;

This does not make much sense to me. How do you get here with ret not
being 0?

    Andrew

---
pw-bot: cr

