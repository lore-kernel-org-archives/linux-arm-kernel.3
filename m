Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54ACE8538E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 18:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQA9l6pJtIusAEoQ3XC6hB3PnHCxdxk5R6lGy4Viwvg=; b=PH2hF+EgEXQt2bJ3hDnkFuIjag
	OQUJ9QI3p309HMq6+0c2KPsd/v92rRarY11WwK8z9Cxsj/GsYmeu03dWHOvsKaL0kXkAI9Sjhs5yi
	KU5BJ1EGTl3wSEw4eT5Ad2T50cYixJmhAvZAXGXvVvOVsQ+IoImujuuwQFG4k2sBGnLFyC/0dzd98
	cOCh36FmnVljc+fHYQAqr60x7RvLWe28QAfuyOhVV3Sxbwnno98jsY1NzjzuBV5FJss+hrjGgxQ36
	y7zqMDraSB5R+cGu5UG7WPjk/Bqca+xIAKFWsYCH2Q9dHxvk2AakqJ2CVgySoCu3FMuLgyTL1ZpUN
	x0YRF3XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8jXZ-00000002Rg8-2qIL;
	Fri, 03 Apr 2026 18:46:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8jXX-00000002Rg2-1f3v
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 03 Apr 2026 18:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:To:From:Subject
	:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GQA9l6pJtIusAEoQ3XC6hB3PnHCxdxk5R6lGy4Viwvg=; b=VjSxPezqSleC4Q7BfgiP69e7A1
	FJEfVjQ4sh4Wx1++sfVARHcCsvDK3tWYs807HKkPkdAEUYIEV4Gc7XQavSDIxJh4gSq0cleKDdSB7
	So8RoBuL5Xpmy2Z5UtxN+hS0j4F+uUS6/jv76ZYzlYpmxftsGAM0K/WcaY8kt4bpGkf8vzLKNxHza
	uc2QyDic8oOlOfZ6hgTSvta9jV5RBq9d1pym/QeK5h1is+JeOCu6dytyljoSAfKqLv6ZaZyRMrrLS
	QRyTKv6SdFS0Vz3qf6xDBuQXGutuhwNfMsMW3XnVYM182O1CWt+/NAQojvMcmEEyq5jyFhOaOETVl
	wCUZTo8g==;
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8jXT-00000004aG8-4Bx2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 18:46:42 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-82cf636dac8so995572b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 11:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1775241996; x=1775846796; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQA9l6pJtIusAEoQ3XC6hB3PnHCxdxk5R6lGy4Viwvg=;
        b=fznQBkaGVFvC2eKsXlNWL/KBios4V5jtcJkMfTOOVEPFQAXf6EWrQLZ8mGqqrsVipd
         eWCWMFjTsX8VfW4Tbdimc/VOav+e1ZDxRFpqRVHLYmv7BrHg5T9XdgP6a2ICo7xmkSbl
         BaV60I3PiV7u1EmAyTB1GPdkaJCIkBRMa54GNUBs4cdOvJeEXuaANG/a8H4lKziCsOAL
         J4E9UbbXJL+VnKe/Sl7LO4m/6uhgAkCbHMgft88Pq5yq4OQ3Wu+F+TkW1YOCo229k/1R
         MdaJyTRSgNzyqv8sOUaxLL41kVaIWZeh89+wUG16I1XUPXvo1u/4il5MYzTUBXoUqYR2
         AT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775241996; x=1775846796;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GQA9l6pJtIusAEoQ3XC6hB3PnHCxdxk5R6lGy4Viwvg=;
        b=iMgo78JLHSrBp3hGh2NeWgBJ+8j948jfpJD7MbcsyZBKJ+xMOR6Johmx47jZey7kL1
         puc2Wl6leSg35NtK7xmrr36nwwDK7fYptWb+iXiLWz/zYlsbS+eiMMOM4k4qWmFRb440
         SGCvV7ZLMs7IG/ygCULMQKRzV1MkeBgtNirtbysqwZPZNriBTqDk0iKV2UnJ2DFKFfRe
         +Akq+54SaNoZP4KGXtVGLpvk85abpdo14gNFXK4pnXGINWGatuWe/c8cXAKM68WlY0z7
         vfIasHEAxG1Y2/KiR0ZwwFH3W+G48EiZDhnoFEGi0ttQ5WqSeLCmkTdHxDsB44bJBG4Y
         QQsw==
