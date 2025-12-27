Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88104E8FDB1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 00:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pERT9koOQ435TwRjMEJhS6iFHKSf3ugdix7KpFMpVgE=; b=3XiMO4skcAeWqKVcKil21b6HDG
	56Ocopcw3fTOqFiwQW14D007K9fo1Qi8vsl4LCFxtaikZBUTahd+zqzuUNrKGtUxVaA82TxBC44cm
	dNisdjPR4ZPoi51/LOE21Ejt8NSB9efWGg3I+atPG/RQBSE491scXsL4jyXjQyr0siM0YIbIm8nZW
	kza4E8FG+rQp8UVaLkHy2nrRHgxshta5hMB404vnj9fUvhSDIf5u2CJlxqIDAL/8o9HnmxsUe6Ic2
	ZmP156IsECZP4bAz7+TmK+HCoDrwyq9axpxHa5QBbs2ruGWJK59i5rCYer6U6/mLaN5iRClK2dWCz
	kOcBML5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZILQ-00000001bJU-0RID;
	Sat, 27 Dec 2025 00:39:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZILN-00000001bJ3-1cJc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 00:39:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766795980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pERT9koOQ435TwRjMEJhS6iFHKSf3ugdix7KpFMpVgE=;
	b=F2W/rpT7QQvt45K/uLTHv1Ws3Q7zMiwVwqF+UQNa6hDO5tfkMNoZqxFJtPuIxYQ/XWgJN8
	usl6ecQb0+LeJ+0SIDyB0DrdrCoyx33WlyYsSVR4b7hEVE3T1rNkcqNcN0f8YRRkhASzi2
	fEVoOcJ0EDkQ8m7xg92twi/fP7bDABY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-FPxgPMKhNAK6HiT_5QP97w-1; Fri, 26 Dec 2025 19:39:38 -0500
X-MC-Unique: FPxgPMKhNAK6HiT_5QP97w-1
X-Mimecast-MFC-AGG-ID: FPxgPMKhNAK6HiT_5QP97w_1766795978
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed79dd4a47so166857151cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 16:39:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766795974; x=1767400774;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pERT9koOQ435TwRjMEJhS6iFHKSf3ugdix7KpFMpVgE=;
        b=mnabD4W5Z6j+/5fXBFSzV/8n+dKLd2D8c6Oah0OXoBC2RRS9zChy85yuA21CV2gD+d
         l0EZzVfonPDkshQkswVDWmMAtGidf7RqWOgpDlIt6MaGDlBZCAI0rggP4I2iQKvWehOp
         YbnkvTzwkmyrOdXR4UEAf59o8/SUpOWx9SFhLy/YLDHr+SZabDAg63/0CKudjlJ6DDZt
         vLS2wfmyMOKVUene2c516dJkoDGE5M3KdAdgqWl/uwuskATYN15YwEJQP83baE7Z9/xT
         0PmJ7Rz7K61Z1Kjgp7aS45klVUW8QKVlQiKo9LjqKb2A923WssqZMErqpNKwEf5GmuXd
         NsyA==
X-Forwarded-Encrypted: i=1; AJvYcCXDBf8Pb/Smj8JfPsYf7janxGz2x999SbBWLa9HwIEv29K2Q+9fauKystTzmccO3oA+dbeuREnQFgXL1TsAgPHD@lists.infradead.org
X-Gm-Message-State: AOJu0YykmaW/8hqap/hjK6Gs3GAqQRu5tf/61xTOmCjgloCf4RRQPajf
	+wxTeEjAoifnGqxcuYvGCwm3cziMnKycXEq/XVa76g+N7g1AGOGH5h3xO6G/vdVpYkQlxIErook
	aR7dwkPDcl/ZhODoejxLR1eTjKmEJPjISPnrQQoNBXQZ0TfFcqCQy6bcWq3vXiy7oDQRPOUKYER
	3P
