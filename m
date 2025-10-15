Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893F9CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 06:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q8XaJ9YCp4W+b7drspa/wsyUFTPtmL0PalpV0e9ymoU=; b=e69p970rOscDOX0sst3BPHj7HX
	S+J9qe4p2ANFpXJhxuptwHtPgGqbMsiVs3Z4hoiDol6B0MWiPtpMdipm7RVFBfJ6mnALSCHhOfULM
	CQ2r2aSGewMTHlIMlKMPGsDQTOFwLocXUE5H/LXcwTunSJuDuxH7qaokzlmsZ6sXt6aRD5iIm8F/M
	66esBkWSc52mlkOicqIeFGSx1/PoDZPGCYcpeX0jByzJDf75zAIQ6UPbUNF21YSY0dP1qvX03W6vV
	PMDCWlPa0o2vyFfAo3QXcLvv1wPsdp8KBWVicVzbFH7Wg8oDFG6+qTN70fFoMjo6IEuBLPYIoYJ2k
	9FUa0h1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8upc-00000000Yzm-2m8D;
	Wed, 15 Oct 2025 06:17:52 +0000
Received: from mail-m49196.qiye.163.com ([45.254.49.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8upZ-00000000Yx7-3AjO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 06:17:51 +0000
Received: from [172.16.12.149] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 25f6e32a2;
	Wed, 15 Oct 2025 14:17:39 +0800 (GMT+08:00)
Message-ID: <4c9ec1ab-8833-4e07-a39c-ba502117866f@rock-chips.com>
Date: Wed, 15 Oct 2025 14:17:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: dwmac-rk: No need to check the return value
 of the phy_power_on()
To: Lizhe <sensor1010@163.com>, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, jonas@kwiboo.se, david.wu@rock-chips.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251015040847.6421-1-sensor1010@163.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20251015040847.6421-1-sensor1010@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a99e684616903abkunm8d7d969e2bd29d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkkaQlYdGk1LHkkaQ0IZQx1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=X+6mwWPDH1PC0JAJsCEXtIDwEPnM6bx7ESrZL/FdgaTzkrXtRUD2nl2I9dKoOxJwyNrorco6P6jLawdEl7PWM7IgvOxAJ6SOVRfxslkY9V3GXAquDUmE5j76Qe1utfOMfRd5ku8G7P6h7+B0MRHl3lqjPuOb0KhZvyVlCVUJlFs=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=q8XaJ9YCp4W+b7drspa/wsyUFTPtmL0PalpV0e9ymoU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_231750_274951_3FBF69E8 
X-CRM114-Status: GOOD (  19.30  )
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

On 10/15/2025 12:08 PM, Lizhe wrote:

> 'phy_power_on' is a local scope one within the driver, since the return
> value of the phy_power_on() function is always 0, checking its return
> value is redundant.
>
> the function name 'phy_power_on()' conflicts with the existing
> phy_power_on() function in the PHY subsystem. a suitable alternative
> name would be rk_phy_power_set(), particularly since when the second
> argument is false, this function actually powers off the PHY
>
> Signed-off-by: Lizhe <sensor1010@163.com>
> ---
>   drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 17 ++++-------------
>   1 file changed, 4 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 51ea0caf16c1..9d296bfab013 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -1461,23 +1461,18 @@ static int gmac_clk_enable(struct rk_priv_data *bsp_priv, bool enable)
>   	return 0;
>   }
>   
> -static int phy_power_on(struct rk_priv_data *bsp_priv, bool enable)
> +static void rk_phy_power_on(struct rk_priv_data *bsp_priv, bool enable)
>   {
>   	struct regulator *ldo = bsp_priv->regulator;
>   	struct device *dev = bsp_priv->dev;
> -	int ret;
>   
>   	if (enable) {
> -		ret = regulator_enable(ldo);
> -		if (ret)
> +		if (regulator_enable(ldo))
>   			dev_err(dev, "fail to enable phy-supply\n");
>   	} else {
> -		ret = regulator_disable(ldo);
> -		if (ret)
> +		if (regulator_disable(ldo))
>   			dev_err(dev, "fail to disable phy-supply\n");
>   	}
> -
> -	return 0;
>   }
>   
>   static struct rk_priv_data *rk_gmac_setup(struct platform_device *pdev,
> @@ -1655,11 +1650,7 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp_priv)
>   		dev_err(dev, "NO interface defined!\n");
>   	}
>   
> -	ret = phy_power_on(bsp_priv, true);
> -	if (ret) {
> -		gmac_clk_enable(bsp_priv, false);

Is gmac_clk_enable() also redundant?


> -		return ret;
> -	}
> +	rk_phy_power_on(bsp_priv, true);
>   
>   	pm_runtime_get_sync(dev);
>   

-- 
Best,
Chaoyi


