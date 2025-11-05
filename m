Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46995CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 19:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2I3VQegSFx+o1eosI30+XZ8D9IOQq1JJdeZxqs+aI0=; b=ACM/P376BrOZWlhBhlKADAFU06
	LI+EbhpS7JwFsRBWXsuEiQZFY7Aygh8+k3JQlMNuE/eSFiontaX+O2h6yHsYPRLBb+e9WOiQ8egrf
	jxMnV77WSTmdd/Gj2IGgx46eRxrWv0k/frBU3/sY/QGZG9Z6ZCozeLhUp9DnSpc/CVAA35NN9NrS2
	iRedHCxwk5hJ9+Y/Iv898LghagPJ6ShrqXDPyf11bbKbOD7HOSZv9nFmnNzSfazVIa4vjDGjxvkvz
	TgsOLoYDW56gikAb2gIQgcfXvaPKCAwL3mfFJ5d4cZxEKqZPGNm76VzHT8/zl+/5h0w7USm40PV71
	TOs1oR3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGjGk-0000000EJ3W-3gWZ;
	Wed, 05 Nov 2025 19:34:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGjGh-0000000EJ36-1wWl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 19:34:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762371244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W2I3VQegSFx+o1eosI30+XZ8D9IOQq1JJdeZxqs+aI0=;
	b=ClfGrvCXhBGi8AlsHsu0RAgfHFop4kC/wd4n9IFV8JTo2PMI0R5W6RO4U8K8kNoePPDwuE
	botdVe1ROO6bPtoKjW8xm14Rh0knqkfTGK777nh0RwjUInISGQ6vvLO2pPWXsi9yPX8h2L
	PnrK1Z1784SEiuea/mjHThclw1hwvuM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-nduGZTyqNqewKTnLPUYuDg-1; Wed, 05 Nov 2025 14:34:01 -0500
X-MC-Unique: nduGZTyqNqewKTnLPUYuDg-1
X-Mimecast-MFC-AGG-ID: nduGZTyqNqewKTnLPUYuDg_1762371241
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-891504015e5so52464185a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 11:34:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762371241; x=1762976041;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W2I3VQegSFx+o1eosI30+XZ8D9IOQq1JJdeZxqs+aI0=;
        b=HDKG47peY2DZDhbvv33B6HNAgEs9sSVgdkEwQhoHAZJufuyW8LHcS/RZVWVL1vJA7A
         cBhPWlrTDeiQX//2q5GDU0ys/12WI6h76H75XxA2jFLv47U0m2EH6j77IwaOG2KX7FdM
         lMsUuJJPNLGwEb0S8jbJxtGBEfKS7NVMe/DrE7T96xEXoK24Hp1xg0F1Dx+E1aMqHwd+
         Wga2EzxdpowDTr8e9b10oBryvGDXhJhE9WdCHs4ptupJnxUZXk7YLGp1IuwWa03KUTC7
         aNK1mUz8JzSZOk7/EmXAi/iSPWpGbuPe4ajiOO4G7IBjSXaJzY+QJRC5qp2VoCYIu4kt
         +mGg==
X-Forwarded-Encrypted: i=1; AJvYcCXWT9nOy+4Yl7OgtDELtpo7EMafC9GJ2HyMLVT1LAgvL4VEH30UA5g7peAafJ70rbTNbjYRcQeoUHi7TAGXMnrn@lists.infradead.org
X-Gm-Message-State: AOJu0YzG9Wc36tJgleNVaj8VacMHteF48nYA2i43jRiadCSArnRYjy6/
	8gQ9QfEE/p86TqjZCCurnlfrsCICXN2EBlCPx5nKShf9RYNkNAd2g8RisY6fNO5KcOS8pe3Q1t6
	NjoSeLHR1HoOL60mPWmDmN1mhbGCi7LkrDY6B0hi7vSkU4IM85RojpaxaVh2dZO9yLMM9/VavEn
	1J
