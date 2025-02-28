Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC566C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 00:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FG1ZBKIPXWfRyJjLzpGwfkd5Koln2BbLJ0dDMgqjeDg=; b=S5tXY3zDbRwOb0lTRZIKsR3lL6
	HTpeCBqbtmKQYTol/uZfUJOfqOMtf0jz+yX3f8RaUt2U7logp5fq9S1js50+HWXS9fy4yl/q1eVqM
	+epeJNIN2jHI9RBGnfaW3r778w2UG9fHeb9+5BWQI0jrAx855DgARhf38M9JWroKaw71ELFuppi26
	ambhtT4b5OAQmIcbE4WAjPK2hx8bFh6huEe5MKBM9w+9ihk5v52Bm4vS0497Jj4bEqRaM7bkl2HxW
	6UP6zUBfUHwY5KB1+ItJ8tlFOGtGlAmYGx6dEqGlhbGohdgYsXjexOk/63IVCtWAP/FiEtdLybQUg
	aL9PA/IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tno9V-00000009GFW-2uSj;
	Fri, 28 Feb 2025 00:22:53 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tno7w-00000009G05-2rL6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 00:21:17 +0000
Received: from [10.0.0.114] (c-67-182-156-199.hsd1.wa.comcast.net [67.182.156.199])
	by linux.microsoft.com (Postfix) with ESMTPSA id F0457210EAC1;
	Thu, 27 Feb 2025 16:21:14 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com F0457210EAC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740702075;
	bh=FG1ZBKIPXWfRyJjLzpGwfkd5Koln2BbLJ0dDMgqjeDg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A6CE6ACRJ6xPFiBrMIXA6tb3zCN+5558HuL1iwi46kRcOnedTubY9GUrM162KGITh
	 WKS4qN8VB6jPXzh4TMGLdT6z18yRAh7BIv0UZ+ToMBk0o5B01NPu7wFUnF21e/147E
	 7I1V64WZ33welLUDHzQUfOwYnSg6MuhkHn0H0zYY=
Message-ID: <2fee888a-4f81-40aa-9545-617a49a7fb30@linux.microsoft.com>
Date: Thu, 27 Feb 2025 16:21:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/10] arm64/hyperv: Add some missing functions to
 arm64
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-acpi@vger.kernel.org, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, mhklinux@outlook.com,
 decui@microsoft.com, catalin.marinas@arm.com, will@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, daniel.lezcano@linaro.org,
 joro@8bytes.org, robin.murphy@arm.com, arnd@arndb.de,
 jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
 skinsburskii@linux.microsoft.com, mrathor@linux.microsoft.com,
 ssengar@linux.microsoft.com, apais@linux.microsoft.com,
 Tianyu.Lan@microsoft.com, stanislav.kinsburskiy@gmail.com,
 gregkh@linuxfoundation.org, vkuznets@redhat.com, prapal@linux.microsoft.com,
 muislam@microsoft.com, anrayabh@linux.microsoft.com, rafael@kernel.org,
 lenb@kernel.org, corbet@lwn.net
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-4-git-send-email-nunodasneves@linux.microsoft.com>
 <5f3d660d-fe2e-4ac1-94a7-66d6c8ffe579@linux.microsoft.com>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <5f3d660d-fe2e-4ac1-94a7-66d6c8ffe579@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_162116_774837_B446ED4B 
X-CRM114-Status: GOOD (  19.57  )
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

On 2/26/2025 9:56 PM, Easwar Hariharan wrote:
> On 2/26/2025 3:07 PM, Nuno Das Neves wrote:
>> These non-nested msr and fast hypercall functions are present in x86,
>> but they must be available in both architetures for the root partition
> 
> nit: *architectures*
> 
> 
Thanks!

