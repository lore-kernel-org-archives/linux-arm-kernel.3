Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583DBEDF178
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 15:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wc3wuiR4d5qR9HNFKkQBL/RhcLLo/Jro4GjXQoKeDOE=; b=h7iGOejdfKEBJf
	RZGLPR7fMWAf2KLQaEEtbCwng7VpJB4cA/VnJfgcgDvq08RZW9AcS/2ZjOW0erqHuMSj5g9Vqj8dK
	z8XqrLJkKc5DNpyb/2BL/EExKgucQ4mAIns9u9OrrRQePjb5DU5RSNYhLu3SI/4L3acEwZNJWBurI
	K4E7ko80blYhBQ+UCjBtEQ2V4rfyO3gn2UH/lkEAaGXuLdj7rY5JePLRk2UKQ6lLClLEDkcKmqpJ5
	cY9Z9yp/UJGTmpF9/YPBQl2BOkj+ykHEFnYD+C2tDlLggz7/aA0ecYYzElTMJQ5EV5mF9SXOLz3/3
	qaDSgWoNrNf/kvT+rDQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqvJQ-00000003cbU-40c5;
	Fri, 13 Feb 2026 15:42:32 +0000
Received: from fra-out-006.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([18.197.217.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqvJM-00000003cb3-1yBr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 15:42:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770997348; x=1802533348;
  h=message-id:date:mime-version:reply-to:subject:to:cc:
   references:from:in-reply-to:content-transfer-encoding;
  bh=wc3wuiR4d5qR9HNFKkQBL/RhcLLo/Jro4GjXQoKeDOE=;
  b=sxJUIR0TxOTxrjg8chCWngeI2JmWY548m3CnZnDhVrGg7J7tkVrNXyHa
   Nu8oTjOR9QD86KT/7EO66yRUJkM5KmeaJtVNyhT08MeogvFzT3Gjh2ZPb
   DAfHTj5asKYNtfNJPgJiRxaqG6472mzSm+rqZgShdmq4PnyDASqYfxPYx
   6yrzL3p1+lw+PV6wbwxmKeRmZ0g+d1LvvzHKtbkTbnGeazdfzG4Y/gUgv
   OvQOJkx8szgY4GiVfPPqZsmmXMeWrpvXeI4RiawuoU6aFXxhM2jxK5r3p
   o0ekcrAuQzMXbAWYq8zNoRKGHFdrYN7loDu94AFSagXjlZULe3qAUWux2
   A==;
X-CSE-ConnectionGUID: xBWKtWbURmCvJTHWq/NQzw==
X-CSE-MsgGUID: v1IpJRI/Q9ms7OkLKHCw5g==
X-IronPort-AV: E=Sophos;i="6.21,288,1763424000"; 
   d="scan'208";a="9442917"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
  by internal-fra-out-006.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 15:42:22 +0000
Received: from EX19MTAEUA001.ant.amazon.com [54.240.197.233:18090]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.34.99:2525] with esmtp (Farcaster)
 id 66f259df-d113-42b5-9bad-4cdd94991272; Fri, 13 Feb 2026 15:42:22 +0000 (UTC)
X-Farcaster-Flow-ID: 66f259df-d113-42b5-9bad-4cdd94991272
Received: from EX19D005EUB003.ant.amazon.com (10.252.51.31) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Fri, 13 Feb 2026 15:42:21 +0000
Received: from [192.168.1.242] (10.106.82.26) by EX19D005EUB003.ant.amazon.com
 (10.252.51.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35; Fri, 13 Feb 2026
 15:42:21 +0000
Message-ID: <a84ddba8-12da-489a-9dd1-ccdf7451a1ba@amazon.com>
Date: Fri, 13 Feb 2026 15:42:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] KVM: Avoid synchronize_srcu() in
 kvm_io_bus_register_dev()
To: Keir Fraser <keirf@google.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
CC: Sean Christopherson <seanjc@google.com>, Eric Auger
	<eric.auger@redhat.com>, Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier
	<maz@kernel.org>, Will Deacon <will@kernel.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Li RongQing <lirongqing@baidu.com>
References: <20250909100007.3136249-1-keirf@google.com>
 <20250909100007.3136249-5-keirf@google.com>
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
In-Reply-To: <20250909100007.3136249-5-keirf@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.106.82.26]
X-ClientProxiedBy: EX19D009EUA002.ant.amazon.com (10.252.50.88) To
 EX19D005EUB003.ant.amazon.com (10.252.51.31)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_074228_822008_E20C8406 
X-CRM114-Status: GOOD (  21.63  )
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



On 09/09/2025 11:00, Keir Fraser wrote:
> Device MMIO registration may happen quite frequently during VM boot,
> and the SRCU synchronization each time has a measurable effect
> on VM startup time. In our experiments it can account for around 25%
> of a VM's startup time.
> 
> Replace the synchronization with a deferred free of the old kvm_io_bus
> structure.


Hi,

We noticed that this change introduced a regression of ~20 ms to the 
first KVM_CREATE_VCPU call of a VM, which is significant for our use case.

Before the patch:
45726 14:45:32.914330 ioctl(25, KVM_CREATE_VCPU, 0) = 28 <0.000137>
45726 14:45:32.914533 ioctl(25, KVM_CREATE_VCPU, 1) = 30 <0.000046>

After the patch:
30295 14:47:08.057412 ioctl(25, KVM_CREATE_VCPU, 0) = 28 <0.025182>
30295 14:47:08.082663 ioctl(25, KVM_CREATE_VCPU, 1) = 30 <0.000031>

