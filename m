Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6801CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 04:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8mx7h0My419s2P7k1BFl0yESBgvzIQJC2piNf13boJc=; b=w6ubjF9ZV+FB9cinCkswSs9uQQ
	ymd3ignDAqJQUK2NulEoP+rXjrL2tCbGdu/XDkYBBw214Rthpa1w5zpfpA+/TL4P6Wb6UellCmUZ8
	PV1YTpn1fwSWjasRIEmYQi4Bg/xOWwYZiZokKh975/XmOKSV2OXzUPxI8XdqNS73vuEqbjfGYOqiA
	HVFPcOHLoDy9s04B/PsRiNk4KPyXN+YzGDZumvjGYzJsz6Dc/jTsvPHmR6+zy3eJiYG33Cvzh0879
	3e665/8/JEeU6MIJQgG90WZ67q7bSL3OmQ1DHkPo0T23TNGkzMey9VihJIoxxPgmSpzD+3Qeqtm9+
	EdutI7Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPuol-00000006dPm-2cYI;
	Thu, 21 May 2026 04:15:31 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPuoi-00000006dP2-2J4I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 04:15:29 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2b4583f0a1aso36657235ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 21:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1779336927; x=1779941727; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mx7h0My419s2P7k1BFl0yESBgvzIQJC2piNf13boJc=;
        b=QL9SqKV0HRgrOR5dpZzW1AeDnwhOgqj4755ouSeqLwWBMPpInxWUyTYUZXfK/Dlj2A
         Wg1j6zumf4IISJY7KOIqsmRt+oEI7EDPJhCEI+0vLRWWGhNnGFEL+lVsEC8yPuqbzRWe
         Mg8T3hPjPme2vKBdXUSH1okvlo8Z2WJ801Y6LwYwKzHzvSE2EkTLPWhmmMGNIiWps3tT
         T0dGRT7isbCoNXQNTi7Y6vvH9Pd/SZDTmvff00vS1mBR3rEQa15dfeQAIA+g7osAXNG9
         RKNU5JwUMQnh2bDWQKPsHzTdM+n0CPCOAq59R/EG9bxgviUzbdGo67R/d9Kgr64r39Ic
         Lelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779336927; x=1779941727;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8mx7h0My419s2P7k1BFl0yESBgvzIQJC2piNf13boJc=;
        b=ZN5uT9SEWxk0MIf1e/xkMHDdivpv5fDG5HAF8Er4dq1JC58Yqr+Er7vVyo5JDVVF6z
         dTUcSZcTMlCvQzQki2j+gEkEPsBpxs9rWZBpW8IgiHo08aqGBSFPsYhyOBC97lfJn+mo
         NsNIpz2ihjciJRIMfvLKLTWbpuK79GPe6MfXXWZ7W4e/ViAqB4j7FJ3XlBC3IAsDCrg0
         xJTudNNsqj8TguhzABY3vVq0LSWbJ5Aozupp2rp0ilNydnrVi65/DbXeA+8/kHjzUZ8P
         QOd8iLaB6z0W+zBC24oXvB+6DhGW7Y6DYvBldybWWuQWiINDt/cxNGt88Yofc1FIdaVz
         lrpA==
X-Forwarded-Encrypted: i=1; AFNElJ+qIp8Vk/7bgVmU9EnmdZW6iC1fdU46gXbMdcp7DttV3IzlFAZqmFVKcnm7PtPxpl129h3IIHbW0wvXIoKalIMn@lists.infradead.org
X-Gm-Message-State: AOJu0YxVIB+08f1prq61VQLvu4HhDWy7TmcdnVB40qGTbmUC3mTmc2Tc
	XMZI2ZXfE3a/oIkqSx/ZTrG+vuYjGSFu1zMVFRwDzl927Ez4Glpz+iLY7SlakANH/S0=
