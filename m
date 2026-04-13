Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75980F34C42
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 11:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/R/iDity5TJZZZ/uK70jxKQhUS8zNyau0qDvXmlQFJc=; b=44IpjDgH7x7QVFr7GYFD3R0pwJ
	hfJTyknUTYnSGI6uNMfJ8Y3ZDnh9yfki3mlISyWpUc07O+o1JJIVtq+68vzX9M0TqwiK+PMvjmHVX
	qoGeA3MDVO7bqLb9gP8G7md8uPa2ss9Vk1ItAgS2iSsYkfmnR2l/qWUhnIFQAelG0wYHf8hegZLXh
	xX438t1cjWvhN0x1ZThZXccreWkbIvMuYYgASYuD5rj7fRCxCn/xas/IBTUNNSU28zILWJc+C0u3v
	KsfiRK6cfetNmw0Z0rD3DrFnfPi2YNumTx8wrKuxZX3JZP1X/ChJjJvFMYxp6waKv+6owzdqz40V7
	ZVcmgm0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCFjt-0000000Fao8-3XDn;
	Mon, 13 Apr 2026 11:46:01 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCFjr-0000000Fane-1ZOr;
	Mon, 13 Apr 2026 11:46:00 +0000
Received: from [192.168.0.106] (unknown [49.205.253.198])
	by linux.microsoft.com (Postfix) with ESMTPSA id B8B8520B7129;
	Mon, 13 Apr 2026 04:45:51 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B8B8520B7129
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1776080758;
	bh=/R/iDity5TJZZZ/uK70jxKQhUS8zNyau0qDvXmlQFJc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X0gZaM1iTAoRjPQh4ae+wdKCTyYwz71aXaaSnNofcCfSxCWn4mtrxDaNRHtayAHbO
	 mW+2MI2fYrMMA6ijE71h0hU+MKFtizhGyAvmqAHuHN+fi9UBGGi5tT9z+EJYgLH9Hr
	 Ev6Qv7kFxmZWYI8x2J58wefx+qtSqAi2on/uHzas=
Message-ID: <956d343d-6b9b-48df-8341-91ea0cfe7efd@linux.microsoft.com>
Date: Mon, 13 Apr 2026 17:15:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] Drivers: hv: Add support to setup percpu vmbus
 handler
To: Michael Kelley <mhklinux@outlook.com>,
 "K . Y . Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Marc Zyngier <maz@kernel.org>, Timothy Hayes <timothy.hayes@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 mrigendrachaubey <mrigendra.chaubey@gmail.com>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <20260316121241.910764-1-namjain@linux.microsoft.com>
 <20260316121241.910764-4-namjain@linux.microsoft.com>
 <SN6PR02MB41570E0F113FE28CFC839476D450A@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Naman Jain <namjain@linux.microsoft.com>
In-Reply-To: <SN6PR02MB41570E0F113FE28CFC839476D450A@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_044559_476363_C9418BEC 
X-CRM114-Status: GOOD (  32.93  )
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



On 4/1/2026 10:25 PM, Michael Kelley wrote:
> From: Naman Jain <namjain@linux.microsoft.com> Sent: Monday, March 16, 2026 5:13 AM
>>
>> Add a wrapper function - hv_setup_percpu_vmbus_handler(), similar to
>> hv_setup_vmbus_handler() to allow setting up custom per-cpu VMBus
>> interrupt handler. This is required for arm64 support, to be added
>> in MSHV_VTL driver, where per-cpu VMBus interrupt handler will be
>> set to mshv_vtl_vmbus_isr() for VTL2 (Virtual Trust Level 2).
> 
> Needing both hv_setup_vmbus_handler() and
> hv_setup_percpu_vmbus_handler() seems unfortunate. Here's an
> alternate approach to consider:
> 
> 1. I think the x86 VMBus sysvec handler and the vmbus_percpu_isr()
> functions could both use the same vmbus_handler global variable.
> Looking at your changes in this patch set, hv_setup_vmbus_handler()
> and hv_setup_percpu_vmbus_handler() are used together and always
> set the same value.
> 
> 2. So move the global variable vmbus_handler out from arch/x86
> and into hv_common.c, and export it. The x86 sysvec handler can
> still reference it, and vmbus_percpu_isr() in vmbus_drv.c can
> also reference it.  No need to have vmbus_percpu_isr() under
> arch/arm64 or have a stub in hv_common.c.
> 
> 3. hv_setup_vmbus_handler() and hv_remove_vmbus_handler()
> also move to hv_common.c.  The __weak stubs go away.
> 
> With these changes, only hv_setup_vmbus_handler() needs to
> be called, and it works for both x86 with the sysvec handler and
> for arm64 with vmbus_percpu_isr().
> 
> I haven't coded this up, so maybe there's some problematic detail,
> but the idea seems like it would work. If it does work, some of my
> comments below are no longer applicable.
> 

