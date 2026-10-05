Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1832CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 04:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LoOBU3dKUoijTmAk3p1LupdivqwWNOCTytdFGuDGRd8=; b=3kHp5XdiKuqLnDLDtY1R/7Yb4L
	GLV51up/qewRT80ccVBBdQIyE542b5ysKXErVQ5sNvadQ0rFdJ7RDZEV4mgrgQiesK4QjCT/AxW+P
	dnfCbMbVxLgql57KOk4AvGUBTNsA7z9mgNoZxvokxs84BJUAJeFU1TMecjo+neyDwINMM6GSUYfd3
	jT7a53ZqbbIxMHSFsFD1sSStZsOrza4t637upFTefFGG2YaZQikokZguM842GT9GdHwFOLNXnmdUQ
	VtQBjVSBB4ZERHw9jD/Z19GK+GEM/gLiEQgZaDbxfOZU97AbtyIbQW+ISEy9lip21oE6E+vJlkLXb
	laM384nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDZzg-0000000Fdyi-3hVT;
	Mon, 05 Oct 2026 04:08:04 +0000
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDZze-0000000Fdy1-2gZ5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 04:08:04 +0000
Received: by mail-dy2-x0f.google.com with SMTP id 5a478bee46e88-33e630052ebso1989754eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 21:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791173281; x=1791778081; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LoOBU3dKUoijTmAk3p1LupdivqwWNOCTytdFGuDGRd8=;
        b=yOmalqbLJ3eRVsrbmp2RDV8lvbf5a8e0dTsbF3V+d6Ar2ZwKm8DCUTVPCWf7a8IAn6
         mMs0jW5BdHaGUXAHQoAJmH5bfZvJ7QOwer/CDqhCa1RBEsJ5WDmIrBoH4dMEV7syLVsS
         VnZfy/R+5eVzRZDOZ1CL7qfKnr/26PTScM2OSH4Fxu5ZBSTJ2pnRloOPyFotPsHZHBUj
         fxRPcmwEyZC2t+lDNofSuyg1uyUivRxSgd0TAlyRNYYxQJUd7a74EAM4RSilMRzMqU9Q
         haDRNMw9/3rZMvF2JBuOrMaswDG7s0q33/YJtUbPIbgYcm+xAlCcBZqP+/QJurKvk93W
         OWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791173281; x=1791778081;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LoOBU3dKUoijTmAk3p1LupdivqwWNOCTytdFGuDGRd8=;
        b=YsdMsN5cqv8XKqTOIsIAB1UYT8mGmXPsfR2bbUcFKvXLWddKuN4xd+Kw+3hVOe9e8R
         gtEXRd9bn8s3avfzDAnTY+pwVoA7aRLPgo17qOuqHlx9MkZWWIaI9TQhhP0oFoRin6jB
         /lOw4kJ6Abs3+F9PXPzaSCttAJoEBTWRm0tmMnTOmtr3+6CHQbQBtof7SrWVLCPXLWqf
         plH8ZnV900EtJxKxDtRVCBE/LPqLiiZ8q0Dn0f68Lq4wogQMUDCzQRlw6ET4+QYubLDy
         dCEeMRpBxxJ6JznX96MYP5B2+hsG3u1gqSH+S9j7SbBLh7LlyJMOU2FVwBdrID9ItADg
         L8qQ==
X-Forwarded-Encrypted: i=1; AKwUvBxd++11k+yityS50Oj7MkJbtVRCONWwBMR9R112Yp/1S2+Zlo1p3tkw8N5MKqhFO9Q9xH2eUthvU8s7MLBN0FEa@lists.infradead.org
X-Gm-Message-State: AFuF++kgo7l0G0f8dbvqG1C+dXqBpU6xDM3mT2G/KomjJFRYnqvJsZnR
	OhkbCOo4AYKyyeB5FdpRZaodjoVzmMTfejAkkt+xB7MnbwXcTt5YL3m6dmOp+YiS9JM=
X-Gm-Gg: AYBFou0CHczIfzKtzGeaDod4zRfJtxa0KHZopsd5BrZoK7kshmvojiHJ3e57Q5TOp1E
	w48i0pxxGRPZNIUpOiJFyMqWhCIbMFuQdfcijjqHPq2lAU4a9upiSna/fyejLpXYHqEdk1tcqF7
	rfm0CVYZI1bBkN2GBrKJb9uvcjGpFzHnaUDj4tnQ+WhE0gIHfbfW2nxUgEodLpOv25FmzzBsBR6
	fIfyz/ECuhLYXAd4Tb+9UcCvReyUiIm3Ofz6+8sPC0lt/8EfkcyjF36PyJZGML6TvpBw0rNR0NJ
	OKBzLxutIuvHqopqFSVDvb26YtCM3QymL39LuetKoCd56raDKSkHbxzfZ3GxAR/FXYqfX6Gnfx1
	9CDrQlNcFMUpbHLsOgK/Dz+leeHDQ/Qklp8pvkq8yk4tfS6VuIf0HhskLlpZy58wc0oIvd3CzC9
	pWqPrqT8nQqkBazmYtz4Ey5v4toyaRGnuFBRNddivWewtxwdNFRVV6dFwAmGnu/sIOtWupyj/f
X-Received: by 2002:a05:701b:2810:b0:149:cfa4:9b3b with SMTP id a92af1059eb24-14f58de5451mr12982932c88.3.1791173281135;
        Sun, 04 Oct 2026 21:08:01 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fcec9a95sm18805270c88.15.2026.10.04.21.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 21:08:00 -0700 (PDT)
