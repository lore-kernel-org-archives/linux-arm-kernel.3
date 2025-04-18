Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4F4C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 08:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8R7Qp36puqcIKgf+lMIiPQAk3WNF5lMseB0RPPm+UOE=; b=PTANgqqIYSa2URhkVgrGplg8JC
	W5TMRn9edHLCGgYlMIRlzfMaPi0YJivKtXMmyMq1l3BfeK4GG6hRvey8xGY3ryMbhVQ0air+7taVy
	rZdCk138Q9yjiyPnc1ra+k8Tr1qO3UxT+RIYQ95CIFkeHXcLd1FtH+rYeBiUxZeTAJBQ7lzq2+k3l
	szAy3lPFN9YlLo3Hrq6E/E9W+tdIcbnBBUXRKS/l3rxuzV+9g+eQXMfrTi86nvKiTn4mwq12DUHZ6
	k8Um8lQrWYLRUNKiGp0jMzUpQGwIukvyI87cltwfxfilNgqPq2yKt1nqjaRlg+hgEtx9DZ4+UkGoc
	iF3kzSsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5hC4-0000000Fdd0-2n0d;
	Fri, 18 Apr 2025 08:35:28 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gkW-0000000FZef-0PSv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 08:07:01 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so1190386f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 01:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744963618; x=1745568418; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8R7Qp36puqcIKgf+lMIiPQAk3WNF5lMseB0RPPm+UOE=;
        b=oN8JHDzmqJO8XK2CWpR4G3YC0eZGeLOoGJqhl8GV/4aZLeX1R9FuqGjBo3SVbFBWAk
         S3lJdhedKXVFIdaczVyiD0xK5ILr8+kQWIh5NyFMncAPlfQ+VQg0Z1ewrc59BM4zA8N/
         YwJk8eVayj6zg9mLfgr/s5E+XZ+vfXYzdibX2JNen4UqEnwI3RfmMzfym5fs8m3ZZ8tn
         j9WD4UGlEu4wYKmnqDLd5TEhN34sf4jf5dMRomM/HtjJ2Sx/6pP8EWMBfNCHErF9onCf
         3+eLOCvhYoKBGIbMhQs2wUKirmm+73Fwizy6Bh5AJkrMQQ8vEQ/ARDg8Cc7J8zl4OVEz
         euYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744963618; x=1745568418;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8R7Qp36puqcIKgf+lMIiPQAk3WNF5lMseB0RPPm+UOE=;
        b=nwl581rGLPNfOqQpkfeaGK6ZM+5R3ATM0ZfUbbugDtVzKrxz56sd+z7d+5i5XHPCqX
         LyyOF2UW62Tdv1BSEgxalKP1ZyTb56/vlUjwkXx2gHy2fVjhma9lwDjn1kHSlF23Cu4J
         kuTUSFFV4yuwX3BBFVx5PqLMMVFwclMviCkuzJqjzh+4nAy3h9ATqikmJCp2fFtQg7Y0
         us/0Ud9Bct9dZLzQjsVf9AcCpMyncJHmRhOnJ0c+0BzlSHNVzasxaY1TYKeXkW4DXyB0
         Q3p5NzAMIrYZPGP3QRRb9i11X10bLTxVCty/JEY67uQaeuSzfMRA1bnJTdCjsYOByWQf
         hmxA==
X-Forwarded-Encrypted: i=1; AJvYcCVv2KnCUZy7dMIyMLHoESOGfrfJIZTJbSGFavR5y0JJPudP7Z255ng+mnnEfN39pCKR61i6+vWsKvwsEBT2KS6M@lists.infradead.org
X-Gm-Message-State: AOJu0YzTWIpI6WrnaoyQf3kG0AtlfnzZ9a4HYpoqRYLlB4hvxwMG5/2K
	1XsqZdgWPQpRosHyeTDrCE7ll8b5B/fG6JVZTRVlQ/sfLo2y+aVAEYMsCnyoopI=
X-Gm-Gg: ASbGnctK4o5ALp53+z3mGCAHvSa2a9z3J/oL5K5gciC9hjSJI+ax293F91AkRZ37c5W
	7d1wKDuM0DytdA1+ItMJ008qCk+ignHSCOEuNbW0sZ0sIh8M2hSTAShjkbf+mkzfr0mfmJt+Eph
	XQTzqPpaeJddn3AvZEI6hoIOtV9gMV9youiGwlWe4DDgfIazDh8Q81+VxzyQ9q3q9Yd1NTn/twL
	bUB2JKkDhjGJjJYStBHltBQY36JS4+/j32b6AuG5h48LbHZ2cCLHacRzUoCL7ojvb8C/KSX40uo
	hDgA8cHhS72Q6ms1ebVtUVjgShcf5uCx/+fBh/MUsSS3CfycjwJ3xKKY3pRNjHV7ErCowIm773U
	DXfQ=
X-Google-Smtp-Source: AGHT+IGroX56fUpTWu8kdLamlS3WqtQ3AvZMCdPeD85f7x29lyEmfTuKBJbY/GKTp63EX5l2l7D2JQ==
X-Received: by 2002:a05:6000:458f:b0:399:7f43:b3a4 with SMTP id ffacd0b85a97d-39efba46366mr1072505f8f.24.1744963618329;
        Fri, 18 Apr 2025 01:06:58 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406e0056c0sm7725435e9.0.2025.04.18.01.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 01:06:57 -0700 (PDT)
