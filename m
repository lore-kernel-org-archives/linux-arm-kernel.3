Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6BEE9A055
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 17:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qbNsSPMZwv1/3WEUw4zg9sK7Xs2yLlNrYKE6jqFxkMY=; b=A8Z9QActNzMb+/evoHyxVfJOX5
	2FlfL5tvkhWuq7UwCt1Kljy9oTIyzW7sh0oEN1eKibtMrLnz7fM5DcLe5ipK/qOhlvVcayHvnEyNb
	zAwbnmEy4e/j5RMQ7v/CbEXF35YIxcvyI3zHQencAO5Xr4Qq65fYh6xbno42fI7HCFBAcKdATuia1
	wP6fuKBPG1/rxt0Yp1K0ZGudUAEi48wsLhQJMIM2IwdI794e0QF2henzrLqYZ7xnkvawL5x20fvFw
	LRZPyMeWpCYpclGEKu8Dkb5PHaEHqAcSDENtmGKEU6vMtTc8G94Y7LyWYRc+sfGE45r/vj6w9bd3a
	EbY76ktQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt88K-0000000BjNg-48dq;
	Thu, 19 Feb 2026 17:48:12 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt88J-0000000BjMt-0EnS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 17:48:12 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4362507f0feso801904f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 09:48:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771523289; cv=none;
        d=google.com; s=arc-20240605;
        b=TYjMMc6lGc5e0nh4WrMXX9mdJKnwNsxJh99N+r+fm3FV7dFLULEUVsQPDlPrIm5Wpm
         /DaqIVtKlljzWs+IUe3lirZpVjWGLQjk02TuySu8gWJ7u8UCm15bHij+tNHJG3vUGuvN
         lJKI1gYuU9pR1/2YLZ+FFu0HNbMyTI/uLj9ix1y3wQyEICI1+Y8jUtwhUENVyRA+1BlP
         LLdfKFef1mEcqKReitcDUXALHtL6sOG4tyhcL4f3shorrt+6JSxW47WYRX+n4DHtQTSX
         HTU8i24EPlf98wICdoYboGHEYGUP3Vrau8pkoIQ3uhWHKEA6lNZtRy//dx5OXpTjqeE1
         +Jow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qbNsSPMZwv1/3WEUw4zg9sK7Xs2yLlNrYKE6jqFxkMY=;
        fh=UaYka8a4a/xKY05lm8ZpIdtfo8gBZn27XF5iDHar+6s=;
        b=axjamyt1Hiez54DwUQDUpstI0ig4ePWnec0NMxK8jMaiil8dWf5phy2pKmfMD/mA4p
         i1asoCexE1ae+CUduyjJsEf7KBSnyqCMANH2Gx3PhvxU2pMPF9538+SSO0wewmKKBXS9
         B2qhoeCb6MDP9YCYFu3kkMt4nTLYwzWmmH1Ny0AsJaP1DN54TOBqkhEM0Q6a28wxmGww
         Ub8wL2SuWigUu6VsirSrD6d3RXFdKiixFx2M5SN3bQz/TZQoS7utvoXR8NVechXOOP88
         TXjJjtwoLueg5t7Czoar5UR8wVrvMzu3AaXxIIg1m8cvADXdgN9YjKxMN4ZhxxZ/tPyO
         qLwg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771523289; x=1772128089; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbNsSPMZwv1/3WEUw4zg9sK7Xs2yLlNrYKE6jqFxkMY=;
        b=kZ/ntpgp1JWiRdfiyK8GYoNU+3Mwifn3p5BfOnjSwPOw0SbIeDZ1e7ISwwItB6s5RE
         NqrI3YJ3eebYk1XuS6aP8NsD+ZpvoeFi9XWx92TjRBA4WpLyaj6DW66q4irNAmnbxqyH
         hex6aPujYdvTwKLFaBXAgrsIxtnkVwjZ5Ffay54nXSUQLBudrWuDdskYz5PBgE7pyvF9
         L/wjx5c9pcWeZMJnMDN4ioqk8/o3JqHsHOxTg6pj24tUSuPzrjEwOl5YR0s0JN10rB5+
         3Zjqi0BLF/E8+AIAdg2CwBVVnIfePu26J6BC3LO4zt/UcA/VMiLoW3uJ/i1tWrl/D6kf
         K2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771523289; x=1772128089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qbNsSPMZwv1/3WEUw4zg9sK7Xs2yLlNrYKE6jqFxkMY=;
        b=fmgcNmVNAD9i/lKMQdviRKYCHiUoegZ2mhiQmxbyeI+muIiv3VNVQQKZtwHHXE1/pS
         8JfYSJJcktsestYj53AwtVxzlQCWdUlyyuEdbi/iSasdd3r4sVcxUHjpYxwR6HKYzeYx
         TV2i/BOx2TJzNYdU02d82zmdXMQqvqTLqYfHK77+XB5ndUdKDujXZ7V9+k8lVjxWVV3k
         2uYE2R9k6U2+F3XxnoDEAJdQj2xuH14k0APtu3rtg2wokikWswXIAazL1IcOO0gae5tu
         WqtnhgdhDsydZ01RoPsNhcAbQ7PAVm8uhtfHLkZDEB1sGy+Y0suP57tKjSVpr+qc08Q0
         36sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXH1ttTDfu2yCvEWeGiUYHtnaE23HesY75XudMsu+5IOKC9Z69PIBZ5Eix0U+28B7/7rVDxJIECXLumE+7FjbRp@lists.infradead.org
