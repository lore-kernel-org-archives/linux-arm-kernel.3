Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8B1E8FDAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 20:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4Pa3h61jDk0Wr5hXqPBHwFAVT2TML944c0BxtSWzHU=; b=r++dnn8yy3s5lvI6CeMIO88zcQ
	ho5UEOkIuoMKYiYSx2Ebgl3hSO72a+QlynJZ8E1GTGHwqHBzaderW+oeZa2TdxHJlSiXGl72iAwIP
	2QqdzMLkiaIx0IJnC3jhXmdUNx08GNA8l9Kvh4yVFD6qeL2Pe8xEgpwUlgbeFDnU8CSRW+PhfdnNS
	y9Ehxv6Xb4E6Eu0B7daqz36/V+H8i1SQ0eX2jSgaBLm84MzOAg6RvZhmXxPKuPfjDEikNsPf1td5S
	yZr6Hx21qtDlhXSa9UcVC0kIFUh5I9eNJNbeDUBB8OWJioYH1KTNDUDVRmQbsOL8npRnTz2GzwYJr
	rtWmUaSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZETR-00000001RsP-3Nh5;
	Fri, 26 Dec 2025 20:31:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZETK-00000001Rrv-2P7t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 20:31:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766781096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w4Pa3h61jDk0Wr5hXqPBHwFAVT2TML944c0BxtSWzHU=;
	b=BRzhX41KETAD1g+i6plVSmW1IDKS3nYzZGYbvW+iCoby8EkCVlOJX8ysOU3CLEH02ogivp
	RNBt3bXW37sI3ufUPGB4O5feU6GYQZtEGzkSnntQbv7cbi1mOGra92X0TXVBtpSQj05Ks4
	v+NkQ/puhjkSTKxFz1sMrm51yDi9lwc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-S8955525NG-4PIJ0ISES_g-1; Fri, 26 Dec 2025 15:31:34 -0500
X-MC-Unique: S8955525NG-4PIJ0ISES_g-1
X-Mimecast-MFC-AGG-ID: S8955525NG-4PIJ0ISES_g_1766781093
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c1fa4a1c18so184557085a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 12:31:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766781093; x=1767385893;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w4Pa3h61jDk0Wr5hXqPBHwFAVT2TML944c0BxtSWzHU=;
        b=CSlBLYYG9l+pv2/+odRBbihnE9P52zPhc4PLGXzniV129jNdytYhRscRQUdp79PDIv
         3K+HQHByGeETv+TNr68fXWGWO9jgALFbhsvAAsFa7vmsLZkBM5ihQ9x9nWgSAPm6q3DG
         8xowz4gA/fnK0F5hOvUbpyGKd7ey7BiFrH7JBrAfnHeJkTyRoKHs6RP2M9wlH3rIQuJj
         uJuIAyCd6/4qTHcSYuIYqluPCijIoKsNkekatPPIqWbS8R6wMGWmYkoi1lFZzwBSjlbS
         A8p98LWIx5yNs0h/BQVt8L0a+2E3DKfp1PFwMiYwLi9PLGZh09VaS4f99QZiHfbUJYXu
         k6Wg==
X-Forwarded-Encrypted: i=1; AJvYcCUTscpvt3wEeizlt8SIOTWwfDZ+4LPZyRShb7sHrTid3RTykk82K0ic/Z0r0kqLV7SY1A2eSR1k+ikOhPQw7TQu@lists.infradead.org
X-Gm-Message-State: AOJu0Yys3j+VfiUDVrZAzNeHVNgfjfDgLSR92HyT70RzPowGNCxmKNL4
	AInJzTHSaC0jlj7aJVMzH5oJACxl4QIt/tyxrw4fLoS8PQmf5YqGjwFJeSmplzZxggnu4ebzTag
	X15/jGbzfgzjzqk01KdXA4vSdXKwLenzl2DCrcVGzdjNoijBeEg5+tQloj/+w4C5MVMVDiIbaZT
	q+
