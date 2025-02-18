Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA97EC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 20:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fp9kbQyOKTPnkkb66ovZCJuS5wfhcmXlwXbA1qB2SIo=; b=TA0o+3gtmIc0p7TvacYPhs8R54
	zJK8Y52TzAWCFLZi18mkxlXxAQcN72XAJT3jW9+0bDroZGAGOSrO7/gNAZ/uSQzQJg5i7c+kZoETr
	qv13QHaT+4bgf6DPxUaf4SzthC4czOGfs9QcglIUv025LP/bFyBJ8JvaKU54MNS5AtWNCFurQX8vo
	T5sWsyZuWp6r2E6w2si4O6J5HWoQvH6zrpT8oGsmtrhi2zABFo+ENZQRfPcaHtJ5IE6TzuYqqm7PI
	As6R04fju8igodmcMSegRjQahReEuTr+2mUYwPPkwbVOphcf1T/ZM/4fVKqNkEMuuudNnpewfXb+L
	ySdpdCPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUb1-00000009s2J-2mjK;
	Tue, 18 Feb 2025 20:53:35 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTz8-00000009iqz-3ztP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 20:14:28 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-220e989edb6so119117945ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 12:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739909666; x=1740514466; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fp9kbQyOKTPnkkb66ovZCJuS5wfhcmXlwXbA1qB2SIo=;
        b=J2oIHEymaO8QmJ5EjmPBFJc0tQAQflb9NwVM6PIQuf5t+KMDTwmseljXFoE4Fb8RdA
         YG5m6PVmAK3TqMDXdlKsYHZi53ARMjOd7KeC63hlnuHUwoq36j9PLZ07JqYAeQFM61xC
         TXx0QX/sV6WjikZJFuvjQrALccFK8ZrZU7QcRgWUU/sQ26UlpN9wjT+1zzI7tV21RJ5Q
         tx22ANSef6SH2Mf2F5pDzt3HOFLRPmWW0r19ctV6JVDC0Qfl5dpLXcBIzdxwzRHDlG5u
         n+VsQBF5atkbDt91neNlZfHTpt17veyUyzbJKEcwKyqH92caVgG9nchxagYpntEcB5cZ
         3UOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739909666; x=1740514466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fp9kbQyOKTPnkkb66ovZCJuS5wfhcmXlwXbA1qB2SIo=;
        b=p8T7pkIFo4qBS85+WwW0nRS8rH865icLv2pnRbsT2Esj6iJvbykVlExKUTq3p85KfX
         N05AxqnbvV9+EjVhFeq57hE3n0OUH2jCu1p05vqYiwwlyTjZDcoMzJQhb9PI0K52ts/9
         dJzGgbSQNXEbMUNI63PmZywTPamFkDtcj3h0Rvc8Qn6cXw037BavbKNAJ2hSOd/ml1fs
         swOlRAKWQ06extE7B0Z8KqdGkt3D0R1WlHBxPWnp6jqLRAwyVsgr4NOZly5rh0/rrS9S
         GaitZrGnStCokyF6E+y6IsiaGDW5KBf+H19cqbRscU6wVVX/8VKeaJY3fsuioculMfad
         rgZw==
X-Forwarded-Encrypted: i=1; AJvYcCUy/khYTauVbenyBtfpcO04CDOjLRvpXc9jVHLiwyzCJCqFqQ9cFGmKAfZX2o8fmfkt6UvPElPQHHJqh/FW5bph@lists.infradead.org
X-Gm-Message-State: AOJu0YyvbOHDEbWpNrmWfwUlWp8RHp72jEwoyQmDFyE1Bxra9xrjdkyX
	r3Du0Qs8d5KJja9Xat5r5b2IPo6eYWJIAOKccuXhUprHtpetuqRU
X-Gm-Gg: ASbGncusm0VZLO/liHiJm5L7AHAOn6G6cowfgETbYbp8T4Y2OmfwIIWNX+IaY1FD6Q0
	ghNURYz49VZZAAKINt55kIuyhlvmAP1z0yKhIdk/G2FpZX0j+D0MBj6No2QlmXIcSMJ+9C9mqn8
	dnDzM9L/AnxKph2thQpgTY5Zc3NSAkUJtwPsaGTQbFeOEnV+p1Jug9fqAoCia1UAfAO5o8Hbacw
	g8qPzYEF5molz9XS/jiW5L1uDOwRfGtMnqEiqILLcmrpJhhqD6FkUUnqedg1YmYJ2SW2ewlmZgP
	//49Ss+/NMzilHc=
X-Google-Smtp-Source: AGHT+IE4y9RZsLl4ZPEhoolF6Dek2f7wBe/IvlnSACVwxT3sFshBI66xUkRrjGVcxO0wEb4QnWLcXw==
X-Received: by 2002:a05:6a21:4cc7:b0:1ee:b8bc:3d2f with SMTP id adf61e73a8af0-1eeb8bdbd8amr13685875637.4.1739909665586;
        Tue, 18 Feb 2025 12:14:25 -0800 (PST)
Received: from localhost ([216.228.125.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324277f388sm10896504b3a.174.2025.02.18.12.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 12:14:25 -0800 (PST)
Date: Tue, 18 Feb 2025 15:14:23 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Beata Michalska <beata.michalska@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
	sfr@canb.auug.org.au, ionela.voinescu@arm.com,
	linux-next@vger.kernel.org, sumitg@nvidia.com,
	yang@os.amperecomputing.com, vanshikonda@os.amperecomputing.com,
	lihuisong@huawei.com, zhanjie9@hisilicon.com,
	ptsm@linux.microsoft.com
Subject: Re: [PATCH] arm64: Utilize for_each_cpu_wrap for reference lookup
Message-ID: <Z7TqFLU0Kwg9cUjO@thinkpad>
References: <20250218192412.2072619-1-beata.michalska@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218192412.2072619-1-beata.michalska@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_121427_017761_988AE4C2 
X-CRM114-Status: GOOD (  22.17  )
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

On Tue, Feb 18, 2025 at 07:24:12PM +0000, Beata Michalska wrote:
> While searching for a reference CPU within a given policy,
> arch_freq_get_on_cpu relies on cpumask_next_wrap to iterate over
> all available CPUs and to ensure each is verified only once.
> Recent changes to cpumask_next_wrap will handle the latter no more,
> so switching to for_each_cpu_wrap, which  preserves expected behavior
> while ensuring compatibility with the updates.

This is technically correct, but I would rather point that for
iterating over each CPU, it's better to use a dedicated iterator
instead of opencoded loop.

> Fixes: 16d1e27475f6 ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> ---
>  based on arm64 for-next/amuv1-avg-freq
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

If start_cpu == cpu, and you begin with 'cpu + 1', you will never
check the 'cpu' for idle, right? Maybe like this?

        unsigned int start_cpu = cpu + 1;

> +				}
> +				if (!idle_cpu(ref_cpu))
> +					break;
> +			}
>  
>  			cpufreq_cpu_put(policy);
>  
> -- 
> 2.25.1

