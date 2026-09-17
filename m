Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABADC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 01:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kK8U6zcu30eUa/1IbzABeDAbejpvCtmmWV8KgWoo5Rk=; b=JeqK/GHoDmuSKmr/HQwTSbJRgv
	DY20jld50+9jqIqzTGWQUZRb0nSbbEwNWdCexEF/4re9RrQwXZhOMWAeIYmALxp/ay211F2fLtsWa
	O7drP18qI+sPAuD1UTSnkQqEkTvwN3KOqjswpsie5WfKvRoBS2E2HbmkOi2lj3cNPEZ+xjye2TD9i
	ftJW5dlJy/uaN591eWH8+/uxO9EGEEq2CsWKgtjPI709uQTiQdw+YCwYLZWJxcOFBK/tmkWjkUF80
	DrovecGEaGAusV87yLDFwtfnnjuMiRO19fEjlQU8uQcu9ONTd0AvslC5kQJESeP5rfs0faHqjzA0K
	79Aoo1ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x70aM-0000000AO0u-1ClS;
	Thu, 17 Sep 2026 01:06:46 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x70aJ-0000000AO0M-2iEh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 01:06:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=kK8U6zcu30eUa/1IbzABeDAbejpvCtmmWV8KgWoo5Rk=; b=cwNGCf8MIXZ2L60DbxLuFPmX7W
	JiVby/b8Yhn2u12nHkMVRivHAqQoSblV+6t3Rf1Tbiz+lpm3A5JwL6m3tE/GoblOR2pWa8SVAgViZ
	GBIwyfXZUBTj13/6roIKj6qIeidn0mieCAO0ayuwdbAROtmT365vBWyffznNMnOvvVhRbekBLwvim
	nrEy1RYAuoaLf9wB3uNg6BNvI+WWBhXtElbEpXaohqhVcbCDf9zxrSOE0gv0YB2YPAItpWx4rakhA
	v9dnjJRyUubB0DJvfnXrD5c1xcXbbQvKPYDvzOfNOJHm6uIMFLLvbsQIH6ARYBL/RJEd4jMPapItY
	P/SdQEng==;
Received: from [177.172.123.214] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1x70a2-003Bpv-Nq; Thu, 17 Sep 2026 03:06:26 +0200
Message-ID: <9d9a804f-c1f3-4c0c-b12a-975206f6c34c@igalia.com>
Date: Wed, 16 Sep 2026 22:06:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/4] arm64: vdso: Implement
 __vdso_futex_robust_try_unlock()
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>, Florian Weimer <fweimer@redhat.com>,
 Darren Hart <dvhart@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Arnd Bergmann <arnd@arndb.de>,
 Uros Bizjak <ubizjak@gmail.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 kernel-dev@igalia.com
References: <20260821-tonyk-robust_arm-v8-0-077707b6f1c7@igalia.com>
 <20260821-tonyk-robust_arm-v8-2-077707b6f1c7@igalia.com>
 <aqqkX8GyxgdtoOmc@J2N7QTR9R3>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <aqqkX8GyxgdtoOmc@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_180643_690544_0495A5AD 
X-CRM114-Status: GOOD (  28.86  )
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

Em 16/09/2026 11:27, Mark Rutland escreveu:
> Hi André,
> 
> I have a few comments below. I'm not sure what the plan is for 32-bit
> robust lists, and I think there are a few problems with the assembly.
> 
> On Fri, Aug 21, 2026 at 06:50:43PM -0300, André Almeida wrote:

[...]

