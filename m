Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5043AC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 19:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vH5HFKaawkeYnTHXne+k2M6Gi4L64IdQGTcUjzfy9HQ=; b=VtMn9TtgBVBrVIU+0h9lH5lSy5
	WZVy22Lro95HakM/Q7TqYrJn91BQHiapYNUIH8rxzcuJ7qmm0eeyLhkfNLAPE0ZHRxMshNhQNHpkj
	9M3Cpi/kiAgiqWypK7PcELBQoecKTzpdl5Esuku7ZmJkARayZ1blLVZjd+R7RCL5F2f9mxRJsdDDb
	hM2VBk/II8jHMIgVQVo0dc+2C8BTu+SN8CS+DwydXz2vJ+LYeGGB83xEVAub4V6PfMTD4IcSQ4s8N
	AGhL6Hh1jyWSsNkt3lUDvY8f8Tl329fuS+OmQtBrR0M5NUVqV4l6qEF8RuKQ78at+m2+JE6ms/zBv
	DmdaireA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYKu-00000006bCR-2cC9;
	Fri, 21 Feb 2025 19:05:20 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYJQ-00000006b1i-44rJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 19:03:50 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-220e83d65e5so49239145ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 11:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740164627; x=1740769427; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vH5HFKaawkeYnTHXne+k2M6Gi4L64IdQGTcUjzfy9HQ=;
        b=KQJuw5rAOS3M+ZWR/pTbkmUg9T9zn+VdsP0I96rrpqeHE1/Bj3EFBBYMJDh5Dny9xz
         GGkGDiKsUME744pS1MK8xUhserWIUToOGj9GtjyPMNSXcdJZCWe/rbHo4FzbwV9dF0Ot
         iLdZ9t1YveGJ+fzEbdF/AEZx1ItWcnfM6gnKFBZEXaWM4CKwyFIwEibaVRg6lp2+RpUi
         obVkSRtQFaPicGtQpf6JV12mVEEhHaJRLIKZGM1VdiAbxscfCvFr174L9n8omB5jxFcO
         AMSEB7Hdf95i9qCLtr0lBijNEfNLLigIZp3MZ7kG6xCuf2DgyXvhNJcvBCRDtJu7c5Kk
         QiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740164627; x=1740769427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vH5HFKaawkeYnTHXne+k2M6Gi4L64IdQGTcUjzfy9HQ=;
        b=OUgbP0etBOEwokrUXZ7Lg0uDpk0ZmQrzxkH4sX3nKPogObPN3g2iPP1v1WCHMjJCB8
         GYzrNHFqT7nYlX3btugjAIgzned2uva9FSNdRsz1quYZIfN64rasqQ3FhRTT69Xoccso
         fzTCSDOpNng4hFRgqRL/tbpd4UzPYhwq2FDqBn1Zfv/pQaCDxUrezrB0WDZ+rlO62ypL
         MHb+ph3PhggVCHJlbJZxk61T/qeQIJOpQF4pJfwzuS1xCivfdx3FosooLdBLCVkuIZVe
         rDyIJfauCMBz0SLQH1EBGKbCTuk/wbGIqhNOjDXz1WdL+VwMuY6nNu9bQlhbRz4VdQqJ
         WXeA==
X-Forwarded-Encrypted: i=1; AJvYcCV1+CzeSiNjH0KHAVz6Z6yT/2UFrKhfWOB4B8YCTQlYJYAZ4AMNgE7NhEMWmiIRP12uTCvZKQPfo3ep0MsSyoMK@lists.infradead.org
X-Gm-Message-State: AOJu0YzCITdV6AbpHnsPymf5acqvgzHJ07rAhOBXh8tKjhCvAJnT4W+r
	2JQgDKsjwDJi602tGKXa2KLvU6OmqB96NJVo8mUpNNn1Xl0GkxbF
