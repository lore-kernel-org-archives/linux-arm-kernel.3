Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3247C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 23:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+S4RIbdJJnLd8q03RHbHALetITl10NO/5kMAF25RI4=; b=RnLbGR4DQ9jbUXGUZwnUpHIwch
	GrMdoTPF+XE5qqub0HsramQWVg1v9moFrY2W2Zq6eAp/u4iInhdOxbyfKDdp0hii493z+KJg4Ufjz
	ALkbKel6XoeEnBDnYp5CfSsXRsXWqaZ3cWpLuoZIXHIfZ+s3ps0LDluj0YaVZ2GEYcJLsZ8kea6jz
	4v1ZVhzrA2wRNlRIJBSso/4+xIuXPZfpUwz7UT695508WjEUOpOqEr0Wrqo/6ZyFaKGrGBWukBNgj
	tObjvjFEQSiVrQHqLijqQAgama0a2XWB1+cAR2s8VKED6ohn3x43RNgZSzbsr8FNlPL6k5OLii29P
	lyoZZcKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqhAF-0000000FoXO-2cqE;
	Fri, 07 Mar 2025 23:31:35 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqh8c-0000000FoGU-0wWa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 23:29:55 +0000
Received: from [10.0.0.114] (c-67-182-156-199.hsd1.wa.comcast.net [67.182.156.199])
	by linux.microsoft.com (Postfix) with ESMTPSA id 850AF2038F3E;
	Fri,  7 Mar 2025 15:29:52 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 850AF2038F3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741390193;
	bh=A+S4RIbdJJnLd8q03RHbHALetITl10NO/5kMAF25RI4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kwuSZI9PwG4viI97Hm3DoeHH2U9GBgal8aEQ1fN6b4NxNi1YF4VCJP6opazvgnQ0O
	 bqFTaDP+78vMUGaD0QWLd6fF64ipXAE4/mPqy7+zMzkpRNWYgA0dXdtDxz1mEMoeuY
	 PqCIUH3akwZU2TzJZBkInP56RdekIKeCi96/Qt4Q=
Message-ID: <86bf7bae-9423-4413-8986-364d96243c82@linux.microsoft.com>
Date: Fri, 7 Mar 2025 15:29:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/10] x86: hyperv: Add mshv_handler irq handler and
 setup function
To: Michael Kelley <mhklinux@outlook.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
Cc: "kys@microsoft.com" <kys@microsoft.com>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>,
 "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "joro@8bytes.org" <joro@8bytes.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, "arnd@arndb.de"
 <arnd@arndb.de>,
 "jinankjain@linux.microsoft.com" <jinankjain@linux.microsoft.com>,
 "muminulrussell@gmail.com" <muminulrussell@gmail.com>,
 "skinsburskii@linux.microsoft.com" <skinsburskii@linux.microsoft.com>,
 "mrathor@linux.microsoft.com" <mrathor@linux.microsoft.com>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
 "apais@linux.microsoft.com" <apais@linux.microsoft.com>,
 "Tianyu.Lan@microsoft.com" <Tianyu.Lan@microsoft.com>,
 "stanislav.kinsburskiy@gmail.com" <stanislav.kinsburskiy@gmail.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "prapal@linux.microsoft.com" <prapal@linux.microsoft.com>,
 "muislam@microsoft.com" <muislam@microsoft.com>,
 "anrayabh@linux.microsoft.com" <anrayabh@linux.microsoft.com>,
 "rafael@kernel.org" <rafael@kernel.org>, "lenb@kernel.org"
 <lenb@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-9-git-send-email-nunodasneves@linux.microsoft.com>
 <SN6PR02MB415730AA9A9BFFBB9A62F195D4D52@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <SN6PR02MB415730AA9A9BFFBB9A62F195D4D52@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_152954_319040_E5E7AA00 
X-CRM114-Status: GOOD (  19.34  )
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

On 3/7/2025 9:44 AM, Michael Kelley wrote:
> From: Nuno Das Neves <nunodasneves@linux.microsoft.com> Sent: Wednesday, February 26, 2025 3:08 PM
> 
>>
>> This will handle SYNIC interrupts such as intercepts, doorbells, and
>> scheduling messages intended for the mshv driver.
> 
> Could you provide a bit more detailed commit message? How does
> the mshv_handler() relate to the vmbus_handler()? From the code
> mshv_handler() goes first, and I'm assuming it processes what it
> knows about (intercepts, doorbells, scheduling messages?) and
> then hands off control to the vmbus_handler() to handle the usual
> VMbus-related message and channel interrupts. But it would be
> nice to have the commit message or code comments describe the
> overall intent and any obscure aspects of the relationship.
> 
> And avoid references to "This" or "This patch". :-)
> 

