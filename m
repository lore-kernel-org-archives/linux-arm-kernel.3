Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E00D730AD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 18:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUEap9ZtLAOWWOdMbJTcGPlnUuslrijse69P0jdZIjA=; b=YgyZnOdopbFkyzTiaApokUWOsX
	gsZKwVgRqBk34VoewuAaKf1RFUYmAcM/WRqYitAlyynuLCfuVRzW63ftAv0FfSs9lZEZoqddeZ3q5
	42sGVwPzZeRLr+iF4t2wQNFvuEG1l+F2MDW9bGylozkmQW1ZRKzejgSbN6tP38RpyMyZUqh/tUkpl
	aawusQ3YQ2+xFPhdvs+HTczoc0nKWjR3OGHPtWwC/ljSz9yRycTa79b32N70vZyPGSBKn9uV70CW7
	fCuJXYJvwCWMT3gM6dLlRfiZ+8Ud8xNhGhBXRNIyp5LBa3eKyvGwiXVf4IoWytBgjkxJ/N4WR7G/T
	ZH//cIvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8jgb-00000002SWB-08T4;
	Fri, 03 Apr 2026 18:56:05 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8jgY-00000002SVZ-3DOl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 18:56:03 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2b2503753efso17706235ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 11:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1775242562; x=1775847362; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUEap9ZtLAOWWOdMbJTcGPlnUuslrijse69P0jdZIjA=;
        b=fiUg/LAhuDYLR8ZQXrtePICHpU1wMoMVnkgvEMK3u7GyG7xVcD9q5jTn6iQ6mooEyC
         H+LPBsPuRQjZDlPulejoC+45AvtvrT0f3IuKwcF6WlCB8wjTKaDUEvgnXT6SlJ6e4TUp
         tWV2abCdAs6iO7TwKNUVCt9wuhXGd8pyctorkQOYMREn43PFSm55W1xD2ZRwreTa+Otv
         rv9mQQeiEUemO3p+X6Q9EM7KJjpEIF/LroC+RiSVes+tseHyw0lNNzsx4uiPpIJrxPA6
         5Wmt1N8xqaA9tofsVYwJ56N5/K0zJu9onp9zYmmb+cNr1e3N+7kE+q6Ma+81zTZm7HQB
         XBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775242562; x=1775847362;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aUEap9ZtLAOWWOdMbJTcGPlnUuslrijse69P0jdZIjA=;
        b=TtU4N2RzmuzGXlBuupkHmDLqkjqLMUpS/XTJcVKlIVrX7kUItpnrsLu/Hue1DcpF1l
         V9CXklPaCuVH7wAZyGPKC32CiUAwppN8Ys3zJTXZTpHFwz/pa4gOaGPqd5BoF8LMUaNi
         4tYjF8cuaggUqSVY/oTnBk3KLcDMT2ygaifUWKiLLuldBM2HKXeAxDPbPi4OwGbnUwbi
         BqTu1PfSPx9MmzOIG3zMQoupG6gG7kWEGfAX2hOFQiyI1uT5ffUb/NfEVjJZNX+3xPif
         X2x4uBNonHiufZW4nVf/cex83owM0meLWL+CYLjP4K2t4qJFWwf53Kt87qce8iIFvq8f
         n/Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWGrmi33JAKQGHF4KCdttXOjK6TrB3SRARGmpx/zT3Cu/WpTR3J/hjy0or1XtVf07ft/y1F0+lB7ra/zpxp0QcQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4Nxtilbz0oE78/vCtcAZMV1NfWhOtknQdWNhkU3bpZ5BQvY+t
	5+nd3jrmqeQWnWg14ov04/NB8W/IP1n9Nab/T+UCAYOjA2AmoQVC2itDK16EBH/l8h4=
X-Gm-Gg: AeBDiesBSswCVWJi+NdIvupsNaYQPNlFddjgk0CncZNoeaetfl2xvGannFCj3e4LqKA
	saUgTmShH2gvCgG7WMaSLK/UzQoj3IkP5X7MSUARW9TCaFxLhJhPcYLZms3TwPZZl/0Up8OfaU/
	q3BYWORJWWpp7VuzrCjjfPJks/PXNUHNzdtFZZMhHvlabBa86ktZrXb82U3KczyobytcpvaQG2q
	x4jaKUeZW14eokd+ekz3Ys2XmGSBBXApoQSbm/H8YIG5oSngSMZlWI1aWyAi8c/zsSdEDuSNzF1
	7O0onr8cvVrbfsdzQYlYIUNpdy5ByrmFkew6FcU2PBbE5zbJcyyWHSZYyxYtvwvZZhZlHbp4KjR
	fgZtWk9KMO8mrWbTC3hy1SfZ0XLrmkvnDQjD5dMIH8KREEHXhO0WksljFV52TVIKSYR/l8FOE3E
	6c2jn+DLM=
X-Received: by 2002:a17:902:e78c:b0:2ae:c916:511 with SMTP id d9443c01a7336-2b2819173d3mr42659205ad.24.1775242561526;
        Fri, 03 Apr 2026 11:56:01 -0700 (PDT)