>> driver code.
>>
>> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
>> ---
>>  arch/arm64/hyperv/hv_core.c       | 17 +++++++++++++++++
>>  arch/arm64/include/asm/mshyperv.h | 12 ++++++++++++
>>  include/asm-generic/mshyperv.h    |  2 ++
>>  3 files changed, 31 insertions(+)
>>
>> diff --git a/arch/arm64/hyperv/hv_core.c b/arch/arm64/hyperv/hv_core.c
>> index 69004f619c57..e33a9e3c366a 100644
>> --- a/arch/arm64/hyperv/hv_core.c
>> +++ b/arch/arm64/hyperv/hv_core.c
>> @@ -53,6 +53,23 @@ u64 hv_do_fast_hypercall8(u16 code, u64 input)
>>  }
>>  EXPORT_SYMBOL_GPL(hv_do_fast_hypercall8);
>>  
>> +/*
>> + * hv_do_fast_hypercall16 -- Invoke the specified hypercall
>> + * with arguments in registers instead of physical memory.
>> + * Avoids the overhead of virt_to_phys for simple hypercalls.
>> + */
>> +u64 hv_do_fast_hypercall16(u16 code, u64 input1, u64 input2)
>> +{
>> +	struct arm_smccc_res	res;
>> +	u64			control;
>> +
>> +	control = (u64)code | HV_HYPERCALL_FAST_BIT;
>> +
>> +	arm_smccc_1_1_hvc(HV_FUNC_ID, control, input1, input2, &res);
>> +	return res.a0;
>> +}
>> +EXPORT_SYMBOL_GPL(hv_do_fast_hypercall16);
>> +
> 
> I'd like this to have been in arch/arm64/include/asm/mshyperv.h like its x86
> counterpart, but that's just my personal liking of symmetry. I see why it's here
> with its slow and 8-byte brethren.
> 
Good point, I don't see a good reason this can't be in the header.

>>  /*
>>   * Set a single VP register to a 64-bit value.
>>   */
>> diff --git a/arch/arm64/include/asm/mshyperv.h b/arch/arm64/include/asm/mshyperv.h
>> index 2e2f83bafcfb..2a900ba00622 100644
>> --- a/arch/arm64/include/asm/mshyperv.h
>> +++ b/arch/arm64/include/asm/mshyperv.h
>> @@ -40,6 +40,18 @@ static inline u64 hv_get_msr(unsigned int reg)
>>  	return hv_get_vpreg(reg);
>>  }
>>  
>> +/*
>> + * Nested is not supported on arm64
>> + */
>> +static inline void hv_set_non_nested_msr(unsigned int reg, u64 value)
>> +{
>> +	hv_set_msr(reg, value);
>> +}
> 
> empty line preferred here, also reported by checkpatch
> 
Good point, missed that one...

>> +static inline u64 hv_get_non_nested_msr(unsigned int reg)
>> +{
>> +	return hv_get_msr(reg);
>> +}
>> +
>>  /* SMCCC hypercall parameters */
>>  #define HV_SMCCC_FUNC_NUMBER	1
>>  #define HV_FUNC_ID	ARM_SMCCC_CALL_VAL(			\
>> diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
>> index c020d5d0ec2a..258034dfd829 100644
>> --- a/include/asm-generic/mshyperv.h
>> +++ b/include/asm-generic/mshyperv.h
>> @@ -72,6 +72,8 @@ extern void * __percpu *hyperv_pcpu_output_arg;
>>  
>>  extern u64 hv_do_hypercall(u64 control, void *inputaddr, void *outputaddr);
>>  extern u64 hv_do_fast_hypercall8(u16 control, u64 input8);
>> +extern u64 hv_do_fast_hypercall16(u16 control, u64 input1, u64 input2);
>> +
> 
> checkpatch warns against putting externs in header files, and FWIW, if hv_do_fast_hypercall16()
> for arm64 were in arch/arm64/include/asm/mshyperv.h like its x86 counterpart, you probably
> wouldn't need this?
> 
Yes I wondered about that warning. That's true, if I just put it in the arm64 header
then this won't be needed at all, so I might just do that!

>>  bool hv_isolation_type_snp(void);
>>  bool hv_isolation_type_tdx(void);
>>  


