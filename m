Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCFCC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 18:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pt+Q7ht3AhnugEHbu9jM29WLMOV6R6cpgBm7yDdOmI4=; b=b9b/92OkAa3mYIXnbtN/fmqIkY
	wnFmUCCQjecWnsodMiA3f2kNlbGtFqdDfF0cT/3Tl3e30yDwa17lqjEaUNeaSO8jzdsEHaafhGcZJ
	RN5kaVQ20ikUeqTzxM4NfjewYh4yXlYZ6Li3InbEYLRBt3/aDbByxYxqj1w8WvmiNxP9nc8KdQ/yH
	duUt/PiNbEMG+EGrmf+L65H8JVyWRRXp4P8ZL6Uze1M8KIyASH4v11QtnJB/LZT6RdIuabLmcEGQ6
	nzx0kk/CVDEiqnimkTZXRuXDw4aDkqGALm3UdcHmmwaAKPcphO6RktLQPJByeca1hNurc0MTQsUE5
	u/QOjUDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqGC8-0000000BtkQ-0wwP;
	Thu, 06 Mar 2025 18:43:44 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqG9E-0000000BtJv-16nn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 18:40:45 +0000
Received: from [10.0.0.114] (c-67-182-156-199.hsd1.wa.comcast.net [67.182.156.199])
	by linux.microsoft.com (Postfix) with ESMTPSA id B2CB2210EAFD;
	Thu,  6 Mar 2025 10:40:41 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B2CB2210EAFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741286442;
	bh=Pt+Q7ht3AhnugEHbu9jM29WLMOV6R6cpgBm7yDdOmI4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RvXAotkXsVNPl95MOg6Uq/Wny/i6873I+B2RsRJbkpebrKLzlP3l6rQlkTVLzn17I
	 q//txb2AfRgNN+XPBOkUYvbfzveUAIc50dGar7vmFW4VER6m2Rzf3dqZwCzkrQSCvH
	 QLQbPV68EWDCjrQr27ObjMSZGS38jVXIDV9lUtZk=
Message-ID: <9123b404-f6f8-464b-bad8-b793ea6fb21e@linux.microsoft.com>
Date: Thu, 6 Mar 2025 10:40:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/10] hyperv: Convert Hyper-V status codes to strings
To: Michael Kelley <mhklinux@outlook.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
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
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "joro@8bytes.org" <joro@8bytes.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, "arnd@arndb.de"
 <arnd@arndb.de>,
 "jinankjain@linux.microsoft.com" <jinankjain@linux.microsoft.com>,
 "muminulrussell@gmail.com" <muminulrussell@gmail.com>,
 "skinsburskii@linux.microsoft.com" <skinsburskii@linux.microsoft.com>,
 "mrathor@linux.microsoft.com" <mrathor@linux.microsoft.com>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
 "apais@linux.microsoft.com" <apais@linux.microsoft.com>,
 "Tianyu.Lan@microsoft.com" <Tianyu.Lan@microsoft.com>,
 "stanislav.kinsburskiy@gmail.com" <stanislav.kinsburskiy@gmail.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "prapal@linux.microsoft.com" <prapal@linux.microsoft.com>,
 "muislam@microsoft.com" <muislam@microsoft.com>,
 "anrayabh@linux.microsoft.com" <anrayabh@linux.microsoft.com>,
 "rafael@kernel.org" <rafael@kernel.org>, "lenb@kernel.org"
 <lenb@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-2-git-send-email-nunodasneves@linux.microsoft.com>
 <SN6PR02MB41577560030C55503D1BAFDCD4CA2@SN6PR02MB4157.namprd02.prod.outlook.com>
 <SN6PR02MB4157629A6197A8A6C992BB75D4CA2@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <SN6PR02MB4157629A6197A8A6C992BB75D4CA2@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_104044_363753_6F1BD2C0 
X-CRM114-Status: GOOD (  33.69  )
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