X-Gm-Message-State: AOJu0YxVArUxNO32CoB3NxA+1GTGe8JNO02z7NvDEpTU1D49i786IbC/
	3J+5xERzabYJ1Uipt/CQtaO+wY74HralwBZKWDsyUCdWxJ85GTWKSQsPesw+cZ8fimlCRo4jrYY
	C+exOlf2t/IfAPiGfQnSHlF5ePT9G8MQ=
X-Gm-Gg: AZuq6aJ8GZXylTRZv0Cz6pxArPVCKV+/3dBwEAdcxfgUvwQWBq2bCILV0kc4mmmoj0q
	CBipVnyqhdPGjlThECtkrcPS8menWxe6rHHedU7wGHeKVUWmuhlWkTA/WKKUwh2CDUmkrwQc/2X
	wI653phWBrH0D5g/dtkH1Lzt5NEr3imnwKOVxcIZ+Ho5SXQcZdYh2jVC2dEoSmSd4z12IVFamv1
	cssvDVqYeyj3Vt3Zd++h7tJ6Z/8ceF4fznr+XzR7XKNz6+xaTggI5X+Uywy8dEEUNAOTxsUjcJD
	JF4Tk9pbC/AEXk3wQ3OXpjTAV63Xcm2i6fudRKMFXXaPJ2EmCar/6lHWF3ElFapO2m+rUbkQfUS
	bCaDRaD2Ur1r4J/LF5wQ=
X-Received: by 2002:a5d:588d:0:b0:436:369f:39fa with SMTP id
 ffacd0b85a97d-43796af9ed9mr39572765f8f.44.1771523288626; Thu, 19 Feb 2026
 09:48:08 -0800 (PST)
MIME-Version: 1.0
References: <20260219142933.13904-1-leon.hwang@linux.dev> <20260219142933.13904-3-leon.hwang@linux.dev>
In-Reply-To: <20260219142933.13904-3-leon.hwang@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 19 Feb 2026 09:47:55 -0800
X-Gm-Features: AaiRm51ncUqJvIXG5s9TUaGOjPI7tmxDZZwdTCvAAoEMmGM4win76dnirbBawFI
Message-ID: <CAADnVQLNmQGKf5S5ZNwHYzScYBhnWFmnzLg=5Xxy4SgYKE3EfQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 2/6] bpf, x86: Add 64-bit bitops kfuncs
 support for x86_64
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
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
X-CRM114-CacheID: sfid-20260219_094811_120370_B5F9E8AA 
X-CRM114-Status: GOOD (  21.76  )
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

