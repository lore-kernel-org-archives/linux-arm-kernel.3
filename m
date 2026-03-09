Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDECF41807
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 16:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fqJYl3zPZN2KFVigj33M+KDn8csTHg3syExrZwynl6M=; b=ixONkNZs9sYm2RhocJEGOmRAEw
	wD0ux56O7DJM+ez+49quWI1GU4MBj1n3lx1a8CbprX95axE4c+ZSQirzfMJA/Pea+Q2OtobisOuL8
	tCFxiVpgooFlJvL3tk7QD7mcAVtBWh7ei+BC/sXdxZSPQinKyQ/TLgwhIfr5tOLgSQmrXOouTaDXR
	XEvxfzkCxCi//dHFLENUJt0j3+H+84MGkxorKXGw45AdwsobhwPcpOjIzBGOMRP0YdEf6V6V6MErg
	4HGZDC+aV7yZk2ogWEFgRNbjBmxxuFjiDxkAcNsVZA4YV5mzEVs0CKSyc+4+Mn04Ai2mDWzPEPJhu
	+WKIZvnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdU5-00000007jYX-1qGa;
	Mon, 09 Mar 2026 16:29:33 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdU2-00000007jYC-1Q82
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 16:29:31 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48534237460so18631655e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 09:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773073768; x=1773678568; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fqJYl3zPZN2KFVigj33M+KDn8csTHg3syExrZwynl6M=;
        b=GIxMUxO6qhzcy/iYio/h1i39DN7fv0E+WUct8CMPrbjLLZy4+DU0jjaeuwZnNnGQDr
         ecYxoa01Kf0PqGp/yKU8bD2JB2IH3wG4uChXjf1C8U2so1bgj5XUKfux5UeFSJW6omUX
         jtQTj+B2NZnUDvtu8P6+CbMoOgHAxMLz+/hFhbwFciBgk7vRmfiHYDZ/GVV8DF1VlviA
         0Aazz6Ayov1IEN4CZY6Rl8JNwpfAp4buWMemI0djdUDkfrDHlwrCcpW6wZ4uYC0UXNn3
         i6EcfLADe+lUDlRQsZuUEyS4i6DjjwhH9Pg7UjWNACUjMemY8/9lOK6wc17CPxEbPB4h
         Mu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773073768; x=1773678568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqJYl3zPZN2KFVigj33M+KDn8csTHg3syExrZwynl6M=;
        b=WKmZXNuGbtiWI4IdlOgWoiXV2AdaT6JgqE5YmNbZwBOsTC5teTNofiUp9G3IN+ZOOz
         T84xSi637mcm/AJSZFb8iKtGdQYO56/Fq6+/iRvmp+UeF7SWL8H4z/FMCDstscP0CI2S
         325BDUlJrxReMmSVtX0FpfSFZ1/l/r5ANbLCNXbFuJ9fFo49kKNb/AY36HwcWXsj0UU4
         46M+iKb6yUyqR907fxoJ5Es3tsD6XtvKj3/BPeptUt+V5cYvO5Ysb/+RP4eT5yJXcGKL
         +4yw9RN/UM28XM1WRUQ2zsAKPYt+ttLRHeyqr7FER3IdwxpFk1DRM9aKsXjPbfh/Ub/0
         sexw==
X-Forwarded-Encrypted: i=1; AJvYcCXsi6W0V+gTD0F9MDuVh/Y5iXBiuKI3IoyCag4+/kNvqLM4tvEuB+KvpQz6H2NuZQFFccwtP+zZgE8Y2dKOowDj@lists.infradead.org
X-Gm-Message-State: AOJu0YxjsmEirvAGpc5aW6efqxpMpdDYiVQ4aXXBVp/SNkPYx12nHs6s
	iwSun0gNtu9wLtmjfa/NnKNurEFa/gUvrX0MQZ3iIM3+odebcQ86m5Fh
