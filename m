Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492F3D277CA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 00:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3xfM0Rfu3A5cPqn5pc0s1J4LLhtoigHkOk+JZgFzv3k=; b=EeYPN13m522IspQ7+Tlys8bzu6
	gk8g6xXyPmFqJN20dxHWvHcz3naseR5veMH9SKf+ABdFf2CqKASRDccI9I1WyBnswEcHPTyyp/8Sg
	b8em4YBrAm7RT+NzZMYYQWiyMeK+WTDUETeVVCqBS8ETJBiVgywgwlHK4tP0HMDYvi6cYoeUdNUuw
	oF0oeOm79ZC64uRlOZ0Vamg7nrf0ftSyifqVkybjsC1ZBaXgnW67jliHcKhApMO5qjhccXK/gIuxm
	DuNI2rVYYfjNkAisW/PcKa3YQZG71vfMEaKzVUxFL4ndyiwWxXJ4K7GnHrbF57Lv7V4aD7L+I5rUh
	OkRrBDDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veMyP-000000038Ff-2feN;
	Sat, 10 Jan 2026 00:36:57 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veMyM-000000038FC-2Al8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 00:36:55 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c2dc870e194so2515173a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 16:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768005413; x=1768610213; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3xfM0Rfu3A5cPqn5pc0s1J4LLhtoigHkOk+JZgFzv3k=;
        b=XlMCHpfBSVrtKV2K17SDMXgYJjUfx7W+MxLvB5ggmBo1s+c1sea+iC6aD32wfCdZrM
         sXTqKyIx/7N0HDIu1/YxqBlyYaRpKlyAJ1PEsFb9c6g/fXHSIj1yfVSYhyjEtQvPDSQN
         TpslGzNvnuD7RmaBh+GVpQDhYhcBXmCYmAs89E19GvrI55auWmLUbPhcGxAIKmzTIsaJ
         nbNpmfRp6xCr7AaVWpGO79kmal3J/XXMJBb5QDpNwaA92u20vaO75Biawef+kRXu3V4T
         Q8wwLNuDZFNy4JCVvUfe23tQ67GuPPCCzisp+Tm5b1fBQFzXwLlvmE2tWqZ/PgAU6Hiy
         L+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768005413; x=1768610213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3xfM0Rfu3A5cPqn5pc0s1J4LLhtoigHkOk+JZgFzv3k=;
        b=FDmSgGeN4Sv4IeL+BhLN0ahK2jTd0fmxW45GNAfizvmJc9QE4rGkOOxz/XPLbxqd1d
         DR8HLm5syfI/mRAmb6NroTuHJ/Ur0ADkqK8ZAkMFPz+L7YuITFpHo36qwTFR1+HFSOVW
         5WeovApPHgYk3dLgJ/Sezd2xBbleyW0BvWbb8tpXCDZxQzIGlZOUAhLwDHYvf/taP89+
         PM9AnNGANIr3/2YrEYyJh6YHLnkKWcRydUL8qQLhxAxu9Jm4pBEXJvzNWjfMPqNdBFyy
         T9cga16CDFI0dFaSJi/qXTjLDBs/HtINWMLOLqigo8UIi6E27AWgL/pbdXXJ7WUsza5P
         a5sA==
X-Forwarded-Encrypted: i=1; AJvYcCUYQTaqZskJTyLLl+4IAcmeUpB5WfP5reKAbM4cFnPNSPc8tN+1dTQ3PPxRviP0DNyuPAfcYHnNmre0biZEEheO@lists.infradead.org
X-Gm-Message-State: AOJu0YzcMLn7myDjwodR7DH0H9oioCeMAxLDWtGz8j0DS93GFstuS44g
	EAlzk01FKtAkCCrQmPJdcyzKYUzVED0ptAHdA83m/qecBweLu3lKA8L93O8jOB+y3ZX2hFUB/tf
	AyVigJti7WexUkdE2VUO+VknyfSWQJvM=
