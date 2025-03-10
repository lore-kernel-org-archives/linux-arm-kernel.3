Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90D3C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 21:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=35SjqWqIW52cDDYKL7wXrX16ndmpcJ/RLK/QVZatMbA=; b=4rItNS7/yE1NnKgIYKm03dc5e1
	pUsn/t40sUA1c7u9Xsf6aUaGN5IkNBm/VmUqxYxURxFuiPSlYkDZFZwGHTsFHBgifcKctqDIIYwTi
	lDnoskqqUjQUQSKSMcj5YvDdKvq+3nMdF5NYcGNsGYO8xYH1hz3uqZ5EVDoyVTbkz7Pg2SWMkFk3O
	g+MR6Hfgbz6B9/j3FV5Eefb4LBooQJoSed9UzYnC5z1e9Rn5hN4BHuPWHvRjQTsEp8eAy5Xq0qSqe
	epwbTA/vZNTPvh5sgyYB4d29cGh3ggGwPNFf8B/ATezMVpdlfja4VmsD+NddkziZjqW23M1+Pluzp
	H7cs1SzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trkzN-0000000431R-0fDN;
	Mon, 10 Mar 2025 21:48:45 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trkxk-000000042ti-0vpT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 21:47:05 +0000
Received: from [10.0.0.114] (c-67-182-156-199.hsd1.wa.comcast.net [67.182.156.199])
	by linux.microsoft.com (Postfix) with ESMTPSA id 1AE9D205492E;
	Mon, 10 Mar 2025 14:47:00 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1AE9D205492E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741643220;
	bh=35SjqWqIW52cDDYKL7wXrX16ndmpcJ/RLK/QVZatMbA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PLevEC7AXcMPAd0pY7CAOea160MnPpKdr7WEv6MrZnGBCpYlCuBzpuETS4KkkO8Au
	 6Zo8yUuLL7tvFiZAF75VRwZafL0dNuQnj85+7jrnaez8s17wb79rOwVkQjeGVgCUP8
	 uxdylMSk9Px+9pgIVZ/eniOqvEy2BT6hlmgmmr7w=
Message-ID: <71a95f7d-d38b-4f4f-b384-9ad4095bd272@linux.microsoft.com>
Date: Mon, 10 Mar 2025 14:46:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/10] x86: hyperv: Add mshv_handler irq handler and
 setup function
To: Michael Kelley <mhklinux@outlook.com>,
 Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "kys@microsoft.com" <kys@microsoft.com>,
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
 <Z7-nDUe41XHyZ8RJ@skinsburskii.>
 <7de9b06d-9a32-48b5-beda-2e19b36ae9c9@linux.microsoft.com>
 <SN6PR02MB41573673D5F786E6C47FC08ED4D52@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <SN6PR02MB41573673D5F786E6C47FC08ED4D52@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_144704_317484_879E1B0F 
X-CRM114-Status: GOOD (  23.72  )
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

