Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F0BE8537A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 18:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=St1Q+eC0G4ZneHNDCt55t0/J1pND9W4YSxEJDZNyi4U=; b=WdcgN0R0cikDIAX0KVXlD+CNSj
	tKq5qkT2/fdVlQZWV95w5XWD+CVOPzGdQQjgi8H8EGdw29Kumyfe+SYNCcq6rgEQiRGUuOpIclLDs
	9cd/+vDyfI3mA9CSvMHdqWkf68YwNVfkQ3nebgJx8Gc6JTUfgy+dbspQryEG5+YIjy0SlhNGtsL/u
	7gDkeGNCxof9bunvhNWPspmYVuKJUeDPcFnLwK+ez4inLtKeHsInuOIgpDwYK6mW/BewrXiixJhow
	kF5d2YuTUQ2d9sKEfV0rgFHEzhS4usuP7nMmosQfD5VeZrptbeIw2kYr2QeMUhaSiIN45jxQTJIIZ
	vSxWCHWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8irA-00000002Pmq-2X65;
	Fri, 03 Apr 2026 18:02:56 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ir5-00000002PmJ-0tcz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 18:02:55 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2b24fdac394so20610545ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 11:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1775239370; x=1775844170; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=St1Q+eC0G4ZneHNDCt55t0/J1pND9W4YSxEJDZNyi4U=;
        b=F4ozLKQqww1mdLy8qbl8wSwPeortTF8Ur11sniXp1IWIwmNruvE6cBVpr9X8FGiAlb
         6oBYhqR/M+QZ7D35D66lk7URluTZ8AECgzQCrncEOaenUlvqWoYyq/5uiC7RmFEkYmT0
         2RRFBAN4pt7y84eAViWT12XeqNi/PjSqsFhvONCtd0vpWU/UCFFd/+tN0rXmRFXCdvol
         L4NIGCY+XnY7o1X0CoRAGX3lG5xDam7EkvjX4/va8fFFrazeV/h4eJm3Dccu2fPvRkQQ
         WmvyCsyvxvXfgfA4zaqvhwu38KQ3C4nSrX5Th+ugCK49q9LYJHNZZyXUJWKaZkva4Y2S
         Xsnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775239370; x=1775844170;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=St1Q+eC0G4ZneHNDCt55t0/J1pND9W4YSxEJDZNyi4U=;
        b=Rn36AiA7+UORuXkxS8gABtTzCuoopL/PPG0rnYiqAycZMrgioVkaYb++SRHhGXLO0P
         utg2cy4WrwarBncRaQtGoU6KMofHmoXFlfpVp7AnSUOmk9sHOtZGnVkOmjzJdznWKqgA
         0H37B23bW6e4rZChNZmzpFSuQMP6o5UpymqG54qU9QsxuTTKJj9mRIxrY2bW/XXIpF7h
         pTp4cxzYN2BXI/bTbCwoDZPm+y4JTxYL9qTMEEH4ec/ozKC8cd0gRXNIr5/2mkY8r5Vn
         Btax47fJvzRqY9TTd9qfo6iUFaRYUIWgGWz7k1CxNbEOi0yafut7AzmXniGmRmAzNKHu
         OOKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5TxH3av2tK4YDfQl56s9g6YhwynBbn7tIhtgCXvBW+j2NH+y+XRhSLuEX48pQwRjbUvw1lfgTcqpvIZeL5YLS@lists.infradead.org
X-Gm-Message-State: AOJu0YzS1GLjMyqszbzgpartf15BcEDPAz5SPUsAxbTPH/mL0gfPWw4E
	X9hkKVN3QC05/1Mux7RL4Xzlpz9M4QfXQAzmKlKIKJQ7JFVzcWhY932nWz9R08H2SKI=
X-Gm-Gg: AeBDies/qWs79C2bZgJwsT/WB0vGgaoysCQtld4KBv32NkXeP6e2cJ1TNeoPgB+bUgz
	qdqB8dGyv5qBP2z98npMvDcadv+alwcbKWBm89NCB1tCAfR9vORXn9FzmNtpavz9b9PBbiyLsWn
	DzT6KYQc+2ncGoGDr25yyS/E6G4m4qM095nt5K9kM9/BVigsfPqAJfi8siFsdo9WER16y4p+0PA
	aRug8Fzb4giFcRiv8NMQz2Gtmc/f4IHytcF1EBnzzyv8jZC3Q6TSsLeZwY1vJEd6dlG/PWonaZM
	8eKGbAAct1TJOmQEjaGAx4nM7izpcUneNlfPglDx11uB6vDAinubw47M0zIg8nYzQllSyliQLJ5
	yfls3MmagiLX6JxwBplXzN1c0vRhm1MU/zBIG/UQJcXPuEkJyzw78xp7dMSUEWEkwvLl/xFdDl5
	gKLcWAMOE=
X-Received: by 2002:a17:903:1b70:b0:2b0:bebb:1081 with SMTP id d9443c01a7336-2b281799025mr44217265ad.28.1775239369871;
        Fri, 03 Apr 2026 11:02:49 -0700 (PDT)
Received: from localhost ([2604:3d08:487d:cd00::5517])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af26sm63916025ad.49.2026.04.03.11.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 11:02:49 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Apr 2026 14:02:47 -0400
Message-Id: <DHJPU2PATPEF.1QNVY25530KTK@etsalapatis.com>
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
Subject: Re: [PATCH bpf-next v12 3/5] bpf: Add helper to detect indirect
 jump targets
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Xu Kuohai" <xukuohai@huaweicloud.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260403132811.753894-1-xukuohai@huaweicloud.com>
 <20260403132811.753894-4-xukuohai@huaweicloud.com>
