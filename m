Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96763CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 19:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAcllF9nVIfCniwCIoLGKjAXFJuJdiDQqFfGC/k/Yfk=; b=Er8pzoYS+l3KXfphZFsSh3tOnW
	vCaN+i61aegT5SOXGAyomHrKM6x8c5jGTqFgbLVJoTZoF4+bQUocnKs0rMV3FmnmU0PTyuoBG0O1O
	/9whtOFvKCv1XztQ/Gb99qKuMVSAaNrcimZJKdMPYtxCCWNk1YCCeYsPhGd7eLthPXoU9NfahaOtC
	PB8qYmt2EqvhPfAo36MPVprLLZDVCugFcbmq3isF2Jdx0ihkYIuba5oGhBvHFExvO3aboz14MY9+I
	0nQ7iNC845cr/u78fzzgRnPpZ1cnQC9utx+VoSJIV5XAzcYGhLKvJ5MeA6/X1iXf+2td0xx3MgzS+
	fZyjl0Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBI2T-00000000UWN-210s;
	Tue, 21 Oct 2025 19:28:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBI2M-00000000UTd-1xwS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 19:28:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761074929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OAcllF9nVIfCniwCIoLGKjAXFJuJdiDQqFfGC/k/Yfk=;
	b=BoB3rluMPOKjB4rHdV4VZTxG6jSvCCtj4bApw1ckBTPdZFe8zJIFQzjNs1uGgcy0SBQTNm
	Q7F17s5CAGOM9b1evWq/BPA0q9B48fea2rTPB1xLb9jeE4DTW/XW7GqsnnpDJ9xAdVPQtE
	Qchu0Ys9WMUyWZBJzoaJ/dODMCqcQfM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-NmLzWVvMOO-ZS58qVQW3bQ-1; Tue, 21 Oct 2025 15:28:48 -0400
X-MC-Unique: NmLzWVvMOO-ZS58qVQW3bQ-1
X-Mimecast-MFC-AGG-ID: NmLzWVvMOO-ZS58qVQW3bQ_1761074927
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-88f1dad9992so290776385a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 12:28:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761074927; x=1761679727;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OAcllF9nVIfCniwCIoLGKjAXFJuJdiDQqFfGC/k/Yfk=;
        b=MQX1LBdgCQkBGX9G5hCjgRzoiAc3RFGhLVySc2GjC6DfXeh1LhwTTj2G3xTnFBOU9J
         ciySwzsAG05QZ5ZP83COgGbbySJU+UxwhDA18ywtehI2jOPtcSHYmtOVvkyrUFD+sPQ7
         dQ2eOx+lmkabJen/i33kOsY6XNxv+aMkyz+ok1nS9FtxN/vth4zClaDpb5KxDiLujGgg
         IxDPaG/P8hCtb72grNXTeYdvVI7P9LR/YEzZLOe09CeNyRngGv//20+sZ750sl3kQXI5
         2zcLj1XlxWjdtEOoOLeOtIhJzgGlDXL8Iqe+GXXdXbE7keC2fAF0W74/v0DUpc7dgclw
         uWUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjxQz/rDSItDKb6q0YRmqFebnzAyrxU4YAxGUI47rURwPCqgPvjm4voZ7JbQLPbkBdNhE641NLfj70gJT9hSX5@lists.infradead.org
X-Gm-Message-State: AOJu0YyjIDlIbuGX0ahxUD5T7BVDGtFMAeBgzTfq4g8QLZxzWH72Ebfj
	DEH+VH0siSp1CynhTTG0fMFJrF73p4e4uQW/xxOxkcxZlF9U64Sip6yajVChgJF4Tg1tVPY4C2G
	3RPSWIaOsa6zdhB7wZpmOC6LfLQkcvT3WHigkg196+1jigOOJtsgwH9jReEJZ3xF42kSAnE6dEv
	Pd
X-Gm-Gg: ASbGncuUmqgjzpTVJPnT/FtAygXdUnYkRUTT/8B6tQ0mbR1L4WEBBactQxtKwi4Q2xb
	/Hm0RlMubMAmrzCdQxfEGLxz+azq0s2dXbkjH/iNUXVjQKRjm1XtxwjlHNJOajJzuV0am7BPDxH
	R1y/AxmKMijcANHqztG0Az3zAFSFadtYbsMFcg9ez0Lt6tUNFpGhy3SmIiw9OUnPiKTfjCgf4MG
	SCWpRjQ7PG8139Bb4l5o4dUGI1p/dCmq5bZ/ao7vfcSCY1OFMQCUbyMbQh/wfgS8FSmfsQpF4Hg
	orw5EKrw+tCjPH+GjEuIeOE72PeCQYbHbeGg6k4YFxpmMofSd/Ows1TTN0zLDECV3cem16uWhxy
	6Mm6KKWWByh3MaUa0RshgXMQtUfXJsP7gBd7zBfC4+EaDkQ==
X-Received: by 2002:a05:620a:488e:b0:7e8:67b8:476 with SMTP id af79cd13be357-89070114f94mr2346437385a.57.1761074927220;
        Tue, 21 Oct 2025 12:28:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+u+8bH+lrXiYca/LtZ13ni/QSfiNRKtdF54+j0jtBiSwDvm50yRps0a3A4dxIJsM4iefKKw==
X-Received: by 2002:a05:620a:488e:b0:7e8:67b8:476 with SMTP id af79cd13be357-89070114f94mr2346432285a.57.1761074926666;
        Tue, 21 Oct 2025 12:28:46 -0700 (PDT)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-891cefba8f0sm817018785a.40.2025.10.21.12.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 12:28:46 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <a01172d1-d902-4d55-bc1e-c8234985e65a@redhat.com>
