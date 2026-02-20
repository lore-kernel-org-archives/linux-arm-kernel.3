Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1744C5AD46
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 17:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RO4uLlKzg+agTjcOCUVy5m78c6Cx5Y93TL1UPBWaM7I=; b=ZZcf81CBKMEU5RgSXG9N47ef+B
	ujFf0auty2Ucx87nAuQBoETYBJdRdaD/QNB+wNs+EcPebD4/cxpEff5kADVdylYf5zZcTQPs45gYc
	hhDuZuTHhHDM6JvFvxNb0VoEf7iBxeMZxxQo1sQvZRtLi0ptLQ/d9/8tiDObrUI8IU+ZtDLcGLxTQ
	7JUJdYgwiqFnxiVC1WxGSmHI+HREgB2lXL+3yWdpmWz1D6gUqncy0v+5Hx1zqTZZkBk0FW+zXNoOv
	Z1j68FhFy4Gz/SbEkRKVIBO9PS81gPz3ozrKVKnxRwctNcWfhOwqbB9DV9hYKaOL7EEVBlC+FUaA5
	huwYK9Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtUeQ-0000000FOus-1Bf3;
	Fri, 20 Feb 2026 17:50:50 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtUeN-0000000FOu3-00Bq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 17:50:49 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4359a316d89so2120245f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Feb 2026 09:50:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771609844; cv=none;
        d=google.com; s=arc-20240605;
        b=OzXl07UXbBnxyHgHe/psVJMInJwCfX5NJjUr+tzuhLQW4SGu4BfToXcSHlF9jqZpuM
         tj0znz9tJMYen6gwuOZI5lNfk+85Efg79la8XQWM3oCXWbLTOd5KvQS23JKN+cDPehZv
         /rllEKRJKF+uR22IOOU0BSLaYw1jzQ6s2gMN9yIR68/IKHGsZ67jN57cHVCH+lZ5Ae5Z
         HrSNnk5FYzMDYHxcDYwmYwwY8eu31OalJQma41gzyZwv+JLQykRGqcBXVBnw/sNPkV3B
         TMfr8OMPMIeH4KSogQd771GRZrivXMcdYmGZj5kEmomQLpivprKznPrV5RjZ0fbj1baR
         PR/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RO4uLlKzg+agTjcOCUVy5m78c6Cx5Y93TL1UPBWaM7I=;
        fh=p9OvsrDtBQ5yxz1HAfVimDRPZp3/EG9u7cyE3hSdZtw=;
        b=DCXf6oN+Vb7+r4qe0WvpaoKHkyw4im66UX8MghOknjUteNp+nagB2iSYawsH7Em+Wj
         rs/JVK8s5cuXMiaLVKCjEsu1dNJdrZWDpO01uuuVh2h5vaUIUY6RuuLruvo/DSHFDVhB
         pCESoH+gmI/rxiJzUjHfNbeBMN2xj9hWJnw8iflirIKX4VpERsCLT+C8rp+zQKwuCF39
         Py31XQ0THZG42qvD8urd61FFmxkL35sFj0CjkRdAmXGlS4HG3pePEuCq+XBdId9FEi39
         GwcNvGfn8lbkHlUxtt/aGSoFCUcwqkS7SUwGknSyMVyEuupx1D1jAxnI2YlJ2rTQp1Rq
         orxw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771609844; x=1772214644; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RO4uLlKzg+agTjcOCUVy5m78c6Cx5Y93TL1UPBWaM7I=;
        b=K6vDFbN0T6kPX+ahVmMqwgPoajTRRBO/F0QSIJZ83OryCo4ux31LHYfIRpoQ3CI4fI
         FxI1FJ0uM6wP3+xG4S5c39XnY3DF5ZiFLiCtv0nVLBoDgX4L4flJRkXFuSvdUbr+UkF3
         LRMCQVujrH+A2sSDscVrUWbjO/RTKFn75EtMKeMWkE+DRNdb0TQEAn0veJafVFGMJ4uG
         qSpfcDVrdLcfLfG5Lzvg12/HrSZFUZ+Tpeu4GEBwPE62uQevbirCjw35MF7vHw6WPP3/
         AoQiYsq/B/WLjIYUEtmrNcV9be4eXC6kvZFX/YJsIFRfShrjhs5fCZjJJd1UKqSkKkMV
         pvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771609844; x=1772214644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RO4uLlKzg+agTjcOCUVy5m78c6Cx5Y93TL1UPBWaM7I=;
        b=haqUBw6VyOGAbJzuaOn7tkjZwpzoAxGwGNgQAu7GkM5WVYJgMcBnFAsgwSSpuQragi
         AjCu/EdZpApbrZFo1kXeXw6fgyx5mAAE/n7VHa6B9LuopK7W6yfMuqAZB1tqAJ1q7gW7
         yjV7VWgbYuRg3vVn/ojUNF/1PJ8+XWw+seEsdvK4hcOnwSVABg2FCiCu5aEvPbWqo07X
         H7/1AWQWV86TRTR3GaxYDU6Dst86wHwJHnni6OzCIg4cBCqcBfVVrWV5qbxwchD60Wkd
         GzB2HR+nzOWKz0vKFWs8l52PQ9QdNaklxIM1Jpms+L0ydodnm9D1Xv/W6okVxHXPY4+0
         Pdqw==