X-Gm-Gg: AY/fxX6tHrPLZOezuMsS1oHmtKVZbzPAxwZlE+0TsydzEMcdY/8dJK9GFMruMZ0lFCW
	NUlMzVC/bcDAr/b0NO8CQVse2mPh2WNZ6bJlvAHchETiH+1bUU/NY9S5z10nJaaXaVL7EBt9OPa
	tmmE2XZXUBrKV0+3+rHPg5eCcyV3+DNLUYlfKJKJuMl87Jxeu4I/j21JR9WgEFpn3JJPhQHMi21
	qm8HR8kb/x0cNZ03wmgO8V6G0cWPw9b8+iJ+3ObvmP8GOqnhcfO4D+NewEISlrhguB4HWqbk98s
	LLQacqpWdVmnITSw2sb1I/RxDDYPNO1LuE5ud6bBck34uaZI3LxY/MeK8jqgQFM8CEEAip4J/Ls
	sWfriv2HwckMHdEekmrNJLNryXqgMkToN2D0CzGyUoQE4lg0cU2/1twS0
X-Received: by 2002:a05:620a:269c:b0:8c0:d341:9cef with SMTP id af79cd13be357-8c0d341a826mr2546755685a.73.1766781093473;
        Fri, 26 Dec 2025 12:31:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNP3JRzuVA9e5lA05jSGh3cLVd3H4bpw8DYevvFoq9EfnIojwqlL0tzjDHUY8cAliBoVsvtA==
X-Received: by 2002:a05:620a:269c:b0:8c0:d341:9cef with SMTP id af79cd13be357-8c0d341a826mr2546753385a.73.1766781092994;
        Fri, 26 Dec 2025 12:31:32 -0800 (PST)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0970f5fa6sm1797460785a.28.2025.12.26.12.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 12:31:32 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <a9aa92b5-5e5a-4e9f-bfa3-31033d190457@redhat.com>
Date: Fri, 26 Dec 2025 15:31:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/33] cpuset: Propagate cpuset isolation update to
 workqueue through housekeeping
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
 <20251224134520.33231-19-frederic@kernel.org>
