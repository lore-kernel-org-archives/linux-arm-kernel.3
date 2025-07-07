Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CCCC71130
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 18:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wbc2HG9QUPWt0l63ZWTBhGPjecpI8K9q96+xIUs6eYE=; b=HCzbHqDLriUf3chURtKdRsoHPg
	VqrgpCQD0WgOKj4v0vE76liWjBLgfS07Y3mSFqJxfeEfduCTLTXEaw0GlranZ8FKlKI7HhOt2b9Mr
	vnHkPaIoe2vzSbrz01W5/Cjl6oHImq8yHNh25ADGgChnaAromdCYTeaxkgrd6Fo73bNl86EMFe41g
	vE0b3uW5VfbuNg7F8VwQ65ZNWWdlehGQT3zsKeAmQOYyZm1bMcVi1JXdE3DJP6zPtLSwuN+zY1X8/
	a1cpTj3jqUQVbxtbx2Hg3h3vYbRwQBCL0u7/oRnV/mLmXb95ZyoZiDjDi6G8S6esHnp6YWzG+sxnA
	z1Yq4yZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYquX-00000003MFN-0JQe;
	Mon, 07 Jul 2025 18:49:53 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYqVU-00000003HxN-0uta
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 18:24:01 +0000
Received: from [100.65.225.228] (unknown [20.236.10.163])
	by linux.microsoft.com (Postfix) with ESMTPSA id C7FA7201B1B2;
	Mon,  7 Jul 2025 11:23:58 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C7FA7201B1B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1751912639;
	bh=wbc2HG9QUPWt0l63ZWTBhGPjecpI8K9q96+xIUs6eYE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sEAGC19WnF2DpvYSQf38laDfMv37wCz2cTJJiu5Iu6HowLVuT4vf7B87ytji/Z7Fn
	 8H9IMDUygflxKPMIA7iUox4zMAWZByAEu5em9fc9Kcb7Wycn7c/ILSZYCZDykirbgf
	 aPR74Z/Joo7rrXDQJiFrDhsBXgONT0Hr4+riF+JM=
Message-ID: <d1e1bf55-af7b-4cd7-927b-886846f0a8dd@linux.microsoft.com>
Date: Mon, 7 Jul 2025 11:23:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] x86: hyperv: Expose hv_map_msi_interrupt function
To: Michael Kelley <mhklinux@outlook.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "romank@linux.microsoft.com" <romank@linux.microsoft.com>
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
 "jinankjain@linux.microsoft.com" <jinankjain@linux.microsoft.com>,
 "skinsburskii@linux.microsoft.com" <skinsburskii@linux.microsoft.com>,
 "mrathor@linux.microsoft.com" <mrathor@linux.microsoft.com>,
 "x86@kernel.org" <x86@kernel.org>
References: <1751582677-30930-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1751582677-30930-6-git-send-email-nunodasneves@linux.microsoft.com>
 <SN6PR02MB4157AAF735DD432EED00C945D44FA@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <SN6PR02MB4157AAF735DD432EED00C945D44FA@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_112400_313392_3A5E6882 
X-CRM114-Status: GOOD (  18.55  )
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