X-Gm-Gg: ASbGncviNVVVMBEn5KmnMZpTQEBevefwcgttrkO8sD0n7smxqEJikYBb5jiHW3M3xXF
	gX5iiQorFkEPjNHtgOLQ6opyCx34i2ZcOUnTOCcSFnuc3IuECWFavkYOF/688h7uJIF2sIQj5wr
	XDVZjcgfGpmE0W5U+LSh4DWJeu0NFWnz6EY4xxPGdHeIRClHmiv+30RUAxtKZztxVYwGL3VscI8
	c/fIt7qsCXaTvmP8bJBQ0yQAiItiI9JGdNJB2oGeR/DgX54a2uhiTlIXljTVh8rxpMg8UPlhkhc
	1FAO19cqByDZFHkueNEM711vYz78oyJsJdq6uuN35hSuf8c+PER/fT3dx/AHFDH1roqaqKZqqMz
	oPfXoC5WZgDKSXLmLST37mbwBBd1tth1pyEDWFZLK0kiUbg==
X-Received: by 2002:a05:620a:4807:b0:8a2:e35f:90 with SMTP id af79cd13be357-8b220b1d46emr570523585a.30.1762371241148;
        Wed, 05 Nov 2025 11:34:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGiRwB16QATLm26IUQJMPlOrIcZC/Pp82bOb2D9HMznRcFkSivER3LckBzG5MspPvf0gexFmQ==
X-Received: by 2002:a05:620a:4807:b0:8a2:e35f:90 with SMTP id af79cd13be357-8b220b1d46emr570517185a.30.1762371240407;
        Wed, 05 Nov 2025 11:34:00 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2357dbcc5sm28762885a.35.2025.11.05.11.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 11:33:59 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <a5e3294b-4d37-4e98-9442-e35ca1949c17@redhat.com>
Date: Wed, 5 Nov 2025 14:33:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/33] cpuset: Update HK_TYPE_DOMAIN cpumask from cpuset
To: Frederic Weisbecker <frederic@kernel.org>, Waiman Long <llong@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
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
 <0e02915f-bde7-4b04-b760-89f34fb0a436@redhat.com>
 <aQtwbRrFBCUoQ2Yj@localhost.localdomain>
In-Reply-To: <aQtwbRrFBCUoQ2Yj@localhost.localdomain>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GUEV7bA9XcHa4yhjBGPlnNyBJycea5cLNBHcqSczju4_1762371241
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_113407_576296_01500B70 
X-CRM114-Status: GOOD (  20.80  )
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

