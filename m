Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D27D77898
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 00:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tiTZ+ukMLl4OXHhgzRRQhkhViH6uArijXtaplMQFyNU=; b=28iJNeBQdvjXF5xqSWKuNIcl/5
	f5o8QgVeyFEtBy5upd9JKBCujcFJa9Jf/rU3h/FBIsmh/Ruq8ZuJ0Z6Vl0TreFri30KinRPsiS8oM
	w0cTfU7HgNAWGOV62MCgLJbByWewGmUQrhszy67vs10QGtPNJod/xVtC3yzULyrf9N5KKo3b3PHj2
	/Tfrs+gHk7NGnQhD9ZROno/ZSHR4sqeaT6SbjIszuLouR3XHIR+u5J6HyXbnDNRK8fhFDdCglvpDV
	LaGm3qx9PR8vMKa2OPeZJmXWVj5sU60P+hy6OToyHO+MDcUxrSRzFPGVtcJnDwqD8E/ldBXwPaESD
	5wuIZAAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjRju-00000009eIF-3IcA;
	Sat, 24 Jan 2026 00:42:58 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjRjs-00000009eHu-1r3q
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 00:42:57 +0000
Received: from [100.75.32.59] (unknown [40.78.12.246])
	by linux.microsoft.com (Postfix) with ESMTPSA id 8321E20B7167;
	Fri, 23 Jan 2026 16:42:54 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8321E20B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1769215375;
	bh=tiTZ+ukMLl4OXHhgzRRQhkhViH6uArijXtaplMQFyNU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rUPhcDz9eRP0YeuPqK34N2lDMwbRB52VGddYs6ysYtjNXUqu4dAK9z+8Rdy3fquD+
	 kh+U/9/YovoOObrh//W9Upz0QxbWdxObtIFuQEDYmYViTTLYdkb/adpR6JY31dZyRn
	 KYf8PPOmxAf5F9ZFRxUUDnoLuEzTjm9G75F+NqhI=
Message-ID: <a2e54fff-3cbb-e332-c35e-7520c36eceed@linux.microsoft.com>
Date: Fri, 23 Jan 2026 16:42:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v0 10/15] PCI: hv: Build device id for a VMBus device
Content-Language: en-US
To: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-pci@vger.kernel.org, linux-arch@vger.kernel.org, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 longli@microsoft.com, catalin.marinas@arm.com, will@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, joro@8bytes.org,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, bhelgaas@google.com, arnd@arndb.de,
 nunodasneves@linux.microsoft.com, mhklinux@outlook.com,
 romank@linux.microsoft.com
References: <20260120064230.3602565-1-mrathor@linux.microsoft.com>
 <20260120064230.3602565-11-mrathor@linux.microsoft.com>
 <aXAAH4G9ztAGDWuy@skinsburskii.localdomain>
From: Mukesh R <mrathor@linux.microsoft.com>
In-Reply-To: <aXAAH4G9ztAGDWuy@skinsburskii.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_164256_514773_3794EC77 
X-CRM114-Status: GOOD (  23.39  )
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