In-Reply-To: <20251224134520.33231-19-frederic@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bbHh42EWrbuZQOyGjdNKrlSjR4l3NBmdWuTFvwC1qos_1766781093
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_123138_819161_B356D9B6 
X-CRM114-Status: GOOD (  27.76  )
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
> Until now, cpuset would propagate isolated partition changes to
> workqueues so that unbound workers get properly reaffined.
>
> Since housekeeping now centralizes, synchronize and propagates isolation
> cpumask changes, perform the work from that subsystem for consolidation
> and consistency purposes.
>
> For simplification purpose, the target function is adapted to take the
> new housekeeping mask instead of the isolated mask.
>
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>   include/linux/workqueue.h |  2 +-
>   init/Kconfig              |  1 +
>   kernel/cgroup/cpuset.c    |  9 +++------
>   kernel/sched/isolation.c  |  4 +++-
>   kernel/workqueue.c        | 17 ++++++++++-------
>   5 files changed, 18 insertions(+), 15 deletions(-)
>
> diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
> index dabc351cc127..a4749f56398f 100644
> --- a/include/linux/workqueue.h
> +++ b/include/linux/workqueue.h
> @@ -588,7 +588,7 @@ struct workqueue_attrs *alloc_workqueue_attrs_noprof(void);
>   void free_workqueue_attrs(struct workqueue_attrs *attrs);
>   int apply_workqueue_attrs(struct workqueue_struct *wq,
>   			  const struct workqueue_attrs *attrs);
> -extern int workqueue_unbound_exclude_cpumask(cpumask_var_t cpumask);
> +extern int workqueue_unbound_housekeeping_update(const struct cpumask *hk);
>   
>   extern bool queue_work_on(int cpu, struct workqueue_struct *wq,
>   			struct work_struct *work);
> diff --git a/init/Kconfig b/init/Kconfig
> index fa79feb8fe57..518830fb812f 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1254,6 +1254,7 @@ config CPUSETS
>   	bool "Cpuset controller"
>   	depends on SMP
>   	select UNION_FIND
> +	select CPU_ISOLATION
>   	help
>   	  This option will let you create and manage CPUSETs which
>   	  allow dynamically partitioning a system into sets of CPUs and
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index e13e32491ebf..a492d23dd622 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -1484,15 +1484,12 @@ static void update_isolation_cpumasks(void)
>   
>   	lockdep_assert_cpus_held();
>   
> -	ret = workqueue_unbound_exclude_cpumask(isolated_cpus);
> -	WARN_ON_ONCE(ret < 0);
> -
> -	ret = tmigr_isolated_exclude_cpumask(isolated_cpus);
> -	WARN_ON_ONCE(ret < 0);
> -
>   	ret = housekeeping_update(isolated_cpus, HK_TYPE_DOMAIN);
>   	WARN_ON_ONCE(ret < 0);
>   
> +	ret = tmigr_isolated_exclude_cpumask(isolated_cpus);
> +	WARN_ON_ONCE(ret < 0);
> +
>   	isolated_cpus_updating = false;
>   }
>   
> diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
> index 7dbe037ea8df..d224bca299ed 100644
> --- a/kernel/sched/isolation.c
> +++ b/kernel/sched/isolation.c
> @@ -121,6 +121,7 @@ EXPORT_SYMBOL_GPL(housekeeping_test_cpu);
>   int housekeeping_update(struct cpumask *isol_mask, enum hk_type type)
>   {
>   	struct cpumask *trial, *old = NULL;
> +	int err;
>   
>   	if (type != HK_TYPE_DOMAIN)
>   		return -ENOTSUPP;
> @@ -149,10 +150,11 @@ int housekeeping_update(struct cpumask *isol_mask, enum hk_type type)
>   	pci_probe_flush_workqueue();
>   	mem_cgroup_flush_workqueue();
>   	vmstat_flush_workqueue();
> +	err = workqueue_unbound_housekeeping_update(housekeeping_cpumask(type));
>   
>   	kfree(old);
>   
> -	return 0;
> +	return err;
>   }
>   
>   void __init housekeeping_init(void)
> diff --git a/kernel/workqueue.c b/kernel/workqueue.c
> index 253311af47c6..eb5660013222 100644
> --- a/kernel/workqueue.c
> +++ b/kernel/workqueue.c
> @@ -6959,13 +6959,16 @@ static int workqueue_apply_unbound_cpumask(const cpumask_var_t unbound_cpumask)
>   }
>   
>   /**
> - * workqueue_unbound_exclude_cpumask - Exclude given CPUs from unbound cpumask
> - * @exclude_cpumask: the cpumask to be excluded from wq_unbound_cpumask
> + * workqueue_unbound_housekeeping_update - Propagate housekeeping cpumask update
> + * @hk: the new housekeeping cpumask
>    *
> - * This function can be called from cpuset code to provide a set of isolated
> - * CPUs that should be excluded from wq_unbound_cpumask.
> + * Update the unbound workqueue cpumask on top of the new housekeeping cpumask such
> + * that the effective unbound affinity is the intersection of the new housekeeping
> + * with the requested affinity set via nohz_full=/isolcpus= or sysfs.
> + *
> + * Return: 0 on success and -errno on failure.
>    */
> -int workqueue_unbound_exclude_cpumask(cpumask_var_t exclude_cpumask)
> +int workqueue_unbound_housekeeping_update(const struct cpumask *hk)
>   {
>   	cpumask_var_t cpumask;
>   	int ret = 0;
> @@ -6981,14 +6984,14 @@ int workqueue_unbound_exclude_cpumask(cpumask_var_t exclude_cpumask)
>   	 * (HK_TYPE_WQ ∩ HK_TYPE_DOMAIN) house keeping mask and rewritten
>   	 * by any subsequent write to workqueue/cpumask sysfs file.
>   	 */
> -	if (!cpumask_andnot(cpumask, wq_requested_unbound_cpumask, exclude_cpumask))
> +	if (!cpumask_and(cpumask, wq_requested_unbound_cpumask, hk))
>   		cpumask_copy(cpumask, wq_requested_unbound_cpumask);
>   	if (!cpumask_equal(cpumask, wq_unbound_cpumask))
>   		ret = workqueue_apply_unbound_cpumask(cpumask);
>   
>   	/* Save the current isolated cpumask & export it via sysfs */
>   	if (!ret)
> -		cpumask_copy(wq_isolated_cpumask, exclude_cpumask);
> +		cpumask_andnot(wq_isolated_cpumask, cpu_possible_mask, hk);
>   
>   	mutex_unlock(&wq_pool_mutex);
>   	free_cpumask_var(cpumask);
Reviewed-by: Waiman Long <longman@redhat.com>