X-Gm-Gg: AY/fxX4uRw2NNHdVey4OKxYE7hVRSc8aJhjWFcuzMeEpmu26NJBvHx6qN3bbEa66nYa
	u2O3xQOzBZnmj6W453bD8jH3LFf69Eae647penThHMOv9MD2sWfu1AEWFj47P2Y+v3dIU0/1G1T
	22iWrs4d0LIzoT25ftoHfInlj9bpHCAizI2m8VmGwX/JG1zbRNnd68ewq/+wlspKtNeAtUzeO++
	f90ffeYdmKjBKo+3CKyuWKV2nfDvWdXn6SwJ9LC8L5MweOc9WdZgir5obvREy4VsyO8fYpqbiRS
	ndhbuNFy
X-Google-Smtp-Source: AGHT+IGuujBpONry1gvgsQzsvJXudiQyMGBcQwh475VUNcINJSDIO8LkyvpNvKKLPS3N+zwKEoYGeXXz/tJgdhtuXz8=
X-Received: by 2002:a05:6a20:7486:b0:35f:b243:46cb with SMTP id
 adf61e73a8af0-3898f8f4c75mr12372471637.12.1768005413568; Fri, 09 Jan 2026
 16:36:53 -0800 (PST)
MIME-Version: 1.0
References: <20251230145010.103439-1-jolsa@kernel.org> <20251230145010.103439-8-jolsa@kernel.org>
In-Reply-To: <20251230145010.103439-8-jolsa@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 9 Jan 2026 16:36:41 -0800
X-Gm-Features: AQt7F2rtiT73HgLTPQ6UI1koaE9wmnP8DTvaic0PVhGcL9KRoTH943ScnrAVW1o
Message-ID: <CAEf4BzYgqWXoKTffa5Y6Xm-nPbL9aFgrStR0GfUs4-88f10EgQ@mail.gmail.com>
Subject: Re: [PATCHv6 bpf-next 7/9] bpf: Add trampoline ip hash table
To: Jiri Olsa <jolsa@kernel.org>
Cc: Steven Rostedt <rostedt@kernel.org>, Florent Revest <revest@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Menglong Dong <menglong8.dong@gmail.com>, Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_163654_586058_AF53B5C8 
X-CRM114-Status: GOOD (  24.21  )
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