On 1/20/26 14:22, Stanislav Kinsburskii wrote:
> On Mon, Jan 19, 2026 at 10:42:25PM -0800, Mukesh R wrote:
>> From: Mukesh Rathor <mrathor@linux.microsoft.com>
>>
>> On Hyper-V, most hypercalls related to PCI passthru to map/unmap regions,
>> interrupts, etc need a device id as a parameter. This device id refers
>> to that specific device during the lifetime of passthru.
>>
>> An L1VH VM only contains VMBus based devices. A device id for a VMBus
>> device is slightly different in that it uses the hv_pcibus_device info
>> for building it to make sure it matches exactly what the hypervisor
>> expects. This VMBus based device id is needed when attaching devices in
>> an L1VH based guest VM. Before building it, a check is done to make sure
>> the device is a valid VMBus device.
>>
>> Signed-off-by: Mukesh Rathor <mrathor@linux.microsoft.com>
>> ---
>>   arch/x86/include/asm/mshyperv.h     |  2 ++
>>   drivers/pci/controller/pci-hyperv.c | 29 +++++++++++++++++++++++++++++
>>   2 files changed, 31 insertions(+)
>>
>> diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
>> index eef4c3a5ba28..0d7fdfb25e76 100644
>> --- a/arch/x86/include/asm/mshyperv.h
>> +++ b/arch/x86/include/asm/mshyperv.h
>> @@ -188,6 +188,8 @@ bool hv_vcpu_is_preempted(int vcpu);
>>   static inline void hv_apic_init(void) {}
>>   #endif
>>   
>> +u64 hv_pci_vmbus_device_id(struct pci_dev *pdev);
>> +
>>   struct irq_domain *hv_create_pci_msi_domain(void);
>>   
>>   int hv_map_msi_interrupt(struct irq_data *data,
>> diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller/pci-hyperv.c
>> index 8bc6a38c9b5a..40f0b06bb966 100644
>> --- a/drivers/pci/controller/pci-hyperv.c
>> +++ b/drivers/pci/controller/pci-hyperv.c
>> @@ -579,6 +579,8 @@ static void hv_pci_onchannelcallback(void *context);
>>   #define DELIVERY_MODE		APIC_DELIVERY_MODE_FIXED
>>   #define HV_MSI_CHIP_FLAGS	MSI_CHIP_FLAG_SET_ACK
>>   
>> +static bool hv_vmbus_pci_device(struct pci_bus *pbus);
>> +
> 
> Why not moving this static function definition above the called instead of
> defining the prototype?

Did you see the function implementation? It has other dependencies that
are later, it would need code reorg.

Thanks,
-Mukesh


>>   static int hv_pci_irqchip_init(void)
>>   {
>>   	return 0;
>> @@ -598,6 +600,26 @@ static unsigned int hv_msi_get_int_vector(struct irq_data *data)
>>   
>>   #define hv_msi_prepare		pci_msi_prepare
>>   
>> +u64 hv_pci_vmbus_device_id(struct pci_dev *pdev)
>> +{
>> +	u64 u64val;
> 
> This variable is redundant.

Not really. It helps with debug by putting a quick print, and is
harmless.

>> +	struct hv_pcibus_device *hbus;
>> +	struct pci_bus *pbus = pdev->bus;
>> +
>> +	if (!hv_vmbus_pci_device(pbus))
>> +		return 0;
>> +
>> +	hbus = container_of(pbus->sysdata, struct hv_pcibus_device, sysdata);
>> +	u64val = (hbus->hdev->dev_instance.b[5] << 24) |
>> +		 (hbus->hdev->dev_instance.b[4] << 16) |
>> +		 (hbus->hdev->dev_instance.b[7] << 8) |
>> +		 (hbus->hdev->dev_instance.b[6] & 0xf8) |
>> +		 PCI_FUNC(pdev->devfn);
>> +
> 
> It looks like this value always fits into 32 bit, so what is the value
> in returning 64 bit?

The ABI has device id defined as 64bits where this is assigned.

Thanks,
-Mukesh




> Thanks,
> Stanislav
> 
>> +	return u64val;
>> +}
>> +EXPORT_SYMBOL_GPL(hv_pci_vmbus_device_id);
>> +
>>   /**
>>    * hv_irq_retarget_interrupt() - "Unmask" the IRQ by setting its current
>>    * affinity.
>> @@ -1404,6 +1426,13 @@ static struct pci_ops hv_pcifront_ops = {
>>   	.write = hv_pcifront_write_config,
>>   };
>>   
>> +#ifdef CONFIG_X86
>> +static bool hv_vmbus_pci_device(struct pci_bus *pbus)
>> +{
>> +	return pbus->ops == &hv_pcifront_ops;
>> +}
>> +#endif /* CONFIG_X86 */
>> +
>>   /*
>>    * Paravirtual backchannel
>>    *
>> -- 
>> 2.51.2.vfs.0.1
>>