X-Gm-Gg: ASbGncvz+T7/SM4LLJSif5WmLFSYo9ktla0KDqyPIH84JY73sakCa8WcMnqYQqTBAFJ
	ymllTMXdy6BqZOqlPwzvJGSTjfMHcXfKjSjIFEthQNlYYOUkX3CUGhn7gS69XoYPxen/6rbuQyE
	9atXX7dlfsUuR8KoeNB/fWUF3KXl1IKkw1ASCsKgt4vEQd4iS3RxXpGzVMn6SkKgCLuddx0fcjp
	a/ljUlKyKvJg5nR/z6HpmveIW8g+pI1z0rolTk1JDdMaxi1aKu4ZUijfwyz0lvioR/ZB37GFvI6
	gGRUu6aDcjxDtaxFuLZkw3WlFQ==
X-Google-Smtp-Source: AGHT+IHdmbG5cRGpHshEwzmBxgJqyw7H3qrw+xRtwNe8nI+Hjc2ysty4thRXFYYFyK6ggCpp5W52Tw==
X-Received: by 2002:a05:6a21:69b:b0:1e1:aef4:9ce8 with SMTP id adf61e73a8af0-1eef3d87138mr8755556637.28.1740164627344;
        Fri, 21 Feb 2025 11:03:47 -0800 (PST)
Received: from localhost ([216.228.125.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73264729945sm12838710b3a.179.2025.02.21.11.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 11:03:46 -0800 (PST)
Date: Fri, 21 Feb 2025 14:03:44 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Beata Michalska <beata.michalska@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
	sfr@canb.auug.org.au, ionela.voinescu@arm.com,
	linux-next@vger.kernel.org, sumitg@nvidia.com,
	yang@os.amperecomputing.com, vanshikonda@os.amperecomputing.com,
	lihuisong@huawei.com, zhanjie9@hisilicon.com,
	ptsm@linux.microsoft.com
Subject: Re: [PATCH v2] arm64: Utilize for_each_cpu_wrap for reference lookup
Message-ID: <Z7jOEFtVtcuMyjjt@thinkpad>
References: <20250220091015.2319901-1-beata.michalska@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220091015.2319901-1-beata.michalska@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_110349_015661_EF08D7CE 
X-CRM114-Status: GOOD (  20.83  )
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

On Thu, Feb 20, 2025 at 09:10:15AM +0000, Beata Michalska wrote:
> While searching for a reference CPU within a given policy,
> arch_freq_get_on_cpu relies on cpumask_next_wrap to iterate over
> all available CPUs and to ensure each is verified only once.
> Recent changes to cpumask_next_wrap will handle the latter no more,
> so switching to for_each_cpu_wrap, which  preserves expected behavior
> while ensuring compatibility with the updates.
> Not to mention that when iterating over each CPU, using a dedicated
> iterator is preferable to an open-coded loop.
> 
> Fixes: 16d1e27475f6 ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>

Reviewed-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>

> ---
>  v2:
>  Updated commit message
> 
>  arch/arm64/kernel/topology.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index a09b0551ec59..9e3583720668 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -254,7 +254,7 @@ int arch_freq_get_on_cpu(int cpu)
>  		if (!housekeeping_cpu(cpu, HK_TYPE_TICK) ||
>  		    time_is_before_jiffies(last_update + msecs_to_jiffies(AMU_SAMPLE_EXP_MS))) {
>  			struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
> -			int ref_cpu = cpu;
> +			int ref_cpu;
>  
>  			if (!policy)
>  				return -EINVAL;
> @@ -265,11 +265,15 @@ int arch_freq_get_on_cpu(int cpu)
>  				return -EOPNOTSUPP;
>  			}
>  
> -			do {
> -				ref_cpu = cpumask_next_wrap(ref_cpu, policy->cpus,
> -							    start_cpu, true);
> -
> -			} while (ref_cpu < nr_cpu_ids && idle_cpu(ref_cpu));
> +			for_each_cpu_wrap(ref_cpu, policy->cpus, cpu + 1) {
> +				if (ref_cpu == start_cpu) {
> +					/* Prevent verifying same CPU twice */
> +					ref_cpu = nr_cpu_ids;
> +					break;
> +				}
> +				if (!idle_cpu(ref_cpu))
> +					break;
> +			}
>  
>  			cpufreq_cpu_put(policy);
>  
> -- 
> 2.25.1

