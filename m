Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3A8C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 00:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BAdrSpHVasOUL/GpRMRQtUO4sMi+w7FhQalzllF+FBE=; b=24RVu0swQplr3RHwswiBz1eP3/
	H2DPjusKpt44aZ4bWAS69DZuUqVeAVvxc4UOzi+13ZyiZH72pHR6ve5kyhI8Qb5O/Nsh6qdaVkhmn
	nvGirlKQ9RoB/UwIYQvlRTJg6xngI2OYX6Jo7spypE0QLRuIKSS6G+5yDqrsYq0VhRq0vEd6i7/b/
	QAkz5yNGrZZnG3QUwp4cxk7Hm1BmUn2LrfBMj4i8snnVL2sWI06k27sVYZUgLWg57Uyklh6v5Cfk1
	FbXMFvpqLlQVSgBK4hfHF9RR4IxFoGT0m430iwxMFu+63EJVGgK2Zmna9JvNcF0iLzVvGAMfSzNdv
	AMH2o5HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAeKM-00000000Q3G-16Ru;
	Fri, 02 May 2025 00:32:30 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAdsc-00000000KH3-3aDJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 00:03:52 +0000
Received: by mail-ed1-x542.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so2480072a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 17:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746144229; x=1746749029; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BAdrSpHVasOUL/GpRMRQtUO4sMi+w7FhQalzllF+FBE=;
        b=curqxUWibkw35iM/fX8y+n6twaRD5kUb+MxI0sRItOUQzfPFWDcHIln1F6TATdU0Ck
         GcrUvTtyWkcuYslpLRs47hZtj18I7OHDxZAWbZ/HibSxtNwmOOcQh1hMPBoHIW9sY3dr
         5jOVm+PnzHoFJ3E0sZ8+QGNA/b7SSHFlQWC0LKghBTNGr4tq98ZdtRed6u0b/AeUMHGU
         rdz8tTY/vlR9AfN6wE7BLDPG8DrkbfXJV3gc6LV1UNMXB3bdunnJgwguUjj8b1NvwSQw
         q/BQcCwl4y9AYvDaV+Uct0rsQxrgCbhUSEsXL+D101eOaOcKV62PnDPJWTzDVf9WBJfV
         Xacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746144229; x=1746749029;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BAdrSpHVasOUL/GpRMRQtUO4sMi+w7FhQalzllF+FBE=;
        b=GDRlrBnzSqkSa7gfL45a3nDqmiB7+Whla2SqzMLmH8dGb2ri45eUpc0k1EXw59JmfW
         jIzb9i79nWKeMkdhLc6n9DghUoxF6qhwyU2TpSBPCtHnkrZTsoHuEbQ7V/Qh/820dvt7
         oI9VMZ/NH/O5UhhaSIYAhCcCFT4b6+/TH286MGvUeFuOHHJO+TrOOLch8N5kliQLsgUN
         a4gAA/Rmvhte5l4xYV3+ruWlRFjmg89q0nxQA8VpXCWQh4jnGVKqRcHMyZmClw5QhF5B
         9B76dawWPoaLTRo3p7IErbmVyJuoUbveOogxEkcXReYxRMAefnmsaX1VAhSATTsewKjp
         c/cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKrqVyM8s+GmgHRQFClcMSPL+W3O6MuVzI0/kFZeFUuQPMp+fZsmsPxJQ6rlkOuE1WL1SIfMBv56ZV+bvhNTSt@lists.infradead.org
X-Gm-Message-State: AOJu0YxLa/xVEy8OjD1yLX2II0sLV6rFKpoTtbchEn31dHq+TnVGO9X4
	TOBkTBvsF8QPRdzC4AlrexxLPRWcKGfUO0GWKLf51eXe7TzQBEQEs3hF9wgk2nHvtfBFEKLkEQF
	e5HflMXFIY/ZAKf1GE3jBhr2m0ns=
X-Gm-Gg: ASbGncsoHfVfVnxxJbhaqlgB2x5Ea2tAJJig5Po5jEYQmEMIgBXY/F94iQqnxzfyQtq
	JkS6CzEvzkJMK5MkhNBEzTjS5BBsz8Pa4nIQX5HCSdlHvicVim8qvjhtWwNYRBf35iJpBJ/J0se
	xbFZ9FedJwA5cqEnIsfCseNuYM2RX1SnJapK/alSjJ5CU=
X-Google-Smtp-Source: AGHT+IEZmaXKlPg2SX6D1Gg4Ct+dglKTu1NfoiUsMrHJ97ikPtGkPZ2woUqGvcz2mbdKYLABZveqW+MvsUkMW/lyo9o=
X-Received: by 2002:a05:6402:51d3:b0:5ec:fb3d:f51f with SMTP id
 4fb4d7f45d1cf-5fa78006329mr578324a12.10.1746144228590; Thu, 01 May 2025
 17:03:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250501073603.1402960-1-luis.gerhorst@fau.de> <20250501073603.1402960-11-luis.gerhorst@fau.de>
In-Reply-To: <20250501073603.1402960-11-luis.gerhorst@fau.de>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Fri, 2 May 2025 02:03:12 +0200
X-Gm-Features: ATxdqUHVm1hIS_v_8Z_z0qlxAyMnE3MrBINfcmLce0vU9ymsmOtLw6c47Fn4EGE
Message-ID: <CAP01T76HZ+s5h+_REqRFkRjjoKwnZZn9YswpSVinGicah1pGJw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 10/11] bpf: Allow nospec-protected var-offset
 stack access
