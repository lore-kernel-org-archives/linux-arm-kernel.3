Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7660DE8FDBE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 23:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ShTe7n4oL4bSFMstIf8qKgFQ8pgH2Te4INGSKID7CCk=; b=Kj98An0CRlpCWX0bvE8t4rerYM
	Q9MtCBqYdkrIX7GkRssOhNYuGpxLJxpMvtc2WucNXYv3lc2aCbFEYlg10LxoDDq36VZzzP3zjqx46
	T6OrKNqNrJemqPIQ3JekfhzgoF1gELVCYcjUfqskbT8ARkAH5S9TiEPszGG/sVIzTGlB6yGLv+4UT
	vjTaGCputQzdXcRL0unENcYvve7KXqnDlQRewZPBx77YkPZP4DZhnB0poQsr8yjSQdEZ3GwIYJQvw
	tbRh0Ao4al1HaN9cV3EE9DpYvUPwIWFmMMcO23T0a/0+oBDE4rBh51Mh74mLVj9ecQogpdq3aEg3z
	u34in8ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZHVl-00000001Z30-1lqA;
	Fri, 26 Dec 2025 23:46:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZHVi-00000001Z2V-0gOY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 23:46:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766792776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ShTe7n4oL4bSFMstIf8qKgFQ8pgH2Te4INGSKID7CCk=;
	b=I2Fhf3hS3a1ywkM0JiS+scs8Pv8/1VPx8yP7y5vuTV8i28Xv/qfUfujxDoj3aSekE/2VST
	XWniB54Cs90pjl90283GE23pcgZkw99pQuScB3ZdLLgdUHpqYDaMXou7RkEWTFyGhVHoEA
	CNW/yPP+Jz+ltyN9fi9UASz9+sc3B3k=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-9iFYt4gEO3iLHKO6NxhdJQ-1; Fri, 26 Dec 2025 18:46:08 -0500
X-MC-Unique: 9iFYt4gEO3iLHKO6NxhdJQ-1
X-Mimecast-MFC-AGG-ID: 9iFYt4gEO3iLHKO6NxhdJQ_1766792768
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8823f4666abso184530886d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 15:46:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766792768; x=1767397568;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ShTe7n4oL4bSFMstIf8qKgFQ8pgH2Te4INGSKID7CCk=;
        b=G7Nd4em8T+SZvrWKJuuLK1mBhZlhlJP9apt+ue5kN00JQi1b5BamGljN6QuKt2xXXP
         hv/MD+2MzAzjw+JE/NiYxm0NjE/qU4CsCbGv2GP9xtxsm9hyF18M0XEkFlt7vPEwz5Lp
         6jTDE2BUvNRqzSWqpQLPdNq8nQeKxmp6pvLKGni71x5hUcPTYgXgE+qWncr5tE0YBBCR
         SuaJpUYTtcfvvshGjhQZIUHguCzNFpATH2kPsRtwtwIwiaBAMvekvtbZ0QjlDvym+vHi
         ltfPzYTa9PHuS2l42p0+BJ3tyjq0td1lapaMN3nsVWIasRkPVstBgprnyDOQyI6CDFVo
         9bQA==
X-Forwarded-Encrypted: i=1; AJvYcCXYAUVPjvEH85XFpKNk+HLcW14QIDJBg04tPF1L37vC+ZO50jLkFT07weB7WjW3P64rq481lK0mAVtY1FzrCemf@lists.infradead.org
X-Gm-Message-State: AOJu0Yxnjzh7wdb34xfmr7cHApyGoRNtOD8hwnCgjgbLgdX19FsuPPMO
	SVynvvJgx8f4LJIlNrjMraSvQ/WS7FFIBoJDUCbcbglVQaYF932huJKWz1UeSDGUDCTS8N0gjPk
	+8nwpSgRXHzJS+TLgWhuTa8YvZmfb9zRkpNY9SAjdHGfhgZzuPzoTETTi312PRCZ7k5FlAQuSNT
	0d
X-Gm-Gg: AY/fxX5EQMQ7C5w9RVKHEZuNg/to3Cq0sFTcXontxJYLYnLRwcdE2ZoNMw6lvBxeq55
	bJRIqNogQfrZrb1S8Ks1o9EokojlX7Oq4akRS9QT0Mul0xGWtklGZKWQqVA1FTK+yQb82DiiEj2
	Gm/K/rTgOkllu9Duk/FLZ9WMf7uYmxLR7mW/2LyAPVpiOJIgv0PtrgzXuanBJA5sfH6KpPzCQYU
	cXHjmJtzmPE3wV11j6PW6wAWh/nwfco/bfMErWwR/eFIzGo96dDPmgw5nC+ZN3Umjxdi0sVKKhu
	kG2bCVDdjO4T4ww/hdA+jfAogoqyaiuMfSFCP1blLYsLf28Ob054W0dmUClVaMMzyVy+6Rpqttq
	Ri/74GPcuxt1vOX6LbSTqPlFRM9l5kcWUJJch8fEUICwdOREKwdDb8c/7
X-Received: by 2002:a0c:d783:0:b0:88a:28b0:9192 with SMTP id 6a1803df08f44-88d8379509fmr260894046d6.33.1766792768270;
        Fri, 26 Dec 2025 15:46:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHI+6C/nsqBk+pm7eqUDmS5eTPjEpCYiybmbNsgHAySbpZ0KGnAPETFvs9s0xhCfd6CKDIFSA==
