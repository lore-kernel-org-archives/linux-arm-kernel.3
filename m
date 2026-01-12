Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A51CF45CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 21:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQq++ScOu7vE0Lz/RtZKByNqj4pSUn78IDE7wyXt0WA=; b=Q7hubezFAsg2TvMbSaPWP8M5Ll
	Jh5H7N3oXGdN1dKRU/59roBAWkN0O6owG6Mnex5kI1JvcapeTBXAlK4csZ72JC/X8wx1lloygEmbH
	ZMSm7dbdpsH5ZzF3UupbQS+U62pLgrzJK4Qd4Pu3MDJt3ieSiN6FKb4HekF1tvzho9AbcFhj2pHXW
	jPusd2+q0B9Qezp8bIAdOujfHeDyVwOCZoSMBaKB1xfr2EVDOOB/0fkMxUqQ+NxtL8VmNysHXrjU4
	xA98lxajYmTyuYsCauZgl30+urzWhU47MCKIEQ/jZIm+C4kRhoCXZVa2TLvpraZiITDKQdrGBF3/Z
	mslFHMmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfPSC-00000006DLT-17ic;
	Mon, 12 Jan 2026 21:28:00 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfPS9-00000006DL8-2MZQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 21:27:58 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa4so5126040f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 13:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768253275; x=1768858075; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PQq++ScOu7vE0Lz/RtZKByNqj4pSUn78IDE7wyXt0WA=;
        b=OyvF4pdOUVQt38WNmHicAtJ0QkdGCcPE+cxOOy4kCu+x2D+P9cFCJx5E9oEOTRDrAu
         KLQIFbpfjgKN1Jx9B/IQ3+OWteuGevKRl2tAYK//k2nZ606DYOXMpdyJfAUpMQoxR16X
         RxKML568w/LifzgqTKuVZ71yWoIZOm3CrdQAipwSmwe/y3/U3tN42poBuiv5jVOKXodR
         fmTJcgBYfuipBL/ZmxmoW4GBrwgCw2hYAfw8dw9EBzp53ioK4ydRZ/gHqp+gCs17rXte
         jn+1A5AakQ2vDOSFFX9jJ6aTykT6knvtAK8hZrLGlGa5XjeEVb1u9GHGCVDPra6xgGlr
         GNOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768253275; x=1768858075;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PQq++ScOu7vE0Lz/RtZKByNqj4pSUn78IDE7wyXt0WA=;
        b=SWLomy07eydFlIygivd9elcVVbxyaBj9VREBn4415iXKROue6d+upFvOtMP/lfOqgQ
         a1h2xEt4DWCxI1iGUvTR6kNWM4MLxNPHOh+BIgjNOWN+GKuIbpRK2Bo87UglFwrFk9L9
         wS3+VGERGqFzOgzRiLae2zZbiP6lCB8d2HoGR8vwwlFzKk5sdyrPoSdGDl81Tqe9W6u2
         CRFeZcCeCjSw2BHEhxRaC2Pg/2gcohfj4oedrhoQJshyak5Y6/PCK1SriRtWSE4rG//1
         WawSetLjdN27uM5SfK2vIKY2wiPnT9E8pT0xEVPPhV9KRA252slVrlEjFSxBdIvooM5u
         Vfmw==
X-Forwarded-Encrypted: i=1; AJvYcCXL4PVr8mapGOTO9BsSRysS152E0bRyyP+B0uk+/6jtXVdHfN6dv4mR+WUZkz2CQM9uxsIxuW2H+j3COe7iCq5B@lists.infradead.org
X-Gm-Message-State: AOJu0YySihadhFVnmJUGNH5h78ZetIJBhilMRy1dzJAC3EedGlu87mT6
	iaZwD0Ly4OmBitG57RS8VOjESEbc3wITEUwEG+bWcxpW0jluWZqXnLYi
X-Gm-Gg: AY/fxX5tvM+m2Qtmj4/YsUjI9X89OTNDhAnbIilYL59Y3rcYUOQROepSGNSlOK8g4pw
	9va1DndhjF6+MVCqmWTJzttIMiR6NMnqSmfo6ZUnuPdT3T2mKrvJj5/Nyw/nKUvb8An7TVW6T6T
	XUeKAuYDkDc4UPFU6UaJYFneOFZCsWQ4fCVi8Uzv3sTW6c6nCqZIUhzi7fDygsva/9Pf4Z5E+0K
	eym5zh1aij/3bBplPhKnU7wh9saQpBWKyCcfAsyhpS34iA8agb9KC8CE0U2ZNxCBWIrE2YRYgmy
	iQ8DkEjuXGz6XVmCikki94KykZONin4cXQwSDabplPCHkhhS5D/C5hNYQQG3LsiRBb8zDgB/azj
	aYzDJXhnIEKIi82BO3PN+Sz3mUL/W8zSQ9bEWlrT1rsC10o8N66Qd9YyNguMIjajNLMlGXuDx+6
	4=