Date: Tue, 21 Oct 2025 15:28:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/33] sched/isolation: Flush memcg workqueues on cpuset
 isolated partition change
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
 <20251013203146.10162-15-frederic@kernel.org>
 <364e084a-ef37-42ab-a2ae-5f103f1eb212@redhat.com>
In-Reply-To: <364e084a-ef37-42ab-a2ae-5f103f1eb212@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MHxsqnA-2kMc9jQEf2yRUs_NGUtoKvC1bnQUNbJloUc_1761074927
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_122851_697690_04734890 
X-CRM114-Status: GOOD (  21.45  )
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

On 10/21/25 3:16 PM, Waiman Long wrote:
> On 10/13/25 4:31 PM, Frederic Weisbecker wrote:
>> The HK_TYPE_DOMAIN housekeeping cpumask is now modifyable at runtime. In
>> order to synchronize against memcg workqueue to make sure that no
>> asynchronous draining is still pending or executing on a newly made
>> isolated CPU, the housekeeping susbsystem must flush the memcg
>> workqueues.
>>
>> However the memcg workqueues can't be flushed easily since they are
>> queued to the main per-CPU workqueue pool.
>>
>> Solve this with creating a memcg specific pool and provide and use the
>> appropriate flushing API.
>>
>> Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
>> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
>> ---
>>   include/linux/memcontrol.h |  4 ++++
>>   kernel/sched/isolation.c   |  2 ++
>>   kernel/sched/sched.h       |  1 +
>>   mm/memcontrol.c            | 12 +++++++++++-
>>   4 files changed, 18 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
>> index 873e510d6f8d..001200df63cf 100644
>> --- a/include/linux/memcontrol.h
>> +++ b/include/linux/memcontrol.h
>> @@ -1074,6 +1074,8 @@ static inline u64 cgroup_id_from_mm(struct 
>> mm_struct *mm)
>>       return id;
>>   }
>>   +void mem_cgroup_flush_workqueue(void);
>> +
>>   extern int mem_cgroup_init(void);
>>   #else /* CONFIG_MEMCG */
>>   @@ -1481,6 +1483,8 @@ static inline u64 cgroup_id_from_mm(struct 
>> mm_struct *mm)
>>       return 0;
>>   }
>>   +static inline void mem_cgroup_flush_workqueue(void) { }
>> +
>>   static inline int mem_cgroup_init(void) { return 0; }
>>   #endif /* CONFIG_MEMCG */
>>   diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
>> index 95d69c2102f6..9ec365dea921 100644
>> --- a/kernel/sched/isolation.c
>> +++ b/kernel/sched/isolation.c
>> @@ -144,6 +144,8 @@ int housekeeping_update(struct cpumask *mask, 
>> enum hk_type type)
>>         synchronize_rcu();
>>   +    mem_cgroup_flush_workqueue();
>> +
>>       kfree(old);
>>         return 0;
>> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
>> index 8fac8aa451c6..8bfc0b4b133f 100644
>> --- a/kernel/sched/sched.h
>> +++ b/kernel/sched/sched.h
>> @@ -44,6 +44,7 @@
>>   #include <linux/lockdep_api.h>
>>   #include <linux/lockdep.h>
>>   #include <linux/memblock.h>
>> +#include <linux/memcontrol.h>
>>   #include <linux/minmax.h>
>>   #include <linux/mm.h>
>>   #include <linux/module.h>
>> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
>> index 1033e52ab6cf..1aa14e543f35 100644
>> --- a/mm/memcontrol.c
>> +++ b/mm/memcontrol.c
>> @@ -95,6 +95,8 @@ static bool cgroup_memory_nokmem __ro_after_init;
>>   /* BPF memory accounting disabled? */
>>   static bool cgroup_memory_nobpf __ro_after_init;
>>   +static struct workqueue_struct *memcg_wq __ro_after_init;
>> +
>>   static struct kmem_cache *memcg_cachep;
>>   static struct kmem_cache *memcg_pn_cachep;
>>   @@ -1975,7 +1977,7 @@ static void schedule_drain_work(int cpu, 
>> struct work_struct *work)
>>   {
>>       guard(rcu)();
>>       if (!cpu_is_isolated(cpu))
>> -        schedule_work_on(cpu, work);
>> +        queue_work_on(cpu, memcg_wq, work);
>>   }
>>     /*
>> @@ -5092,6 +5094,11 @@ void mem_cgroup_sk_uncharge(const struct sock 
>> *sk, unsigned int nr_pages)
>>       refill_stock(memcg, nr_pages);
>>   }
>>   +void mem_cgroup_flush_workqueue(void)
>> +{
>> +    flush_workqueue(memcg_wq);
>> +}
>> +
>>   static int __init cgroup_memory(char *s)
>>   {
>>       char *token;
>> @@ -5134,6 +5141,9 @@ int __init mem_cgroup_init(void)
>>       cpuhp_setup_state_nocalls(CPUHP_MM_MEMCQ_DEAD, 
>> "mm/memctrl:dead", NULL,
>>                     memcg_hotplug_cpu_dead);
>>   +    memcg_wq = alloc_workqueue("memcg", 0, 0);
>
> Should we explicitly mark the memcg_wq as WQ_PERCPU even though I 
> think percpu is the default. The schedule_work_on() schedules work on 
> the system_percpu_wq. 

According to commit dadb3ebcf39 ("workqueue: WQ_PERCPU added to 
alloc_workqueue users"), the default may be changed to WQ_UNBOUND in the 
future.

Cheers,
Longman


