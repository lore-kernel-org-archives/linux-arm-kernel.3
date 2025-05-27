Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05517C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 05:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XaSDramaQ4ealF19zsjhv/7XrCvZ3oUf+OpS7nGNI+E=; b=rEhDTOFRUOXuj4k7dnq87OaobM
	q8Hjuh9OIz5p6ypJsm4mhj3tvSlJWP4BXD8d2jqSBNazjFXxWDdj+zmd6zCWwImKIvpUE1hX8MaRz
	OgY5BtypayzGPprfrfwgP9o3l8dJJJBOiH/rIiKkj02T1JJov8fy9Bi3bf/wZ7tU217YVFoNuSssH
	MgpTZr9rDlxICoxliJTjgEA5vkLWD27jivYYBE3CWj2rcWtlVOKhHnFnifUaTekuXjwopJRL7PLuI
	/strsHObY7P7AafOov/VmSzBuOypE/dVNKoxsvF0oHJID44WnyYn+OpD6ggBasxZoE3dHueJzfRGI
	jjgLe8Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJn8r-00000009xRS-014A;
	Tue, 27 May 2025 05:46:25 +0000
Received: from smtp-19.smtpout.orange.fr ([80.12.242.19] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJn6g-00000009x4Y-0dRr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 05:44:12 +0000
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id Jn6TuvW38K8x9Jn6TuJ1uT; Tue, 27 May 2025 07:44:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1748324645;
	bh=XaSDramaQ4ealF19zsjhv/7XrCvZ3oUf+OpS7nGNI+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=RuqfKSZEr3CG4BWdedgN5eVB3GxhSwHwxSTbYH9h7RUR5j4mU7wXvS51e1Eh7spnr
	 VZEt6ixH2w73IfHBCz5gbF34YZwiMMuv7x1QVLLUUCUT+p7r4eF18zjdglLAoJjfde
	 DueN8tNY+/fcyYDpvtdPpXgf5+K7jCKExyhWjWb1DJe+Zn0X2ljOpOrEXOib0oNTwO
	 ssnhI8HZFd+1ocoiNCg7SDPLh4//RcuYV9+AUWMlULPgxE8SC60zHwDLXa0DJMeCDe
	 ZT6vkRllvZ0LUWkTBi4kM1dsd1X72xNeKq97GF7SJ1LGiThP56Rytoh3UjKmXv3Ycd
	 LAW+0luDsoOxQ==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 27 May 2025 07:44:05 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <be687d2d-4c16-46d6-8828-b0e4866d91de@wanadoo.fr>
Date: Tue, 27 May 2025 07:43:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: dwmac-rk: No need to check the return value of the
 phy_power_on()
To: =?UTF-8?B?5p2O5ZOy?= <sensor1010@163.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 jonas@kwiboo.se, rmk+kernel@armlinux.org.uk, david.wu@rock-chips.com,
 wens@csie.org, jan.petrous@oss.nxp.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250526161621.3549-1-sensor1010@163.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250526161621.3549-1-sensor1010@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_224410_596439_68AE0FD4 
X-CRM114-Status: GOOD (  13.08  )
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

Le 26/05/2025 à 18:16, 李哲 a écrit :
> since the return value of the phy_power_on() function is always 0,
> checking its return value is redundant.

Can you elaborate why?

Looking at  (1], I think that it is obvious that non-0 values can be 
returned.


CJ

[1]: 
https://elixir.bootlin.com/linux/v6.15/source/drivers/phy/phy-core.c#L305

> 
> Signed-off-by: 李哲 <sensor1010@163.com>
> ---
>   drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 700858ff6f7c..6e8b10fda24d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -1839,11 +1839,7 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
>   		dev_err(dev, "NO interface defined!\n");
>   	}
>   
> -	ret = phy_power_on(bsp_priv, true);
> -	if (ret) {
> -		gmac_clk_enable(bsp_priv, false);
> -		return ret;
> -	}
> +	phy_power_on(bsp_priv, true);
>   
>   	pm_runtime_get_sync(dev);
>   