Received: from localhost ([2604:3d08:487d:cd00::5517])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27475ff56sm63177805ad.22.2026.04.03.11.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 11:56:01 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Apr 2026 14:56:00 -0400
Message-Id: <DHJQYTHUJH8L.2757EBVNFL6PZ@etsalapatis.com>
Subject: Re: [PATCH bpf-next v12 5/5] bpf, arm64: Emit BTI for indirect jump
 target
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Xu Kuohai" <xukuohai@huaweicloud.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
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
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260403132811.753894-1-xukuohai@huaweicloud.com>
 <20260403132811.753894-6-xukuohai@huaweicloud.com>
In-Reply-To: <20260403132811.753894-6-xukuohai@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_115602_819127_B63F0A29 
X-CRM114-Status: GOOD (  19.32  )
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
> On CPUs that support BTI, the indirect jump selftest triggers a kernel
> panic because there is no BTI instructions at the indirect jump targets.
>
> Fix it by emitting a BTI instruction for each indirect jump target.
>
> For reference, below is a sample panic log.
>
> Internal error: Oops - BTI: 0000000036000003 [#1]  SMP

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

> ...
> Call trace:
>  bpf_prog_2e5f1c71c13ac3e0_big_jump_table+0x54/0xf8 (P)
>  bpf_prog_run_pin_on_cpu+0x140/0x468
>  bpf_prog_test_run_syscall+0x280/0x3b8
>  bpf_prog_test_run+0x22c/0x2c0
>
> Fixes: f4a66cf1cb14 ("bpf: arm64: Add support for indirect jumps")
> Reviewed-by: Anton Protopopov <a.s.protopopov@gmail.com>
> Acked-by: Leon Hwang <leon.hwang@linux.dev>
> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
> ---
>  arch/arm64/net/bpf_jit_comp.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.=
c
> index 7212ec89dfe3..aa5cd240cdda 100644
> --- a/arch/arm64/net/bpf_jit_comp.c
> +++ b/arch/arm64/net/bpf_jit_comp.c
> @@ -1198,8 +1198,8 @@ static int add_exception_handler(const struct bpf_i=
nsn *insn,
>   * >0 - successfully JITed a 16-byte eBPF instruction.
>   * <0 - failed to JIT.
>   */
> -static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx,
> -		      bool extra_pass)
> +static int build_insn(const struct bpf_verifier_env *env, const struct b=
pf_insn *insn,
> +		      struct jit_ctx *ctx, bool extra_pass)
>  {
>  	const u8 code =3D insn->code;
>  	u8 dst =3D bpf2a64[insn->dst_reg];
> @@ -1224,6 +1224,9 @@ static int build_insn(const struct bpf_insn *insn, =
struct jit_ctx *ctx,
>  	int ret;
>  	bool sign_extend;
> =20
> +	if (bpf_insn_is_indirect_target(env, ctx->prog, i))
> +		emit_bti(A64_BTI_J, ctx);
> +
>  	switch (code) {
>  	/* dst =3D src */
>  	case BPF_ALU | BPF_MOV | BPF_X:
> @@ -1899,7 +1902,7 @@ static int build_insn(const struct bpf_insn *insn, =
struct jit_ctx *ctx,
>  	return 0;
>  }
> =20
> -static int build_body(struct jit_ctx *ctx, bool extra_pass)
> +static int build_body(struct bpf_verifier_env *env, struct jit_ctx *ctx,=
 bool extra_pass)
>  {
>  	const struct bpf_prog *prog =3D ctx->prog;
>  	int i;
> @@ -1918,7 +1921,7 @@ static int build_body(struct jit_ctx *ctx, bool ext=
ra_pass)
>  		int ret;
> =20
>  		ctx->offset[i] =3D ctx->idx;
> -		ret =3D build_insn(insn, ctx, extra_pass);
> +		ret =3D build_insn(env, insn, ctx, extra_pass);
>  		if (ret > 0) {
>  			i++;
>  			ctx->offset[i] =3D ctx->idx;
> @@ -2079,7 +2082,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_ver=
ifier_env *env, struct bpf_pr
>  	if (build_prologue(&ctx, was_classic))
>  		goto out_off;
> =20
> -	if (build_body(&ctx, extra_pass))
> +	if (build_body(env, &ctx, extra_pass))
>  		goto out_off;
> =20
>  	ctx.epilogue_offset =3D ctx.idx;
> @@ -2127,7 +2130,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_ver=
ifier_env *env, struct bpf_pr
>  	/* Dont write body instructions to memory for now */
>  	ctx.write =3D false;
> =20
> -	if (build_body(&ctx, extra_pass))
> +	if (build_body(env, &ctx, extra_pass))
>  		goto out_free_hdr;
> =20
>  	ctx.epilogue_offset =3D ctx.idx;
> @@ -2136,7 +2139,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_ver=
ifier_env *env, struct bpf_pr
>  	ctx.write =3D true;
> =20
>  	/* Pass 3: Adjust jump offset and write final image */
> -	if (build_body(&ctx, extra_pass) ||
> +	if (build_body(env, &ctx, extra_pass) ||
>  		WARN_ON_ONCE(ctx.idx !=3D ctx.epilogue_offset))
>  		goto out_free_hdr;
> =20