X-Gm-Gg: Acq92OEd1/NzESPqckRYQ1XM7SdSum4SOx0v4mK2+lfaM1dRdrZ0bIUVul/JV12Ymxx
	ZELtFKAFCNPuRGmK7MEQ+ElshoP/rNHpx/UZ70Ij1rjogjeTySDpC6Mj3ryS6f5Mv9O/GaTkTH+
	iVif3fSa7NUWBrxCdCkkcIwBYU9lUzGJMoUknei+ANRjJ5/7yY5ND9IEFxYrn6rqGYjW7eprrop
	u7NJ2KfS+VNfptlVcOWWUPhnB9V1TWWQvESLi+VL5jMWMzo5Z+EngUwTCe/MJguk22vI7bwV8WL
	ioJTu1Qw18xjn16K9q68FtstPGUwFXo4T7GsPBSuUqo7ki4n6LTfaBdsZ8x9PDdJDLcNy+vEDnd
	toqZ97v+KjJTKnEr2vp/d5L6dpbDbGYekLDOcqpcUchy+DykinVVY99nN7g6nv+J/o+maS4w/ai
	RtWvCPi5FbTRKULI1r9ieb8b+G9dJvl6T7RHY=
X-Received: by 2002:a17:902:c946:b0:2ae:5629:ac55 with SMTP id d9443c01a7336-2bea331d50dmr10441855ad.21.1779336927286;
        Wed, 20 May 2026 21:15:27 -0700 (PDT)
