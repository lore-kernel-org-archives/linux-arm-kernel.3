Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302E5E77179
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 11:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h1WOJoopUUjYFvEiSgwmKmye4bXIQmhF6TbazsPI2KI=; b=mUxzyWYzqMmuTSYVZOx5ds96AS
	Z4xgbG1VRFnAJmkXRcNmghzhTcc59Z7ATdG5k+Ph7f67RPEMnqQ9G0TBD/1F0fWU5Ko4/Yz1xP8ep
	ABhPqI5/4VL4IoIcJJ4sR+MLf0dx5mLHhFfC+Oz30Iy/6jOUOTJrlwoNr86ZbZvQc/e6ZFEvGq2ks
	H9pi1doUpikytSv/KaezqAb/lJ/o28BTuyd1AeT+/KQekxrwNvcmWENn609MCBcliWblbTT+JZNta
	8ZmshA1AQrpY6cYPVAvUF5Hs1LFw0W+Txc1G1TUMgRt/GJ1cGhKc/y6dqOG1EEyW3S5AvURFZ8uZ+
	ByLxKC/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJWUn-00000001SFz-32Ha;
	Fri, 06 Dec 2024 11:27:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJWTm-00000001S4b-1IOc;
	Fri, 06 Dec 2024 11:26:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733484396;
	bh=92LOd4MVW8Q5TbMDOf61nL89xm4rnQFTUKQsD73JLss=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FNf7w7i0c3cowGaiFG8pUSh1g1UNSADZB4AaL/dDcWwsOrivA21zTi/NBBqTuXE8f
	 MvT0q5EJ7owzF/J4OzM36JE9qEZUegyzP+s4diMmg0PR+qgrO+Z/W4FDy8998ZVUJ6
	 APbPjeFis4XgoJtt+J+KZCLs+X00bvtOD1hLcApU5pGWNv834fCj6aG8t+GV0CQ2Ui
	 iJuGN+hLeitnRl7Ccfr4GGnziJlzwqdex129nUVsKcmKI6DYUVIyIxZAnfDANJm9QC
	 p6dnvJzX1U1xtiIiBB0zmC3+WEH3FTW48CwAGih+WiO974m2sgsDUxyl/NSgmdoTs2
	 0i/xIgiWn1VKQ==
Received: from [192.168.1.90] (unknown [188.27.48.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 57DB417E3614;
	Fri,  6 Dec 2024 12:26:36 +0100 (CET)
Message-ID: <87273a36-07f9-4224-bfff-63e905be9b0a@collabora.com>
Date: Fri, 6 Dec 2024 13:26:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: phy-rockchip-samsung-hdptx: Don't use dt aliases
 to determine phy-id
To: Heiko Stuebner <heiko@sntech.de>, vkoul@kernel.org, kishon@kernel.org
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 quentin.schulz@cherry.de, Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20241206103401.1780416-1-heiko@sntech.de>
 <20241206103401.1780416-3-heiko@sntech.de>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20241206103401.1780416-3-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_032638_496902_BDD90075 
X-CRM114-Status: GOOD (  19.64  )
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

On 12/6/24 12:34 PM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> The phy needs to know its identity in the system (phy0 or phy1 on rk3588)
> for some actions and the driver currently contains code abusing of_alias
> for that.
> 
> Devicetree aliases are always optional and should not be used for core
> device functionality, so instead keep a list of phys on a soc in the
> of_device_data and find the phy-id by comparing against the mapped
> register-base.
> 
> Fixes: c4b09c562086 ("phy: phy-rockchip-samsung-hdptx: Add clock provider support")
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>  .../phy/rockchip/phy-rockchip-samsung-hdptx.c | 50 ++++++++++++++++---
>  1 file changed, 44 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> index c5c64c209e96..b137f8c4d157 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> @@ -385,11 +385,22 @@ enum rk_hdptx_reset {
>  	RST_MAX
>  };

[...]

> +
> +	/* find the phy-id from the io address */
> +	hdptx->phy_id = -ENODEV;
> +	for (id = 0; id < hdptx->cfgs->num_phys; id++) {
> +		if (res->start == hdptx->cfgs->phy_ids[id]) {
> +			hdptx->phy_id = id;
> +			break;
> +		}
> +	}
> +
> +	if (hdptx->phy_id < 0)
> +		return dev_err_probe(dev, -ENODEV, "no matching device found\n");

Maybe we could simply fallback to assume phy1 doesn't exist in this
case, which avoids the need to provide a match data with a single entry.

Regardless,

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

