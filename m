Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B304EDA6BA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 17:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4lG3IZPwbMVPm9SM64fXZ+1KlCJGNP1Tyih1mnoT5bc=; b=L+cj5dcEKXFELMGu0ACMNLx3Gr
	wZMrxBydHS4tAkMP2TG5xC5rkruSYv72sOzM2vlVUeV2YtlV9KK/ob+TgZcRoq6MQF3VHJkcGvQwl
	UV9PsmQtFcEvpKmj/IVLyUEyzINz8nCtjYpt6Q6qxAYsDianqH0NN5CkXhw5LNqEjlxQ69cLWIxBz
	hrioghBp64SZjC0ytuQMJMYIxo5PZTB5lAsi5hWk10qovhNu/0sfR3MfmaPVxx+Coy+1yHpMy5bV+
	lA0cYrhSLluOzubzOXXhd2UITOXtbf7BzPDY1XxMcm0PzXgG/1DUePaDsLmbaeMi7uaCJucyFicgK
	D2xO+waQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxTPD-0000000Fdk0-3Svi;
	Tue, 03 Mar 2026 17:19:35 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxTPB-0000000Fdic-1208
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 17:19:34 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-439b9b1900bso1650561f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 09:19:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772558371; cv=none;
        d=google.com; s=arc-20240605;
        b=XGeWBC74/ZXr8GRZ8FoRB6Lbg4ZJ5UNdbekmJo1xC0amVK1tPqFaWm7TF882uo6Q/Z
         uuux0hhYulS+zv78+8EzIl6/s0miPNK4jRRRXNHojWMFf4LjM89k9hpyJDgKkXy0aIvF
         gfm0ePYLhAy2jtP4QxRWKDRMRcdN5Nyn8R1DGZ/GHClu0XsBDOrxu3WOAqeHLSJPjg44
         0U8pQerpkWR24pRZx7KDswUl5ycZSxFEEhCmKfrIWpLcGD2uirNgaRf3NqwJ1ZxklRAh
         Hj/SHchJ70CmCw/SWWZ506iv4yumVoYCaVRThvVOmcs5WLYo8rPBN50RewhY3gnHhOGp
         zSRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4lG3IZPwbMVPm9SM64fXZ+1KlCJGNP1Tyih1mnoT5bc=;
        fh=YhNGoriymb3sQ7O1bInL3gN6V2WtG0L5EeevhgTgie4=;
        b=icz+/ee3jBYaLiVY7p7X5BH92J9Xjui9SRjJ4kvWg59+8JCbANaNSTl8h2rhvfmc3Y
         fGACEj4/HsBuFkp3RL8e34Z2UMehc6eFxCrA8/vm5/nb3VXckUCrX5lBsrsC4GYzi1Dj
         Gml7MxtKnq7Bilwt/USemq0TwkconuSe9hKQBOAmMDOE7bEGH/Ne8HvkxagItBW7d2ax
         jTQj12i/TglnHyOfh1rUeF7k18mAUISrOqEb0nlVXgJkZxiNDjGzQG+jxH+2O1l2dohJ
         LMNpgU3jQmB6cFP5PZ7WkYZRfVq/SvFQghHdPfXDY8/STZmcl+E3lAaOSnMxDwEMosGk
         Bf6w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772558371; x=1773163171; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lG3IZPwbMVPm9SM64fXZ+1KlCJGNP1Tyih1mnoT5bc=;
        b=Yh/Yi/wAfB/WlyLfrmqnUN8arqkyw0j4llRnvLl3pworD8NSg3CjzPsfVRgaSjJStx
         GpDB4YrBqLnFxHZ1+rle5BOdge2mFM4p6vO7demSTIjfR4bOLOe6nOx52RRWxwllAv/M
         coV+47qlHToYgp5CRJU0lvZJysL5rjpT5GaSJdE9vJMPHBrZBAxOjzFA7S8yWape3PNp
         PWbeeS047zdDYiDsyX9oDeuK3ZMoy0V0Q560MGhN+HTaXYS+aT7zBzrEgXbFvVS/J/le
         wKu1lbNfCw5hL+7tN2GUTouMhGR5YnU7FREdOTKcCbeNlLmKPxLbYDWmnUmebQa7pprI
         TjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772558371; x=1773163171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4lG3IZPwbMVPm9SM64fXZ+1KlCJGNP1Tyih1mnoT5bc=;
        b=B2bVPzcGaU/+9D+Gl7q9R75ApIxm0nmR6GVAcGocUCYG4DHcWH2kzkeIsKE0Lfad4u
         Oi7hp/HfiAm5QUeMRNF/KK3dNkDhD0dFOkfIEb2NrLY4QLrgZ+R7mQo9l3+QYZAeSStI
         DfiSA+EiaP6ss/at4sDu7mbFx0bYVCyVie6f8OS3NLzUhyauIqaFfDgwlbNe3WkK9vwo
         Q3Nh7Evt8+nVGBxyE0KGSDhbJumYzj9bwZvro42ztubgwquTqYvxczzTxorpfYae3fqO
         w9CKu4uIhN8HQDP+YX5kYRsRQjucRiIdLmfrb09qHU4kpZEGL7+0lqYsrU8wtgK+vHQY
         DZmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPfer2tiIJPnNzJ4Z3GoluPeRSl7sJcMOh/l4x+MxGuDhp4SE1mUlvl1Qj3qyPSSHkEnvIcUDJpM16ddut5Oze@lists.infradead.org
