Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93143CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 13:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5OyVUTCl3mA/IpHFPIB2uENQCkK3x5bzk0a2B6mBcQ4=; b=EjKMkMXFqx7SYso6I4kQ2nrK3/
	uYaSYWszb/7P8Upbi2GePe8tEL2AjvHI375xVUf9Eau3K5dJnNRJ/g+fBGL0W0mdpdk+hqXhyT9ZR
	5QFPgeUtzE5XOso6rz44MVlUmBQ7YQh9pvO0puONJJ0/6jA9eqY1yhy4q7k8RRlBXbPEdqdwQpZc3
	lR14oLNXVFgSZOc8XVrBQl7jvxKFrwHzBML0ReRx1v5o3YP/rKG9I3+VT13rH8OZagfFaNSlOL0aC
	/+iR8NIl55srjGGfAAgGlJyASeLbJa5u8fKQKfLPNGqFPjW4fLv6KHyLfF/2dDTDclRMmN/+nYqFc
	To9uqrEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8f5t-0000000GUY3-1O4l;
	Tue, 14 Oct 2025 13:29:37 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8f5q-0000000GUUo-1pK0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 13:29:36 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4cmFRM4QFQzYQtpy
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 21:28:47 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id ABCE01A0F09
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 21:29:28 +0800 (CST)
Received: from [10.67.111.176] (unknown [10.67.111.176])
	by APP2 (Coremail) with SMTP id Syh0CgBnCUI3UO5o6+FkAQ--.29891S2;
	Tue, 14 Oct 2025 21:29:28 +0800 (CST)
Message-ID: <b94f6159-a280-4890-a02a-f19ff808de5b@huaweicloud.com>
Date: Tue, 14 Oct 2025 21:29:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/33] cpuset: Provide lockdep check for cpuset lock held
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
 Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>,
 Will Deacon <will@kernel.org>, cgroups@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org, netdev@vger.kernel.org
References: <20251013203146.10162-1-frederic@kernel.org>
 <20251013203146.10162-12-frederic@kernel.org>
Content-Language: en-US
From: Chen Ridong <chenridong@huaweicloud.com>
In-Reply-To: <20251013203146.10162-12-frederic@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: Syh0CgBnCUI3UO5o6+FkAQ--.29891S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFW3Jw18tw15JFWUWw1fXrb_yoW8XFyxpF
	90krWrG3yFvr4Uua9rGw17ur1vgw4kWF1UKFn8Kr1rXa42vFn2vr1q9FnIqr10q397Gw40
	qF9xWa1Y9rWDArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26rWY6Fy7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8
	Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
	6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07
	j6a0PUUUUU=
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_062934_781576_7ABFCC34 
X-CRM114-Status: GOOD (  16.08  )
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



On 2025/10/14 4:31, Frederic Weisbecker wrote:
> cpuset modifies partitions, including isolated, while holding the cpuset
> mutex.
> 
> This means that holding the cpuset mutex is safe to synchronize against
> housekeeping cpumask changes.
> 
> Provide a lockdep check to validate that.
> 
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>  include/linux/cpuset.h | 2 ++
>  kernel/cgroup/cpuset.c | 7 +++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/include/linux/cpuset.h b/include/linux/cpuset.h
> index 2ddb256187b5..051d36fec578 100644
> --- a/include/linux/cpuset.h
> +++ b/include/linux/cpuset.h
> @@ -18,6 +18,8 @@
>  #include <linux/mmu_context.h>
>  #include <linux/jump_label.h>
>  
> +extern bool lockdep_is_cpuset_held(void);
> +
>  #ifdef CONFIG_CPUSETS
>  
>  /*
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 8595f1eadf23..aa1ac7bcf2ea 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -279,6 +279,13 @@ void cpuset_full_unlock(void)
>  	cpus_read_unlock();
>  }
>  
> +#ifdef CONFIG_LOCKDEP
> +bool lockdep_is_cpuset_held(void)
> +{
> +	return lockdep_is_held(&cpuset_mutex);
> +}
> +#endif
> +
>  static DEFINE_SPINLOCK(callback_lock);
>  
>  void cpuset_callback_lock_irq(void)

Is the lockdep_is_cpuset_held function actually being used?
If CONFIG_LOCKDEP is disabled, compilation would fail with an "undefined reference to
lockdep_is_cpuset_held" error.

-- 
Best regards,
Ridong


