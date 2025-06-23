Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AAAC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 01:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPia+1CcqBgVn33Hj6F4kqNv7l24dCxS+Yv6QZNGLm4=; b=Xsbmh/fvuEsiGiYVwBsc99eUCV
	cu5F08pEmlkDGA9EM99A2+xX4bxXWXTabZ+CzIVH51/Tl8wRLAXGp05SUgOkvmJgKLBRbo1DjeuET
	C4CTOl6LyFhwzN8LE1VIajmePYagEEPhA5bds2SW6cGBSke5rIaeAwaPLnB/ZnO2REMtVTOpG9mQK
	XYbK7rA0p75iq6XJWXuEN3FIDVL/9A0NgpRhaFTSd1RCTn+iW2/3hXeWesFZNYZ1EF3BJKk9UcW6U
	KC1aZ+wSyiKXjJg+qu27oH93LG67tV6v8Im+DNcHppfv7eNCiA39mbkGs9rq1R/CmqFKvNqGAHr2O
	yFjymJjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTscR-00000004NoT-189d;
	Tue, 24 Jun 2025 01:38:39 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTpQG-000000045YA-1KrP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 22:13:53 +0000
Received: from [100.65.65.65] (unknown [20.236.10.129])
	by linux.microsoft.com (Postfix) with ESMTPSA id DBBC221176FF;
	Mon, 23 Jun 2025 15:13:49 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DBBC221176FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1750716830;
	bh=XPia+1CcqBgVn33Hj6F4kqNv7l24dCxS+Yv6QZNGLm4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NbJTXA3RXODzPM4Hr5Q9ZS027bM41HA/NexgNb4a5EVCEHOSqKVmciHeQVaJekq/z
	 y793YF1Ytd9PyQRrFb4kYDq4eVlYKb2qDonmVmKdVee3ONBgWDs0378KVZC1jyvJ6I
	 eF6WR6UoA3QSK4ZaIRw1YNjFzwV5rgeukGLatvrk=
Message-ID: <64adb508-8843-4eae-87fb-47797bf32b19@linux.microsoft.com>
Date: Mon, 23 Jun 2025 15:13:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] x86: hyperv: Expose hv_map_msi_interrupt function
To: Thomas Gleixner <tglx@linutronix.de>,
 Michael Kelley <mhklinux@outlook.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Cc: "kys@microsoft.com" <kys@microsoft.com>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
 "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kw@linux.com"
 <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "jinankjain@linux.microsoft.com" <jinankjain@linux.microsoft.com>,
 "skinsburskii@linux.microsoft.com" <skinsburskii@linux.microsoft.com>,
 "mrathor@linux.microsoft.com" <mrathor@linux.microsoft.com>,
 "x86@kernel.org" <x86@kernel.org>
References: <1749599526-19963-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1749599526-19963-4-git-send-email-nunodasneves@linux.microsoft.com>
 <SN6PR02MB4157639630F8AD2D8FD8F52FD475A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <8f96db3f-fc3b-44b6-ab28-26bca6e2615b@linux.microsoft.com>
 <878qlmqtbn.ffs@tglx>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <878qlmqtbn.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_151352_418146_99D2CFEB 
X-CRM114-Status: GOOD (  32.91  )
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

On 6/20/2025 9:19 AM, Thomas Gleixner wrote:
> On Wed, Jun 18 2025 at 14:08, Nuno Das Neves wrote:
>> On 6/11/2025 4:07 PM, Michael Kelley wrote:
>>> From: Nuno Das Neves <nunodasneves@linux.microsoft.com> Sent: Tuesday, June 10, 2025 4:52 PM
>>>> +/**
>>>> + * hv_map_msi_interrupt() - "Map" the MSI IRQ in the hypervisor.
>>>> + * @data:      Describes the IRQ
>>>> + * @out_entry: Hypervisor (MSI) interrupt entry (can be NULL)
>>>> + *
>>>> + * Map the IRQ in the hypervisor by issuing a MAP_DEVICE_INTERRUPT hypercall.
>>>> + */
>>>> +int hv_map_msi_interrupt(struct irq_data *data,
>>>> +			 struct hv_interrupt_entry *out_entry)
>>>>  {
>>>> -	union hv_device_id device_id = hv_build_pci_dev_id(dev);
>>>> +	struct msi_desc *msidesc;
>>>> +	struct pci_dev *dev;
>>>> +	union hv_device_id device_id;
>>>> +	struct hv_interrupt_entry dummy;
>>>> +	struct irq_cfg *cfg = irqd_cfg(data);
>>>> +	const cpumask_t *affinity;
>>>> +	int cpu;
>>>> +	u64 res;
> 
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#variable-declarations
> 
>>>>
>>>> -	return hv_map_interrupt(device_id, false, cpu, vector, entry);
>>>> +	msidesc = irq_data_get_msi_desc(data);
>>>> +	dev = msi_desc_to_pci_dev(msidesc);
>>>> +	device_id = hv_build_pci_dev_id(dev);
>>>> +	affinity = irq_data_get_effective_affinity_mask(data);
>>>> +	cpu = cpumask_first_and(affinity, cpu_online_mask);
>>>
>>> Is the cpus_read_lock held at this point? I'm not sure what the
>>> overall calling sequence looks like. If it is not held, the CPU that
>>> is selected could go offline before hv_map_interrupt() is called.
>>> This computation of the target CPU is the same as in the code
>>> before this patch, but that existing code looks like it has the
>>> same problem.
>>>
>>
>> Thanks for pointing it out - It *looks* like the read lock is not held
>> everywhere this could be called, so it could indeed be a problem.
>>
>> I've been thinking about different ways around this but I lack the
>> knowledge to have an informed opinion about it:
>>
>> - We could take the cpu read lock in this function, would that work?
> 
> Obviously not.
> 
>> - I'm not actually sure why the code is getting the first cpu off the effective
>>   affinity mask in the first place. It is possible to get the apic id (and hence
>>   the cpu) already associated with the irq, as per e.g. x86_vector_msi_compose_msg()
>>   Maybe we could get the cpu that way, assuming that doesn't have a
>>   similar issue.
> 
> There is no reason to fiddle in the underlying low level data. The
> effective affinity mask is there for a reason.
> 
>> - We could just let this race happen, maybe the outcome isn't too catastrophic?
> 
> Let's terminate guesswork mode and look at the facts.
> 
> The point is that hv_map_msi_interrupt() is called from:
> 
>     1) hv_irq_compose_msi_msg()
> 
>     2) hv_arch_irq_unmask() (in patch 4/4)
> 
> Both functions are interrupt chip callbacks and invoked with the
> interrupt descriptor lock held.
> 
> At the point where they are called, the effective affinity mask is valid
> and immutable. Nothing can modify it as any modification requires the
> interrupt descriptor lock to be held. This applies to the CPU hotplug
> machinery too. So this AND cpu_online_mask is a complete pointless
> voodoo exercise.
> 

Thanks for explaining.

> Just use:
> 
>      cpu = cpumask_first(irq_data_get_effective_affinity_mask(data));
> 
> and be done with it.
> 
> Please fix that first with a seperate patch before moving this code
> around.

Will do!

Nuno

> 
> Thanks,
> 
>         tglx


