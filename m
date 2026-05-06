Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAA3CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 05:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g826hBG5sdvtVoUdo7WR5/F7nLFfVhBDlSe4q/ANC2k=; b=SE5WNatlOOX/CU4/YZJisIiOxi
	/Bdu3+Gfytym/RwanJWAHWS5kMPB2Jeh5sdmmRZaPb5uEM83wxo040lfoHWbPnvXfkbqjbH66znQV
	JsrM24Nr5CxLvp4Df2aVv8BAL9TQTKC5InsgpAug5hN9GvxX1f177Pu8w2fSXS6PqHYg+0H0yZJPm
	DnDBms6aJMdvCH7zBYtB/PT8SvbKl1vfqgGTvJnlm5AYoEX56QKb3u429qWvcLJ+r7NifIX0FDLvL
	wA8XWqO2frc+2lGV9horsac6d6swvgjBipMBnxNh1jMhLWEnNA3ES1G5Vl9n/g7V+zdzcZew65YFs
	erGotfHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKUXZ-00000000lAi-16LI;
	Wed, 06 May 2026 05:11:21 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKUXW-00000000l9U-05D6;
	Wed, 06 May 2026 05:11:20 +0000
Received: from [10.95.65.64] (unknown [167.220.238.64])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6F18920B7168;
	Tue,  5 May 2026 22:11:05 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6F18920B7168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1778044272;
	bh=g826hBG5sdvtVoUdo7WR5/F7nLFfVhBDlSe4q/ANC2k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U3sNDtsK/up9rwRUYjKE71paEXx7G/JFAVmIVF6V2Nv4CAPsofHIjZwC6aP/EYO0s
	 UAYeJhR8zLMUktpca2eDmFAvxr/MMokVL5s4fG8oEfRRsB/j2DV01NlxYriEMaMmvN
	 np2+tbmhsnd8n3DXx9Tl2L4uHKUiU4vBu3yQbhNs=
Message-ID: <beb61bb4-ab7c-4939-a1e6-525d0f5ea119@linux.microsoft.com>
Date: Wed, 6 May 2026 10:41:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/15] arm64: hyperv: Add support for
 mshv_vtl_return_call
To: Michael Kelley <mhklinux@outlook.com>
Cc: Marc Zyngier <maz@kernel.org>, Timothy Hayes <timothy.hayes@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sascha Bischoff <sascha.bischoff@arm.com>,
 mrigendrachaubey <mrigendra.chaubey@gmail.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "vdso@mailbox.org" <vdso@mailbox.org>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
 "K . Y . Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
References: <20260423124206.2410879-1-namjain@linux.microsoft.com>
 <20260423124206.2410879-8-namjain@linux.microsoft.com>
 <SN6PR02MB4157C147A1B915F9B45D3B74D4362@SN6PR02MB4157.namprd02.prod.outlook.com>
 <516a4e65-3a4d-4e09-b445-28cb740b5653@linux.microsoft.com>
 <SN6PR02MB4157B99838CE7498933B2382D4312@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Naman Jain <namjain@linux.microsoft.com>
In-Reply-To: <SN6PR02MB4157B99838CE7498933B2382D4312@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_221118_127291_B2CEBA78 
X-CRM114-Status: GOOD (  19.37  )
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



On 5/4/2026 9:36 PM, Michael Kelley wrote:
> From: Naman Jain <namjain@linux.microsoft.com> Sent: Wednesday, April 29, 2026 2:57 AM
>>
>> On 4/27/2026 11:08 AM, Michael Kelley wrote:
>>> From: Naman Jain <namjain@linux.microsoft.com> Sent: Thursday, April 23, 2026 5:42 AM
>>>>
> 
> [snip]
> 
>>>> diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
>>>> index 08278547b84c..b4d80c9a673a 100644
>>>> --- a/arch/x86/include/asm/mshyperv.h
>>>> +++ b/arch/x86/include/asm/mshyperv.h
>>>> @@ -286,7 +286,6 @@ struct mshv_vtl_cpu_context {
>>>>    #ifdef CONFIG_HYPERV_VTL_MODE
>>>>    void __init hv_vtl_init_platform(void);
>>>>    int __init hv_vtl_early_init(void);
>>>> -void mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0);
>>>>    void mshv_vtl_return_call_init(u64 vtl_return_offset);
>>>>    void mshv_vtl_return_hypercall(void);
>>>>    void __mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0);
>>>> @@ -294,7 +293,6 @@ int hv_vtl_get_set_reg(struct hv_register_assoc *regs, bool set, bool shared);
>>>>    #else
>>>>    static inline void __init hv_vtl_init_platform(void) {}
>>>>    static inline int __init hv_vtl_early_init(void) { return 0; }
>>>> -static inline void mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0) {}
>>>>    static inline void mshv_vtl_return_call_init(u64 vtl_return_offset) {}
>>>>    static inline void mshv_vtl_return_hypercall(void) {}
>>>>    static inline void __mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0) {}
>>>> diff --git a/drivers/hv/mshv_vtl.h b/drivers/hv/mshv_vtl.h
>>>> index a6eea52f7aa2..103f07371f3f 100644
>>>> --- a/drivers/hv/mshv_vtl.h
>>>> +++ b/drivers/hv/mshv_vtl.h
>>>> @@ -22,4 +22,7 @@ struct mshv_vtl_run {
>>>>    	char vtl_ret_actions[MSHV_MAX_RUN_MSG_SIZE];
>>>>    };
>>>>
>>>> +static_assert(sizeof(struct mshv_vtl_cpu_context) <= 1024,
>>>> +	      "struct mshv_vtl_cpu_context exceeds reserved space in struct mshv_vtl_run");
>>>> +
>>>>    #endif /* _MSHV_VTL_H */
>>>> diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
>>>> index db183c8cfb95..8cdf2a9fbdfb 100644
>>>> --- a/include/asm-generic/mshyperv.h
>>>> +++ b/include/asm-generic/mshyperv.h
>>>> @@ -396,8 +396,10 @@ static inline int hv_deposit_memory(u64 partition_id, u64 status)
>>>>
>>>>    #if IS_ENABLED(CONFIG_HYPERV_VTL_MODE)
>>>>    u8 __init get_vtl(void);
>>>> +void mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0);
>>>>    #else
>>>>    static inline u8 get_vtl(void) { return 0; }
>>>> +static inline void mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0) {}
>>>
>>> Is this stub needed? Maybe I missed something, but it looks to me like none
>>> of the code that calls this gets built unless CONFIG_HYPERV_VTL_MODE is set.
>>> See further comments about stubs in Patch 8 of this series.
>>>
>>
>> Config dependencies would handle such cases, and this is not required. I
>> saw similar stubs added in the code, so I thought this is a norm that
>> should be followed, and not rely on config dependencies.
>> I can remove it.
>>
> 
> Others might disagree with me, but I don't think it's the norm to add
> stubs when they aren't truly needed. As you can see from some of my
> other comments, I look for ways to eliminate stubs. Stubs are indicative
> of a boundary between separately built components, and I generally
> try to minimize the surface area of such boundaries. A large surface area
> often means that the overall design could be improved by re-thinking
> which code goes with which component.
> 
> Michael

I agree. I'll remove these in next version.

Thanks,
Naman

