Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A592D5B145
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 20:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9OakXUHW4ekUbkk4194qmDiDkD1ec89ns71VYRu02+Y=; b=1eZEdYDMcmXrpo7W6AecAqNJoN
	mfpcKT53WrxA08fN8q7gasJLcFkpiKKV1uPfheBe+XQty0Slnb2dXu7Q399vbNQF+W4I56iMfJbaT
	d88O1v9drTyz8+4dath7mrgvjMk38e22994XvHATRwUrVvdi0kMlHPtqyzv+iF6WykR0HZrGAQ3ZF
	wkyUJ/A4GOnRedkmXrJSViON2/xGcfv7HMUIaNk46MwlyzE2wWncZaiV6LFHG/Xc2N6bnmYC6RM93
	Vvi/QBSzoDPQNXhmJhoKBUx7AbNsrP9rvBr3VJ2tFphwdSqRfzqdtnY4bVR3I/8YCzE397u+9aTbq
	tLONROAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5W5v-0000000C79B-08vu;
	Mon, 28 Oct 2024 20:12:07 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5W4I-0000000C70s-22mS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 20:10:27 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2fb587d0436so48516741fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 13:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730146224; x=1730751024; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9OakXUHW4ekUbkk4194qmDiDkD1ec89ns71VYRu02+Y=;
        b=eZ5YwqU/5/HNIeHJ8kL6RM4km+3IwfN/4dM/NBA9rGYYGDtyxQ0Q5ce7xHHQlW8q6k
         9P5tkjI8zh4n6Chd9hsiDy432WDvAz2cyzRDVzAFnArPUa+1dtgCVVb5YPPcnvbk3RDi
         8CV4EVVc96MRdQnXNahKVGnJitaxNSBUNhRtsHJImMVceL2bm5XdzwIxvSlu87yV1wWy
         e3U4yDl1x1u3vibh4Tj6w1H7qoL7K3wr7BQVERnpr/LTD7/Iadt2XUrZRFCcwQDCzn72
         FVVS26jXAnhxJMR2OHaNieMm1M6p00rgUg+TvllKbhSEOFKyZUwRe95JYydAcCJxI9H8
         g2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730146224; x=1730751024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9OakXUHW4ekUbkk4194qmDiDkD1ec89ns71VYRu02+Y=;
        b=ULRcVca8kl9LJxk3xdwJC4mAi8w2pX10PoHTDmkZRgghWxm+J3wgDOvIwlgXP4/WZC
         w4CYqxipHWrjjTPD9e49uUY4JnFfMynbmS/q5+2+PClTG2MfHFerfL0L59fifM3iwq4B
         K3aN8BnEr98LKIledbqQMEBtLQwnumNdvn1y4PnWT2Vj4/q8r06n4ZUq8YrsBFtDZ8PZ
         k5fI/S09Ka0fBmCT5EqJ27jbnmvTtDtDbjEgghcOd7ynh4xa50Mtn95zE1Cyfyf5veRH
         mo+oOArx6Sixw+JbbvblzgMFeVZbzZvTh7zp+zpjn4NUbuYo0kK/ooKTYBaDvi4wNYwK
         IWxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDUAQufw2yxck+JvdLfSiOMYimnJBjUUxM6JhWdvluNZIq5JnBFAgf/uX+PD/9v5tNQc5MJ5in90EZv13XO51D@lists.infradead.org
X-Gm-Message-State: AOJu0YzV3/DoghFRRHU/+b4uHqciUOmwQAq0fN/JAoeeF+8bT3pt97Oj
	QhVTowNGRPz5MdCM/1mTWSEeH1v0QthUL4e0UACRmd9S8BA5COo1
X-Google-Smtp-Source: AGHT+IEhRHymYCU+tCOEvbZ8QNMhh5sgOJMiW/Owt/4gwHI7TUaTxsRkZjuhBGPWWmqjENgxq52sag==
X-Received: by 2002:a05:651c:1994:b0:2fb:4f0c:e40c with SMTP id 38308e7fff4ca-2fcbe0674f0mr39846821fa.34.1730146223350;
        Mon, 28 Oct 2024 13:10:23 -0700 (PDT)
