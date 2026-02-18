Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC84EE9A047
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 12:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GRCj0qUESzvzI1Pl96YD601iynqnDh6I4Otqkg2Gb54=; b=lQANi7S+VqqECZ
	K11BNmqvpqFZDm5/c2fjtP0hiM+qU1pXn5ztHKbpVa/AGgqSKr5WGUWjFaGnJevEXHCGzZmfPO4uf
	ZUihcRAHX6nCxIrTc2Wnwocgm9c1wc+tBAnsNp9jQhwkArP5L8d5pjiBas7O+tKQ4LOrMlB9+lZYq
	jkxxcwj9ohKhYDJkjOCypRr+/wiFryrqrkwryG/k/C7ypk+KZDi9BvGpE27lpbdNCJx4ub+cf5R+2
	UT2uacso212kwFqL17n8Djbu5muMfdoJPphNuP4uMmxAElQ9wopcppmbIM0A7bAed1GDrgMy7d+rp
	RZZXvQUP1wt6qxZ+/mGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsh5P-00000009oce-1q2X;
	Wed, 18 Feb 2026 12:55:24 +0000
Received: from fra-out-011.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([52.28.197.132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsh5M-00000009obq-1dze
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 12:55:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1771419320; x=1802955320;
  h=message-id:date:mime-version:reply-to:subject:to:cc:
   references:from:in-reply-to:content-transfer-encoding;
  bh=GRCj0qUESzvzI1Pl96YD601iynqnDh6I4Otqkg2Gb54=;
  b=d1WuubQ11e+MUockFJa+mr8u+rrt95a9yXz+oBiJbKIE0fO58N2RzbMN
   0dG40HLjUb0ZMK6cBFRNLP16ggvTW4r8qDzsWU7let4MbGn6+t0UFE1c8
   4VU9W7XotAjIY9XEyNVsX+q/2TWMiifPUDtbq0VYW7HfQhstspxwWQnFs
   xIAvUdHYCOPLSs3LmMaK7Kfv45ZO4WkD1dFXT3jhd4LKfEnAW/jRfZssN
   eM+Az8QIEwCTwq4gGeL1ePFch/1mLOQ8cs8IUS6k626wsDnQLt55EnEgc
   +QZcX+gma0v3HKyj7XLdLLG/WhovqrrbjGW0Ek42WMELra033pBmrYOGv
   w==;
X-CSE-ConnectionGUID: eiKe7rzQSLSa46wTMGxIFg==
X-CSE-MsgGUID: yD4xaVC8TOuCEGooPZypIg==
X-IronPort-AV: E=Sophos;i="6.21,298,1763424000"; 
   d="scan'208";a="9505218"
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
  by internal-fra-out-011.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 12:55:14 +0000
Received: from EX19MTAEUB001.ant.amazon.com [54.240.197.226:25156]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.5.167:2525] with esmtp (Farcaster)
 id b474f839-fba7-4942-9ee1-0bb1a3e43cbb; Wed, 18 Feb 2026 12:55:14 +0000 (UTC)
X-Farcaster-Flow-ID: b474f839-fba7-4942-9ee1-0bb1a3e43cbb
Received: from EX19D005EUB003.ant.amazon.com (10.252.51.31) by
 EX19MTAEUB001.ant.amazon.com (10.252.51.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Wed, 18 Feb 2026 12:55:13 +0000
Received: from [192.168.2.195] (10.106.83.9) by EX19D005EUB003.ant.amazon.com
 (10.252.51.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35; Wed, 18 Feb 2026
 12:55:13 +0000
Message-ID: <162cedc3-cd6c-494c-b39e-daadfbd6d8db@amazon.com>
Date: Wed, 18 Feb 2026 12:55:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] KVM: Avoid synchronize_srcu() in
 kvm_io_bus_register_dev()
To: Sean Christopherson <seanjc@google.com>
CC: Keir Fraser <keirf@google.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Eric Auger
	<eric.auger@redhat.com>, Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier
	<maz@kernel.org>, Will Deacon <will@kernel.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Li RongQing <lirongqing@baidu.com>
References: <20250909100007.3136249-1-keirf@google.com>
 <20250909100007.3136249-5-keirf@google.com>
 <a84ddba8-12da-489a-9dd1-ccdf7451a1ba@amazon.com>
 <aY-x0OlJQEqInyNF@google.com>
 <dcbd7a58-c961-4510-ae48-ef7fd4f4d75c@amazon.com>
 <aZS8XXOW7vhMkNWQ@google.com>
Content-Language: en-US
From: Nikita Kalyazin <kalyazin@amazon.com>
Autocrypt: addr=kalyazin@amazon.com; keydata=
 xjMEY+ZIvRYJKwYBBAHaRw8BAQdA9FwYskD/5BFmiiTgktstviS9svHeszG2JfIkUqjxf+/N
 JU5pa2l0YSBLYWx5YXppbiA8a2FseWF6aW5AYW1hem9uLmNvbT7CjwQTFggANxYhBGhhGDEy
 BjLQwD9FsK+SyiCpmmTzBQJnrNfABQkFps9DAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQr5LK
 IKmaZPOpfgD/exazh4C2Z8fNEz54YLJ6tuFEgQrVQPX6nQ/PfQi2+dwBAMGTpZcj9Z9NvSe1
 CmmKYnYjhzGxzjBs8itSUvWIcMsFzjgEY+ZIvRIKKwYBBAGXVQEFAQEHQCqd7/nb2tb36vZt
 ubg1iBLCSDctMlKHsQTp7wCnEc4RAwEIB8J+BBgWCAAmFiEEaGEYMTIGMtDAP0Wwr5LKIKma
 ZPMFAmes18AFCQWmz0MCGwwACgkQr5LKIKmaZPNTlQEA+q+rGFn7273rOAg+rxPty0M8lJbT
 i2kGo8RmPPLu650A/1kWgz1AnenQUYzTAFnZrKSsXAw5WoHaDLBz9kiO5pAK
In-Reply-To: <aZS8XXOW7vhMkNWQ@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.106.83.9]
X-ClientProxiedBy: EX19D012EUA003.ant.amazon.com (10.252.50.98) To
 EX19D005EUB003.ant.amazon.com (10.252.51.31)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_045520_746453_52B345BD 
X-CRM114-Status: GOOD (  26.91  )
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
Reply-To: kalyazin@amazon.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 17/02/2026 19:07, Sean Christopherson wrote:
> On Mon, Feb 16, 2026, Nikita Kalyazin wrote:
>> On 13/02/2026 23:20, Sean Christopherson wrote:
>>> On Fri, Feb 13, 2026, Nikita Kalyazin wrote:
>>>> I am not aware of way to make it fast for both use cases and would be more
>>>> than happy to hear about possible solutions.
>>>
>>> What if we key off of vCPUS being created?  The motivation for Keir's change was
>>> to avoid stalling during VM boot, i.e. *after* initial VM creation.
>>
>> It doesn't work as is on x86 because the delay we're seeing occurs after the
>> created_cpus gets incremented
> 
> I don't follow, the suggestion was to key off created_vcpus in
> kvm_io_bus_register_dev(), not in kvm_swap_active_memslots().  I can totally
> imagine the patch not working, but the ordering in kvm_vm_ioctl_create_vcpu()
> should be largely irrelevant.

Yes, you're right, it's irrelevant.  I had made the change in 
kvm_io_bus_register_dev() like proposed, but have no idea how I couldn't 
see the effect.  I retested it now and it's obvious that it works on 
x86.  Sorry for the confusion.

> 
> Probably a moot point though.

Yes, this will not solve the problem on ARM.

> 
>> so it doesn't allow to differentiate the two
>> cases (below is kvm_vm_ioctl_create_vcpu):
>>
>>        kvm->created_vcpus++; // <===== incremented here
>>        mutex_unlock(&kvm->lock);
>>
>>        vcpu = kmem_cache_zalloc(kvm_vcpu_cache, GFP_KERNEL_ACCOUNT);
>>        if (!vcpu) {
>>                r = -ENOMEM;
>>                goto vcpu_decrement;
>>        }
>>
>>        BUILD_BUG_ON(sizeof(struct kvm_run) > PAGE_SIZE);
>>        page = alloc_page(GFP_KERNEL_ACCOUNT | __GFP_ZERO);
>>        if (!page) {
>>                r = -ENOMEM;
>>                goto vcpu_free;
>>        }
>>        vcpu->run = page_address(page);
>>
>>        kvm_vcpu_init(vcpu, kvm, id);
>>
>>        r = kvm_arch_vcpu_create(vcpu); // <===== the delay is here
>>
>>
>> firecracker   583 [001]   151.297145: probe:synchronize_srcu_expedited:
>> (ffffffff813e5cf0)
>>      ffffffff813e5cf1 synchronize_srcu_expedited+0x1 ([kernel.kallsyms])
>>      ffffffff81234986 kvm_swap_active_memslots+0x136 ([kernel.kallsyms])
>>      ffffffff81236cdd kvm_set_memslot+0x1cd ([kernel.kallsyms])
>>      ffffffff81237518 kvm_set_memory_region.part.0+0x478 ([kernel.kallsyms])
>>      ffffffff81264dbc __x86_set_memory_region+0xec ([kernel.kallsyms])
>>      ffffffff8127e2dc kvm_alloc_apic_access_page+0x5c ([kernel.kallsyms])
>>      ffffffff812b9ed3 vmx_vcpu_create+0x193 ([kernel.kallsyms])
>>      ffffffff8126788a kvm_arch_vcpu_create+0x1da ([kernel.kallsyms])
>>      ffffffff8123c54c kvm_vm_ioctl+0x5fc ([kernel.kallsyms])
>>      ffffffff8167b331 __x64_sys_ioctl+0x91 ([kernel.kallsyms])
>>      ffffffff8251a89c do_syscall_64+0x4c ([kernel.kallsyms])
>>      ffffffff8100012b entry_SYSCALL_64_after_hwframe+0x76 ([kernel.kallsyms])
>>                6512de ioctl+0x32 (/mnt/host/firecracker)
>>                 d99a7 std::rt::lang_start+0x37 (/mnt/host/firecracker)
>>
>> Also, given that it stumbles after the KVM_CREATE_VCPU on ARM (in
>> KVM_SET_USER_MEMORY_REGION), it doesn't look like a universal solution.
> 
> Hmm.  Under the hood, __synchronize_srcu() itself uses __call_srcu, so I _think_
> the only practical difference (aside from waiting, obviously) between call_srcu()
> and synchronize_srcu_expedited() with respect to "transferring" grace period
> latency is that using call_srcu() could start a normal, non-expedited grace period.
> 
> IIUC, SRCU has best-effort logic to shift in-flight non-expedited grace periods
> to expedited mode, but if the normal grace period has already started the timer
> for the delayed invocation of process_srcu(), then SRCU will still wait for one
> jiffie, i.e. won't immediately queue the work.
> 
> I have no idea if this is sane and/or acceptable, but before looping in Paul and
> others, can you try this to see if it helps?

That's exactly what I tried myself before and it didn't help, probably 
for the reason you mentioned above (a normal GP being already started).

> 
> diff --git a/include/linux/srcu.h b/include/linux/srcu.h
> index 344ad51c8f6c..30437dc8d818 100644
> --- a/include/linux/srcu.h
> +++ b/include/linux/srcu.h
> @@ -89,6 +89,8 @@ void __srcu_read_unlock(struct srcu_struct *ssp, int idx) __releases(ssp);
> 
>   void call_srcu(struct srcu_struct *ssp, struct rcu_head *head,
>                  void (*func)(struct rcu_head *head));
> +void call_srcu_expedited(struct srcu_struct *ssp, struct rcu_head *rhp,
> +                        rcu_callback_t func);
>   void cleanup_srcu_struct(struct srcu_struct *ssp);
>   void synchronize_srcu(struct srcu_struct *ssp);
> 
> diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
> index ea3f128de06f..03333b079092 100644
> --- a/kernel/rcu/srcutree.c
> +++ b/kernel/rcu/srcutree.c
> @@ -1493,6 +1493,13 @@ void call_srcu(struct srcu_struct *ssp, struct rcu_head *rhp,
>   }
>   EXPORT_SYMBOL_GPL(call_srcu);
> 
> +void call_srcu_expedited(struct srcu_struct *ssp, struct rcu_head *rhp,
> +                        rcu_callback_t func)
> +{
> +       __call_srcu(ssp, rhp, func, rcu_gp_is_normal());
> +}
> +EXPORT_SYMBOL_GPL(call_srcu_expedited);
> +
>   /*
>    * Helper function for synchronize_srcu() and synchronize_srcu_expedited().
>    */
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 737b74b15bb5..26215f98c98f 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -6036,7 +6036,7 @@ int kvm_io_bus_register_dev(struct kvm *kvm, enum kvm_bus bus_idx, gpa_t addr,
>          memcpy(new_bus->range + i + 1, bus->range + i,
>                  (bus->dev_count - i) * sizeof(struct kvm_io_range));
>          rcu_assign_pointer(kvm->buses[bus_idx], new_bus);
> -       call_srcu(&kvm->srcu, &bus->rcu, __free_bus);
> +       call_srcu_expedited(&kvm->srcu, &bus->rcu, __free_bus);
> 
>          return 0;
>   }


