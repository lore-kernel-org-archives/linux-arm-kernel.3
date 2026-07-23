Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F9CC531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 11:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+UZ5aO1jJH6/Bdo7Zxa7na+WVnOeBPu1jv/v7v1eFhw=; b=1KiyfnEPQckNyxRidRovfABOOg
	Mxd7iEgMgt7rnL0m+Zl1Ay0gVNwrE3EX/c9ysR243DCyXPqyiKCNsn5HGUYc8jPk0Gd6S6e/VHSCJ
	ZcUM341NgL8ctXfRpcPaQhrYr+ytjivvrg8Bm34tFxqDvVpPaqK0xVw3mHNC3rJFWtTT281DBMzkM
	Ht5mCYBpQbSfWMWXLWrCipIbvkH8oIc2WUVpQTSKKpebCpU8MgCTrw9VWQFdaDXw9FBHRg7wNTS62
	4nyRnUMdGA42qIwGqlAc4uISZNhWynC5V6FFBXFXMemmxw0SacpikwB0WkKl23Vkx0yMuc6JUhRhK
	V71pqLAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmrwI-0000000EBpM-2kio;
	Thu, 23 Jul 2026 11:50:10 +0000
Received: from mail-m20521016452.xmail.ntesmail.com ([205.210.164.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmrwF-0000000EBn3-0blW;
	Thu, 23 Jul 2026 11:50:08 +0000
Received: from [172.16.12.77] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 475247b54;
	Thu, 23 Jul 2026 19:50:02 +0800 (GMT+08:00)
Message-ID: <3c35b6cc-2664-46fe-b3d9-d7a8edb0d4da@rock-chips.com>
Date: Thu, 23 Jul 2026 19:50:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] phy: rockchip: samsung-hdptx: Fix rate
 recalculation for 3.2GHz FRL
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20260612-hdptx-clk-fixes-v4-0-ce5e1d456cda@collabora.com>
 <20260612-hdptx-clk-fixes-v4-3-ce5e1d456cda@collabora.com>
Content-Language: en-US
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20260612-hdptx-clk-fixes-v4-3-ce5e1d456cda@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9f8ecfac7a09d8kunm031a521c55c8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQ09PGVYfTx9DQ01IQ0
	4aTB1WFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSEpKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ILO0ZOy6jaDMFagrc9EJexKlpfA6zSgcenDe7NVMxXO7quzqdap7HNR72aJVydfGrGDy1mlP6b7vGM4VX7VctsCnLwLJYXXEjZ4QX6ltKRMYgOIrWgjLSqS96iuZIqNdIo9L60ipYdOzDhqLODDMe2dE9h4Dtq7+S4SzDEOGTA8=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=+UZ5aO1jJH6/Bdo7Zxa7na+WVnOeBPu1jv/v7v1eFhw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_045007_470304_063E0892 
X-CRM114-Status: GOOD (  17.40  )
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
> rk_hdptx_phy_clk_calc_rate_from_pll_cfg() is currently unable to handle
> cascade mode for the 3.2GHz FRL operating mode, as it relies solely on
> LCPLL_LCVCO_MODE_EN_MASK to determinate the rate from the
> rk_hdptx_frl_lcpll_cfg array.  Since there is no entry for this
> particular rate, the function returns 0.
> 
> This is the only rate which requires LC_REF_CLK_SEL to be set in
> GRF_HDPTX_CON0, hence extend the FRL matching accordingly.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260611-hdptx-clk-fixes-v3-0-67b1b0c00e16@collabora.com?part=1
> Fixes: de5dba833118 ("phy: rockchip: samsung-hdptx: Add HDMI 2.1 FRL support")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

    Reviewed-by: Andy Yan <andy.yan@rock-chips.com>


> ---
>   drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 33 ++++++++++++++++-------
>   1 file changed, 24 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> index 8c044381b83a..b210c1a88b25 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> @@ -2206,16 +2206,31 @@ static u64 rk_hdptx_phy_clk_calc_rate_from_pll_cfg(struct rk_hdptx_phy *hdptx)
>   			return 0;
>   		lcpll_hw.sdc_n = (val & LCPLL_SDC_N_MASK) >> 1;
>   
> -		for (i = 0; i < ARRAY_SIZE(rk_hdptx_frl_lcpll_cfg); i++) {
> -			const struct lcpll_config *cfg = &rk_hdptx_frl_lcpll_cfg[i];
> +		ret = regmap_read(hdptx->grf, GRF_HDPTX_CON0, &val);
> +		if (ret)
> +			return 0;
>   
> -			if (cfg->pms_mdiv == lcpll_hw.pms_mdiv &&
> -			    cfg->pms_sdiv == lcpll_hw.pms_sdiv &&
> -			    cfg->sdm_num_sign == lcpll_hw.sdm_num_sign &&
> -			    cfg->sdm_num == lcpll_hw.sdm_num &&
> -			    cfg->sdm_deno == lcpll_hw.sdm_deno &&
> -			    cfg->sdc_n == lcpll_hw.sdc_n)
> -				return cfg->rate;
> +		if (val & LC_REF_CLK_SEL) {
> +			if (lcpll_hw.pms_mdiv == 0x6b &&
> +			    lcpll_hw.sdm_num_sign == 0x01 &&
> +			    lcpll_hw.sdm_num == 0x02 &&
> +			    lcpll_hw.sdm_deno == 0x09 &&
> +			    lcpll_hw.sdc_n == FIELD_GET(LCPLL_SDC_N_MASK, 0x02))
> +				return FRL_8G4L_RATE;
> +		} else {
> +			const struct lcpll_config *cfg;
> +
> +			for (i = 0; i < ARRAY_SIZE(rk_hdptx_frl_lcpll_cfg); i++) {
> +				cfg = &rk_hdptx_frl_lcpll_cfg[i];
> +
> +				if (cfg->pms_mdiv == lcpll_hw.pms_mdiv &&
> +				    cfg->pms_sdiv == lcpll_hw.pms_sdiv &&
> +				    cfg->sdm_num_sign == lcpll_hw.sdm_num_sign &&
> +				    cfg->sdm_num == lcpll_hw.sdm_num &&
> +				    cfg->sdm_deno == lcpll_hw.sdm_deno &&
> +				    cfg->sdc_n == lcpll_hw.sdc_n)
> +					return cfg->rate;
> +			}
>   		}
>   
>   		dev_dbg(hdptx->dev, "%s no FRL match found\n", __func__);
> 


