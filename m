Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A717D107BCEE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 01:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7EmrSuHvutIrDBDAGlQ6buLIUtau7tLM1U33dA0uIH0=; b=DMqbDdenI4cZCEym3eCoalndjy
	oSFNAItiEIWA+Q8VykTezS6kefBM1Nx45msNYFWyieYhgZbymBMjOR4aAeoRekQaPZ5Q5kzkYlACc
	Bnp0ReucUCSgOm6PLeyR9FS+jB7xjbYXD3Bcj82WmjDnk+tbMLUT+z/CvWbYLxs7UVdGt9EqhwI+O
	OK8DURyZAOc7umT9Nnd4Ybd8ht2VBWm8915nhxi6ov5DfUs9HUTbQuQjEPgHOUj1Nwrdnr1fbMr8X
	W98E19L2ffKf4VphuOYBQWS6QsfVyHAJqtZUsogyWXZOu5GuC1eRng0dET50IbFpdIOV1Nt6YDA7a
	tZUXJB0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Doz-00000001OYp-2Ofv;
	Sat, 14 Mar 2026 01:29:41 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Dow-00000001OYR-3ppv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 01:29:40 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-354bc7c2c46so1737494a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 18:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773451777; x=1774056577; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7EmrSuHvutIrDBDAGlQ6buLIUtau7tLM1U33dA0uIH0=;
        b=jKxTnFKd9mc5xQeIrxvw4p8Yw9PfrOpOxlnpMVBYz9yV89PeSUjf/vg4qdwDPjZwJF
         vdzuCjoLkvp07jTji77rYoB91vYhVGAbGqnjRG60RA4d2hxnzH9pwwSuxot2TOhe7Gzp
         qpjfF6DsLrlyYzLkxa/8ilZsvUfesAWnBGF2OLddkZLi81xL3tKCahVmq9e3NCerTsgb
         lHbfO9SzXlyxg/6EsCUP5oKEzmRGUOk3ohKetSKvR7wUrLoyA06V8eGoZcoJNPmuvLv0
         sOyQv6xw60D+YBzLSTqgreKEMkX4YPAdBYcpIcMhvXw2euXkEM/NuzAKstxNDJeCQ8tR
         KOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773451777; x=1774056577;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7EmrSuHvutIrDBDAGlQ6buLIUtau7tLM1U33dA0uIH0=;
        b=YorbxBleXdWxhRNxBryUO3Vj64lr/nn8/K+/wTlRJ0lM4emJg/b1ZkJze5MkROzfXZ
         vdjh86H22wmwn6/maPbwW6qPioaH2g9RL8wcWbx28M3O/ScqjNHYLS7FnXV3ltRpEax6
         ITluINbR2Y3eoQ2SUPz3gZRk54ZT2XWFslIT/2p55wNXittWz64Yguq724141kLICppy
         kgTrfXugx8B0b0StXnHsZql6KzJZNr0ff3REdfmFz2l2ytPhCCN7+J9hoSbZDG+rrJLS
         VCYHzbafrDvPBIItzTCA61nQi4NOawu91zNMDErPrPGT2O6mJ5KMlAJ5zG7UKotxwTLS
         L32Q==
X-Forwarded-Encrypted: i=1; AJvYcCVyZYEIG2OHLq4HMcNDS8lGiDybJKNk3nZMx453drixNlTOWKV7kr1/TLG0WQlTNtbd31jeDfJeJVBzVOwpWsLw@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq1jLuuQIXneuZx+3maKfkuDjBO9N38gwivrahxkIcJkO1j5h7
	eTH0SHX43hpLif96IihFJ0pfr/P6e7tCfmPGUtby+1bjWVqibvXggnjo
