Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609A7E85379
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 16:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1d3pxGxM8QHQcDgGEK3rnMPEG31Ghw/o5sCPBkMOzU=; b=tQP9nAlnubrkNcgNnYWmerHey9
	JlQ3bBpFgBxUOhSUWN19iQgNrlfn62amcZrDWiHKc6lNjCYr377nLVkAFm2reFd6AyLXBOrVHe+I3
	hb17WE+tupO5x8Q5R8f7VznOVBZsocUgU6ITrD34b09DbpwIU2izcKbxj3MR4UQkUSwEAyNbag4NR
	KE7C3iQYzWzfOJpuExnwiZT96CbcIftYF1GmV8m1RYd/LuW1gtMt8tOWkMz2hgmc/XlVzT2mvP7hm
	mqG77QQ7WbszIpLlYya1pFC9+hM4FSseTnJ7qNGb1KemQklU/9aP0i51lEyv/Di3cIKapZu0X+Qx+
	jGfZM0kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hXz-00000002L23-49Yc;
	Fri, 03 Apr 2026 16:39:03 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hXx-00000002L1h-350w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 16:39:03 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2aaf43014d0so14284785ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 09:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1775234341; x=1775839141; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1d3pxGxM8QHQcDgGEK3rnMPEG31Ghw/o5sCPBkMOzU=;
        b=NZ9C0VVbZoTyRsIx8WzH35+2W2h00G8MS9untOjnlAoRbGFswmHAeykx/GXKHHeoKC
         uHTbAXfEJb+8qoNYFf8qY2kFtDoc2GrytDP5bu6ofbcERi/KBtljetkNwNdM9Ybh7gC1
         xCWvRKvHcQ1BLyNReQNgZ2Tpe11zCfIbaHYf/732nKJLba7q6blvHp4JpHFdHGMYzYLs
         HmnnICT6/n557a6SJ+WbxxY78dngmDVlTLO08zu+hOdVNJ8NIhHuUH1b+sTpXY9gwpvE
         Vxq0BnSx2pVttECYGp/e+lixMxLrGpCyZJnhHMOV99HUGO+myfhgQK15u974rymILhSW
         iQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775234341; x=1775839141;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q1d3pxGxM8QHQcDgGEK3rnMPEG31Ghw/o5sCPBkMOzU=;
        b=o+pPAkKZlEw2oFuGbiIMv1kSl2NYqL/QLDIo0XF+M6oiC+hRrbqQx2jbtyVNCFJ9w/
         9H6Qi6Oyzcm/myocTOMGtvcpNzktaxmcmN8CAeRvaihH4pjJoKWasZ5cNRzIEalqTaP1
         NYzc2+ArDLYO2NYi0FYNZ/a/Pnv1ZKz6wV7Ru2RV64d/0TUKPyjG2d/GdUYOLav1wKCd
         fzKLnRK5n/o6iexjPG/7A9bpRmhziNlvvchxAyGLrZQ5jnOhpXsWA9evNGa/NN+MSyVL
         s1nV9jvTQEdf1F2kIPG6kUyx3cvNFKXVPK2d6oKLL+2J7lWKJ6Wrx+VhQTX+54pomdf3
         MSew==
X-Forwarded-Encrypted: i=1; AJvYcCVNtXnGKlaZmZq3TmFIfZpHL2+ETGqg0ihy+H7M6fHvc4291XfigwVMd2bxxHOrGEiGZ63n51+guIopNyJr4D7x@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+LljDWbIdeXKNPgXTG4fhMNOxfy7JD2qzvUbiaSrqwtori5SU
	ncX79B7rZhkPR8K6xJpovhqrYHLNo4Ki2JkXbGQHyO0Opeu7un+7i8pyYAvTsLPG+O4=
