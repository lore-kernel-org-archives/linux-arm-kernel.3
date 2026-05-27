Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD87CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 16:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ewO88t8oiKnkHzpp93w0DVjCHmd01DJLUhrpWit9A9E=; b=pXdAxbROBlWmDRrNDuJhCiFCnV
	O+7QTxtAYQbCwJROD3OUZSx3fwXoVXSLcmorultBUuOlR/elx8PZMQB2Oj9FI+CbLMT9hCk1FO4Il
	FrCnv4XrNzir1KO+Q4qRg7R124IZ0c2xUvQWbH0jvtJZv025qKTvto2p6dYVkQPIXYF9gyteAveb6
	eCUYGWKBVIA7WSL8BTkVyQhRGtLkygoxR84IBVo5of635MbE5PNmTr6oRE4GdKXph2CBeb94swhUX
	rotzuynNTMBy1sxCuwxaD0xjUWOmJeCrQ0UTU02UqHIMt0QeTSJT00ui9aEyc8P/bpUaB1O5sfs2u
	DQpRRcYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGtK-00000004TxZ-03kC;
	Wed, 27 May 2026 16:13:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGtB-00000004Tvh-0Oz5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 16:13:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91F6335BF;
	Wed, 27 May 2026 09:13:43 -0700 (PDT)
Received: from [10.1.38.169] (e121487-lin.cambridge.arm.com [10.1.38.169])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 816A93F905;
	Wed, 27 May 2026 09:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779898428; bh=gUye9Grka3ECEK41ZIpIsjGn/j1fZ7FW/nQvY+4jS+0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qrn1fhCIhiS+r0p3Rq7KFOQiLwbSmb11xIlWxhOL4iedcV8fbohZD/08yRLAJ87em
	 mFvqQedFp5S2LhFzaHIwu9ZRz6SS1tYI5yTf3uIP0/OICrl8nZLratQo91TJrM383N
	 ZYlBeLiOrvlKKHx6xkjAxigyu6/aYj5B96BH1/Tg=
Message-ID: <9b7bf255-bf37-4372-9908-d595e20648e9@arm.com>
Date: Wed, 27 May 2026 17:13:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/18] arm64: fpsimd: Move fpsimd save/restore inline
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 broonie@kernel.org, catalin.marinas@arm.com, james.morse@arm.com,
 maz@kernel.org, oupton@kernel.org, tabba@google.com, will@kernel.org
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-13-mark.rutland@arm.com>
 <c5ba3af9-08b2-4be2-b9f5-58a925f0b050@arm.com>
 <ahcPITrHKBgAHGkP@J2N7QTR9R3.cambridge.arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <ahcPITrHKBgAHGkP@J2N7QTR9R3.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_091349_221231_87369E51 
X-CRM114-Status: GOOD (  21.01  )
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

