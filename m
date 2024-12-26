Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CC3E7718E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 14:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZWaMQHTniKNiKHMTp7F80RZe2wo6ZB4wndPYy3Gh4Fs=; b=2H96pOLQ+HQq1RTIvrRHjwb+81
	Y+YnUqoH8D+YswXm42yJLjV25KELaQpgkmhoH4WOu3JurmzufNHQrvMZ4wgxPIe9dPeSU+SCJvwYn
	RE48T6UUOEdg7fLYYSEOY+FB5LdjjrJmfD3UBNgEU+xLIe5G72XQXbtuyeFxQRwaz7rUkNE3aFA0J
	WPIAM5APUzHTaE+6PeEqDvLxEBQlMsPuo1m2l4F1VBb8dJKP87oGnKb8wxxwVFjQJrDOML59JEYn2
	iW4d89yTj3lbyx1y1Sxyez7/alO6pfH+TUU6D2allzFc4AY4/879INhwsfdB6X/y1wLCpCWex+j7T
	h5cqeb1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQoxk-0000000FuZa-1qoZ;
	Thu, 26 Dec 2024 14:35:44 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQowZ-0000000FuT8-0eQE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 14:34:33 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-38637614567so2879527f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Dec 2024 06:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735223669; x=1735828469; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWaMQHTniKNiKHMTp7F80RZe2wo6ZB4wndPYy3Gh4Fs=;
        b=A5yWcXiIzDPWEmdJxCvUg/2CT35pTWMEp98435dP3QCMnr6+UQ4DO0mhs6E4M2HtGR
         cFOTQUs4WoPVnHLAeINXDG0zc31uCA509IA5k2495FCUVJAuWsiLf4QuCqL7z++3z5Gj
         uSIaL0WV9iffMsC25rH2jOUhg1spPPoubZJImDkapXVnANlbsXZ2jKXwRCT3Eq7VS5T9
         9YSmE9YHY0Llzb1gTIwPMilq0ZzLIu2+uzU9pcOiR1t8uaTAPRQEriHwMCOeXmzdQOGE
         mB7Qbe/b1TuvnpxEYmlW2RfLEoQ2DM/oWPqZYuKm/+Le91+Zz0iQBVo5V+K65kf3zXtU
         1iCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735223669; x=1735828469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWaMQHTniKNiKHMTp7F80RZe2wo6ZB4wndPYy3Gh4Fs=;
        b=QpCgt4R3vcLX313Zu6Wi4FJvn3C1nDpFlJyGtSXWeQLsL6wEMZeLAlJnrNtj9ar+hq
         5oT4SCvmqengoceSAFa+QkimBioeFIlql/E1HdmpSYuoHUSusyTAJ7q0QNvF1/wNqelC
         NxmzWB3ZlO/mbdGQA1DldiKWThW7M2ZGtm8gv9LyQMt0cUj4b4L1u34kt1T7QS/60LBs
         DkEmW2twuZ3H1j/x7txJwH/J522L4bB3IEViv+2sQhr1vrRFEXqZ5GvzfYmVZWp9ak0n
         tlaBXwnSSMbGlILV7IZq8Y0Ktbu6aXW7TTQtyiZPn+5jk+S2WJAVx3B0CuMDdZ8UOzht
         HW+g==
X-Forwarded-Encrypted: i=1; AJvYcCX81GJxpEfUULOrfkw+R/tsNMtuss066HYhDAD2kkTT5lQxThPRLoaG7XqUsmwzcDl4gWae2F1cDE+DW19K+YZd@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw3X+WWVl63zOlwW8/Oy8LhZZnS5iSnh6QOUFU9GGvTG3LyAIi
	H9E64bGRA/Q99LCL7H2OZ4Xa5s0l2EB5e5xZyUWmQbBcDXfI6wUNX33BLH/0lCc=
X-Gm-Gg: ASbGncvMuZD0/ScJxUJMbHo4HZsQVXGDxEYinFNhtOAjsShH0IYxWr/dIIiBPTGaGZ1
	UYTkVR9FN5u/oaBm/I8ARhGlU/UW/CSJX21MeJiyTbVuDXl6JfamZXPIveQvDDuwC2ClJomjDiD
	b5BHnZzCiNhnm5OoPs5kxc4NU2PFEpoUnl3C9xGEKZsl+Zni+xKzGETeG0oEIkHhijIOlKXI+wv
	bHzaXII2RzwYE2Z3kmY+LOZ4vH6b4OeiWd/FtBEgOJcnZTHdnyH/kQ=
X-Google-Smtp-Source: AGHT+IEpquj9mqHQrFXHSl5hzcnxKsnrxJ39lD9GV2mzs7t3fW0dHSS7dyN+P7J8ye5qxYUx0CveZA==
X-Received: by 2002:a05:6000:1848:b0:386:459e:655d with SMTP id ffacd0b85a97d-38a221fa039mr22306469f8f.20.1735223668760;
        Thu, 26 Dec 2024 06:34:28 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8ac97fsm19364218f8f.92.2024.12.26.06.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 06:34:28 -0800 (PST)
