Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D060D13590
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 07:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfezvlEpUor+6kVtO8K9KtmutpWAUXlWNawX08ky9NY=; b=4+xTojwhWq1JxeGIxvLPIh8zty
	EYAFCw1fvZUpg04u/LyYHubqDkHAcw59kWGOa/XXvCfZkdfylRPURdppv92Xw7S/+pKoinLpiUHDz
	aP3NO9BYvByP7DOhy5KUROGDUAI6WZAyCAieIvzJvksbS8XU5y/1lWtRGIENiahqe+bh9Qhw7S1Kh
	m+LTgKRqPis8NnkcpGjKGHCzER3c0oijTL+zIngB90rkCiz/Kt1BASuaugvUMIj5/gSGSTOV69mnx
	mujx0Y3AaZQjKXflYhJQG/LEtUAY2jPeosnfNqzwBSZoecq1Y44vtwck/com2wvMWAzvcZ5fslqwn
	O1PtL4+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gQJ-0000000DSf4-0m7r;
	Tue, 29 Oct 2024 07:13:51 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gHJ-0000000DRKu-0TkS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 07:04:34 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2e2d1858cdfso3614125a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 00:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730185472; x=1730790272; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QfezvlEpUor+6kVtO8K9KtmutpWAUXlWNawX08ky9NY=;
        b=I7Teym7ZUWrgmP8aQ5C0SaC5ftvxIfW8/b7BWK9Gdar9yz0FiJ7A2bPHGjhCkQqT8M
         lfLfAtb9DGcHWcOUjRdTJArqS4oIMlTCTj1QDqx5r4e//nQb6qus99Wb1ZwNCbsd9kHe
         DVQeVRUlVZvfOn8T+dJdyTyyXTAM1D9I7HHakdOYneKH4OsYbSbckXbWDDSlIOScP2Ug
         j20RTBEkXuZJ+aEdO0zQRwI1tqfKgfGgms+AJa21CpsKDirbqrmCa1AgUy8+QTuJQqVn
         CduX5C4m6cl/lnlsmY6EI5xtluexYyhp3kawMFlj4y3+dgsNh/0seHle8+fsO9p08CAw
         uaNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730185472; x=1730790272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfezvlEpUor+6kVtO8K9KtmutpWAUXlWNawX08ky9NY=;
        b=ogokCjfAD87piQYANgOaTdNN3oA1nvdsRvh3LOryVMT38Pf4vIsUsaPRolyA7495K/
         cGAquNGfUHtLh4WmAcPnkS/skNU/WZXYBGbjG6166TVeHNZoMyeqWf38PokAHJtefUU4
         v2czpn78P/ufkOa8ozlBUy49VNriblVsKe9SgRaGv5Ly/Mb71A+DccxnA2NutY8lgSS3
         W+EOLHUHRovGAiXDjSB2qm06H3VhrMd3+IpqQpIiMHeYN23aTK0CK4U5OJiZzH/lc9Id
         g4vmriWC/Zv6vVsHEbTomNgXSwZqZauvyTfH3glOZVMHl6SlebIYjjkz+XU1Uwbk6MEP
         0/yg==
X-Forwarded-Encrypted: i=1; AJvYcCUPaeQ/OZM0G8FqTjM9/iq/2h55JQbZhA83E/q5s3wh63CKt7z7dAQPHwXhgtSQQ1nA15zCUOYPXi1ux5VqppMZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxjv+bS9mnaUO0I/pGVqwCAsQ8/nQyPEvn53N+VYqG3B7Xq80rL
	VXKFnqDz3F2uYZurb07JxbrPnTfQuKBNcIJFphm11tbMLCkrggr4DEOSiDsKHMQ=
X-Google-Smtp-Source: AGHT+IEAtGrYcgaJcMZnxR7XFpG1XzMaaIW78Qyci9zH3p9A4VM2ySX803U/IA4Vmiqs9wsvnq89/w==
X-Received: by 2002:a17:90a:9a8c:b0:2c9:9658:d704 with SMTP id 98e67ed59e1d1-2e8f11dcf62mr10274984a91.40.1730185471912;
        Tue, 29 Oct 2024 00:04:31 -0700 (PDT)
Received: from localhost ([122.172.85.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e48bb69sm10767253a91.1.2024.10.29.00.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 00:04:31 -0700 (PDT)
Date: Tue, 29 Oct 2024 12:34:29 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Beata Michalska <beata.michalska@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, ionela.voinescu@arm.com,
	sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
	rafael@kernel.org, sumitg@nvidia.com, yang@os.amperecomputing.com,
	vanshikonda@os.amperecomputing.com, lihuisong@huawei.com,
	zhanjie9@hisilicon.com
Subject: Re: [PATCH v7 1/4] cpufreq: Introduce an optional cpuinfo_avg_freq
 sysfs entry
Message-ID: <20241029070429.m7q5dkumitoyqxq2@vireshk-i7>
References: <20240913132944.1880703-1-beata.michalska@arm.com>
 <20240913132944.1880703-2-beata.michalska@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913132944.1880703-2-beata.michalska@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_000433_179478_51CFEDAD 
X-CRM114-Status: GOOD (  21.12  )
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

Apologies for the delay from my side. September was mostly holidays
for me and then I was stuck with other stuff plus email backlog and
this series was always a painful point to return to :(

On 13-09-24, 14:29, Beata Michalska wrote:
> Currently the CPUFreq core exposes two sysfs attributes that can be used
> to query current frequency of a given CPU(s): namely cpuinfo_cur_freq
> and scaling_cur_freq. Both provide slightly different view on the
> subject and they do come with their own drawbacks.
> 
> cpuinfo_cur_freq provides higher precision though at a cost of being
> rather expensive. Moreover, the information retrieved via this attribute
> is somewhat short lived as frequency can change at any point of time
> making it difficult to reason from.
> 
> scaling_cur_freq, on the other hand, tends to be less accurate but then
> the actual level of precision (and source of information) varies between
> architectures making it a bit ambiguous.
> 
> The new attribute, cpuinfo_avg_freq, is intended to provide more stable,
> distinct interface, exposing an average frequency of a given CPU(s), as
> reported by the hardware, over a time frame spanning no more than a few
> milliseconds. As it requires appropriate hardware support, this
> interface is optional.

From what I recall, the plan is to:
- keep cpuinfo_cur_freq as it is, not expose for x86 and call ->get()
  for ARM.

- introduce cpuinfo_avg_freq() and make it return frequency from hw
  counters for both ARM and Intel and others who provide the API.

- update scaling_cur_freq() to only return the requested frequency or
  error in case of X86 and update documentation to reflect the same.
  Right now or after some time ? How much time ?

  Rafael ?

> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 04fc786dd2c0..3493e5a9500d 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -752,6 +752,16 @@ __weak unsigned int arch_freq_get_on_cpu(int cpu)
>  	return 0;
>  }
>  
> +__weak int arch_freq_avg_get_on_cpu(int cpu)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline bool cpufreq_avg_freq_supported(struct cpufreq_policy *policy)
> +{
> +	return arch_freq_avg_get_on_cpu(policy->cpu) >= 0;
> +}

And why aren't we simply reusing arch_freq_get_on_cpu() here ?

-- 
viresh

