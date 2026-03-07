Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A674EFC9EC4
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 01:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtY9eIv1n6grxyELFx6qGVbBb/3PRRrubL9WWOp8eJ4=; b=1mr9s/AB+YQZZ19JzTFjI5FwHh
	v/aMWG9rNLtKff7vJNZ4olHc7QXOBl3yfJn3gzUS5gnFyGHgIYjShpaF4sI3ZhbiM0+s0ch7AhzRS
	WC3gW6Dd82Fbjgij2ZXUYxPQbrOH278+4c3n5A9yYEsKw0V2AhnyKxCkJiV+04mVIcVKdKkOxgjBR
	Hm2xNTU0N4xFWZYjIt8KVi34hk4Ey0ePAS9g4LVJt6q2wQUhmkiFT884Z4gizA4VBFi8AWjNEODRm
	wJBrfz6iZrPmtNh6VlZxLXTkjMcl0E4x1J/MLE0ykNO4IPx1z13hW4I61ZCKclHZhUGK4XGvUv2yy
	r3yYHtkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vygam-00000004mVq-4Am4;
	Sat, 07 Mar 2026 01:36:33 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vygak-00000004mVV-391M
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 01:36:31 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2ae4d919f9bso38151705ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 17:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772847389; x=1773452189; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jtY9eIv1n6grxyELFx6qGVbBb/3PRRrubL9WWOp8eJ4=;
        b=JkgggcOmekhaz2T/pQV/ucgA2bXtIcCKNY53uQdNJy9x71TD4XiF9om9zpIKv0jYp6
         vYJ7upeV147x5VfO8qZGJ0H/hPXYAc85wFDzTBu5DJer6uZr206lo4+moxR82Qhn3LMd
         oSHan/J7XBDH+lH3FHoWTHojAwcM9xd7dFDF7wU6nGk8OJJTs49exB8SkuZWjgfdySGH
         R81LjPQZHTu8k0MgK1Pg323gIYAtQq1GYQ2uEPW5wJxzVv/eE3jZMLyYHZvvVJ9KShxk
         h+ryPwoeoNK5ZKVxSOOayupdynB1/SVetmPUUWUuvSVLx0628XXL5rCcI0Fm70/G+Y4n
         C1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772847389; x=1773452189;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jtY9eIv1n6grxyELFx6qGVbBb/3PRRrubL9WWOp8eJ4=;
        b=CMV262pCgVWx5ifIG+q1d7lIul0BI1ZuN/9BQHx0sZ0Ay4C8iUOJUgvIpuVQK4Qar6
         Th04vf27J+ZIMYEXFVyss6KCTwgiZMv+3JzFXTXXFQhrgG2EhUsYYfW5qQJUoJpNe725
         ZwR3a4nnOVEGwaPrhAMPDXoxsd6DqtKegv8HNsf8m5UGxY4OFFK9Ux8rmJvDgQ9o65eZ
         Yp0a8uuxa7YwoDqQVy8VQ+GJ193Cxd7wflgMJiz3cKMRbLFNU2PjVF5mHup1vkctKU+4
         A5JkAkDhXhRhrq/U0DBOj2GgZeJMBvFSeGzd2k2KeiYevAvCA+cTQVBOfurTwU9NTDTw
         jYAg==
X-Forwarded-Encrypted: i=1; AJvYcCUa1VDQX9W8SaTU6p3vjjiU6jn44LhqkE9tdYGGZhfKqWrslY8dq5Z+gxQ+Txk2vAKIRUpnu7GoBWKK9AYOJrkG@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0HIh1IHIbZUDEOeBUZB7iJt7hRINKdQI4+0QkpJPao6tJD9NG
	xWdRk2kldiAqL5/uzSM/dGZkYbGK0d25+Ya3BH84uHR48BboKeRH6dgH