On Thu, Feb 19, 2026 at 6:30=E2=80=AFAM Leon Hwang <leon.hwang@linux.dev> w=
rote:
>
> Implement JIT inlining of the 64-bit bitops kfuncs on x86_64.
>
> bpf_rol64() and bpf_ror64() are always supported via ROL/ROR.
>
> bpf_ctz64() and bpf_ffs64() are supported when the CPU has
> X86_FEATURE_BMI1 (TZCNT).
>
> bpf_clz64() and bpf_fls64() are supported when the CPU has
> X86_FEATURE_ABM (LZCNT).
>
> bpf_popcnt64() is supported when the CPU has X86_FEATURE_POPCNT.
>
> bpf_bitrev64() is not inlined as x86_64 has no native bit-reverse
> instruction, so it falls back to a regular function call.
>
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  arch/x86/net/bpf_jit_comp.c | 141 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 141 insertions(+)
>
> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
> index 070ba80e39d7..193e1e2d7aa8 100644
> --- a/arch/x86/net/bpf_jit_comp.c
> +++ b/arch/x86/net/bpf_jit_comp.c
> @@ -19,6 +19,7 @@
>  #include <asm/text-patching.h>
>  #include <asm/unwind.h>
>  #include <asm/cfi.h>
> +#include <asm/cpufeatures.h>
>
>  static bool all_callee_regs_used[4] =3D {true, true, true, true};
>
> @@ -1604,6 +1605,127 @@ static void emit_priv_frame_ptr(u8 **pprog, void =
__percpu *priv_frame_ptr)
>         *pprog =3D prog;
>  }
>
> +static bool bpf_inlines_func_call(u8 **pprog, void *func)
> +{
> +       bool has_popcnt =3D boot_cpu_has(X86_FEATURE_POPCNT);
> +       bool has_bmi1 =3D boot_cpu_has(X86_FEATURE_BMI1);
> +       bool has_abm =3D boot_cpu_has(X86_FEATURE_ABM);
> +       bool inlined =3D true;
> +       u8 *prog =3D *pprog;
> +
> +       /*
> +        * x86 Bit manipulation instruction set
> +        * https://en.wikipedia.org/wiki/X86_Bit_manipulation_instruction=
_set
> +        */
> +
> +       if (func =3D=3D bpf_clz64 && has_abm) {
> +               /*
> +                * Intel=C2=AE 64 and IA-32 Architectures Software Develo=
per's Manual (June 2023)
> +                *
> +                *   LZCNT - Count the Number of Leading Zero Bits
> +                *
> +                *     Opcode/Instruction
> +                *     F3 REX.W 0F BD /r
> +                *     LZCNT r64, r/m64
> +                *
> +                *     Op/En
> +                *     RVM
> +                *
> +                *     64/32-bit Mode
> +                *     V/N.E.
> +                *
> +                *     CPUID Feature Flag
> +                *     LZCNT
> +                *
> +                *     Description
> +                *     Count the number of leading zero bits in r/m64, re=
turn
> +                *     result in r64.
> +                */
> +               /* emit: x ? 64 - fls64(x) : 64 */
> +               /* lzcnt rax, rdi */
> +               EMIT5(0xF3, 0x48, 0x0F, 0xBD, 0xC7);

Instead of emitting binary in x86 and arm JITs,
let's use in kernel disasm to check that all these kfuncs
conform to kf_fastcall (don't use unnecessary registers,
don't have calls to other functions) and then copy the binary
from code and skip the last 'ret' insn.
This way we can inline all kinds of kfuncs.

pw-bot: cr

