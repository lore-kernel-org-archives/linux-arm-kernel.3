Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A27C61DFB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 16:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6IS/94CiUdqXhdBEGqJ8zPaf2eO5R4ltg/JKS5ZLlyY=; b=oHPgfECeRPamU96UOSIof4eQQ8
	/k6hVe9v+MEBmTgrblrvxuAcVZvhYQyQ7X/Xgxpb7Fv6Gwnf0rXxd+nGHUIIPhFQQkcmEIWvI4yLZ
	8YDvRargQWd0Lvd5IDm2JP8XX/PkpDGg4G5Y0OivheUmreR1+7JHgD/C+v6Az5VWLglj+7QKYcnlP
	PteW9O9N6qXHxKoZKgmGU0zchflsrVmNLdKR8TODU792TSohanXMZehLFX+vPp0F+0ZR7AVpAXCjU
	mvDPzed80NNy2WoBEevKyHoom0WZ7vb1CFbPIR1cIc7WlLGIzP7nLyFB3l8PoKp0AXZeKmMDOVRgd
	nK6TvwGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtqCq-0000000GBpK-2WoK;
	Sat, 21 Feb 2026 16:51:48 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtqCn-0000000GBoq-2CVW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Feb 2026 16:51:47 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4376c0bffc1so2284316f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Feb 2026 08:51:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771692703; cv=none;
        d=google.com; s=arc-20240605;
        b=T9dsYHbIivSBgJc7ddRLIJl27uV/uH7jnAhQuZVEDoF+vDIZVOWsuM+wC/rvImqGUf
         ntAMi1mmL4+PK+sC7Khmgwg6wDqtCsa0DiynZ4wsJrWmdZ4FRQlcpxar82MI/HW2Fske
         2I3azU/ArguZN8UXcBkOpBJMVjcjhRuwz7oyOBpJwwl3T9MToeN7brbNHSSiHc13F2yk
         7ntbcaAPBHCkY78R6Pwh1mE6SBwfhYGb828bMuWL0E9nRXulVXPZjPn+wAVt821hwoTG
         M2zgKciE3hJTEH4lCS0un1tulIbUGmB4EAG8xwtkqsAsU2IK2XfXHQ1R77hrcLUywR7A
         8/gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6IS/94CiUdqXhdBEGqJ8zPaf2eO5R4ltg/JKS5ZLlyY=;
        fh=qN7jaYUfuKLqsj+FpNJGRDSSUfUlHY8cKvTj36K3/T0=;
        b=DIFRPrkCpMTl5+rkUt6/QdnV6CUbN8lxmbgVnJNugi1JexSGsEArXRdMAMRafbm45j
         haA2JMeV6OYi1bR4xchRHbQKT81KnzWjRSz2bnkHe4VBb66g3PqyRxEtFZZDIyT+SlGq
         //IqQvCH1NZHFNTecOMjCq7SIPynTLiDtwsZjNvV+DFEsV3wE8OktiSsJwAdSKxNQF1A
         LBvhGJkjfdyZWZDadv1Bl1ORBndJEviBzxQpT/G9c9heIaV2tbylqlXRnDg5W/kaSut6
         M+Bal3cWPrRs/e91CWOvg4E36Mq9GHdnsXlF97cTqzgsE9QJ2wkuSCi82B4RRtXOamoc
         bFXA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771692703; x=1772297503; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6IS/94CiUdqXhdBEGqJ8zPaf2eO5R4ltg/JKS5ZLlyY=;
        b=bbV7BQKPwKdKnyC2gJVybGR7TrZfXDeWxLvsLe/Y14U94rd/JQtL1Vyav5n4xYpWFJ
         EHweufQmGyiXd0ym4T7iJ3nMqzqUbQJTMtW+c9xkbUlFmEABstg+ZuZKw4rZL72+zDnq
         l8cCPUFmD1PwXIYhvf5ZXBw0QxCa0q6nbAKYxZH616Z7WiQC5+5VW+dGMCW0Lrq2s+mk
         sVB3BOXmqYPhSLBBHc/jg227+anUB8rtHwA3JCC0S97IgvtymWr7OlQRfVmnyGiTTCEC
         BzYi4rTMKx12NGT/qmozft9GIouVDWoB9GnjASUXQ8TINrwIyQKMdyjTRHMgBY15AZCh
         oX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771692703; x=1772297503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6IS/94CiUdqXhdBEGqJ8zPaf2eO5R4ltg/JKS5ZLlyY=;
        b=trE+65QgR3B3uGMWXNx4Op3/JM0x5lfL63zz2kh5+N8bXLFIJh/1CdPtND9kW0mAxf
         b7tot/CHXmim/xK2jR0ETPQnsUSFksZCRKbdtiQiiZn4HZFD/4+UThpEuGuPkx3FqpgL
         ej+16JWkmLYJSe4s9AWaOlv3da64mZxJlIyImcx4suEFeUvYpMw605nVtVrVNtrWQn1P
         gzXCw+Q9+/8rCnIM/btnBMjGAJcnAqR7BdbKdYQAp69m8P1TdghcfcUB6fvnMj+KJzdU
         E2mSDtr9aydYRlQbEbLnlUSGPs5sp9JTyaHslG7M6kYhp5qWEyASikcousNZOaETaj6Z
         0IAw==