X-Gm-Gg: ATEYQzzvGi8dhmdpZUBjYT5nF4M71IDyvHmojN8ESyWZqXDeT1VWtkwnpKbxIMoWhlz
	lLzHrRnDx9HDxyBZSj8b3TMgG0q9Q5qLBCOCbnO2rwe5YCIfmW1RmuXb8Oe+qZKbFtEGJfBwBEe
	VbbNnHoDZdR5S+zvQxsbsYIIy5cTzpMSvOaWnkll2DUHX3kRzCOGOyFWYdi+AHROE/Zf8h4FLrR
	0iHjGJgJ1aOSVWX2nyR4jsua9bXD65/kQTb2wdi3xGlZB721fZxok4SKtQnXJWgjeNqVFLf6zii
	mFsreu6GJK25cKDQzwW7/OQxhNJAErT8AS7TW2KGy+Tk52acuIUUhx9JtYbGnWDzAupZX44ytkf
	/xDrWOPFXm9eHgrQsrMs+1WcVK1EnZziVQhdsg1DHebqW9bD236cEaw490FSfFmnuD6iCsa/QSW
	3+/yOrgqi6XvNuXpeifvfW4LBnugnMKGmbZqlFdd7TRQNvCHqK1I2QJzcKrpRqTgk43z722RTpn
	vIAMdP5W8ySdIzBzk+lUAbISuRfWtM=
X-Received: by 2002:a17:903:388f:b0:2ae:50a3:3aa5 with SMTP id d9443c01a7336-2ae824879a7mr43068715ad.52.1772847389159;
        Fri, 06 Mar 2026 17:36:29 -0800 (PST)