X-Gm-Message-State: AOJu0YzKM/egPHei0OeGZXn10vMGLHZPovjksslLFlVCBESs0a/Cn4eQ
	2pBVFlJn5IEsQdZqLHCi2zj78noEhEuXdhSc0Wv4ocMIIr+EvMhwJI6Wih+PzkrzMxvtFk0LMaa
	Ef0Y5I1k7R2RmP8i7RWa4F+NOixZP/jk=
X-Gm-Gg: ATEYQzwrXlHi8l/MhfnnzG2urUWzw/SrA3qRFb2ArpEo8vx4s7AU7Wivd4jHTT87hys
	KzHZGVvUW8FiXa5JWFvPWw2Pb5RYwM6oyKlvtmlo8j/GNTb28rm90MvfE949VcrL0GowJDyKYFg
	Ee1cQ16okGzfKo+IrWR5qMQw8iy+/LyzOoMI4eTRHbkNQXjMa6ISOJYiLsrvTRSHnK53Z2wijpI
	hTSr8gW+bQqJ1y2nz5MlZh2TyVr+URJQD2llHKxJ1Yf3RNeDgyaOs7unn7VW6WW01QkM+/JPJh/
	WRkOPAKjbS4QLJlvtEQvGk+ztKJQ3c41uB3MI2LQk15AQt+1zsplihSrHc56DH0xC87TiNUY565
	vw2oag4Z6S67cVFj4FNS3KMnYpg==
X-Received: by 2002:a05:6000:2510:b0:439:8a13:2c65 with SMTP id
 ffacd0b85a97d-4399de27c06mr27623605f8f.37.1772558370676; Tue, 03 Mar 2026
 09:19:30 -0800 (PST)
MIME-Version: 1.0
References: <20260302102726.1126019-1-xukuohai@huaweicloud.com> <20260302102726.1126019-4-xukuohai@huaweicloud.com>
In-Reply-To: <20260302102726.1126019-4-xukuohai@huaweicloud.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 3 Mar 2026 09:19:19 -0800
X-Gm-Features: AaiRm539mPHub3uCS2S3noHSaRKoMrdKE-keShol4azTs2yNuhNZuM_iwYbvnNE
Message-ID: <CAADnVQLoWzz8ioVg3MFjn08fBLfNq6HdvqLtqXV0zUb=SR_HGA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 3/5] bpf: Add helper to detect indirect jump targets
To: Xu Kuohai <xukuohai@huaweicloud.com>
Cc: bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, Puranjay Mohan <puranjay@kernel.org>, 
	Anton Protopopov <a.s.protopopov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_091933_320323_D058D7C0 
X-CRM114-Status: GOOD (  29.53  )
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

On Mon, Mar 2, 2026 at 2:02=E2=80=AFAM Xu Kuohai <xukuohai@huaweicloud.com>=
 wrote:
