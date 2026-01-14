Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B42D29FE5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 10:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4kXQqP8vHkbnxWDEukkjz+eOd3+2/jYGQdFhLamLH/A=; b=zQtcTorlNsCeNiX9swXnDiGiY9
	iu/A5s8Y+W7KWD0kdF33geE/YBvrwpyINu/78DuzhLbL0ZcV7GX+VHI/pgBDq6EcMuX/NW5jK3eF0
	oqnTcIBukHUIDCyqRTx5AxGgmP+UgX2MxFuSnAIyEyZOcdE2g68es3LqJ26nx1ifyLC5fl0cWyFCD
	NDhFx8aKGDgsTO7uU+ZJGXYTcf/+kwOWABhc3sDyXm0b5UxlzgSREuEtHScjNxwQBZwOW/zL6vJct
	ZZl+NxB1qERZpo9cyDB+ud7BH+Hj3LQRljQfnwkgC9Qehistr1Oii+Ds6mBvLGYeboc1+Y/y8/twN
	aE9QZj/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyUk-00000008sGx-1XUE;
	Wed, 14 Jan 2026 10:52:58 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyUi-00000008sG7-0rSw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 10:52:57 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-65089cebdb4so11869768a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 02:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768387974; x=1768992774; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4kXQqP8vHkbnxWDEukkjz+eOd3+2/jYGQdFhLamLH/A=;
        b=iPJOSokqxYOmOUZfmNfvzM34HUDaLdZc4F4K8vl+1OmBBVPBBoEe8jC95+fmg4pKXh
         AyPp+ql959SgSyPnuWOsN9GFUgmeov3J5oOm93wS+jOxU0fWn1e9xMXXZuxkYiA1WKx0
         rCwjDQuFKuu2A7aThBPbF0x2uW0VwZmZ7qw78RxnvZAOtNwwZ3f2TkqGaBHW38piBSHN
         uy1AabykHD/R2P6T5aNNoTcEsjPEJ9IvX/NyfQCk983imdhKjJSBx+BaLNmH7JjFDRs9
         gBWtqTSSTt+zYkZTl8qq/6djrIzPN6R+cuR7R/tUaOliIfj7OswR2WmrFYs9SOz0EXg7
         gGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768387974; x=1768992774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4kXQqP8vHkbnxWDEukkjz+eOd3+2/jYGQdFhLamLH/A=;
        b=b/3Z2YxH0JGXym5ywKAsGXIytD0/RF/yUDz+qTDAQ8a5qHOsWqNV5WG+X3pdd7koMn
         9DKweTed8VqjeE9wArITFotL6mpK4ZvIaNIDBPKD6YFD9oa/RY0jir8Dbp/xUieaz/v0
         YqUHCQO6P6dD5bQpDNRmsUwfxG52BYhaUIo7p2iUpfZIDbeBvcuU0ctHNYy8ooRfONfz
         +gyiPVRGqgUttWo3G3r653rMytwktUg1M5osIfFlB0hp4VcrkgDVkKB7CkUVbREuec74
         8ZqEq4a5OCk2hL0SMDKeJ4RNeTQQCJVeCsQnQykDTasmRO/ysDrr+FaN/66ic1nMJ/oL
         LrLw==
X-Forwarded-Encrypted: i=1; AJvYcCXKmd9YqxsFXQe6oO0B6YBKBvist58f0avkZ5PSIVIkuGkOzMqebuJPWNQMq5Ko39S3EuddJRqdBHn5OW5B/N3G@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm3T1S+qofqdM9lEQ9SGokMfzqwRNBvnczWPviKiR6aNzQE/+C
	7aQf+UwK1gHJZVaHRONsO4HUvpXFSIlc+6gWGqrQ92VlgNn1A+L9Zk6x
X-Gm-Gg: AY/fxX4F6D12Au9226fhOmMM/i91dKQUSNsatTnfNMlBXF919qZVVLDuU8jJPvX5isp
	pFH9q5Si5cy7dUWkzk1T2fJCUk65LTqnFtWoboyKugSvPJRAjfelVBv00O4XXN9PU3IWLsynLIf
	/SauZhmBEB/3c2kKqxudOU7i75Rd5NojDjjqq+nSqVZ3ZiHKHe5ieffEivCP/4wYqB/JV/Pe5dK
	YuaZcJPJ0XVuG5NWsEV9coY2Kb+l+eJXzHe2cU+DLwUUVJCasmvHcSZJ/Y/DlWvkuIMgejcJYOs
	yoO2zdF2qacBjBbjeQ6YuBkCzE3UwWt8yqv9sKax/LKPuNEi85BhAdvN3jIjJBiYRDKEPm+TtLg
	h/7Flonc4p8eQLXShYBUN5Nop2iQuTprQxH0myq4YC/CvaxeG8buYYJr51wTI3+Yew/wsKKpaEl
	7iuL6cmUKlNSNHVhIvxeTCDb7fSllGhv4=
