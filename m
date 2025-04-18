Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CF6C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 08:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L630Qky/UZ9kI7H0yEROeZ3XG2IusjzeuDyDM/AGMdw=; b=4ezRODKr5Qvmyx1WKWoCgtbX6A
	zg4tPIVfFeERPGaUcMcqwEEOlMZ5BVb9dKWCIGG+tcOKa2OfHB3pW3cX8oXcjfax3cHAN9NXz5FGn
	RXXva4FHXgGW46Ym58F3lGo/jER6bRvlIsn4plLmkS+p7/TkSPjoTrV/CvFMpiOEXzbSWpd/rYYUm
	rcoUHzUhp06el3qXVwjcqku5UfYZFsCOiHXpKW5qhZrcsJNICvJm4MHq1pg9bfNrshTn0XcXlVU/Y
	Yq+EY8O2imOcP0L7nBu00Td3xNVFwP0Mc3sAtQ94uWtR8LkDCvN5SDi4zAKSbhh07pSFuHQpUfPTq
	aRf/M0iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5hLG-0000000Feur-3Ltp;
	Fri, 18 Apr 2025 08:44:58 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gwh-0000000FbQe-0zbs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 08:19:36 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso11795705e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 01:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744964373; x=1745569173; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L630Qky/UZ9kI7H0yEROeZ3XG2IusjzeuDyDM/AGMdw=;
        b=DpGIwOu/AJ+JrMqf5Rdr9MUAZapgJgZIfAjPL8Fn+CfGwV4uCXoU7JOXIgWt3jaY/m
         Y0B4Vq7DXVbBSyn8pSbCj/c/Ri0Cbm4V42svEIs/0v154tIrkW0GyZue/4c9rUHcFAWY
         Ait3h9lyAnX6bzYa/jVIpPE6eupXne1hWX7mPkGRsvmJGQ/2RqVe8AD5cyUxhawlAZm5
         BifNuNZTsYKXo16RcqjSLxizZm/Hl40p3EI14w1g1snJuq7GfAfGHjNZNUiPLeHEfyyU
         Yx/cn3A0SMhlCWEqN4Si4HXFf9P7rmc5zxH2DElCrVf0Yk/LZxCUMJIjWTe+FGleH/NV
         MyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744964373; x=1745569173;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L630Qky/UZ9kI7H0yEROeZ3XG2IusjzeuDyDM/AGMdw=;
        b=STGmTCvXiCdrX3QP0ctEuT8Dnj4qUXBqb1e6KyD7niJSDm0bi82eQMBeFoOL2Fu6DN
         s0q5AO+UhwuKUEEi074jTO0TldxscM6uFCxA6Lqr9ehadEjkFlTlmXOwtHhrEqxAMnBh
         YMK2pWNOglD5YXaEFZkux0uE11NatcPyo862TlvrqpwLEoaI5Xt8Cls7IaAxteISCoUH
         OhYfRbFve9lv/4YGwQf14QCGdWmsAgCEaXlVZbeGdD70nqBuHBF8d3L3herKfOtYtojo
         62SZkIWZ5bfVa/ltafvmpy3MfRAPmeH/kEzYkKBZyIu3ezlOnf3cdlG6gOrXxwsmqcyR
         1DgA==
X-Forwarded-Encrypted: i=1; AJvYcCXF5TAU8ZWjEagZVuT7o3MlFOiyPKSEdYr4Qco63leuv7HCTylgu4DiGb2wDcn3C8lIISJ7wtNdenm1Atd5b+mQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzkXzoMv1PkmwZV1Z8R2+I+Xq73V/sCXr44EoOw5t5pv5W6Kle0
	Jf0MFmtsffiCEZSEnNYzkRoodc46KdlyMEybLsoDTkiWlsEzq/0sNknHYE2NTII=