Date: Mon, 5 Oct 2026 09:37:57 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sumeet Pawnikar <sumeet4linux@gmail.com>
Cc: rafael@kernel.org, krzk@kernel.org, amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org, thara.gopinath@gmail.com,
	talel@amazon.com, hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org, mmayer@broadcom.com, sumitg@nvidia.com,
	peter.griffin@linaro.org, myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com, cw00.choi@samsung.com, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, sven@kernel.org,
	j@jannau.net, marcan@marcan.st, casey.connolly@linaro.org,
	sre@kernel.org, wens@kernel.org, t.schramm@manjaro.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de,
	imx@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] cpufreq: Use %pe to print error pointers
 symbolically
Message-ID: <asMinVwyd7gcvRlo@vireshk-B250M-D3H>
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
 <20260912191156.185448-4-sumeet4linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912191156.185448-4-sumeet4linux@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_210802_685347_2D69561C 
X-CRM114-Status: GOOD (  17.55  )
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

On 13-09-26, 00:41, Sumeet Pawnikar wrote:
> Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
> to pr_err() and pr_warn(). The %pe format specifier prints a symbolic error
> name (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it
> falls back gracefully and prints the raw integer value. This makes messages
> more readable without any functional change.
> 
> Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
> ---
>  drivers/cpufreq/bmips-cpufreq.c   | 4 ++--
>  drivers/cpufreq/cppc_cpufreq.c    | 4 ++--
>  drivers/cpufreq/qoriq-cpufreq.c   | 4 ++--
>  drivers/cpufreq/s3c64xx-cpufreq.c | 5 ++---
>  4 files changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/cpufreq/bmips-cpufreq.c b/drivers/cpufreq/bmips-cpufreq.c
> index a8e35bc75fb2..389fff5e6f65 100644
> --- a/drivers/cpufreq/bmips-cpufreq.c
> +++ b/drivers/cpufreq/bmips-cpufreq.c
> @@ -132,8 +132,8 @@ static int bmips_cpufreq_init(struct cpufreq_policy *policy)
>  
>  	freq_table = bmips_cpufreq_get_freq_table(policy);
>  	if (IS_ERR(freq_table)) {
> -		pr_err("%s: couldn't determine frequency table (%ld).\n",
> -			BMIPS_CPUFREQ_NAME, PTR_ERR(freq_table));
> +		pr_err("%s: couldn't determine frequency table (%pe).\n",
> +			BMIPS_CPUFREQ_NAME, freq_table);
>  		return PTR_ERR(freq_table);
>  	}
>  
> diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
> index 80893844353c..f767898ebfb5 100644
> --- a/drivers/cpufreq/cppc_cpufreq.c
> +++ b/drivers/cpufreq/cppc_cpufreq.c
> @@ -230,8 +230,8 @@ static void cppc_fie_kworker_init(void)
>  
>  	kworker_fie = kthread_run_worker(0, "cppc_fie");
>  	if (IS_ERR(kworker_fie)) {
> -		pr_warn("%s: failed to create kworker_fie: %ld\n", __func__,
> -			PTR_ERR(kworker_fie));
> +		pr_warn("%s: failed to create kworker_fie: %pe\n", __func__,
> +			kworker_fie);
>  		fie_disabled = FIE_DISABLED;
>  		kworker_fie = NULL;
>  		return;
> diff --git a/drivers/cpufreq/qoriq-cpufreq.c b/drivers/cpufreq/qoriq-cpufreq.c
> index 42edb41ad459..0652e5df0278 100644
> --- a/drivers/cpufreq/qoriq-cpufreq.c
> +++ b/drivers/cpufreq/qoriq-cpufreq.c
> @@ -57,8 +57,8 @@ static u32 get_bus_freq(void)
>  	/* get platform freq by its clock name */
>  	pltclk = clk_get(NULL, "cg-pll0-div1");
>  	if (IS_ERR(pltclk)) {
> -		pr_err("%s: can't get bus frequency %ld\n",
> -		       __func__, PTR_ERR(pltclk));
> +		pr_err("%s: can't get bus frequency %pe\n",
> +		       __func__, pltclk);
>  		return PTR_ERR(pltclk);
>  	}
>  
> diff --git a/drivers/cpufreq/s3c64xx-cpufreq.c b/drivers/cpufreq/s3c64xx-cpufreq.c
> index 9cef71528076..9a01592425ee 100644
> --- a/drivers/cpufreq/s3c64xx-cpufreq.c
> +++ b/drivers/cpufreq/s3c64xx-cpufreq.c
> @@ -152,15 +152,14 @@ static int s3c64xx_cpufreq_driver_init(struct cpufreq_policy *policy)
>  
>  	policy->clk = clk_get(NULL, "armclk");
>  	if (IS_ERR(policy->clk)) {
> -		pr_err("Unable to obtain ARMCLK: %ld\n",
> -		       PTR_ERR(policy->clk));
> +		pr_err("Unable to obtain ARMCLK: %pe\n", policy->clk);
>  		return PTR_ERR(policy->clk);
>  	}
>  
>  #ifdef CONFIG_REGULATOR
>  	vddarm = regulator_get(NULL, "vddarm");
>  	if (IS_ERR(vddarm)) {
> -		pr_err("Failed to obtain VDDARM: %ld\n", PTR_ERR(vddarm));
> +		pr_err("Failed to obtain VDDARM: %pe\n", vddarm);
>  		pr_err("Only frequency scaling available\n");
>  		vddarm = NULL;
>  	} else {

Applied. Thanks.

-- 
viresh

