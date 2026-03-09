Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BABFF4180F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 16:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EdpDN3cbR4Vo18mFgfjtOYOZ0BTO5Hn4GNbDEChr/aA=; b=yQiNYXmyrgkMp3nre8q1ijQnqh
	BRpuWAvWIV8ICHI+1XwyOe/YyfJo6sXsn0EFReX+0afke6mCdtp8NcKq6mzFu2/sd9loaRyEY01WC
	afZt/4VsUKo1xhUwU9d2f3IDayQJBHXZvPMAc/fPEKwS6yT3afpjLxCyH7pKw1S/3J/Jan++E56G9
	TzvGxeNzK+zKZnk5xJGh4XM9wG+qcY2g+/SSeKlHkli5dgps00S+GEdrIecTmrDrUb8kZJxwOIlLw
	1jsV65ZV0gBdNqWuAhKOvNwUygwMQaUxt42REbYJuORlLSCQ+HGOWBaVYVFBYcCUCe/Fr1o0diKw5
	dFdr6+8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdUd-00000007jck-3HEv;
	Mon, 09 Mar 2026 16:30:07 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdUb-00000007jc5-1YSL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 16:30:06 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-439c4bde55cso4189826f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 09:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773073803; x=1773678603; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EdpDN3cbR4Vo18mFgfjtOYOZ0BTO5Hn4GNbDEChr/aA=;
        b=fHELXoRgoAwvAAOxUwKGSEavs+V2Vs4KAtS55X6/7zQqP9bcuKuLvTVau8SVeSLxPL
         JzKDkhpYQXKY2WIPko4rR9MwWfi3WjsrB7K6/rcWyO81v+6huee55F3DCtSwzfaB1xpq
         SbUJ09loLMVTPECvxDVgSmSHqvaQrA5UOYHPFN/cmv5wDS2IqrMpnPFdA1eNrFIS3/eQ
         Z0vQOd2/W8jgB+OkCKHxFsL7BeHu5qXuqmhnVFS0OKzhOwTDYyA/MKUXYVx6Unjij2NH
         9LDbEe2SMEmZ2jCLs479v7rN7zD44wQZywVty19LW4IHJYN8Me76n6etjtDecWBuHoNB
         zHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773073803; x=1773678603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EdpDN3cbR4Vo18mFgfjtOYOZ0BTO5Hn4GNbDEChr/aA=;
        b=KV3J5y/JHwjX5SsWoWw/WBMbBA5A5cAmTMTU9PmJGyBwPX4oeGDsF0TEqp9mRxHJDg
         8R86k7tpicx+Y/naXRlEbwudkf2FplyasJ/4u5zuWBgK4XaP+m+gi4RRxuhgtDfIZoty
         bRSAUDyVKGBmDAsg0RuktQxLmiPPhF1Gnr2DUa2VlXu9P4ySU4P5kIW3B6hVqDfrRM7s
         S5WdlDhX5ZNCQimhuVufwRsT94JPd9WRW9lsuBR85WuADO3qX5VGSicqJWKdK63a9Ei/
         fRqB5jRibVK4RrK4U2hWTdWEi4mE79tT0Ex3E+RSJ5uz5zQS2PkcENzqTuUuksre6WXu
         Qy9g==
X-Forwarded-Encrypted: i=1; AJvYcCUT9hbiUr9xHC/Zq3H1W/ATh/ieQnaS0yu0H195SkrpWWqzFZHOlsm3I0gzmnIlMGZrd8/Wz7YBnCknsA3rPiDt@lists.infradead.org
X-Gm-Message-State: AOJu0YyPudx5LDBnCZIKIaisyius8Q/ecRPaGndVZ8CUkFaWdxkumtl/
	DNZRBcRJtr8icDGGMey/ZBEC421q11brVvmCy3w1h7YPk4IJ7PgI2lYJ
X-Gm-Gg: ATEYQzx1KKNKiL6PqS6QZqqvwcbrLYwPzfcI3eB/4MSzzEGFqL9Ml9uoT2Gs1ZGZzEs
	9J2EdI3aecLsZxZ8Ittkjdc1nclRXBpct9q+ovhb5QFGHJecNCBcwbWDvDlBZVNH6qC6HiBZ6ZX
	L7PhCAEKpmiLEcINsvbee2SkaV2ypqI68rx2d/Prj14O21bDQKSOZer475tJHbsUaHdFB+E4I+/
	LbRgWrByFsKbwS/peZ0Jo0cryOAXSztUtPFAPLO6YyYTC3qG5HFA0tXvjQz87ZDCV7jyuBK3keC
	iv99/XBNLdIFH5PWL4t+B3beI53ACFuNjB9ya8njtt2GdS2WFLhQWeyIxkmNMfAiVOzcDEsE3Sb
	tu6z2PgtGEZ+ODSN22X8jYsSbOB+l/iHfKYRHT7NPizzINnTUrisL7d6mseBp2b8vi4BIW9L6ak
	zmrC/R+Id/wk2VgxNKBne5PVEDn/bSUxl8
