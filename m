Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA3B5E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 16:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jrmNUEzHaPbfzPastsRVKoN7SSf1AJHpgCYDuVUBkcs=; b=ouKcspHBedvdbHBjivBsWP4zSg
	DUrTAQOHWnWUwiTPjJJ0pJik7R0LJgLrl4akbTYGRT+lwnmjz74TpRY9iS2/aWIWLjV5f15lHh5p1
	ywDVVUOHQ0ycwigfQf5bgw1ebLGyaWZDiv0OjgGIBiRiUgCE6VwAfmOzYTBc8y1Jk80SsCRMtsvqs
	uEk/0rm0LrzvmFAh/QYjqM8s9r0ZdlAy91MbnZWeiX+ekcsTWXfSRFZp/7Ddqt6/hQXxeM9p4Nuxi
	5GWkVpHN39sU4E07fkZkZ9clW0U0KOZy8+DMLg7+NVWKHR8CxUb/cfplhHS0VnfXb4E8O8Z0s0wDZ
	NgRW4SXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3J7-0000000C8FX-0JYH;
	Tue, 10 Dec 2024 16:41:57 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL3I3-0000000C7y5-0fr8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 16:40:52 +0000
Received: from [10.16.84.29] (unknown [131.107.8.93])
	by linux.microsoft.com (Postfix) with ESMTPSA id 564502047222;
	Tue, 10 Dec 2024 08:40:49 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 564502047222
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1733848849;
	bh=jrmNUEzHaPbfzPastsRVKoN7SSf1AJHpgCYDuVUBkcs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qaAvYq7lyqspuQZ7OkIAAqOTvmA+2X29R4IObrDpeT1/2dvBSeRobjCAh6lzuXTIB
	 mCRwtak/ZzDJ5+IqnZv+ZWmlbSk5oi8gPenZI/luDYlvBia7HUu+Z7kvfxa3KjhD8E
	 TnsRBHVn/f7nO8STVaJc0gW220fXwfN8VhaB3pdg=
Message-ID: <fec1aeb7-ea07-4363-9e6a-50b0c778e855@linux.microsoft.com>
Date: Tue, 10 Dec 2024 08:40:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hyperv: Move hv_current_partition_id to arch-generic
 code
To: Michael Kelley <mhklinux@outlook.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>
Cc: "kys@microsoft.com" <kys@microsoft.com>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>,
 "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "jinankjain@linux.microsoft.com" <jinankjain@linux.microsoft.com>,
 "muminulrussell@gmail.com" <muminulrussell@gmail.com>,
 "skinsburskii@linux.microsoft.com" <skinsburskii@linux.microsoft.com>,
 "mukeshrathor@microsoft.com" <mukeshrathor@microsoft.com>
References: <1733523707-15954-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1733523707-15954-2-git-send-email-nunodasneves@linux.microsoft.com>
 <SN6PR02MB4157E39FBEFB18EB9A695EECD4332@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <SN6PR02MB4157E39FBEFB18EB9A695EECD4332@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_084051_252573_30EFC90A 
X-CRM114-Status: GOOD (  30.83  )
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

On 12/7/2024 7:01 PM, Michael Kelley wrote:
> From: Nuno Das Neves <nunodasneves@linux.microsoft.com> Sent: Friday, December 6, 2024 2:22 PM
>>
>> Make hv_current_partition_id available in both x86_64 and arm64.
>> This feature isn't specific to x86_64 and will be needed by common
>> code.
>>
>> While at it, replace the BUG()s with WARN()s. Failing to get the id
>> need not crash the machine (although it is a very bad sign).
>>
>> Signed-off-by: Nuno Das Neves <nudasnev@microsoft.com>
>> ---
>>  arch/arm64/hyperv/mshyperv.c    |  3 +++
>>  arch/x86/hyperv/hv_init.c       | 25 +------------------------
>>  arch/x86/include/asm/mshyperv.h |  2 --
>>  drivers/hv/hv_common.c          | 23 +++++++++++++++++++++++
>>  include/asm-generic/mshyperv.h  |  2 ++
>>  5 files changed, 29 insertions(+), 26 deletions(-)
>>
>> diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
>> index b1a4de4eee29..5050e748d266 100644
>> --- a/arch/arm64/hyperv/mshyperv.c
>> +++ b/arch/arm64/hyperv/mshyperv.c
>> @@ -19,6 +19,9 @@
>>
>>  static bool hyperv_initialized;
>>
>> +u64 hv_current_partition_id = HV_PARTITION_ID_SELF;
>> +EXPORT_SYMBOL_GPL(hv_current_partition_id);
>> +
> 
> Instead of adding a definition of hv_current_partition_id on
> the arm64 side, couldn't the definition on the x86 side in
> hv_init.c be moved to hv_common.c (or maybe somewhere
> else that is specific to running in the root partition, per my
> comments in the cover letter), so there is only one definition
> shared by both architectures?
> 
Yes, that's a better idea.

