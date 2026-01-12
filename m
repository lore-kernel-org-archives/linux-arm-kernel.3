Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C4AD25030
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 02:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xcS5shRmDCmvz+IoTKqWTzUo+o6AAuc9PAErT+qJLAs=; b=cVDaugMlgaE5srhP3qYooXhMXy
	afGFr/iPgSovD7fJdCG/MxgXjh8GAypt15mz5wAXGRTXoMHH2I9QbRZL0vjCZulGArnvch8lFI1EH
	Z4L5HMGJUTqJtRjbK6wdxOgguKXPSr8kcLg01nrqh/zhrFSNZZhCpLomO8lsW+x1P/BMTGEvRLRzM
	kxvXWQ4X165X6fMy/6khPbHCofjReXnQo1UvF7ddUnOBtkJCVm/t31HmEMkWN1lv18XY1Gye6gB5z
	xfFWBKx25mjBc48rQWxljplPghOw9tdf1W4PkVl55zZ3kdTPmFR7FiEve2Wn4t93sMQtPeluIKnPX
	tgcdJqtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf7wN-00000004ghx-09Ut;
	Mon, 12 Jan 2026 02:45:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf7wK-00000004ggs-2QFy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 02:45:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768185955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xcS5shRmDCmvz+IoTKqWTzUo+o6AAuc9PAErT+qJLAs=;
	b=AmdIi6GPiC9AqkP6W9IqvOlQnyMvYx8djlUNSlZXsv8YItQljxLEdblr7uaEeNsZ8mTJIQ
	GZoCVMNc1Wz1eVr74CgoChGou+0pl5C3oNivkAKiNtGcyvtXhCSEK/mVRomk1GWBiQkvsc
	OI9dzg+TsIRfhn4UJjAizQcwHXyh3XE=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176--vj3eGP6OyWl-QpwAsV1nA-1; Sun, 11 Jan 2026 21:45:53 -0500
X-MC-Unique: -vj3eGP6OyWl-QpwAsV1nA-1
X-Mimecast-MFC-AGG-ID: -vj3eGP6OyWl-QpwAsV1nA_1768185953
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56364ccf7e4so2819446e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 18:45:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768185953; x=1768790753;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xcS5shRmDCmvz+IoTKqWTzUo+o6AAuc9PAErT+qJLAs=;
        b=qeCAqRYoNPhSHA8LqKF+NYR0y9tjbvX5IWzuxNlk7qR9BVyIaNKWZh62abBtc4nnlx
         jS0FlXjnim7BXbRbyOxPRszLRtaChBDJ3txYGPUBYLZ7IIvdTbhyIdP02w1A468vxgDu
         E+uZPAVeECSfTfzFpyFsscmw8dK6HCIFf8/0KZv1B5dzzVjNxuXKJVz1XXG4AcCruQfr
         PRrU2o5JauTnXSP0I78Bjzh05RgDxyatrrBLhBJYNPu194Dvvk7ZDhZrc44FZ7amr0bp
         ovjS2bJL/Xdwc8nqmrJPcG+ro8qPTnIJrDtKLTFmc0yQqBukVKjrqgtxOytwS6k38tXn
         KHAg==
X-Forwarded-Encrypted: i=1; AJvYcCVKpqwBARnNqGu9uoyiQvnho2Rv6pruu0ZLssyUwe+OorGnZ+f9girmvBIevIYYl3EMo292M2TvyOK1pDWQtnFa@lists.infradead.org
X-Gm-Message-State: AOJu0YzBlYIqYSrrG3/og5FCK0lQ58peuY6QRo0HRmsLET2f32/QIlv9
	gYPcx7XNMC4kkVnihSQqeY+jm/rdEI2T1dYHod2rG2aP+CkynlVbDZzJV8I97Nj8Gqpb+Lf/5Vc
	L3V57mcS3jpZVffucpKRO8e+v8FrBsUA2BtqxyGaw3tDQVYEOwYF60z6HI4+wlKFJiXy07wDM4U
	Z9
X-Gm-Gg: AY/fxX4FuiYVWgzoi+B/BkPYUilDCBuZmzyliYjKsuW4f3BSy/tDmzvoAl8lkgIdRhd
	G4Cuj0T4nm63Luhz7AzJT6JpUN0Fu1CmjFyj29M0FBo7rFTDj3SVrUNpP5/u7WpPwa5onjpt5Hn
	kAXn8ud2UTBI9+ShqeXweYwEnhuh6trnz5JM8cz8M+31/prChoJB/QeMeMlgBDrrZylSsHUovnz
	nElp0NHHCzC6uOR7uMG4BP6FBNBjfzWx3/Is/YeNbYOxQwPPgnsMzvCJbPyrGtdRTjp8n/GAqw/
	uKT1XML5wl4E5MNb/ALvhfQzVh3spOfYyHuKDJ59boSO4PzPavw+9s1AUFADY4xpnAj1+R3sDhO
	Em5qDcu2BE162+z6Y30xz9n3QZjAIh/vqraKCPcRU/2BDHTuriXnqsPvd
