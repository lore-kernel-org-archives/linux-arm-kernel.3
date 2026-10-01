Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9AECA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 09:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQz75FsX45fFNLdrpdOp/Fyp4l/FKa+g0Qu8HGi4Fv4=; b=qJHkVaa3XUWaz564gVRcilCTwk
	yDJZD7eRB0bcQ2FpFawyuNzYDSgK2miCIK07kDQz6rbWiSNR4qdPCVzYOfVdX+yTtw66Et5mlUAkZ
	uQjlq7yoiDbPTaWYdwrfPuxXkuWwPcdcr0Y2S+QXZ9xzJh58f/lWIzAyO89K0hiXRxA74Yprk7cRp
	tgMPkKYpFkOcGCa/pT+UdZNOyIpcPc9hhBQYVyQHSa2RpApB+dBDTkZg8g6DvqWxBIljbIrM0KwHy
	ESOqD7czLy7iLkaJPdRaOtSVp6yLcAmbIkCv9A41Sd5xe4NIxa/c7DGxyN0dQNmo10lEfU6eJdaE9
	Dqx19CuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCDDT-00000008OH6-2aP7;
	Thu, 01 Oct 2026 09:36:39 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCDDR-00000008OFv-2cuV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 09:36:39 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so37239775e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 02:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790847395; x=1791452195; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQz75FsX45fFNLdrpdOp/Fyp4l/FKa+g0Qu8HGi4Fv4=;
        b=g+/am/MoM4fsxtp/HHjquQ1Gvlm9hp5U3BgoZMp3r/eFVTMK9hQlLeYxuxyvW6hGcu
         7PqE2/nD4GkE7E+3VWja+byo44k6mwzDyG25P6pfUDzH5Q4uc+KfjzyPAMV6tq2IWQwx
         +HUgf3bjnmErP94JYn1RD3anCNTzVV1XO0h4USl35rpIYHHGDzNe3iWKxeZe+PMDaA2e
         dU9eCTRpKLxoneQQ5YwgGmDKp/K4/aSNWyZM+pb2Um0zKNUaFNuk/w2BSyPPxroEd0Cb
         gy9SiCbSqhdv1/A7HgyXHxD0CfcvcZQ+oSu904LVIpz+XdVQoh1xXMDEgRoA7iGBz5al
         crbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847395; x=1791452195;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DQz75FsX45fFNLdrpdOp/Fyp4l/FKa+g0Qu8HGi4Fv4=;
        b=uT5bjUElB+jZTEYCB1bKBNrOfuUuSbzKNQzo7/iJ0ENuZh6WMghtnn6idKU144/r/S
         eMKMFUXGcSKcqvRZfc+2a+Uf02hT4mCoqUOjTleqURsR4qBEuMbCGP8PW7JCx/mfjHYq
         c0zHSou+C9lT8+grSioPZc7vkNbUJ5C6irUbvxkLV7OPt73okXMDTNHUPNrYe8vM2cxh
         0LUzDuEmOwmt1QNM+YmppeS5PzC9hjnDWhbc5eRvtVd3j4WFyA8YACRYnF20p/806kmE
         mSdW+kDan6u1thsCdvSxf/nYuwDB6uTPEfkYtqgenhu/+Bh7FrrTIuNSoWilCweEFN89
         Vwlg==
X-Forwarded-Encrypted: i=1; AKwUvBxcvrTIPoU5GNIA7WfL24opGj++rusj12F6LYiUGwsGj4qRk8xSZ4iA74FY0pj6yoACRhjtZ/VlinFeZ0713gbJ@lists.infradead.org
X-Gm-Message-State: AFuF++mDki6hoJYhO07huLhJUUnHWwGdc9gQ9AzpmCWcQme6j50fnXWK
	jAIsP4U+fsvmJVb152jabT7XKlr+wlKvKaIwlEQs77O+hNZkwXRd7GWhdvNNoHB50eh0Y2c8FOm
	ihTRZ