X-Gm-Gg: ATEYQzyTQB6EuqXR9Uw6CmVYg+RbJUJueJ8OgJWJRW8Yw/AcHrDxzb0QTAOPt/zc3YC
	pm6tc8TO0gTWT1S1QCty/i1tBjduyxrbktUCVuvFn0yT2DrU7hb8R7gVm7nq9DHyv7f8G2RFa9W
	tVB/nxbmCVll+C/wRcXgXn/8IBoDUqHvGk46+g6pzg1CLpPLynylASYtrVcDl2whw2KL7Fz4Dlg
	chqgMqynt80BCBo40AIvUvj36oGOSrvl6MxIdcozLLKXveGdLfdtQOVGH6vrss4yUHgyDgLLIol
	dGPGvWbuGRE1Y2Ykktpfyj3v/7jvOec36quFs5+++SQfWgvNTsOU/a5e17zZyyP2qELeTsDIax7
	mQhvkn6RuTUX2YcEUKz6Bp9aH8wuhq/Dm6mhYyxr1cQHGNbD/hYlDuj53hwQVJRsOphTXeAgoxS
	vcRfW4Q0twAl3vMYTupJCtpYLeewaJSUU/Hxc3Vut4BHgfWtu/mAk=
X-Received: by 2002:a17:90b:2683:b0:359:8d2e:6f79 with SMTP id 98e67ed59e1d1-35a21f6874bmr5053778a91.14.1773451777422;
        Fri, 13 Mar 2026 18:29:37 -0700 (PDT)
Received: from [192.168.0.56] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02fc8465sm9531222a91.9.2026.03.13.18.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 18:29:37 -0700 (PDT)
Message-ID: <4e4c3be9bfca85c5343834b5d6b1d6283fd6a1f5.camel@gmail.com>
Subject: Re: [PATCH bpf-next v9 1/5] bpf: Move constants blinding out of
 arch-specific JITs
From: Eduard Zingerman <eddyz87@gmail.com>
To: Xu Kuohai <xukuohai@huaweicloud.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Yonghong Song	 <yonghong.song@linux.dev>,
 Puranjay Mohan <puranjay@kernel.org>, Anton Protopopov
 <a.s.protopopov@gmail.com>, Alexis =?ISO-8859-1?Q?Lothor=E9?=
 <alexis.lothore@bootlin.com>,  Shahab Vahedi <list+bpf@vahedi.org>, Russell
 King <linux@armlinux.org.uk>, Tiezhu Yang <yangtiezhu@loongson.cn>,  Hengqi
 Chen <hengqi.chen@gmail.com>, Johan Almbladh
 <johan.almbladh@anyfinetworks.com>, Paul Burton	 <paulburton@kernel.org>,
 Hari Bathini <hbathini@linux.ibm.com>, Christophe Leroy
 <chleroy@kernel.org>, Naveen N Rao <naveen@kernel.org>, Luke Nelson	
 <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?=	 <bjorn@kernel.org>, Pu Lehui
 <pulehui@huawei.com>, Ilya Leoshkevich	 <iii@linux.ibm.com>, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik	 <gor@linux.ibm.com>, "David S . Miller"
 <davem@davemloft.net>, Wang YanQing	 <udknight@gmail.com>
Date: Fri, 13 Mar 2026 18:29:33 -0700
In-Reply-To: <20260312170255.3427799-2-xukuohai@huaweicloud.com>
References: <20260312170255.3427799-1-xukuohai@huaweicloud.com>
	 <20260312170255.3427799-2-xukuohai@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_182938_965662_18B13F51 
X-CRM114-Status: GOOD (  19.65  )
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

On Fri, 2026-03-13 at 01:02 +0800, Xu Kuohai wrote:

[...]

> diff --git a/arch/arc/net/bpf_jit_core.c b/arch/arc/net/bpf_jit_core.c
> index 1421eeced0f5..973ceae48675 100644
> --- a/arch/arc/net/bpf_jit_core.c
> +++ b/arch/arc/net/bpf_jit_core.c

[...]

> @@ -229,12 +211,19 @@ static void jit_ctx_cleanup(struct jit_context *ctx=
)
> =C2=A0		ctx->bpf2insn_valid =3D false;
> =C2=A0
> =C2=A0	/* Freeing "bpf_header" is enough. "jit.buf" is a sub-array of it.=
 */
