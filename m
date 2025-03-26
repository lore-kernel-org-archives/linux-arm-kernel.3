Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970DAC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 16:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WjzFIgjV9jVjkAChBrIFVJQnAYd6k3ZAKIpA/MaT4yo=; b=SeKSiD7k6C1ZWgiqX3njNHIvJy
	TPHEyBG6G36F6r/QSZOqM9YwzHgaik7Wp4E/FAKQq9vjopyPU+niSuDbgcTXSfmUDG6ztv3oCigMN
	10foRJ2hEZ7T1zNGjEC0zmiSa/uMDg6kmfeMkPhzzegmr9rqMMtQUYjYS1fDNYZOBJ8TtpjdYMIQw
	K1AyroZGk4KKCAogu+bcqjuvlVdOKs3cl1Lck3NyHDr0cThmwmpMGfbIErq4BGeUnYiu6MMMW3VqO
	D9CHJvjlYQEsfBKrrXEUlU/jMi5/YoF+7q6NTO0ukXsqjOyf1hC9CAbPV2SizBRnuSlJCa5pJDG9e
	HqaylWJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTD7-00000008wUx-09AQ;
	Wed, 26 Mar 2025 16:02:33 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txSos-00000008su8-245U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 15:37:31 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 204B22036597;
	Wed, 26 Mar 2025 08:37:29 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 204B22036597
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1743003449;
	bh=WjzFIgjV9jVjkAChBrIFVJQnAYd6k3ZAKIpA/MaT4yo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QCZ/1a3p+ZIUFWcAhkJvic5IwY8U0ufXEKXOuGNNCfYPOL2C8wZRVb0oHeZ26p7MN
	 55ghDNm1zZbkc7h9pH8j0WaY5qfjqpwdKTYWPi2UX1+7ck4WlgOZl7f4IIiSvY3N3U
	 3LSW1a2/cC6In4mf7262M02Vm2HMR/pY2ogrm5bY=
Message-ID: <83b983a4-064e-4a81-9c58-239b630eb299@linux.microsoft.com>
Date: Wed, 26 Mar 2025 08:37:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next v6 11/11] PCI: hv: Get vPCI MSI IRQ domain
 from DeviceTree
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: arnd@arndb.de, bhelgaas@google.com, bp@alien8.de,
 catalin.marinas@arm.com, conor+dt@kernel.org, dan.carpenter@linaro.org,
 dave.hansen@linux.intel.com, decui@microsoft.com, haiyangz@microsoft.com,
 hpa@zytor.com, joey.gouly@arm.com, krzk+dt@kernel.org, kw@linux.com,
 kys@microsoft.com, lenb@kernel.org, lpieralisi@kernel.org,
 manivannan.sadhasivam@linaro.org, mark.rutland@arm.com, maz@kernel.org,
 mingo@redhat.com, oliver.upton@linux.dev, robh@kernel.org,
 ssengar@linux.microsoft.com, sudeep.holla@arm.com, suzuki.poulose@arm.com,
 tglx@linutronix.de, wei.liu@kernel.org, will@kernel.org,
 yuzenghui@huawei.com, devicetree@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, x86@kernel.org,
 apais@microsoft.com, benhill@microsoft.com, bperkins@microsoft.com,
 sunilmut@microsoft.com
References: <20250315001931.631210-1-romank@linux.microsoft.com>
 <20250315001931.631210-12-romank@linux.microsoft.com>
 <CAJZ5v0jNEO2VcwmMXLZaS+Kqg3iBgHcWb65f90HKUADtPuvgqA@mail.gmail.com>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <CAJZ5v0jNEO2VcwmMXLZaS+Kqg3iBgHcWb65f90HKUADtPuvgqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_083730_552229_CFF0BFB3 
X-CRM114-Status: GOOD (  10.07  )
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



On 3/26/2025 7:56 AM, Rafael J. Wysocki wrote:
> On Sat, Mar 15, 2025 at 1:19 AM Roman Kisel <romank@linux.microsoft.com> wrote:

[...]

>> -                                                         chip_data);
>> +#ifdef CONFIG_ACPI
>> +       if (!acpi_disabled)
>> +               irq_domain_parent = hv_pci_acpi_irq_domain_parent();
>> +#endif
>> +#if defined(CONFIG_OF)
> 
> Why don't you do
> 
> #ifdef CONFIG_OF
> 
> here for consistency?
> 

Agree, that'd be easier on the eyes :) Will fix in the next version,
thanks for the suggestion!

>> +       if (!irq_domain_parent)
>> +               irq_domain_parent = hv_pci_of_irq_domain_parent();
>> +#endif
>> +       if (!irq_domain_parent) {
>> +               WARN_ONCE(1, "Invalid firmware configuration for VMBus interrupts\n");
>> +               ret = -EINVAL;
>> +               goto free_chip;
>> +       }
>> +
>> +       hv_msi_gic_irq_domain = irq_domain_create_hierarchy(
>> +               irq_domain_parent, 0, HV_PCI_MSI_SPI_NR,
>> +               fn, &hv_pci_domain_ops,
>> +               chip_data);
>>
>>          if (!hv_msi_gic_irq_domain) {
>>                  pr_err("Failed to create Hyper-V arm64 vPCI MSI IRQ domain\n");
>> --

-- 
Thank you,
Roman


