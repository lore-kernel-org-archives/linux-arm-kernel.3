Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AEBCD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 15:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NGzu6LymuNVeut4lTFZeELIEE1FsgN9m+ctwi3M1cpI=; b=zG/pz28kXK2KASq9/N/cYsGorV
	j5DbIAbTgVWcCH4qOL8I40i/rwbYwYm/Qg17wL9XZVpsCeT/xXOL3kZSMociIjcVQPHXmLLx+Wmur
	g/ihjYsBscZ2vwiYpiPBaH6O1MMgwDnM1tj/y4Q7WTByDFiGjosBLw47XAKxao4uQag77c87aqr7Q
	Wvb74HqJ0RnlHwzduYX5k9tW0qsJBzaZmFgfikNTcdUgkwmaPiN6kFnqpbwJJzrMkXhPj72ZOv+1I
	NrNmInqC617P9eq0D9pR/MONmVm/pbBbp+bpFfuFgIEQ3RRsL0dz6aVhCPZVrzzYHYQ5pEFM1BRIL
	s8/Jsarg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wScPF-00000005uGK-1vB8;
	Thu, 28 May 2026 15:12:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wScPC-00000005uFc-3F5Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 15:12:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3DB822EE;
	Thu, 28 May 2026 08:12:11 -0700 (PDT)
Received: from [10.1.28.164] (unknown [10.1.28.164])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C0353F632;
	Thu, 28 May 2026 08:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779981136; bh=8NF5sOfbYqdJ+Oi40pkak1BHMRDOWEn0PDRBCK7Y+3k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VoADWMMgkS3/wOGyrN0GnZr6E1eKpgfDw2zrAb2OVDTfqw0VFyXsxwikDRyFwAS+q
	 tb1PPUuOPsScHjfpRQ1oABnQ0FJxfbOpEHkpkQcEVnC4jwXs7m9yRYkaEg6P9cZhAU
	 WH4N+L9yufWTN0WxbgkVLVIEJL9CXiQWjnnEClrA=
Message-ID: <518b2b2f-53c0-4082-b764-54c0e3bc2b92@arm.com>
Date: Thu, 28 May 2026 16:12:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/18] KVM: arm64: pkvm: Remove struct cpu_sve_state
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 broonie@kernel.org, catalin.marinas@arm.com, james.morse@arm.com,
 maz@kernel.org, oupton@kernel.org, tabba@google.com, will@kernel.org
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-5-mark.rutland@arm.com>
 <9670cf97-b844-4029-b77e-25ade600e024@arm.com>
 <ahcVsVGPtOmF0nIC@J2N7QTR9R3.cambridge.arm.com>
 <4e15c17e-06c0-414f-ae9d-210c70d1757f@arm.com>
 <ahhapwyfE7WrBCby@J2N7QTR9R3.cambridge.arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <ahhapwyfE7WrBCby@J2N7QTR9R3.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_081218_892032_B5C990C8 
X-CRM114-Status: GOOD (  14.62  )
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

On 5/28/26 16:09, Mark Rutland wrote:
> On Wed, May 27, 2026 at 05:11:26PM +0100, Vladimir Murzin wrote:
>> On 5/27/26 17:02, Mark Rutland wrote:
>>> On Wed, May 27, 2026 at 12:58:47PM +0100, Vladimir Murzin wrote:
>>>> On 5/21/26 14:25, Mark Rutland wrote:
>>>>> -struct cpu_sve_state {
>>>>> -	__u64 zcr_el1;
>>>>> -
>>>>> -	/*
>>>>> -	 * Ordering is important since __sve_save_state/__sve_restore_state
>>>>> -	 * relies on it.
>>>>> -	 */
>>>>> -	__u32 fpsr;
>>>>> -	__u32 fpcr;
>>>>> -
>>>>> -	/* Must be SVE_VQ_BYTES (128 bit) aligned. */
>>>>> -	__u8 sve_regs[];
>>>> It seems that the requirement (driven by SVE ldr/str) is
>>>> satisfied with the new sve_regs pointing to the start of the
>>>> page.
>>>>
>>>> I'm not sure whether we want to keep the comment (or perhaps
>>>> enforce this with explicit checks) so that future refactoring
>>>> doesn't lead to time spent debugging alignment faults...
>>> AFAICT alignment has never been functionally necessary. The LDR (vector)
>>> and STR (vector) instructions only mandate alignment when the relevant
>>> SCTLR_ELx has SCTLR_ELx.A==1. For kernel and hyp code we configure
>>> SCTLR_ELx.A==0, so there's no alignment requirement.
>>>
>>> Per ARM DDI 0487 M.b, section C8.2.437 "LDR (vector)":
>>>
>>>   The load is performed as contiguous byte accesses, with no endian
>>>   conversion and no guarantee of single-copy atomicity larger than a
>>>   byte. However, *if alignment is checked*, then the base register must be
>>>   aligned to 16 bytes.
>>>
>>> Per ARM DDI 0487 M.b, section C8.2.777 "STR (vector)":
>>>
>>>   The store is performed as contiguous byte accesses, with no endian
>>>   conversion and no guarantee of single-copy atomicity larger than a
>>>   byte. However, *if alignment is checked*, then the base register must be
>>>   aligned to 16 bytes.
>>>
>>> ... and in both cases the pseudocode shows that AlignmentEnforced()
>>> depends on the value of SCTLR_ELx.A.
>>>
>>> Given that, I don't think we need the comment.
>>>
>> Thanks for explanation! Maybe worth mentioning in commit message that it never was
>> a requirement? 
> I've added the following to the commi message:
> 
>   I've dropped the comment regarding buffer alignment as AFAICT this was
>   never necessary. The LDR/STR (vector) instructions only require this
>   alignment when SCTLR_ELx.A==1, which is not the case for the kernel or
>   hyp code. Nothing else depends on the alignment.
> 

Brilliant!

Thanks
Vladimir

> Mark.
> 


