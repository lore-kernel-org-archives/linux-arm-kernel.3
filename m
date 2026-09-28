Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1BBCA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 18:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dboAc+Ui9ZVmYzWJgasnSg7tPvIL6HIFzAoUzDJOAAY=; b=df5j7FXAlhP8dfcgiiOklGnQ5j
	obcAW+FJNbExwaoQK2bDUWnyd9JM5aorkrVKaBOKXUM8chqY0dPFvTmgcgYgBJt9q/vf7Nud5EEM2
	Pv2bj55kn2Nxlqvmj6rJSkMxiq8hOcG3cQVXY18HZbs7qXzK8IMI8dW5LY2zgqDpHLbwgYDolD2pf
	5mnUm4sLddf7bZC9qpA7nPWRJ0JnBpixR6Fmzl/xM92UBsHeJhg6M9LUs7TH+2IfpT3EM5Y3KT+Go
	zDE76BrZolIAgima1q2IW+3HpZ9DRcgIFU54c+j5DOfroNR97ViYxEP+IqqdNAcTgKgTNUTiOToL3
	1X6BqXUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBG5V-00000001KBh-08UF;
	Mon, 28 Sep 2026 18:28:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBG5S-00000001KAQ-39W7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 18:28:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D31A21655;
	Mon, 28 Sep 2026 11:28:21 -0700 (PDT)
Received: from [10.57.12.116] (unknown [10.57.12.116])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C842E3F86F;
	Mon, 28 Sep 2026 11:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790620105; bh=f3DvkzW2iQw+m17VNhkq0p0aYIFiioIzjPtp6J3TSN0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mcFYTgd3hxYj+1w/iSFFS3RH+8JRKNJWnhBdjTsuGBthMAC1uKMNQnAKX49dFPQK/
	 aCHMuuEO/8X+Qh6W0KhSteXcdZ1MZBTTEq1Z0cbjJ5cixApf3fkgJfOe2QV6RJnv+7
	 l0MvfPq0sy15NUOC9H508RTlXCsTaCSD63LFvBTo=
Message-ID: <0f68dcff-1dfe-4515-9912-515ca6457674@arm.com>
Date: Mon, 28 Sep 2026 19:28:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 5/7] firmware: arm_rmm: Activate the RMM
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
 will@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
 aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-6-suzuki.poulose@arm.com> <arZmXFw5Jw2IbAmA@arm.com>
 <a11aba04-eaaa-43fd-988b-a2581b1b2fdb@arm.com> <araketG70TIKeNuf@arm.com>
 <12e83d88-de4c-4230-aac2-1796123320ad@arm.com>
 <70d47475-e26e-40e1-b409-b0c16aecb8c0@arm.com>
 <195cdfe4-a55a-453f-9c34-620738eca244@arm.com> <arqrZ_Auk9BYOopa@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <arqrZ_Auk9BYOopa@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_112826_896682_884DF448 
X-CRM114-Status: GOOD (  38.41  )
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

Hi Catalin