X-Gm-Gg: AeBDiesJ8luN+y7+b6h/te5EPdo++p86x6ti4NqXHE88vdSeT7mtEDl4jNvwnQOLvO+
	tvAOpvqCa5S6AkEMz9mVRMybXdSH95R3udYuTc1Sl14M0ZC1eoLepiSiWn2QX/gU1RH+gOuu6cQ
	Cr2HAaOXFT2QX4a6skqUQ+wrSPMJPtJhQf8DElYlZfNtg8yoT74LfmBpy8gmXfIlgiPscbfvqJO
	xZlaIrcdFLWdJe8/DGGaSGj4nr3WkrRqNdIucCIk8Ot6PSwmHVY5HPN9BwZZlzYHdCMZkf4I/kp
	+VTkdSSo0mPPx8Rb/qbuuESfDdvccb4UeYDjGlf5pXjIRYQdP7WTzLAiWf9cEpl8pIdSS7HK6jA
	RbUK7JccXpC3SgsatYUV5YFA4kYcIoB5heYSSMWDD10vWYlTuuwGOVup68AWRAgNMFg975idjQC
	oj2POzzSQ=
X-Received: by 2002:a17:903:1a28:b0:2b0:cb96:9815 with SMTP id d9443c01a7336-2b2819994e2mr36629015ad.43.1775234340598;
        Fri, 03 Apr 2026 09:39:00 -0700 (PDT)
Received: from localhost ([2604:3d08:487d:cd00::5517])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cada2sm59220495ad.71.2026.04.03.09.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 09:39:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Apr 2026 12:38:58 -0400
Message-Id: <DHJO1WQQTHJD.1YCDG000FNPAY@etsalapatis.com>
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
Subject: Re: [PATCH bpf-next v12 2/5] bpf: Pass bpf_verifier_env to JIT
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Xu Kuohai" <xukuohai@huaweicloud.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260403132811.753894-1-xukuohai@huaweicloud.com>
 <20260403132811.753894-3-xukuohai@huaweicloud.com>
In-Reply-To: <20260403132811.753894-3-xukuohai@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_093901_840732_A9C5AB5B 
X-CRM114-Status: GOOD (  24.23  )
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
> Pass bpf_verifier_env to bpf_int_jit_compile(). The follow-up patch will
> use env->insn_aux_data in the JIT stage to detect indirect jump targets.
>
> Since bpf_prog_select_runtime() can be called by cbpf and lib/test_bpf.c
> code without verifier, introduce helper __bpf_prog_select_runtime()
> to accept the env parameter.
>
> Remove the call to bpf_prog_select_runtime() in bpf_prog_load(), and
> switch to call __bpf_prog_select_runtime() in the verifier, with env
> variable passed. The original bpf_prog_select_runtime() is preserved for
> cbpf and lib/test_bpf.c, where env is NULL.
>
> Now all constants blinding calls are moved into the verifier, except
> the cbpf and lib/test_bpf.c cases. The instructions arrays are adjusted
> by bpf_patch_insn_data() function for normal cases, so there is no need
> to call adjust_insn_arrays() in bpf_jit_blind_constants(). Remove it.
>

Provided the bot comments are fixed (also check the comment Sashiko raises =
about a
kvmalloc()-to-vfree mismatch):

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

