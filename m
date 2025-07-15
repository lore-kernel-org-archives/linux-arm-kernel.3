Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A4EC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JeSwPftceeI4bS5ZJ/5dVmNBTZSjRvLVPg9Q3yUXq/U=; b=SveSrG/Tnpethjr+sapzo7tPr8
	bU8y4rX5M4tt3pXWKGcuawH1Ax1HOCCnsqyeaVv6fCeZMXKHYuJGXNqF/kbBGiu1lTFvBw651fKjD
	k7Gecjq+t3R7bqQsq9/XI+yBpQh6LejrPVlFBdYF12GRtpdHvgPoZT9W88mWJwJsCIof2wZfsLx2O
	8tzdrqu/EHmw9pHh1NtM3+HMDA9wtUbi3jGoaEQUVoarL3ax/JmaqBAXvyyX48iMSryhAvdnLq26S
	j41hiAK3/Ja5QTazRqAKOiwjXx8OsX+eCFSOb8IPNdLl3pybqHl9DSnN/xri/lMPoZ+qPye8StOLi
	UDrFzmQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublBj-000000061rs-1lEO;
	Tue, 15 Jul 2025 19:19:39 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubjN5-00000005p60-3AlR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 17:23:16 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-23c703c471dso1288495ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 10:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752600194; x=1753204994; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JeSwPftceeI4bS5ZJ/5dVmNBTZSjRvLVPg9Q3yUXq/U=;
        b=guxPp2JDd/7qJypcvjk+oIg7Xm79Z8nW3eZuDjv6rxY4m+1Q0Q05zOxyIqOwOX9tMN
         OSXZV783ggCZCTiT6TgrvRi2Uc//UJuIpX9jm120dDUZ25lBCUxlZsmkvpRVQveQ/IBf
         UszPkGksQcez3nh+SuFg0VNqlKdn30/5ndTI8E7TM+b2TLvKjTJIY1NtEZ5zTPb1aGWf
         PipUH9Mjl6nRnfGUw2xWkk6H8RqNMopBIGvlWipwjtSfGQiXJkZLlxg0SyIAWqy5GnlV
         4WtNl5ybBeaTYfvAb6KXA8Ve4xo//QNL9lDHVD3vHvoYKrcrzadkm7MAh/iiCPL7o0SI
         DjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752600194; x=1753204994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JeSwPftceeI4bS5ZJ/5dVmNBTZSjRvLVPg9Q3yUXq/U=;
        b=WkDolOCGg2UDeIBQ+fKoUZoUsQg/dibG5hn8TJ3RLqNFcEjWPXjkYHyDIUsJKNRoS+
         v0Jrwt7m9jdsATPn/X+lLhs5BMLly18yTBYOA0/Ge23dcWjhMX5MsM/c45U+chmQZKO5
         cqbRPK2Bt1N570WZLVMBYHg6+CaeR2QaAOasYzqz8/NauxU+LCtUZBcjaC8xbc2lpVv2
         gyZ6sMitZRKp2cFXnKYlj0CQYIb5WXQEILCU5stCMFMS3foBuWjUpW7pZrKEPhcn1Hds
         wnFzxvU+PhDn4pAbisqjUrK4TwfkNTuHE5vwJRAZ6J6OrlGdkBdhsL0oqkyPWlwuD3J+
         8ZkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaslpes6IofzHrTisIrqY3Mgt/6ADkaY4tkpnvB4G5t0qt5EllfQkZt4YxwF7XB+ov3g32nYfbJD7NyehlPmLb@lists.infradead.org
X-Gm-Message-State: AOJu0YyJFGe7iE/2RDgYwpaAuIQlbj5s36Yx876Cu3PLagHxvccOaLQ4
	wDzPrtGVvgHv0q1C6GL49Eff0U0zKCgAadYh6vzY/CKQL+tZrHiK+y2RJd5s0WQFLY3EkAKxy3e
	BQLLIow==