X-Received: by 2002:a05:6402:1d50:b0:64b:7dd2:6b9d with SMTP id 4fb4d7f45d1cf-653ec11cac9mr1660982a12.8.1768387974025;
        Wed, 14 Jan 2026 02:52:54 -0800 (PST)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf661f3sm25006719a12.26.2026.01.14.02.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:52:53 -0800 (PST)
Date: Wed, 14 Jan 2026 11:00:40 +0000
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
	Puranjay Mohan <puranjay@kernel.org>
Subject: Re: [PATCH bpf-next v4 2/4] bpf: Add helper to detect indirect jump
 targets
Message-ID: <aWd3WBMVjpaFw39w@mail.gmail.com>
References: <20260114093914.2403982-1-xukuohai@huaweicloud.com>
 <20260114093914.2403982-3-xukuohai@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114093914.2403982-3-xukuohai@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_025256_304400_976C17C2 
X-CRM114-Status: GOOD (  42.99  )
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

On 26/01/14 05:39PM, Xu Kuohai wrote:
> From: Xu Kuohai <xukuohai@huawei.com>
> 
> Introduce helper bpf_insn_is_indirect_target to determine whether a BPF
> instruction is an indirect jump target. This helper will be used by
> follow-up patches to decide where to emit indirect landing pad instructions.
> 
> Add a new flag to struct bpf_insn_aux_data to mark instructions that are
> indirect jump targets. The BPF verifier sets this flag, and the helper
> checks it to determine whether an instruction is an indirect jump target.
> 
> Since bpf_insn_aux_data is only available before JIT stage, add a new
> field to struct bpf_prog_aux to store a pointer to the bpf_insn_aux_data
> array, making it accessible to the JIT.
> 
> For programs with multiple subprogs, each subprog uses its own private
> copy of insn_aux_data, since subprogs may insert additional instructions
> during JIT and need to update the array. For non-subprog, the verifier's
> insn_aux_data array is used directly to avoid unnecessary copying.
> 
> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
> ---
>  include/linux/bpf.h          |  2 ++
>  include/linux/bpf_verifier.h | 10 ++++---
>  kernel/bpf/core.c            | 51 +++++++++++++++++++++++++++++++++---
>  kernel/bpf/verifier.c        | 51 +++++++++++++++++++++++++++++++++++-
>  4 files changed, 105 insertions(+), 9 deletions(-)
> 
> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> index 5936f8e2996f..e7d7e705327e 100644
> --- a/include/linux/bpf.h
> +++ b/include/linux/bpf.h
> @@ -1533,6 +1533,7 @@ bool bpf_has_frame_pointer(unsigned long ip);
>  int bpf_jit_charge_modmem(u32 size);
>  void bpf_jit_uncharge_modmem(u32 size);
>  bool bpf_prog_has_trampoline(const struct bpf_prog *prog);
> +bool bpf_insn_is_indirect_target(const struct bpf_prog *prog, int idx);
>  #else
>  static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
>  					   struct bpf_trampoline *tr,
> @@ -1760,6 +1761,7 @@ struct bpf_prog_aux {
>  	struct bpf_stream stream[2];
>  	struct mutex st_ops_assoc_mutex;
>  	struct bpf_map __rcu *st_ops_assoc;
> +	struct bpf_insn_aux_data *insn_aux;
>  };
>  
>  #define BPF_NR_CONTEXTS        4       /* normal, softirq, hardirq, NMI */
> diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
> index 130bcbd66f60..758086b384df 100644
> --- a/include/linux/bpf_verifier.h
> +++ b/include/linux/bpf_verifier.h
> @@ -574,16 +574,18 @@ struct bpf_insn_aux_data {
>  
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
> +	/* true if the instruction is an indirect jump target */
> +	u32 indirect_target:1;
>  	/*
>  	 * CFG strongly connected component this instruction belongs to,
>  	 * zero if it is a singleton SCC.
> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> index e0b8a8a5aaa9..bb870936e74b 100644
> --- a/kernel/bpf/core.c
> +++ b/kernel/bpf/core.c
> @@ -1486,6 +1486,35 @@ static void adjust_insn_arrays(struct bpf_prog *prog, u32 off, u32 len)
>  #endif
>  }
>  
> +static int adjust_insn_aux(struct bpf_prog *prog, int off, int cnt)
> +{
> +	size_t size;
> +	struct bpf_insn_aux_data *new_aux;
> +
> +	if (cnt == 1)
> +		return 0;
> +
> +	/* prog->len already accounts for the cnt - 1 newly inserted instructions */
> +	size = array_size(prog->len, sizeof(struct bpf_insn_aux_data));
> +	new_aux = vrealloc(prog->aux->insn_aux, size, GFP_KERNEL_ACCOUNT | __GFP_ZERO);
> +	if (!new_aux)
> +		return -ENOMEM;
> +
> +	/* follow the same behavior as adjust_insn_array(): leave [0, off] unchanged and shift
> +	 * [off + 1, end) to [off + cnt, end). Otherwise, the JIT would emit landing pads at
> +	 * wrong locations, as the actual indirect jump target remains at off.
> +	 */
> +	size = array_size(prog->len - off - cnt, sizeof(struct bpf_insn_aux_data));
> +	memmove(new_aux + off + cnt, new_aux + off + 1, size);
> +
> +	size = array_size(cnt - 1, sizeof(struct bpf_insn_aux_data));
> +	memset(new_aux + off + 1, 0, size);
> +
> +	prog->aux->insn_aux = new_aux;
> +
> +	return 0;
> +}
> +
>  struct bpf_prog *bpf_jit_blind_constants(struct bpf_prog *prog)
>  {
>  	struct bpf_insn insn_buff[16], aux[2];
> @@ -1541,6 +1570,11 @@ struct bpf_prog *bpf_jit_blind_constants(struct bpf_prog *prog)
>  		clone = tmp;
>  		insn_delta = rewritten - 1;
>  
> +		if (adjust_insn_aux(clone, i, rewritten)) {
> +			bpf_jit_prog_release_other(prog, clone);
> +			return ERR_PTR(-ENOMEM);
> +		}
> +
>  		/* Instructions arrays must be updated using absolute xlated offsets */
>  		adjust_insn_arrays(clone, prog->aux->subprog_start + i, rewritten);
>  
> @@ -1553,6 +1587,11 @@ struct bpf_prog *bpf_jit_blind_constants(struct bpf_prog *prog)
>  	clone->blinded = 1;
>  	return clone;
>  }
> +
> +bool bpf_insn_is_indirect_target(const struct bpf_prog *prog, int idx)
> +{
> +	return prog->aux->insn_aux && prog->aux->insn_aux[idx].indirect_target;

Is there a case when insn_aux is NULL?

> +}
>  #endif /* CONFIG_BPF_JIT */
>  
>  /* Base function for offset calculation. Needs to go into .text section,
> @@ -2540,24 +2579,24 @@ struct bpf_prog *bpf_prog_select_runtime(struct bpf_prog *fp, int *err)
>  	if (!bpf_prog_is_offloaded(fp->aux)) {
>  		*err = bpf_prog_alloc_jited_linfo(fp);
>  		if (*err)
> -			return fp;
> +			goto free_insn_aux;
>  
>  		fp = bpf_int_jit_compile(fp);
>  		bpf_prog_jit_attempt_done(fp);
>  		if (!fp->jited && jit_needed) {
>  			*err = -ENOTSUPP;
> -			return fp;
> +			goto free_insn_aux;
>  		}
>  	} else {
>  		*err = bpf_prog_offload_compile(fp);
>  		if (*err)
> -			return fp;
> +			goto free_insn_aux;
>  	}
>  
>  finalize:
>  	*err = bpf_prog_lock_ro(fp);
>  	if (*err)
> -		return fp;
> +		goto free_insn_aux;
>  
>  	/* The tail call compatibility check can only be done at
>  	 * this late stage as we need to determine, if we deal
> @@ -2566,6 +2605,10 @@ struct bpf_prog *bpf_prog_select_runtime(struct bpf_prog *fp, int *err)
>  	 */
>  	*err = bpf_check_tail_call(fp);
>  
> +free_insn_aux:
> +	vfree(fp->aux->insn_aux);
> +	fp->aux->insn_aux = NULL;
> +
>  	return fp;
>  }
>  EXPORT_SYMBOL_GPL(bpf_prog_select_runtime);
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 22605d9e0ffa..f2fe6baeceb9 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -3852,6 +3852,11 @@ static bool is_jmp_point(struct bpf_verifier_env *env, int insn_idx)
>  	return env->insn_aux_data[insn_idx].jmp_point;
>  }
>  
> +static void mark_indirect_target(struct bpf_verifier_env *env, int idx)
> +{
> +	env->insn_aux_data[idx].indirect_target = true;
> +}
> +
>  #define LR_FRAMENO_BITS	3
>  #define LR_SPI_BITS	6
>  #define LR_ENTRY_BITS	(LR_SPI_BITS + LR_FRAMENO_BITS + 1)
> @@ -20337,6 +20342,7 @@ static int check_indirect_jump(struct bpf_verifier_env *env, struct bpf_insn *in
>  	}
>  
>  	for (i = 0; i < n; i++) {

^ n -> n-1

> +		mark_indirect_target(env, env->gotox_tmp_buf->items[i]);
>  		other_branch = push_stack(env, env->gotox_tmp_buf->items[i],
>  					  env->insn_idx, env->cur_state->speculative);
>  		if (IS_ERR(other_branch))
> @@ -21243,6 +21249,37 @@ static void convert_pseudo_ld_imm64(struct bpf_verifier_env *env)
>  	}