On 11/5/25 10:42 AM, Frederic Weisbecker wrote:
> Le Tue, Oct 21, 2025 at 12:10:16AM -0400, Waiman Long a écrit :
>> On 10/13/25 4:31 PM, Frederic Weisbecker wrote:
>>> Until now, HK_TYPE_DOMAIN used to only include boot defined isolated
>>> CPUs passed through isolcpus= boot option. Users interested in also
>>> knowing the runtime defined isolated CPUs through cpuset must use
>>> different APIs: cpuset_cpu_is_isolated(), cpu_is_isolated(), etc...
>>>
>>> There are many drawbacks to that approach:
>>>
>>> 1) Most interested subsystems want to know about all isolated CPUs, not
>>>     just those defined on boot time.
>>>
>>> 2) cpuset_cpu_is_isolated() / cpu_is_isolated() are not synchronized with
>>>     concurrent cpuset changes.
>>>
>>> 3) Further cpuset modifications are not propagated to subsystems
>>>
>>> Solve 1) and 2) and centralize all isolated CPUs within the
>>> HK_TYPE_DOMAIN housekeeping cpumask.
>>>
>>> Subsystems can rely on RCU to synchronize against concurrent changes.
>>>
>>> The propagation mentioned in 3) will be handled in further patches.
>>>
>>> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
>>> ---
>>>    include/linux/sched/isolation.h |  2 +
>>>    kernel/cgroup/cpuset.c          |  2 +
>>>    kernel/sched/isolation.c        | 75 ++++++++++++++++++++++++++++++---
>>>    kernel/sched/sched.h            |  1 +
>>>    4 files changed, 74 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
>>> index da22b038942a..94d5c835121b 100644
>>> --- a/include/linux/sched/isolation.h
>>> +++ b/include/linux/sched/isolation.h
>>> @@ -32,6 +32,7 @@ extern const struct cpumask *housekeeping_cpumask(enum hk_type type);
>>>    extern bool housekeeping_enabled(enum hk_type type);
>>>    extern void housekeeping_affine(struct task_struct *t, enum hk_type type);
>>>    extern bool housekeeping_test_cpu(int cpu, enum hk_type type);
>>> +extern int housekeeping_update(struct cpumask *mask, enum hk_type type);
>>>    extern void __init housekeeping_init(void);
>>>    #else
>>> @@ -59,6 +60,7 @@ static inline bool housekeeping_test_cpu(int cpu, enum hk_type type)
>>>    	return true;
>>>    }
>>> +static inline int housekeeping_update(struct cpumask *mask, enum hk_type type) { return 0; }
>>>    static inline void housekeeping_init(void) { }
>>>    #endif /* CONFIG_CPU_ISOLATION */
>>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>>> index aa1ac7bcf2ea..b04a4242f2fa 100644
>>> --- a/kernel/cgroup/cpuset.c
>>> +++ b/kernel/cgroup/cpuset.c
>>> @@ -1403,6 +1403,8 @@ static void update_unbound_workqueue_cpumask(bool isolcpus_updated)
>>>    	ret = workqueue_unbound_exclude_cpumask(isolated_cpus);
>>>    	WARN_ON_ONCE(ret < 0);
>>> +	ret = housekeeping_update(isolated_cpus, HK_TYPE_DOMAIN);
>>> +	WARN_ON_ONCE(ret < 0);
>>>    }
>>>    /**
>>> diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
>>> index b46c20b5437f..95d69c2102f6 100644
>>> --- a/kernel/sched/isolation.c
>>> +++ b/kernel/sched/isolation.c
>>> @@ -29,18 +29,48 @@ static struct housekeeping housekeeping;
>>>    bool housekeeping_enabled(enum hk_type type)
>>>    {
>>> -	return !!(housekeeping.flags & BIT(type));
>>> +	return !!(READ_ONCE(housekeeping.flags) & BIT(type));
>>>    }
>>>    EXPORT_SYMBOL_GPL(housekeeping_enabled);
>>> +static bool housekeeping_dereference_check(enum hk_type type)
>>> +{
>>> +	if (IS_ENABLED(CONFIG_LOCKDEP) && type == HK_TYPE_DOMAIN) {
>>> +		/* Cpuset isn't even writable yet? */
>>> +		if (system_state <= SYSTEM_SCHEDULING)
>>> +			return true;
>>> +
>>> +		/* CPU hotplug write locked, so cpuset partition can't be overwritten */
>>> +		if (IS_ENABLED(CONFIG_HOTPLUG_CPU) && lockdep_is_cpus_write_held())
>>> +			return true;
>>> +
>>> +		/* Cpuset lock held, partitions not writable */
>>> +		if (IS_ENABLED(CONFIG_CPUSETS) && lockdep_is_cpuset_held())
>>> +			return true;
>> I have some doubt about this condition as the cpuset_mutex may be held in
>> the process of making changes to an isolated partition that will impact
>> HK_TYPE_DOMAIN cpumask.
> Indeed and therefore if the current process is holding the cpuset mutex,
> it is guaranteed that no other process will update the housekeeping cpumask
> concurrently.
>
> So the housekeeping mask is guaranteed to be stable, right? Of course
> the current task may be changing it but while it is changing it, it is
> not reading it.

Right. The lockdep check is for the current task, not other tasks that 
holding the lock.

Thanks,
Longman


