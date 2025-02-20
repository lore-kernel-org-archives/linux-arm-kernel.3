Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B84C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 16:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ll4MapV9YYQHwTCOG3xJfA+Sudr/vOAtL9iS2dtf3J0=; b=pt7z9X/VN6G8vQbCkasY3gsh4B
	kyILpNvA/+k9dFPP86X+Y4PV8GVHFYN9b7shVRhsq2H3kkbo+TcaQOJuELaVzfKsBt8sYfvBAe0hz
	M81OvxgG8MIFB/rieACve78jgAf2NuTRqX+jftdoMkdqigaXq/pulGnufjHYGafVFMYXBCaJv+Mcd
	rpgg5H4huZ8sVNAkPcEzQFu2h9OxhtDZQtkroud1z9oZBThXEDIe8Quvdo/yV7j6jGw2SIcwqwFmk
	LGG45psVo5TQRrMsDfHOQR5W8UIOmX2o3qJGKbBRx3wFTnkUKxR9EGUV9zX0A103Um9n1MZhouwba
	lARVFgvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl9XO-00000001tlY-3Szk;
	Thu, 20 Feb 2025 16:36:34 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl9Vt-00000001tTc-3FEe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 16:35:03 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id F1D8920376F8;
	Thu, 20 Feb 2025 08:34:59 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com F1D8920376F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740069300;
	bh=ll4MapV9YYQHwTCOG3xJfA+Sudr/vOAtL9iS2dtf3J0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FabHF0Pv9CtkRuEY+LxCxEqw+PX7OOBIDPKEL29N2aeyIMDHzhOQg1gf0RQO2lmoI
	 CRtE1nDhCVV6idmCw6GqON120UCb0TBOM/r9zx91h9wa8UVVHQqcoz2IlXj6lCCtm7
	 rQnELxtu7vmnEMRCugYJDyI4Tay8IR8t3zOiFDTo=
Message-ID: <fa2d9e8d-7897-44eb-87e2-3a9118deb18a@linux.microsoft.com>
Date: Thu, 20 Feb 2025 08:34:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next v4 1/6] arm64: hyperv: Use SMCCC to detect
 hypervisor presence
To: Michael Kelley <mhklinux@outlook.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "bhelgaas@google.com" <bhelgaas@google.com>, "bp@alien8.de" <bp@alien8.de>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "hpa@zytor.com" <hpa@zytor.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "kw@linux.com" <kw@linux.com>, "kys@microsoft.com" <kys@microsoft.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
 "mingo@redhat.com" <mingo@redhat.com>, "robh@kernel.org" <robh@kernel.org>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, "will@kernel.org"
 <will@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>
Cc: "benhill@microsoft.com" <benhill@microsoft.com>,
 "bperkins@microsoft.com" <bperkins@microsoft.com>,
 "sunilmut@microsoft.com" <sunilmut@microsoft.com>
References: <20250212014321.1108840-1-romank@linux.microsoft.com>
 <20250212014321.1108840-2-romank@linux.microsoft.com>
 <SN6PR02MB4157DB2F52501309D52D0870D4C52@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <SN6PR02MB4157DB2F52501309D52D0870D4C52@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_083501_863172_0DBA2C91 
X-CRM114-Status: GOOD (  18.77  )
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



On 2/19/2025 3:13 PM, Michael Kelley wrote:
> From: Roman Kisel <romank@linux.microsoft.com> Sent: Tuesday, February 11, 2025 5:43 PM
>>

[...]

>>   }
>>
>> +static bool hyperv_detect_via_acpi(void)
>> +{
>> +	if (acpi_disabled)
>> +		return false;
>> +#if IS_ENABLED(CONFIG_ACPI)
>> +	/* Hypervisor ID is only available in ACPI v6+. */
> 
> The comment is correct, but to me doesn't tell the full story.
> I initially wondered why the revision test < 6 was being done,
> since Hyper-V for ARM64 always provides ACPI 6.x or greater.
> But the test is needed to catch running in some unknown
> non-Hyper-V environment that has ACPI 5.x or less. In such a
> case, it can't be Hyper-V, so just return false instead of testing
> a bogus hypervisor_id field. Maybe a comment would help
> explain it to someone like me who was confused. :-)
> 

Thanks, I'll extend the comment to tell the whole story!

[...]

>> +	ms_hyperv.vtl = get_vtl();
> 
> The above statement looks like it will fail to compile on
> arm64 since the get_vtl() function is entirely on the x86
> side until Patch 3 of this series. As of this Patch 1, there's
> no declaration of get_vtl() available to arm64.
> 

I used my working branch for testing
https://github.com/romank-msft/linux-hyperv/tree/vtl_mode_arm64_v4
and didn't move that code around when chunking into patches.
Will fix the workflow, thanks for catching this!

>> +	/* Report if non-default VTL */
>> +	if (ms_hyperv.vtl > 0)
>> +		pr_info("Linux runs in Hyper-V Virtual Trust Level\n");
> 
> Could this message include the VTL number as well? In the long
> run, I think there will be code at non-zero VTLs other than VTL 2.
> 

Absolutely, will add!

>> +
>>   	ms_hyperv_late_init();
>>
>>   	hyperv_initialized = true;
>> diff --git a/arch/arm64/include/asm/mshyperv.h
>> b/arch/arm64/include/asm/mshyperv.h
>> index 2e2f83bafcfb..a6d7eb9e167b 100644
>> --- a/arch/arm64/include/asm/mshyperv.h
>> +++ b/arch/arm64/include/asm/mshyperv.h
>> @@ -50,4 +50,9 @@ static inline u64 hv_get_msr(unsigned int reg)
>>
>>   #include <asm-generic/mshyperv.h>
>>
>> +#define ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_0	0x4d32ba58U
>> +#define ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_1	0xcd244764U
>> +#define ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_2	0x8eef6c75U
>> +#define ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_3	0x16597024U
>> +
>>   #endif
>> --
>> 2.43.0
>>

-- 
Thank you,
Roman


