Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3FCCA100E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 22:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pvfyn6DBdkofRFQp6LMMEDWBYjJ0dblUgiw6XYH3Znc=; b=zZuPg/Q+O73+TQfZIKlapCDChW
	z6OwM3qeNV1AJbUV+Qn+QtkWO2JxSU/HCsXR5EX48aY2mq4KNU9lp2w2zcQ9ThDdkDeDpK7ptJN5E
	coCYBumtHw0aiK6tSe9JEuzMX9rJS1ibObVRQkq+zje7dLgawQW8KvhUZ04SWLpN36+RLWlfmzJU1
	W03KzzCsiymRu+Bb9HF7Ca4iFs6P780xbqM1tnp7khq6UXxanA6uaclXVXJzjC0+gVQhh4wHLlKRq
	0VMtymwVKPSWJoG2AZZ4sY2rzkRgTrMVPSKUaAhF0+o1hA2UCMqx/T0VuZnJmyEn/WJ6Wj3zUYWgR
	nDXMEZGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utZwm-00000002Uao-2xeb;
	Tue, 02 Sep 2025 22:57:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utU6O-0000000111K-387g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 16:43:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756831402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pvfyn6DBdkofRFQp6LMMEDWBYjJ0dblUgiw6XYH3Znc=;
	b=JBY7evZ5n3mi2BwGOPf8JA3EQUoeWOI7bvYzcdMTl3Ph1ZttuJs4Z0THjAdBYjEIJPrv7W
	QtkCab4QEj9WQ6gIKkwkUUyYD/fXX84hhbCBJglwt2dlkMQeRgyIJnh13+EcU+5Cg5WfIY
	OhpoJWtrm9pFiGe26TRsT/9/H8Xbth0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-53O8--OWN3--8ZAuzjGQvA-1; Tue, 02 Sep 2025 12:43:19 -0400
X-MC-Unique: 53O8--OWN3--8ZAuzjGQvA-1
X-Mimecast-MFC-AGG-ID: 53O8--OWN3--8ZAuzjGQvA_1756831399
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e870317642so1070339485a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 09:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756831399; x=1757436199;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pvfyn6DBdkofRFQp6LMMEDWBYjJ0dblUgiw6XYH3Znc=;
        b=bvuB9MtG5KWedX0kI/TFuAQree6aecJMtvbGAOG1za4qSoM9SEudmi2jNp65mwInie
         Irf1p8v0WJA/QKDhp1o8lfJJ3eUicXrjDZgC18KSfwdDVjJqyDN3RKMC4MB/mOWg9lT6
         ef6qoBu4kuaZGU7h6uPPj7AYUANrGGWcbNnufVX2PHXNkESqZTtMHPMWv2lyHVYp3a7z
         Mq4/YgziG/2bwxjG94BIUb1QzyX1FEawpl1k4t5HTUiSlA9koPHJSIGmayX2ck28QPNj
         uEPX0h7BxB1p33LyO3kHMEjJU7GTOxVOGW51T7lsdVeDvuDsR4qnc9Tr6i3PACez7hx6
         /ZSA==
X-Forwarded-Encrypted: i=1; AJvYcCVQiQ1P+5QXICladCAUhkhu8yXIuSUMaJ0FyCdOFL6l3SZz/h3C5YIH4Nu4DL3ObU5UnbMl0zuOnXqaqGxuGUvF@lists.infradead.org
X-Gm-Message-State: AOJu0YxCz8jwqoP57JlvL4mpUoQotuZdh35uvYTnMX/WemJ56PZhXbMw
	YUolpZpgPeSUlMAg5ek71+VvB1j0TWfitx/FiZzXTbqeDYLweVdP03L25QXCpqzjFpysKkitGeB
	sS3GW70KE1OdyQMM6H+pam7E9X7mHMYMPiZLqFIS7UESqQ9SWZz5hMjcftPrXRm/0I2jIpGMHqI
	V2