X-Forwarded-Encrypted: i=1; AJvYcCWaNdtdZuM43HwlCLkFm806J0FHQGp8zjI7uRWfZFrKN1CXelqjezuGdGnlcQJnH3QTySrE8eYxvEs/TYzEvuWu@lists.infradead.org
X-Gm-Message-State: AOJu0YxDXM+FV9waNTPKgzD0mHey937i4IpDYO7vM4/PLbjfd66061vM
	Ue7A2KcVWBmZnh8OC16fO2B7LiKnBG/2AJbyIduP26UakexlJVSKtb3tJKcOEqg1Q7GGkNF6TiT
	6rUzOoyFqNQz+LD6QH/AkHcqvKau7v7Y=
X-Gm-Gg: AZuq6aIzD4V5oJm+6qGoA2ucN83y9POc2lEWGKZAb/vIwsfMUk+8H4vP8fsdmuCw7U3
	qotffxO1PRuE1qFG8pD2cIBDbLQ5CMS+OtRB7KpdR7DdBo9hw+1llawTgQzbgMMkpEJt4PEcFu0
	zHufIp2FEqfo9tTMWRFOOlQIEdQevsXQxtLksvKq4oMzQd/8uYr4GGEZNumraQUuSqMCCSjnvkn
	omBXLyRi+lMiZfua5TW8j8h2XlYM+FQdwVZziXEFxfkWoLyQE/b08ev+qqZ7t8IPfeoWLabytrX
	8SNplcYM3OcWTaz4ZwxcJppyi8Eg1qlnpaKLsFm+A2VmO4wfvwyyIpcP6z+6yocLCzAF9yRQvN1
	7Z8DnAKDYTbAL9fF70pzINT+DAA==
X-Received: by 2002:a05:6000:290c:b0:437:7168:af50 with SMTP id
 ffacd0b85a97d-4396f182e99mr5976364f8f.37.1771692703222; Sat, 21 Feb 2026
 08:51:43 -0800 (PST)
MIME-Version: 1.0
References: <20260219142933.13904-1-leon.hwang@linux.dev> <20260219142933.13904-3-leon.hwang@linux.dev>
 <CAADnVQLNmQGKf5S5ZNwHYzScYBhnWFmnzLg=5Xxy4SgYKE3EfQ@mail.gmail.com>
 <c6c2ffcf-acdf-4bda-ad82-dc4cc1a9260e@linux.dev> <CAADnVQ+iQkvb9-wOchuPrUOneqzx9Rrqto88=R7GUOqih6PhZQ@mail.gmail.com>
 <4c40705a-4e6a-47ea-b420-223318d1ad09@linux.dev>
