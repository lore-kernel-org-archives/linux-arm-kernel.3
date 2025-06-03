Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEEFC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 18:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QOHtIjIllleG5NXeGwEB/iZNkovTPGk/XQvSsFwTJgY=; b=qzx1ZCNHPsf3VSsc9TE8wz5pNS
	Bc446TzxhEqVpIoDtm6yAkQLa9VmhAYowKDVfRX/MthewGzSt6kp9aq9j6SmPz77XwvoAgFeScd5N
	Y96TCYDp/GthBXon3KTTEtyylhsRwhoEc/Dm10t+bRPbNexm7bcUz3JjO40HXaxSHJNuhg5U3HCM3
	nW0sj1Mh+eMk6bmWgBOk7aqy8vYPguC9SpNIuq3exyCUrh6m36PBWdUm5L3TPlo3EZZ7GNqV/3qP/
	nxNZelZy1k2UH/CWX+WYgtTI23x3vaVdyi+rfuJNYTRxT94hijCNjD3b6cihrBtnrP3rGdLOpHm2p
	ooUpa1Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMVwv-0000000BXhb-0DmQ;
	Tue, 03 Jun 2025 18:01:21 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMVsp-0000000BXNW-0jel
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 17:57:08 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-747e41d5469so2709891b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 10:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748973426; x=1749578226; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QOHtIjIllleG5NXeGwEB/iZNkovTPGk/XQvSsFwTJgY=;
        b=zwSmC5gpmKmMytw480+RKwTRODezvxpXzrR6sd9uytHLOZ5OmthwZ9ygeiPGiZU50j
         PrimK3fryiHji3jaineNS0r0jfxxPSTNNU6EtZg+ucFicP2qBI9yo6FEz6pfkrXkYHYf
         XJS1evT58Zte0u8kfyY4zKoag8W7A4cSulhItVwQmv0kmmpPdVZqXAZRVArWVO6dEU22
         BKY880c0tKnbSRMgy0bB7DYPkHN9AGHP8cjDeJ856FC06pYNn0gcX8p0erRBcGaZfBHl
         KYZ7lJlJSEvTpPomuSEMTNdfRS0PsOX4BNULec65k0VxcZe9Z8EgKzlGW4Azl61KDmxQ
         f4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748973426; x=1749578226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOHtIjIllleG5NXeGwEB/iZNkovTPGk/XQvSsFwTJgY=;
        b=qCAI2QXTjNTJsmqXy3irkPL3yGXgs0eH/KqMp3UenXMUK4B5XMBOBFrtam1PqHkvz7
         oJGPD9wRkiJ+nllBTvncDio0HGBqn0pBsS5WJa3fZOfEsy+JdeDhOEdCUJCR1vlEjnSH
         cedmxDIAzu9HmckVhP0FNg2Nb8UOHweJ/SKCU/lIv3sV0SKSjN2lGg/B7sHMHoNz4iHt
         NrS1/HX4ZoAB3FtlqO+ISQ1Do6Tzu9uubYPcWqNCQ2RbdmrEcYPPS2odC8RR74nK63nH
         aLjyrrFmdhikoeqZEawza2Qu/sDP0d1PQ2kkSycxXeCbVdPIwms+WxU/nMDWSPkMrjsJ
         6KwA==
X-Forwarded-Encrypted: i=1; AJvYcCXeOBtF/l27AzZUHGnLTn4cI86GAigbgRoUGwVc1rV75qPQgYNEdjqqz8CyoX67VBe3dMse6SMMGHiNbXeFA3OD@lists.infradead.org
X-Gm-Message-State: AOJu0YxkkMWRd7mbyR31zVouGUlLAAUqD3kBNXOIuZPHvy0Jr9CtkWQl
	1Z1F4UkJGAsFln+vZm3GQJrCH4hCWu3ozuT6VxYdGu0WATqnM0eqNa+i245C3t2f5g==
X-Gm-Gg: ASbGncsKVGF1NyvOQdNFjQ0JBJy4V46vW/i/CzaaLlTDu9UTCKq0OLXe+3wldXtwmx8
	hvAR83D3OqdFzDllSNgVwbUFr4WIkHRuon4KjkpuVP5vFglSbFCMEdpeKwV4RYzBKh1n5sr73FG
	9bw4F6XIWhy5AE/9xBSvXPqoWAGLcQ42EY0noSlIn897pmSiaXKvJ9NQI5Sw+JTv+mQjwxkidXS
	rVTsRumGZjTOY7A+VY7Utk/a/ZjzpjWXy/k9yPVDLZNfhQaPb9kbRLG8X2CzRcZsb1JRzoZs0mh
	JZ3DJYTFmgcd4N1PHdL3L7GMtouzdUlJ14LL8lOHTUtPf/gWnBGjo0ZAYCLg5mGCVrzMhpjvqf1
	gMuvBmsKvEfdFCtnGTsSmxP5Zw9g=
X-Google-Smtp-Source: AGHT+IFJjRiNTfrHUGA38dJeGT2+lFGgu3T7p+sKAbadh5LPG+wdrTfumVyLbKsTRptWC4Rroj128g==
X-Received: by 2002:a05:6a00:3d12:b0:737:678d:fb66 with SMTP id d2e1a72fcca58-7480b1f3b1amr53928b3a.5.1748973426129;
        Tue, 03 Jun 2025 10:57:06 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeab4acsm9633273b3a.43.2025.06.03.10.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 10:57:05 -0700 (PDT)
Date: Tue, 3 Jun 2025 10:57:01 -0700
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
Subject: Re: [PATCH v1 4/7] clocksource/drivers/tegra186: Add module owner
Message-ID: <aD83bbyEPKSDXv_T@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-5-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-5-daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_105707_223049_C6422F87 
X-CRM114-Status: GOOD (  20.13  )
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
>  drivers/clocksource/timer-tegra186.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
> index e5394f98a02e..56a5342bcf78 100644
> --- a/drivers/clocksource/timer-tegra186.c
> +++ b/drivers/clocksource/timer-tegra186.c
> @@ -373,6 +373,7 @@ static int tegra186_timer_tsc_init(struct tegra186_timer *tegra)
>  	tegra->tsc.read = tegra186_timer_tsc_read;
>  	tegra->tsc.mask = CLOCKSOURCE_MASK(56);
>  	tegra->tsc.flags = CLOCK_SOURCE_IS_CONTINUOUS;
> +	tegra->tsc.owner = THIS_MODULE;
>  
>  	return clocksource_register_hz(&tegra->tsc, 31250000);
>  }
> @@ -392,6 +393,7 @@ static int tegra186_timer_osc_init(struct tegra186_timer *tegra)
>  	tegra->osc.read = tegra186_timer_osc_read;
>  	tegra->osc.mask = CLOCKSOURCE_MASK(32);
>  	tegra->osc.flags = CLOCK_SOURCE_IS_CONTINUOUS;
> +	tegra->osc.owner = THIS_MODULE;
>  
>  	return clocksource_register_hz(&tegra->osc, 38400000);
>  }
> @@ -411,6 +413,7 @@ static int tegra186_timer_usec_init(struct tegra186_timer *tegra)
>  	tegra->usec.read = tegra186_timer_usec_read;
>  	tegra->usec.mask = CLOCKSOURCE_MASK(32);
>  	tegra->usec.flags = CLOCK_SOURCE_IS_CONTINUOUS;
> +	tegra->usec.owner = THIS_MODULE;
>  
>  	return clocksource_register_hz(&tegra->usec, USEC_PER_SEC);
>  }
> -- 
> 2.43.0
> 