mark_indirect_target(n-1)

>  }
>  
> +static int clone_insn_aux_data(struct bpf_prog *prog, struct bpf_verifier_env *env, u32 off)
> +{
> +	u32 i;
> +	size_t size;
> +	bool has_indirect_target = false;
> +	struct bpf_insn_aux_data *insn_aux;
> +
> +	for (i = 0; i < prog->len; i++) {
> +		if (env->insn_aux_data[off + i].indirect_target) {
> +			has_indirect_target = true;
> +			break;
> +		}
> +	}
> +
> +	/* insn_aux is copied into bpf_prog so the JIT can check whether an instruction is an
> +	 * indirect jump target. If no indirect jump targets exist, copying is unnecessary.
> +	 */
> +	if (!has_indirect_target)
> +		return 0;
> +
> +	size = array_size(sizeof(struct bpf_insn_aux_data), prog->len);
> +	insn_aux = vzalloc(size);
> +	if (!insn_aux)
> +		return -ENOMEM;
> +
> +	memcpy(insn_aux, env->insn_aux_data + off, size);
> +	prog->aux->insn_aux = insn_aux;
> +
> +	return 0;
> +}
> +
>  /* single env->prog->insni[off] instruction was replaced with the range
>   * insni[off, off + cnt).  Adjust corresponding insn_aux_data by copying
>   * [0, off) and [off, end) to new locations, so the patched range stays zero
> @@ -22239,6 +22276,10 @@ static int jit_subprogs(struct bpf_verifier_env *env)
>  		if (!i)
>  			func[i]->aux->exception_boundary = env->seen_exception;
>  
> +		err = clone_insn_aux_data(func[i], env, subprog_start);
> +		if (err < 0)
> +			goto out_free;
> +
>  		/*
>  		 * To properly pass the absolute subprog start to jit
>  		 * all instruction adjustments should be accumulated
> @@ -22306,6 +22347,8 @@ static int jit_subprogs(struct bpf_verifier_env *env)
>  	for (i = 0; i < env->subprog_cnt; i++) {
>  		func[i]->aux->used_maps = NULL;
>  		func[i]->aux->used_map_cnt = 0;
> +		vfree(func[i]->aux->insn_aux);
> +		func[i]->aux->insn_aux = NULL;
>  	}
>  
>  	/* finally lock prog and jit images for all functions and
> @@ -22367,6 +22410,7 @@ static int jit_subprogs(struct bpf_verifier_env *env)
>  	for (i = 0; i < env->subprog_cnt; i++) {
>  		if (!func[i])
>  			continue;
> +		vfree(func[i]->aux->insn_aux);
>  		func[i]->aux->poke_tab = NULL;
>  		bpf_jit_free(func[i]);
>  	}
> @@ -25350,6 +25394,7 @@ int bpf_check(struct bpf_prog **prog, union bpf_attr *attr, bpfptr_t uattr, __u3
>  	env->verification_time = ktime_get_ns() - start_time;
>  	print_verification_stats(env);
>  	env->prog->aux->verified_insns = env->insn_processed;
> +	env->prog->aux->insn_aux = env->insn_aux_data;
>  
>  	/* preserve original error even if log finalization is successful */
>  	err = bpf_vlog_finalize(&env->log, &log_true_size);
> @@ -25428,7 +25473,11 @@ int bpf_check(struct bpf_prog **prog, union bpf_attr *attr, bpfptr_t uattr, __u3
>  	if (!is_priv)
>  		mutex_unlock(&bpf_verifier_lock);
>  	clear_insn_aux_data(env, 0, env->prog->len);
> -	vfree(env->insn_aux_data);
> +	/* on success, insn_aux_data will be freed by bpf_prog_select_runtime */
> +	if (ret) {
> +		vfree(env->insn_aux_data);
> +		env->prog->aux->insn_aux = NULL;
> +	}
>  err_free_env:
>  	bpf_stack_liveness_free(env);
>  	kvfree(env->cfg.insn_postorder);
> -- 
> 2.47.3
> 

LGTM, just in case, could you please tell how you have tested
this patchset exactly?

