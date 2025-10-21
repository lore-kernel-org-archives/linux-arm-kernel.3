Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6774CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 04:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r9OupL1guxMQZzERaZQ5HIFJ+HTh+MX5SgUIo3LTaUY=; b=flpLwKcZEc/n/p64lIxAntPF14
	7rJY7/VtwIq3H+USshp6eEYXK1s/dny8vgIlXM49kBEyZjeniQkpDuT7UGFmq3CrVExAbFKQ+uvYw
	j7SWUyBiL9LaL7Ha1PMM8cSFYRLMRcPNK7PyTIMtP5oYO4PKYVr2bjW1QxOvlazLIjomsIFow3Bl5
	eG6zoYoy5YwX7lOhWzy04Dpwwghggv0A8ApRVjZ9f6H89DFZG5h3RDdy71WFMTZFrPi0erBlm+hw1
	fH273lLNO3Zk5L/HVErsgDjDtuvgFn6Mo9+eoCy1rO0iYQETMipJeV4qBvmKV1X8Bp4GKTviVuNZH
	H7ohgcHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB3hc-0000000Fm3s-2e8u;
	Tue, 21 Oct 2025 04:10:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB3hY-0000000Fm2z-3bH4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 04:10:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761019823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r9OupL1guxMQZzERaZQ5HIFJ+HTh+MX5SgUIo3LTaUY=;
	b=EFgCUByoM4QfmSq0a5kM72QLaW+qAi03T14bhkOSK4dFQbUyfcSeVLyLdeRhTkRe7L3Nx1
	T1Ch37UbLAp2JYx1a0JOUJ1hawISVoyLefHKSiwciYgWYKKCppkZqwHeEPouFcgGYB5w8P
	uBUQwBTq/+vYXhTkrK8upAhEEPP5SVw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-RfsjSXaDODGZLGiyMMbBSA-1; Tue, 21 Oct 2025 00:10:22 -0400
X-MC-Unique: RfsjSXaDODGZLGiyMMbBSA-1
X-Mimecast-MFC-AGG-ID: RfsjSXaDODGZLGiyMMbBSA_1761019822
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-79a3c16b276so161214746d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 21:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761019822; x=1761624622;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r9OupL1guxMQZzERaZQ5HIFJ+HTh+MX5SgUIo3LTaUY=;
        b=YQjXEIIUQa2L7wKNs1AO7OmALJUoFGj2ifgIh+RexAvkVtk/PRBa4yJX8aAToxfyW6
         hUu4Hp0FnVf5tEnQLJTh344CHTh3yQeLN67Au0sH5B3OdUFul5sy99V4B8/uMIBF1KxT
         7cHxEZ32rix0DDP2lF8b2/KHc9sJyrT7Nlwccdi68PReY7dG3+TVQqzddrEUw1rxfZKB
         RZ76kFlr2ba1PWozPl1gM9wZ0JLdaFY0XzKzq8mV4uPz9mwXW6cdUwxKmux3phzxM288
         iM9dhCFqNm8M2t+HKLcW3OpkqW2bIAceSvF6kK7HsYt6h5uqNNi2sq0dYEj5+IP/fEdp
         FlvA==
X-Forwarded-Encrypted: i=1; AJvYcCUotfrb9g9wCDQLzYF8CaXbK6qNEXGvfVQnoRmTb38KS4GqT/csrC0ThDMtzOEhiO5BHckvf8/+NcmL5XynumQm@lists.infradead.org
X-Gm-Message-State: AOJu0YxUQn3tu3gXxlCqPvWf/0m02PByjdbZ3L7urWl60EIm7oVHA15L
	8IJKQANspkT/4OZct4keKBa1z9Lw/22QaoK9SAV0V0FTQfwxgE2609ez/EuP5Pqgyo5vglW8iTV
	SavGsEAyaziDMpeVt2EIY3pF/TIVowm1nQQRZ0KNzy2JmcHRW0lPKTbRlseH0Q9zXiMhx5SOSYi
	8R
X-Gm-Gg: ASbGncuKN4U5hw1GlOAoE1g/GK3NXSXTskseXjYQzXaSwwNf/H4YufaHonWxgJ9fkjo
	+y3QCh9sFKoedNorkcjqr2a3W7kCzIa//xI/VtmG04E9D9xFaTM/xU31pbr7AKKSIKkRaTrwtgN
	8zLMwfBKJXg+2nkfCZ9n7wnq1o6z2RFJvZAQNIPSc60z+VVlblf8XtTpbilyuA5VHv/61ArfB2I
	RBRAbXIXtCL/JfmL4S+Gu2RGHIDOgTPm0NLe+lPuN3alMpnHwaRNUNYGWJ0M+c1UZKDUgf6VKIj
	yaAOdekP29O1B5uOMFSVaTurP1I9MqswAsd8jOeVnsJhUfqYpWkXb55wD/vZrwRML3leleRmkjG
	OWbxlWhAv/nCBAPSR0ZoNNrKWd0sQEIaPdNy+Fqo4Ucnovw==
X-Received: by 2002:a05:6214:808f:b0:87c:223c:c5c8 with SMTP id 6a1803df08f44-87c223cc6b8mr152674076d6.20.1761019821881;
        Mon, 20 Oct 2025 21:10:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdm2hwRLRcjdAJaN67gocvEQv/ytDjJvvxgQlCm7/W761K2ldQ2/8L5ftdru4g+9p/5t/b/A==
