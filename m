Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C20AC531CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 11:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UkPHHTBxsGnnTx5a9K0kYDoyQ/YqHcEwy0WwqNhrCm8=; b=nWWEzvW8noE/UfG4jc4vBHe8mN
	Tw/DXAewKOTBAAkbG3Qm7b9aUf4DkXEQpyO2gj0kbCMKagqU8sTjN2CCWMDUigjgs4FrqOvgDJzWC
	G6kVxqNnW8i2pw/G1tcN+vuvthKuOzI3lE3xRLxuEDl6yTIwMJpftprMz2eurBUA/HTKBVtdus5Dv
	rddmlAIqX8s9bq2+V3CSo591zO05L5dkOWgE1tsKFX3t+smMIkxW5PWpJJxv9ejxBHjd3JKM5W1Se
	cJWtmmUanEEiwf78tRC3+LRE9DYJ4i6mHuxBolL1/S9iT4JpeogEGscAPXRDISrLH4xFnyGzYZDZm
	bHB0AaBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmrxG-0000000EC89-0xWQ;
	Thu, 23 Jul 2026 11:51:10 +0000
Received: from mail-m20521016446.xmail.ntesmail.com ([205.210.164.46])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmrxC-0000000EC5v-33ql;
	Thu, 23 Jul 2026 11:51:09 +0000
Received: from [172.16.12.77] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 475247b98;
	Thu, 23 Jul 2026 19:51:02 +0800 (GMT+08:00)
Message-ID: <40179247-12ac-4768-abd9-37f34e2c8b2b@rock-chips.com>
Date: Thu, 23 Jul 2026 19:51:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] phy: rockchip: samsung-hdptx: Drop TMDS rate setup
 workaround
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Thomas_Niederpr=C3=BCm?=
 <dubito@online.de>, Simon Wright <simon@symple.nz>
References: <20260612-hdptx-clk-fixes-v4-0-ce5e1d456cda@collabora.com>
 <20260612-hdptx-clk-fixes-v4-5-ce5e1d456cda@collabora.com>
Content-Language: en-US
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20260612-hdptx-clk-fixes-v4-5-ce5e1d456cda@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9f8ed094f109d8kunmaf162676577b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQh9LSlYeHh1KGRhOQh
	hCTx9WFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=gi1JZPhr0YIKkpak6dfQ7dOY46qt66IVvlBBF2aklLgugRTUdG/tsUsFB4AJz/vN3EuXen5HbdXeemJtVNUtn1J69C0InLhPj6VLmQhzR2Nr+poutG0j95JFUWt7FGohuDlA0sFPvuRxzHni6gujjTid0DoG3C2poHDy4HhZuJc=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=UkPHHTBxsGnnTx5a9K0kYDoyQ/YqHcEwy0WwqNhrCm8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_045107_834961_3C2EEF26 
X-CRM114-Status: GOOD (  16.84  )
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

Hello,

On 6/12/26 07:45, Cristian Ciocaltea wrote:
> Since commit ba9c2fe18c17 ("drm/rockchip: dw_hdmi_qp: Switch to
> phy_configure()") the TMDS rate setup doesn't rely anymore on the
> unconventional usage of the bus width, instead it is managed exclusively
> through the HDMI PHY configuration API.
> 
> Drop the now obsolete workaround to retrieve the TMDS character rate via
> phy_get_bus_width() during power_on().
> 
> While at it, get rid of the extra call to rk_hdptx_phy_consumer_put() by
> moving the statement at the end of the function.
> 
> Tested-by: Thomas Niederprüm <dubito@online.de>
> Tested-by: Simon Wright <simon@symple.nz>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

    Reviewed-by: Andy Yan <andy.yan@rock-chips.com>


> ---
>   drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 27 +++++------------------
>   1 file changed, 6 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> index 25bd821cd039..35997087d61c 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> @@ -1660,22 +1660,6 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
>   	enum phy_mode mode = phy_get_mode(phy);
>   	int ret, lane;
>   
> -	if (mode != PHY_MODE_DP) {
> -		if (!hdptx->hdmi_cfg.rate && hdptx->hdmi_cfg.mode != PHY_HDMI_MODE_FRL) {
> -			/*
> -			 * FIXME: Temporary workaround to setup TMDS char rate
> -			 * from the RK DW HDMI QP bridge driver.
> -			 * Will be removed as soon the switch to the HDMI PHY
> -			 * configuration API has been completed on both ends.
> -			 */
> -			hdptx->hdmi_cfg.rate = phy_get_bus_width(hdptx->phy) & 0xfffffff;
> -			hdptx->hdmi_cfg.rate *= 100;
> -		}
> -
> -		dev_dbg(hdptx->dev, "%s rate=%llu bpc=%u\n", __func__,
> -			hdptx->hdmi_cfg.rate, hdptx->hdmi_cfg.bpc);
> -	}
> -
>   	ret = rk_hdptx_phy_consumer_get(hdptx);
>   	if (ret)
>   		return ret;
> @@ -1701,9 +1685,10 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
>   		rk_hdptx_dp_pll_init(hdptx);
>   
>   		ret = rk_hdptx_dp_aux_init(hdptx);
> -		if (ret)
> -			rk_hdptx_phy_consumer_put(hdptx, true);
>   	} else {
> +		dev_dbg(hdptx->dev, "%s rate=%llu bpc=%u\n", __func__,
> +			hdptx->hdmi_cfg.rate, hdptx->hdmi_cfg.bpc);
> +
>   		if (hdptx->pll_config_dirty)
>   			ret = rk_hdptx_pll_cmn_config(hdptx);
>   
> @@ -1716,11 +1701,11 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
>   			else
>   				ret = rk_hdptx_tmds_ropll_mode_config(hdptx);
>   		}
> -
> -		if (ret)
> -			rk_hdptx_phy_consumer_put(hdptx, true);
>   	}
>   
> +	if (ret)
> +		rk_hdptx_phy_consumer_put(hdptx, true);
> +
>   	return ret;
>   }
>   
> 


