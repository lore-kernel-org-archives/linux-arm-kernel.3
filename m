Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3915C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 18:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eME4gRmjVE3w6nzuhE7xqtEmYJ+fLHcjVchsKhgalL8=; b=2I/5aMpoy8tpDKsD+WRr1287g7
	80tCJ4mad2m1LxrPSWvekQm/Z6OSkDArV1aiRQ4YEHitx4z5+kIvgeSHzDdBOwtSRaB/JWu6ufJR/
	IzZ3VrtMTgSI76Je9WVI7gpGIKNEzZ1Q0pLBN0fePayQgMRpJq2M0CXSJefd0WYb+oJBMLLdCBg9x
	hxBMGeUDif5cpglIM7XnJ7E7DqIGjZMGu6uf2rSQuQu9Vw5EQEQ6TrDq1VlZdamRbELRHSNWvgMuL
	uij3S1FQztcnUibw5apfXYAf3DJaN9oXmprsLgCwD65S6M1CAN9+ncFe+bw+i7UxXGh1dmI3QERD+
	MYAx9eJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trhyO-00000003cp2-1PTs;
	Mon, 10 Mar 2025 18:35:32 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trgig-00000003TOf-0jn6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 17:15:15 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id BFF802038F32;
	Mon, 10 Mar 2025 10:15:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BFF802038F32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741626913;
	bh=eME4gRmjVE3w6nzuhE7xqtEmYJ+fLHcjVchsKhgalL8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=izQvo7LtPEn8QdsyQJfUA53eTxUOuoeOz82pbmQ0wQaG1gObJiMFAQaBdi4A4iWNR
	 uP46JGVDaO3cRF/G9lVcXt9kOcQnz5el35Sjj0jweE8RV1fyt3eecjS3tkMovWnNwm
	 xH3wS8Mi9wqAyRiK3OyMT3uXWKNOYhhn5jgty0K8=
Message-ID: <319aac20-229e-4a81-b2c5-e870453634bb@linux.microsoft.com>
Date: Mon, 10 Mar 2025 10:15:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next v5 11/11] PCI: hv: Get vPCI MSI IRQ domain
 from DeviceTree
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: arnd@arndb.de, bhelgaas@google.com, bp@alien8.de,
 catalin.marinas@arm.com, conor+dt@kernel.org, dave.hansen@linux.intel.com,
 decui@microsoft.com, haiyangz@microsoft.com, hpa@zytor.com,
 joey.gouly@arm.com, krzk+dt@kernel.org, kw@linux.com, kys@microsoft.com,
 lenb@kernel.org, lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org,
 mark.rutland@arm.com, maz@kernel.org, mingo@redhat.com,
 oliver.upton@linux.dev, rafael@kernel.org, robh@kernel.org,
 ssengar@linux.microsoft.com, sudeep.holla@arm.com, suzuki.poulose@arm.com,
 tglx@linutronix.de, wei.liu@kernel.org, will@kernel.org,
 yuzenghui@huawei.com, devicetree@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, x86@kernel.org,
 apais@microsoft.com, benhill@microsoft.com, bperkins@microsoft.com,
 sunilmut@microsoft.com
References: <20250310164122.GA551965@bhelgaas>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <20250310164122.GA551965@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_101514_264945_7C7843E9 
X-CRM114-Status: GOOD (  19.76  )
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



On 3/10/2025 9:41 AM, Bjorn Helgaas wrote:
> On Fri, Mar 07, 2025 at 02:03:03PM -0800, Roman Kisel wrote:
>> The hyperv-pci driver uses ACPI for MSI IRQ domain configuration on
>> arm64. It won't be able to do that in the VTL mode where only DeviceTree
>> can be used.
>>
>> Update the hyperv-pci driver to get vPCI MSI IRQ domain in the DeviceTree
>> case, too.
>>
>> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
> 
> A couple minor comments below, but I don't have any objection to this,
> so if it's OK with the pci-hyperv.c folks, it's OK with me.
> 

Bjorn, thanks a lot for your help and guidance! I'll be most happy to
incorporate your suggestions into the next version of the series :)

>> +#ifdef CONFIG_OF
>> +
>> +static struct irq_domain *hv_pci_of_irq_domain_parent(void)
>> +{
>> +	struct device_node *parent;
>> +	struct irq_domain *domain;
>> +
>> +	parent = of_irq_find_parent(hv_get_vmbus_root_device()->of_node);
>> +	domain = NULL;
>> +	if (parent) {
>> +		domain = irq_find_host(parent);
>> +		of_node_put(parent);
>> +	}
>> +
>> +	return domain;
> 
> I think this would be a little simpler as:
> 
>    parent = of_irq_find_parent(hv_get_vmbus_root_device()->of_node);
>    if (!parent)
>      return NULL;
> 
>    domain = irq_find_host(parent);
>    of_node_put(parent);
>    return domain;
> 
>> +}
>> +
>> +#endif
>> +
>> +#ifdef CONFIG_ACPI
>> +
>> +static struct irq_domain *hv_pci_acpi_irq_domain_parent(void)
>> +{
>> +	struct irq_domain *domain;
>> +	acpi_gsi_domain_disp_fn gsi_domain_disp_fn;
>> +
>> +	if (acpi_irq_model != ACPI_IRQ_MODEL_GIC)
>> +		return NULL;
>> +	gsi_domain_disp_fn = acpi_get_gsi_dispatcher();
>> +	if (!gsi_domain_disp_fn)
>> +		return NULL;
>> +	domain = irq_find_matching_fwnode(gsi_domain_disp_fn(0),
>> +				     DOMAIN_BUS_ANY);
>> +
>> +	if (!domain)
>> +		return NULL;
>> +
>> +	return domain;
> 
>    if (!domain)
>      return NULL;
> 
>    return domain;
> 
> is the same as:
> 
>    return domain;
> 
> or even just:
> 
>    return irq_find_matching_fwnode(gsi_domain_disp_fn(0), DOMAIN_BUS_ANY);
> 
>> +}

-- 
Thank you,
Roman


