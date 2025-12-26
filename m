Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627A3E8FDBE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 23:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=865A7519wiN2/j/d36TzZexT5dCdrH361yDIN6aF4EQ=; b=CdBefkXRpYP0/Z+4EXSxlcSKFT
	BZFQ14Bqddg0gTYq+/e91WdE3EYU3iSc9UoSswNbfwqa10psdIapqHeYsxhQjpY68mKya0qdBRd4v
	RkZAB3AwX9of//0xTm7ZTEwsTphC0f3ZE66axB3upg/UG3ymfJKsE4ZWh3rM8+CRr3fit94SHjJyA
	yKS94dinuhmEC5gcbqDG3GDtHRT17GqZ/ac50G+O6iSBKsKPj4tMTbu9WlBunfOIaEXJEYddMI8xu
	/fP9UXNCgzjQFAgvo1M5ocLwg3lNnU2wNZ2ZD7we0BIAaiTK0eTxpPqCZetvfxlm3fH+T3dCNNkWe
	BX3YKalA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZHim-00000001Zbl-0TPT;
	Fri, 26 Dec 2025 23:59:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZHij-00000001ZbM-2wx7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 23:59:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766793584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=865A7519wiN2/j/d36TzZexT5dCdrH361yDIN6aF4EQ=;
	b=jIenHYkuiIT0sfpBEj90q+dN0V/AJw7kWjiOwDso2whcx0L8ryV43pwtJPPR6j4SsbYdn4
	tGil7duhymYUCrW5Y/B7tH6nwd4E/S+ccB7i8o2vSPm7wS4bLyNr9EILtNa6zZROl+Tz2P
	AW2Uoxer6m3cUt3GPNBzFhQIdXxXiEA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-1vskzoSaMJi8SJupZxdnCQ-1; Fri, 26 Dec 2025 18:59:40 -0500
X-MC-Unique: 1vskzoSaMJi8SJupZxdnCQ-1
X-Mimecast-MFC-AGG-ID: 1vskzoSaMJi8SJupZxdnCQ_1766793580
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1d26abbd8so219192871cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 15:59:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766793580; x=1767398380;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=865A7519wiN2/j/d36TzZexT5dCdrH361yDIN6aF4EQ=;
        b=PNP+hb8iEBWnPl4jLsPV9eEl5Cv4BuPwDRBYfCqUPShIOgpkBNqoAkXYAEfFmQsF85
         LYNhQJ+2SQBAlJPJyuGtjRW1HWo5xkuteUcQYydKQJ1hByGwnCNkBd3z7QjFsa6Ead5u
         6D6J9TfQV3W6+7OoSGoFY+7VmyTCQ4c3zufkdmANXfUoECrLZ/pJOY6JWouhz9IsBTgo
         UQzXaHnfL21yofSRoSHg9JuFlbU0VMeHVQCz+IZUSwxifBUe2Q29ZDReznLUiGULFN2M
         x8Pf6pERUT/GU97vWyI3ebG1tVRe7EeaLo+ovMy7IFYiaFV6p8ciYeJ63eYyWJByeNgw
         YY7g==
X-Forwarded-Encrypted: i=1; AJvYcCVtFwDmEkPJO95arH9L5MqWAHZYAH2NzHdCzjHwSdJdeGOeFmd81gRFIH4hpFvizB2m7LOQuiATXLZMasbbDGoe@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/xHmyy264YmN4lXZzrZu+VOqsAJG72QNNlGH4VhM3Ig8ntTw+
	LrzUL7VHhG7SRm4cm8wabo13G6vrQqeJ9VxnPsWvBx4WlupxsBlGExJ3gl/G8NcAUukj/SG4L4o
	k0eHno+HcDTxW2pUEmbaakQx4BqcM3QhO3NxZeyJCHb24jOl6YzLiW19n8a7sx7X8sgqtdZGMnR
	p6