X-Forwarded-Encrypted: i=1; AJvYcCWyzgeriY5IF3Ou9eHcUvwx6lu0TH83uQJTvRf8W1vPfC9STlDv/qHwY/6tEyBoI8YV8aB6OSftPuD4gCA6RV6R@lists.infradead.org
X-Gm-Message-State: AOJu0YxO2ER42kQa+ElGmnhdeT5hT6EYUDSgF25d1VKH0VU2v1oGAet+
	6j2okFD+LuW6r2jKGZoZZUbhaeZg8VIw0h7aTzfvFtf2UrFoGmQbUArqFUqQwXpeMjweb+SbVP5
	8cAtWgmJL/A==
X-Gm-Gg: AeBDiesvywhf6gsOh7jlQLLWIa6qphhai6uJKkQLIRvH7WgldDDUFMU+o6DO3mb70Mv
	9/hx0fyRYD0oifGxPDnBsv964ixzLjiiypdDBA4hIjtFfr8t+HZSGEClujecj8342HTPBGPuNGy
	KBbzAy+04JpbD32Q4GvKVJ986D+9WRgaCdF7swtexoSehhm5IiARk7cTsmC2H9EN6Pnc1z+B+GC
	CeQDb+9gqGbWxrPBjlkupKzXmlyqipGqCGoXvaJqPUhrd4CxugmMbZbwPVtbNeV0UOZzyNkmEmN
	3ZI7gsuKzs1n0u/L2cEzfC+LosAONGrPAMkN0Eks7iT8tlLOsCSyVumhMX3Rf6JziLZHjKkI4nF
	SIZhR/hWnkFMbKKMEVV3F6z6IYmv8DWXmxWywIwcDI1A0G+wlaVVNTO2diKCPqD8SAIXQWkHF+H
	pLfAe7YpE=
X-Received: by 2002:a05:6a00:1881:b0:7e8:4471:ae6d with SMTP id d2e1a72fcca58-82d0dd0011dmr3764746b3a.57.1775241996038;
        Fri, 03 Apr 2026 11:46:36 -0700 (PDT)
Received: from localhost ([2604:3d08:487d:cd00::5517])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c6fdd7sm6488813b3a.48.2026.04.03.11.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 11:46:35 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Apr 2026 14:46:34 -0400
Message-Id: <DHJQRLPOK7EA.1SSXDLAB9TWJZ@etsalapatis.com>
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Puranjay Mohan"
 <puranjay@kernel.org>, "Anton Protopopov" <a.s.protopopov@gmail.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, "Shahab
 Vahedi" <list+bpf@vahedi.org>, "Russell King" <linux@armlinux.org.uk>,
 "Tiezhu Yang" <yangtiezhu@loongson.cn>, "Hengqi Chen"
 <hengqi.chen@gmail.com>, "Johan Almbladh"
 <johan.almbladh@anyfinetworks.com>, "Paul Burton" <paulburton@kernel.org>,
 "Hari Bathini" <hbathini@linux.ibm.com>, "Christophe Leroy"
 <chleroy@kernel.org>, "Naveen N Rao" <naveen@kernel.org>, "Luke Nelson"
 <luke.r.nels@gmail.com>, "Xi Wang" <xi.wang@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, "Pu Lehui"
 <pulehui@huawei.com>, "Ilya Leoshkevich" <iii@linux.ibm.com>, "Heiko
 Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>, "David
 S . Miller" <davem@davemloft.net>, "Wang YanQing" <udknight@gmail.com>
Subject: Re: [PATCH bpf-next v12 4/5] bpf, x86: Emit ENDBR for indirect jump
 targets
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Xu Kuohai" <xukuohai@huaweicloud.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260403132811.753894-1-xukuohai@huaweicloud.com>
 <20260403132811.753894-5-xukuohai@huaweicloud.com>
In-Reply-To: <20260403132811.753894-5-xukuohai@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_194640_115434_1D58A5A4 
X-CRM114-Status: GOOD (  21.69  )
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