X-Gm-Gg: ASbGncu2PX7+VyiALGmkS3JNSrlE//AP8U6S7EMgSVTxNFmPBCF07VY13WJSOOGW+AC
	alAazRWyLj+PJ/8Tx2yHoWlmZAB+7hL5TSRpYX5iUarjXyyRcR/Yf28jEmM+Mtj6DhxzA8NYDMz
	YCTMpCScgrMXCTHkWQBHOWtgijGuIlL0rDIGURNmMzsu25GvzkQ9T3LwaEujnQZLf381mwnAWmm
	K6JxOKhhzCMTCW8t5jPqbw/xziSqu3E60Q393rUKT5m+Xf8PEhQ2APSy6iuUksdrOvNCXQ5T2SP
	2IUgcfZ/B7XyC9KpnbYHGNZ3t8/rpQ5pK8k0y5jidJbxvxjiyvyPcdIH3jUkUtTbc0NJ8wdx1/2
	UlM5NfpOV0M4XS9vZ4xu787wVkbclv7LZeOFa2yjyrB/8ka57q9DSUFtTJHRGryg=
X-Google-Smtp-Source: AGHT+IE8tlVGhJEdemSXyXUpK0hF30ss3dhi3KqymqtfDaNyMz+jAYsoKXuNfguzst4OMQTFv0uS9A==
X-Received: by 2002:a17:903:1248:b0:231:c89f:4e94 with SMTP id d9443c01a7336-23e1a4c71e3mr67028215ad.21.1752600193877;
        Tue, 15 Jul 2025 10:23:13 -0700 (PDT)
Received: from google.com (152.33.83.34.bc.googleusercontent.com. [34.83.33.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4332eadsm116684575ad.153.2025.07.15.10.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 10:23:13 -0700 (PDT)
Date: Tue, 15 Jul 2025 10:23:09 -0700
From: William McVicker <willmcvicker@google.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH] clocksource/drivers/exynos_mct: Fix section mismatch
 from the module conversion
Message-ID: <aHaOfZk77xDf81cP@google.com>
References: <20250620181719.1399856-6-willmcvicker@google.com>
 <20250715121834.2059191-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715121834.2059191-1-daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_102315_796690_220067D7 
X-CRM114-Status: GOOD (  21.42  )
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

On 07/15/2025, Daniel Lezcano wrote:
> The function register_current_timer_delay() when compiling on ARM32
> fails with a section mismatch. That is resulting from the module
> conversion where the function exynos4_clocksource_init() is called
> from mct_init_dt(). This one had its __init annotation removed to for
> the module loading.
> 
> Fix this by adding the __init_or_module annotation for the functions:
>  - mct_init_dt()
>  - mct_init_spi()
>  - mct_init_dt()
> 
> Compiled on ARM32 + MODULES=no, ARM64 + MODULES=yes, ARM64 +
> MODULES=no
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Reviewed-by: Will McVicker <willmcvicker@google.com>

> ---
>  drivers/clocksource/exynos_mct.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index 5075ebe052a7..80d263ee046d 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -657,7 +657,7 @@ static int exynos4_timer_interrupts(struct device_node *np,
>  	return err;
>  }
>  
> -static int mct_init_dt(struct device_node *np, unsigned int int_type)
> +static __init_or_module int mct_init_dt(struct device_node *np, unsigned int int_type)
>  {
>  	bool frc_shared = of_property_read_bool(np, "samsung,frc-shared");
>  	u32 local_idx[MCT_NR_LOCAL] = {0};
> @@ -705,12 +705,12 @@ static int mct_init_dt(struct device_node *np, unsigned int int_type)
>  	return exynos4_clockevent_init();
>  }
>  
> -static int mct_init_spi(struct device_node *np)
> +static __init_or_module int mct_init_spi(struct device_node *np)
>  {
>  	return mct_init_dt(np, MCT_INT_SPI);
>  }
>  
> -static int mct_init_ppi(struct device_node *np)
> +static __init_or_module int mct_init_ppi(struct device_node *np)
>  {
>  	return mct_init_dt(np, MCT_INT_PPI);
>  }
> -- 
> 2.43.0
> 

Thanks Daniel for catching this! Sorry I missed it.

Regards,
Will


