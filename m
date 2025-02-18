Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09996C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 22:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wkHtF8Q1p9OLsyZ01ZxOlGG224lrcQMUsc6UkXJicro=; b=OaIeyPR4COxCV+Oo2KCX/OBeia
	aRnY1oXZQZ9I2NeyHsUdqa3a59tgFsrDnKOEnSWYWg1KAbPmm5UfjqraRl4MlVqUvbpHaNxUIJQhV
	/Q+qbxdkRCv8M7YFxwpm7LhKOm78NOln+SFeMH6HSdyDU1Q980idjgiPactu1dKFyLpdvHqT9r7oP
	f0134BECftwUAld12e6HAutabGRhCpo4O9qYc9dxrEZ4pfI6yjFDjG34Qxz31+Uck553FgnMmW2CJ
	u8JBfe/KHiGm5iWal+tkHUDyXqeusQXnhuy7NQu9Fm4SscI9hCMvNXuqXqS2UYAHx5oeT4X0Wqpe9
	BfimcnEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkW9s-0000000A9Gv-2NuG;
	Tue, 18 Feb 2025 22:33:40 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkW8P-0000000A92b-2QCZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 22:32:10 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 4E96820376ED;
	Tue, 18 Feb 2025 14:32:06 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4E96820376ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1739917926;
	bh=wkHtF8Q1p9OLsyZ01ZxOlGG224lrcQMUsc6UkXJicro=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nbqb+bYNVQ0gup+rvq/dhImqOWkwYohvkh5vvpwNHfMeSwBVbDosoWWE57JaQtoSf
	 SCCcRwRTFnVYwSEG2WcM2hfuquEeiOufFJUpLjad8c4/n4jB+k1nw8BbzOsEFrced2
	 0YoLSIqvXbVccqXXco4HoZ+xIZRWRpOZkJdTff94=
Message-ID: <19435dae-89b5-4c23-af1e-c8917e29c857@linux.microsoft.com>
Date: Tue, 18 Feb 2025 14:32:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next v4 6/6] PCI: hv: Get vPCI MSI IRQ domain from
 DeviceTree
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: arnd@arndb.de, bhelgaas@google.com, bp@alien8.de,
 catalin.marinas@arm.com, conor+dt@kernel.org, dave.hansen@linux.intel.com,
 decui@microsoft.com, haiyangz@microsoft.com, hpa@zytor.com,
 krzk+dt@kernel.org, kw@linux.com, kys@microsoft.com, lpieralisi@kernel.org,
 manivannan.sadhasivam@linaro.org, mingo@redhat.com, robh@kernel.org,
 ssengar@linux.microsoft.com, tglx@linutronix.de, wei.liu@kernel.org,
 will@kernel.org, devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, x86@kernel.org,
 benhill@microsoft.com, bperkins@microsoft.com, sunilmut@microsoft.com
References: <20250212174203.GA81135@bhelgaas>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <20250212174203.GA81135@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_143209_671260_CE323A2B 
X-CRM114-Status: GOOD (  24.84  )
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



On 2/12/2025 9:42 AM, Bjorn Helgaas wrote:
> On Tue, Feb 11, 2025 at 05:43:21PM -0800, Roman Kisel wrote:

[...]

>> +	 * function called later.
> 
> The rest of this file fits in 80 columns; please wrap this to match.
> 

Will fix, thank you for taking the time to review that!

>> +	 */
>> +	if (!domain)
>> +		WARN_ONCE(1, "No interrupt-parent found, check the DeviceTree data.\n");
> 
> Is there a way to include a hint about what specific part of the
> devicetree to look at, e.g., the node that lacks a parent?

I'll improve this, will mention the bus, thanks!

[...]

>> +	 * the messy ifdef below.
> 
> Add a blank line if you intend a new paragraph here.  Otherwise, wrap
> to fill 78 columns or so.

Will fix this, appreciate noticing that!

> 
>> +	 * There is apparently no such default in the OF subsystem, and
>> +	 * `hv_pci_of_irq_domain_parent` finds the parent IRQ domain that
>> +	 * points to the GIC as well.
> 
> And here.

Will fix, thanks!

>> +	 * None of these two cases reaches for the MSI parent domain.
> 
> I don't know what "reaches for the MSI parent domain" means.  Neither
> "searches for"?
> 

My bad, sorry about the incomprehensible phrasing! Will fix this, thank
you!

>>   	 */
>> -	hv_msi_gic_irq_domain = acpi_irq_create_hierarchy(0, HV_PCI_MSI_SPI_NR,
>> -							  fn, &hv_pci_domain_ops,
>> -							  chip_data);
>> +#ifdef CONFIG_ACPI
>> +	if (!acpi_disabled)
>> +		hv_msi_gic_irq_domain = acpi_irq_create_hierarchy(0, HV_PCI_MSI_SPI_NR,
>> +			fn, &hv_pci_domain_ops,
>> +			chip_data);
>> +#endif
>> +#if defined(CONFIG_OF)
>> +	if (!hv_msi_gic_irq_domain)
>> +		hv_msi_gic_irq_domain = irq_domain_create_hierarchy(
>> +			hv_pci_of_irq_domain_parent(), 0, HV_PCI_MSI_SPI_NR,
>> +			fn, &hv_pci_domain_ops,
>> +			chip_data);
>> +#endif
> 
> I don't know if acpi_irq_create_hierarchy() is helping or hurting
> here.  It obscures the fact that the only difference is the first
> argument to irq_domain_create_hierarchy().  If we could open-code or
> have a helper to figure out that irq_domain "parent" argument for the
> ACPI case, then we'd only have one call of
> irq_domain_create_hierarchy() here and it seems like it might be
> simpler.
> 

That looks quite dirty, no dispute over that... The root device was
static/provate for the ACPI case, and I didn't go for changing the ACPI
subsystem code to improve this patch, thought the only user wouldn't
justify tinkering with the whole ACPI subsystem. Maybe I also will
need to see if that can be used from a module/builti-in, locking,
bogus usage, i.e. all that normally comes with promoting a private
interface to public.

Let me work out the details and post the change here to see what
feedback that receives.

Last but certainly not least: owing a great debt of gratitude to you
(and all other folks) for helping in bringing this to the best shape
possible!

-- 
Thank you,
Roman