Date: Fri, 18 Apr 2025 10:06:55 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>,
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH v5 1/3] drivers/thermal/exynos: Refactor clk_sec
 initialization inside SOC-specific case
Message-ID: <aAIIH7H1oQH8cf-6@mai.linaro.org>
References: <20250410063754.5483-1-linux.amoon@gmail.com>
 <20250410063754.5483-2-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410063754.5483-2-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_010700_142773_9374F16D 
X-CRM114-Status: GOOD (  26.42  )
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

On Thu, Apr 10, 2025 at 12:07:48PM +0530, Anand Moon wrote:
> Refactor the initialization of the clk_sec clock to be inside the
> SOC_ARCH_EXYNOS5420_TRIMINFO case. It ensures that the clk_sec clock
> is only initialized for the specified SOC and not for other SOCs,
> thereby simplifying the code. The clk_sec clock is used by the TMU
> for GPU on the Exynos 542x platform.
> 
> Removed redundant IS_ERR() checks for the clk_sec clock since error
> handling is already managed internally by clk_unprepare() functions.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v5: None
> v4: Fix the aligment of code clk for clk_prepare in proper if/else block.
>     update the commit for clk_sec used.
>     checked to goto clean up all the clks are proper.
>     drop IS_ERR() check for clk_sec.
> v3: improve the commit message.
> ---
>  drivers/thermal/samsung/exynos_tmu.c | 37 ++++++++++++++--------------
>  1 file changed, 18 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
> index 47a99b3c5395..3657920de000 100644
> --- a/drivers/thermal/samsung/exynos_tmu.c
> +++ b/drivers/thermal/samsung/exynos_tmu.c
> @@ -1037,29 +1037,30 @@ static int exynos_tmu_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	data->clk = devm_clk_get(dev, "tmu_apbif");
> -	if (IS_ERR(data->clk))
> +	if (IS_ERR(data->clk)) {
>  		return dev_err_probe(dev, PTR_ERR(data->clk), "Failed to get clock\n");

As this branch returns, the else block can be removed.

	if (IS_ERR(data->clk))
		return dev_err_probe(dev, PTR_ERR(data->clk), "Failed to get clock\n");

	ret = clk_prepare(data->clk);
	if (ret) {
		...
	}

May be worth to group both calls with devm_clk_get_enabled()

> -
> -	data->clk_sec = devm_clk_get(dev, "tmu_triminfo_apbif");
> -	if (IS_ERR(data->clk_sec)) {
> -		if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO)
> -			return dev_err_probe(dev, PTR_ERR(data->clk_sec),
> -					     "Failed to get triminfo clock\n");
>  	} else {
> -		ret = clk_prepare(data->clk_sec);
> +		ret = clk_prepare(data->clk);
>  		if (ret) {
>  			dev_err(dev, "Failed to get clock\n");
>  			return ret;
>  		}
>  	}
>  
> -	ret = clk_prepare(data->clk);
> -	if (ret) {
> -		dev_err(dev, "Failed to get clock\n");
> -		goto err_clk_sec;
> -	}
> -
>  	switch (data->soc) {
> +	case SOC_ARCH_EXYNOS5420_TRIMINFO:
> +		data->clk_sec = devm_clk_get(dev, "tmu_triminfo_apbif");
> +		if (IS_ERR(data->clk_sec)) {
> +			ret = dev_err_probe(dev, PTR_ERR(data->clk_sec),
> +					    "Failed to get clk_sec clock\n");
> +			goto err_clk;
> +		}
> +		ret = clk_prepare(data->clk_sec);

Same comment, devm_clk_get_enabled()

> +		if (ret) {
> +			dev_err(dev, "Failed to prepare clk_sec clock\n");
> +			goto err_clk_sec;
> +		}
> +		break;
>  	case SOC_ARCH_EXYNOS5433:
>  	case SOC_ARCH_EXYNOS7:
>  		data->sclk = devm_clk_get(dev, "tmu_sclk");
> @@ -1112,11 +1113,10 @@ static int exynos_tmu_probe(struct platform_device *pdev)
>  
>  err_sclk:
>  	clk_disable_unprepare(data->sclk);
> +err_clk_sec:
> +	clk_unprepare(data->clk_sec);
>  err_clk:
>  	clk_unprepare(data->clk);
> -err_clk_sec:
> -	if (!IS_ERR(data->clk_sec))
> -		clk_unprepare(data->clk_sec);

With devm_ variant those labels should go away

>  	return ret;
>  }
>  
> @@ -1128,8 +1128,7 @@ static void exynos_tmu_remove(struct platform_device *pdev)
>  
>  	clk_disable_unprepare(data->sclk);
>  	clk_unprepare(data->clk);
> -	if (!IS_ERR(data->clk_sec))
> -		clk_unprepare(data->clk_sec);
> +	clk_unprepare(data->clk_sec);
>  }
>  
>  #ifdef CONFIG_PM_SLEEP
> -- 
> 2.49.0
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

