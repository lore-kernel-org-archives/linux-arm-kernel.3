Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7922CF45BD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 17:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9TjQuHk6AbSuF3wU6pHO95OUHC0x3l8Lsr+qaj6DcQU=; b=vfIeMYdUabvX2jgTPin0oj8qUA
	i1eHwenB3J4VmfzK3NmZxQSfsHdUtpg1kl9HY8jT3Y0z26v49NrkUFi6H1mnK/4Vv6WwWR/v1gNup
	UvNE1A2z+jeDaTHE7F/fe0uAg2pYbje4M7IBfiA/0ieJDzoJcQtAJRG4AvTimQkXsMGRc1BPIdMUH
	CYvhvxiNLN7cY9jFVuyUHoC1f+slvPaXHe+eoShE7XvEoyBBI6jlfYfgZ0ZOerof5z58NbmaAHGQl
	e11O+qlHrglajSaaJTKWaFww+WG9fPf9g/IRBbCQ7rRETh/geF54FubYsul+z8X0YP1nE7oXhFgmD
	9kHRuDxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfM7G-00000005t8W-3BYt;
	Mon, 12 Jan 2026 17:54:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfM7E-00000005t83-2fmR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 17:54:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768240447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9TjQuHk6AbSuF3wU6pHO95OUHC0x3l8Lsr+qaj6DcQU=;
	b=UT+GrsaVKKGYw2mDPmf6/Q1PFpQKUeE+e+g+3JU8Yi1VbR1tg53QrXHaVoFN4x2jVr2Xy6
	08ITeB4JdRSzOd6af2E1EZBrQNq6jhNQQOpBdBko5jT0GJLPijWPfwbZY5lo3lIBnGMU9K
	/8ClP6bdNLEU6TEa+C9//Qk7wTsbrNI=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-vgRyM4ddNaWUYTfigNKnUA-1; Mon, 12 Jan 2026 12:54:06 -0500
X-MC-Unique: vgRyM4ddNaWUYTfigNKnUA-1
X-Mimecast-MFC-AGG-ID: vgRyM4ddNaWUYTfigNKnUA_1768240444
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-94125ded3dbso19454400241.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 09:54:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768240444; x=1768845244;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9TjQuHk6AbSuF3wU6pHO95OUHC0x3l8Lsr+qaj6DcQU=;
        b=DUcJMoHo3FJ2h30NNkF6rCWf2vgZU4EsRAwSnM7Tsw571n5gUqPvj33LmqiwR5AGg9
         /Y+CuhRdeDgdUroH2rZFSTF1bJnWilGHY9oAZAKUrXhdtj+KRoxggR2D1wPZSleV4BRy
         eZ91HMs4dT5kR2B7suzieP7WcnfLOGwryMmf4fogEZH4/J/BV+z3DpTrEdzqQ++0M96Y
         usrTW4jwb0KqDbFKoF+TIrsaprWJRZnx5ngGEJpF9DFdUm5XA1P4FfZ5VZu2Nqo+DC/S
         L3wXtj2KkwBSfc1EAZ50ZZBBTaH8xVMgaxOkcBnk18x+bCX63mTz8wqLgEcOANRf2O5k
         wRKA==
X-Forwarded-Encrypted: i=1; AJvYcCXwFGdm+g427qCP+knITqisxtGhN/S0kbd1DDq7nPMv5qIkObGmj6L2TR6DUYkB39LvlEmmDHAh5gsl5j2Zy+lo@lists.infradead.org
X-Gm-Message-State: AOJu0YwZlQ/dR/4mtbC4nMemmiFWfM3E/YomHKhubTGt/I23TyVkh47y
	mcD02IY3Hh4N1wuKivNYJhqAP70/nEop6AAt3l46Yzp3RwTvXDxb4JXzPUJUeQLETSrAWCB6lgL
	IwgFQ5GbyoUTW9EEfHPc7rG1HK/972k+/ANAqrgY+vgAz5pCzl3o0s5KaY5F4yRj2z6uzpByVzb
	vh
