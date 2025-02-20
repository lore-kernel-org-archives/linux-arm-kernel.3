Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEB4C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 22:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8O/BFXNYUlbWqYOn91G8A2mFS2+fXJ+Iw3KR7ydAxqM=; b=eyry6Knt8oNt9SKeJAZoBARXQY
	wEPdGnnGMZnNVZFpl1LomLDaZiF+lwczfv0DwOiIG7T90HAeS5lESjt4kBRboOBqByay4V7CqhHwy
	H4CKn2GXCx4IPEbCEOV5GO/ktbBB3MplBTtfVkMR3gR2nipSvudqHOyI/GP7XHI8I+/mekG65oMqZ
	ZrrbYWvsUfYIUXMyWp+SeWxLHnI4RDIbGWCOpktHle3MMY2g6JnGOorJkt5IWFrTFXuyvswWqaiIa
	7rkYiY5ASXmg0pFfitrm+Xttym6jAoaMwHl/qrEC3DHdMhIjTq8fTRGry0smwYfFidawB7F6sLLjy
	fBQmTSCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlEan-000000033ue-22ai;
	Thu, 20 Feb 2025 22:00:25 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlEYe-000000033Jb-1qMO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 21:58:13 +0000
Received: from [10.0.0.114] (c-67-182-156-199.hsd1.wa.comcast.net [67.182.156.199])
	by linux.microsoft.com (Postfix) with ESMTPSA id B044A203E3BD;
	Thu, 20 Feb 2025 13:58:07 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B044A203E3BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740088688;
	bh=8O/BFXNYUlbWqYOn91G8A2mFS2+fXJ+Iw3KR7ydAxqM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dMqCGFVpL42bwlZlJHMSuTTwuBA/sxgE5feV1M6m3hpmvrJSk5z4htbawHEWqNFb+
	 pWj/qs0U0ciP09t8y/gqIAQ3YwxGW57AmzxGsELv+wTuzLQ2WQbKBj2YJv6n7+js2g
	 dguZh9PH/E5NOtUatZSDxcL7fFcRCDo5pdM7ku5M=
Message-ID: <2b8f135b-8a65-4cee-ba4b-af1cd987c687@linux.microsoft.com>
Date: Thu, 20 Feb 2025 13:58:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] hyperv: Convert hypercall statuses to linux error
 codes
To: Michael Kelley <mhklinux@outlook.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "eahariha@linux.microsoft.com" <eahariha@linux.microsoft.com>
Cc: "kys@microsoft.com" <kys@microsoft.com>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>,
 "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "joro@8bytes.org" <joro@8bytes.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, "arnd@arndb.de"
 <arnd@arndb.de>,
 "jinankjain@linux.microsoft.com" <jinankjain@linux.microsoft.com>,
 "muminulrussell@gmail.com" <muminulrussell@gmail.com>,
 "skinsburskii@linux.microsoft.com" <skinsburskii@linux.microsoft.com>,
 "mukeshrathor@microsoft.com" <mukeshrathor@microsoft.com>
References: <1740076396-15086-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740076396-15086-2-git-send-email-nunodasneves@linux.microsoft.com>
 <SN6PR02MB41578283BE9E070349EEB1A3D4C42@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <SN6PR02MB41578283BE9E070349EEB1A3D4C42@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_135812_526840_911CE8CD 
X-CRM114-Status: GOOD (  19.98  )
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