X-Received: by 2002:a05:6214:808f:b0:87c:223c:c5c8 with SMTP id 6a1803df08f44-87c223cc6b8mr152673626d6.20.1761019821460;
        Mon, 20 Oct 2025 21:10:21 -0700 (PDT)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87d028af525sm62600596d6.51.2025.10.20.21.10.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 21:10:20 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <0e02915f-bde7-4b04-b760-89f34fb0a436@redhat.com>
Date: Tue, 21 Oct 2025 00:10:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/33] cpuset: Update HK_TYPE_DOMAIN cpumask from cpuset
To: Frederic Weisbecker <frederic@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Cc: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Danilo Krummrich
 <dakr@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Gabriele Monaco <gmonaco@redhat.com>,
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
References: <20251013203146.10162-1-frederic@kernel.org>
 <20251013203146.10162-14-frederic@kernel.org>
In-Reply-To: <20251013203146.10162-14-frederic@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CfJFrW-orJkVoZ0fs_MtZH2kdbZfljBoCoIPDmNDTyw_1761019822
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_211024_974401_2D29BBB1 
X-CRM114-Status: GOOD (  24.61  )
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

On 10/13/25 4:31 PM, Frederic Weisbecker wrote:
> Until now, HK_TYPE_DOMAIN used to only include boot defined isolated
> CPUs passed through isolcpus= boot option. Users interested in also
> knowing the runtime defined isolated CPUs through cpuset must use
> different APIs: cpuset_cpu_is_isolated(), cpu_is_isolated(), etc...
>
> There are many drawbacks to that approach:
>
> 1) Most interested subsystems want to know about all isolated CPUs, not
>    just those defined on boot time.
>
> 2) cpuset_cpu_is_isolated() / cpu_is_isolated() are not synchronized with
>    concurrent cpuset changes.
>
> 3) Further cpuset modifications are not propagated to subsystems
>
> Solve 1) and 2) and centralize all isolated CPUs within the
> HK_TYPE_DOMAIN housekeeping cpumask.
>
> Subsystems can rely on RCU to synchronize against concurrent changes.
>
> The propagation mentioned in 3) will be handled in further patches.
>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>   include/linux/sched/isolation.h |  2 +
>   kernel/cgroup/cpuset.c          |  2 +
>   kernel/sched/isolation.c        | 75 ++++++++++++++++++++++++++++++---
>   kernel/sched/sched.h            |  1 +
>   4 files changed, 74 insertions(+), 6 deletions(-)
>
> diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
> index da22b038942a..94d5c835121b 100644
> --- a/include/linux/sched/isolation.h
> +++ b/include/linux/sched/isolation.h
> @@ -32,6 +32,7 @@ extern const struct cpumask *housekeeping_cpumask(enum hk_type type);
>   extern bool housekeeping_enabled(enum hk_type type);
>   extern void housekeeping_affine(struct task_struct *t, enum hk_type type);
>   extern bool housekeeping_test_cpu(int cpu, enum hk_type type);
> +extern int housekeeping_update(struct cpumask *mask, enum hk_type type);
>   extern void __init housekeeping_init(void);
>   
>   #else
> @@ -59,6 +60,7 @@ static inline bool housekeeping_test_cpu(int cpu, enum hk_type type)
>   	return true;
>   }
>   
> +static inline int housekeeping_update(struct cpumask *mask, enum hk_type type) { return 0; }
>   static inline void housekeeping_init(void) { }
>   #endif /* CONFIG_CPU_ISOLATION */
>   
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index aa1ac7bcf2ea..b04a4242f2fa 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -1403,6 +1403,8 @@ static void update_unbound_workqueue_cpumask(bool isolcpus_updated)
>   
>   	ret = workqueue_unbound_exclude_cpumask(isolated_cpus);
>   	WARN_ON_ONCE(ret < 0);
> +	ret = housekeeping_update(isolated_cpus, HK_TYPE_DOMAIN);
> +	WARN_ON_ONCE(ret < 0);
>   }
>   
>   /**
> diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
> index b46c20b5437f..95d69c2102f6 100644
> --- a/kernel/sched/isolation.c
> +++ b/kernel/sched/isolation.c
> @@ -29,18 +29,48 @@ static struct housekeeping housekeeping;
>   
>   bool housekeeping_enabled(enum hk_type type)
>   {
> -	return !!(housekeeping.flags & BIT(type));
> +	return !!(READ_ONCE(housekeeping.flags) & BIT(type));
>   }
>   EXPORT_SYMBOL_GPL(housekeeping_enabled);
>   
> +static bool housekeeping_dereference_check(enum hk_type type)
> +{
> +	if (IS_ENABLED(CONFIG_LOCKDEP) && type == HK_TYPE_DOMAIN) {
> +		/* Cpuset isn't even writable yet? */
> +		if (system_state <= SYSTEM_SCHEDULING)
> +			return true;
> +
> +		/* CPU hotplug write locked, so cpuset partition can't be overwritten */
> +		if (IS_ENABLED(CONFIG_HOTPLUG_CPU) && lockdep_is_cpus_write_held())
> +			return true;
> +
> +		/* Cpuset lock held, partitions not writable */
> +		if (IS_ENABLED(CONFIG_CPUSETS) && lockdep_is_cpuset_held())
> +			return true;

I have some doubt about this condition as the cpuset_mutex may be held 
in the process of making changes to an isolated partition that will 
impact HK_TYPE_DOMAIN cpumask.

Cheers,
Longman


