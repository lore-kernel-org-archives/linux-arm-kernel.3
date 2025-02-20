Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F63EC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 22:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FEsnSqX4vmc2Vw8nrvOl5pCsw/4QZ5ESc75P84YC+hE=; b=MpN/OgazD77WceRpumSGUeYD6/
	OCsGGAuzHb++/6Z3BAC0eYwd5MQ+8Lc580giVI76MbRPXyWXdQ4tIqmIPabinOEv/7e9TlYTcUZIN
	icgtv1TrCrjopVE0KuaPEwwvf5hALSYRcNtPt1ux+YCe40v6aYmwi7VAj+sS7VBb9c0z06rUrcb2T
	kIwKsxob3QZOeZX3elMqebCNyGkLWbrUiwi7G6ZiCPdX32seGOHw7jIv4GXfLWHQF8yOjzTe1VSol
	0vXCYYwOhKaOfBzj/mrwlIdkHjW7CtA8HLVs2KVvBj60cXF15k8WEv0rTruXbR/MJVYko4PNHjR59
	A3ntYhpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlEcF-000000034Cd-0YhL;
	Thu, 20 Feb 2025 22:01:55 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlEZn-000000033ZL-2Dm9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 21:59:24 +0000
Received: from [10.0.0.114] (c-67-182-156-199.hsd1.wa.comcast.net [67.182.156.199])
	by linux.microsoft.com (Postfix) with ESMTPSA id CDBD4203E3BD;
	Thu, 20 Feb 2025 13:59:17 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CDBD4203E3BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740088758;
	bh=FEsnSqX4vmc2Vw8nrvOl5pCsw/4QZ5ESc75P84YC+hE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ezAm1HEF4gHOeMlOP+6fjyF88pVNvPb+9hwXxCsEMZQF7E3Xw8Vs7i9jy8hMdF30Y
	 haKY/m7as+ywuX/onzx/6pTONyW1O2zzb7iD5uPu8EdntHmTzzhBCugHRKIcrDyhj7
	 YCct5mJmmRerGCWdus3URuo7aU+wFC+C3pn9H0eA=
Message-ID: <61b11926-3e85-4fd5-92a9-ca7c7e4b4c7c@linux.microsoft.com>
Date: Thu, 20 Feb 2025 13:59:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] hyperv: Convert hypercall statuses to linux error
 codes
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 iommu@lists.linux.dev, mhklinux@outlook.com, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 catalin.marinas@arm.com, will@kernel.org, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, daniel.lezcano@linaro.org, joro@8bytes.org,
 robin.murphy@arm.com, arnd@arndb.de, jinankjain@linux.microsoft.com,
 muminulrussell@gmail.com, skinsburskii@linux.microsoft.com,
 mukeshrathor@microsoft.com
References: <1740076396-15086-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740076396-15086-2-git-send-email-nunodasneves@linux.microsoft.com>
 <b4887ddf-a296-4f2b-8fb8-a5f9c681142a@linux.microsoft.com>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <b4887ddf-a296-4f2b-8fb8-a5f9c681142a@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_135923_583904_7981AFB0 
X-CRM114-Status: GOOD (  15.89  )
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

On 2/20/2025 10:49 AM, Easwar Hariharan wrote:
> On 2/20/2025 10:33 AM, Nuno Das Neves wrote:
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
> 
> Typo: Provide
> 
Yep, looks like there will be a v3, I'll fix it there.
Thanks for the review!

> Otherwise, looks good to me.
> 
> Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> 
> Thanks,
> Easwar (he/him)


