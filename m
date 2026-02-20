Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2232C5AC9F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 15:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rr/zI4j/LxpMfSmhNq9RSHA4JWY8TSeiEY4AKzPzxV8=; b=E2ydI5v6vHQT3G2yuRfPfwR79s
	2lzdSCd2j6gmK7voWp2MBaW/eUDaNza81mDHcQdzF8Xd1q2BCpOq5Utsw/wMctQlg3ryaQuuciRRo
	xsYBsc7cgTr73lPT12KWcBQ+aWPZtxTScmUPq1q1XJDo1PsuwEmB1589oEdQNzlGQlphOjYnkb5n6
	knAZMR5/Lih9NE4nChBnVbJwP7mMrQZ91bvQT00OjLEJL6RDwkbjm3Erd5XPcibi/W1M0ZJmSzI4M
	FLEXNA74aC6I6H3NjrvaZOEohIzahQDB29czR+Xrm6vA/nHWub8TiMcAMquAVY21HG+Yeq6opJHhS
	FC3yGNTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtSq3-0000000F7MG-0rTU;
	Fri, 20 Feb 2026 15:54:43 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtSpz-0000000F7KI-0zAx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 15:54:41 +0000
Message-ID: <c6c2ffcf-acdf-4bda-ad82-dc4cc1a9260e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771602875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rr/zI4j/LxpMfSmhNq9RSHA4JWY8TSeiEY4AKzPzxV8=;
	b=cvWtOHadlIWEz8qFJdCVgzwmKFkahat2gkR/cnqjQJrvCvoXflU8MofpH8wVajEruKSh2w
	+Bb4Q3/BC2OcXnPR0BXMZqq8faW4/4BvQBVCoSjhkHsUdCZpDC6K4H0/beaNrdx/wc5d54
	4s5GVkjeLVoLrbhqeie+1H1zN7yLF04=
Date: Fri, 20 Feb 2026 23:54:16 +0800
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v2 2/6] bpf, x86: Add 64-bit bitops kfuncs
 support for x86_64
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Cc: bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>,
 Xu Kuohai <xukuohai@huaweicloud.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 X86 ML <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Shuah Khan <shuah@kernel.org>, Peilin Ye <yepeilin@google.com>,
 Luis Gerhorst <luis.gerhorst@fau.de>, Viktor Malik <vmalik@redhat.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 kernel-patches-bot@fb.com
References: <20260219142933.13904-1-leon.hwang@linux.dev>
 <20260219142933.13904-3-leon.hwang@linux.dev>
 <CAADnVQLNmQGKf5S5ZNwHYzScYBhnWFmnzLg=5Xxy4SgYKE3EfQ@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <CAADnVQLNmQGKf5S5ZNwHYzScYBhnWFmnzLg=5Xxy4SgYKE3EfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_075439_734298_398CC986 
X-CRM114-Status: GOOD (  22.89  )
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



On 2026/2/20 01:47, Alexei Starovoitov wrote:
> On Thu, Feb 19, 2026 at 6:30 AM Leon Hwang <leon.hwang@linux.dev> wrote:
>>
>> Implement JIT inlining of the 64-bit bitops kfuncs on x86_64.
>>
>> bpf_rol64() and bpf_ror64() are always supported via ROL/ROR.
>>
>> bpf_ctz64() and bpf_ffs64() are supported when the CPU has
>> X86_FEATURE_BMI1 (TZCNT).
>>
>> bpf_clz64() and bpf_fls64() are supported when the CPU has
>> X86_FEATURE_ABM (LZCNT).
>>
>> bpf_popcnt64() is supported when the CPU has X86_FEATURE_POPCNT.
>>
>> bpf_bitrev64() is not inlined as x86_64 has no native bit-reverse
>> instruction, so it falls back to a regular function call.
>>
>> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
>> ---
>>  arch/x86/net/bpf_jit_comp.c | 141 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 141 insertions(+)
>>
>> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
>> index 070ba80e39d7..193e1e2d7aa8 100644
>> --- a/arch/x86/net/bpf_jit_comp.c
>> +++ b/arch/x86/net/bpf_jit_comp.c
>> @@ -19,6 +19,7 @@
>>  #include <asm/text-patching.h>
>>  #include <asm/unwind.h>
>>  #include <asm/cfi.h>
>> +#include <asm/cpufeatures.h>
>>
>>  static bool all_callee_regs_used[4] = {true, true, true, true};
>>
>> @@ -1604,6 +1605,127 @@ static void emit_priv_frame_ptr(u8 **pprog, void __percpu *priv_frame_ptr)
>>         *pprog = prog;
>>  }
>>
>> +static bool bpf_inlines_func_call(u8 **pprog, void *func)
>> +{
>> +       bool has_popcnt = boot_cpu_has(X86_FEATURE_POPCNT);
>> +       bool has_bmi1 = boot_cpu_has(X86_FEATURE_BMI1);
>> +       bool has_abm = boot_cpu_has(X86_FEATURE_ABM);
>> +       bool inlined = true;
>> +       u8 *prog = *pprog;
>> +
>> +       /*
>> +        * x86 Bit manipulation instruction set
>> +        * https://en.wikipedia.org/wiki/X86_Bit_manipulation_instruction_set
>> +        */
>> +
>> +       if (func == bpf_clz64 && has_abm) {
>> +               /*
>> +                * Intel® 64 and IA-32 Architectures Software Developer's Manual (June 2023)
>> +                *
>> +                *   LZCNT - Count the Number of Leading Zero Bits
>> +                *
>> +                *     Opcode/Instruction
>> +                *     F3 REX.W 0F BD /r
>> +                *     LZCNT r64, r/m64
>> +                *
>> +                *     Op/En
>> +                *     RVM
>> +                *
>> +                *     64/32-bit Mode
>> +                *     V/N.E.
>> +                *
>> +                *     CPUID Feature Flag
>> +                *     LZCNT
>> +                *
>> +                *     Description
>> +                *     Count the number of leading zero bits in r/m64, return
>> +                *     result in r64.
>> +                */
>> +               /* emit: x ? 64 - fls64(x) : 64 */
>> +               /* lzcnt rax, rdi */
>> +               EMIT5(0xF3, 0x48, 0x0F, 0xBD, 0xC7);
> 
> Instead of emitting binary in x86 and arm JITs,
> let's use in kernel disasm to check that all these kfuncs
> conform to kf_fastcall (don't use unnecessary registers,
> don't have calls to other functions) and then copy the binary
> from code and skip the last 'ret' insn.
> This way we can inline all kinds of kfuncs.
> 

Good idea.

Quick question on “in-kernel disasm”: do you mean adding a kernel
instruction decoder/disassembler to validate a whitelist of kfuncs at
load time?

I’m trying to understand the intended scope:

* Is the expectation that we add an in-kernel disassembler/validator for
  a small set of supported instructions and patterns (no calls/jumps,
  only arg/ret regs touched, etc.)?
* Or is there already infrastructure you had in mind that we can reuse?

Once I understand that piece, I can rework the series to inline by
copying validated machine code (minus the final ret), rather than
emitting raw opcodes in the JITs.

I also noticed you mentioned a similar direction in "bpf/s390: Implement
get_preempt_count()" [1], so I’ve added Ilya to the thread to discuss
this approach further.

[1]
https://lore.kernel.org/bpf/CAADnVQKSMCohZy_HZwzNpFfTSnVu7rfxgmHEDgT9s28XxcDS5g@mail.gmail.com/

Thanks,
Leon


