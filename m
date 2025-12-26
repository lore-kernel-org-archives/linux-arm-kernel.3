Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25816E7AD7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 03:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKHp6uC5zNb3gZSMB9BQPFV3o9H0iVs2RJyYgnJbrKc=; b=u/trDCjWDeOtJQSHDJU2/iwyTH
	RpeYZIyErgl3s+2PeavMBgiqpaF6eIJJJigcqi4AuZxR6iSUP4Et8pERSAsHqDUHNOi2LTlNljGLT
	6gIPYJTbPRxU8qpc/4aI8lxttpURzmwkt0jCFpQ/MoXJFbiL6RGQzUP6j/wxW0MipjqOzUZINukZ9
	KpabbqWiKsRLMBV1kRTG0s82zfOAB8MEnXhQ3eM96mVV16UGXXqgzK9tZV3+9Ve7pY7riYvrkSo+4
	sRI3MQx5EmvjcTlBZLVhqvUkSXLKSgIUQ3yQnUC6A1LeRAGA6AAoG+wtx5vJKVV39gOJCqpNm+xlO
	UEi4euGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYyOI-00000000r4f-3Gg6;
	Fri, 26 Dec 2025 03:21:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYyOF-00000000r3r-2Al6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 03:21:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766719277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dKHp6uC5zNb3gZSMB9BQPFV3o9H0iVs2RJyYgnJbrKc=;
	b=SQKBLgM6bKLYePxUlnJJS61R+Ob/e76i8C5+xTjJmXm43xJ1Ohx/HBC/iP7t9KBJTWTXhl
	U2ARbSZrwzh5kLIN6xxb+UO6Ezo8mGlWOvU1xCX5GhaEgDAVQVZOlye5xkHuGUITtJ2iNN
	2q3cjoDHQnzUv4I+XW4ougj1IICB3yE=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-163-B9Zo_pTANLurPjAFpxu0_A-1; Thu, 25 Dec 2025 22:21:15 -0500
X-MC-Unique: B9Zo_pTANLurPjAFpxu0_A-1
X-Mimecast-MFC-AGG-ID: B9Zo_pTANLurPjAFpxu0_A_1766719274
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0e952f153so223607005ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 19:21:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766719274; x=1767324074;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dKHp6uC5zNb3gZSMB9BQPFV3o9H0iVs2RJyYgnJbrKc=;
        b=Gv5f5Qt7iEkwpltIa9pCq7JiWdvv43eoFD3zt5hXDmUdb6PzBVb89d0AnXzbcmiO7D
         Ytbtl66InGChkLFl3LFc1VqLBzPvo0/GvY48YDnpB2TEv6mEpsobNcpNUgwznVZXyG9u
         s8uaGQcez9ME3+Uez3U6BgLENT+aZU+mi6Ij6sxXRkHVnQCVsIVikCU8odszSr3JnfXE
         GrxFaqDasn2kyEjvCMbd2diCIcp38d28XWGOcBqzIGeh58KdW9weIkd5BtZS6IUEUPfZ
         SRLmdWiQNsd/gJ3BBsm96alWXPoUJ4y7IagJbtXzmSgvZpnWl2CYXUaMGvM8mc2Ry4mW
         Pgbw==
X-Forwarded-Encrypted: i=1; AJvYcCVuPR7tGvB10SleYyiRs+pCHjGcRl0jTnVrT5rr5/2fNLgNo9Z+knQIZgq5k66Rb+kp3lvVhJ5cqYXzdzEb1EQN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+O+vtd6/9FEIzP/xrUx1pm2QI2CRORiqHN5mY9gxp2E6qHyDd
	h/9kNlraYEqoVSiiDJ2/A71dEQjHNzg7klUB71x2J0Utvm9nLSDpgCJJtGSkRHV/yOA/2ws1Cyk
	+AzuDMmuIN+f7qUxJVzy4b+ECmdF+TtUiQ9xfWnq+p4HqpPQAtzKYGJ5K6uYfuZueFbk+7zz211
	bk