X-Received: by 2002:a05:6000:1a8b:b0:430:f790:99d7 with SMTP id ffacd0b85a97d-439da35f669mr21060331f8f.27.1773073803043;
        Mon, 09 Mar 2026 09:30:03 -0700 (PDT)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d95dsm30173171f8f.7.2026.03.09.09.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 09:30:02 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:38:21 +0000
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
Subject: Re: [bpf-next v8 5/5] bpf, arm64: Emit BTI for indirect jump target
Message-ID: <aa73feA0wPDNmZLC@mail.gmail.com>
References: <20260309140044.2652538-1-xukuohai@huaweicloud.com>
 <20260309140044.2652538-6-xukuohai@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309140044.2652538-6-xukuohai@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_093005_438964_F94DA7E6 
X-CRM114-Status: GOOD (  21.20  )
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
> On CPUs that support BTI, the indirect jump selftest triggers a kernel
> panic because there is no BTI instructions at the indirect jump targets.
> 
> Fix it by emitting a BTI instruction for each indirect jump target.
> 
> For reference, below is a sample panic log.
> 
> Internal error: Oops - BTI: 0000000036000003 [#1]  SMP
> ...
> Call trace:
>  bpf_prog_2e5f1c71c13ac3e0_big_jump_table+0x54/0xf8 (P)
>  bpf_prog_run_pin_on_cpu+0x140/0x468
>  bpf_prog_test_run_syscall+0x280/0x3b8
>  bpf_prog_test_run+0x22c/0x2c0
> 
> Fixes: f4a66cf1cb14 ("bpf: arm64: Add support for indirect jumps")
> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
> ---
>  arch/arm64/net/bpf_jit_comp.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
> index 5c785eab4b5a..036ad607720a 100644
> --- a/arch/arm64/net/bpf_jit_comp.c
> +++ b/arch/arm64/net/bpf_jit_comp.c
> @@ -1198,8 +1198,8 @@ static int add_exception_handler(const struct bpf_insn *insn,
>   * >0 - successfully JITed a 16-byte eBPF instruction.
>   * <0 - failed to JIT.
>   */
> -static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx,
> -		      bool extra_pass)
> +static int build_insn(const struct bpf_verifier_env *env, const struct bpf_insn *insn,
> +		      struct jit_ctx *ctx, bool extra_pass)
>  {
>  	const u8 code = insn->code;
>  	u8 dst = bpf2a64[insn->dst_reg];
> @@ -1224,6 +1224,9 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx,
>  	int ret;
>  	bool sign_extend;
>  
> +	if (bpf_insn_is_indirect_target(env, ctx->prog, i))
> +		emit_bti(A64_BTI_J, ctx);
> +
>  	switch (code) {
>  	/* dst = src */
>  	case BPF_ALU | BPF_MOV | BPF_X:
> @@ -1899,7 +1902,7 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx,
>  	return 0;
>  }
>  
> -static int build_body(struct jit_ctx *ctx, bool extra_pass)
> +static int build_body(struct bpf_verifier_env *env, struct jit_ctx *ctx, bool extra_pass)
>  {
>  	const struct bpf_prog *prog = ctx->prog;
>  	int i;
> @@ -1918,7 +1921,7 @@ static int build_body(struct jit_ctx *ctx, bool extra_pass)
>  		int ret;
>  
>  		ctx->offset[i] = ctx->idx;
> -		ret = build_insn(insn, ctx, extra_pass);
> +		ret = build_insn(env, insn, ctx, extra_pass);
>  		if (ret > 0) {
>  			i++;
>  			ctx->offset[i] = ctx->idx;
> @@ -2086,7 +2089,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
>  	if (build_prologue(&ctx, was_classic))
>  		goto out_off;
>  
> -	if (build_body(&ctx, extra_pass))
> +	if (build_body(env, &ctx, extra_pass))
>  		goto out_off;
>  
>  	ctx.epilogue_offset = ctx.idx;
> @@ -2134,7 +2137,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
>  	/* Dont write body instructions to memory for now */
>  	ctx.write = false;
>  
> -	if (build_body(&ctx, extra_pass))
> +	if (build_body(env, &ctx, extra_pass))
>  		goto out_free_hdr;
>  
>  	ctx.epilogue_offset = ctx.idx;
> @@ -2143,7 +2146,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
>  	ctx.write = true;
>  
>  	/* Pass 3: Adjust jump offset and write final image */
> -	if (build_body(&ctx, extra_pass) ||
> +	if (build_body(env, &ctx, extra_pass) ||
>  		WARN_ON_ONCE(ctx.idx != ctx.epilogue_offset))
>  		goto out_free_hdr;
>  
> -- 
> 2.47.3
> 

Reviewed-by: Anton Protopopov <a.s.protopopov@gmail.com>

