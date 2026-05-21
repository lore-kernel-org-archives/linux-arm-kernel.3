Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A211CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 04:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynBnbM/NLUcVxU1YYBO1La/PNj07zsMaWyq2DVRegqU=; b=tdrYheVz7F99lZADWSkfGHTQsQ
	OOulW3mTTuddKN1mVycgVehdhtJZA6XWGq/YT6h8Avl+zDEREnEvFLxyQuTzlnkdA3mVjovD6C6+g
	Gz9QJLmvwoXrSdN+d0joPKatsh1Pawuv+TE1OOvvWisH2lDu+mgR422f1b0Mj0mJb1ndFvWgCLk9K
	ka0LEdf7onz2jItsEgBSMbuiO8ifeREXtw028RZkS9tEmyFaToE9B24qFIQFEAu83pE1ArwBpLBcJ
	iauD7vZ7uCOd9c7DbxJoLveDydYdSM2/JeAdApmmoWsh+NjaaITvCO0lo+3MB2AEKwm9k3voV3RXL
	otEg+lrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPui2-00000006cfO-21XL;
	Thu, 21 May 2026 04:08:34 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPui1-00000006ceD-0NOe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 04:08:34 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-83ef1d17904so5612936b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 21:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1779336512; x=1779941312; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynBnbM/NLUcVxU1YYBO1La/PNj07zsMaWyq2DVRegqU=;
        b=LWSJAL4uF0fd4WonZwDbQI6LjaN+ELcjiNs9eZqDx5ZBIlVtUSa8QVQvblGxOiD5YC
         ng3UUZa+8soYkzk80DMRdNToRGbECtbRDMj1a0p881HOA1hOZxyUU6NeJkf0HmJ09L2t
         XUpr5kgwLyD2GxdeZ1pfPEzD7xgVkOoSCswiUanuhnBgajt94mvOUBGqAvItNzwzl1ES
         Wfh+Vh80LNOb7cmkErPUK6DfhgrsgHPcfoGJ9UVEAp1ROJLaf+zBMH4EyObILBWFRSSg
         jLa8DhPhZ4ZIUQLHKTfPhE2cGavv1sQNyfWi2wjfVpxgLtxcUous0oRnH5ziSQVhO+51
         Nrtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779336512; x=1779941312;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ynBnbM/NLUcVxU1YYBO1La/PNj07zsMaWyq2DVRegqU=;
        b=na1E/9towMD0O+e+CXVhdGzgn+Rb6JHbKmtrWjjm2CN/OQ7ZyfCs/k4nkw2hme4CR9
         qcbkD5WhuWIKvD7TSrk6/80HZtQiz4HePlCreSdWr+3PecK3UpiYe+NEz3s2lR8ECPA2
         owtSypxQ+WkYTRtO+zHPDHOpNozHB8Gn11xF1s8Di7HqL8YVmbgadYg9R3Mi25eEg6oT
         DOlICe9y2Ab26WIDzT6AdJBITrKrL6fFbWUTorJOPI0ecPNZK3qrb4IPNcKcvRjnYcDp
         Zgy8LIaDXEDJYqREu7q2xFLrjXFpxJu6mSMbmk0xhMGMt4U4cd7i4ZQjcoe4g3T5EHDr
         /o+w==
X-Forwarded-Encrypted: i=1; AFNElJ8OvRJbHvL+JivVvlfqcBPATNhIHIt2P1ftaAkpqkPKEI4LdmNSh4gj+3AQnCTSk/hs5EfA7AX8rjGIzN39MYgh@lists.infradead.org
X-Gm-Message-State: AOJu0YyFrFNT414FnaOampeWcLdEyLjwpaT8+q9pxJcbYPMfM0jGqQey
	kaevzIgAKW5E8V4ICWQcjKx9ZZFK6bsoI1S1uKkFpDXF+aNtBTZflZX6+IcX4Wn37OE=
X-Gm-Gg: Acq92OEDVAjjdkTQjQIhkpPIwixajxR3iJqbNCIDXeJLN6zI1OHhFovJscfj8dnXi5N
	8EaFiede4v8epO2MG1jkot2ivto85HONpL3mrNWJic5jGlYqzpk3FuYjw/DfTkleZrY6Al+PScN
	cpimopcEY1IapW227BPQ0FK0D374kNbpEOte6dJCriVQ2qf6iFDunbRKUNgv8wC2jO/zN3BF91c
	QoN/J4b/vy9eLibyg7lvOqPrwGXPOnF15utJZ3OPVSWtCePJnGhUK6/oR7AnvV04CpevItWI2sw
	Nn5X2q+xlEGRW8iphCfjJLF2EXWSLJR4kzh7J9Ha+kHY+DU3bb/OT6ZNz8nbvJBNBGAciqwAxGC
	yJ1iY8x1BIXmuVQl6AZ4AmFw1hRbMnwPy0sEhrOxpCw8x3Vq1NuehKBbR5KEowekiDWVqW5NPXn
	bbjeLliFMhCy1v49+3IM6IDycG