X-Gm-Gg: AY/fxX7oVPy3FrQO5L55qprFAAsEPRIKkZHSCbEwZrgofSqLv6nKNcQ7Eh6DQGTECFu
	HJ6JKv3u1wPPnUf2BYvS3GC54E9cODSs2C4TzWax56sSmXEvjQaYbwKkNSnpTTXMIXBY3aBJ1aw
	nc0N4OlB7K8k9Ed8svw2ArhlxnFm1V7mvaxr0+9U42IVnqxdcMPPq5JCW0qvF6EWsmHWSB8JxDe
	P5Wrv+BEV6TDycjnzqztXrvZnLPT1Yk/CavfuHOESSXf2Jnh73HhdYmOKBgHjNMqvV4T7pEAI/m
	bkLW+Km7S7EuL2L1KAZtSHSfW9WFFHXJee4+Whg7rYDutmWlHhy0bgLJ3mrn0rOy5cPPZsPTmkU
	DZy4XXsCkpl/XjKP5t+UvR6A93volzwKtpI4tyGAKNo0tIui2vQWqKvrZ
X-Received: by 2002:a05:6122:4f88:b0:563:8335:9ab7 with SMTP id 71dfb90a1353d-5638335b3d9mr1837533e0c.19.1768240444535;
        Mon, 12 Jan 2026 09:54:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxwLoMJ4ylgMx4yokJUFTrQvglGoUK2cQ8cuwE9wOBcOJlyALmmG0hMGzOjgHwYtiz9Ob2mA==
X-Received: by 2002:a05:6122:4f88:b0:563:8335:9ab7 with SMTP id 71dfb90a1353d-5638335b3d9mr1837491e0c.19.1768240444039;
        Mon, 12 Jan 2026 09:54:04 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5634ca16da7sm15469803e0c.17.2026.01.12.09.53.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 09:54:03 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <f8ca375e-9051-4c7c-880d-e56e07206788@redhat.com>
Date: Mon, 12 Jan 2026 12:53:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/33] cpuset: Provide lockdep check for cpuset lock held
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
References: <20260101221359.22298-1-frederic@kernel.org>
 <20260101221359.22298-13-frederic@kernel.org>
 <e97d96fc-cbdf-4c03-aa1a-b0cde5419681@redhat.com>
In-Reply-To: <e97d96fc-cbdf-4c03-aa1a-b0cde5419681@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ngCjBr4lUoj8GJXZ6cU0MkwxhQJwakIcNT4PQfLwgCY_1768240444
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_095408_872558_4376FBCB 
X-CRM114-Status: GOOD (  17.73  )
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

On 1/11/26 8:43 PM, Waiman Long wrote:
> On 1/1/26 5:13 PM, Frederic Weisbecker wrote:
>> cpuset modifies partitions, including isolated, while holding the cpuset
>> mutex.
>>
>> This means that holding the cpuset mutex is safe to synchronize against
>> housekeeping cpumask changes.
>>
>> Provide a lockdep check to validate that.
>>
>> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
>> ---
>>   include/linux/cpuset.h | 2 ++
>>   kernel/cgroup/cpuset.c | 7 +++++++
>>   2 files changed, 9 insertions(+)
>>
>> diff --git a/include/linux/cpuset.h b/include/linux/cpuset.h
>> index a98d3330385c..1c49ffd2ca9b 100644
>> --- a/include/linux/cpuset.h
>> +++ b/include/linux/cpuset.h
>> @@ -18,6 +18,8 @@
>>   #include <linux/mmu_context.h>
>>   #include <linux/jump_label.h>
>>   +extern bool lockdep_is_cpuset_held(void);
>> +
>>   #ifdef CONFIG_CPUSETS
>>     /*
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index 3afa72f8d579..5e2e3514c22e 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
>> @@ -283,6 +283,13 @@ void cpuset_full_unlock(void)
>>       cpus_read_unlock();
>>   }
>>   +#ifdef CONFIG_LOCKDEP
>> +bool lockdep_is_cpuset_held(void)
>> +{
>> +    return lockdep_is_held(&cpuset_mutex);
>> +}
>> +#endif
>> +
>>   static DEFINE_SPINLOCK(callback_lock);
>>     void cpuset_callback_lock_irq(void)
>
> The cgroup/for-next tree already have a similar 
> lockdep_assert_cpuset_lock_held() defined. So you can drop this patch 
> if this series won't land in the next merge window. 

Sorry, the other new lockdep API isn't exactly the same as what you 
propose here. So it is not a replacement for your use case. Sorry for 
the noise.

Cheers,
Longman