X-Gm-Gg: ASbGncvrKTMotyuogJxGdAmNTSneI34KnBsr/Jgem1pMXf0l8+85qxSxqLM8Xo6NF5Z
	BHqV/TGiTWSPJ1TMb6OHRhMN4hMUI1zFjX0J+E4y9bmChCA+MO0vJ+kP5v8hYM+eJKNnc/t9CpQ
	RKY/On1spEyK86tPg1UehZtV1nHR1B+l1tnHMO6cETFXzF+iNErrVFTqh4LEOE37C9WOQrSkprN
	9k4CVZGN9wQ8FQAWp99Kj6iqwXwv/5CF9Fc9UyMGrgHyl5olUgk3eLVfdTx95V5QVoBC+kEChcy
	Uh5F8cXEvzEEABDUuQ6YdTpG2x+Gj+/HS2uVQ2lObotKApcolasRAS/mb/vby1rMoZBdnV45AJz
	MRz8EEqdrMQ==
X-Received: by 2002:a05:620a:a514:b0:7ff:f2ea:d378 with SMTP id af79cd13be357-7fff2ead728mr1082407985a.55.1756831398625;
        Tue, 02 Sep 2025 09:43:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcNQGG21EPWc7KbxuoRsh58zX+gswADpVu4q9uZmVy9zNC5QU6XK66222B2I6oos/OUuy5fw==
X-Received: by 2002:a05:620a:a514:b0:7ff:f2ea:d378 with SMTP id af79cd13be357-7fff2ead728mr1082404385a.55.1756831398050;
        Tue, 02 Sep 2025 09:43:18 -0700 (PDT)