X-Received: by 2002:a05:6122:1d4d:b0:55b:1a1b:3273 with SMTP id 71dfb90a1353d-56347d4a0bemr5054203e0c.6.1768185952712;
        Sun, 11 Jan 2026 18:45:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwOFp6cPvfkUcSbRWdkrghqM2mUWR9n3I0P3Nk8PJy6T841SLsur+1hpT47PiYyZ5sXMn8AA==
X-Received: by 2002:a05:6122:1d4d:b0:55b:1a1b:3273 with SMTP id 71dfb90a1353d-56347d4a0bemr5054194e0c.6.1768185952291;
        Sun, 11 Jan 2026 18:45:52 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563667cf148sm8166160e0c.2.2026.01.11.18.45.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 18:45:51 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <18ee9089-8a08-44ed-8761-7c9db765cd4e@redhat.com>
Date: Sun, 11 Jan 2026 21:45:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/33] sched/isolation: Convert housekeeping cpumasks to
 rcu pointers
To: Simon Horman <horms@kernel.org>, Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
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
 Shakeel Butt <shakeel.butt@linux.dev>, Tejun Heo <tj@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, cgroups@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org, netdev@vger.kernel.org
References: <20260101221359.22298-1-frederic@kernel.org>
 <20260101221359.22298-14-frederic@kernel.org>
 <20260107115653.GA196631@kernel.org>
In-Reply-To: <20260107115653.GA196631@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hpnlLmKE9lfUrBLOGHRmu60MP-XV_Z709vMUt7IJ5CI_1768185953
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_184556_693356_8ABA0E46 
X-CRM114-Status: GOOD (  24.81  )
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

On 1/7/26 6:56 AM, Simon Horman wrote:
> On Thu, Jan 01, 2026 at 11:13:38PM +0100, Frederic Weisbecker wrote:
>> HK_TYPE_DOMAIN's cpumask will soon be made modifiable by cpuset.
>> A synchronization mechanism is then needed to synchronize the updates
>> with the housekeeping cpumask readers.
>>
>> Turn the housekeeping cpumasks into RCU pointers. Once a housekeeping
>> cpumask will be modified, the update side will wait for an RCU grace
>> period and propagate the change to interested subsystem when deemed
>> necessary.
>>
>> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
>> ---
>>   kernel/sched/isolation.c | 58 +++++++++++++++++++++++++---------------
>>   kernel/sched/sched.h     |  1 +
>>   2 files changed, 37 insertions(+), 22 deletions(-)
>>
>> diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
>> index 11a623fa6320..83be49ec2b06 100644
>> --- a/kernel/sched/isolation.c
>> +++ b/kernel/sched/isolation.c
>> @@ -21,7 +21,7 @@ DEFINE_STATIC_KEY_FALSE(housekeeping_overridden);
>>   EXPORT_SYMBOL_GPL(housekeeping_overridden);
>>   
>>   struct housekeeping {
>> -	cpumask_var_t cpumasks[HK_TYPE_MAX];
>> +	struct cpumask __rcu *cpumasks[HK_TYPE_MAX];
>>   	unsigned long flags;
>>   };
>>   
>> @@ -33,17 +33,28 @@ bool housekeeping_enabled(enum hk_type type)
>>   }
>>   EXPORT_SYMBOL_GPL(housekeeping_enabled);
>>   
>> +const struct cpumask *housekeeping_cpumask(enum hk_type type)
>> +{
>> +	if (static_branch_unlikely(&housekeeping_overridden)) {
>> +		if (housekeeping.flags & BIT(type)) {
>> +			return rcu_dereference_check(housekeeping.cpumasks[type], 1);
>> +		}
>> +	}
>> +	return cpu_possible_mask;
>> +}
>> +EXPORT_SYMBOL_GPL(housekeeping_cpumask);
>> +
> Hi Frederic,
>
> I think this patch should also update the access to housekeeping.cpumasks
> in housekeeping_setup(), on line 200, to use housekeeping_cpumask().
>
> As is, sparse flags __rcu a annotation miss match there.
>
>    kernel/sched/isolation.c:200:80: warning: incorrect type in argument 3 (different address spaces)
>    kernel/sched/isolation.c:200:80:    expected struct cpumask const *srcp3
>    kernel/sched/isolation.c:200:80:    got struct cpumask [noderef] __rcu *
>
> ...
>
The direct housekeeping.cpumasks[type] reference is in the newly merged 
check after Federic's initial patch series.

                 iter_flags = housekeeping.flags & (HK_FLAG_KERNEL_NOISE 
| HK_FLAG_DOMAIN);
                 type = find_first_bit(&iter_flags, HK_TYPE_MAX);
                 /*
                  * Pass the check if none of these flags were 
previously set or
                  * are not in the current selection.
                  */
                 iter_flags = flags & (HK_FLAG_KERNEL_NOISE | 
HK_FLAG_DOMAIN);
                 first_cpu = (type == HK_TYPE_MAX || !iter_flags) ? 0 :
cpumask_first_and_and(cpu_present_mask,
                                     housekeeping_staging, 
housekeeping.cpumasks[type]);

Maybe that is why it is missed.

Cheers,
Longman