X-Gm-Gg: ASbGncugplkAycP0LjqkZCdPPgZVnzCIhprQqSNnXoWmL5CUy8Yt2bSsck64raCNImQ
	O3uWUqG7e38FYdEYSCOKGYhbDRTlyc9V0b0NehvxUrHVGM9iAeR2LtnFqV3iikFbllaWpByTGoJ
	DOIq+TgRnKKbImxmy8bSPawnmYnswE2vbVEhhrY6/xq3XjVFuJYOyqfcOgT+ZvTAKcZswAKqAxA
	KfudYZPdkRIFwQQGHME7GRE117bk+gNJ3POlrEO58HwetZE3bqo+k54t8Sebb/0FqUK1D1iPjKZ
	qOXHq/VCJa2UOi/kH+30bMcMbOT/1iXR1EvumrnoBUoE7VXr2ViDqrBBIMqrczAUyqH9c9PgCX+
	Su9s=
X-Google-Smtp-Source: AGHT+IHprYn4MpD5iVpcM5XtKPgBCL4PbwyZvt4l+PuNDtvWyynJ4XbaF2lxnyotFbTDZATgIX8ZLA==
X-Received: by 2002:a05:600c:35c9:b0:43d:fa59:cc8f with SMTP id 5b1f17b1804b1-4406ac412f2mr11115405e9.33.1744964373510;
        Fri, 18 Apr 2025 01:19:33 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa433354sm2079318f8f.32.2025.04.18.01.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 01:19:32 -0700 (PDT)
Date: Fri, 18 Apr 2025 10:19:31 +0200
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
Subject: Re: [PATCH v5 3/3] drivers/thermal/exymos: Fixed the efuse min max
 value for exynos5422
Message-ID: <aAILE01SjRR874jc@mai.linaro.org>
References: <20250410063754.5483-1-linux.amoon@gmail.com>
 <20250410063754.5483-4-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410063754.5483-4-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_011935_285693_3FBF1918 
X-CRM114-Status: GOOD (  20.10  )
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

On Thu, Apr 10, 2025 at 12:07:50PM +0530, Anand Moon wrote:
> As per Exynos5422 user manual e-Fuse range min~max range is 16~76.
> if e-Fuse value is out of this range, then thermal sensor may not
> sense thermal data properly. Refactors the efuse value
> initialization logic within exynos_map_dt_data function by
> replacing the nested if-else statements with a switch statement.
> Ensures proper initialization of efuse values based on the SOC type.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>

Same subject typo: s/exymos/exynos/

> ---
> v5: None
> v4: None
> v3: Improve the logic to convert if/else to switch
> ---
>  drivers/thermal/samsung/exynos_tmu.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
> index ac3b9d2c900c..a71cde0a4b17 100644
> --- a/drivers/thermal/samsung/exynos_tmu.c
> +++ b/drivers/thermal/samsung/exynos_tmu.c
> @@ -899,12 +899,23 @@ static int exynos_map_dt_data(struct platform_device *pdev)
>  		data->gain = 8;
>  		data->reference_voltage = 16;
>  		data->efuse_value = 55;
> -		if (data->soc != SOC_ARCH_EXYNOS5420 &&
> -		    data->soc != SOC_ARCH_EXYNOS5420_TRIMINFO)
> +		data->max_efuse_value = 100;
> +		switch (data->soc) {
> +		case SOC_ARCH_EXYNOS3250:
> +		case SOC_ARCH_EXYNOS4412:
> +		case SOC_ARCH_EXYNOS5250:
> +		case SOC_ARCH_EXYNOS5260:
>  			data->min_efuse_value = 40;
> -		else
> +			break;
> +		case SOC_ARCH_EXYNOS5420:
> +		case SOC_ARCH_EXYNOS5420_TRIMINFO:
> +			data->min_efuse_value = 16;
> +			data->max_efuse_value = 76;
> +			break;
> +		default:
>  			data->min_efuse_value = 0;
> -		data->max_efuse_value = 100;
> +			break;
> +		}
>  		break;
>  	case SOC_ARCH_EXYNOS5433:
>  		data->tmu_set_low_temp = exynos5433_tmu_set_low_temp;

Thanks for taking care of cleaning up this portion of code. IMO, it would be
interesting to go a bit further in the house keeping by replacing this big
switch with a set of structures stored as __init sections. The initialization
finds the right structure and does a structure copy to 'data'.

It is up to you to do this change or not.

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