On 3/7/2025 9:38 AM, Michael Kelley wrote:
> From: Nuno Das Neves <nunodasneves@linux.microsoft.com> Sent: Friday, February 28, 2025 4:38 PM
>>
>> On 2/26/2025 3:43 PM, Stanislav Kinsburskii wrote:
>>> On Wed, Feb 26, 2025 at 03:08:02PM -0800, Nuno Das Neves wrote:
>>>> This will handle SYNIC interrupts such as intercepts, doorbells, and
>>>> scheduling messages intended for the mshv driver.
>>>>
>>>> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
>>>> Reviewed-by: Wei Liu <wei.liu@kernel.org>
>>>> Reviewed-by: Tianyu Lan <tiala@microsoft.com>
>>>> ---
>>>>  arch/x86/kernel/cpu/mshyperv.c | 9 +++++++++
>>>>  drivers/hv/hv_common.c         | 5 +++++
>>>>  include/asm-generic/mshyperv.h | 1 +
>>>>  3 files changed, 15 insertions(+)
>>>>
>>>> diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
>>>> index 0116d0e96ef9..616e9a5d77b4 100644
>>>> --- a/arch/x86/kernel/cpu/mshyperv.c
>>>> +++ b/arch/x86/kernel/cpu/mshyperv.c
>>>> @@ -107,6 +107,7 @@ void hv_set_msr(unsigned int reg, u64 value)
>>>>  }
>>>>  EXPORT_SYMBOL_GPL(hv_set_msr);
>>>>
>>>> +static void (*mshv_handler)(void);
>>>>  static void (*vmbus_handler)(void);
>>>>  static void (*hv_stimer0_handler)(void);
>>>>  static void (*hv_kexec_handler)(void);
>>>> @@ -117,6 +118,9 @@ DEFINE_IDTENTRY_SYSVEC(sysvec_hyperv_callback)
>>>>  	struct pt_regs *old_regs = set_irq_regs(regs);
>>>>
>>>>  	inc_irq_stat(irq_hv_callback_count);
>>>> +	if (mshv_handler)
>>>> +		mshv_handler();
>>>
>>> Can mshv_handler be defined as a weak symbol doing nothing instead
>>> of defining it a null pointer?
>>> This should allow to simplify this code and get rid of
>>> hv_setup_mshv_handler, which looks redundant.
>>>
>> Interesting, I tested this and it does seems to work! It seems like
>> a good change, thanks.
> 
> Just be a bit careful. When CONFIG_HYPERV=n, mshyperv.c still gets
> built even through none of the other Hyper-V related files do.  There
> are #ifdef CONFIG_HYPERV in mshyperv.c to eliminate references to
> Hyper-V files that wouldn't be built. I'd suggest doing a test build with
> that configuration to make sure it's all clean.
> 
Thanks Michael - I don't think it would be an issue since the __weak version
would be defined in mshyperv.c itself, replacing the function pointer.

However, I went and tested this __weak version again with CONFIG_MSHV_ROOT=m
and it does not actually work. Everything seems ok at first (it compiles,
can insert the module), but upon starting a guest, the interrupts don't get
delivered to the root (or rather, they don't get handled by mshv_hander()).

This seems to match with what the ld docs say - There's an option
LD_DYNAMIC_LINK to allow __weak symbols to be overridden by the dynamic
linker, but this is not enabled in the kernel.

So I will stick with the current implementation.

Nuno

> Michael
> 
>>
>>> Reviewed-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
>>>
>>>> +
>>>>  	if (vmbus_handler)
>>>>  		vmbus_handler();
>>>>
>>>> @@ -126,6 +130,11 @@ DEFINE_IDTENTRY_SYSVEC(sysvec_hyperv_callback)
>>>>  	set_irq_regs(old_regs);
>>>>  }
>>>>
>>>> +void hv_setup_mshv_handler(void (*handler)(void))
>>>> +{
>>>> +	mshv_handler = handler;
>>>> +}
>>>> +
>>>>  void hv_setup_vmbus_handler(void (*handler)(void))
>>>>  {
>>>>  	vmbus_handler = handler;
>>>> diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
>>>> index 2763cb6d3678..f5a07fd9a03b 100644
>>>> --- a/drivers/hv/hv_common.c
>>>> +++ b/drivers/hv/hv_common.c
>>>> @@ -677,6 +677,11 @@ void __weak hv_remove_vmbus_handler(void)
>>>>  }
>>>>  EXPORT_SYMBOL_GPL(hv_remove_vmbus_handler);
>>>>
>>>> +void __weak hv_setup_mshv_handler(void (*handler)(void))
>>>> +{
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(hv_setup_mshv_handler);
>>>> +
>>>>  void __weak hv_setup_kexec_handler(void (*handler)(void))
>>>>  {
>>>>  }
>>>> diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
>>>> index 1f46d19a16aa..a05f12e63ccd 100644
>>>> --- a/include/asm-generic/mshyperv.h
>>>> +++ b/include/asm-generic/mshyperv.h
>>>> @@ -208,6 +208,7 @@ void hv_setup_kexec_handler(void (*handler)(void));
>>>>  void hv_remove_kexec_handler(void);
>>>>  void hv_setup_crash_handler(void (*handler)(struct pt_regs *regs));
>>>>  void hv_remove_crash_handler(void);
>>>> +void hv_setup_mshv_handler(void (*handler)(void));
>>>>
>>>>  extern int vmbus_interrupt;
>>>>  extern int vmbus_irq;
>>>> --
>>>> 2.34.1
>>>>
> 