X-Gm-Gg: AYBFou1ryN5Vv3pZcHd46l1x+JK8YXv0H5UfmYRi8sb31QyRWmr9uYDjvyPR5IlkRJK
	zlGhVaoOMaPNPJQck4HuT0PW1sCUTzrJ23n2dCLzqKfzc2+6qVkLc0WAow3+G7KkKLWeOhM+XDl
	xyQXu+ZtIaGKTOHWgYrulfMyG3cdk9VDP4v9SPfct2wxwE9vnmXAODJYLTA5J7LgAFn6noKrqNp
	ncYsL/nmMksEEwxoKJJgClhs/5PLclvWZgn2btuM1UBozioSkKftk0cfkvLC175+oIGe5rPyoqj
	SHdcAb7p6ZTKfA/6OmFnyc/HWT3SfslQpigum8dd8Fd7ifN/pJWFA9xARO73uVDGnTrHzokZ9la
	5rQWD2SFEsUHWFIoQRVmxbdOvQOyJutPiqtJkN2RmU2sLfm7Rio+rxWcRUYI93LliZ/YKqVoMnP
	mTt8XijGw88X7iiQg0mNiuj9OnFFVuLtsBTDC83b7GxU2REBYtwQi+kCOJxQsNe173h9lfbyJl2
	DVxzPYy2yoAUQyc0BqADJrxMSvp
X-Received: by 2002:a05:600c:3144:b0:4a0:1c0e:b2a8 with SMTP id 5b1f17b1804b1-4a01c0ecb6fmr59256415e9.28.1790847395168;
        Thu, 01 Oct 2026 02:36:35 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a020f7f220sm57243775e9.5.2026.10.01.02.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:36:34 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Steam Lin
 <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof
 Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, Miquel Raynal
 <miquel.raynal@bootlin.com>, stable@vger.kernel.org
Subject: Re: [PATCH v6 08/12] clk: nuvoton: ma35d1: Retrieve HXT/LXT from DT
In-Reply-To: <20260930-perso-ma35d1-upstream-clk-v6-8-48937ee6c9bb@bootlin.com>
References: <20260930-perso-ma35d1-upstream-clk-v6-0-48937ee6c9bb@bootlin.com>
 <20260930-perso-ma35d1-upstream-clk-v6-8-48937ee6c9bb@bootlin.com>
Date: Thu, 01 Oct 2026 11:36:33 +0200
Message-ID: <1j7bk13gpq.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_023637_693550_E4506AA2 
X-CRM114-Status: GOOD (  27.26  )
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