X-Gm-Gg: AY/fxX7zd/k01bAH6VgvwlSEUGHEAoW/Duuzy6hfhPAYP29pJUZTstjmXNkNzLdpBNu
	x1tmu0JWxXISwgQMmZKaxy2e+VUAI9Om+68bvzFdCePYZAgmEMhcDJ9bHZmQsDNsF0lrZr/2pj/
	jXvumfsd25sWghDtt4JxWgvejxQheThDSQ5bb7xIulkgPt52f7LvE4wVdas4vJV+rP9Ra+WjmFa
	AcIQKu6TqEwt8bOmDazBbLe7a4ze/gvQdL0cRZEIc9M5YQDq0RZLEoiFZGITlcoqoFu3245P8HS
	6FuqdwyEo/EvBzXwakNZkYxfyh25kHx/0rL9k4DAIqphMH1HGq00AhtBsv07Zrh+zY7xoQ8ujcd
	6tnSLhLCRT0RRdUP/YH5EteVL8NCKtIpSO2j7q0c32qMuCBMtaNk19dew
X-Received: by 2002:a05:7022:f902:20b0:11c:b3ad:1fe1 with SMTP id a92af1059eb24-121722b1a7bmr20901006c88.11.1766719274185;
        Thu, 25 Dec 2025 19:21:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrRbO/uTv2AgLdwLaHgNpsWrHMXpzUWqpTKYvMicj4UtKVHtP6aAiwD9wbO4xGgVHronC7tQ==
X-Received: by 2002:a05:7022:f902:20b0:11c:b3ad:1fe1 with SMTP id a92af1059eb24-121722b1a7bmr20900963c88.11.1766719273695;
        Thu, 25 Dec 2025 19:21:13 -0800 (PST)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfd95sm80252105c88.1.2025.12.25.19.21.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Dec 2025 19:21:13 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <5b019a5c-1db4-41d9-aca9-2e3eaf1cece9@redhat.com>
Date: Thu, 25 Dec 2025 22:20:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/33] cpuset: Update HK_TYPE_DOMAIN cpumask from cpuset
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
 <20251224134520.33231-15-frederic@kernel.org>
 <17aadc7e-7dd6-4335-a748-e66f0239df85@redhat.com>
In-Reply-To: <17aadc7e-7dd6-4335-a748-e66f0239df85@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zUrqX-Z4a5KXdPzAIJxBU_0uieH-6zzR77uCMfpCyik_1766719274
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_192119_634743_B66C0330 
X-CRM114-Status: GOOD (  24.05  )
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