Received: from ?IPv6:2605:8d80:58a0:ac1f:d4e0:c92d:83b9:f4f5? ([2605:8d80:58a0:ac1f:d4e0:c92d:83b9:f4f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83eada11sm33195185ad.38.2026.03.06.17.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 17:36:28 -0800 (PST)
Message-ID: <c79adbee77ba5ce11d3df1ffa922c48937c8b536.camel@gmail.com>
Subject: Re: [bpf-next v6 4/5] bpf, x86: Emit ENDBR for indirect jump targets
From: Eduard Zingerman <eddyz87@gmail.com>
To: Xu Kuohai <xukuohai@huaweicloud.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Yonghong Song	 <yonghong.song@linux.dev>,
 Puranjay Mohan <puranjay@kernel.org>, Anton Protopopov
 <a.s.protopopov@gmail.com>, Shahab Vahedi <list+bpf@vahedi.org>, Russell
 King	 <linux@armlinux.org.uk>, Tiezhu Yang <yangtiezhu@loongson.cn>, Hengqi
 Chen	 <hengqi.chen@gmail.com>, Johan Almbladh
 <johan.almbladh@anyfinetworks.com>,  Paul Burton <paulburton@kernel.org>,
 Hari Bathini <hbathini@linux.ibm.com>, Christophe Leroy	
 <chleroy@kernel.org>, Naveen N Rao <naveen@kernel.org>, Luke Nelson	
 <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?=	 <bjorn@kernel.org>, Pu Lehui
 <pulehui@huawei.com>, Ilya Leoshkevich	 <iii@linux.ibm.com>, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik	 <gor@linux.ibm.com>, "David S . Miller"
 <davem@davemloft.net>, Wang YanQing	 <udknight@gmail.com>
Date: Fri, 06 Mar 2026 17:36:21 -0800
In-Reply-To: <20260306102329.2056216-5-xukuohai@huaweicloud.com>
References: <20260306102329.2056216-1-xukuohai@huaweicloud.com>
	 <20260306102329.2056216-5-xukuohai@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_173630_799825_1A238218 
X-CRM114-Status: GOOD (  21.27  )
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

On Fri, 2026-03-06 at 18:23 +0800, Xu Kuohai wrote:
> From: Xu Kuohai <xukuohai@huawei.com>
>=20
> On CPUs that support CET/IBT, the indirect jump selftest triggers
> a kernel panic because the indirect jump targets lack ENDBR
> instructions.
>=20
> To fix it, emit an ENDBR instruction to each indirect jump target. Since
> the ENDBR instruction shifts the position of original jited instructions,
> fix the instruction address calculation wherever the addresses are used.
>=20
> For reference, below is a sample panic log.
>=20
>  Missing ENDBR: bpf_prog_2e5f1c71c13ac3e0_big_jump_table+0x97/0xe1
>  ------------[ cut here ]------------
>  kernel BUG at arch/x86/kernel/cet.c:133!
>  Oops: invalid opcode: 0000 [#1] SMP NOPTI
>=20
>  ...
>=20
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
>=20
> Fixes: 493d9e0d6083 ("bpf, x86: add support for indirect jumps")
> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
> ---
>  arch/x86/net/bpf_jit_comp.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
> index 2c57ee446fc9..752331a64fc0 100644
> --- a/arch/x86/net/bpf_jit_comp.c
> +++ b/arch/x86/net/bpf_jit_comp.c
> @@ -1658,8 +1658,8 @@ static int emit_spectre_bhb_barrier(u8 **pprog, u8 =
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
> @@ -1743,6 +1743,11 @@ static int do_jit(struct bpf_prog *bpf_prog, int *=
addrs, u8 *image, u8 *rw_image
>  				dst_reg =3D X86_REG_R9;
>  		}
> =20
> +#ifdef CONFIG_X86_KERNEL_IBT
> +		if (bpf_insn_is_indirect_target(env, bpf_prog, i - 1))
> +			EMIT_ENDBR();
> +#endif
> +
>  		switch (insn->code) {
>  			/* ALU */
>  		case BPF_ALU | BPF_ADD | BPF_X:
> @@ -2449,7 +2454,7 @@ st:			if (is_imm8(insn->off))
> =20
>  			/* call */
>  		case BPF_JMP | BPF_CALL: {
> -			u8 *ip =3D image + addrs[i - 1];
> +			u8 *ip =3D image + addrs[i - 1] + (prog - temp);

Sorry, meant to reply to v5 but got distracted.
It seems tedious/error prone to have this addend at each location,
would it be possible to move the 'ip' variable calculation outside
of the switch? It appears that at each point there would be no
EMIT invocations between 'ip' computation and usage.

> =20
>  			func =3D (u8 *) __bpf_call_base + imm32;
>  			if (src_reg =3D=3D BPF_PSEUDO_CALL && tail_call_reachable) {
> @@ -2474,7 +2479,8 @@ st:			if (is_imm8(insn->off))
>  			if (imm32)
>  				emit_bpf_tail_call_direct(bpf_prog,
>  							  &bpf_prog->aux->poke_tab[imm32 - 1],
> -							  &prog, image + addrs[i - 1],
> +							  &prog,
> +							  image + addrs[i - 1] + (prog - temp),
>  							  callee_regs_used,
>  							  stack_depth,
>  							  ctx);
> @@ -2483,7 +2489,7 @@ st:			if (is_imm8(insn->off))
>  							    &prog,
>  							    callee_regs_used,
>  							    stack_depth,
> -							    image + addrs[i - 1],
> +							    image + addrs[i - 1] + (prog - temp),
>  							    ctx);
>  			break;
> =20
> @@ -2648,7 +2654,8 @@ st:			if (is_imm8(insn->off))
>  			break;
> =20
>  		case BPF_JMP | BPF_JA | BPF_X:
> -			emit_indirect_jump(&prog, insn->dst_reg, image + addrs[i - 1]);
> +			emit_indirect_jump(&prog, insn->dst_reg,
> +					   image + addrs[i - 1] + (prog - temp));
>  			break;
>  		case BPF_JMP | BPF_JA:
>  		case BPF_JMP32 | BPF_JA:
> @@ -2738,7 +2745,7 @@ st:			if (is_imm8(insn->off))
>  			ctx->cleanup_addr =3D proglen;
>  			if (bpf_prog_was_classic(bpf_prog) &&
>  			    !ns_capable_noaudit(&init_user_ns, CAP_SYS_ADMIN)) {
> -				u8 *ip =3D image + addrs[i - 1];
> +				u8 *ip =3D image + addrs[i - 1] + (prog - temp);
> =20
>  				if (emit_spectre_bhb_barrier(&prog, ip, bpf_prog))
>  					return -EINVAL;
> @@ -3800,7 +3807,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_ver=
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