X-Forwarded-Encrypted: i=1; AJvYcCU5Sehg+49VSDXTwXjki3wQpU6P3uJ440cF7hGOj0veDi/5Xyu7skRh6vvr/6DO96lB0USYEA1D+aTcdtyQG3vL@lists.infradead.org
X-Gm-Message-State: AOJu0YxvHjG7X8IpAfY+YUbNEr9iRD89C+B//AO3XTxj1gd56Lb9zI47
	NnFIHvdT/WEiDOFN91mSaySliTTQ2Sj9TxRLrrgP/w0ITgH63ZqCIaWKd+YdTqyaeNzAcaECQov
	ZM70JTJwfklnxlcP1iOt4LlUi/+QL9Yk=
X-Gm-Gg: AZuq6aKOXQKpYJy3XL3Q73BCGt9kVsLkRhJ0GgspTvzFQOJKdwVaWwzqQdZhbkN1tIX
	dJKCtCKj+KWOtJ6ctkNEtNIIX2UAx9TJvMyhMSijMIMbbMfGFDUvEixf96E4doRsDVQzO34p+3b
	4GBNgNlIcnLqWQVsDwRmZ8l1qjtiKM8Xf9sH5nlIXYzyr3rOxQRDn7AziodujE0LNCf7e5Vby4x
	Mn/kqAAncefyBahVRQnOKgY1CXIzelc+0e9idUwNcFo4eJfaZp/jhchdGG9dwvdyFVjuw3FwmL0
	rWpLGAdbwUe85APt+kGL4+pCFwoBCWXIlFdFEuEWR/zTYOBBoBwg416voOZnVHByeNp0jzjJGf/
	xFC4e2d4i4FP91H81326pBwNEJw==
X-Received: by 2002:a05:6000:22c1:b0:437:719d:a74a with SMTP id
 ffacd0b85a97d-4396f1822eemr1349284f8f.58.1771609844263; Fri, 20 Feb 2026
 09:50:44 -0800 (PST)
MIME-Version: 1.0
References: <20260219142933.13904-1-leon.hwang@linux.dev> <20260219142933.13904-3-leon.hwang@linux.dev>
 <CAADnVQLNmQGKf5S5ZNwHYzScYBhnWFmnzLg=5Xxy4SgYKE3EfQ@mail.gmail.com> <c6c2ffcf-acdf-4bda-ad82-dc4cc1a9260e@linux.dev>
In-Reply-To: <c6c2ffcf-acdf-4bda-ad82-dc4cc1a9260e@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 20 Feb 2026 09:50:33 -0800
X-Gm-Features: AaiRm51uyzLsKizzJvG3f9kn6T1NTHikVXRFmQWXpkFAQIgwLjOzg8dZ0x3Ke_4
Message-ID: <CAADnVQ+iQkvb9-wOchuPrUOneqzx9Rrqto88=R7GUOqih6PhZQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260220_095047_078433_F67D1FE3 
X-CRM114-Status: GOOD (  32.88  )
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

