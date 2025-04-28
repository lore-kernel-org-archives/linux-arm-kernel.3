Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49011C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 19:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGVkN1hybuqThviIpy5Yd0rlklDTmHHqQY1gOTTQ/aU=; b=o3j4YGr/taW+m0+hUPDA30lQ//
	I3TZ+38k3dJXrhylu3enLn0KvHuANSuy8UsAvDgn4BkaF+5nNVkrUI52sowzC6j4anqGjDXmpwXFq
	+lM1HvHsURYsT38d5AJRpZtYBBnxnz1WxY36U3J0Eet4LWX4EGATskxqYBc9YgKU31WiXDHHc9KZN
	lNcFGg+UnV2AnkUYzMorMkhIUnx9ie4lye7w++/wFDVzXXOklvoG7xCYlAH+8ucigGUUJIpN8Uw3h
	WEh9jO5Uk5BGyB3+RQf8ARA/VVOsc76koXDtQZSMZFFWrvITgzPWm4+S3gV/qzzDsF4exM3qz6fIk
	C8Fw6+pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9U6G-00000007KcN-2QnT;
	Mon, 28 Apr 2025 19:25:08 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9U4J-00000007KNJ-1abB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 19:23:08 +0000
Received: from [10.137.184.60] (unknown [131.107.1.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 698AE211AD01;
	Mon, 28 Apr 2025 12:23:04 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 698AE211AD01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1745868184;
	bh=jGVkN1hybuqThviIpy5Yd0rlklDTmHHqQY1gOTTQ/aU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fbo+7dHLY2ZtqfyjtlaCC5jw3uqw6PD289mAPFW3y9leIqksoAj8pWNCIrbN3bTir
	 t8IVF7ly+J9ECgXB/qJQ+LMth9i++CMUSEVRhbLOpC8MUWohTAzFbArmXIyjUraZ4l
	 Qq5vCgAWx1+qCJmiI7PVXDfKUtWQvPmpyy6Pg9L8=
Message-ID: <5cdb2703-2b94-4f38-a440-8f5c9a4c66be@linux.microsoft.com>
Date: Mon, 28 Apr 2025 12:23:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next v8 02/11] arm64: hyperv: Use SMCCC to detect
 hypervisor presence
To: Michael Kelley <mhklinux@outlook.com>
Cc: "apais@microsoft.com" <apais@microsoft.com>,
 "benhill@microsoft.com" <benhill@microsoft.com>,
 "bperkins@microsoft.com" <bperkins@microsoft.com>,
 "sunilmut@microsoft.com" <sunilmut@microsoft.com>,
 "arnd@arndb.de" <arnd@arndb.de>, "bhelgaas@google.com"
 <bhelgaas@google.com>, "bp@alien8.de" <bp@alien8.de>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "hpa@zytor.com" <hpa@zytor.com>, "joey.gouly@arm.com" <joey.gouly@arm.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "kw@linux.com" <kw@linux.com>,
 "kys@microsoft.com" <kys@microsoft.com>, "lenb@kernel.org"
 <lenb@kernel.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "maz@kernel.org" <maz@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "rafael@kernel.org" <rafael@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "rafael.j.wysocki@intel.com"
 <rafael.j.wysocki@intel.com>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
 "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
 "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, "will@kernel.org"
 <will@kernel.org>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>
References: <20250414224713.1866095-1-romank@linux.microsoft.com>
 <20250414224713.1866095-3-romank@linux.microsoft.com>
 <SN6PR02MB41576A5C3C0F5911A308E804D4BC2@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <SN6PR02MB41576A5C3C0F5911A308E804D4BC2@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_122307_470611_4D058F6E 
X-CRM114-Status: GOOD (  21.20  )
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



On 4/17/2025 8:27 AM, Michael Kelley wrote:
> From: Roman Kisel <romank@linux.microsoft.com> Sent: Monday, April 14, 2025 3:47 PM
[...]
> I had previously given my Reviewed-by: on v5 of this patch. But
> looking at it again, it would be nice if this UUID were defined in
> include/linux/arm-smccc.h alongside the definition of
> ARM_SMCCC_VENDOR_HYP_UID_KVM. The UUID values are
> are independent of each other, but it's a bit asymmetric to have
> the KVM UUID defined centrally while the Hyper-V UUID is
> buried in Hyper-V specific code. But I'm OK with the current code
> if there's nothing else to respin for.
> 

As I saw that, KVM is special in the kernel as the kernel provides
both the host side code and the kernel side code so the UUID has
to be shared in the header file.

In the Hyper-V case, we have only the guest side code so it seemed
more economical to have that tucked into the function rather than
adding to the arch-wide header and including the header.


>> +
>> +	return arm_smccc_hypervisor_has_uuid(&hyperv_uuid);
>> +}
>> +
>>   static int __init hyperv_init(void)
>>   {
>>   	struct hv_get_vp_registers_output	result;
>> @@ -36,13 +78,11 @@ static int __init hyperv_init(void)
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
> 
> My UUID comment notwithstanding,
> 
> Reviewed-by: Michael Kelley <mhklinux@outlook.com>
> 
> 

-- 
Thank you,
Roman