X-Gm-Gg: AY/fxX5n15X4xAbwNIs4wrOjGb6AJ2bazMDcttCschET8XGkTCFvsZ0TQ276xiZ7Pc7
	HqQOoLTZBPPXlvgffxGqwh0feDwr5ZQ7j4k2MOAj0O7Z7UlJmvcX37d8rEuk7fjGo6IRz84VBta
	/vtxunYojq88Tnp0Rg/43NvMhQ6kLq39a/a1d/ak0+TgDH+Dv21uQGK8EtOVyuLjZMRX1CRc0aW
	Vx/dmYWziqbc9XtrzZhW5RaNhyh1UKgRlawPXaxwTVB7D+DSHfrRuTFF6G7E2UQ1fVn6p9FYbRk
	mXbo4zumNj5XqEcKcKEmRcHvehWA2GL3WOfN/uFkEuW3Vdr53+1QMulPqAYQrj45gT0b5wG8hAC
	ZCZLVkEKyZLXr1XN+5VrCdHi8YmVlT+KbfI8D/UUQYKTcuhJJFeoSSu/9
X-Received: by 2002:ac8:1283:0:b0:4ed:43fe:f51e with SMTP id d75a77b69052e-4f4d96611cbmr138083321cf.39.1766795974375;
        Fri, 26 Dec 2025 16:39:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxBDI7wuXFeJvOL182RfGJ72MAWyQzGy7wYDnXaQodt5PgGkJkP10V4g9eH2qnu2LfLMUFPQ==
X-Received: by 2002:ac8:1283:0:b0:4ed:43fe:f51e with SMTP id d75a77b69052e-4f4d96611cbmr138083091cf.39.1766795973951;
        Fri, 26 Dec 2025 16:39:33 -0800 (PST)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4d5b4c975sm118077431cf.1.2025.12.26.16.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 16:39:33 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <370149fc-1624-4a16-ac47-dd9b2dd0ed29@redhat.com>
Date: Fri, 26 Dec 2025 19:39:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 33/33] doc: Add housekeeping documentation
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
 <20251224134520.33231-34-frederic@kernel.org>
