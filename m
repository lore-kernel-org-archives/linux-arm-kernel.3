Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F98CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 02:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f7NJ5BHZawfzP3SjdeFGSHGjJ23dkO6ZAs2KcuU9kho=; b=KXizxBWkSykxXgHaiXwc1JM3h8
	V22mHy7macpodLs742PY0bxE604t5hMqc8Dz7qKSKtKdBSIxoRQUnO8pWkgR0vK7FCOD3WOW+UQoY
	1E4AB1P/JGrcQgg/5pT0IIQVQ8rIOK6S6KCtQNdEgRsYBYsEjc+iC81wIyyLBnB+COArrapFxOJRw
	duVFLfZhEIMxnjiLce/RUBEc664hSzU7YcsTs1XDJ0rmq/fHpECBJbCewysCpreMDYg/D+70NoLDc
	ClKxzKsgRyr1V05o1Vf39V36zuY4nKjY47kDlv/kLPpFggS0aW7qS+pTM/yIuWmyEIGL+zGD1210I
	7htKg58g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFkMd-0000000948y-39NM;
	Mon, 03 Nov 2025 02:32:11 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFkMb-0000000948H-2M65
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 02:32:11 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4d0Fw91mGgzYQtkM
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Nov 2025 10:31:53 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id E166C1A07BB
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Nov 2025 10:32:05 +0800 (CST)
Received: from [10.67.111.176] (unknown [10.67.111.176])
	by APP1 (Coremail) with SMTP id cCh0CgDHN0slFAhpPKf4CQ--.38631S2;
	Mon, 03 Nov 2025 10:32:05 +0800 (CST)
Message-ID: <400165fe-18d5-4a78-b4bd-4e5b55de0c04@huaweicloud.com>
Date: Mon, 3 Nov 2025 10:32:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/33] cpuset: Provide lockdep check for cpuset lock held
To: Frederic Weisbecker <frederic@kernel.org>
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
 Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>,
 Will Deacon <will@kernel.org>, cgroups@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org, netdev@vger.kernel.org
References: <20251013203146.10162-1-frederic@kernel.org>
 <20251013203146.10162-12-frederic@kernel.org>
 <b94f6159-a280-4890-a02a-f19ff808de5b@huaweicloud.com>
 <aQTe6X5XXSp8_3z5@localhost.localdomain>
Content-Language: en-US
From: Chen Ridong <chenridong@huaweicloud.com>
In-Reply-To: <aQTe6X5XXSp8_3z5@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgDHN0slFAhpPKf4CQ--.38631S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tryxCw1kAF1UJrWfKw4DJwb_yoW5Jr1rpF
	yDKFyrCF4rZr4UuFy2qw17uF1vqw4kWF1UGFn5tr18XasFvFn2vF1v9r1Ygr1F9rs7Gw40
	vF17Wa9I9FWqyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26rWY6Fy7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8
	Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
	xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
	xUsPfHUUUUU
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_183209_920922_BDA5E3A1 
X-CRM114-Status: GOOD (  18.10  )
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



On 2025/11/1 0:08, Frederic Weisbecker wrote:
> Le Tue, Oct 14, 2025 at 09:29:25PM +0800, Chen Ridong a écrit :
>>
>>
>> On 2025/10/14 4:31, Frederic Weisbecker wrote:
>>> cpuset modifies partitions, including isolated, while holding the cpuset
>>> mutex.
>>>
>>> This means that holding the cpuset mutex is safe to synchronize against
>>> housekeeping cpumask changes.
>>>
>>> Provide a lockdep check to validate that.
>>>
>>> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
>>> ---
>>>  include/linux/cpuset.h | 2 ++
>>>  kernel/cgroup/cpuset.c | 7 +++++++
>>>  2 files changed, 9 insertions(+)
>>>
>>> diff --git a/include/linux/cpuset.h b/include/linux/cpuset.h
>>> index 2ddb256187b5..051d36fec578 100644
>>> --- a/include/linux/cpuset.h
>>> +++ b/include/linux/cpuset.h
>>> @@ -18,6 +18,8 @@
>>>  #include <linux/mmu_context.h>
>>>  #include <linux/jump_label.h>
>>>  
>>> +extern bool lockdep_is_cpuset_held(void);
>>> +
>>>  #ifdef CONFIG_CPUSETS
>>>  
>>>  /*
>>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>>> index 8595f1eadf23..aa1ac7bcf2ea 100644
>>> --- a/kernel/cgroup/cpuset.c
>>> +++ b/kernel/cgroup/cpuset.c
>>> @@ -279,6 +279,13 @@ void cpuset_full_unlock(void)
>>>  	cpus_read_unlock();
>>>  }
>>>  
>>> +#ifdef CONFIG_LOCKDEP
>>> +bool lockdep_is_cpuset_held(void)
>>> +{
>>> +	return lockdep_is_held(&cpuset_mutex);
>>> +}
>>> +#endif
>>> +
>>>  static DEFINE_SPINLOCK(callback_lock);
>>>  
>>>  void cpuset_callback_lock_irq(void)
>>
>> Is the lockdep_is_cpuset_held function actually being used?
>> If CONFIG_LOCKDEP is disabled, compilation would fail with an "undefined reference to
>> lockdep_is_cpuset_held" error.
> 
> Although counter-intuitive, this is how the lockdep_is_held() functions family
> do work.
> 
> This allows this kind of trick:
> 
> if (IS_ENABLED(CONFIG_LOCKDEP))
>    WARN_ON_ONCE(!lockdep_is_held(&some_lock))
> 
> This works during the compilation because the prototype of lockdep_is_held()
> is declared. And since the IS_ENABLED() is resolved during compilation as well,
> the conditional code is wiped out and therefore not linked. As a result the
> linker doesn't even look for the definition of lockdep_is_held() and we don't
> need to define an off case that would return a wrong assumption.
> 
> Thanks.
> 

Thank you for your explanation

-- 
Best regards,
Ridong