Date: Thu, 26 Dec 2024 16:34:26 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
	sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, akshay.bhat@timesys.com,
	p.zabel@pengutronix.de, Ranjani.Vaidyanathan@nxp.com,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx6q: No need to repeatedly disable analog clk
 during kdump
Message-ID: <Z21pcg6ZGA7n0wXy@linaro.org>
References: <20241107112750.3590720-1-xiaolei.wang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107112750.3590720-1-xiaolei.wang@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_063431_261554_4D6CE600 
X-CRM114-Status: GOOD (  26.98  )
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

On 24-11-07 19:27:50, Xiaolei Wang wrote:
> During kdump, when the second kernel is started, the LDB parent
> has already been switched and will not be switched again, so
> there is no need to repeatedly disable PLL2_PFD2, PLL5, etc.
> Repeatedly disabling PLL2_PFD2 causes the system to hang
> 
> LDB Clock Switch Procedure & i.MX6 Asynchronous Clock
> Switching Guidelines[1]
> 
> [1]https://www.nxp.com/docs/en/engineering-bulletin/EB821.pdf
> 
> Fixes: 5d283b083800 ("clk: imx6: Fix procedure to switch the parent of LDB_DI_CLK")
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>

LGTM.

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-imx6q.c | 84 ++++++++++++++++++-------------------
>  1 file changed, 42 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
> index bf4c1d9c9928..edbdaeea68b3 100644
> --- a/drivers/clk/imx/clk-imx6q.c
> +++ b/drivers/clk/imx/clk-imx6q.c
> @@ -291,6 +291,42 @@ static void mmdc_ch1_reenable(void __iomem *ccm_base)
>  	writel_relaxed(reg, ccm_base + CCM_CCSR);
>  }
>  
> +#define CCM_ANALOG_PLL_VIDEO    0xa0
> +#define CCM_ANALOG_PFD_480      0xf0
> +#define CCM_ANALOG_PFD_528      0x100
> +
> +#define PLL_ENABLE              BIT(13)
> +
> +#define PFD0_CLKGATE            BIT(7)
> +#define PFD1_CLKGATE            BIT(15)
> +#define PFD2_CLKGATE            BIT(23)
> +#define PFD3_CLKGATE            BIT(31)
> +
> +static void disable_anatop_clocks(void __iomem *anatop_base)
> +{
> +	unsigned int reg;
> +
> +	/* Make sure PLL2 PFDs 0-2 are gated */
> +	reg = readl_relaxed(anatop_base + CCM_ANALOG_PFD_528);
> +	/* Cannot gate PFD2 if pll2_pfd2_396m is the parent of MMDC clock */
> +	if (clk_get_parent(hws[IMX6QDL_CLK_PERIPH_PRE]->clk) ==
> +	   hws[IMX6QDL_CLK_PLL2_PFD2_396M]->clk)
> +		reg |= PFD0_CLKGATE | PFD1_CLKGATE;
> +	else
> +		reg |= PFD0_CLKGATE | PFD1_CLKGATE | PFD2_CLKGATE;
> +	writel_relaxed(reg, anatop_base + CCM_ANALOG_PFD_528);
> +
> +	/* Make sure PLL3 PFDs 0-3 are gated */
> +	reg = readl_relaxed(anatop_base + CCM_ANALOG_PFD_480);
> +	reg |= PFD0_CLKGATE | PFD1_CLKGATE | PFD2_CLKGATE | PFD3_CLKGATE;
> +	writel_relaxed(reg, anatop_base + CCM_ANALOG_PFD_480);
> +
> +	/* Make sure PLL5 is disabled */
> +	reg = readl_relaxed(anatop_base + CCM_ANALOG_PLL_VIDEO);
> +	reg &= ~PLL_ENABLE;
> +	writel_relaxed(reg, anatop_base + CCM_ANALOG_PLL_VIDEO);
> +}
> +
>  /*
>   * We have to follow a strict procedure when changing the LDB clock source,
>   * otherwise we risk introducing a glitch that can lock up the LDB divider.
> @@ -320,7 +356,7 @@ static void mmdc_ch1_reenable(void __iomem *ccm_base)
>   * switches the parent to the bottom mux first and then manipulates the top
>   * mux to ensure that no glitch will enter the divider.
>   */
> -static void init_ldb_clks(struct device_node *np, void __iomem *ccm_base)
> +static void init_ldb_clks(struct device_node *np, void __iomem *ccm_base, void __iomem *anatop_base)
>  {
>  	unsigned int reg;
>  	unsigned int sel[2][4];
> @@ -368,6 +404,10 @@ static void init_ldb_clks(struct device_node *np, void __iomem *ccm_base)
>  	if (sel[0][0] == sel[0][3] && sel[1][0] == sel[1][3])
>  		return;
>  
> +	disable_anatop_clocks(anatop_base);
> +
> +	imx_mmdc_mask_handshake(ccm_base, 1);
> +
>  	mmdc_ch1_disable(ccm_base);
>  
>  	for (i = 1; i < 4; i++) {
> @@ -382,42 +422,6 @@ static void init_ldb_clks(struct device_node *np, void __iomem *ccm_base)
>  	mmdc_ch1_reenable(ccm_base);
>  }
>  
> -#define CCM_ANALOG_PLL_VIDEO	0xa0
> -#define CCM_ANALOG_PFD_480	0xf0
> -#define CCM_ANALOG_PFD_528	0x100
> -
> -#define PLL_ENABLE		BIT(13)
> -
> -#define PFD0_CLKGATE		BIT(7)
> -#define PFD1_CLKGATE		BIT(15)
> -#define PFD2_CLKGATE		BIT(23)
> -#define PFD3_CLKGATE		BIT(31)
> -
> -static void disable_anatop_clocks(void __iomem *anatop_base)
> -{
> -	unsigned int reg;
> -
> -	/* Make sure PLL2 PFDs 0-2 are gated */
> -	reg = readl_relaxed(anatop_base + CCM_ANALOG_PFD_528);
> -	/* Cannot gate PFD2 if pll2_pfd2_396m is the parent of MMDC clock */
> -	if (clk_get_parent(hws[IMX6QDL_CLK_PERIPH_PRE]->clk) ==
> -	    hws[IMX6QDL_CLK_PLL2_PFD2_396M]->clk)
> -		reg |= PFD0_CLKGATE | PFD1_CLKGATE;
> -	else
> -		reg |= PFD0_CLKGATE | PFD1_CLKGATE | PFD2_CLKGATE;
> -	writel_relaxed(reg, anatop_base + CCM_ANALOG_PFD_528);
> -
> -	/* Make sure PLL3 PFDs 0-3 are gated */
> -	reg = readl_relaxed(anatop_base + CCM_ANALOG_PFD_480);
> -	reg |= PFD0_CLKGATE | PFD1_CLKGATE | PFD2_CLKGATE | PFD3_CLKGATE;
> -	writel_relaxed(reg, anatop_base + CCM_ANALOG_PFD_480);
> -
> -	/* Make sure PLL5 is disabled */
> -	reg = readl_relaxed(anatop_base + CCM_ANALOG_PLL_VIDEO);
> -	reg &= ~PLL_ENABLE;
> -	writel_relaxed(reg, anatop_base + CCM_ANALOG_PLL_VIDEO);
> -}
> -
>  static struct clk_hw * __init imx6q_obtain_fixed_clk_hw(struct device_node *np,
>  							const char *name,
>  							unsigned long rate)
> @@ -641,10 +645,6 @@ static void __init imx6q_clocks_init(struct device_node *ccm_node)
>  	hws[IMX6QDL_CLK_IPU1_SEL]         = imx_clk_hw_mux("ipu1_sel",         base + 0x3c, 9,  2, ipu_sels,          ARRAY_SIZE(ipu_sels));
>  	hws[IMX6QDL_CLK_IPU2_SEL]         = imx_clk_hw_mux("ipu2_sel",         base + 0x3c, 14, 2, ipu_sels,          ARRAY_SIZE(ipu_sels));
>  
> -	disable_anatop_clocks(anatop_base);
> -
> -	imx_mmdc_mask_handshake(base, 1);
> -
>  	if (clk_on_imx6qp()) {
>  		hws[IMX6QDL_CLK_LDB_DI0_SEL]      = imx_clk_hw_mux_flags("ldb_di0_sel", base + 0x2c, 9,  3, ldb_di_sels,      ARRAY_SIZE(ldb_di_sels), CLK_SET_RATE_PARENT);
>  		hws[IMX6QDL_CLK_LDB_DI1_SEL]      = imx_clk_hw_mux_flags("ldb_di1_sel", base + 0x2c, 12, 3, ldb_di_sels,      ARRAY_SIZE(ldb_di_sels), CLK_SET_RATE_PARENT);
> @@ -654,7 +654,7 @@ static void __init imx6q_clocks_init(struct device_node *ccm_node)
>  		 * bug. Set the muxes to the requested values before registering the
>  		 * ldb_di_sel clocks.
>  		 */
> -		init_ldb_clks(np, base);
> +		init_ldb_clks(np, base, anatop_base);
>  
>  		hws[IMX6QDL_CLK_LDB_DI0_SEL]      = imx_clk_hw_mux_ldb("ldb_di0_sel", base + 0x2c, 9,  3, ldb_di_sels,      ARRAY_SIZE(ldb_di_sels));
>  		hws[IMX6QDL_CLK_LDB_DI1_SEL]      = imx_clk_hw_mux_ldb("ldb_di1_sel", base + 0x2c, 12, 3, ldb_di_sels,      ARRAY_SIZE(ldb_di_sels));
> -- 
> 2.25.1
> 