You've described it pretty well, I don't know if there's too much
more to say given this patch doesn't introduce the handler code.

I can try to improve it, something like:
"
mshv_handler() will be used to process messages related to managing
guest partitions such as intercepts, doorbells, and scheduling messages.

In a (non-nested) root partition, the same interrupt vector is shared
between the vmbus and mshv_root drivers.

Introduce a stub for mshv_handler() and call it in
sysvec_hyperv_callback alongside vmbus_handler().

Even though both handlers will be called for every Hyper-V interrupt,
the messages for each driver are delivered to different offsets within
the SYNIC message page, so they won't step on each other.
"

Does that work?

Nuno
>>
>> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
>> Reviewed-by: Wei Liu <wei.liu@kernel.org>
>> Reviewed-by: Tianyu Lan <tiala@microsoft.com>
>> ---
>>  arch/x86/kernel/cpu/mshyperv.c | 9 +++++++++
>>  drivers/hv/hv_common.c         | 5 +++++
>>  include/asm-generic/mshyperv.h | 1 +
>>  3 files changed, 15 insertions(+)
>>
>> diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
>> index 0116d0e96ef9..616e9a5d77b4 100644
>> --- a/arch/x86/kernel/cpu/mshyperv.c
>> +++ b/arch/x86/kernel/cpu/mshyperv.c
>> @@ -107,6 +107,7 @@ void hv_set_msr(unsigned int reg, u64 value)
>>  }
>>  EXPORT_SYMBOL_GPL(hv_set_msr);
>>
>> +static void (*mshv_handler)(void);
>>  static void (*vmbus_handler)(void);
>>  static void (*hv_stimer0_handler)(void);
>>  static void (*hv_kexec_handler)(void);
>> @@ -117,6 +118,9 @@ DEFINE_IDTENTRY_SYSVEC(sysvec_hyperv_callback)
>>  	struct pt_regs *old_regs = set_irq_regs(regs);
>>
>>  	inc_irq_stat(irq_hv_callback_count);
>> +	if (mshv_handler)
>> +		mshv_handler();
>> +
>>  	if (vmbus_handler)
>>  		vmbus_handler();
>>
>> @@ -126,6 +130,11 @@ DEFINE_IDTENTRY_SYSVEC(sysvec_hyperv_callback)
>>  	set_irq_regs(old_regs);
>>  }
>>
>> +void hv_setup_mshv_handler(void (*handler)(void))
>> +{
>> +	mshv_handler = handler;
>> +}
>> +
>>  void hv_setup_vmbus_handler(void (*handler)(void))
>>  {
>>  	vmbus_handler = handler;
>> diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
>> index 2763cb6d3678..f5a07fd9a03b 100644
>> --- a/drivers/hv/hv_common.c
>> +++ b/drivers/hv/hv_common.c
>> @@ -677,6 +677,11 @@ void __weak hv_remove_vmbus_handler(void)
>>  }
>>  EXPORT_SYMBOL_GPL(hv_remove_vmbus_handler);
>>
>> +void __weak hv_setup_mshv_handler(void (*handler)(void))
>> +{
>> +}
>> +EXPORT_SYMBOL_GPL(hv_setup_mshv_handler);
>> +
>>  void __weak hv_setup_kexec_handler(void (*handler)(void))
>>  {
>>  }
>> diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
>> index 1f46d19a16aa..a05f12e63ccd 100644
>> --- a/include/asm-generic/mshyperv.h
>> +++ b/include/asm-generic/mshyperv.h
>> @@ -208,6 +208,7 @@ void hv_setup_kexec_handler(void (*handler)(void));
>>  void hv_remove_kexec_handler(void);
>>  void hv_setup_crash_handler(void (*handler)(struct pt_regs *regs));
>>  void hv_remove_crash_handler(void);
>> +void hv_setup_mshv_handler(void (*handler)(void));
>>
>>  extern int vmbus_interrupt;
>>  extern int vmbus_irq;
>> --
>> 2.34.1