On 3/6/2025 10:09 AM, Michael Kelley wrote:
> From: Michael Kelley <mhklinux@outlook.com> Sent: Thursday, March 6, 2025 9:58 AM
> 
>>
>> From: Nuno Das Neves <nunodasneves@linux.microsoft.com> Sent: Wednesday, February
>> 26, 2025 3:08 PM
>>>
>>> Introduce hv_result_to_string() for this purpose. This allows
>>> hypercall failures to be debugged more easily with dmesg.
>>>
>>> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
>>> ---
>>>  drivers/hv/hv_common.c         | 65 ++++++++++++++++++++++++++++++++++
>>>  drivers/hv/hv_proc.c           | 13 ++++---
>>>  include/asm-generic/mshyperv.h |  1 +
>>>  3 files changed, 74 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
>>> index 9804adb4cc56..ce20818688fe 100644
>>> --- a/drivers/hv/hv_common.c
>>> +++ b/drivers/hv/hv_common.c
>>> @@ -740,3 +740,68 @@ void hv_identify_partition_type(void)
>>>  			pr_crit("Hyper-V: CONFIG_MSHV_ROOT not enabled!\n");
>>>  	}
>>>  }
>>> +
>>> +const char *hv_result_to_string(u64 hv_status)
>>> +{
>>> +	switch (hv_result(hv_status)) {
>>> +	case HV_STATUS_SUCCESS:
>>> +		return "HV_STATUS_SUCCESS";
>>> +	case HV_STATUS_INVALID_HYPERCALL_CODE:
>>> +		return "HV_STATUS_INVALID_HYPERCALL_CODE";
>>> +	case HV_STATUS_INVALID_HYPERCALL_INPUT:
>>> +		return "HV_STATUS_INVALID_HYPERCALL_INPUT";
>>> +	case HV_STATUS_INVALID_ALIGNMENT:
>>> +		return "HV_STATUS_INVALID_ALIGNMENT";
>>> +	case HV_STATUS_INVALID_PARAMETER:
>>> +		return "HV_STATUS_INVALID_PARAMETER";
>>> +	case HV_STATUS_ACCESS_DENIED:
>>> +		return "HV_STATUS_ACCESS_DENIED";
>>> +	case HV_STATUS_INVALID_PARTITION_STATE:
>>> +		return "HV_STATUS_INVALID_PARTITION_STATE";
>>> +	case HV_STATUS_OPERATION_DENIED:
>>> +		return "HV_STATUS_OPERATION_DENIED";
>>> +	case HV_STATUS_UNKNOWN_PROPERTY:
>>> +		return "HV_STATUS_UNKNOWN_PROPERTY";
>>> +	case HV_STATUS_PROPERTY_VALUE_OUT_OF_RANGE:
>>> +		return "HV_STATUS_PROPERTY_VALUE_OUT_OF_RANGE";
>>> +	case HV_STATUS_INSUFFICIENT_MEMORY:
>>> +		return "HV_STATUS_INSUFFICIENT_MEMORY";
>>> +	case HV_STATUS_INVALID_PARTITION_ID:
>>> +		return "HV_STATUS_INVALID_PARTITION_ID";
>>> +	case HV_STATUS_INVALID_VP_INDEX:
>>> +		return "HV_STATUS_INVALID_VP_INDEX";
>>> +	case HV_STATUS_NOT_FOUND:
>>> +		return "HV_STATUS_NOT_FOUND";
>>> +	case HV_STATUS_INVALID_PORT_ID:
>>> +		return "HV_STATUS_INVALID_PORT_ID";
>>> +	case HV_STATUS_INVALID_CONNECTION_ID:
>>> +		return "HV_STATUS_INVALID_CONNECTION_ID";
>>> +	case HV_STATUS_INSUFFICIENT_BUFFERS:
>>> +		return "HV_STATUS_INSUFFICIENT_BUFFERS";
>>> +	case HV_STATUS_NOT_ACKNOWLEDGED:
>>> +		return "HV_STATUS_NOT_ACKNOWLEDGED";
>>> +	case HV_STATUS_INVALID_VP_STATE:
>>> +		return "HV_STATUS_INVALID_VP_STATE";
>>> +	case HV_STATUS_NO_RESOURCES:
>>> +		return "HV_STATUS_NO_RESOURCES";
>>> +	case HV_STATUS_PROCESSOR_FEATURE_NOT_SUPPORTED:
>>> +		return "HV_STATUS_PROCESSOR_FEATURE_NOT_SUPPORTED";
>>> +	case HV_STATUS_INVALID_LP_INDEX:
>>> +		return "HV_STATUS_INVALID_LP_INDEX";
>>> +	case HV_STATUS_INVALID_REGISTER_VALUE:
>>> +		return "HV_STATUS_INVALID_REGISTER_VALUE";
>>> +	case HV_STATUS_OPERATION_FAILED:
>>> +		return "HV_STATUS_OPERATION_FAILED";
>>> +	case HV_STATUS_TIME_OUT:
>>> +		return "HV_STATUS_TIME_OUT";
>>> +	case HV_STATUS_CALL_PENDING:
>>> +		return "HV_STATUS_CALL_PENDING";
>>> +	case HV_STATUS_VTL_ALREADY_ENABLED:
>>> +		return "HV_STATUS_VTL_ALREADY_ENABLED";
>>> +	default:
>>> +		return "Unknown";
>>> +	};
>>> +	return "Unknown";
>>> +}
>>> +EXPORT_SYMBOL_GPL(hv_result_to_string);
>>> +
>>> diff --git a/drivers/hv/hv_proc.c b/drivers/hv/hv_proc.c
>>> index 2fae18e4f7d2..8fc30f509fa7 100644
>>> --- a/drivers/hv/hv_proc.c
>>> +++ b/drivers/hv/hv_proc.c
>>> @@ -87,7 +87,8 @@ int hv_call_deposit_pages(int node, u64 partition_id, u32
>>> num_pages)
>>>  				     page_count, 0, input_page, NULL);
>>>  	local_irq_restore(flags);
>>>  	if (!hv_result_success(status)) {
>>> -		pr_err("Failed to deposit pages: %lld\n", status);
>>> +		pr_err("%s: Failed to deposit pages: %s\n", __func__,
>>> +		       hv_result_to_string(status));
>>>  		ret = hv_result_to_errno(status);
>>>  		goto err_free_allocations;
>>>  	}
>>> @@ -137,8 +138,9 @@ int hv_call_add_logical_proc(int node, u32 lp_index, u32 apic_id)
>>>
>>>  		if (hv_result(status) != HV_STATUS_INSUFFICIENT_MEMORY) {
>>>  			if (!hv_result_success(status)) {
>>> -				pr_err("%s: cpu %u apic ID %u, %lld\n", __func__,
>>> -				       lp_index, apic_id, status);
>>> +				pr_err("%s: cpu %u apic ID %u, %s\n",
>>> +				       __func__, lp_index, apic_id,
>>> +				       hv_result_to_string(status));
>>>  				ret = hv_result_to_errno(status);
>>>  			}
>>>  			break;
>>> @@ -179,8 +181,9 @@ int hv_call_create_vp(int node, u64 partition_id, u32 vp_index,
>>> u32 flags)
>>>
>>>  		if (hv_result(status) != HV_STATUS_INSUFFICIENT_MEMORY) {
>>>  			if (!hv_result_success(status)) {
>>> -				pr_err("%s: vcpu %u, lp %u, %lld\n", __func__,
>>> -				       vp_index, flags, status);
>>> +				pr_err("%s: vcpu %u, lp %u, %s\n",
>>> +				       __func__, vp_index, flags,
>>> +				       hv_result_to_string(status));
>>>  				ret = hv_result_to_errno(status);
>>>  			}
>>>  			break;
>>> diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
>>> index b13b0cda4ac8..dc4729dba9ef 100644
>>> --- a/include/asm-generic/mshyperv.h
>>> +++ b/include/asm-generic/mshyperv.h
>>> @@ -298,6 +298,7 @@ static inline int cpumask_to_vpset_skip(struct hv_vpset *vpset,
>>>  	return __cpumask_to_vpset(vpset, cpus, func);
>>>  }
>>>
>>> +const char *hv_result_to_string(u64 hv_status);
>>>  int hv_result_to_errno(u64 status);
>>>  void hyperv_report_panic(struct pt_regs *regs, long err, bool in_die);
>>>  bool hv_is_hyperv_initialized(void);
>>> --
>>> 2.34.1
>>
>> I've read through the other comments on this patch. I definitely vote
>> for outputting both the hex code along with a string translation, which
>> could be empty if the hex code is unrecognized by the translation code.
>>
>> I can see providing something like hv_hvcall_err() as Nuno proposed, since
>> that standardizes the text output. But I wonder if it would be too limiting.
>> For example, in the changes above, both hv_call_add_logical_proc() and
>> hv_call_create_vp() output additional debugging values, which we probably
>> don't want to give up.
>>
>> Lastly, from an implementation standpoint, rather than using a big
>> switch statement, build a static array of entries that each have the
>> hex code and string equivalent. Then hv_result_to_string() loops through
>> the array looking for a match. This won't be any slower than the big switch
>> statement. I've seen other places in the kernel where string names are
>> output, and looking up the strings in a static array is the typical approach.
>> You'll have to work through the details and see if avoids being too clumsy,
>> but I think it will be OK.
>>
> 
> Better yet, also include the translated errno in each static array entry.
> Then hv_result_to_errno() can do the same kind of lookup instead of
> having its own switch statement. I did a quick look to see if the two
> functions might be combined to do only a single lookup, but that looks
> somewhat clumsy unless someone else spots a better way to handle it.
> The cost of doing two lookups doesn't really matter in an error case.
> 
> FWIW, hv_result_to_errno() and the new hv_result_to_string() are both
> slightly misnamed. The input argument is a full 64-bit hv_status, not the
> smaller 16-bit result field. hv_status_to_errno() and hv_status_to_string()
> would be more precise.
> 
Hmm, well I'll admit I was and still am rather confused on this point.

In the TLFS (section 3.8) the entire 64-bit return value is called the
"hypercall result value".
The 16-bit HV_STATUS part is *also* called the "result" in this section.
Later, in section 3.12, the 16-bit field is referred to as a "status value
field".
Furthermore, the name of the 16-bit value, itself, is HV_STATUS.

Despite the inconsistency, in my mind it makes the most sense that the
16-bit HV_STATUS part the "status" and the entire 64-bit return value the
"result". I am aware that elsewhere (and in the driver patches in this
series), the name "status" is used to refer to the entire 64-bit return
value.

These functions were actually called hv_status_to_errno() and hv_status_to_string()
in the past, but I changed them to use "result" by following my own logic, and I
thought this also matched the naming of hv_result() and hv_result_success().
However I now realize that the "result" in these names refers to the *output* of
these functions... they take a u64 status as a parameter after all..

So in the end I'm rather bothered by this whole situation. I can change these
names back to "status" (although hv_result_to_errno() is already merged, I
could send a fixup), or I could keep "result", which I think is a more
logical name for the 64-bit value, even though it somewhat contradicts how
the term is already used in the kernel.

Given it doesn't seem to be well-defined in the first place, I'm not really
sure the best route.

Nuno

> Michael


