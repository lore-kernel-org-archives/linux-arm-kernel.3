Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EC1F41807
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 16:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dOKbk0xRyosreLhFT5ZhCD+1ojKpzeBiFILf5YuIB6w=; b=c7rRkkuCXHo+wRO9QRaoBQBWL0
	8VdfwokbIh1xS4IeVnTdMpmqB2RTRqzzc0wUm+0aguoRgTGSsTXD1e6GkIsNX7F642dLqumTnHjS4
	3/QyWPEJW4EG9rxWzz3BSdolO0+deKbxxMr6sf7SKV/x2gt7jlj/7PgMWVfwNB3FTtNooqD+5tRln
	BocBkIUa12yWdDCPAKdP4gc3GbiwtwFr1bc02ZwnrijgcCP65ZsROfmu2IWCm/Apkey6kNpCbiYhX
	R9hmX3nkBPzNGSTuUCsWR7gR/jn6dhc12E0d2fVF6WTi7co3hsWUWpe4sey6xw9WP+TLzHSQ5g02K
	J6FkEv1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdmR-00000007l80-3ism;
	Mon, 09 Mar 2026 16:48:31 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdmO-00000007l7R-3CnK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 16:48:30 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-439b7c2788dso6071708f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 09:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773074907; x=1773679707; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dOKbk0xRyosreLhFT5ZhCD+1ojKpzeBiFILf5YuIB6w=;
        b=Z3/3/4eQrqWIcp1U7V61NhRtxBAOXlqie5clL/EasDyV6kvqK075uRAnLLu3i9hO2A
         5+bLtpSC4QxSo327Zve9Wl6UloH/f5VYU23Iqpo3tgxofbvrt8rIZp4Pi3GvDbm++edp
         fEVJHWB2ly+fC6Je+NbYIfA38LKFVIMEnpEjqnQuLgH5b0Ndd/RSpr61YarT8qPES2Lv
         s9lGf3y4vv/lHRpNAnv2VDElJQWm63Z/cIiQDGLRhT7IgQNgVx/wvJll2IrRakFjSVyI
         7rKzPxxpxLAEJhksxdVqQyf99zy1tUe9zkU7fj6tV7eqTYXSq7LI/ycpuVzGbdqWg779
         B8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773074907; x=1773679707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dOKbk0xRyosreLhFT5ZhCD+1ojKpzeBiFILf5YuIB6w=;
        b=eH06zk2LPUJgGuQWR2JcQ5wU7DCqLqUNHiJRCbWOHIsWYC5hLTmz+VybMCJ+2xeddS
         3u/aErLw2tTjgVKTlRhxMlPovdmR2LTCrkrs5TiVXqJ4c2526CTfSwLF0kscfCbmMyAQ
         QeuWUgJ2I4KIXIWb0fIEDyBp9aXl1cGO6NfODaEEKP2pMDQNzPqYmPftmhI6ClSxOjza
         w4KP8F7ZnXUP6RbXmvbi5ENX7deAOWVzyEXsJTV8mxl7mAuEEjBYLfkGY4eYrn3L+ReI
         WNlZeDDnGEeLWwYOthsss4yEvVuEvQcQmM2I3/x19B8pPKYRPEjpwKCC/wzpvVS0L7jd
         saOw==
X-Forwarded-Encrypted: i=1; AJvYcCWHcBkpdZXA9I/X8TY25HRNKSUVACX7yfTf2mtgtSD0dXUv2O8vyKbVoZTCoADINH+m3S05J3iAmW8R1RwnKAKM@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq3hLhjTSbXqDaNk1wfZxhW0ENN3qERXn/Mf4+2r9C7WSnjW0i
	MCcxbHqeaZI46sU8GbhFLTZKf0J3phlI3drlsZd5TGHgH3ihUhNPW/2v
