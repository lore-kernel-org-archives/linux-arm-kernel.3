Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16162D12676
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 10:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqjjzu00wo0rLZzR44vy7Mc+li1wHJBT4o2yabL2Nbg=; b=KNnnWlYxHGBQkygjOjLfUYtmRL
	PLSUVgW+agwHWOIOLDJqraar7AMq3kQln4CMplxmNrvP+FLgO6AlAyWHY/k/6CZSXg0cfqmXdg3tj
	PBnCXU3PsJ0o4qpfyouE33GyMy9h3m+XaC6fgcSSjozG5z06pJWoTwByMs2T7dU1vbMkItsY0gHRx
	qGhyw/zzy5lJ3+z3X2515aB5zqd9ShbaGodbUaBF6LH1OXSbS9W+O1vYsnGKSqlRlukah3/T+li4e
	XKPrUa2MARFxslgGq3eVp2eUG5SFoKmz5U7DSO92Eau3dKwQzd07IT+LDaoAFFx82Nv7I5LCVVf/v
	7k1dFIew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8GRT-0000000Gcaz-3HVE;
	Tue, 05 Nov 2024 10:05:43 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8GMo-0000000Gbpp-0zR9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 10:00:55 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43159c9f617so41431165e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 02:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730800852; x=1731405652; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qqjjzu00wo0rLZzR44vy7Mc+li1wHJBT4o2yabL2Nbg=;
        b=q8PgytLPX3XL5xK5okErexGSsoBg0FiBSZbtOczXbSIgHFcITq9d/tc+xrgsHYVyGe
         FIM7rrEC7We+tJXQB325lXe2DfSED0Ej+jopvRLlYNDBwpfZTBi2ii0huJSliKcJrKk0
         2etep9ARc8sHryi/nL6RwVdpJTjDOgAC6S+HWFZvLYCFGX2MBlieD6O0jHzu2+o1+s/d
         JBuvH6t8ides0h8+yeFq1nd5Dc9/QE+2oEZpNP5g2mOSaURmmtd0lHVa58kG6mN1vZ5w
         s7mzqGVYgaefw1H5zD6Q4zf1BU6TDTnrMDBvymG72gMs/IlGXiKwhX3uRnvat2RyeGA1
         ZLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730800852; x=1731405652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqjjzu00wo0rLZzR44vy7Mc+li1wHJBT4o2yabL2Nbg=;
        b=wLAsfG0nGoTgjhUqrn5PNlk/u2dk5d2cyg0uIE9J04F0G/6icfP57zZUnG8Kpkye60
         xCiqxNMCWM07UuS4WBH5a4KvdhGse3M0bedYcWY1qvc9KHBxkybsI3p9lTQEa2A8l7Sr
         d9UKJjqDDhWRdr5GvP8XsyWxPcsmEXu9+3fEsu1id35JtPD37uisV6hlCWFOLgsT+wcC
         CDiBuMT4caLpl68Yj7gkzPLrsxjLLzYIhvi9hyV97GhWv6KcZg9xa1lyLCSssPJCK0Rf
         CTEbatI9V5vdwpoLQZV+fkbbM2FldWOqzzNGp5O9oTc6fHriXr5c7ugoDgvomSG5f7ip
         59Ow==
X-Forwarded-Encrypted: i=1; AJvYcCXPnSmWVVwus5M/DLpFqgZggFxVX50S6LfOfBTdPMdX+lqVj5A/c17NSKknxBhOqKHcjvxQDyrbVKMhoMuSw2re@lists.infradead.org
X-Gm-Message-State: AOJu0YwKNH64yYXFo1K1wRV+2Jp1AxM9P8ndb0AMsr785s9fcSU2Eyu3
	HAAb102AsEz4GrPO2ZEQVBO7IdTgyWypdFCnr0geff85c0JMx+TIbSqgzCJcofo=
X-Google-Smtp-Source: AGHT+IFm4Qb4M3oCZgWdKRIgQrNjub2F52DYcxA3WJCF5Ri03R0Wl6j6IdT3Hz00MkG2UHWSG6u6kw==
X-Received: by 2002:a05:600c:458f:b0:431:3bf9:3ebb with SMTP id 5b1f17b1804b1-4319ad047a7mr311045735e9.24.1730800852400;
        Tue, 05 Nov 2024 02:00:52 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5bf4e7sm181024905e9.15.2024.11.05.02.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 02:00:51 -0800 (PST)