On 2/20/2025 11:03 AM, Michael Kelley wrote:
> From: Nuno Das Neves <nunodasneves@linux.microsoft.com> Sent: Thursday, February 20, 2025 10:33 AM
>>
>> Return linux-friendly error codes from hypercall helper functions,
>> which allows them to be used more flexibly.
>>
>> Introduce hv_result_to_errno() for this purpose, which also handles
>> the special value U64_MAX returned from hv_do_hypercall().
>>
>> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
>> ---
>>  drivers/hv/hv_common.c         | 34 ++++++++++++++++++++++++++++++++++
>>  drivers/hv/hv_proc.c           |  6 +++---
>>  include/asm-generic/mshyperv.h |  1 +
>>  3 files changed, 38 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
>> index ee3083937b4f..2120aead98d9 100644
>> --- a/drivers/hv/hv_common.c
>> +++ b/drivers/hv/hv_common.c
>> @@ -683,3 +683,37 @@ u64 __weak hv_tdx_hypercall(u64 control, u64 param1, u64 param2)
>>  	return HV_STATUS_INVALID_PARAMETER;
>>  }
>>  EXPORT_SYMBOL_GPL(hv_tdx_hypercall);
>> +
>> +/* Convert a hypercall result into a linux-friendly error code. */
>> +int hv_result_to_errno(u64 status)
>> +{
>> +	/* hv_do_hypercall() may return U64_MAX, hypercalls aren't possible */
>> +	if (unlikely(status == U64_MAX))
>> +		return -EOPNOTSUPP;
>> +	/*
>> +	 * A failed hypercall is usually only recoverable (or loggable) near
>> +	 * the call site where the HV_STATUS_* code is known. So the errno
>> +	 * it gets converted to is not too useful further up the stack.
>> +	 * Provice a few mappings that could be useful, and revert to -EIO
>> +	 * as a fallback.
>> +	 */
>> +	switch (hv_result(status)) {
>> +	case HV_STATUS_SUCCESS:
>> +		return 0;
>> +	case HV_STATUS_INVALID_HYPERCALL_CODE:
>> +	case HV_STATUS_INVALID_HYPERCALL_INPUT:
>> +	case HV_STATUS_INVALID_PARAMETER:
>> +	case HV_STATUS_INVALID_PARTITION_ID:
>> +	case HV_STATUS_INVALID_VP_INDEX:
>> +	case HV_STATUS_INVALID_PORT_ID:
>> +	case HV_STATUS_INVALID_CONNECTION_ID:
>> +	case HV_STATUS_INVALID_LP_INDEX:
>> +	case HV_STATUS_INVALID_REGISTER_VALUE:
>> +		return -EINVAL;
>> +	case HV_STATUS_INSUFFICIENT_MEMORY:
>> +		return -ENOMEM;
>> +	default:
>> +		break;
>> +	}
>> +	return -EIO;
>> +}
>> diff --git a/drivers/hv/hv_proc.c b/drivers/hv/hv_proc.c
>> index 3e410489f480..72b09f1cfa3e 100644
>> --- a/drivers/hv/hv_proc.c
>> +++ b/drivers/hv/hv_proc.c
>> @@ -88,7 +88,7 @@ int hv_call_deposit_pages(int node, u64 partition_id, u32 num_pages)
>>  	local_irq_restore(flags);
>>  	if (!hv_result_success(status)) {
>>  		pr_err("Failed to deposit pages: %lld\n", status);
>> -		ret = hv_result(status);
>> +		ret = hv_result_to_errno(status);
>>  		goto err_free_allocations;
>>  	}
>>
>> @@ -139,7 +139,7 @@ int hv_call_add_logical_proc(int node, u32 lp_index, u32 apic_id)
>>  			if (!hv_result_success(status)) {
>>  				pr_err("%s: cpu %u apic ID %u, %lld\n", __func__,
>>  				       lp_index, apic_id, status);
>> -				ret = hv_result(status);
>> +				ret = hv_result_to_errno(status);
>>  			}
>>  			break;
>>  		}
>> @@ -181,7 +181,7 @@ int hv_call_create_vp(int node, u64 partition_id, u32 vp_index, u32 flags)
>>  			if (!hv_result_success(status)) {
>>  				pr_err("%s: vcpu %u, lp %u, %lld\n", __func__,
>>  				       vp_index, flags, status);
>> -				ret = hv_result(status);
>> +				ret = hv_result_to_errno(status);
>>  			}
>>  			break;
>>  		}
> 
> In hv_call_add_logical_proc() and hv_call_create_vp(), local variable "ret" is
> defined and initialized to HV_STATUS_SUCCESS.  Since "ret" now contains an
> errno value instead of a hypercall status, it should be initialized to zero.  (Yes,
> HV_STATUS_SUCCESS is defined as 0, but it's now the wrong abstraction.)
> 
Great point, I'll post a v3 to fix it.

> With that fixed,
> 
> Reviewed-by: Michael Kelley <mhklinux@outlook.com>
> 
>> diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
>> index 7adc10a4fa3e..3f115e2bcdaa 100644
>> --- a/include/asm-generic/mshyperv.h
>> +++ b/include/asm-generic/mshyperv.h
>> @@ -297,6 +297,7 @@ static inline int cpumask_to_vpset_skip(struct hv_vpset *vpset,
>>  	return __cpumask_to_vpset(vpset, cpus, func);
>>  }
>>
>> +int hv_result_to_errno(u64 status);
>>  void hyperv_report_panic(struct pt_regs *regs, long err, bool in_die);
>>  bool hv_is_hyperv_initialized(void);
>>  bool hv_is_hibernation_supported(void);
>> --
>> 2.34.1