On Fri, Feb 20, 2026 at 7:54=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
>
>
> On 2026/2/20 01:47, Alexei Starovoitov wrote:
> > On Thu, Feb 19, 2026 at 6:30=E2=80=AFAM Leon Hwang <leon.hwang@linux.de=
v> wrote:
> >>
> >> Implement JIT inlining of the 64-bit bitops kfuncs on x86_64.
> >>
> >> bpf_rol64() and bpf_ror64() are always supported via ROL/ROR.
> >>
> >> bpf_ctz64() and bpf_ffs64() are supported when the CPU has
> >> X86_FEATURE_BMI1 (TZCNT).
> >>
> >> bpf_clz64() and bpf_fls64() are supported when the CPU has
> >> X86_FEATURE_ABM (LZCNT).
> >>
> >> bpf_popcnt64() is supported when the CPU has X86_FEATURE_POPCNT.
> >>
> >> bpf_bitrev64() is not inlined as x86_64 has no native bit-reverse
> >> instruction, so it falls back to a regular function call.
> >>
> >> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> >> ---
> >>  arch/x86/net/bpf_jit_comp.c | 141 +++++++++++++++++++++++++++++++++++=
+
> >>  1 file changed, 141 insertions(+)
> >>
> >> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
> >> index 070ba80e39d7..193e1e2d7aa8 100644
> >> --- a/arch/x86/net/bpf_jit_comp.c
> >> +++ b/arch/x86/net/bpf_jit_comp.c
> >> @@ -19,6 +19,7 @@
> >>  #include <asm/text-patching.h>
> >>  #include <asm/unwind.h>
> >>  #include <asm/cfi.h>
> >> +#include <asm/cpufeatures.h>
> >>
> >>  static bool all_callee_regs_used[4] =3D {true, true, true, true};
> >>
> >> @@ -1604,6 +1605,127 @@ static void emit_priv_frame_ptr(u8 **pprog, vo=
id __percpu *priv_frame_ptr)
> >>         *pprog =3D prog;
> >>  }
> >>
> >> +static bool bpf_inlines_func_call(u8 **pprog, void *func)
> >> +{
> >> +       bool has_popcnt =3D boot_cpu_has(X86_FEATURE_POPCNT);
> >> +       bool has_bmi1 =3D boot_cpu_has(X86_FEATURE_BMI1);
> >> +       bool has_abm =3D boot_cpu_has(X86_FEATURE_ABM);
> >> +       bool inlined =3D true;
> >> +       u8 *prog =3D *pprog;
> >> +
> >> +       /*
> >> +        * x86 Bit manipulation instruction set
> >> +        * https://en.wikipedia.org/wiki/X86_Bit_manipulation_instruct=
ion_set
> >> +        */
> >> +
> >> +       if (func =3D=3D bpf_clz64 && has_abm) {
> >> +               /*
> >> +                * Intel=C2=AE 64 and IA-32 Architectures Software Dev=
eloper's Manual (June 2023)
> >> +                *
> >> +                *   LZCNT - Count the Number of Leading Zero Bits
> >> +                *
> >> +                *     Opcode/Instruction
> >> +                *     F3 REX.W 0F BD /r
> >> +                *     LZCNT r64, r/m64
> >> +                *
> >> +                *     Op/En
> >> +                *     RVM
> >> +                *
> >> +                *     64/32-bit Mode
> >> +                *     V/N.E.
> >> +                *
> >> +                *     CPUID Feature Flag
> >> +                *     LZCNT
> >> +                *
> >> +                *     Description
> >> +                *     Count the number of leading zero bits in r/m64,=
 return
> >> +                *     result in r64.
> >> +                */
> >> +               /* emit: x ? 64 - fls64(x) : 64 */
> >> +               /* lzcnt rax, rdi */
> >> +               EMIT5(0xF3, 0x48, 0x0F, 0xBD, 0xC7);
> >
> > Instead of emitting binary in x86 and arm JITs,
> > let's use in kernel disasm to check that all these kfuncs
> > conform to kf_fastcall (don't use unnecessary registers,
> > don't have calls to other functions) and then copy the binary
> > from code and skip the last 'ret' insn.
> > This way we can inline all kinds of kfuncs.
> >
>
> Good idea.
>
> Quick question on =E2=80=9Cin-kernel disasm=E2=80=9D: do you mean adding =
a kernel
> instruction decoder/disassembler to validate a whitelist of kfuncs at
> load time?
>
> I=E2=80=99m trying to understand the intended scope:
>
> * Is the expectation that we add an in-kernel disassembler/validator for
>   a small set of supported instructions and patterns (no calls/jumps,
>   only arg/ret regs touched, etc.)?
> * Or is there already infrastructure you had in mind that we can reuse?
>
> Once I understand that piece, I can rework the series to inline by
> copying validated machine code (minus the final ret), rather than
> emitting raw opcodes in the JITs.
>
> I also noticed you mentioned a similar direction in "bpf/s390: Implement
> get_preempt_count()" [1], so I=E2=80=99ve added Ilya to the thread to dis=
cuss
> this approach further.

You really sound like LLM. Do your homework as a human.

