Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40683F4181F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 17:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=popiN9giVNSxFEXNtoVkUQBWgWnWRyzWI0B1NJHLewA=; b=sSGADm2pZpADchmFx25XtDgqIh
	3vfE/2T2+tyDXkrFvTbLuftoc7K5IkRaBnV3Ax4/YH5XrN21CRhJB3b5yWUwIaDzTAWCAiOA7QRpA
	HXJrbqmZE79d8+hqJ4kYvEGJC3SooDtOJbVPf7JC1WIJRtdJWFFe/8NABuEZ5oYKM0oQoOLD6Mp7T
	J3rVjrMAtVUsyVvZBHzAYptQckBVynEM0/IrzvYUZXnl8JaQl9utblMPUOJ3EDGc64JRaicVhXDu3
	svfP/TaiVYna5sYmaCaFum6O9iE0iH5S8FbzL6He4vzVebiG3yTSoEJEU7Vmhzkm+5fA+rsqjYhDm
	mphp8NAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzeJ7-00000007p1A-3Omo;
	Mon, 09 Mar 2026 17:22:17 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzeJ5-00000007p0m-2fTS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 17:22:17 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-439aa2f8ebaso5730537f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 10:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773076933; x=1773681733; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=popiN9giVNSxFEXNtoVkUQBWgWnWRyzWI0B1NJHLewA=;
        b=mojitbt87bFynT7HpVB99JwieiO/9XrXFychG9L9n9aWRPdKW0V4fsJH7tGdVY9znz
         Vw0bNv9m6JwZrF8LWEpv7oG7JZFe9zTLujiVwQQ4UqanhOjG7hPp37KbFOpERQRAYIse
         BVp7jq6wa8BdI2q7tCk/BgJUmclMSQ3h8Y07Uj2tOcyTh0kDS4Zdd1THSWFWXH3sci8o
         sMWrp2zb6FqiYGUJ8YNInD9WbzQ4BvBdAc5SzYRwiFHYI8eXjJ/cqcmv+k3eNDOxOmCS
         WAx/9W/I3XfZNZRJnWX4hwYN1iilV05Au6Pqp1vLBAwsSJT0MqZTgQICFQ96uS0l2zAf
         i/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773076933; x=1773681733;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=popiN9giVNSxFEXNtoVkUQBWgWnWRyzWI0B1NJHLewA=;
        b=dHMqC1TwpThY0q+j6bVk7tKQ5AbQdPM74F0NDtwDB6QyhCTI/7NkdWmWr9Inljd1Hy
         swjJaP+2pUapKfSvsq4MpX+aI0C7fOXHBspZn9zZbq3iqhdvgFyUfsvNC6vkav9Qsv5/
         PdByYzNbaQQuyFO65RbwisFFibUth3cYpMlhEpjapPUPnblzKonqFmvCDPBWJQSijY6r
         UIXzTbxX7tauH4ufEgWJXkoS5rUwrCffb9G2N/8n3Z8EgYvGgJQfjEmj+Dc2BvWfQg5A
         OuIXxdGglboU/4tSpbHRaoZ6p9KkdofFr24mujknx5aTZRvDL+5G/nCSnwUJ0KB7t2Q7
         1Fqw==
X-Forwarded-Encrypted: i=1; AJvYcCVy5JoVWgsRhAY5cGcY7zBTXZHX0+D5vqWiszNr0vYCljPpxdpck61XqpzJnlmlcW0wOesWPiGK2E4uIsabiWUy@lists.infradead.org
X-Gm-Message-State: AOJu0YztBH/WA+TgZ6IatplEAF+2z94rhnUrdTmzcGDE40aiflSvmDFz
	oweFG6sKuL4LGfRQfM+ot+tok8X2wHB74fQ/RRpkdpbLiVTX/O9F5U2e
X-Gm-Gg: ATEYQzzduTzje4n7kHV5RU6gHUU8AbWpM3SOTP9O9DZeSPU/iuPl73ijOzJFRo//9Np
	O4Jkd5iKoZCDdI5D/WVHyLkDkw61zW5uiFcdLbriyfFQbqcDi40FfRValJHTjWNPUJAtgnUc29Y
	MdhyGPtYXNM8emIKd8HUkmefVaO8ETo7HFDCHOpx9A4fWhz59xuv3KdKTKWFsu5uvngLWJtsp1x
	1TVRKe/URKhTHXtYceQcgifPbetf9Z6F5UtMcc7FW3UWVgUBc4WPUkJ1FBK4fcdmXW6nGsnZ778
	hmeJbsXkcdt3oz49h+JOijHRPwJPauHU+gQMmLQZM38+m2fVsy0J4iIDitCI3jAdkDcSPxwkJsy
	V45g9wO/KsNfR0Fkdj3VYJGVfX2ZM4ytLMMQ3aZRKAl7lYEY/247EFwaYHthSXDmbltgW4B7ns1
	9qjVhyunR9YFOjl/Kupx2xtF0ngCfB8076