X-Gm-Gg: AY/fxX49xe3jFsP77zW+UlksrhHfERNOrX+zYep03KFVi6U9Iw6CmlyLU+AIz0fkRHN
	1IWBuq9/Yip4p4fMNJ5LTS1XbnxkjTn3maSTgjZewf9LuhNi/e6DINvwE/GqbdiJYCYJWICeigs
	XkVHxhM9SdYH45p8P90UKJhOaGGDYz7YJvlAMNCbSPgd0lpo9+wc7SbPo1TE+xRsvEDKM4xLa6O
	eYhS+kzZ7HCfpYZf4F+xArORkF8pIHMer1jje+b9+4NuRlam5reE0HqxV68/yERRPkzQReCRYwA
	Tw0FGgw4EFIYLgS8HP+bncSp7fMmdCNf9F4D5t37YoT+EUzcxLTfvzwTSl8D9qE1JgHwPSOvWRB
	XRxebZ2LzXZFZiBnV1MTVz87kAj6ayC6CXuQ7/N+d+pqoNwytQ/VR6BGq
X-Received: by 2002:a05:622a:198b:b0:4ee:1bc7:9d7b with SMTP id d75a77b69052e-4f4abd8cc1fmr323812821cf.39.1766793580127;
        Fri, 26 Dec 2025 15:59:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERH4Oby4w37LQow9PPp6jIctRZ9vYsC7ux3H2yEqxLfgye1sWzIlcBk2jF/qfYV4D0shjHTw==
X-Received: by 2002:a05:622a:198b:b0:4ee:1bc7:9d7b with SMTP id d75a77b69052e-4f4abd8cc1fmr323812481cf.39.1766793579691;
        Fri, 26 Dec 2025 15:59:39 -0800 (PST)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac55fde7sm165334981cf.12.2025.12.26.15.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 15:59:38 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <a8968902-7fc3-4dec-9a53-e9685a5705b9@redhat.com>
Date: Fri, 26 Dec 2025 18:59:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 30/33] kthread: Honour kthreads preferred affinity after
 cpuset changes
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
 <20251224134520.33231-31-frederic@kernel.org>