X-Gm-Gg: ATEYQzwuOBVC7SfMzbFpkeGF4c4Bu7VtCv1fBEI9R3Ts2dG6e+j+tRzKk5bE2UgzzBe
	W3XP71nWMgkHjgGHbaCyF83sFlI8igxDb5K2v/4uU3BWD/OZwNyShijy5lv72GRRtrDglsv++/f
	dGDYfjArYCMJOHk+y237/QQyY1vB4FHlXXxzaqwqQFlptdPhp1n4JKkBHrt2WkR9QStniASFQjZ
	lrylf9SC6MwwtuVaYkCFRDSkJ7Fb0j+E4ze+rmyFLjyGW4D1TAZozSGjFbNsA6/3X1ABT6VfKFR
	8INzv6n63VmhG4HXADqb4gnapAQrgoQhS+IarIz+Swjvlq2gGZ2peHvx6IiWHTyaO0h4EjXlBjk
	2Dz0nCQMpZocpMtf8UtV/SGzQvZa8swo5Ss9AMl9rINRSGxTS5OLJRnkXTWnowbSXQtXW3MLeY6
	IfqOpautKb8PUgVuVY5/k5XHaPuO6ojZnA
X-Received: by 2002:a05:6000:25c4:b0:439:c1e2:9221 with SMTP id ffacd0b85a97d-439da86fa7emr20793677f8f.58.1773074906477;
        Mon, 09 Mar 2026 09:48:26 -0700 (PDT)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm31300975f8f.30.2026.03.09.09.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 09:48:25 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:56:58 +0000
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
Subject: Re: [bpf-next v8 2/5] bpf: Pass bpf_verifier_env to JIT
Message-ID: <aa772hrf7ibyWH5S@mail.gmail.com>
References: <20260309140044.2652538-1-xukuohai@huaweicloud.com>
 <20260309140044.2652538-3-xukuohai@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309140044.2652538-3-xukuohai@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_094828_952671_9A560B04 
