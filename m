Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1053BC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 18:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dYr/06bN4QHJZrZIiya8DeP2xQp31cjUuHO8BvFHhkA=; b=t6KGgY9cfOmKUNHAcppwxRU5Lc
	I1s6UlPivQvJWnStPV/AsQpggCLihufvt6nKKv/h4sr7ZcC1EqYR2hxJUE6rUPHQxxd9ZQAG/Butz
	1+LvKWY62nif+eDB5R6V4IgG/UpHbHME/GR8KoDDTpBuBCSIdV3AegO4PMoAFHfMv2We2/3D8dGYy
	Ysemr0tJ9sbI+SIq2lrZyhkzOpzOoJ1B3SBWML7tUyFZS+Otz7qc8yudj+kflOAxr/foXk5JS109i
	OipU6Kuzs37c4J3pODT+HjcCwHgFqzWMYbfBZSkW6YT+KCFpwXXE8BcrFddqU062nNyJcj6QfcATB
	S4MmAs4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMVz3-0000000BXym-3Nbk;
	Tue, 03 Jun 2025 18:03:33 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMVvX-0000000BXZC-2fzD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 17:59:56 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-747abb3cd0bso116033b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 10:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748973595; x=1749578395; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dYr/06bN4QHJZrZIiya8DeP2xQp31cjUuHO8BvFHhkA=;
        b=wV1MOhOJS02tJWcGN0+o0v7whbjwyzmRp+tjc/VK/aMZ457sY/JEBYxWzFdIp4GQiS
         J2FKUA1d09WG0Q5XW6aeDqHHEc68/Y/vfm1IhWEsRTUQAbmiDatzb0g98U8bAsch6GXn
         /vGbrRtF5zrQYOWIUYDr6pNejZ8SKJnI1rvBtxLsXx0oCO4TDzyFYnVvgBifVP6nUK+n
         FNvI173/78Zig3obROw4kesfuWO/HNe27goEOk40XzzFI1o9zbjzq5izcj2FkaTUvoQ3
         vZIS/vx/93vv6o/dNIRTiG8NjOx56mYVKgnJ171IzHoQIZRInjI46D3xAXjetseFJ6a5
         6IcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748973595; x=1749578395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYr/06bN4QHJZrZIiya8DeP2xQp31cjUuHO8BvFHhkA=;
        b=tYqevZ7aNuEUTNvfhDx+5BmQaJGknxTc/g7ly2zLOxSz90u1+GftDbe65ZXG+JxLJi
         c7cTRBGFYgB3NjoSnp6pTfY+kLtwdJqh4aLKzJiQin/Sp7GGTl60gDsPgpzYpqInZRPz
         WYFVRYG7wga/Q3EriyYtXX1hF9Gr+iM9MGmQ1qGMiHEHmV+BBYW7aaQhS6+Nxk/fZ+ed
         M2ynhuaFxjuxGGGQBowbyn78J3P7syKOePc0hTszmbi51HyAyhQAW3LjJ7MKGNJe6DGA
         bBzx9IXt79dEr60M9w//nSCyg05pV3cNBgfznRWeA2b0YxFQtymGno+LuEI04fdZRt+v
         hL4g==
X-Forwarded-Encrypted: i=1; AJvYcCUzsgqdWqT8w8EIr/JGdRzFwPeOpRcbXniI3Zlfkk+kGLMTlZvLSzCuG3Y3/VThqhSizggK5VEm+x+vh5Jlml2N@lists.infradead.org
X-Gm-Message-State: AOJu0YzKunInCRfwYdsbrsx8ZyVSRZTQ988XSdVqpGfoERh1hvSB2rAw
	1JLE1bBNYzMRklOf3900yKd/ORmZ/+fXQXQpfT12e5gXD8UE1wIN6dAdP6gTsEag9A==