Received: from localhost ([2001:569:58a0:da00:a5c8:c4ce:f7c1:40c1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d234540sm234841675ad.79.2026.05.20.21.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 21:15:26 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 May 2026 00:15:26 -0400
Message-Id: <DIO2ARBBUOJX.1OJ5RVION2UH1@etsalapatis.com>
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Tejun Heo" <tj@kernel.org>, "David Vernet" <void@manifault.com>,
 "Andrea Righi" <arighi@nvidia.com>, "Changwoo Min" <changwoo@igalia.com>,
 "Alexei Starovoitov" <ast@kernel.org>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
Cc: "Peter Zijlstra" <peterz@infradead.org>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Thomas
 Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>, "Borislav
 Petkov" <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Andrew Morton" <akpm@linux-foundation.org>, "David Hildenbrand"
 <david@kernel.org>, "Mike Rapoport" <rppt@kernel.org>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, <sched-ext@lists.linux.dev>, <bpf@vger.kernel.org>,
 <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/8] sched_ext: Require an arena for cid-form schedulers
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260520235052.4180316-1-tj@kernel.org>
 <20260520235052.4180316-7-tj@kernel.org>
In-Reply-To: <20260520235052.4180316-7-tj@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_211528_601508_7982CC60 
X-CRM114-Status: GOOD (  27.56  )
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

On Wed May 20, 2026 at 7:50 PM EDT, Tejun Heo wrote:
> Upcoming patches will let the kernel place arena-resident scratch shared
> with the BPF program (e.g. per-CPU set_cmask cmask) so the BPF side can
> dereference it directly via __arena pointers, replacing the current
> cmask_copy_from_kernel() probe-read loop. That requires each cid-form
> scheduler to expose its arena to the kernel. Kernel- side accesses are
> recovered by the per-arena scratch-page mechanism.
>
> bpf_scx_reg_cid() walks the struct_ops member progs via
> bpf_struct_ops_for_each_prog() and reads each prog's arena via
> bpf_prog_arena(). The verifier enforces one arena per program, so each
> member prog contributes at most one arena. All non-NULL contributions mus=
t
> match and at least one member prog must use an arena. The map ref is held=
 on
> scx_sched and dropped on sched destroy. cpu-form schedulers (bpf_scx_reg)
> are unchanged - no arena requirement.
>
> Signed-off-by: Tejun Heo <tj@kernel.org>
> ---
>  kernel/sched/ext.c          | 56 ++++++++++++++++++++++++++++++++++++-
>  kernel/sched/ext_internal.h |  8 ++++++
>  2 files changed, 63 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
> index 9c458552d14f..56f94ac32ba0 100644
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -5003,6 +5003,8 @@ static void scx_sched_free_rcu_work(struct work_str=
uct *work)
> =20
>  	rhashtable_free_and_destroy(&sch->dsq_hash, NULL, NULL);
>  	free_exit_info(sch->exit_info);
> +	if (sch->arena_map)
> +		bpf_map_put(sch->arena_map);
>  	kfree(sch);
>  }
> =20
> @@ -6746,6 +6748,7 @@ struct scx_enable_cmd {
>  		struct sched_ext_ops_cid	*ops_cid;
>  	};
>  	bool			is_cid_type;
> +	struct bpf_map		*arena_map;	/* arena ref to transfer to sch */
>  	int			ret;
>  };
> =20
> @@ -6913,6 +6916,15 @@ static struct scx_sched *scx_alloc_and_add_sched(s=
truct scx_enable_cmd *cmd,
>  		return ERR_PTR(ret);
>  	}
>  #endif	/* CONFIG_EXT_SUB_SCHED */
> +
> +	/*
> +	 * Consume the arena_map ref bpf_scx_reg_cid() took. Defer to here so
> +	 * earlier failure paths leave cmd->arena_map set and bpf_scx_reg_cid
> +	 * drops the ref. After this point, sch owns the ref and any cleanup
> +	 * runs through scx_sched_free_rcu_work() which puts it.
> +	 */
> +	sch->arena_map =3D cmd->arena_map;
> +	cmd->arena_map =3D NULL;
>  	return sch;
> =20
>  #ifdef CONFIG_EXT_SUB_SCHED
> @@ -7898,11 +7910,53 @@ static int bpf_scx_reg(void *kdata, struct bpf_li=
nk *link)
>  	return scx_enable(&cmd, link);
>  }
> =20
> +struct scx_arena_scan {
> +	struct bpf_map	*arena;
> +	int		err;

Can we skip the int err here...

> +};
> +
> +/*
> + * The verifier enforces one arena per BPF program, so each struct_ops
> + * member prog contributes at most one arena via bpf_prog_arena().
> + * Require all non-NULL contributions to match.
> + */
> +static int scx_arena_scan_prog(struct bpf_prog *prog, void *data)
> +{
> +	struct scx_arena_scan *s =3D data;
> +	struct bpf_map *arena =3D bpf_prog_arena(prog);
> +
> +	if (!arena)
> +		return 0;
> +	if (s->arena && s->arena !=3D arena) {
> +		s->err =3D -EINVAL;

...and just directly return -EINVAL here? bpf_struct_ops_for_each_prog
breaks when we return non-zero so do we need the extra scx_arena_scan
struct?

> +		return 1;
> +	}
> +	s->arena =3D arena;
> +	return 0;
> +}
> +
>  static int bpf_scx_reg_cid(void *kdata, struct bpf_link *link)
>  {
>  	struct scx_enable_cmd cmd =3D { .ops_cid =3D kdata, .is_cid_type =3D tr=
ue };
> +	struct scx_arena_scan scan =3D {};
> +	int ret;
> =20
> -	return scx_enable(&cmd, link);
> +	bpf_struct_ops_for_each_prog(kdata, scx_arena_scan_prog, &scan);
> +	if (scan.err) {
> +		pr_err("sched_ext: cid-form scheduler uses multiple arena maps\n");
> +		return scan.err;
> +	}
> +	if (!scan.arena) {
> +		pr_err("sched_ext: cid-form scheduler must use a BPF arena map\n");
> +		return -EINVAL;
> +	}
> +
> +	bpf_map_inc(scan.arena);
> +	cmd.arena_map =3D scan.arena;
> +	ret =3D scx_enable(&cmd, link);
> +	if (cmd.arena_map)		/* not consumed by scx_alloc_and_add_sched() */
> +		bpf_map_put(cmd.arena_map);
> +	return ret;
>  }
> =20
>  static void bpf_scx_unreg(void *kdata, struct bpf_link *link)
> diff --git a/kernel/sched/ext_internal.h b/kernel/sched/ext_internal.h
> index 7258aea94b9f..d40cfd29ddaa 100644
> --- a/kernel/sched/ext_internal.h
> +++ b/kernel/sched/ext_internal.h
> @@ -1111,6 +1111,14 @@ struct scx_sched {
>  		struct sched_ext_ops_cid	ops_cid;
>  	};
>  	bool			is_cid_type;	/* true if registered via bpf_sched_ext_ops_cid */
> +
> +	/*
> +	 * Arena map auto-discovered from member progs at struct_ops attach.
> +	 * cid-form schedulers must use exactly one arena across all member
> +	 * progs. NULL on cpu-form.
> +	 */
> +	struct bpf_map		*arena_map;
> +
>  	DECLARE_BITMAP(has_op, SCX_OPI_END);
> =20
>  	/*