On 12/25/25 9:24 PM, Waiman Long wrote:
> On 12/24/25 8:45 AM, Frederic Weisbecker wrote:
>> Until now, HK_TYPE_DOMAIN used to only include boot defined isolated
>> CPUs passed through isolcpus= boot option. Users interested in also
>> knowing the runtime defined isolated CPUs through cpuset must use
>> different APIs: cpuset_cpu_is_isolated(), cpu_is_isolated(), etc...
>>
>> There are many drawbacks to that approach:
>>
>> 1) Most interested subsystems want to know about all isolated CPUs, not
>>    just those defined on boot time.
>>
>> 2) cpuset_cpu_is_isolated() / cpu_is_isolated() are not synchronized 
>> with
>>    concurrent cpuset changes.
>>
>> 3) Further cpuset modifications are not propagated to subsystems
>>
>> Solve 1) and 2) and centralize all isolated CPUs within the
>> HK_TYPE_DOMAIN housekeeping cpumask.
>>
>> Subsystems can rely on RCU to synchronize against concurrent changes.
>>
>> The propagation mentioned in 3) will be handled in further patches.
>>
>> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
>> ---
>>   include/linux/sched/isolation.h |  7 +++
>>   kernel/cgroup/cpuset.c          |  3 ++
>>   kernel/sched/isolation.c        | 76 ++++++++++++++++++++++++++++++---
>>   kernel/sched/sched.h            |  1 +
>>   4 files changed, 81 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/linux/sched/isolation.h 
>> b/include/linux/sched/isolation.h
>> index 109a2149e21a..6842a1ba4d13 100644
>> --- a/include/linux/sched/isolation.h
>> +++ b/include/linux/sched/isolation.h
>> @@ -9,6 +9,11 @@
>>   enum hk_type {
>>       /* Revert of boot-time isolcpus= argument */
>>       HK_TYPE_DOMAIN_BOOT,
>> +    /*
>> +     * Same as HK_TYPE_DOMAIN_BOOT but also includes the
>> +     * revert of cpuset isolated partitions. As such it
>> +     * is always a subset of HK_TYPE_DOMAIN_BOOT.
>> +     */
>>       HK_TYPE_DOMAIN,
>>       /* Revert of boot-time isolcpus=managed_irq argument */
>>       HK_TYPE_MANAGED_IRQ,
>> @@ -35,6 +40,7 @@ extern const struct cpumask 
>> *housekeeping_cpumask(enum hk_type type);
>>   extern bool housekeeping_enabled(enum hk_type type);
>>   extern void housekeeping_affine(struct task_struct *t, enum hk_type 
>> type);
>>   extern bool housekeeping_test_cpu(int cpu, enum hk_type type);
>> +extern int housekeeping_update(struct cpumask *isol_mask, enum 
>> hk_type type);
>>   extern void __init housekeeping_init(void);
>>     #else
>> @@ -62,6 +68,7 @@ static inline bool housekeeping_test_cpu(int cpu, 
>> enum hk_type type)
>>       return true;
>>   }
>>   +static inline int housekeeping_update(struct cpumask *isol_mask, 
>> enum hk_type type) { return 0; }
>>   static inline void housekeeping_init(void) { }
>>   #endif /* CONFIG_CPU_ISOLATION */
>>   diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index 5e2e3514c22e..e13e32491ebf 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
>> @@ -1490,6 +1490,9 @@ static void update_isolation_cpumasks(void)
>>       ret = tmigr_isolated_exclude_cpumask(isolated_cpus);
>>       WARN_ON_ONCE(ret < 0);
>>   +    ret = housekeeping_update(isolated_cpus, HK_TYPE_DOMAIN);
>> +    WARN_ON_ONCE(ret < 0);
>> +
>>       isolated_cpus_updating = false;
>>   }
>>   diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
>> index 83be49ec2b06..a124f1119f2e 100644
>> --- a/kernel/sched/isolation.c
>> +++ b/kernel/sched/isolation.c
>> @@ -29,18 +29,48 @@ static struct housekeeping housekeeping;
>>     bool housekeeping_enabled(enum hk_type type)
>>   {
>> -    return !!(housekeeping.flags & BIT(type));
>> +    return !!(READ_ONCE(housekeeping.flags) & BIT(type));
>>   }
>>   EXPORT_SYMBOL_GPL(housekeeping_enabled);
>>   +static bool housekeeping_dereference_check(enum hk_type type)
>> +{
>> +    if (IS_ENABLED(CONFIG_LOCKDEP) && type == HK_TYPE_DOMAIN) {
>
> To be more correct, we should use IS_ENABLED(CONFIG_PROVE_LOCKING) as 
> this is the real kconfig that enables most of the lockdep checking. 
> PROVE_LOCKING selects LOCKDEP but not vice versa. So for some weird 
> configs that set LOCKDEP but not PROVE_LOCKING, it can cause 
> compilation problem. 

I think I get confused too. The various lockdep* helpers should be 
defined when CONFIG_LOCKDEP is enabled even if they may not do anything 
useful. So using IS_ENABLED(CONFIG_LOCKDEP) should be fine. Sorry for 
the noise.

Reviewed-by: Waiman Long <longman@redhat.com>