X-Gm-Gg: ATEYQzzfKM6XYrGUqLAuNOJ6sFa7+n5CKx2WkoBeTjkvJmtU7EDa5gS6X624ytiIAuZ
	YOdNATE0XhSwC+k8bvSnFiJfMKH6QcrNaNd+SHCg1m+HqMktLw4haUqyMgvTmG2xy2voNtJJQdO
	LaQ0Ol59/6el0PzERRvWdYqMt1w81tcHLL7T2nWvNary1ypLOB9nasahlOVMN320ApcmmVGEjmT
	dG0NiegFdBEP39H5E50BcGcvFAFo0xopABJslFbaMW7CfDIdnzeAKTL7CpnfmP0/lxTaRXGGA76
	8vBHjJe/S6FJkgQ1uIcWrbJiThJ3CFoevkn+AOhhPRLAfSutrNj82baa8mFnpIUDQZWG7ewJ5s9
	iaVLBAge1izKgVia7NEjll+69M3CpKNPscB6wUclvn5LjRsQFRmy9FNHV+jyDiWPSFw==
X-Received: by 2002:a05:600c:6217:b0:485:3f58:d9f with SMTP id 5b1f17b1804b1-4853f580f32mr34856035e9.30.1773073766062;
        Mon, 09 Mar 2026 09:29:26 -0700 (PDT)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ac17f2sm2008225e9.6.2026.03.09.09.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 09:29:25 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:37:58 +0000
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: Xu Kuohai <xukuohai@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Shahab Vahedi <list+bpf@vahedi.org>,
	Russell King <linux@armlinux.org.uk>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Hengqi Chen <hengqi.chen@gmail.com>,
	Johan Almbladh <johan.almbladh@anyfinetworks.com>,
	Paul Burton <paulburton@kernel.org>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	"David S . Miller" <davem@davemloft.net>,
	Wang YanQing <udknight@gmail.com>
Subject: Re: [bpf-next v8 4/5] bpf, x86: Emit ENDBR for indirect jump targets
Message-ID: <aa73Zu0TC7jUEDju@mail.gmail.com>
References: <20260309140044.2652538-1-xukuohai@huaweicloud.com>
 <20260309140044.2652538-5-xukuohai@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309140044.2652538-5-xukuohai@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_092930_413869_2D09778C 
X-CRM114-Status: GOOD (  23.26  )
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