On 7/6/2025 8:14 PM, Michael Kelley wrote:
> From: Nuno Das Neves <nunodasneves@linux.microsoft.com> Sent: Thursday, July 3, 2025 3:45 PM
>>
>> From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
>>
>> This patch moves a part of currently internal logic into the
>> hv_map_msi_interrupt function and makes it globally available helper
>> function, which will be used to map PCI interrupts in case of root
>> partition.
> 
> Commit message still has "this patch". See suggested wording
> in my comment on v1 of this patch.
> 
Ah, indeed, I missed the change somehow :(

>>
>> Signed-off-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
>> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
>> Reviewed-by: Roman Kisel <romank@linux.microsoft.com>
>> ---
>>  arch/x86/hyperv/irqdomain.c     | 38 +++++++++++++++++++++++----------
>>  arch/x86/include/asm/mshyperv.h |  2 ++
>>  2 files changed, 29 insertions(+), 11 deletions(-)
>>
>> diff --git a/arch/x86/hyperv/irqdomain.c b/arch/x86/hyperv/irqdomain.c
>> index 75b25724b045..eca015563420 100644
>> --- a/arch/x86/hyperv/irqdomain.c
>> +++ b/arch/x86/hyperv/irqdomain.c
>> @@ -172,13 +172,32 @@ static union hv_device_id hv_build_pci_dev_id(struct pci_dev *dev)
>>  	return dev_id;
>>  }
>>
>> -static int hv_map_msi_interrupt(struct pci_dev *dev, int cpu, int vector,
>> -				struct hv_interrupt_entry *entry)
>> +/**
>> + * hv_map_msi_interrupt() - "Map" the MSI IRQ in the hypervisor.
>> + * @data:      Describes the IRQ
>> + * @out_entry: Hypervisor (MSI) interrupt entry (can be NULL)
> 
> Also document the return value?  At least to say that success returns 0,
> while a failure returns a negative errno.
> 
>> + *
>> + * Map the IRQ in the hypervisor by issuing a MAP_DEVICE_INTERRUPT hypercall.
>> + */
>> +int hv_map_msi_interrupt(struct irq_data *data,
>> +			 struct hv_interrupt_entry *out_entry)
>>  {
>> -	union hv_device_id device_id = hv_build_pci_dev_id(dev);
>> +	struct irq_cfg *cfg = irqd_cfg(data);
>> +	struct hv_interrupt_entry dummy;
>> +	union hv_device_id device_id;
>> +	struct msi_desc *msidesc;
>> +	struct pci_dev *dev;
>> +	int cpu;
>>
>> -	return hv_map_interrupt(device_id, false, cpu, vector, entry);
>> +	msidesc = irq_data_get_msi_desc(data);
>> +	dev = msi_desc_to_pci_dev(msidesc);
>> +	device_id = hv_build_pci_dev_id(dev);
>> +	cpu = cpumask_first(irq_data_get_effective_affinity_mask(data));
>> +
>> +	return hv_map_interrupt(device_id, false, cpu, cfg->vector,
>> +				out_entry ? out_entry : &dummy);
>>  }
>> +EXPORT_SYMBOL_GPL(hv_map_msi_interrupt);
>>
>>  static inline void entry_to_msi_msg(struct hv_interrupt_entry *entry, struct msi_msg *msg)
>>  {
>> @@ -191,11 +210,11 @@ static inline void entry_to_msi_msg(struct hv_interrupt_entry *entry, struct msi
>>  static int hv_unmap_msi_interrupt(struct pci_dev *dev, struct hv_interrupt_entry *old_entry);
>>  static void hv_irq_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
>>  {
>> -	struct hv_interrupt_entry out_entry, *stored_entry;
>> +	struct hv_interrupt_entry *stored_entry;
>>  	struct irq_cfg *cfg = irqd_cfg(data);
>>  	struct msi_desc *msidesc;
>>  	struct pci_dev *dev;
>> -	int cpu, ret;
>> +	int ret;
>>
>>  	msidesc = irq_data_get_msi_desc(data);
>>  	dev = msi_desc_to_pci_dev(msidesc);
>> @@ -205,8 +224,6 @@ static void hv_irq_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
>>  		return;
>>  	}
>>
>> -	cpu = cpumask_first(irq_data_get_effective_affinity_mask(data));
>> -
>>  	if (data->chip_data) {
>>  		/*
>>  		 * This interrupt is already mapped. Let's unmap first.
>> @@ -233,15 +250,14 @@ static void hv_irq_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
>>  		return;
>>  	}
>>
>> -	ret = hv_map_msi_interrupt(dev, cpu, cfg->vector, &out_entry);
>> +	ret = hv_map_msi_interrupt(data, stored_entry);
>>  	if (ret) {
>>  		kfree(stored_entry);
>>  		return;
>>  	}
>>
>> -	*stored_entry = out_entry;
>>  	data->chip_data = stored_entry;
>> -	entry_to_msi_msg(&out_entry, msg);
>> +	entry_to_msi_msg(data->chip_data, msg);
>>
>>  	return;
>>  }
>> diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
>> index e00a8431ef8e..42ea9c68f8c8 100644
>> --- a/arch/x86/include/asm/mshyperv.h
>> +++ b/arch/x86/include/asm/mshyperv.h
>> @@ -241,6 +241,8 @@ static inline void hv_apic_init(void) {}
>>
>>  struct irq_domain *hv_create_pci_msi_domain(void);
>>
>> +int hv_map_msi_interrupt(struct irq_data *data,
>> +			 struct hv_interrupt_entry *out_entry);
>>  int hv_map_ioapic_interrupt(int ioapic_id, bool level, int vcpu, int vector,
>>  		struct hv_interrupt_entry *entry);
>>  int hv_unmap_ioapic_interrupt(int ioapic_id, struct hv_interrupt_entry *entry);
>> --
>> 2.34.1