In-Reply-To: <20251224134520.33231-31-frederic@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Kr7XjDhJ7Q24rtAQbeDWd4RkzOdOXKc2fqlaUAgBe1A_1766793580
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_155945_829532_2F658915 
X-CRM114-Status: GOOD (  30.50  )
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
> When cpuset isolated partitions get updated, unbound kthreads get
> indifferently affine to all non isolated CPUs, regardless of their
> individual affinity preferences.
>
> For example kswapd is a per-node kthread that prefers to be affine to
> the node it refers to. Whenever an isolated partition is created,
> updated or deleted, kswapd's node affinity is going to be broken if any
> CPU in the related node is not isolated because kswapd will be affine
> globally.
>
> Fix this with letting the consolidated kthread managed affinity code do
> the affinity update on behalf of cpuset.
>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>   include/linux/kthread.h  |  1 +
>   kernel/cgroup/cpuset.c   |  5 ++---
>   kernel/kthread.c         | 41 ++++++++++++++++++++++++++++++----------
>   kernel/sched/isolation.c |  3 +++
>   4 files changed, 37 insertions(+), 13 deletions(-)
>
> diff --git a/include/linux/kthread.h b/include/linux/kthread.h
> index 8d27403888ce..c92c1149ee6e 100644
> --- a/include/linux/kthread.h
> +++ b/include/linux/kthread.h
> @@ -100,6 +100,7 @@ void kthread_unpark(struct task_struct *k);
>   void kthread_parkme(void);
>   void kthread_exit(long result) __noreturn;
>   void kthread_complete_and_exit(struct completion *, long) __noreturn;
> +int kthreads_update_housekeeping(void);
>   
>   int kthreadd(void *unused);
>   extern struct task_struct *kthreadd_task;
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 1cc83a3c25f6..c8cfaf5cd4a1 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -1208,11 +1208,10 @@ void cpuset_update_tasks_cpumask(struct cpuset *cs, struct cpumask *new_cpus)
>   
>   		if (top_cs) {
>   			/*
> +			 * PF_KTHREAD tasks are handled by housekeeping.
>   			 * PF_NO_SETAFFINITY tasks are ignored.
> -			 * All per cpu kthreads should have PF_NO_SETAFFINITY
> -			 * flag set, see kthread_set_per_cpu().
>   			 */
> -			if (task->flags & PF_NO_SETAFFINITY)
> +			if (task->flags & (PF_KTHREAD | PF_NO_SETAFFINITY))
>   				continue;
>   			cpumask_andnot(new_cpus, possible_mask, subpartitions_cpus);
>   		} else {
> diff --git a/kernel/kthread.c b/kernel/kthread.c
> index 968fa5868d21..03008154249c 100644
> --- a/kernel/kthread.c
> +++ b/kernel/kthread.c
> @@ -891,14 +891,7 @@ int kthread_affine_preferred(struct task_struct *p, const struct cpumask *mask)
>   }
>   EXPORT_SYMBOL_GPL(kthread_affine_preferred);
>   
> -/*
> - * Re-affine kthreads according to their preferences
> - * and the newly online CPU. The CPU down part is handled
> - * by select_fallback_rq() which default re-affines to
> - * housekeepers from other nodes in case the preferred
> - * affinity doesn't apply anymore.
> - */
> -static int kthreads_online_cpu(unsigned int cpu)
> +static int kthreads_update_affinity(bool force)
>   {
>   	cpumask_var_t affinity;
>   	struct kthread *k;
> @@ -924,7 +917,8 @@ static int kthreads_online_cpu(unsigned int cpu)
>   		/*
>   		 * Unbound kthreads without preferred affinity are already affine
>   		 * to housekeeping, whether those CPUs are online or not. So no need
> -		 * to handle newly online CPUs for them.
> +		 * to handle newly online CPUs for them. However housekeeping changes
> +		 * have to be applied.
>   		 *
>   		 * But kthreads with a preferred affinity or node are different:
>   		 * if none of their preferred CPUs are online and part of
> @@ -932,7 +926,7 @@ static int kthreads_online_cpu(unsigned int cpu)
>   		 * But as soon as one of their preferred CPU becomes online, they must
>   		 * be affine to them.
>   		 */
> -		if (k->preferred_affinity || k->node != NUMA_NO_NODE) {
> +		if (force || k->preferred_affinity || k->node != NUMA_NO_NODE) {
>   			kthread_fetch_affinity(k, affinity);
>   			set_cpus_allowed_ptr(k->task, affinity);
>   		}
> @@ -943,6 +937,33 @@ static int kthreads_online_cpu(unsigned int cpu)
>   	return ret;
>   }
>   
> +/**
> + * kthreads_update_housekeeping - Update kthreads affinity on cpuset change
> + *
> + * When cpuset changes a partition type to/from "isolated" or updates related
> + * cpumasks, propagate the housekeeping cpumask change to preferred kthreads
> + * affinity.
> + *
> + * Returns 0 if successful, -ENOMEM if temporary mask couldn't
> + * be allocated or -EINVAL in case of internal error.
> + */
> +int kthreads_update_housekeeping(void)
> +{
> +	return kthreads_update_affinity(true);
> +}
> +
> +/*
> + * Re-affine kthreads according to their preferences
> + * and the newly online CPU. The CPU down part is handled
> + * by select_fallback_rq() which default re-affines to
> + * housekeepers from other nodes in case the preferred
> + * affinity doesn't apply anymore.
> + */
> +static int kthreads_online_cpu(unsigned int cpu)
> +{
> +	return kthreads_update_affinity(false);
> +}
> +
>   static int kthreads_init(void)
>   {
>   	return cpuhp_setup_state(CPUHP_AP_KTHREADS_ONLINE, "kthreads:online",
> diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
> index 84a257d05918..c499474866b8 100644
> --- a/kernel/sched/isolation.c
> +++ b/kernel/sched/isolation.c
> @@ -157,6 +157,9 @@ int housekeeping_update(struct cpumask *isol_mask, enum hk_type type)
>   	err = tmigr_isolated_exclude_cpumask(isol_mask);
>   	WARN_ON_ONCE(err < 0);
>   
> +	err = kthreads_update_housekeeping();
> +	WARN_ON_ONCE(err < 0);
> +
>   	kfree(old);
>   
>   	return err;
Reviewed-by: Waiman Long <longman@redhat.com>