> Reviewed-by: Anton Protopopov <a.s.protopopov@gmail.com>
> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
> ---
>  arch/arc/net/bpf_jit_core.c      |  2 +-
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
>  include/linux/filter.h           | 17 +++++-
>  kernel/bpf/core.c                | 93 +++++++++++++++++---------------
>  kernel/bpf/syscall.c             |  4 --
>  kernel/bpf/verifier.c            | 36 +++++++------
>  16 files changed, 98 insertions(+), 76 deletions(-)
>
> diff --git a/arch/arc/net/bpf_jit_core.c b/arch/arc/net/bpf_jit_core.c
> index 973ceae48675..639a2736f029 100644
> --- a/arch/arc/net/bpf_jit_core.c
> +++ b/arch/arc/net/bpf_jit_core.c
> @@ -1400,7 +1400,7 @@ static struct bpf_prog *do_extra_pass(struct bpf_pr=
og *prog)
>   * (re)locations involved that their addresses are not known
>   * during the first run.
>   */
> -struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
> +struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struc=
t bpf_prog *prog)
>  {
>  	vm_dump(prog);
> =20
> diff --git a/arch/arm/net/bpf_jit_32.c b/arch/arm/net/bpf_jit_32.c
> index e6b1bb2de627..1628b6fc70a4 100644
> --- a/arch/arm/net/bpf_jit_32.c
> +++ b/arch/arm/net/bpf_jit_32.c
> @@ -2142,7 +2142,7 @@ bool bpf_jit_needs_zext(void)
>  	return true;
>  }
> =20
> -struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
> +struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struc=
t bpf_prog *prog)
>  {
>  	struct bpf_binary_header *header;
>  	struct jit_ctx ctx;
> diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.=
c
> index cd5a72fff500..7212ec89dfe3 100644
> --- a/arch/arm64/net/bpf_jit_comp.c
> +++ b/arch/arm64/net/bpf_jit_comp.c
> @@ -2006,7 +2006,7 @@ struct arm64_jit_data {
>  	struct jit_ctx ctx;
>  };
> =20
> -struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
> +struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struc=
t bpf_prog *prog)
>  {
>  	int image_size, prog_size, extable_size, extable_align, extable_offset;
>  	struct bpf_binary_header *header;
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index fcc8c0c29fb0..5149ce4cef7e 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -1920,7 +1920,7 @@ int arch_bpf_trampoline_size(const struct btf_func_=
model *m, u32 flags,
>  	return ret < 0 ? ret : ret * LOONGARCH_INSN_SIZE;
>  }
> =20
> -struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
> +struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struc=
t bpf_prog *prog)
>  {
>  	bool extra_pass =3D false;
>  	u8 *image_ptr, *ro_image_ptr;
> diff --git a/arch/mips/net/bpf_jit_comp.c b/arch/mips/net/bpf_jit_comp.c
> index d2b6c955f18e..6ee4abe6a1f7 100644
> --- a/arch/mips/net/bpf_jit_comp.c
> +++ b/arch/mips/net/bpf_jit_comp.c
> @@ -909,7 +909,7 @@ bool bpf_jit_needs_zext(void)
>  	return true;
>  }
> =20
> -struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
> +struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struc=
t bpf_prog *prog)
>  {
>  	struct bpf_binary_header *header =3D NULL;
>  	struct jit_context ctx;
> diff --git a/arch/parisc/net/bpf_jit_core.c b/arch/parisc/net/bpf_jit_cor=
e.c
> index 35dca372b5df..172770132440 100644
> --- a/arch/parisc/net/bpf_jit_core.c
> +++ b/arch/parisc/net/bpf_jit_core.c
> @@ -41,7 +41,7 @@ bool bpf_jit_needs_zext(void)
>  	return true;
>  }
> =20
> -struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
> +struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struc=
t bpf_prog *prog)
>  {
>  	unsigned int prog_size =3D 0, extable_size =3D 0;
>  	bool extra_pass =3D false;
> diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_c=
omp.c
> index 711028bebea3..27fecb4cc063 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -129,7 +129,7 @@ bool bpf_jit_needs_zext(void)
>  	return true;
>  }
> =20
> -struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
> +struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struc=
t bpf_prog *fp)
>  {
>  	u32 proglen;
>  	u32 alloclen;
> diff --git a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.=
c
> index 527baa50dc68..768ac686b359 100644
> --- a/arch/riscv/net/bpf_jit_core.c
> +++ b/arch/riscv/net/bpf_jit_core.c
> @@ -41,7 +41,7 @@ bool bpf_jit_needs_zext(void)
>  	return true;
>  }
> =20
> -struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
> +struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struc=
t bpf_prog *prog)
>  {
>  	unsigned int prog_size =3D 0, extable_size =3D 0;
>  	bool extra_pass =3D false;
> diff --git a/arch/s390/net/bpf_jit_comp.c b/arch/s390/net/bpf_jit_comp.c
> index 2dfc279b1be2..94128fe6be23 100644
> --- a/arch/s390/net/bpf_jit_comp.c
> +++ b/arch/s390/net/bpf_jit_comp.c
> @@ -2312,7 +2312,7 @@ static struct bpf_binary_header *bpf_jit_alloc(stru=
ct bpf_jit *jit,
>  /*
>   * Compile eBPF program "fp"
>   */
> -struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
> +struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struc=
t bpf_prog *fp)
>  {
>  	struct bpf_binary_header *header;
>  	struct s390_jit_data *jit_data;
> diff --git a/arch/sparc/net/bpf_jit_comp_64.c b/arch/sparc/net/bpf_jit_co=
mp_64.c
> index e83e29137566..2fa0e9375127 100644
> --- a/arch/sparc/net/bpf_jit_comp_64.c
> +++ b/arch/sparc/net/bpf_jit_comp_64.c
> @@ -1477,7 +1477,7 @@ struct sparc64_jit_data {
>  	struct jit_ctx ctx;
>  };
> =20
> -struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
> +struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struc=
t bpf_prog *prog)
>  {
>  	struct sparc64_jit_data *jit_data;
>  	struct bpf_binary_header *header;
> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
> index 77d00a8dec87..72d9a5faa230 100644
> --- a/arch/x86/net/bpf_jit_comp.c
> +++ b/arch/x86/net/bpf_jit_comp.c
> @@ -3713,7 +3713,7 @@ struct x64_jit_data {
>  #define MAX_PASSES 20
>  #define PADDING_PASSES (MAX_PASSES - 5)
> =20
> -struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
> +struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struc=
t bpf_prog *prog)
>  {
>  	struct bpf_binary_header *rw_header =3D NULL;
>  	struct bpf_binary_header *header =3D NULL;
> diff --git a/arch/x86/net/bpf_jit_comp32.c b/arch/x86/net/bpf_jit_comp32.=
c
> index 5f259577614a..852baf2e4db4 100644
> --- a/arch/x86/net/bpf_jit_comp32.c
> +++ b/arch/x86/net/bpf_jit_comp32.c
> @@ -2518,7 +2518,7 @@ bool bpf_jit_needs_zext(void)
>  	return true;
>  }
> =20
> -struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
> +struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struc=
t bpf_prog *prog)
>  {
>  	struct bpf_binary_header *header =3D NULL;
>  	int proglen, oldproglen =3D 0;
> diff --git a/include/linux/filter.h b/include/linux/filter.h
> index d396e55c9a1d..83f37d38c5c1 100644
> --- a/include/linux/filter.h
> +++ b/include/linux/filter.h
> @@ -1107,6 +1107,8 @@ static inline int sk_filter_reason(struct sock *sk,=
 struct sk_buff *skb,
>  	return sk_filter_trim_cap(sk, skb, 1, reason);
>  }
> =20
> +struct bpf_prog *__bpf_prog_select_runtime(struct bpf_verifier_env *env,=
 struct bpf_prog *fp,
> +					   int *err);
>  struct bpf_prog *bpf_prog_select_runtime(struct bpf_prog *fp, int *err);
>  void bpf_prog_free(struct bpf_prog *fp);
> =20
> @@ -1152,7 +1154,7 @@ u64 __bpf_call_base(u64 r1, u64 r2, u64 r3, u64 r4,=
 u64 r5);
>  	((u64 (*)(u64, u64, u64, u64, u64, const struct bpf_insn *)) \
>  	 (void *)__bpf_call_base)
> =20
> -struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog);
> +struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struc=
t bpf_prog *prog);
>  void bpf_jit_compile(struct bpf_prog *prog);
>  bool bpf_jit_needs_zext(void);
>  bool bpf_jit_inlines_helper_call(s32 imm);
> @@ -1187,12 +1189,25 @@ struct bpf_prog *bpf_patch_insn_single(struct bpf=
_prog *prog, u32 off,
>  #ifdef CONFIG_BPF_SYSCALL
>  struct bpf_prog *bpf_patch_insn_data(struct bpf_verifier_env *env, u32 o=
ff,
>  				     const struct bpf_insn *patch, u32 len);
> +struct bpf_insn_aux_data *bpf_dup_insn_aux_data(struct bpf_verifier_env =
*env);
> +void bpf_restore_insn_aux_data(struct bpf_verifier_env *env,
> +			       struct bpf_insn_aux_data *orig_insn_aux);
>  #else
>  static inline struct bpf_prog *bpf_patch_insn_data(struct bpf_verifier_e=
nv *env, u32 off,
>  						   const struct bpf_insn *patch, u32 len)
>  {
>  	return ERR_PTR(-ENOTSUPP);
>  }
> +
> +static inline struct bpf_insn_aux_data *bpf_dup_insn_aux_data(struct bpf=
_verifier_env *env)
> +{
> +	return NULL;
> +}
> +
> +static inline void bpf_restore_insn_aux_data(struct bpf_verifier_env *en=
v,
> +					     struct bpf_insn_aux_data *orig_insn_aux)
> +{
> +}
>  #endif /* CONFIG_BPF_SYSCALL */
> =20
>  int bpf_remove_insns(struct bpf_prog *prog, u32 off, u32 cnt);
> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> index cc61fe57b98d..093ab0f68c81 100644
> --- a/kernel/bpf/core.c
> +++ b/kernel/bpf/core.c
> @@ -1489,23 +1489,6 @@ void bpf_jit_prog_release_other(struct bpf_prog *f=
p, struct bpf_prog *fp_other)
>  	bpf_prog_clone_free(fp_other);
>  }
> =20
> -static void adjust_insn_arrays(struct bpf_prog *prog, u32 off, u32 len)
> -{
> -#ifdef CONFIG_BPF_SYSCALL
> -	struct bpf_map *map;
> -	int i;
> -
> -	if (len <=3D 1)
> -		return;
> -
> -	for (i =3D 0; i < prog->aux->used_map_cnt; i++) {
> -		map =3D prog->aux->used_maps[i];
> -		if (map->map_type =3D=3D BPF_MAP_TYPE_INSN_ARRAY)
> -			bpf_insn_array_adjust(map, off, len);
> -	}
> -#endif
> -}
> -
>  /* Now this function is used only to blind the main prog and must be inv=
oked only when
>   * bpf_prog_need_blind() returns true.
>   */
> @@ -1577,12 +1560,6 @@ struct bpf_prog *bpf_jit_blind_constants(struct bp=
f_verifier_env *env, struct bp
> =20
>  		if (env)
>  			env->prog =3D clone;
> -		else
> -			/* Instructions arrays must be updated using absolute xlated offsets.
> -			 * The arrays have already been adjusted by bpf_patch_insn_data() whe=
n
> -			 * env is not NULL.
> -			 */
> -			adjust_insn_arrays(clone, i, rewritten);
> =20
>  		/* Walk new program and skip insns we just inserted. */
>  		insn =3D clone->insnsi + i + insn_delta;
> @@ -2551,47 +2528,63 @@ static bool bpf_prog_select_interpreter(struct bp=
f_prog *fp)
>  	return select_interpreter;
>  }
> =20
> -static struct bpf_prog *bpf_prog_jit_compile(struct bpf_prog *prog)
> +static struct bpf_prog *bpf_prog_jit_compile(struct bpf_verifier_env *en=
v, struct bpf_prog *prog)
>  {
>  #ifdef CONFIG_BPF_JIT
>  	bool blinded =3D false;
>  	struct bpf_prog *orig_prog =3D prog;
> +	struct bpf_insn_aux_data *orig_insn_aux;
> =20
>  	if (bpf_prog_need_blind(orig_prog)) {
> -		prog =3D bpf_jit_blind_constants(NULL, orig_prog);
> +		if (env) {
> +			/* If env is not NULL, we are called from the end of bpf_check(), at =
this
> +			 * point, only insn_aux_data is used after failure, so we only restor=
e it
> +			 * here.
> +			 */
> +			orig_insn_aux =3D bpf_dup_insn_aux_data(env);
> +			if (!orig_insn_aux)
> +				return orig_prog;
> +		}
> +		prog =3D bpf_jit_blind_constants(env, orig_prog);
>  		/* If blinding was requested and we failed during blinding, we must fa=
ll
>  		 * back to the interpreter.
>  		 */
> -		if (IS_ERR(prog))
> -			return orig_prog;
> +		if (IS_ERR(prog)) {
> +			prog =3D orig_prog;
> +			if (env)
> +				goto out_restore;
> +			else
> +				return prog;
> +		}
>  		blinded =3D true;
>  	}
> =20
> -	prog =3D bpf_int_jit_compile(prog);
> +	prog =3D bpf_int_jit_compile(env, prog);
>  	if (blinded) {
>  		if (!prog->jited) {
>  			bpf_jit_prog_release_other(orig_prog, prog);
>  			prog =3D orig_prog;
> +			if (env)
> +				goto out_restore;
>  		} else {
>  			bpf_jit_prog_release_other(prog, orig_prog);
> +			if (env)
> +				goto out_free;
>  		}
>  	}
> +
> +	return prog;
> +
> +out_restore:
> +	bpf_restore_insn_aux_data(env, orig_insn_aux);
> +out_free:
> +	kvfree(orig_insn_aux);
>  #endif
>  	return prog;
>  }
> =20
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
> +struct bpf_prog *__bpf_prog_select_runtime(struct bpf_verifier_env *env,=
 struct bpf_prog *fp,
> +					   int *err)
>  {
>  	/* In case of BPF to BPF calls, verifier did all the prep
>  	 * work with regards to JITing, etc.
> @@ -2619,7 +2612,7 @@ struct bpf_prog *bpf_prog_select_runtime(struct bpf=
_prog *fp, int *err)
>  		if (*err)
>  			return fp;
> =20
> -		fp =3D bpf_prog_jit_compile(fp);
> +		fp =3D bpf_prog_jit_compile(env, fp);
>  		bpf_prog_jit_attempt_done(fp);
>  		if (!fp->jited && jit_needed) {
>  			*err =3D -ENOTSUPP;
> @@ -2645,6 +2638,22 @@ struct bpf_prog *bpf_prog_select_runtime(struct bp=
f_prog *fp, int *err)
> =20
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
> =20
>  static unsigned int __bpf_prog_ret1(const void *ctx,
> @@ -3132,7 +3141,7 @@ const struct bpf_func_proto bpf_tail_call_proto =3D=
 {
>   * It is encouraged to implement bpf_int_jit_compile() instead, so that
>   * eBPF and implicitly also cBPF can get JITed!
>   */
> -struct bpf_prog * __weak bpf_int_jit_compile(struct bpf_prog *prog)
> +struct bpf_prog * __weak bpf_int_jit_compile(struct bpf_verifier_env *en=
v, struct bpf_prog *prog)
>  {
>  	return prog;
>  }
> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index e1505c9cd09e..553dca175640 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -3090,10 +3090,6 @@ static int bpf_prog_load(union bpf_attr *attr, bpf=
ptr_t uattr, u32 uattr_size)
>  	if (err < 0)
>  		goto free_used_maps;
> =20
> -	prog =3D bpf_prog_select_runtime(prog, &err);
> -	if (err < 0)
> -		goto free_used_maps;
> -
>  	err =3D bpf_prog_mark_insn_arrays_ready(prog);
>  	if (err < 0)
>  		goto free_used_maps;
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 66cef3744fde..5084a754a748 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -22983,7 +22983,7 @@ static int convert_ctx_accesses(struct bpf_verifi=
er_env *env)
>  	return 0;
>  }
> =20
> -static u32 *dup_subprog_starts(struct bpf_verifier_env *env)
> +static u32 *bpf_dup_subprog_starts(struct bpf_verifier_env *env)
>  {
>  	u32 *starts =3D NULL;
> =20
> @@ -22995,13 +22995,13 @@ static u32 *dup_subprog_starts(struct bpf_verif=
ier_env *env)
>  	return starts;
>  }
> =20
> -static void restore_subprog_starts(struct bpf_verifier_env *env, u32 *or=
ig_starts)
> +static void bpf_restore_subprog_starts(struct bpf_verifier_env *env, u32=
 *orig_starts)