> 
>> +	register __u64 *pop_reg asm("x2") = pop;
>> +	register __u32 result_reg asm("w3") = 0;
>> +	__u32 val;
>> +
>> +	asm volatile (
>> +		".globl						  "
>> +		"__futex_list64_try_unlock_cs_start,		  "
>> +		"__futex_list64_try_unlock_cs_success,		  "
>> +		"__futex_list64_try_unlock_cs_end		\n"
> 
> Sorry, when I mentioned putting these within the assembly, I meant doing
> something like:
> 
> | #define LABEL(l)						\
> | 	"	.globl " #l "\n"				\
> | 	#l ":\n"
> 
> ... and within the asssembly, having:
> 
> | 	"	insn1					\n"
> | 	"	insn2					\n"
> | 	LABEL(__futex_list64_try_unlock_cs_start)
> | 	"	insn2					\n"
> | 	LABEL(__futex_list64_try_unlock_cs_start)
> | 	"	insn4					\n"
> | 	LABEL(__futex_list64_try_unlock_cs_success)
> | 	"	insn5					\n"
> 
> That way we use the full strings, which are easy to grep for, and we
> only have to define each label string once.

Oh, I see, thanks! I will change that for the next version.

> 
>> +
>> +		"	prfm pstl1strm, %[lock]			\n"
>> +		"retry:						\n"
>> +		"	ldxr %w[val], %[lock]			\n"
>> +		"	cmp %w[tid], %w[val]			\n"
>> +		"	bne __futex_list64_try_unlock_cs_end	\n"
> 
> The 'bne' here should be 'b.ne'. IIUC assemblers accept the former by
> historical accident, and 'b.<cond>' is the architecturally defined
> mnemonic.
> 
> As general thing, we format assembly with a tab between the instruction
> and first operand, so the above should be:
> 
> | 	"	prfm	pstl1strm, %[lock]			\n"
> | 	"retry:							\n"
> | 	"	ldxr	%w[val], %[lock]			\n"
> | 	"	cmp	%w[tid], %w[val]			\n"
> | 	"	b.ne	__futex_list64_try_unlock_cs_end	\n"
> 
>> +		"	stlxr %w[result], wzr, %[lock]		\n"
>> +		"__futex_list64_try_unlock_cs_start:		\n"
>> +		"	cbnz %w[result], retry			\n"
>> +		"__futex_list64_try_unlock_cs_success:		\n"
>> +		"	str xzr, %[pop_reg]			\n"
>> +		"__futex_list64_try_unlock_cs_end:		\n"
>> +
>> +		: [val] "=&r" (val), [result] "=&r" (result_reg), [pop_reg] "+Q" (*pop_reg)
>> +		: [tid] "r" (tid), [lock] "Q" (*lock)
>> +		: "cc", "memory"
>> +	);
> 
> As a general note, for assembly constaints, please put each constraint
> on its own line, e.g.
> 
> 	: [val] "=&r" (val),
> 	  [result] "=&r" (result_reg),
> 	  [pop_reg] "+Q" (*pop_reg)
> 	: [tid] "r" (tid),
> 	  [lock] "Q" (*lock)
> 	: "cc", "memory"
> 
> That formatting makes it much easier to read each constraint
> individually, and it makes it easier to review changes to individual
> constaints.
> 
> Generally, for asm we have a preferred style:
> 
> 	asm volatile(
> 	"	// string starts aligned with 'asm'	\n"
> 	"	// with 1 tab indend within that.	\n"
> 	"						\n"
> 	"	insn	operand1, operand2		\n"
> 	"label:						\n"
> 	"	insn	operand1, operand2		\n"
> 	: [output1] "=r" (...),
> 	  [output2] "=r" (...)
> 	: [input1] "r" (...).
> 	  [input2] "r" (...)
> 	: "clobbers"
> 	);
> 
> I see a couple of problems with the constraints as-is.
> 
> Firstly, the constraints for [pop_reg] doesn't guarantee that x2 is
> used. The "+Q" constraint takes a memory operand (in this case the
> location pointed to by 'pop_reg', and limits the addressing mode to a
> single base register with no offset. The operand is the memroy location,
> not the register holding the memory location, so this constraint won't
> necessarily use x2. Unless 'pop_reg' itself is passed into a register
> constraint, the compiler might not ensure that 'x2' is populated.
> 
> For example:
> 
> | [mark@gravadlaks:~/tests/asm-operands-q-reg]% cat test.c
> | unsigned long foo(unsigned long *ptr)
> | {
> |         register unsigned long *ptr_reg asm("x2") = ptr;
> |         unsigned long val;
> |
> |         asm volatile(
> |         "       ldr     %[val], %[qptr]\n"
> |         : [val] "=&r" (val)
> |         : [qptr] "Q" (*ptr_reg)
> |         );
> |
> |         return val;
> | }
> | [mark@gravadlaks:~/tests/asm-operands-q-reg]% usekorg 16.2.0 aarch64-linux-gcc -c test.c -O2
> | [mark@gravadlaks:~/tests/asm-operands-q-reg]% usekorg 16.2.0 aarch64-linux-objdump -d test.o
> |
> | test.o:     file format elf64-littleaarch64
> |
> |
> | Disassembly of section .text:
> |
> | 0000000000000000 <foo>:
> |    0:   f9400001        ldr     x1, [x0]
> |    4:   aa0103e0        mov     x0, x1
> |    8:   d65f03c0        ret
> 
> We will need an "r" input constraint for 'pop_reg' to ensure that x2 is
> allocated. Either in addition to an "=Q" output constraint for the
> actual memory write, or we rely on the memory clobber to hazaard against
> other memory accesses.
> 
> Secondly, the "Q" input constaint for 'lock' looks inaccurate, given
> that we both read and write to 'lock'. Either that should be a "+Q"
> output constraint, or we rely on the memory clobber to hazard against
> other memory accesses.
> 

Thank you very much Mark, that is a lot of good information about 
writing arm64 asm!

If I understood correctly, the correct approach here would be to use 
pop_reg as an input operand, making sure that we store the address hold 
by *pop on x2 register right? So something along the lines:

__u32 __vdso_futex_robust_list64_try_unlock(__u32 *lock, __u32 tid, 
__u64 *pop)
{
	register __u64 pop_reg asm("x2") = (__u64) pop;

...

		"	str 	xzr, [%x[pop_reg]]		\n"
...

		: [val] "=&r" (val),
		  [result] "=&r" (result_reg),
		  [lock] "+Q" (*lock)
		: [tid] "r" (tid),
		  [pop_reg] "r" (pop_reg)
		: "cc", "memory"

Does that looks right?

Thanks again for the help


> Mark.
> 
>> +
>> +	return val;
>> +}
>>
>> -- 
>> 2.55.0
>>


