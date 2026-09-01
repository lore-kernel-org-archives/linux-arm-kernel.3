Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87868C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 02:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jDt+CxLSf4w3iJAIBpJcXGUG31tyCk7fy3CEY8EdRVs=; b=HSAlvqvM167Dsns8M0I8KsbIni
	6GbrpiboR4m056luCTH4/E2uPRlfNYLU6Vgxh866Ba4f7FmnbNBQkFzTyE6iPU3Bp+PCA7GaxwifF
	GAs1ITdFX7wpeGHYoOz6UenzFZW2gVMmkaUgM4gBj2uRgmCZDc4dzI5NBIc2gwWh/xGz+yvkloYgR
	/1BCyvyflZwBHrJk6Osgk184QppLJ+IwFRfiQRAGWLigEykX+yZTEWy8BbWFD5cmhyGrwc0/OU3Wt
	ZZ00U25EVe2DBwEtfuzKwKgIkdTtqK6GLn9CaYqgGaPKgKtAkRMCjhUkEdCCzyirO0V6WocBDO8u/
	FddjNKSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ED5-0000000AsM1-2Ud1;
	Tue, 01 Sep 2026 02:26:51 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ED3-0000000AsLN-2sNH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 02:26:50 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-86162c086f8so9617687b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 19:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788229608; x=1788834408; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jDt+CxLSf4w3iJAIBpJcXGUG31tyCk7fy3CEY8EdRVs=;
        b=F83i6Az3aA7pHYtBoqtCa8JsLLYpUJI8v+30ugyLmnrHFff5GoGEqHlvIxLPQeuWPe
         ts4Xv/+huWRtY2MJLppQyGPEXOCi3NQ9f4xgtT62ZnMuM27OIhjyZ/h4JuOfoSKYWsym
         1b5QdUusyzkHzN4d1q0Soqo8vAJBsKB7uNgfwPIOIWbff0SAEaFragzWn71DhwCix/J1
         SR+DneXiPzXcBVI52rrcBVe1urbYn8A2Lx2j8yBz6uKRy8rekjxt7500eGSaMXSj498l
         3ri6M+s4VwcvDR2SkRHD+THCPZqoxfHlEI3hyrVHxQzdl/EeAdi15K0n84cb6v4iCHeF
         ZFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788229608; x=1788834408;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDt+CxLSf4w3iJAIBpJcXGUG31tyCk7fy3CEY8EdRVs=;
        b=gGxCoZewZLcWIIqkcTxlAbwlesStNoDAHGLy5+iEqSzqPUrpYXpqyS+OhaaSGyvYrg
         RXxSxwnW2BUi3dyK0/6uCaVOZLCXKymRn4+3UUWxVG5U69ko+wcvdnziL8VsInzTZ1EI
         h64AQ9/u08KyGctL8sp8ZDibCNo3ZbSvh6Dgxwwlixbfj+hbTXjV/X8IoSXSYfQHF6ji
         zQQwtJRY9YkqsFNp7PqZ9B4xsTjJsYbhG7HXtlLpLzOu7/z/5688A64XIeM8oDeHqeEY
         bWxPfIoXK86W6FlDUKDi2eWsTLkzLX5EkYpjB8kRByagFu+PMye5JBlLaymW/7PPlJvK
         gKyA==
X-Forwarded-Encrypted: i=1; AKwUvBxyWzxmc6yiQOtY0K2ev522AxMb4uGMknJWn+XhMqD2TPZO7fufuT6sO0c0A3enn8o0a5EtTHEqJptQk7nD2Vze@lists.infradead.org
X-Gm-Message-State: AFuF++kAkh+Gw80I6xmo5f2CeYHs8qEEUIaq85xmyzezlTvBMr1wfifX
	qIs4rJk6i5G1AohUfahS5u19EBTrSqNGFBBnimf7QsKBI+WKHjt3Fp8z
X-Gm-Gg: AYBFou03xze1ZSIoQTc+MET0asYtIroBvmg0tBvbMOOwkHxph1TihOEkDhrZIkgtFsE
	AFbjGgkB17Y89eCcPVJvBZs2ISqAWyQm1nZ+QXhXMKFKahnocp5xOzUcgviryKvM+S8kyXTV6AZ
	XIfVR2EVgAwTrdPJ0abPrvQhML5JxHUWvp9RPDV8A2edczRS2P8su3MAE2HxwjLb/n4lFrqXxQC
	ZfsHFvhrGiEXJnJieoCRTiGUFrhqrBJNmkQkMmO9ubuCCo5n5K0pmMzddNSCTclGQRXPMRzDD0g
	pPZlL55t210dY0YA3xQWs1ro0DONW/R/3m0SDuC06QhOlwaAsSgMxLNQKI+HWOrbSVX7L4YhD38
	mFVy1cEKDjb4g3dZpcFz4nngE17VsAwziuRxnaqQgJt2gjFDNW8jIWpO2vcTajZqCPR7dlsRNoW
	SjJlIBL63pjvmMU+tW6jsJiQFLz1auNqLS8UrP0hqmm5HErQR7uA+VKrjVls4fp/B9hKcJcdlpL
	kyJhR0=
X-Received: by 2002:a05:690c:a65a:b0:834:fadf:603c with SMTP id 00721157ae682-86948ae2315mr9271507b3.2.1788229608300;
        Mon, 31 Aug 2026 19:26:48 -0700 (PDT)
Received: from localhost ([2804:30c:94d:7300:da0f:c2c1:1aa6:43da])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e66abc938sm64653947b3.37.2026.08.31.19.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:26:46 -0700 (PDT)
Date: Mon, 31 Aug 2026 23:27:37 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: mdshahid03@gmail.com
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] iio: adc: bcm_iproc_adc: fix include dependencies
Message-ID: <apY4GY-0_XMSfE9B@debian-BULLSEYE-live-builder-AMD64>
References: <20260830170919.470974-1-mdshahid03@gmail.com>
 <20260830170919.470974-3-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830170919.470974-3-mdshahid03@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_192649_750142_110A75A7 
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

On 08/30, mdshahid03@gmail.com wrote:
> From: Mohammad Shahid <mdshahid03@gmail.com>
> 
> Add the headers required directly by the driver for completion and
> mutex APIs.
> 
> Remove the unused `linux/io.h` header now that register access is
> handled through regmap APIs.
> 
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> ---
>  drivers/iio/adc/bcm_iproc_adc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
> index e46e3761993a..2b59819c4ca4 100644
> --- a/drivers/iio/adc/bcm_iproc_adc.c
> +++ b/drivers/iio/adc/bcm_iproc_adc.c
> @@ -4,11 +4,12 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/completion.h>
>  #include <linux/delay.h>
>  #include <linux/interrupt.h>
> -#include <linux/io.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>

I think that's okay. Though, if you go for a v3, you may also add 
#include <linux/bits.h>
#include <linux/types.h>
#include <linux/array_size.h>
#include <linux/device-id/of.h>
#include <linux/iio/types.h>
which mostly completes the list of includes iwyu tool reports to be missing.

With best regards,
Marcelo