To: Luis Gerhorst <luis.gerhorst@fau.de>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Henriette Herzog <henriette.herzog@rub.de>, Saket Kumar Bhaskar <skb99@linux.ibm.com>, 
	Cupertino Miranda <cupertino.miranda@oracle.com>, Jiayuan Chen <mrpre@163.com>, 
	Matan Shachnai <m.shachnai@gmail.com>, Dimitar Kanaliev <dimitar.kanaliev@siteground.com>, 
	Shung-Hsi Yu <shung-hsi.yu@suse.com>, Daniel Xu <dxu@dxuuu.xyz>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, 
	Maximilian Ott <ott@cs.fau.de>, Milan Stephan <milan.stephan@fau.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_170350_897832_FD76AB89 
X-CRM114-Status: GOOD (  34.20  )
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

On Thu, 1 May 2025 at 10:17, Luis Gerhorst <luis.gerhorst@fau.de> wrote:
>
> Insert a nospec before the access to prevent it from ever using an index
> that is subject to speculative scalar-confusion.
>
> The access itself can either happen directly in the BPF program (reads
> only, check_stack_read_var_off()) or in a helper (read/write,
> check_helper_mem_access()).
>
> This relies on the fact that the speculative scalar confusion that leads
> to the variable-stack access going OOBs must stem from a prior
> speculative store or branch bypass. Adding a nospec before the
> variable-stack access will force all previously bypassed stores/branches
> to complete and cause the stack access to only ever go to the stack slot
> that is accessed architecturally.
>
> Alternatively, the variable-offset stack access might be a write that
> can itself be subject to speculative store bypass (this can happen in
> theory even if this code adds a nospec /before/ the variable-offset
> write). Only indirect writes by helpers might be affected here (e.g.,
> those taking ARG_PTR_TO_MAP_VALUE). (Because check_stack_write_var_off()
> does not use check_stack_range_initialized(), in-program variable-offset
> writes are not affected.) If the in-helper write can be subject to
> Spectre v4 and the helper writes/overwrites pointers on the BPF stack,
> they are already a problem for fixed-offset stack accesses and should be
> subject to Spectre v4 sanitization.
>
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
> Acked-by: Henriette Herzog <henriette.herzog@rub.de>
> Cc: Maximilian Ott <ott@cs.fau.de>
> Cc: Milan Stephan <milan.stephan@fau.de>
> ---
>  kernel/bpf/verifier.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index db26b477dd45..1fbafea3ed69 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -7894,6 +7894,11 @@ static int check_atomic(struct bpf_verifier_env *env, struct bpf_insn *insn)
>         }
>  }
>
> +static struct bpf_insn_aux_data *cur_aux(const struct bpf_verifier_env *env)
> +{
> +       return &env->insn_aux_data[env->insn_idx];
> +}
> +
>  /* When register 'regno' is used to read the stack (either directly or through
>   * a helper function) make sure that it's within stack boundary and, depending
>   * on the access type and privileges, that all elements of the stack are
> @@ -7933,18 +7938,18 @@ static int check_stack_range_initialized(
>         if (tnum_is_const(reg->var_off)) {
>                 min_off = max_off = reg->var_off.value + off;
>         } else {
> -               /* Variable offset is prohibited for unprivileged mode for
> +               /* Variable offset requires a nospec for unprivileged mode for
>                  * simplicity since it requires corresponding support in
>                  * Spectre masking for stack ALU.
>                  * See also retrieve_ptr_limit().
>                  */
>                 if (!env->bypass_spec_v1) {
> -                       char tn_buf[48];
> -
> -                       tnum_strn(tn_buf, sizeof(tn_buf), reg->var_off);
> -                       verbose(env, "R%d variable offset stack access prohibited for !root, var_off=%s\n",
> -                               regno, tn_buf);
> -                       return -EACCES;
> +                       /* Allow the access, but prevent it from using a
> +                        * speculative offset using a nospec before the
> +                        * dereference op.
> +                        */
> +                       cur_aux(env)->nospec = true;
> +                       WARN_ON_ONCE(cur_aux(env)->alu_state);
>                 }
>                 /* Only initialized buffer on stack is allowed to be accessed
>                  * with variable offset. With uninitialized buffer it's hard to
> @@ -11172,11 +11177,6 @@ static int check_get_func_ip(struct bpf_verifier_env *env)
>         return -ENOTSUPP;
>  }

Hmm, while reading related code, I noticed that sanitize_check_bounds
returns 0 in case the type is not map_value or stack.
It seems like it should be returning an error, cannot check right now
but I'm pretty sure these are not the two pointer types unprivileged
programs can access?
So smells like a bug?

>
> -static struct bpf_insn_aux_data *cur_aux(const struct bpf_verifier_env *env)
> -{
> -       return &env->insn_aux_data[env->insn_idx];
> -}
> -
>  static bool loop_flag_is_zero(struct bpf_verifier_env *env)
>  {
>         struct bpf_reg_state *regs = cur_regs(env);
> --
> 2.49.0
>
>