X-Received: by 2002:a0c:d783:0:b0:88a:28b0:9192 with SMTP id 6a1803df08f44-88d8379509fmr260893766d6.33.1766792767734;
        Fri, 26 Dec 2025 15:46:07 -0800 (PST)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d997aedafsm176932106d6.31.2025.12.26.15.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 15:46:06 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <19b001a4-0696-4efd-aaa3-902ffa42ff9e@redhat.com>
Date: Fri, 26 Dec 2025 18:46:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 29/33] sched/arm64: Move fallback task cpumask to
 HK_TYPE_DOMAIN
To: Frederic Weisbecker <frederic@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Cc: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Chen Ridong <chenridong@huawei.com>, Danilo Krummrich <dakr@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Gabriele Monaco <gmonaco@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Marco Crivellari <marco.crivellari@suse.com>, Michal Hocko
 <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
 Paolo Abeni <pabeni@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Phil Auld <pauld@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Simon Horman <horms@kernel.org>,
 Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 cgroups@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-block@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org,
 netdev@vger.kernel.org
References: <20251224134520.33231-1-frederic@kernel.org>
 <20251224134520.33231-30-frederic@kernel.org>
In-Reply-To: <20251224134520.33231-30-frederic@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TanePiK-6MgtK0N8fDcrcMt5X5z9BQ3Fq0bOJsdMjBA_1766792768
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_154618_284300_AB4DADD6 
X-CRM114-Status: GOOD (  31.97  )
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

On 12/24/25 8:45 AM, Frederic Weisbecker wrote:
> When none of the allowed CPUs of a task are online, it gets migrated
> to the fallback cpumask which is all the non nohz_full CPUs.
>
> However just like nohz_full CPUs, domain isolated CPUs don't want to be
> disturbed by tasks that have lost their CPU affinities.
>
> And since nohz_full rely on domain isolation to work correctly, the
> housekeeping mask of domain isolated CPUs should always be a superset of
> the housekeeping mask of nohz_full CPUs (there can be CPUs that are
> domain isolated but not nohz_full, OTOH there shouldn't be nohz_full
> CPUs that are not domain isolated):
>
> 	HK_TYPE_DOMAIN | HK_TYPE_KERNEL_NOISE == HK_TYPE_DOMAIN
>
> Therefore use HK_TYPE_DOMAIN as the appropriate fallback target for
> tasks and since this cpumask can be modified at runtime, make sure
> that 32 bits support CPUs on ARM64 mismatched systems are not isolated
> by cpusets.
>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>   arch/arm64/kernel/cpufeature.c | 18 +++++++++++++++---
>   include/linux/cpu.h            |  4 ++++
>   kernel/cgroup/cpuset.c         | 17 ++++++++++++++---
>   3 files changed, 33 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index c840a93b9ef9..70b0e45e299a 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -1656,6 +1656,18 @@ has_cpuid_feature(const struct arm64_cpu_capabilities *entry, int scope)
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
> @@ -1669,7 +1681,7 @@ const struct cpumask *system_32bit_el0_cpumask(void)
>   
>   const struct cpumask *task_cpu_fallback_mask(struct task_struct *p)
>   {
> -	return __task_cpu_possible_mask(p, housekeeping_cpumask(HK_TYPE_TICK));
> +	return __task_cpu_possible_mask(p, housekeeping_cpumask(HK_TYPE_DOMAIN));
>   }
>   
>   static int __init parse_32bit_el0_param(char *str)
> @@ -3987,8 +3999,8 @@ static int enable_mismatched_32bit_el0(unsigned int cpu)
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
> index 487b3bf2e1ea..0b48af25ab5c 100644
> --- a/include/linux/cpu.h
> +++ b/include/linux/cpu.h
> @@ -229,4 +229,8 @@ static inline bool cpu_attack_vector_mitigated(enum cpu_attack_vectors v)
>   #define smt_mitigations SMT_MITIGATIONS_OFF
>   #endif
>   
> +struct cpumask;
> +
> +bool arch_isolated_cpus_can_update(struct cpumask *new_cpus);
> +
>   #endif /* _LINUX_CPU_H_ */
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index cd6119c02beb..1cc83a3c25f6 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -1408,14 +1408,22 @@ static void partition_xcpus_del(int old_prs, struct cpuset *parent,
>   	cpumask_or(parent->effective_cpus, parent->effective_cpus, xcpus);
>   }
>   
> +bool __weak arch_isolated_cpus_can_update(struct cpumask *new_cpus)
> +{
> +	return true;
> +}
> +
>   /*
> - * isolated_cpus_can_update - check for isolated & nohz_full conflicts
> + * isolated_cpus_can_update - check for conflicts against housekeeping and
> + *                            CPUs capabilities.
>    * @add_cpus: cpu mask for cpus that are going to be isolated
>    * @del_cpus: cpu mask for cpus that are no longer isolated, can be NULL
>    * Return: false if there is conflict, true otherwise
>    *
> - * If nohz_full is enabled and we have isolated CPUs, their combination must
> - * still leave housekeeping CPUs.
> + * Check for conflicts:
> + * - If nohz_full is enabled and there are isolated CPUs, their combination must
> + *   still leave housekeeping CPUs.
> + * - Architecture has CPU capabilities incompatible with being isolated
>    *
>    * TBD: Should consider merging this function into
>    *      prstate_housekeeping_conflict().
> @@ -1426,6 +1434,9 @@ static bool isolated_cpus_can_update(struct cpumask *add_cpus,
>   	cpumask_var_t full_hk_cpus;
>   	int res = true;
>   
> +	if (!arch_isolated_cpus_can_update(add_cpus))
> +		return false;
> +
>   	if (!housekeeping_enabled(HK_TYPE_KERNEL_NOISE))
>   		return true;
>   
Reviewed-by: Waiman Long <longman@redhat.com>


