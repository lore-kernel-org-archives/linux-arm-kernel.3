Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F18C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 17:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/7/m0D4YkX+17TK5YiYf5mx7eZJqJi8ta4T/kaVg1c=; b=xNSbProFXRxtVnmk2dR9clmm0O
	B2fM8MKtpDWdJeSRMZDZ8OCGbusP/U3BGhqqiLIjgB4XwNiN5lB3ekDZBktAZ+90TF1CgdQlVgpKx
	yIxFqdRBXeiLbzqBAcQJt+YC3hbZ6up81907ucWiWsoerb5nfnU92rtcr/2mopfXCizScaxo1G1No
	PpzNOMiYAPwl4ax0RtspKOSmhhLihVmvnPLsvapBVJIcwFa3VR58WalG38u5qmiLFwjv2ncYsiAwW
	kuztNBUmj7sKTk1hoerlM65xDmtI3IM7kj4cb3sWE4Y65HIrwrqW4b3O5EDUOfqajnxwVerbRAtee
	+eWVn0OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMVsd-0000000BXLM-2m7p;
	Tue, 03 Jun 2025 17:56:55 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMVqR-0000000BX3T-3YPZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 17:54:40 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3122a63201bso4568887a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 10:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748973279; x=1749578079; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R/7/m0D4YkX+17TK5YiYf5mx7eZJqJi8ta4T/kaVg1c=;
        b=w8jQMwqff4q4Gqubt0KVAwV5trPAxQTtBadDYKEwF43kgXKqbOzyXLS6fDQ5/eHJEb
         VSPT4agIYtgt12SmDMc9gjNKR7HxLURsbnW6pgXugIFOibJt4DWHqKRfUwWz8k6AN5ZQ
         W0cRsgceBGAbpaAaNYY8Krt+BGk7BLTiIwZHyCAlzOA1cE2jRJtTI9BH4WILigYOtKNt
         Zv8Ij480ettZG4uF3/5gXlgPwwhAJ2+eNSMSDfoBH4qotBqtWRorq1G2STcRAUmXaeXw
         Lq6Tsu9J8wGE5CGvwDAR5g28a7Aj0avnQGcQBKY8ezDiv6x/tVkMzLz58YV+ST0VzMvK
         NUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748973279; x=1749578079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/7/m0D4YkX+17TK5YiYf5mx7eZJqJi8ta4T/kaVg1c=;
        b=Lo2loMrZJPsxryvHx2mcfa3TLD6JeG00x1JTBMBThA6L7K2J2glDaN6whi5uyLx8cC
         UHNBmbW65iXMRajbY3pLoMCZ2k/FafmZgCoKu21mQ9vtA3jC+Cu4vc35YPTNcnTYIlrD
         UfuJVOp0A/IKJQ77Ksi7o6xiBaiKOH2DggPAozyz2vnV+nL1SN63zt3W9Rs48hQMWEC2
         HKL2CazC72db46Uid25J5801eFieOvJfEteRNOOx3tbtsRpqa78NsTVRx26xcUxI43/0
         phMyvfArjnnkc5XiWnZciMlQaGYveYh2ApEtmIUlLLMwsb4bwfcS+MIrgDwuJp/ge2lr
         5Jew==
X-Forwarded-Encrypted: i=1; AJvYcCUmu4LuW9tQZ0D368YrZPmj8ZmRX7LH/NzD5uWWHt6hTUpVXJ/N9HQolF6SrEy/9Kr1cWtwtxH4bbSa3BK+ubrC@lists.infradead.org
X-Gm-Message-State: AOJu0YyZrPEMf6q+foGphqsY6+qr44KRZx3pNBou0gyxEdxvAeZU8NGT
	Ph2ARS3zZkzw3K72LBiHHfNlYMqvwAPa/onCSJKK5Ynhy1ZdqP0zkLUamLzoOgHtFA==
X-Gm-Gg: ASbGncvHtHEyTs3NZd75kP3d8RXYCRnPAmsV779zg9VtOSN22h/FentaaPBdwk2DlWk
	DKnqG5W0e01YaOcBg2NO+L50qCcDMuCKEQYODbuMVRY0RSZlXxQ29jsU/XXPwFImesRPKSMSY0t
	PcMqXBLD04TkE3ystXLUQoeoiHdUwY3m/0pyL61Xq2kFVfY65mX0qSRQU9Fqztni7MY/USUVdcv
	y541VWmpdonML4cpx7mljjDoY25rPpt4lso5wSqSt1Gy+Xr0owMceVm6Rb1H7bWgrg5jntBgs4k
	iT4vRwgkPQo+BNesf4bbh3hWFpXeGTn9EEXy4WfnA8hGTH2iIBg+0Ix8zCL83hlz/1nZIbTNIJO
	AIQ7Zpbug38ld2oGc6oJt1YwaOdI=
X-Google-Smtp-Source: AGHT+IFTvlmrdVshd5QxHXcEQ6MKKQjAV8TvJ2nBjRVCK5/HXrreUCJZBUa7P7G7vUU+2pvwwgQ3Ww==
X-Received: by 2002:a17:90b:55cf:b0:311:df4b:4b8a with SMTP id 98e67ed59e1d1-3130ccf69ffmr22034a91.3.1748973278786;
        Tue, 03 Jun 2025 10:54:38 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2e9474sm7517618a91.29.2025.06.03.10.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 10:54:38 -0700 (PDT)
Date: Tue, 3 Jun 2025 10:54:34 -0700
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
Subject: Re: [PATCH v1 2/7] clocksource/drivers/stm32-lp: Add module owner
Message-ID: <aD822umlHEamq_bA@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-3-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-3-daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_105439_885184_C2489F2A 
X-CRM114-Status: GOOD (  19.66  )
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
>  drivers/clocksource/timer-stm32-lp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clocksource/timer-stm32-lp.c b/drivers/clocksource/timer-stm32-lp.c
> index 928da2f6de69..cf1423ca00d0 100644
> --- a/drivers/clocksource/timer-stm32-lp.c
> +++ b/drivers/clocksource/timer-stm32-lp.c
> @@ -159,6 +159,7 @@ static void stm32_clkevent_lp_init(struct stm32_lp_private *priv,
>  	priv->clkevt.rating = STM32_LP_RATING;
>  	priv->clkevt.suspend = stm32_clkevent_lp_suspend;
>  	priv->clkevt.resume = stm32_clkevent_lp_resume;
> +	priv->clkevt.owner = THIS_MODULE;
>  
>  	clockevents_config_and_register(&priv->clkevt, rate, 0x1,
>  					STM32_LPTIM_MAX_ARR);
> -- 
> 2.43.0
> 