On mer. 30 sept. 2026 at 19:24, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> HXT and LXT are crystal oscillator inputs of the clock controller, they
> are described in the DT, so retrieve them, in order, and store them in
> their respective HXT/LXT hw table entries.
>
> Since old DTs reference the HXT fixed-clock without naming it and do not
> describe LXT at all, we assume that HXT must be present, and fallback to
> creating a fixed clock for LXT if it is not described (for backward
> compatibility purposes).
>
> The downstream gate clocks can directly use the hw clocks as parents,
> instead of relying on string matching.
>
> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/clk/nuvoton/clk-ma35d1.c | 43 ++++++++++++++++++++++++++++++++--------
>  1 file changed, 35 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
> index ceebcbd8c18b..d955d79abdd2 100644
> --- a/drivers/clk/nuvoton/clk-ma35d1.c
> +++ b/drivers/clk/nuvoton/clk-ma35d1.c
> @@ -4,6 +4,7 @@
>   * Author: Chi-Fang Li <cfli0@nuvoton.com>
>   */
>  
> +#include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
> @@ -191,6 +192,15 @@ static struct clk_hw *ma35d1_clk_gate(struct device *dev, const char *name, cons
>  				    reg, shift, 0, &ma35d1_lock);
>  }
>  
> +static struct clk_hw *ma35d1_clk_gate_parent(struct device *dev, const char *name,
> +					     struct clk_hw *parent,
> +					     void __iomem *reg, u8 shift)
> +{
> +	return devm_clk_hw_register_gate_parent_hw(dev, name, parent,
> +						   CLK_SET_RATE_PARENT,
> +						   reg, shift, 0, &ma35d1_lock);
> +}
> +
>  static int ma35d1_get_pll_setting(struct device_node *clk_node, u32 *pllmode)
>  {
>  	const char *of_str;
> @@ -215,10 +225,12 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *clk_node = pdev->dev.of_node;
> +	struct clk_bulk_data *clks;
>  	void __iomem *clk_base;
>  	static struct clk_hw **hws;
>  	static struct clk_hw_onecell_data *ma35d1_hw_data;
>  	u32 pllmode[PLL_MAX_NUM];
> +	int num_clks;
>  	int ret;
>  
>  	ma35d1_hw_data = devm_kzalloc(dev,
> @@ -240,12 +252,27 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> -	hws[HXT] = ma35d1_clk_fixed("hxt", 24000000);
> -	hws[HXT_GATE] = ma35d1_clk_gate(dev, "hxt_gate", "hxt",
> -					clk_base + REG_CLK_PWRCTL, 0);
> -	hws[LXT] = ma35d1_clk_fixed("lxt", 32768);
> -	hws[LXT_GATE] = ma35d1_clk_gate(dev, "lxt_gate", "lxt",
> -					clk_base + REG_CLK_PWRCTL, 1);
> +	num_clks = devm_clk_bulk_get_all(dev, &clks);
> +	if (num_clks < 0)
> +		return num_clks;
> +
> +	if (!num_clks) {
> +		dev_err(dev, "missing crystal input clocks\n");
> +		return -ENODEV;
> +	}
> +
> +	hws[HXT] = __clk_get_hw(clks[0].clk);

Don't open code it. use .fw_name

> +
> +	if (num_clks > 1)
> +		hws[LXT] = __clk_get_hw(clks[1].clk);
> +	else
> +		/* Old DTs do not describe the low-speed crystal */
> +		hws[LXT] = ma35d1_clk_fixed("lxt", 32768);

I'd give it another name so you can clearly see the difference between the
DT one and the manually registered one.

> +

Don't need to open code this either.
provide both .fw_name and .name - CCF will fallback to the name.

When you want to conditionally register the fixed is up to you.

> +	hws[HXT_GATE] = ma35d1_clk_gate_parent(dev, "hxt_gate", hws[HXT],
> +					       clk_base + REG_CLK_PWRCTL, 0);
> +	hws[LXT_GATE] = ma35d1_clk_gate_parent(dev, "lxt_gate", hws[LXT],
> +					       clk_base + REG_CLK_PWRCTL, 1);
>  	hws[HIRC] = ma35d1_clk_fixed("hirc", 12000000);
>  	hws[HIRC_GATE] = ma35d1_clk_gate(dev, "hirc_gate", "hirc",
>  					 clk_base + REG_CLK_PWRCTL, 2);
> @@ -632,8 +659,8 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
>  	hws[UART16_GATE] = ma35d1_clk_gate(dev, "uart16_gate", "uart16_div",
>  					   clk_base + REG_CLK_APBCLK0, 28);
>  
> -	hws[RTC_GATE] = ma35d1_clk_gate(dev, "rtc_gate", "lxt",
> -					clk_base + REG_CLK_APBCLK0, 29);
> +	hws[RTC_GATE] = ma35d1_clk_gate_parent(dev, "rtc_gate", hws[LXT],
> +					       clk_base + REG_CLK_APBCLK0, 29);
>  	hws[DDR_GATE] = ma35d1_clk_gate(dev, "ddr_gate", "ddrpll",
>  					clk_base + REG_CLK_APBCLK0, 30);
>  
>
> -- 
> 2.55.0
>

-- 
Jerome