Date: Tue, 5 Nov 2024 12:00:50 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Aisheng Dong <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>
Subject: Re: [PATCH v3 3/5] clk: imx: fracn-gppll: fix pll power up
Message-ID: <Zyns0qfYpO3mZ4fa@linaro.org>
References: <20241027-imx-clk-v1-v3-0-89152574d1d7@nxp.com>
 <20241027-imx-clk-v1-v3-3-89152574d1d7@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241027-imx-clk-v1-v3-3-89152574d1d7@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_020054_307876_42100C93 
X-CRM114-Status: GOOD (  28.31  )
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

On 24-10-27 20:00:09, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> To i.MX93 which features dual Cortex-A55 cores and DSU, when using
> writel_relaxed to write value to PLL registers, the value might be
> buffered. To make sure the value has been written into the hardware,
> using readl to read back the register could achieve the goal.
> 
> current PLL power up flow can be simplified as below:
>   1. writel_relaxed to set the PLL POWERUP bit;
>   2. readl_poll_timeout to check the PLL lock bit:
>      a). timeout = ktime_add_us(ktime_get(), timeout_us);
>      b). readl the pll the lock reg;
>      c). check if the pll lock bit ready
>      d). check if timeout
> 
> But in some corner cases, both the write in step 1 and read in
> step 2 will be blocked by other bus transaction in the SoC for a
> long time, saying the value into real hardware is just before step b).
> That means the timeout counting has begins for quite sometime since
> step a), but value still not written into real hardware until bus
> released just at a point before step b).
> 
> Then there maybe chances that the pll lock bit is not ready
> when readl done but the timeout happens. readl_poll_timeout will
> err return due to timeout. To avoid such unexpected failure,
> read back the reg to make sure the write has been done in HW
> reg.
> 
> So use readl after writel_relaxed to fix the issue.
> 
> Since we are here, to avoid udelay to run before writel_relaxed, use
> readl before udelay.
> 
> Fixes: 1b26cb8a77a4 ("clk: imx: support fracn gppll")
> Co-developed-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-fracn-gppll.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
> index 4749c3e0b7051cf53876664808aa28742f6861f7..85771afd4698ae6a0d8a7e82193301e187049255 100644
> --- a/drivers/clk/imx/clk-fracn-gppll.c
> +++ b/drivers/clk/imx/clk-fracn-gppll.c
> @@ -254,9 +254,11 @@ static int clk_fracn_gppll_set_rate(struct clk_hw *hw, unsigned long drate,
>  	pll_div = FIELD_PREP(PLL_RDIV_MASK, rate->rdiv) | rate->odiv |
>  		FIELD_PREP(PLL_MFI_MASK, rate->mfi);
>  	writel_relaxed(pll_div, pll->base + PLL_DIV);
> +	readl(pll->base + PLL_DIV);
>  	if (pll->flags & CLK_FRACN_GPPLL_FRACN) {
>  		writel_relaxed(rate->mfd, pll->base + PLL_DENOMINATOR);
>  		writel_relaxed(FIELD_PREP(PLL_MFN_MASK, rate->mfn), pll->base + PLL_NUMERATOR);
> +		readl(pll->base + PLL_NUMERATOR);
>  	}
>  
>  	/* Wait for 5us according to fracn mode pll doc */
> @@ -265,6 +267,7 @@ static int clk_fracn_gppll_set_rate(struct clk_hw *hw, unsigned long drate,
>  	/* Enable Powerup */
>  	tmp |= POWERUP_MASK;
>  	writel_relaxed(tmp, pll->base + PLL_CTRL);
> +	readl(pll->base + PLL_CTRL);
>  
>  	/* Wait Lock */
>  	ret = clk_fracn_gppll_wait_lock(pll);
> @@ -302,6 +305,7 @@ static int clk_fracn_gppll_prepare(struct clk_hw *hw)
>  
>  	val |= POWERUP_MASK;
>  	writel_relaxed(val, pll->base + PLL_CTRL);
> +	readl(pll->base + PLL_CTRL);
>  
>  	ret = clk_fracn_gppll_wait_lock(pll);
>  	if (ret)
> 
> -- 
> 2.37.1
> 