On 26/03/09 10:00PM, Xu Kuohai wrote:
> From: Xu Kuohai <xukuohai@huawei.com>
> 
> On CPUs that support CET/IBT, the indirect jump selftest triggers
> a kernel panic because the indirect jump targets lack ENDBR
> instructions.
> 
> To fix it, emit an ENDBR instruction to each indirect jump target. Since
> the ENDBR instruction shifts the position of original jited instructions,
> fix the instruction address calculation wherever the addresses are used.
> 
> For reference, below is a sample panic log.
> 
>  Missing ENDBR: bpf_prog_2e5f1c71c13ac3e0_big_jump_table+0x97/0xe1
>  ------------[ cut here ]------------
>  kernel BUG at arch/x86/kernel/cet.c:133!
>  Oops: invalid opcode: 0000 [#1] SMP NOPTI
> 
>  ...
> 
>   ? 0xffffffffc00fb258
>   ? bpf_prog_2e5f1c71c13ac3e0_big_jump_table+0x97/0xe1
>   bpf_prog_test_run_syscall+0x110/0x2f0
>   ? fdget+0xba/0xe0
>   __sys_bpf+0xe4b/0x2590
>   ? __kmalloc_node_track_caller_noprof+0x1c7/0x680
>   ? bpf_prog_test_run_syscall+0x215/0x2f0
>   __x64_sys_bpf+0x21/0x30
>   do_syscall_64+0x85/0x620
>   ? bpf_prog_test_run_syscall+0x1e2/0x2f0
> 
> Fixes: 493d9e0d6083 ("bpf, x86: add support for indirect jumps")
> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
> ---
>  arch/x86/net/bpf_jit_comp.c | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
> index b95f23ad1093..251dff1cd8e4 100644
> --- a/arch/x86/net/bpf_jit_comp.c
> +++ b/arch/x86/net/bpf_jit_comp.c
> @@ -1649,8 +1649,8 @@ static int emit_spectre_bhb_barrier(u8 **pprog, u8 *ip,
>  	return 0;
>  }
>  
> -static int do_jit(struct bpf_prog *bpf_prog, int *addrs, u8 *image, u8 *rw_image,
> -		  int oldproglen, struct jit_context *ctx, bool jmp_padding)
> +static int do_jit(struct bpf_verifier_env *env, struct bpf_prog *bpf_prog, int *addrs, u8 *image,
> +		  u8 *rw_image, int oldproglen, struct jit_context *ctx, bool jmp_padding)
>  {
>  	bool tail_call_reachable = bpf_prog->aux->tail_call_reachable;
>  	struct bpf_insn *insn = bpf_prog->insnsi;
> @@ -1663,7 +1663,7 @@ static int do_jit(struct bpf_prog *bpf_prog, int *addrs, u8 *image, u8 *rw_image
>  	void __percpu *priv_stack_ptr;
>  	int i, excnt = 0;
>  	int ilen, proglen = 0;
> -	u8 *prog = temp;
> +	u8 *ip, *prog = temp;
>  	u32 stack_depth;
>  	int err;
>  
> @@ -1734,6 +1734,13 @@ static int do_jit(struct bpf_prog *bpf_prog, int *addrs, u8 *image, u8 *rw_image
>  				dst_reg = X86_REG_R9;
>  		}
>  
> +#ifdef CONFIG_X86_KERNEL_IBT
> +		if (bpf_insn_is_indirect_target(env, bpf_prog, i - 1))
> +			EMIT_ENDBR();
> +#endif
> +
> +		ip = image + addrs[i - 1] + (prog - temp);
> +
>  		switch (insn->code) {
>  			/* ALU */
>  		case BPF_ALU | BPF_ADD | BPF_X:
> @@ -2440,8 +2447,6 @@ st:			if (is_imm8(insn->off))
>  
>  			/* call */
>  		case BPF_JMP | BPF_CALL: {
> -			u8 *ip = image + addrs[i - 1];
> -
>  			func = (u8 *) __bpf_call_base + imm32;
>  			if (src_reg == BPF_PSEUDO_CALL && tail_call_reachable) {
>  				LOAD_TAIL_CALL_CNT_PTR(stack_depth);
> @@ -2465,7 +2470,8 @@ st:			if (is_imm8(insn->off))
>  			if (imm32)
>  				emit_bpf_tail_call_direct(bpf_prog,
>  							  &bpf_prog->aux->poke_tab[imm32 - 1],
> -							  &prog, image + addrs[i - 1],
> +							  &prog,
> +							  ip,
>  							  callee_regs_used,
>  							  stack_depth,
>  							  ctx);
> @@ -2474,7 +2480,7 @@ st:			if (is_imm8(insn->off))
>  							    &prog,
>  							    callee_regs_used,
>  							    stack_depth,
> -							    image + addrs[i - 1],
> +							    ip,
>  							    ctx);
>  			break;
>  
> @@ -2639,7 +2645,7 @@ st:			if (is_imm8(insn->off))
>  			break;
>  
>  		case BPF_JMP | BPF_JA | BPF_X:
> -			emit_indirect_jump(&prog, insn->dst_reg, image + addrs[i - 1]);
> +			emit_indirect_jump(&prog, insn->dst_reg, ip);
>  			break;
>  		case BPF_JMP | BPF_JA:
>  		case BPF_JMP32 | BPF_JA:
> @@ -2729,8 +2735,6 @@ st:			if (is_imm8(insn->off))
>  			ctx->cleanup_addr = proglen;
>  			if (bpf_prog_was_classic(bpf_prog) &&
>  			    !ns_capable_noaudit(&init_user_ns, CAP_SYS_ADMIN)) {
> -				u8 *ip = image + addrs[i - 1];
> -
>  				if (emit_spectre_bhb_barrier(&prog, ip, bpf_prog))
>  					return -EINVAL;
>  			}
> @@ -3791,7 +3795,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
>  	for (pass = 0; pass < MAX_PASSES || image; pass++) {
>  		if (!padding && pass >= PADDING_PASSES)
>  			padding = true;
> -		proglen = do_jit(prog, addrs, image, rw_image, oldproglen, &ctx, padding);
> +		proglen = do_jit(env, prog, addrs, image, rw_image, oldproglen, &ctx, padding);
>  		if (proglen <= 0) {
>  out_image:
>  			image = NULL;
> -- 
> 2.47.3

Reviewed-by: Anton Protopopov <a.s.protopopov@gmail.com>