X-Received: by 2002:aa7:88c1:0:b0:82f:7b98:e499 with SMTP id d2e1a72fcca58-8414adf532amr1336929b3a.31.1779336511925;
        Wed, 20 May 2026 21:08:31 -0700 (PDT)
Received: from localhost ([2001:569:58a0:da00:a5c8:c4ce:f7c1:40c1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8413ac7b2b2sm3505781b3a.14.2026.05.20.21.08.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 21:08:31 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 May 2026 00:08:30 -0400
Message-Id: <DIO25GJPKAS6.1MJRN7AI18G4P@etsalapatis.com>
Cc: "Peter Zijlstra" <peterz@infradead.org>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Thomas
 Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>, "Borislav
 Petkov" <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Andrew Morton" <akpm@linux-foundation.org>, "David Hildenbrand"
 <david@kernel.org>, "Mike Rapoport" <rppt@kernel.org>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, <sched-ext@lists.linux.dev>, <bpf@vger.kernel.org>,
 <x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/8] bpf/arena: Add bpf_arena_map_kern_vm_start() and
 bpf_prog_arena()
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Tejun Heo" <tj@kernel.org>, "David Vernet" <void@manifault.com>,
 "Andrea Righi" <arighi@nvidia.com>, "Changwoo Min" <changwoo@igalia.com>,
 "Alexei Starovoitov" <ast@kernel.org>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260520235052.4180316-1-tj@kernel.org>
 <20260520235052.4180316-6-tj@kernel.org>
In-Reply-To: <20260520235052.4180316-6-tj@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_210833_131215_BBD52555 
X-CRM114-Status: GOOD (  20.12  )
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
> struct bpf_arena is opaque to callers outside arena.c. Add two helpers
> for struct_ops subsystems that need to reach into an arena:
>
>   bpf_arena_map_kern_vm_start(struct bpf_map *map)
>     returns @map's kern_vm_start. A sched_ext follow-up needs this
>     to translate kern_va <-> uaddr.
>
>   bpf_prog_arena(struct bpf_prog *prog)
>     returns the bpf_map of the arena referenced by @prog (NULL if
>     @prog references no arena). The verifier enforces at most one
>     arena per program. Used by struct_ops callers that auto-discover
>     an arena from a member prog and need to take a map reference.
>
> Suggested-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> Signed-off-by: Tejun Heo <tj@kernel.org>

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

> ---
>  include/linux/bpf.h |  2 ++
>  kernel/bpf/arena.c  | 26 ++++++++++++++++++++++++++
>  2 files changed, 28 insertions(+)
>
> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> index 5b99d786e98c..e1ba57c10aaa 100644
> --- a/include/linux/bpf.h
> +++ b/include/linux/bpf.h
> @@ -618,6 +618,8 @@ void bpf_rb_root_free(const struct btf_field *field, =
void *rb_root,
>  		      struct bpf_spin_lock *spin_lock);
>  u64 bpf_arena_get_kern_vm_start(struct bpf_arena *arena);
>  u64 bpf_arena_get_user_vm_start(struct bpf_arena *arena);
> +u64 bpf_arena_map_kern_vm_start(struct bpf_map *map);
> +struct bpf_map *bpf_prog_arena(struct bpf_prog *prog);
>  int bpf_obj_name_cpy(char *dst, const char *src, unsigned int size);
> =20
>  struct bpf_offload_dev;
> diff --git a/kernel/bpf/arena.c b/kernel/bpf/arena.c
> index a811cf6170fa..51b9ae36feb6 100644
> --- a/kernel/bpf/arena.c
> +++ b/kernel/bpf/arena.c
> @@ -84,6 +84,32 @@ u64 bpf_arena_get_user_vm_start(struct bpf_arena *aren=
a)
>  	return arena ? arena->user_vm_start : 0;
>  }
> =20
> +/**
> + * bpf_arena_map_kern_vm_start - kern_vm_start lookup by struct bpf_map =
*
> + * @map: a BPF_MAP_TYPE_ARENA map
> + *
> + * Return @map's kern_vm_start.
> + */
> +u64 bpf_arena_map_kern_vm_start(struct bpf_map *map)
> +{
> +	return bpf_arena_get_kern_vm_start(container_of(map, struct bpf_arena, =
map));
> +}
> +
> +/**
> + * bpf_prog_arena - return the bpf_map of the arena referenced by @prog
> + * @prog: a loaded BPF program
> + *
> + * The verifier enforces at most one arena per program and stores it in
> + * prog->aux->arena. Return that arena's underlying bpf_map, or NULL if
> + * @prog does not reference an arena.
> + */
> +struct bpf_map *bpf_prog_arena(struct bpf_prog *prog)
> +{
> +	struct bpf_arena *arena =3D prog->aux->arena;
> +
> +	return arena ? &arena->map : NULL;
> +}
> +
>  static long arena_map_peek_elem(struct bpf_map *map, void *value)
>  {
>  	return -EOPNOTSUPP;


