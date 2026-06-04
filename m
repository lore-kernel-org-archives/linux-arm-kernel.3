Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D038FCD6E77
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 21:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+m7Si3D+ole/8K+71lLy8KRgWcJ869l99QxME4GzlE=; b=rH8Ta5YFp/QMe/zpgNPsOCguhc
	gfkR7NS+Yq6bcv63ZZAfDOzplOC1n8j0JCkowCKgpccHfuZgFHfYUJNg6j6lSpheMjJ1zWkEsvv5n
	Kc6SsKKZUUUFsJdwfZBAAabJBpbp17T6E+vQQxnoWIMuhBUF1tp2q0AsIDaASoOzT9r0SAkCowaHs
	zuZvjTQCV/URW8x8+DvcVSvTgthzPTqUpTJoGoPrvs3lfgBWnPe4XhZxkhwrogAi+IoniTV9J1R0q
	I0kkx+lUq+bMFXGo2MMFLhm/qEKY58XX36ijck1WqOBuolDcYPNQPF5bqMxFi0xnwpbFIMvHlDzIt
	JmgFhoeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVFNS-0000000HJUJ-1K8Z;
	Thu, 04 Jun 2026 21:13:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVFNQ-0000000HJTr-3sWJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 21:13:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AB9A7418EA;
	Thu,  4 Jun 2026 21:13:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D89F1F00893;
	Thu,  4 Jun 2026 21:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780607600;
	bh=R+m7Si3D+ole/8K+71lLy8KRgWcJ869l99QxME4GzlE=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=XxxgafhoyrZUNrj9DMod/PAUvkNiUv2GCWyfl/7nELyGmpgFUfbbgs4IABIUR8bSV
	 iXqujyVPXhwDHm8wMNNuOC2fijPOzLM3GyTDqJ55GKlEwaU5OCgzT0eyL3IYo/5Uh9
	 Fm9ly5QIfRWXCk886bHqoT0brJZSCl3aVgQ0H2u0oVnpScy3cLraxS7bYazcgugO/N
	 W8vBcMi9ncHagU7ElqUYs3PsjcufcD6rkf84Lyxsnp28IZrbxqbcFTzernOXS7dMMc
	 5Rbze6TGAQlswv0ANClo3hsMXoJ0ku8h9UCibajVifNobVlFPYQxYkDcn8d9GNur29
	 BggA9CObmDEjQ==
Content-Type: multipart/mixed; boundary="===============5773208707414677654=="
MIME-Version: 1.0
Message-Id: <8485a4391b9a9b744bf0f740b60ba73dec5e894a725157f9c336c0225e00a4dd@mail.kernel.org>
In-Reply-To: <20260604-kasan-v2-4-c066e627fda8@bootlin.com>
References: <20260604-kasan-v2-4-c066e627fda8@bootlin.com>
Subject: Re: [PATCH bpf-next v2 4/8] bpf, x86: refactor BPF_ST management in do_jit
From: bot+bpf-ci@kernel.org
To: alexis.lothore@bootlin.com,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,martin.lau@linux.dev,eddyz87@gmail.com,memxor@gmail.com,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,john.fastabend@gmail.com,tglx@kernel.org,mingo@redhat.com,bp@alien8.de,dave.hansen@linux.intel.com,x86@kernel.org,hpa@zytor.com,shuah@kernel.org,mcoquelin.stm32@gmail.com,alexandre.torgue@foss.st.com,ihor.solodrai@linux.dev
Cc: ebpf@linuxfoundation.org,bastien.curutchet@bootlin.com,thomas.petazzoni@bootlin.com,bpf@vger.kernel.org,linux-kernel@vger.kernel.org,linux-kselftest@vger.kernel.org,linux-stm32@st-md-mailman.stormreply.com,linux-arm-kernel@lists.infradead.org,alexis.lothore@bootlin.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Thu,  4 Jun 2026 21:13:20 +0000 (UTC)
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

