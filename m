Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F08BC531CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 11:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L1A7SLzIpbSpqM14bWF0t1CZA/db+dQzBITowvt1p1c=; b=jNuUCfVC6cM/XpONN5gZZlJNnY
	4OD4apB+BUm2aw4v9cU2s2pSPKiIy4I2+UZNxUfJ1/5UdyqZmCqSaR67/5TwDsLIcAtG/kBpYeFCP
	Bg6YlFAGzxKYDucMDRXv9Mrnpd3JVtYTtbMNtaOC88BkjvcOFV0gKl9p9vxIH1InuzYrQrs4b5hBX
	JAo1CIyPUML4jCoKnji6PmGYDQmhgIk5dQ5LySXjqueynOxDgd0FtoyTGSXYOVmwWLGSKZSWszELZ
	ovMKNeNGZF3+1TK0vDIL31PaxnzAVObUq/IrBMiwOHArhs6cZRVjh94K8rJ0zEwXgClM7fQR23XQZ
	qpLeWSHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmrw0-0000000EBjE-0YvK;
	Thu, 23 Jul 2026 11:49:52 +0000
Received: from mail-m2443.xmail.ntesmail.com ([45.195.24.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmrvu-0000000EBi2-3TZX;
	Thu, 23 Jul 2026 11:49:49 +0000
Received: from [172.16.12.77] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 475247b2e;
	Thu, 23 Jul 2026 19:49:32 +0800 (GMT+08:00)
Message-ID: <676d0baa-98c9-417d-91b0-0a9cc07d464c@rock-chips.com>
Date: Thu, 23 Jul 2026 19:49:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] phy: rockchip: samsung-hdptx: Prevent
 divide-by-zero when computing clk rate
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20260612-hdptx-clk-fixes-v4-0-ce5e1d456cda@collabora.com>
 <20260612-hdptx-clk-fixes-v4-2-ce5e1d456cda@collabora.com>
Content-Language: en-US
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20260612-hdptx-clk-fixes-v4-2-ce5e1d456cda@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9f8ecf362e09d8kunm45c8aff254ee
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQklCSlZCQ0wYGhlNQ0
	0aHU9WFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSEpKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=X7Xqdg4Z42g/5lfR4vXGT5Dsyta9ef9az6uvuMhqlSEQbK3gTo1+h3I4zkrT+oqH6A46NcXhx6IGPAMp0R3oum5vMv0bsX9+Jxsbg8Qx5quN6KWZoihEf98kRiqvNb3dxk4GeKR91yzYKLZa/4XQBp0U1Kx9KWDpGMfOhyOCMHE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=L1A7SLzIpbSpqM14bWF0t1CZA/db+dQzBITowvt1p1c=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_044948_188202_D8ADB225 
X-CRM114-Status: GOOD (  13.58  )
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
> Calculating 'sdm' fraction in rk_hdptx_phy_clk_calc_rate_from_pll_cfg()
> could trigger a divide-by-zero, as it uses div_u64() with a denominator
> read directly from hardware: the values ropll_hw.sdm_deno,
> ropll_hw.sdc_deno, ropll_hw.sdc_n, and ropll_hw.sdc_num are populated
> from PLL registers which, in theory, could be left by the bootloader
> uninitialized/misconfigured.
> 
> Provide the necessary sanitization to avoid trusting the hardware state.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260611-hdptx-clk-fixes-v3-0-67b1b0c00e16@collabora.com?part=1
> Fixes: 3481fc04d969 ("phy: rockchip: samsung-hdptx: Compute clk rate from PLL config")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

    Reviewed-by: Andy Yan <andy.yan@rock-chips.com>

> ---
>   drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> index 710603afff86..8c044381b83a 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> @@ -2270,10 +2270,15 @@ static u64 rk_hdptx_phy_clk_calc_rate_from_pll_cfg(struct rk_hdptx_phy *hdptx)
>   
>   	fout = PLL_REF_CLK * ropll_hw.pms_mdiv;
>   	if (ropll_hw.sdm_en) {
> +		val = 16U * ropll_hw.sdm_deno *
> +		      (ropll_hw.sdc_deno * ropll_hw.sdc_n - ropll_hw.sdc_num);
> +		if (!val) {
> +			dev_dbg(hdptx->dev, "%s invalid ROPLL hw state\n", __func__);
> +			return 0;
> +		}
> +
>   		sdm = div_u64(PLL_REF_CLK * ropll_hw.sdc_deno *
> -			      ropll_hw.pms_mdiv * ropll_hw.sdm_num,
> -			      16 * ropll_hw.sdm_deno *
> -			      (ropll_hw.sdc_deno * ropll_hw.sdc_n - ropll_hw.sdc_num));
> +			      ropll_hw.pms_mdiv * ropll_hw.sdm_num, val);
>   
>   		if (ropll_hw.sdm_num_sign)
>   			fout = fout - sdm;
> 