In-Reply-To: <20260403132811.753894-4-xukuohai@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_110251_527168_D44E4E4C 
X-CRM114-Status: GOOD (  26.82  )
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
> Introduce helper bpf_insn_is_indirect_target to check whether a BPF
> instruction is an indirect jump target.
>
> Since the verifier knows which instructions are indirect jump targets,
> add a new flag indirect_target to struct bpf_insn_aux_data to mark
> them. The verifier sets this flag when verifying an indirect jump target
> instruction, and the helper checks the flag to determine whether an
> instruction is an indirect jump target.

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

>
> Reviewed-by: Anton Protopopov <a.s.protopopov@gmail.com>
> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
> ---
>  include/linux/bpf.h          |  2 ++
>  include/linux/bpf_verifier.h |  9 +++++----
>  kernel/bpf/core.c            |  9 +++++++++
>  kernel/bpf/verifier.c        | 18 ++++++++++++++++++
>  4 files changed, 34 insertions(+), 4 deletions(-)
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
> +				 int insn_idx);
>  #else
>  static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
>  					   struct bpf_trampoline *tr,
> diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
> index b129e0aaee20..cc53877639a5 100644
> --- a/include/linux/bpf_verifier.h
> +++ b/include/linux/bpf_verifier.h
> @@ -578,16 +578,17 @@ struct bpf_insn_aux_data {
> =20
>  	/* below fields are initialized once */
>  	unsigned int orig_idx; /* original instruction index */
> -	bool jmp_point;
> -	bool prune_point;
> +	u32 jmp_point:1;
> +	u32 prune_point:1;
>  	/* ensure we check state equivalence and save state checkpoint and
>  	 * this instruction, regardless of any heuristics
>  	 */
> -	bool force_checkpoint;
> +	u32 force_checkpoint:1;
>  	/* true if instruction is a call to a helper function that
>  	 * accepts callback function as a parameter.
>  	 */
> -	bool calls_callback;
> +	u32 calls_callback:1;
> +	u32 indirect_target:1; /* if it is an indirect jump target */
>  	/*
>  	 * CFG strongly connected component this instruction belongs to,
>  	 * zero if it is a singleton SCC.
> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> index 093ab0f68c81..439575fa6976 100644
> --- a/kernel/bpf/core.c
> +++ b/kernel/bpf/core.c
> @@ -1570,6 +1570,15 @@ struct bpf_prog *bpf_jit_blind_constants(struct bp=
f_verifier_env *env, struct bp
>  	clone->blinded =3D 1;
>  	return clone;
>  }
> +
> +bool bpf_insn_is_indirect_target(const struct bpf_verifier_env *env, con=
st struct bpf_prog *prog,
> +				 int insn_idx)
> +{
> +	if (!env)
> +		return false;
> +	insn_idx +=3D prog->aux->subprog_start;
> +	return env->insn_aux_data[insn_idx].indirect_target;
> +}
>  #endif /* CONFIG_BPF_JIT */
> =20
>  /* Base function for offset calculation. Needs to go into .text section,
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 5084a754a748..e078e6ad5b00 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -4049,6 +4049,11 @@ static bool is_jmp_point(struct bpf_verifier_env *=
env, int insn_idx)
>  	return env->insn_aux_data[insn_idx].jmp_point;
>  }
> =20
> +static void mark_indirect_target(struct bpf_verifier_env *env, int idx)
> +{
> +	env->insn_aux_data[idx].indirect_target =3D true;
> +}
> +
>  #define LR_FRAMENO_BITS	3
>  #define LR_SPI_BITS	6
>  #define LR_ENTRY_BITS	(LR_SPI_BITS + LR_FRAMENO_BITS + 1)
> @@ -21227,12 +21232,14 @@ static int check_indirect_jump(struct bpf_verif=
ier_env *env, struct bpf_insn *in
>  	}
> =20
>  	for (i =3D 0; i < n - 1; i++) {
> +		mark_indirect_target(env, env->gotox_tmp_buf->items[i]);
>  		other_branch =3D push_stack(env, env->gotox_tmp_buf->items[i],
>  					  env->insn_idx, env->cur_state->speculative);
>  		if (IS_ERR(other_branch))
>  			return PTR_ERR(other_branch);
>  	}
>  	env->insn_idx =3D env->gotox_tmp_buf->items[n-1];
> +	mark_indirect_target(env, env->insn_idx);
>  	return 0;
>  }
> =20
> @@ -22158,6 +22165,17 @@ static void adjust_insn_aux_data(struct bpf_veri=
fier_env *env,
>  		data[i].seen =3D old_seen;
>  		data[i].zext_dst =3D insn_has_def32(insn + i);
>  	}
> +
> +	/* The indirect_target flag of the original instruction was moved to th=
e last of the
> +	 * new instructions by the above memmove and memset, but the indirect j=
ump target is
> +	 * actually the first instruction, so move it back. This also matches w=
ith the behavior
> +	 * of bpf_insn_array_adjust(), which preserves xlated_off to point to t=
he first new
> +	 * instruction.
> +	 */
> +	if (data[off + cnt - 1].indirect_target) {
> +		data[off].indirect_target =3D 1;
> +		data[off + cnt - 1].indirect_target =3D 0;
> +	}
>  }
> =20
>  static void adjust_subprog_starts(struct bpf_verifier_env *env, u32 off,=
 u32 len)