>
> From: Xu Kuohai <xukuohai@huawei.com>
>
> Introduce helper bpf_insn_is_indirect_target to determine whether a BPF
> instruction is an indirect jump target. This helper will be used by
> follow-up patches to decide where to emit indirect landing pad instructio=
ns.
>
> Add a new flag to struct bpf_insn_aux_data to mark instructions that are
> indirect jump targets. The BPF verifier sets this flag, and the helper
> checks it to determine whether an instruction is an indirect jump target.
>
> Also add a new field to struct bpf_insn_aux_data to track the instruction
> final index in the bpf prog, as the instructions may be rewritten by
> constant blinding in the JIT stage. This field is used as a binary search
> key to find the corresponding insn_aux_data for a given instruction.
>
> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
> ---
>  include/linux/bpf.h          |  2 ++
>  include/linux/bpf_verifier.h | 10 ++++++----
>  kernel/bpf/core.c            | 38 +++++++++++++++++++++++++++++++++---
>  kernel/bpf/verifier.c        | 13 +++++++++++-
>  4 files changed, 55 insertions(+), 8 deletions(-)
>
> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> index 05b34a6355b0..90760e250865 100644
> --- a/include/linux/bpf.h
> +++ b/include/linux/bpf.h
> @@ -1541,6 +1541,8 @@ bool bpf_has_frame_pointer(unsigned long ip);
>  int bpf_jit_charge_modmem(u32 size);
>  void bpf_jit_uncharge_modmem(u32 size);
>  bool bpf_prog_has_trampoline(const struct bpf_prog *prog);
> +bool bpf_insn_is_indirect_target(const struct bpf_verifier_env *env, con=
st struct bpf_prog *prog,
> +                                int insn_idx);
>  #else
>  static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
>                                            struct bpf_trampoline *tr,
> diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
> index c1e30096ea7b..f8f70e5414f0 100644
> --- a/include/linux/bpf_verifier.h
> +++ b/include/linux/bpf_verifier.h
> @@ -577,16 +577,18 @@ struct bpf_insn_aux_data {
>
>         /* below fields are initialized once */
>         unsigned int orig_idx; /* original instruction index */
> -       bool jmp_point;
> -       bool prune_point;
> +       unsigned int final_idx; /* final instruction index */
> +       u32 jmp_point:1;
> +       u32 prune_point:1;
>         /* ensure we check state equivalence and save state checkpoint an=
d
>          * this instruction, regardless of any heuristics
>          */
> -       bool force_checkpoint;
> +       u32 force_checkpoint:1;
>         /* true if instruction is a call to a helper function that
>          * accepts callback function as a parameter.
>          */
> -       bool calls_callback;
> +       u32 calls_callback:1;
> +       u32 indirect_target:1; /* if it is an indirect jump target */
>         /*
>          * CFG strongly connected component this instruction belongs to,
>          * zero if it is a singleton SCC.
> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> index 7702c232c62e..9a760cf43d68 100644
> --- a/kernel/bpf/core.c
> +++ b/kernel/bpf/core.c
> @@ -1486,13 +1486,41 @@ static void adjust_insn_arrays(struct bpf_prog *p=
rog, u32 off, u32 len)
>  #endif
>  }
>
> +static int bpf_insn_aux_cmp_by_insn_idx(const void *a, const void *b)
> +{
> +       int insn_idx =3D *(int *)a;
> +       int final_idx =3D ((const struct bpf_insn_aux_data *)b)->final_id=
x;
> +
> +       return insn_idx - final_idx;
> +}
> +
> +bool bpf_insn_is_indirect_target(const struct bpf_verifier_env *env, con=
st struct bpf_prog *prog,
> +                                int insn_idx)
> +{
> +       struct bpf_insn_aux_data *insn_aux;
> +       int func_idx, subprog_start, subprog_end;
> +
> +       if (!env)
> +               return false;
> +
> +       func_idx =3D prog->aux->func_idx;
> +       subprog_start =3D env->subprog_info[func_idx].start;
> +       subprog_end =3D env->subprog_info[func_idx + 1].start;
> +
> +       insn_aux =3D bsearch(&insn_idx, &env->insn_aux_data[subprog_start=
],
> +                          subprog_end - subprog_start,
> +                          sizeof(struct bpf_insn_aux_data), bpf_insn_aux=
_cmp_by_insn_idx);
> +
> +       return insn_aux && insn_aux->indirect_target;
> +}
> +
>  struct bpf_prog *bpf_jit_blind_constants(struct bpf_verifier_env *env, s=
truct bpf_prog *prog)
>  {
>         struct bpf_insn insn_buff[16], aux[2];
>         struct bpf_prog *clone, *tmp;
> -       int insn_delta, insn_cnt;
> +       int insn_delta, insn_cnt, subprog_start;
>         struct bpf_insn *insn;
> -       int i, rewritten;
> +       int i, j, rewritten;
>
>         if (!prog->blinding_requested || prog->blinded)
>                 return prog;
> @@ -1503,8 +1531,10 @@ struct bpf_prog *bpf_jit_blind_constants(struct bp=
f_verifier_env *env, struct bp
>
>         insn_cnt =3D clone->len;
>         insn =3D clone->insnsi;
> +       subprog_start =3D env->subprog_info[prog->aux->func_idx].start;
>
> -       for (i =3D 0; i < insn_cnt; i++, insn++) {
> +       for (i =3D 0, j =3D 0; i < insn_cnt; i++, j++, insn++) {
> +               env->insn_aux_data[subprog_start + j].final_idx =3D i;
>                 if (bpf_pseudo_func(insn)) {
>                         /* ld_imm64 with an address of bpf subprog is not
>                          * a user controlled constant. Don't randomize it=
,
> @@ -1512,6 +1542,8 @@ struct bpf_prog *bpf_jit_blind_constants(struct bpf=
_verifier_env *env, struct bp
>                          */
>                         insn++;
>                         i++;
> +                       j++;
> +                       env->insn_aux_data[subprog_start + j].final_idx =
=3D i;

You're adding final_idx because bpf_jit_blind_constants()
doesn't call adjust_insn_aux_data() ?

imo that's an ugly workaround. Just call adjust_insn_aux_data().

And in the future please mention such design decisions in the commit log,
so that reviewers don't need to reverse engineer your thought process.

pw-bot: cr