>>  int hv_get_hypervisor_version(union hv_hypervisor_version_info *info)
>>  {
>>  	hv_get_vpreg_128(HV_REGISTER_HYPERVISOR_VERSION,
>> diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c
>> index 95eada2994e1..950f5ccdb9d9 100644
>> --- a/arch/x86/hyperv/hv_init.c
>> +++ b/arch/x86/hyperv/hv_init.c
>> @@ -35,7 +35,7 @@
>>  #include <clocksource/hyperv_timer.h>
>>  #include <linux/highmem.h>
>>
>> -u64 hv_current_partition_id = ~0ull;
>> +u64 hv_current_partition_id = HV_PARTITION_ID_SELF;
>>  EXPORT_SYMBOL_GPL(hv_current_partition_id);
>>
>>  void *hv_hypercall_pg;
>> @@ -394,24 +394,6 @@ static void __init hv_stimer_setup_percpu_clockev(void)
>>  		old_setup_percpu_clockev();
>>  }
>>
>> -static void __init hv_get_partition_id(void)
>> -{
>> -	struct hv_get_partition_id *output_page;
>> -	u64 status;
>> -	unsigned long flags;
>> -
>> -	local_irq_save(flags);
>> -	output_page = *this_cpu_ptr(hyperv_pcpu_output_arg);
>> -	status = hv_do_hypercall(HVCALL_GET_PARTITION_ID, NULL, output_page);
>> -	if (!hv_result_success(status)) {
>> -		/* No point in proceeding if this failed */
>> -		pr_err("Failed to get partition ID: %lld\n", status);
>> -		BUG();
>> -	}
>> -	hv_current_partition_id = output_page->partition_id;
>> -	local_irq_restore(flags);
>> -}
>> -
>>  #if IS_ENABLED(CONFIG_HYPERV_VTL_MODE)
>>  static u8 __init get_vtl(void)
>>  {
>> @@ -606,11 +588,6 @@ void __init hyperv_init(void)
>>
>>  	register_syscore_ops(&hv_syscore_ops);
>>
>> -	if (cpuid_ebx(HYPERV_CPUID_FEATURES) & HV_ACCESS_PARTITION_ID)
>> -		hv_get_partition_id();
>> -
>> -	BUG_ON(hv_root_partition && hv_current_partition_id == ~0ull);
>> -
>>  #ifdef CONFIG_PCI_MSI
>>  	/*
>>  	 * If we're running as root, we want to create our own PCI MSI domain.
>> diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
>> index 5f0bc6a6d025..9eeca2a6d047 100644
>> --- a/arch/x86/include/asm/mshyperv.h
>> +++ b/arch/x86/include/asm/mshyperv.h
>> @@ -44,8 +44,6 @@ extern bool hyperv_paravisor_present;
>>
>>  extern void *hv_hypercall_pg;
>>
>> -extern u64 hv_current_partition_id;
>> -
>>  extern union hv_ghcb * __percpu *hv_ghcb_pg;
>>
>>  bool hv_isolation_type_snp(void);
>> diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
>> index 7a35c82976e0..819bcfd2b149 100644
>> --- a/drivers/hv/hv_common.c
>> +++ b/drivers/hv/hv_common.c
>> @@ -278,11 +278,34 @@ static void hv_kmsg_dump_register(void)
>>  	}
>>  }
>>
>> +static void __init hv_get_partition_id(void)
>> +{
>> +	struct hv_get_partition_id *output_page;
>> +	u64 status;
>> +	unsigned long flags;
>> +
>> +	local_irq_save(flags);
>> +	output_page = *this_cpu_ptr(hyperv_pcpu_output_arg);
>> +	status = hv_do_hypercall(HVCALL_GET_PARTITION_ID, NULL, output_page);
>> +	if (!hv_result_success(status)) {
>> +		local_irq_restore(flags);
>> +		WARN(true, "Failed to get partition ID: %lld\n", status);
>> +		return;
>> +	}
>> +	hv_current_partition_id = output_page->partition_id;
>> +	local_irq_restore(flags);
>> +}
>> +
>>  int __init hv_common_init(void)
>>  {
>>  	int i;
>>  	union hv_hypervisor_version_info version;
>>
>> +	if (ms_hyperv.priv_high & HV_ACCESS_PARTITION_ID)
>> +		hv_get_partition_id();
> 
> hv_get_partition_id() uses the hyperv_pcpu_output_arg, and at
> this point, hyperv_pcpu_output_arg isn't set. That setup
> is done later in hv_common_init().
> 
>> +
>> +	WARN_ON(hv_root_partition && hv_current_partition_id == HV_PARTITION_ID_SELF);
>> +
> 
> Since the hypercall will fail cleanly if the calling VM doesn't
> have the HV_ACCESS_PARTITION_ID privilege, could the
> above be simplified to just this?
> 
> 	if (hv_root_partition)
> 		hv_get_partition_id():
> 
> A non-root partition VM doesn't need to get the partition ID, while a
> root partition should have the privilege. If the hypercall fails, there's
> already a WARN, so there's no value in doing another WARN. Also if
> the hypercall succeeds, it presumably returns a specific partitionID, not
> HV_PARTITION_ID_SELF, so we know we have what we want.
> 
> There's already an "if (hv_root_partition)" statement for setting up
> the hyperv_pcpu_output_arg. The call to hv_get_partition_id() could
> go under that existing "if" *after* the hyperv_pcpu_output_arg is
> set. :-)
> 
Thank you, that makes sense. I'll make the changes you suggested for v2.

Nuno

> Michael
> 
>>  	/* Get information about the Hyper-V host version */
>>  	if (!hv_get_hypervisor_version(&version))
>>  		pr_info("Hyper-V: Host Build %d.%d.%d.%d-%d-%d\n",
>> diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
>> index 8fe7aaab2599..8c4ff6e9aae7 100644
>> --- a/include/asm-generic/mshyperv.h
>> +++ b/include/asm-generic/mshyperv.h
>> @@ -60,6 +60,8 @@ struct ms_hyperv_info {
>>  extern struct ms_hyperv_info ms_hyperv;
>>  extern bool hv_nested;
>>
>> +extern u64 hv_current_partition_id;
>> +
>>  extern void * __percpu *hyperv_pcpu_input_arg;
>>  extern void * __percpu *hyperv_pcpu_output_arg;
>>
>> --
>> 2.34.1


