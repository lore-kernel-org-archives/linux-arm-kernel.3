Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59FDC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 21:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ls5BhwV/rXow5UxJyhbSVTcsRSnSZDxBt+jSrPUpWXk=; b=jujAnwjVwG6l+K0Tldg4wrW2DA
	ZwLQnWXNLLQkHr4IBQVprHAOVEXgfsdazY5NtxFVaq8u2s45lLI0rtqXSSdY8cJbTYE0qOp9jZ0bT
	a39zYU+Zb8GdoFlrVYri17M4X/fRFbT5jktM8eAWWWZbXSpgEq9yPewlkXf9UxbhRkIrh2idB16pL
	uRo3/YUPDtHux142RLNv09Lrly3huFDhD7otUisVOy9yX5Pmq9twhShmpea7Hiz/LEglDUk/O7tUW
	pjaPzkkOs3Rsc5aNFWUF2V6YyHmQoFO0UtEIK91mzFYlwXyz065JFJP5Is0mFPYI6naJfFTGU5mjz
	g1wq7QOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS0PN-0000000BSDe-36QA;
	Wed, 18 Jun 2025 21:33:25 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS0GK-0000000BR49-1uVG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 21:24:05 +0000
Received: from [100.64.233.194] (unknown [52.148.171.5])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7A11E21176C3;
	Wed, 18 Jun 2025 14:24:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7A11E21176C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1750281842;
	bh=ls5BhwV/rXow5UxJyhbSVTcsRSnSZDxBt+jSrPUpWXk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BsQ6rpq5kP82jTrCwdbhbGuuE2B9f7rgUAO9bg5QMw5TFudEPZjoyRZyye2Mr4m1L
	 isVGO11zm+0YSekIiKGN8p7n4I+JDViI0j3P97NKDR6nH2StHlReyabY6WWK+uBDZW
	 j7vTkhOfSnBGfEJWqqFsXJUMAj8fse6LnoXq+mio=
Message-ID: <5dbd2057-6b0d-45f0-8cf7-935509d4fb03@linux.microsoft.com>
Date: Wed, 18 Jun 2025 14:24:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] PCI: hv: Use the correct hypercall for unmasking
 interrupts on nested
To: Michael Kelley <mhklinux@outlook.com>,
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
 "will@kernel.org" <will@kernel.org>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>,
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
 <1749599526-19963-5-git-send-email-nunodasneves@linux.microsoft.com>
 <SN6PR02MB4157BAE54D3BBD4CD8065722D475A@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <SN6PR02MB4157BAE54D3BBD4CD8065722D475A@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_142404_548412_418E70AB 
X-CRM114-Status: GOOD (  18.86  )
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

On 6/11/2025 4:07 PM, Michael Kelley wrote:
> From: Nuno Das Neves <nunodasneves@linux.microsoft.com> Sent: Tuesday, June 10, 2025 4:52 PM
>>
>> From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
>>
>> Running as nested root on MSHV imposes a different requirement
>> for the pci-hyperv controller.
>>
>> In this setup, the interrupt will first come to the L1 (nested) hypervisor,
>> which will deliver it to the appropriate root CPU. Instead of issuing the
>> RETARGET hypercall, we should issue the MAP_DEVICE_INTERRUPT
>> hypercall to L1 to complete the setup.
>>
>> Rename hv_arch_irq_unmask() to hv_irq_retarget_interrupt().
>>
>> Co-developed-by: Jinank Jain <jinankjain@linux.microsoft.com>
>> Signed-off-by: Jinank Jain <jinankjain@linux.microsoft.com>
>> Signed-off-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
>> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
>> ---
>>  drivers/pci/controller/pci-hyperv.c | 18 ++++++++++++++++--
>>  1 file changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller/pci-hyperv.c
>> index 4d25754dfe2f..0f491c802fb9 100644
>> --- a/drivers/pci/controller/pci-hyperv.c
>> +++ b/drivers/pci/controller/pci-hyperv.c
>> @@ -600,7 +600,7 @@ static unsigned int hv_msi_get_int_vector(struct irq_data *data)
>>  #define hv_msi_prepare		pci_msi_prepare
>>
>>  /**
>> - * hv_arch_irq_unmask() - "Unmask" the IRQ by setting its current
>> + * hv_irq_retarget_interrupt() - "Unmask" the IRQ by setting its current
>>   * affinity.
>>   * @data:	Describes the IRQ
>>   *
>> @@ -609,7 +609,7 @@ static unsigned int hv_msi_get_int_vector(struct irq_data *data)
>>   * is built out of this PCI bus's instance GUID and the function
>>   * number of the device.
>>   */
>> -static void hv_arch_irq_unmask(struct irq_data *data)
>> +static void hv_irq_retarget_interrupt(struct irq_data *data)
>>  {
>>  	struct msi_desc *msi_desc = irq_data_get_msi_desc(data);
>>  	struct hv_retarget_device_interrupt *params;
>> @@ -714,6 +714,20 @@ static void hv_arch_irq_unmask(struct irq_data *data)
>>  		dev_err(&hbus->hdev->device,
>>  			"%s() failed: %#llx", __func__, res);
>>  }
>> +
>> +static void hv_arch_irq_unmask(struct irq_data *data)
>> +{
>> +	if (hv_nested && hv_root_partition())
> 
> Based on Patch 1 of this series, this driver is not loaded for the root
> partition in the non-nested case. So testing hv_nested is redundant.
> 

Good point, I'll change it to just check for hv_root_partition() here.

>> +		/*
>> +		 * In case of the nested root partition, the nested hypervisor
>> +		 * is taking care of interrupt remapping and thus the
>> +		 * MAP_DEVICE_INTERRUPT hypercall is required instead of
>> +		 * RETARGET_INTERRUPT.
>> +		 */
>> +		(void)hv_map_msi_interrupt(data, NULL);
>> +	else
>> +		hv_irq_retarget_interrupt(data);
>> +}
>>  #elif defined(CONFIG_ARM64)
>>  /*
>>   * SPI vectors to use for vPCI; arch SPIs range is [32, 1019], but leaving a bit
>> --
>> 2.34.1


