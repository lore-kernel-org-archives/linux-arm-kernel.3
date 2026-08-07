Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD41FC5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 12:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o/V/eUIAYvFRAwHyTDwSmmDXMCaDWZ4d4aBd3yJ8PwY=; b=MkIeXcdYlG1pe+MFV4b4L8aSgn
	jZuy13GkMGLv9oHHZIuzaXf6BpK06v3b287RoBv4fgdX37fviSkFDLoV4iftLwffR7/j0MCx39L94
	35A/7sQLFDhzL4gGl84qrdXZjlBno9hdt+RxZUUgFD/w5CbpM++5ap8tGfaGckBjMZnns1XG+dMjh
	FVOj2CpmMkUpZ7hEB3w1sz59NAQc8Q1+JKOTKLxVV9pLas5xItt479nQo2U0j0vFHq1eLTtWwU8Mq
	aRlC88LZX4WrH4rzmqeOpefEfK+KyUSJeymI7EP6l+FVzPqQRAzD733GfW5xiiO396RqHNDf45M7/
	3G1eZG9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsK7f-000000082aF-2uvg;
	Fri, 07 Aug 2026 12:56:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsK7e-000000082a2-1uP2;
	Fri, 07 Aug 2026 12:56:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D5657439FA;
	Fri,  7 Aug 2026 12:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D4B1F00A3A;
	Fri,  7 Aug 2026 12:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786107385;
	bh=o/V/eUIAYvFRAwHyTDwSmmDXMCaDWZ4d4aBd3yJ8PwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MGTDKLfa4ZMnFnTSJpt1Df6H1O3MtZTpzMiQnrDqlwyWzm0GASnS16+Kku9zLlNVo
	 Aw1ZCwpzEVXw25IJibmhV8sM31m7H2Mde3r3CihGuF0Xdvnt7aJyou1oHgbg6bNEb9
	 LbVv5/hX2jZGHgedeZwyBpKgzI+nADYmBaRbiaqCXgIHubHIOQzWDWILb+BJrYKWHe
	 AdXUuNMVBeW+4JvzFaVPOK65Uf1MkXq8mgrYYRoMKQeE7tNG/E28clImc58mWiTHmu
	 z8tT280+Kba7RWDIpxyn0m6hgwAPhao0xPJkx/ON0rXIOU8DdYMl7pMnWhd/0JUhJW
	 B+Jm5RTb7/xmg==
Date: Fri, 7 Aug 2026 14:56:15 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Algea Cao <algea.cao@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
	Diederik de Haas <diederik@cknow-tech.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v5 02/10] phy: rockchip: samsung-hdptx: Prevent
 divide-by-zero when computing clk rate
Message-ID: <qe6i5bvrn32xmwncl4zq3f5w6twpwfwvq5alaacsceq3vxn3nt@mbeytagr77j3>
References: <20260723-hdptx-clk-fixes-v5-0-8e786067865f@collabora.com>
 <20260723-hdptx-clk-fixes-v5-2-8e786067865f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260723-hdptx-clk-fixes-v5-2-8e786067865f@collabora.com>
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

On Thu, Jul 23, 2026 at 10:41:45PM +0300, Cristian Ciocaltea wrote:
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
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Andy Yan <andy.yan@rock-chips.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> index 710603afff86..44e99343f249 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> @@ -2270,10 +2270,15 @@ static u64 rk_hdptx_phy_clk_calc_rate_from_pll_cfg(struct rk_hdptx_phy *hdptx)
>  
>  	fout = PLL_REF_CLK * ropll_hw.pms_mdiv;
>  	if (ropll_hw.sdm_en) {
> +		val = 16U * ropll_hw.sdm_deno *
> +		      (ropll_hw.sdc_deno * ropll_hw.sdc_n - ropll_hw.sdc_num);
> +		if (!val) {
> +			dev_dbg(hdptx->dev, "Invalid ROPLL hw state: deno == 0\n");

If the hardware state is invalid, why can't this be a hard failure?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