On 5/27/26 16:34, Mark Rutland wrote:
> On Wed, May 27, 2026 at 03:49:18PM +0100, Vladimir Murzin wrote:
>> On 5/21/26 14:25, Mark Rutland wrote:
>>> +static inline void fpsimd_save_vregs(struct user_fpsimd_state *state)
>>> +{
>>> +	instrument_write(state->vregs, sizeof(state->vregs));
>>> +	asm volatile(
>>> +	__FPSIMD_PREAMBLE
>>> +	"	stp	q0,  q1,  [%[vregs], #16 * 0]\n"
>>> +	"	stp	q2,  q3,  [%[vregs], #16 * 2]\n"
>>> +	"	stp	q4,  q5,  [%[vregs], #16 * 4]\n"
>>> +	"	stp	q6,  q7,  [%[vregs], #16 * 6]\n"
>>> +	"	stp	q8,  q9,  [%[vregs], #16 * 8]\n"
>>> +	"	stp	q10, q11, [%[vregs], #16 * 10]\n"
>>> +	"	stp	q12, q13, [%[vregs], #16 * 12]\n"
>>> +	"	stp	q14, q15, [%[vregs], #16 * 14]\n"
>>> +	"	stp	q16, q17, [%[vregs], #16 * 16]\n"
>>> +	"	stp	q18, q19, [%[vregs], #16 * 18]\n"
>>> +	"	stp	q20, q21, [%[vregs], #16 * 20]\n"
>>> +	"	stp	q22, q23, [%[vregs], #16 * 22]\n"
>>> +	"	stp	q24, q25, [%[vregs], #16 * 24]\n"
>>> +	"	stp	q26, q27, [%[vregs], #16 * 26]\n"
>>> +	"	stp	q28, q29, [%[vregs], #16 * 28]\n"
>>> +	"	stp	q30, q31, [%[vregs], #16 * 30]\n"
>>> +	: "=Q" (state->vregs)
>>> +	: [vregs] "r" (state->vregs)
>> Missing "memory" clobber here?
> Here the "=Q" constraint is sufficient.
> 
> The "=Q" output constraint describes that the operand is written to but
> the old value is not read. It behaves like an "=m" constraint, but
> places the base address in a single register without any offset (and no
> writeback addressing mode). Here it applies to the entirety of the
> vregs array.
> 
> See https://gcc.gnu.org/onlinedocs/gcc/Machine-Constraints.html :
> 
> |  Q
> |     A memory address which uses a single base register with no offset
> 
> We generally prefer to use "Q" constraints rather than memory clobbers
> where possible, since it gives the compiler more freedom (e.g. due to
> *not* clobbering unrelated memory locations). 
> 
> The "Q" constraint causes the output to be formatted as a memory address
> (e.g. "[x0]"), so to be able to apply an offset we need a separate "r"
> constraint to get the base register. It doesn't matter whether the
> compiler happens to use a different register for that (and in practice
> compilers realise they can use the register allocated for the "Q"
> conrstraint).
> 
> Unfortunately we can't use "Q" for the scalable registers, since the
> size isn't known at compile time, and the simplest option for those is
> to use a memory clobber.
> 

That's quite interesting bit of information, thanks for explanation!

> [...]
> 
>>> +static inline void fpsimd_load_vregs(const struct user_fpsimd_state *state)
>>> +{
>>> +	instrument_read(state->vregs, sizeof(state->vregs));
>>> +	asm volatile(
>>> +	__FPSIMD_PREAMBLE
>>> +	"	ldp	q0,  q1,  [%[vregs], #16 * 0]\n"
>>> +	"	ldp	q2,  q3,  [%[vregs], #16 * 2]\n"
>>> +	"	ldp	q4,  q5,  [%[vregs], #16 * 4]\n"
>>> +	"	ldp	q6,  q7,  [%[vregs], #16 * 6]\n"
>>> +	"	ldp	q8,  q9,  [%[vregs], #16 * 8]\n"
>>> +	"	ldp	q10, q11, [%[vregs], #16 * 10]\n"
>>> +	"	ldp	q12, q13, [%[vregs], #16 * 12]\n"
>>> +	"	ldp	q14, q15, [%[vregs], #16 * 14]\n"
>>> +	"	ldp	q16, q17, [%[vregs], #16 * 16]\n"
>>> +	"	ldp	q18, q19, [%[vregs], #16 * 18]\n"
>>> +	"	ldp	q20, q21, [%[vregs], #16 * 20]\n"
>>> +	"	ldp	q22, q23, [%[vregs], #16 * 22]\n"
>>> +	"	ldp	q24, q25, [%[vregs], #16 * 24]\n"
>>> +	"	ldp	q26, q27, [%[vregs], #16 * 26]\n"
>>> +	"	ldp	q28, q29, [%[vregs], #16 * 28]\n"
>>> +	"	ldp	q30, q31, [%[vregs], #16 * 30]\n"
>>> +	:
>>> +	: "Q" (state->vregs),
>>> +	  [vregs] "r" (state->vregs)
>> Missing "memory" clobber here?
> Same story as for fpsimd_save_vregs() above, except that here the "Q"
> input constraint describes that the entirety of the operand is read from
> but not written to.
> 

I'd be surprised if it was different :)

Cheers
Vladimir


> Mark.
> 