This is a great suggestion. Current implementation looked complex in 
design and it was becoming more complex with the changes I was making 
while addressing Sashiko's AI review comments. However your suggestion 
looks much better. I'll implement it. Thanks for suggesting.

>>
>> Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>
>> Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
>> ---
>>   arch/arm64/hyperv/mshyperv.c   | 13 +++++++++++++
>>   drivers/hv/hv_common.c         | 11 +++++++++++
>>   drivers/hv/vmbus_drv.c         |  7 +------
>>   include/asm-generic/mshyperv.h |  3 +++
>>   4 files changed, 28 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
>> index 4fdc26ade1d7..d4494ceeaad0 100644
>> --- a/arch/arm64/hyperv/mshyperv.c
>> +++ b/arch/arm64/hyperv/mshyperv.c
>> @@ -134,3 +134,16 @@ bool hv_is_hyperv_initialized(void)
>>   	return hyperv_initialized;
>>   }
>>   EXPORT_SYMBOL_GPL(hv_is_hyperv_initialized);
>> +
>> +static void (*vmbus_percpu_handler)(void);
>> +void hv_setup_percpu_vmbus_handler(void (*handler)(void))
>> +{
>> +	vmbus_percpu_handler = handler;
>> +}
>> +
>> +irqreturn_t vmbus_percpu_isr(int irq, void *dev_id)
>> +{
>> +	if (vmbus_percpu_handler)
>> +		vmbus_percpu_handler();
>> +	return IRQ_HANDLED;
>> +}
>> diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
>> index d1ebc0ebd08f..a5064f558bf6 100644
>> --- a/drivers/hv/hv_common.c
>> +++ b/drivers/hv/hv_common.c
>> @@ -759,6 +759,17 @@ void __weak hv_setup_vmbus_handler(void (*handler)(void))
>>   }
>>   EXPORT_SYMBOL_GPL(hv_setup_vmbus_handler);
>>
>> +irqreturn_t __weak vmbus_percpu_isr(int irq, void *dev_id)
>> +{
>> +	return IRQ_HANDLED;
>> +}
>> +EXPORT_SYMBOL_GPL(vmbus_percpu_isr);
>> +
>> +void __weak hv_setup_percpu_vmbus_handler(void (*handler)(void))
>> +{
>> +}
>> +EXPORT_SYMBOL_GPL(hv_setup_percpu_vmbus_handler);
> 
> You've implemented hv_setup_percpu_vmbus_handler() following
> the pattern of hv_setup_vmbus_handler(), which is reasonable.
> But that turns out to be unnecessarily complicated. The existing
> hv_setup_vmbus_handler() has a portion in
> arch/x86/kernel/cpu/mshyperv.c as a special case because it uses a
> hard-coded interrupt vector on x86/x64, and has its own custom
> sysvec code. And there's a need for a __weak stub in hv_common.c
> so that vmbus_drv.c will compile on arm64.
> 
> But hv_setup_percpu_vmbus_handler() does not have the same
> requirements. It could be implemented entirely in vmbus_drv.c,
> with no code under arch/x86 or arch/arm64, and no __weak stub
> in hv_common.c.  vmbus_drv.c would just need to
> EXPORT_SYMBOL_FOR_MODULES, like it already does with vmbus_isr.
> I didn't code it up, but I think that approach would be simpler with
> fewer piece-parts scattered all over. If so, it would be worth
> breaking the symmetry with hv_setup_vmbus_handler().
> 

No longer applicable.

Regards,
Naman

