Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF5DC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 22:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hCnqJ7SE7al4Vf7tPnRzZDoKUhMbtBFVu0ZhtEEKigc=; b=DYDl3ETejS1Nnf+QPu/PYofgFF
	QYn6lfNl2WsCy9J946tnexONdhsA50r/knQvp7DrIREKaRXX28Ga2po1Pjim6lT296B8lFx3IX/1n
	3ci1wZzqwA3cET/h3X57l9AOvnwyCQpMTGg4XPD0RARdxHy7NCV/M33214zO8dxGp3JkZ0/x6n3HH
	itewdiv3TdvgPh+WZi2kT4S0ppli+xEtd7q7xbMnoPr3HcCi1Qy0BwaUuZ2tmUosD3ykDgDzLz9I1
	LuiYl2FJb9mGsLMK799ARuFbv068csoVnKdoJskmWoSJWzTULQFwIgUFITHr1kID0b+8Rzs2m5x08
	QMZUX8vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tajQ0-0000000BLo1-0LaB;
	Wed, 22 Jan 2025 22:41:52 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tajOg-0000000BLhj-3yIz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 22:40:32 +0000
Received: from [10.0.0.115] (c-67-182-156-199.hsd1.wa.comcast.net [67.182.156.199])
	by linux.microsoft.com (Postfix) with ESMTPSA id C5D1320460B2;
	Wed, 22 Jan 2025 14:40:28 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C5D1320460B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1737585629;
	bh=hCnqJ7SE7al4Vf7tPnRzZDoKUhMbtBFVu0ZhtEEKigc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jV0bdZ8MWiaF7fwCD5m/9rSCTR1iGYtuscbstQLeZAkO3oP0iczLr9QrORaMuJpl3
	 Zk8dsXz6bMqvTOrsg4blv1v+drOvsa4cv1XB6w5+lYACNmkPx12WAdvegg6g5t0Mek
	 gsBCoQzMP398BFpkMx7EM3kX3F4pBkUtLwknx4uc=
Message-ID: <3e684fba-bf73-4c6c-806f-19fba74eb3f3@linux.microsoft.com>
Date: Wed, 22 Jan 2025 14:40:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hyperv: Move hv_current_partition_id to arch-generic
 code
To: Wei Liu <wei.liu@kernel.org>
Cc: linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, kys@microsoft.com,
 haiyangz@microsoft.com, mhklinux@outlook.com, decui@microsoft.com,
 catalin.marinas@arm.com, will@kernel.org, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, arnd@arndb.de, jinankjain@linux.microsoft.com,
 muminulrussell@gmail.com, skinsburskii@linux.microsoft.com,
 mukeshrathor@microsoft.com
References: <1733523707-15954-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1733523707-15954-2-git-send-email-nunodasneves@linux.microsoft.com>
 <Z1P69tl2qMNH-xmg@liuwe-devbox-debian-v2>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <Z1P69tl2qMNH-xmg@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_144031_050331_8959D5A8 
X-CRM114-Status: GOOD (  25.96  )
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

On 12/6/2024 11:36 PM, Wei Liu wrote:
> On Fri, Dec 06, 2024 at 02:21:46PM -0800, Nuno Das Neves wrote:
>> From: Nuno Das Neves <nudasnev@microsoft.com>
>>
>> Make hv_current_partition_id available in both x86_64 and arm64.
>> This feature isn't specific to x86_64 and will be needed by common
>> code.
>>
>> While at it, replace the BUG()s with WARN()s. Failing to get the id
>> need not crash the machine (although it is a very bad sign).
>>
> 
> A lot of things have changed since it was introduced. I don't remember
> why I decided to use BUG() instead of WARN() in the first place.
> 
> If the system can still function without knowing its partition id, then
> can this be removed completely? We can always use the SELF id.
> 

Missed this earlier, sorry.

I checked the code and it seems that HV_PARTITION_ID_SELF may be sufficient.
However, I'm not sure if there is some case where it is actually needed,
so I'm hesitant to remove it at the moment.

Nuno

> Thanks,
> Wei.
> 
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
>> +
>> +	WARN_ON(hv_root_partition && hv_current_partition_id == HV_PARTITION_ID_SELF);
>> +
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
>>