X-Received: by 2002:a05:6000:26d1:b0:439:b486:ba6b with SMTP id ffacd0b85a97d-439da89401fmr21299511f8f.39.1773076933239;
        Mon, 09 Mar 2026 10:22:13 -0700 (PDT)
Received: from mail.gmail.com ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae49177sm27108030f8f.35.2026.03.09.10.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 10:22:12 -0700 (PDT)
Date: Mon, 9 Mar 2026 17:30:45 +0000
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
Subject: Re: [bpf-next v8 3/5] bpf: Add helper to detect indirect jump targets
Message-ID: <aa8DxUESQAI/zAEs@mail.gmail.com>
References: <20260309140044.2652538-1-xukuohai@huaweicloud.com>
 <20260309140044.2652538-4-xukuohai@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309140044.2652538-4-xukuohai@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_102215_919232_D4883C83 
X-CRM114-Status: GOOD (  30.58  )
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
> Introduce helper bpf_insn_is_indirect_target to check whether a BPF
> instruction is an indirect jump target.
> 
> Since the verifier knows which instructions are indirect jump targets,
> add a new flag indirect_target to struct bpf_insn_aux_data to mark
> them. The verifier sets this flag when verifing an indirect jump target
> instruction, and the helper checks it to determine whether an
> instruction is an indirect jump target.
> 
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
> +bool bpf_insn_is_indirect_target(const struct bpf_verifier_env *env, const struct bpf_prog *prog,
> +				 int insn_idx);
>  #else
>  static inline int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
>  					   struct bpf_trampoline *tr,
> diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
> index 090aa26d1c98..6431b94746cf 100644
> --- a/include/linux/bpf_verifier.h
> +++ b/include/linux/bpf_verifier.h
> @@ -578,16 +578,17 @@ struct bpf_insn_aux_data {
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
> +	u32 indirect_target:1; /* if it is an indirect jump target */
>  	/*
>  	 * CFG strongly connected component this instruction belongs to,
>  	 * zero if it is a singleton SCC.
> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> index 88a1834030a0..ccc618a50103 100644
> --- a/kernel/bpf/core.c
> +++ b/kernel/bpf/core.c
> @@ -1480,6 +1480,15 @@ int bpf_jit_blind_constants(struct bpf_verifier_env *env)
>  	prog->blinded = 1;
>  	return 0;
>  }
> +
> +bool bpf_insn_is_indirect_target(const struct bpf_verifier_env *env, const struct bpf_prog *prog,
> +				 int insn_idx)
> +{
> +	if (!env)
> +		return false;
> +	insn_idx += prog->aux->subprog_start;
> +	return env->insn_aux_data[insn_idx].indirect_target;
> +}
>  #endif /* CONFIG_BPF_JIT */
>  
>  /* Base function for offset calculation. Needs to go into .text section,
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index fc3ba380b74a..8d8e349f98cd 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -4022,6 +4022,11 @@ static bool is_jmp_point(struct bpf_verifier_env *env, int insn_idx)
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
> @@ -21082,12 +21087,14 @@ static int check_indirect_jump(struct bpf_verifier_env *env, struct bpf_insn *in
>  	}
>  
>  	for (i = 0; i < n - 1; i++) {
> +		mark_indirect_target(env, env->gotox_tmp_buf->items[i]);
>  		other_branch = push_stack(env, env->gotox_tmp_buf->items[i],
>  					  env->insn_idx, env->cur_state->speculative);
>  		if (IS_ERR(other_branch))
>  			return PTR_ERR(other_branch);
>  	}
>  	env->insn_idx = env->gotox_tmp_buf->items[n-1];
> +	mark_indirect_target(env, env->insn_idx);
>  	return 0;
>  }
>  
> @@ -22013,6 +22020,17 @@ static void adjust_insn_aux_data(struct bpf_verifier_env *env,
>  		data[i].seen = old_seen;
>  		data[i].zext_dst = insn_has_def32(insn + i);
>  	}
> +
> +	/* The indirect_target flag of the original instruction was moved to the last of the
> +	 * new instructions by the above memmove and memset, but the indirect jump target is
> +	 * actually the first instruction, so move it back. This also matches with the behavior
> +	 * of bpf_insn_array_adjust(), which preserves xlated_off to point to the first new
> +	 * instruction.
> +	 */
> +	if (data[off + cnt - 1].indirect_target) {
> +		data[off].indirect_target = 1;
> +		data[off + cnt - 1].indirect_target = 0;
> +	}
>  }
>  
>  static void adjust_subprog_starts(struct bpf_verifier_env *env, u32 off, u32 len)
> -- 
> 2.47.3
> 

Reviewed-by: Anton Protopopov <a.s.protopopov@gmail.com>