X-Google-Smtp-Source: AGHT+IEaR0UW2C1CAn+Cjl3UGT4xxu7bcNb4qy4s5ukdVRcSA5IGeSTNKCNErEm4FMX6pr1j+2gIQA==
X-Received: by 2002:a05:6000:290b:b0:431:369:e7b with SMTP id ffacd0b85a97d-432c3760c49mr22314037f8f.18.1768253274576;
        Mon, 12 Jan 2026 13:27:54 -0800 (PST)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e199bsm40113986f8f.16.2026.01.12.13.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 13:27:54 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 12 Jan 2026 22:27:51 +0100
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>,
	Alan Maguire <alan.maguire@oracle.com>
Cc: Steven Rostedt <rostedt@kernel.org>, Florent Revest <revest@google.com>,
	Mark Rutland <mark.rutland@arm.com>, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Menglong Dong <menglong8.dong@gmail.com>,
	Song Liu <song@kernel.org>
Subject: Re: [PATCHv6 bpf-next 7/9] bpf: Add trampoline ip hash table
Message-ID: <aWVnVzeqWJBXwBze@krava>
References: <20251230145010.103439-1-jolsa@kernel.org>
 <20251230145010.103439-8-jolsa@kernel.org>
 <CAEf4BzYgqWXoKTffa5Y6Xm-nPbL9aFgrStR0GfUs4-88f10EgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEf4BzYgqWXoKTffa5Y6Xm-nPbL9aFgrStR0GfUs4-88f10EgQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_132757_641595_4987214A 
X-CRM114-Status: GOOD (  30.06  )
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

