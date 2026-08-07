Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54767C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 12:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ndh3patXapvxmH70A7vomOofELe8vAENarCkjTBjRZo=; b=jMEGJ3/g/JQIpP+mqwtTQOzej2
	JEeVdtUqj2+u9dCRMPcX46pHKvHUr737s7zb70IEHazS54aGKzBlBlcqI0eyjl7fF722HPPC8yNS6
	czgPytMkGALDnkxUhbeSXfvKHeJQ+26DhhBbHgBW9hdjTwSluhuoLMCvEXfRUpe4ieB38CtGqrcwD
	Qlly9Evi7HQVgaEM2W8bWaWmIrwuKXPeola7po97/QvSH7wkvl2IecfadFcTYWe6qd8jKsenPp8oU
	6kUFA7MNm22GbmcCuxViF9BkYtKQ3knlpwt7+WiNBOdBYRMJXoIrPhjepB3joUZnxHZByDRkMLbpt
	a0J8GlZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsK88-000000082iM-02jz;
	Fri, 07 Aug 2026 12:56:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsK86-000000082hm-4A1o;
	Fri, 07 Aug 2026 12:56:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 86D6160A69;
	Fri,  7 Aug 2026 12:56:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 700F71F000E9;
	Fri,  7 Aug 2026 12:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786107413;
	bh=Ndh3patXapvxmH70A7vomOofELe8vAENarCkjTBjRZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VHnqQGr7u4E+F+9wBp7IDaAMbI19O7iCG2h7dE4LgTgS+rGhCGZWWgHy4jwJuGHny
	 M4/l39efEKJ2b/nrrmp1kNnJntryPRsWcKeFXE5q5UXDQ76zXwiWamo7eHKwacB1CC
	 5fldItEZzEpJmwQWbsfjWFWIrFXcvxUbsSDXTxHgxtbqIIxuaX4SJuSXVlW+GmOQOh
	 YSYlJTN7lLJh2QJb5mEXzA2tET6HsrQpYVdcJySz0eUZKx9aP+XqwkpfUFqlcYMJ5t
	 5n/iNrVbTPlqDLWO6s92DMnxHdOmvVNKhLbmkFBqZ8cwaWCEX2i0kBt6seTV8tvfYh
	 l1BHwTBH06dVA==
Date: Fri, 7 Aug 2026 14:56:45 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Algea Cao <algea.cao@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v5 03/10] phy: rockchip: samsung-hdptx: Guard against clk
 rate integer underflow
Message-ID: <u6bu2l7ujfzbm7va336twts7efs7gi4euykllamch47a642njw@2dk7fnsezrgf>
References: <20260723-hdptx-clk-fixes-v5-0-8e786067865f@collabora.com>
 <20260723-hdptx-clk-fixes-v5-3-8e786067865f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260723-hdptx-clk-fixes-v5-3-8e786067865f@collabora.com>
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

On Thu, Jul 23, 2026 at 10:41:46PM +0300, Cristian Ciocaltea wrote:
> The 'fout' subtraction in rk_hdptx_phy_clk_calc_rate_from_pll_cfg()
> could result in an integer underflow, if the hardware registers are
> misconfigured or contain uninitialized values, such that the computed
> sigma-delta modulator offset sdm exceeds the base frequency fout.
> 
> This might lead to an absurdly high clock rate being returned to the
> Common Clock Framework, with unpredictable effects on downstream clk
> consumers.
> 
> Provide the necessary sanitization to avoid trusting the hardware state.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260611235702.0E9691F000E9@smtp.kernel.org/
> Fixes: 3481fc04d969 ("phy: rockchip: samsung-hdptx: Compute clk rate from PLL config")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> index 44e99343f249..fcf04e9814cc 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> @@ -2280,10 +2280,16 @@ static u64 rk_hdptx_phy_clk_calc_rate_from_pll_cfg(struct rk_hdptx_phy *hdptx)
>  		sdm = div_u64(PLL_REF_CLK * ropll_hw.sdc_deno *
>  			      ropll_hw.pms_mdiv * ropll_hw.sdm_num, val);
>  
> -		if (ropll_hw.sdm_num_sign)
> +		if (ropll_hw.sdm_num_sign) {
> +			if (sdm > fout) {
> +				dev_dbg(hdptx->dev, "Invalid ROPLL hw state: sdm > fout\n");

Same comment as previous patch.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