In-Reply-To: <4c40705a-4e6a-47ea-b420-223318d1ad09@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sat, 21 Feb 2026 08:51:32 -0800
X-Gm-Features: AaiRm52nj1X-_nBJIgAQ9NCx4CHzjnra7QF_C1bGfU9ssH2LC_icyswN6XymldQ
Message-ID: <CAADnVQLsJV8OaLCxznwbnxdLVOQ+t=MmAr2O8Y89iPErCvphFQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 2/6] bpf, x86: Add 64-bit bitops kfuncs
 support for x86_64
To: Leon Hwang <leon.hwang@linux.dev>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H . Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Peilin Ye <yepeilin@google.com>, 
	Luis Gerhorst <luis.gerhorst@fau.de>, Viktor Malik <vmalik@redhat.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kernel-patches-bot@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_085145_608696_A6797C6D 
X-CRM114-Status: GOOD (  35.85  )
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

On Sat, Feb 21, 2026 at 4:45=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
>
>
> On 2026/2/21 01:50, Alexei Starovoitov wrote:
> > On Fri, Feb 20, 2026 at 7:54=E2=80=AFAM Leon Hwang <leon.hwang@linux.de=
v> wrote:
> >>
> >>
> >>
> >> On 2026/2/20 01:47, Alexei Starovoitov wrote:
> >>> On Thu, Feb 19, 2026 at 6:30=E2=80=AFAM Leon Hwang <leon.hwang@linux.=
dev> wrote:
> >>>>
> >>>> Implement JIT inlining of the 64-bit bitops kfuncs on x86_64.
> >>>>
> >>>> bpf_rol64() and bpf_ror64() are always supported via ROL/ROR.
> >>>>
> >>>> bpf_ctz64() and bpf_ffs64() are supported when the CPU has
> >>>> X86_FEATURE_BMI1 (TZCNT).
> >>>>
> >>>> bpf_clz64() and bpf_fls64() are supported when the CPU has
> >>>> X86_FEATURE_ABM (LZCNT).
> >>>>
> >>>> bpf_popcnt64() is supported when the CPU has X86_FEATURE_POPCNT.
> >>>>
> >>>> bpf_bitrev64() is not inlined as x86_64 has no native bit-reverse
> >>>> instruction, so it falls back to a regular function call.
> >>>>
> >>>> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> >>>> ---
> >>>>  arch/x86/net/bpf_jit_comp.c | 141 +++++++++++++++++++++++++++++++++=
+++
> >>>>  1 file changed, 141 insertions(+)
> >>>>
> >>>> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp=
.c
> >>>> index 070ba80e39d7..193e1e2d7aa8 100644
> >>>> --- a/arch/x86/net/bpf_jit_comp.c
> >>>> +++ b/arch/x86/net/bpf_jit_comp.c
> >>>> @@ -19,6 +19,7 @@
> >>>>  #include <asm/text-patching.h>
> >>>>  #include <asm/unwind.h>
> >>>>  #include <asm/cfi.h>
> >>>> +#include <asm/cpufeatures.h>
> >>>>
> >>>>  static bool all_callee_regs_used[4] =3D {true, true, true, true};
> >>>>
> >>>> @@ -1604,6 +1605,127 @@ static void emit_priv_frame_ptr(u8 **pprog, =
void __percpu *priv_frame_ptr)
> >>>>         *pprog =3D prog;
> >>>>  }
> >>>>
> >>>> +static bool bpf_inlines_func_call(u8 **pprog, void *func)
> >>>> +{
> >>>> +       bool has_popcnt =3D boot_cpu_has(X86_FEATURE_POPCNT);
> >>>> +       bool has_bmi1 =3D boot_cpu_has(X86_FEATURE_BMI1);
> >>>> +       bool has_abm =3D boot_cpu_has(X86_FEATURE_ABM);
> >>>> +       bool inlined =3D true;
> >>>> +       u8 *prog =3D *pprog;
> >>>> +
> >>>> +       /*
> >>>> +        * x86 Bit manipulation instruction set
> >>>> +        * https://en.wikipedia.org/wiki/X86_Bit_manipulation_instru=
ction_set
> >>>> +        */
> >>>> +
> >>>> +       if (func =3D=3D bpf_clz64 && has_abm) {
> >>>> +               /*
> >>>> +                * Intel=C2=AE 64 and IA-32 Architectures Software D=
eveloper's Manual (June 2023)
> >>>> +                *
> >>>> +                *   LZCNT - Count the Number of Leading Zero Bits
> >>>> +                *
> >>>> +                *     Opcode/Instruction
> >>>> +                *     F3 REX.W 0F BD /r
> >>>> +                *     LZCNT r64, r/m64
> >>>> +                *
> >>>> +                *     Op/En
> >>>> +                *     RVM
> >>>> +                *
> >>>> +                *     64/32-bit Mode
> >>>> +                *     V/N.E.
> >>>> +                *
> >>>> +                *     CPUID Feature Flag
> >>>> +                *     LZCNT
> >>>> +                *
> >>>> +                *     Description
> >>>> +                *     Count the number of leading zero bits in r/m6=
4, return
> >>>> +                *     result in r64.
> >>>> +                */
> >>>> +               /* emit: x ? 64 - fls64(x) : 64 */
> >>>> +               /* lzcnt rax, rdi */
> >>>> +               EMIT5(0xF3, 0x48, 0x0F, 0xBD, 0xC7);
> >>>
> >>> Instead of emitting binary in x86 and arm JITs,
> >>> let's use in kernel disasm to check that all these kfuncs
> >>> conform to kf_fastcall (don't use unnecessary registers,
> >>> don't have calls to other functions) and then copy the binary
> >>> from code and skip the last 'ret' insn.
> >>> This way we can inline all kinds of kfuncs.
> >>>
> >>
> >> Good idea.
> >>
> >> Quick question on =E2=80=9Cin-kernel disasm=E2=80=9D: do you mean addi=
ng a kernel
> >> instruction decoder/disassembler to validate a whitelist of kfuncs at
> >> load time?
> >>
> >> I=E2=80=99m trying to understand the intended scope:
> >>
> >> * Is the expectation that we add an in-kernel disassembler/validator f=
or
> >>   a small set of supported instructions and patterns (no calls/jumps,
> >>   only arg/ret regs touched, etc.)?
> >> * Or is there already infrastructure you had in mind that we can reuse=
?
> >>
> >> Once I understand that piece, I can rework the series to inline by
> >> copying validated machine code (minus the final ret), rather than
> >> emitting raw opcodes in the JITs.
> >>
> >> I also noticed you mentioned a similar direction in "bpf/s390: Impleme=
nt
> >> get_preempt_count()" [1], so I=E2=80=99ve added Ilya to the thread to =
discuss
> >> this approach further.
> >
> > You really sound like LLM. Do your homework as a human.
>
> Got it.
>
> I polished my draft using ChatGPT, which would leave LLM smell in my repl=
y.

... and for anyone reading it the smell is ohh too strong.

> Here's my original draft:
>
> Good idea. But I concern about the "in kernel disasm". Do you mean we
> will build a disassembler for whitelist kfuncs at starting?
>
> I noticed you've mentioned the same direction in "bpf/s390: Implement
> get_preempt_count()" [1]. So, I added Ilya here to discuss this direction=
.

Much better. Keep it human.

"in kernel disasm" already exists for some architectures
(at least x86 and arm64) since it's being used by kprobes.
The ask here is to figure out whether they're usable for such
insn analysis. x86 disasm is likely capable.

re:"whitelist kfunc"
I suspect an additional list is not necessary.
kf_fastcall is a good enough signal that such kfunc should
be inlinable.