On Fri Apr 3, 2026 at 9:28 AM EDT, Xu Kuohai wrote:
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

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

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
> Reviewed-by: Anton Protopopov <a.s.protopopov@gmail.com>
> Acked-by: Leon Hwang <leon.hwang@linux.dev>
> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
> ---
>  arch/x86/net/bpf_jit_comp.c | 28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)
>
> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
> index 72d9a5faa230..ea9e707e8abf 100644
> --- a/arch/x86/net/bpf_jit_comp.c
> +++ b/arch/x86/net/bpf_jit_comp.c
> @@ -58,8 +58,8 @@ static u8 *emit_code(u8 *ptr, u32 bytes, unsigned int l=
en)
>  #define EMIT_ENDBR()		EMIT(gen_endbr(), 4)
>  #define EMIT_ENDBR_POISON()	EMIT(gen_endbr_poison(), 4)
>  #else
> -#define EMIT_ENDBR()
> -#define EMIT_ENDBR_POISON()
> +#define EMIT_ENDBR()		do { } while (0)
> +#define EMIT_ENDBR_POISON()	do { } while (0)
>  #endif
> =20
>  static bool is_imm8(int value)
> @@ -1649,8 +1649,8 @@ static int emit_spectre_bhb_barrier(u8 **pprog, u8 =
*ip,
>  	return 0;
>  }
> =20
> -static int do_jit(struct bpf_prog *bpf_prog, int *addrs, u8 *image, u8 *=
rw_image,
> -		  int oldproglen, struct jit_context *ctx, bool jmp_padding)
> +static int do_jit(struct bpf_verifier_env *env, struct bpf_prog *bpf_pro=
g, int *addrs, u8 *image,
> +		  u8 *rw_image, int oldproglen, struct jit_context *ctx, bool jmp_padd=
ing)
>  {
>  	bool tail_call_reachable =3D bpf_prog->aux->tail_call_reachable;
>  	struct bpf_insn *insn =3D bpf_prog->insnsi;
> @@ -1663,7 +1663,7 @@ static int do_jit(struct bpf_prog *bpf_prog, int *a=
ddrs, u8 *image, u8 *rw_image
>  	void __percpu *priv_stack_ptr;
>  	int i, excnt =3D 0;
>  	int ilen, proglen =3D 0;
> -	u8 *prog =3D temp;
> +	u8 *ip, *prog =3D temp;
>  	u32 stack_depth;
>  	int err;
> =20
> @@ -1734,6 +1734,11 @@ static int do_jit(struct bpf_prog *bpf_prog, int *=
addrs, u8 *image, u8 *rw_image
>  				dst_reg =3D X86_REG_R9;
>  		}
> =20
> +		if (bpf_insn_is_indirect_target(env, bpf_prog, i - 1))
> +			EMIT_ENDBR();
> +
> +		ip =3D image + addrs[i - 1] + (prog - temp);
> +
>  		switch (insn->code) {
>  			/* ALU */
>  		case BPF_ALU | BPF_ADD | BPF_X:
> @@ -2440,8 +2445,6 @@ st:			if (is_imm8(insn->off))
> =20
>  			/* call */
>  		case BPF_JMP | BPF_CALL: {
> -			u8 *ip =3D image + addrs[i - 1];
> -
>  			func =3D (u8 *) __bpf_call_base + imm32;
>  			if (src_reg =3D=3D BPF_PSEUDO_CALL && tail_call_reachable) {
>  				LOAD_TAIL_CALL_CNT_PTR(stack_depth);
> @@ -2465,7 +2468,8 @@ st:			if (is_imm8(insn->off))
>  			if (imm32)
>  				emit_bpf_tail_call_direct(bpf_prog,
>  							  &bpf_prog->aux->poke_tab[imm32 - 1],
> -							  &prog, image + addrs[i - 1],
> +							  &prog,
> +							  ip,
>  							  callee_regs_used,
>  							  stack_depth,
>  							  ctx);
> @@ -2474,7 +2478,7 @@ st:			if (is_imm8(insn->off))
>  							    &prog,
>  							    callee_regs_used,
>  							    stack_depth,
> -							    image + addrs[i - 1],
> +							    ip,
>  							    ctx);
>  			break;
> =20
> @@ -2639,7 +2643,7 @@ st:			if (is_imm8(insn->off))
>  			break;
> =20
>  		case BPF_JMP | BPF_JA | BPF_X:
> -			emit_indirect_jump(&prog, insn->dst_reg, image + addrs[i - 1]);
> +			emit_indirect_jump(&prog, insn->dst_reg, ip);
>  			break;
>  		case BPF_JMP | BPF_JA:
>  		case BPF_JMP32 | BPF_JA:
> @@ -2729,8 +2733,6 @@ st:			if (is_imm8(insn->off))
>  			ctx->cleanup_addr =3D proglen;
>  			if (bpf_prog_was_classic(bpf_prog) &&
>  			    !ns_capable_noaudit(&init_user_ns, CAP_SYS_ADMIN)) {
> -				u8 *ip =3D image + addrs[i - 1];
> -
>  				if (emit_spectre_bhb_barrier(&prog, ip, bpf_prog))
>  					return -EINVAL;
>  			}
> @@ -3791,7 +3793,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_ver=
ifier_env *env, struct bpf_pr
>  	for (pass =3D 0; pass < MAX_PASSES || image; pass++) {
>  		if (!padding && pass >=3D PADDING_PASSES)
>  			padding =3D true;
> -		proglen =3D do_jit(prog, addrs, image, rw_image, oldproglen, &ctx, pad=
ding);
> +		proglen =3D do_jit(env, prog, addrs, image, rw_image, oldproglen, &ctx=
, padding);
>  		if (proglen <=3D 0) {
>  out_image:
>  			image =3D NULL;