Received: from [192.168.1.17] (229.140-242-81.adsl-dyn.isp.belgacom.be. [81.242.140.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb6349675sm3362990a12.94.2024.10.28.13.10.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 13:10:22 -0700 (PDT)
Message-ID: <de178df0-9c88-421b-a02f-f5b25d18249b@gmail.com>
Date: Mon, 28 Oct 2024 21:10:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] clk: sunxi-ng: h616: Reparent CPU clock during
 frequency changes
To: Andre Przywara <andre.przywara@arm.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20241025105620.1891596-1-andre.przywara@arm.com>
Content-Language: en-US
From: Philippe Simons <simons.philippe@gmail.com>
In-Reply-To: <20241025105620.1891596-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_131026_568336_3DE3AD3B 
X-CRM114-Status: GOOD (  34.31  )
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

Hi,

I made various tests with this patch, and it doesn't resolve the issue 
on H700.

It doesn't hurt either, so it's up to you to keep it or not.


For the H700, I'm wondering if DVFS is the issue. I mean that's how I 
trigger the crash,

but the crash maybe just a side effect, I've ran tests across the 
transition matrix, and they all seems to works... until it crash.


Crashes are random in their occurrence and their manifestation...


I'm clueless at what could it be.


I've stressed the DRAM at various CPU speeds, and this seems to be 
stable, but again we have detection issues with u-boot... so...

Philippe

On 25/10/2024 12:56, Andre Przywara wrote:
> The H616 user manual recommends to re-parent the CPU clock during
> frequency changes of the PLL, and recommends PLL_PERI0(1X), which runs
> at 600 MHz. Also it asks to disable and then re-enable the PLL lock bit,
> after the factor changes have been applied.
>
> Add clock notifiers for the PLL and the CPU mux clock, using the existing
> notifier callbacks, and tell them to use mux 4 (the PLL_PERI0(1X) source),
> and bit 29 (the LOCK_ENABLE) bit. The existing code already follows the
> correct algorithms.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Hi,
>
> the manual states that those changes would be needed to safely change
> the CPU_PLL frequency during DVFS operation. On my H618 boards it works
> fine without them, but Philippe reported problems on his H700 board.
> Posting this for reference at this point, to see if it helps people.
> I am not sure we should change this without it fixing any real issues.
>
> The same algorithm would apply to the A100/A133 (and the upcoming A523)
> as well.
>
> Cheers,
> Andre
>
>   drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 28 ++++++++++++++++++++++++--
>   1 file changed, 26 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> index 84e406ddf9d12..85eea196f25e3 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> @@ -1095,11 +1095,24 @@ static const u32 usb2_clk_regs[] = {
>   	SUN50I_H616_USB3_CLK_REG,
>   };
>   
> +static struct ccu_mux_nb sun50i_h616_cpu_nb = {
> +	.common		= &cpux_clk.common,
> +	.cm		= &cpux_clk.mux,
> +	.delay_us	= 1, /* manual doesn't really say */
> +	.bypass_index	= 4, /* PLL_PERI0@600MHz, as recommended by manual */
> +};
> +
> +static struct ccu_pll_nb sun50i_h616_pll_cpu_nb = {
> +	.common		= &pll_cpux_clk.common,
> +	.enable		= BIT(29),	/* LOCK_ENABLE */
> +	.lock		= BIT(28),
> +};
> +
>   static int sun50i_h616_ccu_probe(struct platform_device *pdev)
>   {
>   	void __iomem *reg;
>   	u32 val;
> -	int i;
> +	int ret, i;
>   
>   	reg = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(reg))
> @@ -1152,7 +1165,18 @@ static int sun50i_h616_ccu_probe(struct platform_device *pdev)
>   	val |= BIT(24);
>   	writel(val, reg + SUN50I_H616_HDMI_CEC_CLK_REG);
>   
> -	return devm_sunxi_ccu_probe(&pdev->dev, reg, &sun50i_h616_ccu_desc);
> +	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, &sun50i_h616_ccu_desc);
> +	if (ret)
> +		return ret;
> +
> +	/* Reparent CPU during CPU PLL rate changes */
> +	ccu_mux_notifier_register(pll_cpux_clk.common.hw.clk,
> +				  &sun50i_h616_cpu_nb);
> +
> +	/* Re-lock the CPU PLL after any rate changes */
> +	ccu_pll_notifier_register(&sun50i_h616_pll_cpu_nb);
> +
> +	return 0;
>   }
>   
>   static const struct of_device_id sun50i_h616_ccu_ids[] = {