Received: from ?IPV6:2601:188:c180:4250:ecbe:130d:668d:951d? ([2601:188:c180:4250:ecbe:130d:668d:951d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8069bf68bb5sm158778485a.35.2025.09.02.09.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 09:43:17 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <26d5ced7-8f35-49b2-b342-c6b55dde9c66@redhat.com>
Date: Tue, 2 Sep 2025 12:43:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 27/33] sched/arm64: Move fallback task cpumask to
 HK_TYPE_DOMAIN
To: Frederic Weisbecker <frederic@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Marco Crivellari <marco.crivellari@suse.com>, Michal Hocko
 <mhocko@suse.com>, Peter Zijlstra <peterz@infradead.org>,
 Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
References: <20250829154814.47015-1-frederic@kernel.org>
 <20250829154814.47015-28-frederic@kernel.org>
In-Reply-To: <20250829154814.47015-28-frederic@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MtvsOBObfip_1F7G8aoMptG7pGxc7uNMx_tbd_jq2mk_1756831399
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_094324_852626_47312A73 
X-CRM114-Status: GOOD (  31.14  )
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


On 8/29/25 11:48 AM, Frederic Weisbecker wrote:
> When none of the allowed CPUs of a task are online, it gets migrated
> to the fallback cpumask which is all the non nohz_full CPUs.
>
> However just like nohz_full CPUs, domain isolated CPUs don't want to be
> disturbed by tasks that have lost their CPU affinities.
>
> And since nohz_full rely on domain isolation to work correctly, the
> housekeeping mask of domain isolated CPUs is always a subset of the
> housekeeping mask of nohz_full CPUs (there can be CPUs that are domain
> isolated but not nohz_full, OTOH there can't be nohz_full CPUs that are
> not domain isolated):
>
> 	HK_TYPE_DOMAIN & HK_TYPE_KERNEL_NOISE == HK_TYPE_DOMAIN
>
> Therefore use HK_TYPE_DOMAIN as the appropriate fallback target for
> tasks and since this cpumask can be modified at runtime, make sure
> that 32 bits support CPUs on ARM64 mismatched systems are not isolated
> by cpusets.
>
> CC: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>   arch/arm64/kernel/cpufeature.c | 18 ++++++++++++---
>   include/linux/cpu.h            |  4 ++++
>   kernel/cgroup/cpuset.c         | 40 +++++++++++++++++++++++-----------
>   3 files changed, 46 insertions(+), 16 deletions(-)
>
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 9ad065f15f1d..38046489d2ea 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -1653,6 +1653,18 @@ has_cpuid_feature(const struct arm64_cpu_capabilities *entry, int scope)
>   	return feature_matches(val, entry);
>   }
>   
> +/*
> + * 32 bits support CPUs can't be isolated because tasks may be
> + * arbitrarily affine to them, defeating the purpose of isolation.
> + */
> +bool arch_isolated_cpus_can_update(struct cpumask *new_cpus)
> +{
> +	if (static_branch_unlikely(&arm64_mismatched_32bit_el0))
> +		return !cpumask_intersects(cpu_32bit_el0_mask, new_cpus);
> +	else
> +		return true;
> +}
> +
>   const struct cpumask *system_32bit_el0_cpumask(void)
>   {
>   	if (!system_supports_32bit_el0())
> @@ -1666,7 +1678,7 @@ const struct cpumask *system_32bit_el0_cpumask(void)
>   
>   const struct cpumask *task_cpu_fallback_mask(struct task_struct *p)
>   {
> -	return __task_cpu_possible_mask(p, housekeeping_cpumask(HK_TYPE_TICK));
> +	return __task_cpu_possible_mask(p, housekeeping_cpumask(HK_TYPE_DOMAIN));
>   }
>   
>   static int __init parse_32bit_el0_param(char *str)
> @@ -3963,8 +3975,8 @@ static int enable_mismatched_32bit_el0(unsigned int cpu)
>   	bool cpu_32bit = false;
>   
>   	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0)) {
> -		if (!housekeeping_cpu(cpu, HK_TYPE_TICK))
> -			pr_info("Treating adaptive-ticks CPU %u as 64-bit only\n", cpu);
> +		if (!housekeeping_cpu(cpu, HK_TYPE_DOMAIN))
> +			pr_info("Treating domain isolated CPU %u as 64-bit only\n", cpu);
>   		else
>   			cpu_32bit = true;
>   	}
> diff --git a/include/linux/cpu.h b/include/linux/cpu.h
> index b91b993f58ee..8bb239080534 100644
> --- a/include/linux/cpu.h
> +++ b/include/linux/cpu.h
> @@ -228,4 +228,8 @@ static inline bool cpu_attack_vector_mitigated(enum cpu_attack_vectors v)
>   #define smt_mitigations SMT_MITIGATIONS_OFF
>   #endif
>   
> +struct cpumask;
> +
> +bool arch_isolated_cpus_can_update(struct cpumask *new_cpus);
> +
>   #endif /* _LINUX_CPU_H_ */
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 8260dd699fd8..cf99ea844c1d 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -1352,33 +1352,47 @@ static bool partition_xcpus_del(int old_prs, struct cpuset *parent,
>   	return isolcpus_updated;
>   }
>   
> +bool __weak arch_isolated_cpus_can_update(struct cpumask *new_cpus)
> +{
> +	return true;
> +}
> +
>   /*
> - * isolcpus_nohz_conflict - check for isolated & nohz_full conflicts
> + * isolated_cpus_can_update - check for conflicts against housekeeping and
> + *                            CPUs capabilities.
>    * @new_cpus: cpu mask for cpus that are going to be isolated
> - * Return: true if there is conflict, false otherwise
> + * Return: true if there no conflict, false otherwise
>    *
> - * If nohz_full is enabled and we have isolated CPUs, their combination must
> - * still leave housekeeping CPUs.
> + * Check for conflicts:
> + * - If nohz_full is enabled and there are isolated CPUs, their combination must
> + *   still leave housekeeping CPUs.
> + * - Architecture has CPU capabilities incompatible with being isolated
>    */
> -static bool isolcpus_nohz_conflict(struct cpumask *new_cpus)
> +static bool isolated_cpus_can_update(struct cpumask *new_cpus)
>   {
>   	cpumask_var_t full_hk_cpus;
> -	int res = false;
> +	bool res;
> +
> +	if (!arch_isolated_cpus_can_update(new_cpus))
> +		return false;
>   
>   	if (!housekeeping_enabled(HK_TYPE_KERNEL_NOISE))
> -		return false;
> +		return true;
>   
>   	if (!alloc_cpumask_var(&full_hk_cpus, GFP_KERNEL))
> -		return true;
> +		return false;
> +
> +	res = true;
>   
>   	cpumask_and(full_hk_cpus, housekeeping_cpumask(HK_TYPE_KERNEL_NOISE),
>   		    housekeeping_cpumask(HK_TYPE_DOMAIN));
>   	cpumask_andnot(full_hk_cpus, full_hk_cpus, isolated_cpus);
>   	cpumask_and(full_hk_cpus, full_hk_cpus, cpu_online_mask);

We should construct the new cpumask by adding new CPUs and removing old 
ones from the existing isolated_cpus and pass it to 
arch_isolated_cpus_can_update() for the checking to be correct.

Cheers,
Longman


