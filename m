Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F14C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 18:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oio5+oLisctncuh+HzW9YUjFC1egO1KiH1XNbWO+K7k=; b=qn42SH+cRrue0SNnNsB5NtoQfZ
	lM0yswqVmWUT5SqPn3bicJwZb05MO0xLSLbwRoFn9A2RVcWOo/5cu463jl2OBenxgPiP09w9ufixS
	axdTfoi7wcfF4naKRc6nMZjjiWDHLCUUHQYWQ2SurLIE04n2w2n+73LpYNIpD9y7+YYh1f6vQEhWa
	uHNRzWLZiz6aJSE83UvRNFfZXVxAHYtQSwN2o5hlxbR2UOOo+AGLMNgQvOTdx2RTmUB84YYa5gPck
	MEEfPckMz9hIfa+7Dl3BPKS0Cpg0qWzPxSB4vYu15RMOnxwJjr3J0Dl1P3icujIVE3kD/KxCH7Zgm
	a01ASDzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMW3L-0000000BYMl-0rdd;
	Tue, 03 Jun 2025 18:07:59 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMVx6-0000000BXit-1gAm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 18:01:33 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-311e46d38ddso4730597a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 11:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748973691; x=1749578491; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oio5+oLisctncuh+HzW9YUjFC1egO1KiH1XNbWO+K7k=;
        b=ajmpq5Cwi77Dft4pCPv8Fy02Yrlesm7EXgePS/1y6St1vfSbfKG9qIOHgG/1BXUnO1
         H4iPPxVH4a/VkvzRYPUTwgqNK04Q24yXlQxt14eFbQWL68b8wJ57nzfXodfR2cZXIbVy
         TTUlqHEahQgJY8fCDyiLaaj3SAkdDwInJUGywsrHQfqamt5ic0qyDDvbz4EZryjkzlkC
         JkVB8kA+hcdl4oTc2tV/Bz2j80+1Kk993rtV4Yxt3kHmKFesbz5/qzm0iOPtihf5L9D/
         XWFgm/NhUuEL8EkLdHEovVfqmGEY4V63Het3y5iRfpYfUkJkj35YsNNQ595+Pv/Jl2So
         f/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748973691; x=1749578491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oio5+oLisctncuh+HzW9YUjFC1egO1KiH1XNbWO+K7k=;
        b=VyPrdM/IZtJ+zXkPSM/ryAthuwlopfwV0aR73WambhnujJVHSZDmQPH1MVkeIlKyQ3
         h79shOMV5J/zpniGQvz5Dq2qKwn23hgrjI3amogk9WA5XsI1q1+vNzXfz62kVlskLysA
         ZGmiRO9ufU1nphPEs1JvKlWucFCnL6MaxAgffFx0++pIju8rGm71MXUVxhnHXTtj1fdY
         +9c51W1gA3YvSO7WVujfVSZmH2mOTcFaq0dZFaB+m/atJGF+EaF++QgLNjRG1ZuG8Y3c
         KdDyTbWMYsDDv/LdCA6Drh9wF9BrAzv0IkotKrSMAieVLPek4hmcatgq1ENFymEnPsdM
         ExXA==
X-Forwarded-Encrypted: i=1; AJvYcCUkKnoYLzYHWR3wk+cYS9RSNnlTMkP+q1f9GxJevOuX/yrYfThHCSI3uNTHfvCM/Jn9Vj1nkLMdJO/VU7JclDbr@lists.infradead.org
X-Gm-Message-State: AOJu0YyIMiW/aVI4fotc8mYi5eNxwOz1y1UO5Z5dP1lKxm9m5BdHLZKJ
	rxlZHxYBi1KTD/Cww9L0LvZIu3WcKDcQA1dMh2awCbu0kP7GFkQce2t1YJY1Ib82ZQ==
X-Gm-Gg: ASbGnctXjgdICCb2jR+zTKRlzWtbbAIXDt0vtrolqf3HC9fSACV8LP945Im7MMFzPdO
	xdAQMDFd6F2zRtPFSrnvfB/6ptdgfF7G8G+2VqJmDadh39W2RjqB7JxzPzoaRWhsecNm7gNtMT9
	QgbXzHSjN7n9f1fPUZvH8A3/WUyWFd9QzzepXFiEsCKWIP/7E5sIfbPEyLQ2A6sur6WO8pZzD2e
	yzg3Ogwp9xKscQAMeQ+ONAjqsn64zsZ0RqzC5btTuigQC8UTsWGRmAVU3I46GA/C07JynCMdVHF
	V2QYvY3HYoYCSox3QOBiLHEEkc96WkuJb8oEqu697o2PMSFCRdsekdTJ9H0DCz8jIDbgCXr8We0
	sQdMM8AELlTYVZD8m6TA72AyaHsY=
X-Google-Smtp-Source: AGHT+IGJVe96mQDhzEhZqYJnC27O9vMFUAoTp1xS/H2NANso8WpCr6YJ9fd9Q8qaZg1NI2W+7g1xJw==
X-Received: by 2002:a17:90b:3f10:b0:312:f263:954a with SMTP id 98e67ed59e1d1-3130ccaa125mr73097a91.5.1748973691331;
        Tue, 03 Jun 2025 11:01:31 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e29f899sm7572695a91.6.2025.06.03.11.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 11:01:30 -0700 (PDT)
Date: Tue, 3 Jun 2025 11:01:27 -0700
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
Subject: Re: [PATCH v1 7/7] time: Export symbol for sched_clock register
 function
Message-ID: <aD84d4WArf_terBP@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-8-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-8-daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_110132_444157_155A9615 
X-CRM114-Status: GOOD (  19.79  )
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
> The timer drivers could be converted into modules. The different
> functions to register the clocksource or the clockevent are already
> exporting their symbols for modules but the sched_clock_register()
> function is missing.
> 
> Export the symbols so the drivers using this function can be converted
> into modules.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Reviewed-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

> ---
>  kernel/time/sched_clock.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/time/sched_clock.c b/kernel/time/sched_clock.c
> index cc15fe293719..cc1afec306b3 100644
> --- a/kernel/time/sched_clock.c
> +++ b/kernel/time/sched_clock.c
> @@ -174,8 +174,7 @@ static enum hrtimer_restart sched_clock_poll(struct hrtimer *hrt)
>  	return HRTIMER_RESTART;
>  }
>  
> -void __init
> -sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
> +void sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
>  {
>  	u64 res, wrap, new_mask, new_epoch, cyc, ns;
>  	u32 new_mult, new_shift;
> @@ -247,6 +246,7 @@ sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
>  
>  	pr_debug("Registered %pS as sched_clock source\n", read);
>  }
> +EXPORT_SYMBOL_GPL(sched_clock_register);
>  
>  void __init generic_sched_clock_init(void)
>  {
> -- 
> 2.43.0
> 