The reason, as I understand, it happens is call_srcu() called from 
kvm_io_bus_register_dev() are adding callbacks to be called after a 
normal GP, which is 10 ms with HZ=100.  The subsequent 
synchronize_srcu_expedited() called from kvm_swap_active_memslots() 
(from KVM_CREATE_VCPU) has to wait for the normal GP to complete before 
making progress.  I don't fully understand why the delay is consistently 
greater than 1 GP, but that's what we see across our testing scenarios.

I verified that the problem is relaxed if the GP is reduced by 
configuring HZ=1000.  In that case, the regression is in the order of 1 ms.

It looks like in our case we don't benefit much from the intended 
optimisation as the number of device MMIO registrations is limited and 
and they don't cost us much (each takes at most 16 us, but most commonly 
~6 us):

      firecracker 68452 [054]  3053.183991: 
kprobes:kvm_io_bus_register_dev: (ffffffffc0348390)
      firecracker 68452 [054]  3053.184007: 
kprobes:kvm_io_bus_register_dev__return: (ffffffffc0348390 <- 
ffffffffc03aa190)
      firecracker 68452 [054]  3053.184007: 
kprobes:kvm_io_bus_register_dev: (ffffffffc0348390)
      firecracker 68452 [054]  3053.184014: 
kprobes:kvm_io_bus_register_dev__return: (ffffffffc0348390 <- 
ffffffffc03aa1b9)
      firecracker 68452 [054]  3053.184015: 
kprobes:kvm_io_bus_register_dev: (ffffffffc0348390)
      firecracker 68452 [054]  3053.184021: 
kprobes:kvm_io_bus_register_dev__return: (ffffffffc0348390 <- 
ffffffffc03aa1db)
      firecracker 68452 [054]  3053.184028: 
kprobes:kvm_io_bus_register_dev: (ffffffffc0348390)
      firecracker 68452 [054]  3053.184034: 
kprobes:kvm_io_bus_register_dev__return: (ffffffffc0348390 <- 
ffffffffc03ac957)
      firecracker 68452 [054]  3053.184093: 
kprobes:kvm_io_bus_register_dev: (ffffffffc0348390)
      firecracker 68452 [054]  3053.184099: 
kprobes:kvm_io_bus_register_dev__return: (ffffffffc0348390 <- 
ffffffffc03ab51a)
      firecracker 68452 [054]  3053.184100: 
kprobes:kvm_io_bus_register_dev: (ffffffffc0348390)
      firecracker 68452 [054]  3053.184106: 
kprobes:kvm_io_bus_register_dev__return: (ffffffffc0348390 <- 
ffffffffc03ab549)
      firecracker 68452 [054]  3053.193145: 
kprobes:kvm_io_bus_register_dev: (ffffffffc0348390)
      firecracker 68452 [054]  3053.193164: 
kprobes:kvm_io_bus_register_dev__return: (ffffffffc0348390 <- 
ffffffffc0348c9f)
      firecracker 68452 [054]  3053.193165: 
kprobes:kvm_io_bus_register_dev: (ffffffffc0348390)
      firecracker 68452 [054]  3053.193171: 
kprobes:kvm_io_bus_register_dev__return: (ffffffffc0348390 <- 
ffffffffc0348c9f)

Our env:
  - 6.18
  - Arch: the analysis above is from x86, but ARM regressed very similarly
  - CONFIG_HZ=100
  - VMM: Firecracker (https://github.com/firecracker-microvm/firecracker)


I am not aware of way to make it fast for both use cases and would be 
more than happy to hear about possible solutions.


Thanks,
Nikita

> 
> Tested-by: Li RongQing <lirongqing@baidu.com>
> Signed-off-by: Keir Fraser <keirf@google.com>
> ---
>   include/linux/kvm_host.h |  1 +
>   virt/kvm/kvm_main.c      | 11 +++++++++--
>   2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index e7d6111cf254..103be35caf0d 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -206,6 +206,7 @@ struct kvm_io_range {
>   struct kvm_io_bus {
>   	int dev_count;
>   	int ioeventfd_count;
> +	struct rcu_head rcu;
>   	struct kvm_io_range range[];
>   };
>   
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 870ad8ea93a7..bcef324ccbf2 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1320,6 +1320,7 @@ static void kvm_destroy_vm(struct kvm *kvm)
>   		kvm_free_memslots(kvm, &kvm->__memslots[i][1]);
>   	}
>   	cleanup_srcu_struct(&kvm->irq_srcu);
> +	srcu_barrier(&kvm->srcu);
>   	cleanup_srcu_struct(&kvm->srcu);
>   #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
>   	xa_destroy(&kvm->mem_attr_array);
> @@ -5952,6 +5953,13 @@ int kvm_io_bus_read(struct kvm_vcpu *vcpu, enum kvm_bus bus_idx, gpa_t addr,
>   }
>   EXPORT_SYMBOL_GPL(kvm_io_bus_read);
>   
> +static void __free_bus(struct rcu_head *rcu)
> +{
> +	struct kvm_io_bus *bus = container_of(rcu, struct kvm_io_bus, rcu);
> +
> +	kfree(bus);
> +}
> +
>   int kvm_io_bus_register_dev(struct kvm *kvm, enum kvm_bus bus_idx, gpa_t addr,
>   			    int len, struct kvm_io_device *dev)
>   {
> @@ -5990,8 +5998,7 @@ int kvm_io_bus_register_dev(struct kvm *kvm, enum kvm_bus bus_idx, gpa_t addr,
>   	memcpy(new_bus->range + i + 1, bus->range + i,
>   		(bus->dev_count - i) * sizeof(struct kvm_io_range));
>   	rcu_assign_pointer(kvm->buses[bus_idx], new_bus);
> -	synchronize_srcu_expedited(&kvm->srcu);
> -	kfree(bus);
> +	call_srcu(&kvm->srcu, &bus->rcu, __free_bus);
>   
>   	return 0;
>   }