In-Reply-To: <20251224134520.33231-34-frederic@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mvbo8ltX3l0U6uRms3iqJALx6-V9vRg7VyEe0LqTFJU_1766795978
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_163941_535405_14DFC632 
X-CRM114-Status: GOOD (  32.68  )
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
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>   Documentation/core-api/housekeeping.rst | 111 ++++++++++++++++++++++++
>   Documentation/core-api/index.rst        |   1 +
>   2 files changed, 112 insertions(+)
>   create mode 100644 Documentation/core-api/housekeeping.rst
>
> diff --git a/Documentation/core-api/housekeeping.rst b/Documentation/core-api/housekeeping.rst
> new file mode 100644
> index 000000000000..e5417302774c
> --- /dev/null
> +++ b/Documentation/core-api/housekeeping.rst
> @@ -0,0 +1,111 @@
> +======================================
> +Housekeeping
> +======================================
> +
> +
> +CPU Isolation moves away kernel work that may otherwise run on any CPU.
> +The purpose of its related features is to reduce the OS jitter that some
> +extreme workloads can't stand, such as in some DPDK usecases.
Nit: "usecases" => "use cases"
> +
> +The kernel work moved away by CPU isolation is commonly described as
> +"housekeeping" because it includes ground work that performs cleanups,
> +statistics maintainance and actions relying on them, memory release,
> +various deferrals etc...
> +
> +Sometimes housekeeping is just some unbound work (unbound workqueues,
> +unbound timers, ...) that gets easily assigned to non-isolated CPUs.
> +But sometimes housekeeping is tied to a specific CPU and requires
> +elaborated tricks to be offloaded to non-isolated CPUs (RCU_NOCB, remote
> +scheduler tick, etc...).
> +
> +Thus, a housekeeping CPU can be considered as the reverse of an isolated
> +CPU. It is simply a CPU that can execute housekeeping work. There must
> +always be at least one online housekeeping CPU at any time. The CPUs that
> +are not	isolated are automatically assigned as housekeeping.
Nit: extra white spaces between "not" and "isolated".
> +
> +Housekeeping is currently divided in four features described
> +by the ``enum hk_type type``:
> +
> +1.	HK_TYPE_DOMAIN matches the work moved away by scheduler domain
> +	isolation performed through ``isolcpus=domain`` boot parameter or
> +	isolated cpuset partitions in cgroup v2. This includes scheduler
> +	load balancing, unbound workqueues and timers.
> +
> +2.	HK_TYPE_KERNEL_NOISE matches the work moved away by tick isolation
> +	performed through ``nohz_full=`` or ``isolcpus=nohz`` boot
> +	parameters. This includes remote scheduler tick, vmstat and lockup
> +	watchdog.
> +
> +3.	HK_TYPE_MANAGED_IRQ matches the IRQ handlers moved away by managed
> +	IRQ isolation performed through ``isolcpus=managed_irq``.
> +
> +4.	HK_TYPE_DOMAIN_BOOT matches the work moved away by scheduler domain
> +	isolation performed through ``isolcpus=domain`` only. It is similar
> +	to HK_TYPE_DOMAIN except it ignores the isolation performed by
> +	cpusets.
> +
> +
> +Housekeeping cpumasks
> +=================================
> +
> +Housekeeping cpumasks include the CPUs that can execute the work moved
> +away by the matching isolation feature. These cpumasks are returned by
> +the following function::
> +
> +	const struct cpumask *housekeeping_cpumask(enum hk_type type)
> +
> +By default, if neither ``nohz_full=``, nor ``isolcpus``, nor cpuset's
> +isolated partitions are used, which covers most usecases, this function
> +returns the cpu_possible_mask.
> +
> +Otherwise the function returns the cpumask complement of the isolation
> +feature. For example:
> +
> +With isolcpus=domain,7 the following will return a mask with all possible
> +CPUs except 7::
> +
> +	housekeeping_cpumask(HK_TYPE_DOMAIN)
> +
> +Similarly with nohz_full=5,6 the following will return a mask with all
> +possible CPUs except 5,6::
> +
> +	housekeeping_cpumask(HK_TYPE_KERNEL_NOISE)
> +
> +
> +Synchronization against cpusets
> +=================================
> +
> +Cpuset can modify the HK_TYPE_DOMAIN housekeeping cpumask while creating,
> +modifying or deleting an isolated partition.
> +
> +The users of HK_TYPE_DOMAIN cpumask must then make sure to synchronize
> +properly against cpuset in order to make sure that:
> +
> +1.	The cpumask snapshot stays coherent.
> +
> +2.	No housekeeping work is queued on a newly made isolated CPU.
> +
> +3.	Pending housekeeping work that was queued to a non isolated
> +	CPU which just turned isolated through cpuset must be flushed
> +	before the related created/modified isolated partition is made
> +	available to userspace.
> +
> +This synchronization is maintained by an RCU based scheme. The cpuset update
> +side waits for an RCU grace period after updating the HK_TYPE_DOMAIN
> +cpumask and before flushing pending works. On the read side, care must be
> +taken to gather the housekeeping target election and the work enqueue within
> +the same RCU read side critical section.
> +
> +A typical layout example would look like this on the update side
> +(``housekeeping_update()``)::
> +
> +	rcu_assign_pointer(housekeeping_cpumasks[type], trial);
> +	synchronize_rcu();
> +	flush_workqueue(example_workqueue);
> +
> +And then on the read side::
> +
> +	rcu_read_lock();
> +	cpu = housekeeping_any_cpu(HK_TYPE_DOMAIN);
> +	queue_work_on(cpu, example_workqueue, work);
> +	rcu_read_unlock();
> diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
> index 5eb0fbbbc323..79fe7735692e 100644
> --- a/Documentation/core-api/index.rst
> +++ b/Documentation/core-api/index.rst
> @@ -25,6 +25,7 @@ it.
>      symbol-namespaces
>      asm-annotations
>      real-time/index
> +   housekeeping.rst
>   
>   Data structures and low-level utilities
>   =======================================
Acked-by: Waiman Long <longman@redhat.com>