X-CRM114-Status: GOOD (  26.16  )
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
> Pass bpf_verifier_env to bpf_int_jit_compile(). The follow-up patch will
> use env->insn_aux_data in the JIT stage to detect indirect jump targets.
> 
> Since bpf_prog_select_runtime() can be called by cbpf and test code
> without verifier, introduce helper function __bpf_prog_select_runtime()
> to accept the env parameter.
> 
> Remove the call to bpf_prog_select_runtime() in bpf_prog_load(), and
> switch to call __bpf_prog_select_runtime() in the verifier, with env
> variable passed. The original bpf_prog_select_runtime() is preserved for
> cbpf and test code, where env is NULL.
> 
> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
> ---
>  arch/arc/net/bpf_jit_core.c      | 17 ++++++++--------
>  arch/arm/net/bpf_jit_32.c        |  2 +-
>  arch/arm64/net/bpf_jit_comp.c    |  2 +-
>  arch/loongarch/net/bpf_jit.c     |  2 +-
>  arch/mips/net/bpf_jit_comp.c     |  2 +-
>  arch/parisc/net/bpf_jit_core.c   |  2 +-
>  arch/powerpc/net/bpf_jit_comp.c  |  2 +-
>  arch/riscv/net/bpf_jit_core.c    |  2 +-
>  arch/s390/net/bpf_jit_comp.c     |  2 +-
>  arch/sparc/net/bpf_jit_comp_64.c |  2 +-
>  arch/x86/net/bpf_jit_comp.c      |  2 +-
>  arch/x86/net/bpf_jit_comp32.c    |  2 +-
>  include/linux/filter.h           |  4 +++-
>  kernel/bpf/core.c                | 34 +++++++++++++++++++-------------
>  kernel/bpf/syscall.c             |  4 ----
>  kernel/bpf/verifier.c            |  8 ++++++--
>  16 files changed, 49 insertions(+), 40 deletions(-)
> 
> diff --git a/arch/arc/net/bpf_jit_core.c b/arch/arc/net/bpf_jit_core.c
> index 12facf5750da..cf708c308adb 100644
> --- a/arch/arc/net/bpf_jit_core.c
> +++ b/arch/arc/net/bpf_jit_core.c
> @@ -153,7 +153,8 @@ static void jit_dump(const struct jit_context *ctx)
>  }
>  
>  /* Initialise the context so there's no garbage. */
> -static int jit_ctx_init(struct jit_context *ctx, struct bpf_prog *prog)
> +static int jit_ctx_init(struct jit_context *ctx, struct bpf_verifier_env *env,
> +			struct bpf_prog *prog)
>  {
>  	memset(ctx, 0, sizeof(*ctx));
>  
> @@ -1317,7 +1318,7 @@ static int jit_patch_relocations(struct jit_context *ctx)
>   * to get the necessary data for the real compilation phase,
>   * jit_compile().
>   */
> -static struct bpf_prog *do_normal_pass(struct bpf_prog *prog)
> +static struct bpf_prog *do_normal_pass(struct bpf_verifier_env *env, struct bpf_prog *prog)
>  {
>  	struct jit_context ctx;
>  
> @@ -1325,7 +1326,7 @@ static struct bpf_prog *do_normal_pass(struct bpf_prog *prog)
>  	if (!prog->jit_requested)
>  		return prog;
>  
> -	if (jit_ctx_init(&ctx, prog)) {
> +	if (jit_ctx_init(&ctx, env, prog)) {
>  		jit_ctx_cleanup(&ctx);
>  		return prog;
>  	}
> @@ -1356,7 +1357,7 @@ static struct bpf_prog *do_normal_pass(struct bpf_prog *prog)
>   * again to get the newly translated addresses in order to resolve
>   * the "call"s.
>   */
> -static struct bpf_prog *do_extra_pass(struct bpf_prog *prog)
> +static struct bpf_prog *do_extra_pass(struct bpf_verifier_env *env, struct bpf_prog *prog)
>  {
>  	struct jit_context ctx;
>  
> @@ -1364,7 +1365,7 @@ static struct bpf_prog *do_extra_pass(struct bpf_prog *prog)
>  	if (check_jit_context(prog))
>  		return prog;
>  
> -	if (jit_ctx_init(&ctx, prog)) {
> +	if (jit_ctx_init(&ctx, env, prog)) {
>  		jit_ctx_cleanup(&ctx);
>  		return prog;
>  	}
> @@ -1393,15 +1394,15 @@ static struct bpf_prog *do_extra_pass(struct bpf_prog *prog)
>   * (re)locations involved that their addresses are not known
>   * during the first run.
>   */
> -struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
> +struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_prog *prog)
>  {
>  	vm_dump(prog);
>  
>  	/* Was this program already translated? */
>  	if (!prog->jited)
> -		return do_normal_pass(prog);
> +		return do_normal_pass(env, prog);
>  	else
> -		return do_extra_pass(prog);
> +		return do_extra_pass(env, prog);

Why is this necessary to pass env all the way through jit_ctx_init?
All below looks good, so minus the above:

Reviewed-by: Anton Protopopov <a.s.protopopov@gmail.com>

>  
>  	return prog;
>  }
> diff --git a/arch/arm/net/bpf_jit_32.c b/arch/arm/net/bpf_jit_32.c
> index e6b1bb2de627..1628b6fc70a4 100644
> --- a/arch/arm/net/bpf_jit_32.c
> +++ b/arch/arm/net/bpf_jit_32.c
> @@ -2142,7 +2142,7 @@ bool bpf_jit_needs_zext(void)
>  	return true;
>  }
>  
> -struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
> +struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_prog *prog)
>  {
>  	struct bpf_binary_header *header;
>  	struct jit_ctx ctx;
> diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
> index 566809be4a02..5c785eab4b5a 100644
> --- a/arch/arm64/net/bpf_jit_comp.c
> +++ b/arch/arm64/net/bpf_jit_comp.c
> @@ -2013,7 +2013,7 @@ static void clear_jit_state(struct bpf_prog *prog)
>  	prog->jited_len = 0;
>  }
>  
> -struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
> +struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_prog *prog)
>  {
>  	int image_size, prog_size, extable_size, extable_align, extable_offset;
>  	struct bpf_binary_header *header;
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index 57dd24d53c77..0ac69bac9d3c 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -1909,7 +1909,7 @@ int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
>  	return ret < 0 ? ret : ret * LOONGARCH_INSN_SIZE;
>  }
>  
> -struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
> +struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_prog *prog)
>  {
>  	bool extra_pass = false;
>  	u8 *image_ptr, *ro_image_ptr;
> diff --git a/arch/mips/net/bpf_jit_comp.c b/arch/mips/net/bpf_jit_comp.c
> index d2b6c955f18e..6ee4abe6a1f7 100644
> --- a/arch/mips/net/bpf_jit_comp.c
> +++ b/arch/mips/net/bpf_jit_comp.c
> @@ -909,7 +909,7 @@ bool bpf_jit_needs_zext(void)
>  	return true;
>  }
>  
> -struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
> +struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_prog *prog)
>  {
>  	struct bpf_binary_header *header = NULL;
>  	struct jit_context ctx;
> diff --git a/arch/parisc/net/bpf_jit_core.c b/arch/parisc/net/bpf_jit_core.c
> index 4d339636a34a..90d081734d0f 100644
> --- a/arch/parisc/net/bpf_jit_core.c
> +++ b/arch/parisc/net/bpf_jit_core.c
> @@ -41,7 +41,7 @@ bool bpf_jit_needs_zext(void)
>  	return true;
>  }
>  
> -struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
> +struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_prog *prog)
>  {
>  	unsigned int prog_size = 0, extable_size = 0;
>  	bool extra_pass = false;
> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
> index 7a7c49640a2f..a6fd7ef249da 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -129,7 +129,7 @@ bool bpf_jit_needs_zext(void)
>  	return true;
>  }
>  
> -struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
> +struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_prog *fp)
>  {
>  	u32 proglen;
>  	u32 alloclen;
> diff --git a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.c
> index c77e8aba14d3..bffaf584226c 100644
> --- a/arch/riscv/net/bpf_jit_core.c
> +++ b/arch/riscv/net/bpf_jit_core.c
> @@ -41,7 +41,7 @@ bool bpf_jit_needs_zext(void)
>  	return true;
>  }
>  
> -struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
> +struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_prog *prog)
>  {
>  	unsigned int prog_size = 0, extable_size = 0;
>  	bool extra_pass = false;
> diff --git a/arch/s390/net/bpf_jit_comp.c b/arch/s390/net/bpf_jit_comp.c
> index d6de2abfe4a7..061f16d1e3b1 100644
> --- a/arch/s390/net/bpf_jit_comp.c
> +++ b/arch/s390/net/bpf_jit_comp.c
> @@ -2303,7 +2303,7 @@ static struct bpf_binary_header *bpf_jit_alloc(struct bpf_jit *jit,
>  /*
>   * Compile eBPF program "fp"
>   */
> -struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
> +struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_prog *fp)
>  {
>  	struct bpf_binary_header *header;
>  	struct s390_jit_data *jit_data;
> diff --git a/arch/sparc/net/bpf_jit_comp_64.c b/arch/sparc/net/bpf_jit_comp_64.c
> index 86abd84d4005..eca9365c72e7 100644
> --- a/arch/sparc/net/bpf_jit_comp_64.c
> +++ b/arch/sparc/net/bpf_jit_comp_64.c
> @@ -1477,7 +1477,7 @@ struct sparc64_jit_data {
>  	struct jit_ctx ctx;
>  };
>  
> -struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
> +struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_prog *prog)
>  {
>  	struct sparc64_jit_data *jit_data;
>  	struct bpf_binary_header *header;
> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
> index de51ab3a11ee..b95f23ad1093 100644
> --- a/arch/x86/net/bpf_jit_comp.c
> +++ b/arch/x86/net/bpf_jit_comp.c
> @@ -3713,7 +3713,7 @@ struct x64_jit_data {
>  #define MAX_PASSES 20
>  #define PADDING_PASSES (MAX_PASSES - 5)
>  
> -struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
> +struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_prog *prog)
>  {
>  	struct bpf_binary_header *rw_header = NULL;
>  	struct bpf_binary_header *header = NULL;
> diff --git a/arch/x86/net/bpf_jit_comp32.c b/arch/x86/net/bpf_jit_comp32.c
> index 5f259577614a..852baf2e4db4 100644
> --- a/arch/x86/net/bpf_jit_comp32.c
> +++ b/arch/x86/net/bpf_jit_comp32.c
> @@ -2518,7 +2518,7 @@ bool bpf_jit_needs_zext(void)
>  	return true;
>  }
>  
> -struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
> +struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_prog *prog)
>  {
>  	struct bpf_binary_header *header = NULL;
>  	int proglen, oldproglen = 0;
> diff --git a/include/linux/filter.h b/include/linux/filter.h
> index 2484d85be63d..d1bacfbbd02b 100644
> --- a/include/linux/filter.h
> +++ b/include/linux/filter.h
> @@ -1108,6 +1108,8 @@ static inline int sk_filter_reason(struct sock *sk, struct sk_buff *skb,
>  	return sk_filter_trim_cap(sk, skb, 1, reason);
>  }
>  
> +struct bpf_prog *__bpf_prog_select_runtime(struct bpf_verifier_env *env, struct bpf_prog *fp,
> +					   int *err);
>  struct bpf_prog *bpf_prog_select_runtime(struct bpf_prog *fp, int *err);
>  void bpf_prog_free(struct bpf_prog *fp);
>  
> @@ -1153,7 +1155,7 @@ u64 __bpf_call_base(u64 r1, u64 r2, u64 r3, u64 r4, u64 r5);
>  	((u64 (*)(u64, u64, u64, u64, u64, const struct bpf_insn *)) \
>  	 (void *)__bpf_call_base)
>  
> -struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog);
> +struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_prog *prog);
>  void bpf_jit_compile(struct bpf_prog *prog);
>  bool bpf_jit_needs_zext(void);
>  bool bpf_jit_inlines_helper_call(s32 imm);
> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> index c692213b1fdf..88a1834030a0 100644
> --- a/kernel/bpf/core.c
> +++ b/kernel/bpf/core.c
> @@ -2432,18 +2432,8 @@ static bool bpf_prog_select_interpreter(struct bpf_prog *fp)
>  	return select_interpreter;
>  }
>  
> -/**
> - *	bpf_prog_select_runtime - select exec runtime for BPF program
> - *	@fp: bpf_prog populated with BPF program
> - *	@err: pointer to error variable
> - *
> - * Try to JIT eBPF program, if JIT is not available, use interpreter.
> - * The BPF program will be executed via bpf_prog_run() function.
> - *
> - * Return: the &fp argument along with &err set to 0 for success or
> - * a negative errno code on failure
> - */
> -struct bpf_prog *bpf_prog_select_runtime(struct bpf_prog *fp, int *err)
> +struct bpf_prog *__bpf_prog_select_runtime(struct bpf_verifier_env *env, struct bpf_prog *fp,
> +					   int *err)
>  {
>  	/* In case of BPF to BPF calls, verifier did all the prep
>  	 * work with regards to JITing, etc.
> @@ -2471,7 +2461,7 @@ struct bpf_prog *bpf_prog_select_runtime(struct bpf_prog *fp, int *err)
>  		if (*err)
>  			return fp;
>  
> -		fp = bpf_int_jit_compile(fp);
> +		fp = bpf_int_jit_compile(env, fp);
>  		bpf_prog_jit_attempt_done(fp);
>  		if (!fp->jited && jit_needed) {
>  			*err = -ENOTSUPP;
> @@ -2497,6 +2487,22 @@ struct bpf_prog *bpf_prog_select_runtime(struct bpf_prog *fp, int *err)
>  
>  	return fp;
>  }
> +
> +/**
> + *	bpf_prog_select_runtime - select exec runtime for BPF program
> + *	@fp: bpf_prog populated with BPF program
> + *	@err: pointer to error variable
> + *
> + * Try to JIT eBPF program, if JIT is not available, use interpreter.
> + * The BPF program will be executed via bpf_prog_run() function.
> + *
> + * Return: the &fp argument along with &err set to 0 for success or
> + * a negative errno code on failure
> + */
> +struct bpf_prog *bpf_prog_select_runtime(struct bpf_prog *fp, int *err)
> +{
> +	return __bpf_prog_select_runtime(NULL, fp, err);
> +}
>  EXPORT_SYMBOL_GPL(bpf_prog_select_runtime);
>  
>  static unsigned int __bpf_prog_ret1(const void *ctx,
> @@ -2984,7 +2990,7 @@ const struct bpf_func_proto bpf_tail_call_proto = {
>   * It is encouraged to implement bpf_int_jit_compile() instead, so that
>   * eBPF and implicitly also cBPF can get JITed!
>   */
> -struct bpf_prog * __weak bpf_int_jit_compile(struct bpf_prog *prog)
> +struct bpf_prog * __weak bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_prog *prog)
>  {
>  	return prog;
>  }
> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index 274039e36465..fb07be46c936 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -3090,10 +3090,6 @@ static int bpf_prog_load(union bpf_attr *attr, bpfptr_t uattr, u32 uattr_size)
>  	if (err < 0)
>  		goto free_used_maps;
>  
> -	prog = bpf_prog_select_runtime(prog, &err);
> -	if (err < 0)
> -		goto free_used_maps;
> -
>  	err = bpf_prog_mark_insn_arrays_ready(prog);
>  	if (err < 0)
>  		goto free_used_maps;
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index e290c9b7d13d..fc3ba380b74a 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -22977,7 +22977,7 @@ static int jit_subprogs(struct bpf_verifier_env *env)
>  		func[i]->aux->might_sleep = env->subprog_info[i].might_sleep;
>  		if (!i)
>  			func[i]->aux->exception_boundary = env->seen_exception;
> -		func[i] = bpf_int_jit_compile(func[i]);
> +		func[i] = bpf_int_jit_compile(env, func[i]);
>  		if (!func[i]->jited) {
>  			err = -ENOTSUPP;
>  			goto out_free;
> @@ -23021,7 +23021,7 @@ static int jit_subprogs(struct bpf_verifier_env *env)
>  	}
>  	for (i = 0; i < env->subprog_cnt; i++) {
>  		old_bpf_func = func[i]->bpf_func;
> -		tmp = bpf_int_jit_compile(func[i]);
> +		tmp = bpf_int_jit_compile(env, func[i]);
>  		if (tmp != func[i] || func[i]->bpf_func != old_bpf_func) {
>  			verbose(env, "JIT doesn't support bpf-to-bpf calls\n");
>  			err = -ENOTSUPP;
> @@ -26227,6 +26227,10 @@ int bpf_check(struct bpf_prog **prog, union bpf_attr *attr, bpfptr_t uattr, __u3
>  		convert_pseudo_ld_imm64(env);
>  	}
>  
> +	env->prog = __bpf_prog_select_runtime(env, env->prog, &ret);
> +	if (ret)
> +		goto err_release_maps;
> +
>  	adjust_btf_func(env);
>  
>  err_release_maps:
> -- 
> 2.47.3
> 