X-Gm-Gg: ASbGnct2diXPdyC4hRcUbzgwG9LcmxZXbvTT3u9qOGVzlqIohbzKIEiVyk+KRk9rhV2
	RmFazFXDiGZU8h3hJtSqdmyfmJIPwjilrt0HQcexgXJ5VE20Eup3KY6Xrln3cEYikkX8gAQS4h3
	7l5NjT6rgMrcbM8jOS+XCfyAfDxqs3Ny0m+2Znlk/v4RLKK7J+dS4J8FOQuuHOmBass4RU031xc
	EL54nLU8QGFCleS5UofV0LRFF/+Z3REExFmfXAK3sw2hMZvfmDuo+90sdgIeZdK7iLZ3+nrb1fc
	w4G6eHvYhpw38P+3fuXG1fhXrozPcyPtMLj6pQsMuChHsHp1P8Sn8Scb3rYcHj/MoU+3ONQ9zux
	GThb6F17CexXkjWf8nFqrS4tZBCo=
X-Google-Smtp-Source: AGHT+IGjgStLfRgl5mcLbCo1SeqO3sImaOglz5V740eKF1RoVh4hQTng1HI7HfjGR1PadljmDx9/GQ==
X-Received: by 2002:a05:6a00:ccf:b0:736:4d05:2e35 with SMTP id d2e1a72fcca58-747fe24f7dfmr4701490b3a.3.1748973594522;
        Tue, 03 Jun 2025 10:59:54 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affcf703sm9619170b3a.129.2025.06.03.10.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 10:59:54 -0700 (PDT)
Date: Tue, 3 Jun 2025 10:59:49 -0700
From: William McVicker <willmcvicker@google.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, Jim Cromie <jim.cromie@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Marco Elver <elver@google.com>, Nam Cao <namcao@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, John Stulz <jstultz@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Saravan Kanna <saravanak@google.com>
Subject: Re: [PATCH v1 5/7] clocksource/drivers/stm: Add module owner
Message-ID: <aD84FVFtggGP-FF2@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-6-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-6-daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_105955_671815_C6D892AD 
X-CRM114-Status: GOOD (  20.44  )
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

On 06/02/2025, Daniel Lezcano wrote:
> The conversion to modules requires a correct handling of the module
> refcount in order to prevent to unload it if it is in use. That is
> especially true with the clockevents where there is no function to
> unregister them.
> 
> The core time framework correctly handles the module refcount with the
> different clocksource and clockevents if the module owner is set.
> 
> Add the module owner to make sure the core framework will prevent
> stupid things happening when the driver will be converted into a
> module.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Reviewed-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

> ---
>  drivers/clocksource/timer-nxp-stm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/timer-nxp-stm.c
> index d7ccf9001729..bbc40623728f 100644
> --- a/drivers/clocksource/timer-nxp-stm.c
> +++ b/drivers/clocksource/timer-nxp-stm.c
> @@ -201,6 +201,7 @@ static int __init nxp_stm_clocksource_init(struct device *dev, struct stm_timer
>  	stm_timer->cs.resume = nxp_stm_clocksource_resume;
>  	stm_timer->cs.mask = CLOCKSOURCE_MASK(32);
>  	stm_timer->cs.flags = CLOCK_SOURCE_IS_CONTINUOUS;
> +	stm_timer->cs.owner = THIS_MODULE;
>  
>  	ret = clocksource_register_hz(&stm_timer->cs, stm_timer->rate);
>  	if (ret)
> @@ -314,6 +315,7 @@ static int __init nxp_stm_clockevent_per_cpu_init(struct device *dev, struct stm
>  	stm_timer->ced.cpumask = cpumask_of(cpu);
>  	stm_timer->ced.rating = 460;
>  	stm_timer->ced.irq = irq;
> +	stm_timer->ced.owner = THIS_MODULE;
>  
>  	per_cpu(stm_timers, cpu) = stm_timer;
>  
> -- 
> 2.43.0
> 