--===============5773208707414677654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
> index 0981791014eb..943a0f315cf2 100644
> --- a/arch/x86/net/bpf_jit_comp.c
> +++ b/arch/x86/net/bpf_jit_comp.c
> @@ -2300,41 +2300,50 @@ static int do_jit(struct bpf_verifier_env *env, struct bpf_prog *bpf_prog, int *
>  			EMIT_LFENCE();
>  			break;
>
> -			/* ST: *(u8*)(dst_reg + off) = imm */
>  		case BPF_ST | BPF_MEM | BPF_B:

[ ... ]

>  		case BPF_ST | BPF_MEM | BPF_DW:
> -			if (dst_reg == BPF_REG_PARAMS && insn->off == -8) {
> -				/* Arg 6: store immediate in r9 register */
> -				emit_mov_imm64(&prog, X86_REG_R9, imm32 >> 31, (u32)imm32);
> +			switch (BPF_SIZE(insn->code)) {

[ ... ]

> +			case BPF_DW:
> +				if (dst_reg == BPF_REG_PARAMS &&
> +				    insn->off == -8) {
> +					/* Arg 6: store immediate in r9 register */
> +					emit_mov_imm64(&prog, X86_REG_R9,
> +						       imm32 >> 31, (u32)imm32);
> +					break;
> +				}
> +				EMIT2(add_1mod(0x48, dst_reg), 0xC7);
>  				break;
>  			}
> -			EMIT2(add_1mod(0x48, dst_reg), 0xC7);
>
> -st:			insn_off = insn->off;
> +			insn_off = insn->off;

Has the scope of the Arg 6 break changed here?

In the original code the BPF_DW handling lived directly under the case
label, and its break left the whole outer instruction switch:

	case BPF_ST | BPF_MEM | BPF_DW:
		if (dst_reg == BPF_REG_PARAMS && insn->off == -8) {
			/* Arg 6: store immediate in r9 register */
			emit_mov_imm64(&prog, X86_REG_R9, imm32 >> 31, (u32)imm32);
			break;
		}
		EMIT2(add_1mod(0x48, dst_reg), 0xC7);
	st:	insn_off = insn->off;
		...

So for the Arg 6 case it emitted exactly the movabs into r9 and stopped,
never reaching the st: addressing and immediate emission.

After the refactor, the Arg 6 branch lives inside the inner switch on
BPF_SIZE(), so its break only exits that inner switch:

	case BPF_DW:
		if (dst_reg == BPF_REG_PARAMS &&
		    insn->off == -8) {
			emit_mov_imm64(&prog, X86_REG_R9,
				       imm32 >> 31, (u32)imm32);
			break;
		}
		EMIT2(add_1mod(0x48, dst_reg), 0xC7);
		break;
	}

	insn_off = insn->off;
	if (dst_reg == BPF_REG_PARAMS) {
		insn_off = outgoing_arg_base - outgoing_rsp -
			   insn_off - 16;
		dst_reg = BPF_REG_FP;
	}
	if (is_imm8(insn_off))
		EMIT2(add_1reg(0x40, dst_reg), insn_off);
	else
		EMIT1_off32(add_1reg(0x80, dst_reg), insn_off);
	EMIT(imm32, bpf_size_to_x86_bytes(BPF_SIZE(insn->code)));

After emitting the movabs into r9, does control now fall through into
the common insn_off block and emit an additional ModRM/displacement byte
sequence plus a 4-byte immediate that do not belong to any instruction?

Would those extra bytes corrupt the emitted machine code stream for the
Arg 6 path, since dst_reg == BPF_REG_PARAMS with insn->off == -8 is a
reachable case used to pass the 6th outgoing call argument in r9?

Could the original break be preserved here, for example by breaking out
of the outer switch (or skipping the insn_off block) once the Arg 6
movabs has been emitted?

The commit message describes this as grouping the BPF_ST instructions
"in a single block of fall-through cases", implying no behavioral change,
but the Arg 6 path appears to gain extra emitted bytes.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/26978380520
--===============5773208707414677654==--