>  {
>  	for (int i =3D 0; i < env->subprog_cnt; i++)
>  		env->subprog_info[i].start =3D orig_starts[i];
>  }
> =20
> -static struct bpf_insn_aux_data *dup_insn_aux_data(struct bpf_verifier_e=
nv *env)
> +struct bpf_insn_aux_data *bpf_dup_insn_aux_data(struct bpf_verifier_env =
*env)
>  {
>  	size_t size;
> =20
> @@ -23009,8 +23009,8 @@ static struct bpf_insn_aux_data *dup_insn_aux_dat=
a(struct bpf_verifier_env *env)
>  	return kvmemdup(env->insn_aux_data, size, GFP_KERNEL_ACCOUNT);
>  }
> =20
> -static void restore_insn_aux_data(struct bpf_verifier_env *env,
> -				  struct bpf_insn_aux_data *orig_insn_aux)
> +void bpf_restore_insn_aux_data(struct bpf_verifier_env *env,
> +			       struct bpf_insn_aux_data *orig_insn_aux)
>  {
>  	/* the expanded elements are zero-filled, so no special handling is req=
uired */
>  	vfree(env->insn_aux_data);
> @@ -23153,7 +23153,7 @@ static int __jit_subprogs(struct bpf_verifier_env=
 *env)
>  		func[i]->aux->might_sleep =3D env->subprog_info[i].might_sleep;
>  		if (!i)
>  			func[i]->aux->exception_boundary =3D env->seen_exception;
> -		func[i] =3D bpf_int_jit_compile(func[i]);
> +		func[i] =3D bpf_int_jit_compile(env, func[i]);
>  		if (!func[i]->jited) {
>  			err =3D -ENOTSUPP;
>  			goto out_free;
> @@ -23197,7 +23197,7 @@ static int __jit_subprogs(struct bpf_verifier_env=
 *env)
>  	}
>  	for (i =3D 0; i < env->subprog_cnt; i++) {
>  		old_bpf_func =3D func[i]->bpf_func;
> -		tmp =3D bpf_int_jit_compile(func[i]);
> +		tmp =3D bpf_int_jit_compile(env, func[i]);
>  		if (tmp !=3D func[i] || func[i]->bpf_func !=3D old_bpf_func) {
>  			verbose(env, "JIT doesn't support bpf-to-bpf calls\n");
>  			err =3D -ENOTSUPP;
> @@ -23297,12 +23297,12 @@ static int jit_subprogs(struct bpf_verifier_env=
 *env)
> =20
>  	prog =3D orig_prog =3D env->prog;
>  	if (bpf_prog_need_blind(orig_prog)) {
> -		orig_insn_aux =3D dup_insn_aux_data(env);
> +		orig_insn_aux =3D bpf_dup_insn_aux_data(env);
>  		if (!orig_insn_aux) {
>  			err =3D -ENOMEM;
>  			goto out_cleanup;
>  		}
> -		orig_subprog_starts =3D dup_subprog_starts(env);
> +		orig_subprog_starts =3D bpf_dup_subprog_starts(env);
>  		if (!orig_subprog_starts) {
>  			err =3D -ENOMEM;
>  			goto out_free_aux;
> @@ -23347,8 +23347,8 @@ static int jit_subprogs(struct bpf_verifier_env *=
env)
>  	return 0;
> =20
>  out_restore:
> -	restore_subprog_starts(env, orig_subprog_starts);
> -	restore_insn_aux_data(env, orig_insn_aux);
> +	bpf_restore_subprog_starts(env, orig_subprog_starts);
> +	bpf_restore_insn_aux_data(env, orig_insn_aux);
>  	kvfree(orig_subprog_starts);
>  out_free_aux:
>  	kvfree(orig_insn_aux);
> @@ -26523,6 +26523,14 @@ int bpf_check(struct bpf_prog **prog, union bpf_=
attr *attr, bpfptr_t uattr, __u3
> =20
>  	adjust_btf_func(env);
> =20
> +	/* extension progs temporarily inherit the attach_type of their targets
> +	   for verification purposes, so set it back to zero before returning
> +	 */
> +	if (env->prog->type =3D=3D BPF_PROG_TYPE_EXT)
> +		env->prog->expected_attach_type =3D 0;
> +
> +	env->prog =3D __bpf_prog_select_runtime(env, env->prog, &ret);
> +
>  err_release_maps:
>  	if (ret)
>  		release_insn_arrays(env);
> @@ -26534,12 +26542,6 @@ int bpf_check(struct bpf_prog **prog, union bpf_=
attr *attr, bpfptr_t uattr, __u3
>  	if (!env->prog->aux->used_btfs)
>  		release_btfs(env);
> =20
> -	/* extension progs temporarily inherit the attach_type of their targets
> -	   for verification purposes, so set it back to zero before returning
> -	 */
> -	if (env->prog->type =3D=3D BPF_PROG_TYPE_EXT)
> -		env->prog->expected_attach_type =3D 0;
> -
>  	*prog =3D env->prog;
> =20
>  	module_put(env->attach_btf_mod);


