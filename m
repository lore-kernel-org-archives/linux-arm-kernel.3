Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FBDC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 17:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NB4fqdojx7nwho6V/Wqpk0F8wPdUrsMy+Cc8gR0lJx4=; b=KGxf8rfy9ETJWMwmDflB2L5uYI
	wje3m3hvqzUqPnMH/B4cGP+dtvS2ta9NuIa6haiWvNHtHbOTjtcdd+E9sKcgbDF/WiislSLIXF9iO
	5CFTPNmnYggUnPDekKB6feOsIau2fVZZ5ihCwcBt062JAH/FpOT7nQgnZEq2lVaCBg4v1tuL2FFtD
	hfPECJs8OGiy46t0Aw0gYxOzGywjO4pAAAAsl1wZRjPCOqayOFbuDH5nMQ1L5haEjGt8CoftE9F8Z
	0qh4LyLM85RWiV/swc1IYOAdk/BmTzlZw4WD0C1SsWkGF370FJhDVZ0MlYpTIP0xASP8KbW7iX+ir
	kfcGukRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuE6M-00000003XKh-48Vq;
	Mon, 17 Mar 2025 17:18:10 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuE1G-00000003UoG-3KJ0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 17:12:56 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id D524C2033446;
	Mon, 17 Mar 2025 10:12:53 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D524C2033446
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1742231574;
	bh=NB4fqdojx7nwho6V/Wqpk0F8wPdUrsMy+Cc8gR0lJx4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pp4LLRMeLW/Iyda8Sngc/0xWytsDSpkGOz1lBb7O7x5IbTDnPTe+Yp/JnsLZoOx5e
	 B9LJG4uglL6w32K1ebxPFOrJfVRh02GeQ3KX0x4/yoqQvlCDju/k74hz7WFBMdx6Fp
	 Fly/svj5TvLrFY4OVkoCfg985ETQmsdbb16fzu/Q=
Message-ID: <c0f51574-d31f-47e0-a4c0-6e6d0fbe1804@linux.microsoft.com>
Date: Mon, 17 Mar 2025 10:12:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next v6 02/11] arm64: hyperv: Use SMCCC to detect
 hypervisor presence
To: Mark Rutland <mark.rutland@arm.com>
Cc: arnd@arndb.de, bhelgaas@google.com, bp@alien8.de,
 catalin.marinas@arm.com, conor+dt@kernel.org, dan.carpenter@linaro.org,
 dave.hansen@linux.intel.com, decui@microsoft.com, haiyangz@microsoft.com,
 hpa@zytor.com, joey.gouly@arm.com, krzk+dt@kernel.org, kw@linux.com,
 kys@microsoft.com, lenb@kernel.org, lpieralisi@kernel.org,
 manivannan.sadhasivam@linaro.org, maz@kernel.org, mingo@redhat.com,
 oliver.upton@linux.dev, rafael@kernel.org, robh@kernel.org,
 ssengar@linux.microsoft.com, sudeep.holla@arm.com, suzuki.poulose@arm.com,
 tglx@linutronix.de, wei.liu@kernel.org, will@kernel.org,
 yuzenghui@huawei.com, devicetree@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, x86@kernel.org,
 apais@microsoft.com, benhill@microsoft.com, bperkins@microsoft.com,
 sunilmut@microsoft.com
References: <20250315001931.631210-1-romank@linux.microsoft.com>
 <20250315001931.631210-3-romank@linux.microsoft.com>
 <Z9gJlQgV3hm1kxY0@J2N7QTR9R3.cambridge.arm.com>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <Z9gJlQgV3hm1kxY0@J2N7QTR9R3.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_101254_886178_00492978 
X-CRM114-Status: GOOD (  15.36  )
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



On 3/17/2025 4:37 AM, Mark Rutland wrote:
> On Fri, Mar 14, 2025 at 05:19:22PM -0700, Roman Kisel wrote:

[...]

> The 'acpi_disabled' variable doesn't exist for !CONFIG_ACPI, so its use
> prior to the ifdeffery looks misplaced.
> 
> Usual codestyle is to avoid ifdeffery if possible, using IS_ENABLED().
> Otherwise, use a stub, e.g.
> 

That looks much better, thanks for the review! Will implement in
the next version.

> | #ifdef CONFIG_ACPI
> | static bool __init hyperv_detect_via_acpi(void)
> | {
> | 	if (acpi_disabled)
> | 		return false;
> | 	
> | 	if (acpi_gbl_FADT.header.revision < 6)
> | 		return false;
> | 	
> | 	return strncmp((char *)&acpi_gbl_FADT.hypervisor_id, "MsHyperV", 8) == 0;
> | }
> | #else
> | static inline bool hyperv_detect_via_acpi(void) { return false; }
> | #endif
> 
> Mark.
> 
>> +static bool __init hyperv_detect_via_smccc(void)
>> +{
>> +	uuid_t hyperv_uuid = UUID_INIT(
>> +		0x4d32ba58, 0x4764, 0xcd24,
>> +		0x75, 0x6c, 0xef, 0x8e,
>> +		0x24, 0x70, 0x59, 0x16);
>> +
>> +	return arm_smccc_hyp_present(&hyperv_uuid);
>> +}
>> +
>>   static int __init hyperv_init(void)
>>   {
>>   	struct hv_get_vp_registers_output	result;
>> @@ -35,13 +70,11 @@ static int __init hyperv_init(void)
>>   
>>   	/*
>>   	 * Allow for a kernel built with CONFIG_HYPERV to be running in
>> -	 * a non-Hyper-V environment, including on DT instead of ACPI.
>> +	 * a non-Hyper-V environment.
>> +	 *
>>   	 * In such cases, do nothing and return success.
>>   	 */
>> -	if (acpi_disabled)
>> -		return 0;
>> -
>> -	if (strncmp((char *)&acpi_gbl_FADT.hypervisor_id, "MsHyperV", 8))
>> +	if (!hyperv_detect_via_acpi() && !hyperv_detect_via_smccc())
>>   		return 0;
>>   
>>   	/* Setup the guest ID */
>> -- 
>> 2.43.0
>>

-- 
Thank you,
Roman