On Fri, Jan 09, 2026 at 04:36:41PM -0800, Andrii Nakryiko wrote:
> On Tue, Dec 30, 2025 at 6:51 AM Jiri Olsa <jolsa@kernel.org> wrote:
> >
> > Following changes need to lookup trampoline based on its ip address,
> > adding hash table for that.
> >
> > Signed-off-by: Jiri Olsa <jolsa@kernel.org>
> > ---
> >  include/linux/bpf.h     |  7 +++++--
> >  kernel/bpf/trampoline.c | 30 +++++++++++++++++++-----------
> >  2 files changed, 24 insertions(+), 13 deletions(-)
> >
> > diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> > index 4e7d72dfbcd4..c85677aae865 100644
> > --- a/include/linux/bpf.h
> > +++ b/include/linux/bpf.h
> > @@ -1325,14 +1325,17 @@ struct bpf_tramp_image {
> >  };
> >
> >  struct bpf_trampoline {
> > -       /* hlist for trampoline_table */
> > -       struct hlist_node hlist;
> > +       /* hlist for trampoline_key_table */
> > +       struct hlist_node hlist_key;
> > +       /* hlist for trampoline_ip_table */
> > +       struct hlist_node hlist_ip;
> >         struct ftrace_ops *fops;
> >         /* serializes access to fields of this trampoline */
> >         struct mutex mutex;
> >         refcount_t refcnt;
> >         u32 flags;
> >         u64 key;
> > +       unsigned long ip;
> >         struct {
> >                 struct btf_func_model model;
> >                 void *addr;
> > diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
> > index 789ff4e1f40b..bdac9d673776 100644
> > --- a/kernel/bpf/trampoline.c
> > +++ b/kernel/bpf/trampoline.c
> > @@ -24,9 +24,10 @@ const struct bpf_prog_ops bpf_extension_prog_ops = {
> >  #define TRAMPOLINE_HASH_BITS 10
> >  #define TRAMPOLINE_TABLE_SIZE (1 << TRAMPOLINE_HASH_BITS)
> >
> > -static struct hlist_head trampoline_table[TRAMPOLINE_TABLE_SIZE];
> > +static struct hlist_head trampoline_key_table[TRAMPOLINE_TABLE_SIZE];
> > +static struct hlist_head trampoline_ip_table[TRAMPOLINE_TABLE_SIZE];
> >
> > -/* serializes access to trampoline_table */
> > +/* serializes access to trampoline tables */
> >  static DEFINE_MUTEX(trampoline_mutex);
> >
> >  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
> > @@ -135,15 +136,15 @@ void bpf_image_ksym_del(struct bpf_ksym *ksym)
> >                            PAGE_SIZE, true, ksym->name);
> >  }
> >
> > -static struct bpf_trampoline *bpf_trampoline_lookup(u64 key)
> > +static struct bpf_trampoline *bpf_trampoline_lookup(u64 key, unsigned long ip)
> >  {
> >         struct bpf_trampoline *tr;
> >         struct hlist_head *head;
> >         int i;
> >
> >         mutex_lock(&trampoline_mutex);
> > -       head = &trampoline_table[hash_64(key, TRAMPOLINE_HASH_BITS)];
> > -       hlist_for_each_entry(tr, head, hlist) {
> > +       head = &trampoline_key_table[hash_64(key, TRAMPOLINE_HASH_BITS)];
> > +       hlist_for_each_entry(tr, head, hlist_key) {
> >                 if (tr->key == key) {
> >                         refcount_inc(&tr->refcnt);
> >                         goto out;
> > @@ -164,8 +165,12 @@ static struct bpf_trampoline *bpf_trampoline_lookup(u64 key)
> >  #endif
> >
> >         tr->key = key;
> > -       INIT_HLIST_NODE(&tr->hlist);
> > -       hlist_add_head(&tr->hlist, head);
> > +       tr->ip = ftrace_location(ip);
> > +       INIT_HLIST_NODE(&tr->hlist_key);
> > +       INIT_HLIST_NODE(&tr->hlist_ip);
> > +       hlist_add_head(&tr->hlist_key, head);
> > +       head = &trampoline_ip_table[hash_64(tr->ip, TRAMPOLINE_HASH_BITS)];
> 
> For key lookups we check that there is no existing trampoline for the
> given key. Can it happen that we have two trampolines at the same IP
> but using two different keys?

so multiple keys (different static functions with same name) resolving to
the same ip happened in past and we should now be able to catch those in
pahole, right? CC-ing Alan ;-)

however, that should fail the attachment on ftrace/direct layer

say we have already registered and attached trampoline key1-ip1,
follow-up attachment of trampoline with key2-ip1 will fail on:

  bpf_trampoline_update
    register_fentry
      direct_ops_add
        update_ftrace_direct_add
	  ...
	  /* Make sure requested entries are not already registered. */
	  fails, because ip1 is already in direct_functions
	  ...

jirka
 
> 
> 
> 
> > +       hlist_add_head(&tr->hlist_ip, head);
> >         refcount_set(&tr->refcnt, 1);
> >         mutex_init(&tr->mutex);
> >         for (i = 0; i < BPF_TRAMP_MAX; i++)
> > @@ -846,7 +851,7 @@ void bpf_trampoline_unlink_cgroup_shim(struct bpf_prog *prog)
> >                                          prog->aux->attach_btf_id);
> >
> >         bpf_lsm_find_cgroup_shim(prog, &bpf_func);
> > -       tr = bpf_trampoline_lookup(key);
> > +       tr = bpf_trampoline_lookup(key, 0);
> >         if (WARN_ON_ONCE(!tr))
> >                 return;
> >
> > @@ -866,7 +871,7 @@ struct bpf_trampoline *bpf_trampoline_get(u64 key,
> >  {
> >         struct bpf_trampoline *tr;
> >
> > -       tr = bpf_trampoline_lookup(key);
> > +       tr = bpf_trampoline_lookup(key, tgt_info->tgt_addr);
> >         if (!tr)
> >                 return NULL;
> >
> > @@ -902,7 +907,8 @@ void bpf_trampoline_put(struct bpf_trampoline *tr)
> >          * fexit progs. The fentry-only trampoline will be freed via
> >          * multiple rcu callbacks.
> >          */
> > -       hlist_del(&tr->hlist);
> > +       hlist_del(&tr->hlist_key);
> > +       hlist_del(&tr->hlist_ip);
> >         if (tr->fops) {
> >                 ftrace_free_filter(tr->fops);
> >                 kfree(tr->fops);
> > @@ -1175,7 +1181,9 @@ static int __init init_trampolines(void)
> >         int i;
> >
> >         for (i = 0; i < TRAMPOLINE_TABLE_SIZE; i++)
> > -               INIT_HLIST_HEAD(&trampoline_table[i]);
> > +               INIT_HLIST_HEAD(&trampoline_key_table[i]);
> > +       for (i = 0; i < TRAMPOLINE_TABLE_SIZE; i++)
> > +               INIT_HLIST_HEAD(&trampoline_ip_table[i]);
> >         return 0;
> >  }
> >  late_initcall(init_trampolines);
> > --
> > 2.52.0
> >