> -	if (!ctx->success && ctx->bpf_header) {
> -		bpf_jit_binary_free(ctx->bpf_header);
> -		ctx->bpf_header =3D NULL;
> -		ctx->jit.buf=C2=A0=C2=A0=C2=A0 =3D NULL;
> -		ctx->jit.index=C2=A0 =3D 0;
> -		ctx->jit.len=C2=A0=C2=A0=C2=A0 =3D 0;
> +	if (!ctx->success) {
> +		if (ctx->bpf_header) {
> +			bpf_jit_binary_free(ctx->bpf_header);
> +			ctx->bpf_header =3D NULL;
> +			ctx->jit.buf=C2=A0=C2=A0=C2=A0 =3D NULL;
> +			ctx->jit.index=C2=A0 =3D 0;
> +			ctx->jit.len=C2=A0=C2=A0=C2=A0 =3D 0;
> +		}
> +		if (ctx->is_extra_pass) {

Nit: The idea is that for !ctx->is_extra_pass
     ctx->prog->bpf_func !=3D NULL only when ctx->success is true, right?
     Maybe just drop the condition?

> +			ctx->prog->bpf_func =3D NULL;
> +			ctx->prog->jited =3D 0;
> +			ctx->prog->jited_len =3D 0;
> +		}
> =C2=A0	}
> =C2=A0
> =C2=A0	ctx->emit =3D false;
> diff --git a/arch/arm/net/bpf_jit_32.c b/arch/arm/net/bpf_jit_32.c
> index deeb8f292454..e6b1bb2de627 100644
> --- a/arch/arm/net/bpf_jit_32.c
> +++ b/arch/arm/net/bpf_jit_32.c
> @@ -2144,9 +2144,7 @@ bool bpf_jit_needs_zext(void)
> =C2=A0
> =C2=A0struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
> =C2=A0{
> -	struct bpf_prog *tmp, *orig_prog =3D prog;
> =C2=A0	struct bpf_binary_header *header;
> -	bool tmp_blinded =3D false;
> =C2=A0	struct jit_ctx ctx;
> =C2=A0	unsigned int tmp_idx;
> =C2=A0	unsigned int image_size;

The code in arch/arc is modified to do `... ctx->prog->jited =3D 0; ...`,
but for arm32 there is no such modification. Why is that so?

[...]

> diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.=
c
> index adf84962d579..cd5a72fff500 100644
> --- a/arch/arm64/net/bpf_jit_comp.c
> +++ b/arch/arm64/net/bpf_jit_comp.c
> @@ -2009,14 +2009,12 @@ struct arm64_jit_data {

[...]

> @@ -2245,13 +2211,15 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_p=
rog *prog)
> =C2=A0		kfree(jit_data);
> =C2=A0		prog->aux->jit_data =3D NULL;
> =C2=A0	}
> -out:
> -	if (tmp_blinded)
> -		bpf_jit_prog_release_other(prog, prog =3D=3D orig_prog ?
> -					=C2=A0=C2=A0 tmp : orig_prog);
> +
> =C2=A0	return prog;
> =C2=A0
> =C2=A0out_free_hdr:
> +	if (extra_pass) {
> +		prog->bpf_func =3D NULL;
> +		prog->jited =3D 0;
> +		prog->jited_len =3D 0;
> +	}

Just for my understanding, is the following correct?
- Previously, a call bpf_jit_blind_constants() always cloned the prog.
- Jits only set prog->jited to true upon successful compilation.
- On error exit jits restored the original prog with it's prog->jited =3D=
=3D 0.

What happened in case of an extra pass?
I'd expect that in case of an extra pass prog->jited would be true
even before program is cloned by blind_constants() (and that's what
arc code uses to figure out if the current pass is an extra pass).
If so, old code would preserve prog->jited as true even in case of
extra pass failure. Is that true or am I confused?

Just trying to understand why this patch has to deal with the above
snippet at all. In case it is indeed necessary, it seems the logic
should be similar for all jits, is there a way to push this snippet to
some common code? E.g. in verifier.c where the extra pass is initiated.

[...]