On 28/09/2026 19:01, Catalin Marinas wrote:
> On Mon, Sep 28, 2026 at 02:55:11PM +0100, Suzuki K Poulose wrote:
>> firmware: rmm: Deactivate RMM at reboot
>>
>> Deactivate the RMM at system shutdown. This would allow a normal kexec to
>> cleanup the state and boot into a new kernel gracefully.
>>
>> Kdump kernels need not worry about an active RMM, as long as it can
>> handle the GPF on access to the Delegated granules.
>>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>>   arch/arm64/kernel/machine_kexec.c |  2 +
>>   drivers/firmware/arm_rmm/rmi.c    | 63 ++++++++++++++++++++++++++++++-
>>   include/linux/arm-rmi-cmds.h      | 10 +++++
>>   3 files changed, 73 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/machine_kexec.c
>> b/arch/arm64/kernel/machine_kexec.c
>> index 8f9bc2327dc85..8f16f92a5d389 100644
>> --- a/arch/arm64/kernel/machine_kexec.c
>> +++ b/arch/arm64/kernel/machine_kexec.c
>> @@ -6,6 +6,7 @@
>>    * Copyright (C) Huawei Futurewei Technologies.
>>    */
>>
>> +#include <linux/arm-rmi-cmds.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/irq.h>
>>   #include <linux/kernel.h>
>> @@ -171,6 +172,7 @@ void machine_kexec(struct kimage *kimage)
>>   	BUG_ON(!in_kexec_crash && (stuck_cpus || (num_online_cpus() > 1)));
>>   	WARN(in_kexec_crash && (stuck_cpus || smp_crash_stop_failed()),
>>   		"Some CPUs may be stale, kdump will be unreliable.\n");
>> +	WARN(!in_kexec_crash && is_rmm_active(), "RMM is active, kexec will be
>> unreliable.\n");
>>
>>   	pr_info("Bye!\n");
>>
>> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
>> index 51343e9d5c2a9..5b695f3155b1c 100644
>> --- a/drivers/firmware/arm_rmm/rmi.c
>> +++ b/drivers/firmware/arm_rmm/rmi.c
>> @@ -7,6 +7,7 @@
>>   #include <linux/memblock.h>
>>   #include <linux/memory.h>
>>   #include <linux/arm-rmi-cmds.h>
>> +#include <linux/reboot.h>
>>   #include <linux/slab.h>
>>
>>   #include <asm/memory.h>
>> @@ -15,6 +16,13 @@
>>   /* RMM v2.0 defines RmiFeatureRegister0 to RmiFeatureRegister4. */
>>   static unsigned long rmi_feat_reg_cache[5] __ro_after_init;
>>   static bool arm64_rmi_is_available;
>> +static bool arm64_rmm_active;
>> +
>> +bool is_rmm_active(void)
>> +{
>> +	return arm64_rmm_active;
>> +}
>> +EXPORT_SYMBOL_GPL(is_rmm_active);
>>
>>   /**
>>    * rmi_granule_range_undelegate() - Undelegate a range of granules
>> @@ -1017,6 +1025,53 @@ bool is_rmi_available(void)
>>   }
>>   EXPORT_SYMBOL_GPL(is_rmi_available);
>>
>> +static int rmi_rmm_deactivate(struct rmi_sro_state *sro)
>> +{
>> +	int ret;
>> +
>> +	if (!READ_ONCE(arm64_rmm_active))
>> +		return 0;
>> +
>> +	ret = WARN_ON(rmi_sro_memxfer_cmd(sro, GFP_KERNEL, SMC_RMI_RMM_DEACTIVATE));
>> +	if (ret)
>> +		return ret;
>> +
>> +	WRITE_ONCE(arm64_rmm_active, false);
>> +	WRITE_ONCE(arm64_rmi_is_available, false);
>> +
>> +	return ret;
>> +}
>> +
>> +static int rmi_reboot_notifier(struct notifier_block *nb,
>> +			       unsigned long action, void *data)
>> +{
>> +	int ret;
>> +
>> +	switch (action) {
>> +	case SYS_RESTART:
>> +	case SYS_HALT:
>> +	case SYS_POWER_OFF:
>> +		break;
>> +	default:
>> +		return NOTIFY_DONE;
>> +	}
>> +
>> +	struct rmi_sro_state *sro __free(kfree) = kmalloc_obj(*sro);
>> +
>> +	if (!sro)
>> +		return -ENOMEM;
> 
> Nit: it needs a NOTIFY_* value.

Thanks, Yep, I have fixed it locally based on codex review ;-)
> 
>> +
>> +	ret = rmi_rmm_deactivate(sro);
>> +	if (ret)
>> +		pr_emerg("RMM Deactivation failed: %d\n", ret);
>> +
>> +	return NOTIFY_DONE;
>> +}
>> +
>> +static struct notifier_block rmi_reboot_nb = {
>> +	.notifier_call = rmi_reboot_notifier,
>> +};
> 
> Thinking some more about this, it's a good aim but I think it only works
> if we do a systemctl kexec that tears down the processes (including the
> VMMs). For a direct kexec -e, we happily reboot with pages still
> delegated. Now, such tear-down in the kernel is painful, I think a lot
> more work to figure out the delegated pages.

nit: kexec -e uses normal reboot path, it is only the kexec -f which
skips shutdown path. But yes, forced kexec won't work and that would
probably never work reliably with RMM in place.

> 
> Also we don't cancel the kexec here even if we return an error, just
> warn and continue into the new kernel.

Correct, and that could fail with delegated granules in place.

> 
> So maybe blocking the kexec (e.g. machine_kexec_prepare()) in the first
> place would be a better option for the time being. But I'd like, if

Ack

> possible, to defer the RMM activation until the first user (still do the
> RMI probing as an initcall). If we run on RME-capable hardware and
> firmware but don't care about realms or TSM, we still get the normal OS
> functionality.

Would you prefer this in the first drop of the RMM ? Or is this
something we could add as a separate series ?

> 
> If this deferring works, I'd also make memory hotplug dependent on this
> (RMM activated => no hotplug; hotplug before activation => don't
> activate the RMM). Maybe later, if we have a request for hotplug in
> ZONE_MOVABLE and we can guarantee guest_memfd doesn't allocate from
> there, we can relax this requirement.

Right now guest_memfd doesn't allocate from the ZONE_MOVABLE. But that 
might change in the future and we would need RMM to support it.
Not supported with RMM v2.0 spec.

> 
> That said, we may have a problem with hibernation as well if it tries to
> read the delegated pages. I don't know how it interacts with guest_memfd
> and the non-gmem pages we delegate. Maybe cpus_are_stuck_in_kernel() is
> the right place, it prevents hibernation as well.

Ack.


Cheers
Suzuki


