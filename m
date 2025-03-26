Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C655C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 16:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5dEhZXpJIQDYjKp44/xRbSpFUSHWMuuE2+/dnL6k/lU=; b=n4HuRaY1BuYXiGeXvCme6H4nrn
	yrPHfZoDE/n1RzfZjuUdh1a73hRZjGLNpnaaDJ7PnbWtqNqWTcWG18WxCAi6kDG9kAc0NNcZF+NU3
	dHR/anrHpM8Dqnl9pDItTZaaEj/CMJa9zxrX6kcCTl4bRUsG1kC1EjU/FWZe2g8F50C8RlS7G1KJP
	CcsYj+BzXYFuh0FvV7LhTCYpVv8HysjUEeCpUDfmZ3kDRXF5vQ/nZPVL1/CMGFAEI0SjBeRuE3gX9
	OvlfAMZkMHYHe5P9XU748bz4sYm2B9aCugjSFf95VOMwLy/Dd8h+4nWec8X07/FgPDzs0RWpOCJdH
	bL0tldvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTCs-00000008wCM-1CBN;
	Wed, 26 Mar 2025 16:02:18 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txSkR-00000008s5o-4AyZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 15:32:57 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id A914B210C320;
	Wed, 26 Mar 2025 08:32:53 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A914B210C320
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1743003174;
	bh=5dEhZXpJIQDYjKp44/xRbSpFUSHWMuuE2+/dnL6k/lU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h9CXDAO1ZrAH2QmyDPeZh9D575YKdAtnwcuvQxr+2h+cWYYQEZjW0lE1GdOfjm8h0
	 WTL8D4VFuAxQbfVPl4CANyl7MImvzKVJrV1UkEJ6ZDQRtMcF1/oXVnUIM04GP/33qq
	 SoTHHkrgirDlGx5JlRlVXulkrfzJWIihHsu4hJNE=
Message-ID: <f8ccc874-e153-4b78-8159-9923dfa77fc3@linux.microsoft.com>
Date: Wed, 26 Mar 2025 08:32:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next v6 10/11] ACPI: irq: Introduce
 acpi_get_gsi_dispatcher()
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
 <20250315001931.631210-11-romank@linux.microsoft.com>
 <CAJZ5v0g1bX_3zRUUf-=euuvhm1dPB6bjEXPH9O-kMGcZjRspcw@mail.gmail.com>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <CAJZ5v0g1bX_3zRUUf-=euuvhm1dPB6bjEXPH9O-kMGcZjRspcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_083256_097562_5493F6AB 
X-CRM114-Status: GOOD (  18.90  )
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



On 3/26/2025 7:55 AM, Rafael J. Wysocki wrote:
> On Sat, Mar 15, 2025 at 1:19 AM Roman Kisel <romank@linux.microsoft.com> wrote:
[...]
> 
> This basically looks OK to me except for a couple of coding style
> related nits below.
> 

Appreciate taking time to review this very much! Will squash the nits in
the next version.

>> ---
>>   drivers/acpi/irq.c   | 15 +++++++++++++--
>>   include/linux/acpi.h |  5 ++++-
>>   2 files changed, 17 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/acpi/irq.c b/drivers/acpi/irq.c
>> index 1687483ff319..8eb09e45e5c5 100644
>> --- a/drivers/acpi/irq.c
>> +++ b/drivers/acpi/irq.c
>> @@ -12,7 +12,7 @@
>>
>>   enum acpi_irq_model_id acpi_irq_model;
>>
>> -static struct fwnode_handle *(*acpi_get_gsi_domain_id)(u32 gsi);
>> +static acpi_gsi_domain_disp_fn acpi_get_gsi_domain_id;
>>   static u32 (*acpi_gsi_to_irq_fallback)(u32 gsi);
>>
>>   /**
>> @@ -307,12 +307,23 @@ EXPORT_SYMBOL_GPL(acpi_irq_get);
>>    *     for a given GSI
>>    */
>>   void __init acpi_set_irq_model(enum acpi_irq_model_id model,
>> -                              struct fwnode_handle *(*fn)(u32))
> 
> Please retain the indentation here and analogously below.
> 
>> +       acpi_gsi_domain_disp_fn fn)
>>   {
>>          acpi_irq_model = model;
>>          acpi_get_gsi_domain_id = fn;
>>   }
>>
>> +/**
>> + * acpi_get_gsi_dispatcher - Returns dispatcher function that
>> + *                           computes the domain fwnode for a
>> + *                           given GSI.
>> + */
> 
> I would format this kerneldoc comment a bit differently:
> 
> /*
>   * acpi_get_gsi_dispatcher() - Get the GSI dispatcher function
>   *
>   * Return the dispatcher function that computes the domain fwnode for
> a given GSI.
>   */
> 
>> +acpi_gsi_domain_disp_fn acpi_get_gsi_dispatcher(void)
>> +{
>> +       return acpi_get_gsi_domain_id;
>> +}
>> +EXPORT_SYMBOL_GPL(acpi_get_gsi_dispatcher);
>> +
>>   /**
>>    * acpi_set_gsi_to_irq_fallback - Register a GSI transfer
>>    * callback to fallback to arch specified implementation.
>> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
>> index 4e495b29c640..abc51288e867 100644
>> --- a/include/linux/acpi.h
>> +++ b/include/linux/acpi.h
>> @@ -336,8 +336,11 @@ int acpi_register_gsi (struct device *dev, u32 gsi, int triggering, int polarity
>>   int acpi_gsi_to_irq (u32 gsi, unsigned int *irq);
>>   int acpi_isa_irq_to_gsi (unsigned isa_irq, u32 *gsi);
>>
>> +typedef struct fwnode_handle *(*acpi_gsi_domain_disp_fn)(u32);
>> +
>>   void acpi_set_irq_model(enum acpi_irq_model_id model,
>> -                       struct fwnode_handle *(*)(u32));
>> +       acpi_gsi_domain_disp_fn fn);
>> +acpi_gsi_domain_disp_fn acpi_get_gsi_dispatcher(void);
>>   void acpi_set_gsi_to_irq_fallback(u32 (*)(u32));
>>
>>   struct irq_domain *acpi_irq_create_hierarchy(unsigned int flags,
>> --
> 
> With the above addressed, please feel free to add
> 
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> to the patch and route it along with the rest of the series.
> 

Will do, thanks!

> Thanks!

-- 
Thank you,
Roman