On Tue, Dec 30, 2025 at 6:51=E2=80=AFAM Jiri Olsa <jolsa@kernel.org> wrote:
>
> Following changes need to lookup trampoline based on its ip address,
> adding hash table for that.
>
> Signed-off-by: Jiri Olsa <jolsa@kernel.org>
> ---
>  include/linux/bpf.h     |  7 +++++--
>  kernel/bpf/trampoline.c | 30 +++++++++++++++++++-----------
>  2 files changed, 24 insertions(+), 13 deletions(-)
>
> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> index 4e7d72dfbcd4..c85677aae865 100644
> --- a/include/linux/bpf.h
> +++ b/include/linux/bpf.h
> @@ -1325,14 +1325,17 @@ struct bpf_tramp_image {
>  };
>
>  struct bpf_trampoline {
> -       /* hlist for trampoline_table */
> -       struct hlist_node hlist;
> +       /* hlist for trampoline_key_table */
> +       struct hlist_node hlist_key;
> +       /* hlist for trampoline_ip_table */
> +       struct hlist_node hlist_ip;
>         struct ftrace_ops *fops;
>         /* serializes access to fields of this trampoline */
>         struct mutex mutex;
>         refcount_t refcnt;
>         u32 flags;
>         u64 key;
> +       unsigned long ip;
>         struct {
>                 struct btf_func_model model;
>                 void *addr;
> diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
> index 789ff4e1f40b..bdac9d673776 100644
> --- a/kernel/bpf/trampoline.c
> +++ b/kernel/bpf/trampoline.c
> @@ -24,9 +24,10 @@ const struct bpf_prog_ops bpf_extension_prog_ops =3D {
>  #define TRAMPOLINE_HASH_BITS 10
>  #define TRAMPOLINE_TABLE_SIZE (1 << TRAMPOLINE_HASH_BITS)
>
> -static struct hlist_head trampoline_table[TRAMPOLINE_TABLE_SIZE];
> +static struct hlist_head trampoline_key_table[TRAMPOLINE_TABLE_SIZE];
> +static struct hlist_head trampoline_ip_table[TRAMPOLINE_TABLE_SIZE];
>
> -/* serializes access to trampoline_table */
> +/* serializes access to trampoline tables */
>  static DEFINE_MUTEX(trampoline_mutex);
>
>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
> @@ -135,15 +136,15 @@ void bpf_image_ksym_del(struct bpf_ksym *ksym)
>                            PAGE_SIZE, true, ksym->name);
>  }
>
> -static struct bpf_trampoline *bpf_trampoline_lookup(u64 key)
> +static struct bpf_trampoline *bpf_trampoline_lookup(u64 key, unsigned lo=
ng ip)
>  {
>         struct bpf_trampoline *tr;
>         struct hlist_head *head;
>         int i;
>
>         mutex_lock(&trampoline_mutex);
> -       head =3D &trampoline_table[hash_64(key, TRAMPOLINE_HASH_BITS)];
> -       hlist_for_each_entry(tr, head, hlist) {
> +       head =3D &trampoline_key_table[hash_64(key, TRAMPOLINE_HASH_BITS)=
];
> +       hlist_for_each_entry(tr, head, hlist_key) {
>                 if (tr->key =3D=3D key) {
>                         refcount_inc(&tr->refcnt);
>                         goto out;
> @@ -164,8 +165,12 @@ static struct bpf_trampoline *bpf_trampoline_lookup(=
u64 key)
>  #endif
>
>         tr->key =3D key;
> -       INIT_HLIST_NODE(&tr->hlist);
> -       hlist_add_head(&tr->hlist, head);
> +       tr->ip =3D ftrace_location(ip);
> +       INIT_HLIST_NODE(&tr->hlist_key);
> +       INIT_HLIST_NODE(&tr->hlist_ip);
> +       hlist_add_head(&tr->hlist_key, head);
> +       head =3D &trampoline_ip_table[hash_64(tr->ip, TRAMPOLINE_HASH_BIT=
S)];

For key lookups we check that there is no existing trampoline for the
given key. Can it happen that we have two trampolines at the same IP
but using two different keys?



> +       hlist_add_head(&tr->hlist_ip, head);
>         refcount_set(&tr->refcnt, 1);
>         mutex_init(&tr->mutex);
>         for (i =3D 0; i < BPF_TRAMP_MAX; i++)
> @@ -846,7 +851,7 @@ void bpf_trampoline_unlink_cgroup_shim(struct bpf_pro=
g *prog)
>                                          prog->aux->attach_btf_id);
>
>         bpf_lsm_find_cgroup_shim(prog, &bpf_func);
> -       tr =3D bpf_trampoline_lookup(key);
> +       tr =3D bpf_trampoline_lookup(key, 0);
>         if (WARN_ON_ONCE(!tr))
>                 return;
>
> @@ -866,7 +871,7 @@ struct bpf_trampoline *bpf_trampoline_get(u64 key,
>  {
>         struct bpf_trampoline *tr;
>
> -       tr =3D bpf_trampoline_lookup(key);
> +       tr =3D bpf_trampoline_lookup(key, tgt_info->tgt_addr);
>         if (!tr)
>                 return NULL;
>
> @@ -902,7 +907,8 @@ void bpf_trampoline_put(struct bpf_trampoline *tr)
>          * fexit progs. The fentry-only trampoline will be freed via
>          * multiple rcu callbacks.
>          */
> -       hlist_del(&tr->hlist);
> +       hlist_del(&tr->hlist_key);
> +       hlist_del(&tr->hlist_ip);
>         if (tr->fops) {
>                 ftrace_free_filter(tr->fops);
>                 kfree(tr->fops);
> @@ -1175,7 +1181,9 @@ static int __init init_trampolines(void)
>         int i;
>
>         for (i =3D 0; i < TRAMPOLINE_TABLE_SIZE; i++)
> -               INIT_HLIST_HEAD(&trampoline_table[i]);
> +               INIT_HLIST_HEAD(&trampoline_key_table[i]);
> +       for (i =3D 0; i < TRAMPOLINE_TABLE_SIZE; i++)
> +               INIT_HLIST_HEAD(&trampoline_ip_table[i]);
>         return 0;
>  }
>  late_initcall(init_trampolines);
> --
> 2.52.0
>

