Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A54BCD8CAF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 17:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YI6SwLVxaeWge12jpv+g65IL6HLVUJJ6dHq74rzDBFI=; b=RNPp6908KtHPQfW+G7PhI6fXsw
	WqbhcLgCPVqkz6OKK4LkdlXySYCG8p9tpaCpULpDBHOqySUfQgPl1C+/C4w7N3xZneDZa9YSEOyre
	u5IkkfffHI2pANBfttaxaTVSpUoFKJcYndcWsKl/iaV8bGT639kKY+Wob/2jStziQca+hU5ySSM4W
	dIK3OQV3LoNgrqyX9x9NgHrCPBmRatpegHK+QV+m1lJuddcXUTLLDWqVN2pjDmu2Of3ELAIG6vpPt
	UFVMaMvJwmNv5DJuVga99Sl2ac4VluPVj6cbsryycA20hzt7QXoGx3zIsDdF7cyKoIvdSl0NxuLL1
	RzrXMZ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJbZU-0000000Atov-0ArI;
	Thu, 13 Nov 2025 17:57:24 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJbZS-0000000Atnl-0KRa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 17:57:23 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47758595eecso6475005e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 09:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763056640; x=1763661440; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YI6SwLVxaeWge12jpv+g65IL6HLVUJJ6dHq74rzDBFI=;
        b=maWq3Oud17fzMjL4/JDq7MRkm1tOCmZy1gfNm+EIvPlqxNUifhye0GAEgT7V/qDTZq
         OASRuL8o1kLmiDtAW9IkXGeA8t1E8/bYBxd2GB8KZiIkBPpghyRDKE2Yd0TH9Cl6mKPT
         MQk/lGc8VntMZROhRiRm5gtgoQbHeGgoIX3Am/wxDbjG6ynegEgfidAY8Qv395+0dxjw
         Xx9rA7Tddd2UUdsSNmGovl0Kk55oeAsqHhRMPirhhSaCPvXnW3kRl3KaQ8md9iKQSo6n
         857w36v5PZsyKS3bd7V9tpALzXGPlEwA69p5KeSdy+oc9yra7ReHW3MD2oU3pMPY+LyB
         0Xhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763056640; x=1763661440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YI6SwLVxaeWge12jpv+g65IL6HLVUJJ6dHq74rzDBFI=;
        b=lWCMxPpssmiMeoFsX5RbTpG+WsrmL0znnpRA7JwKN289p2+Kfe7o5DRFRgziMTjS1+
         QksJ/JLWrXc/1WalqCdqaLEUf6PRg84JgpMLWzvYvsPfOQGBnsnITquxKnZeIr4/2con
         venbIdIwzOutsZ8SDKBgJd6tEqafhboJ3iYOLj1qxSauugoehdVHUPg79S8Q3uQ84LRy
         D7J8wVc055OcWEak/liXX3C5JZpRywT5o/iLW3UIU2+NVbHmmJdLpKPY0OTH7QsdK3po
         RbYKjfva4zq6QbwFeXPgjN+xFcHGyFKQ6vrY0CktxXJgg5CJykwEvW+aommuqh3lJ3G4
         ZKRg==
X-Forwarded-Encrypted: i=1; AJvYcCWs6KpEuZZpH6PYFFyW1PuxTg3t0+7rsC7owGQjCLvpAyP0r2DZEQvgriQt0YFll0IrcLNayXcHbLxSAhcIB70h@lists.infradead.org
X-Gm-Message-State: AOJu0Yygg2xwTy4+vgXPSNGVxS317OvmSVq2DCZmh+ZmbAzyWjhrgz3c
	kTRNqekNNTvhwtoWzMcEfJV6ILz/DInhdqGgKKcQW5JSMXiDfjxVn6FXFqjeqqNFRu5XPC8zu3A
	i7egOoiQLUiBeU8tY2PcRJDEwD30EHEc=
X-Gm-Gg: ASbGncvJbAv6oUijn3QQYMkGmhdCPcJBQ4WnQ0V2o/x3ta8G/r293xPNy7JxGVKWJ8l
	9llNL4ps/BW1+pfBZL2k3Mwl0wAWCPfpo980bUCnJI3uTV8SHpCJOjkM3kkDQazLXNLstKpBFl2
	SbNflLkUUZGTw8/j4e4Xq+eYfJ++KX5VpJhMFOMyVtBSoNNDHA159ZU8+FvSwM2W//B+NgE24B/
	iN+4fsPTv8y5SHsSibmJ5ifGQBVx6XL9RWxnMxFxXIi73UTM4bivqqMWRAyp/ZulLxBwtuScAMX
	JNgXqvt4k5c=
X-Google-Smtp-Source: AGHT+IHbO+ZGBFXO5ge0ijkSwdvqQcv57wZTtQs6YNPPselRxjdniZ7ynd75vfty+uOIzSWSgkGQqLyBXVlxsfcb078=
X-Received: by 2002:a05:600c:3b84:b0:476:a25f:6a4d with SMTP id
 5b1f17b1804b1-4778fe4f3d1mr4281155e9.1.1763056639666; Thu, 13 Nov 2025
 09:57:19 -0800 (PST)
MIME-Version: 1.0
References: <20251113123750.2507435-6-jolsa@kernel.org> <c3260fe9e3d8ad79c75a6e8281f9fae5580beb3fcdd08e2015f417e11ec0a1b2@mail.kernel.org>
 <aRYAhDqGsOHZzTL-@krava>
In-Reply-To: <aRYAhDqGsOHZzTL-@krava>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 13 Nov 2025 09:57:05 -0800
X-Gm-Features: AWmQ_bljz9ERUrLpgXYFmwgFdNYuQjEZ9EECbJhv0IrVw392banlmrLNtGinfI0
Message-ID: <CAADnVQKnnZkODUUDDJQNJ7tVnoGreggw5NuvaP81=rpUYXwd7g@mail.gmail.com>
Subject: Re: [PATCHv2 bpf-next 5/8] ftrace: Add update_ftrace_direct_mod function
To: Jiri Olsa <olsajiri@gmail.com>
Cc: bot+bpf-ci@kernel.org, rostedt@kernel.org, 
	Florent Revest <revest@google.com>, Mark Rutland <mark.rutland@arm.com>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	linux-trace-kernel <linux-trace-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Menglong Dong <menglong8.dong@gmail.com>, Song Liu <song@kernel.org>, 
	Martin KaFai Lau <martin.lau@kernel.org>, Eduard <eddyz87@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, Chris Mason <clm@meta.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_095722_169035_C3683F65 
X-CRM114-Status: GOOD (  21.95  )
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

On Thu, Nov 13, 2025 at 8:00=E2=80=AFAM Jiri Olsa <olsajiri@gmail.com> wrot=
e:
>
> On Thu, Nov 13, 2025 at 01:02:17PM +0000, bot+bpf-ci@kernel.org wrote:
> > > diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> > > index 433c36c3a..bacb6d9ab 100644
> > > --- a/include/linux/ftrace.h
> > > +++ b/include/linux/ftrace.h
> > > @@ -544,6 +544,7 @@ int modify_ftrace_direct_nolock(struct ftrace_ops=
 *ops, unsigned long addr);
> > >
> > >  int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_h=
ash *hash);
> > >  int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_h=
ash *hash);
> > > +int update_ftrace_direct_mod(struct ftrace_ops *ops, struct ftrace_h=
ash *hash, bool do_direct_lock);
> > >
> > >  void ftrace_stub_direct_tramp(void);
> > >
> > > @@ -581,6 +582,11 @@ int update_ftrace_direct_del(struct ftrace_ops *=
ops, struct ftrace_hash *hash)
> > >     return -ENODEV;
> > >  }
> > >
> > > +int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_=
hash *hash, bool do_direct_lock)
> >                 ^^^^^^^^^^^^^^^^^^^^^^^^^^
> > The stub function name doesn't match the declaration. Should this be
> > update_ftrace_direct_mod() instead of modify_ftrace_direct_hash()?
>
> it should, my bad
>
> >
> > > +{
> > > +   return -ENODEV;
> > > +}
> > > +
> >
> > [ ... ]
> >
> > > diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> > > index 345f3fdd2..627d05b57 100644
> > > --- a/kernel/trace/ftrace.c
> > > +++ b/kernel/trace/ftrace.c
> > > @@ -6445,6 +6445,74 @@ int update_ftrace_direct_del(struct ftrace_ops=
 *ops, struct ftrace_hash *hash)
> > >     return err;
> > >  }
> > >
> > > +int update_ftrace_direct_mod(struct ftrace_ops *ops, struct ftrace_h=
ash *hash, bool do_direct_lock)
> > > +{
> > > +   struct ftrace_hash *orig_hash =3D ops->func_hash->filter_hash;
> > > +   struct ftrace_func_entry *entry, *tmp;
> > > +   static struct ftrace_ops tmp_ops =3D {
> > > +           .func           =3D ftrace_stub,
> > > +           .flags          =3D FTRACE_OPS_FL_STUB,
> > > +   };
> > > +   unsigned long size, i;
> > > +   int err;
> > > +
> > > +   if (!hash_count(hash))
> > > +           return 0;
> > > +   if (check_direct_multi(ops))
> > > +           return -EINVAL;
> > > +   if (!(ops->flags & FTRACE_OPS_FL_ENABLED))
> > > +           return -EINVAL;
> > > +   if (direct_functions =3D=3D EMPTY_HASH)
> > > +           return -EINVAL;
> > > +
> > > +   if (do_direct_lock)
> > > +           mutex_lock(&direct_mutex);
> > > +
> > > +   /* Enable the tmp_ops to have the same functions as the direct op=
s */
> > > +   ftrace_ops_init(&tmp_ops);
> > > +   tmp_ops.func_hash =3D ops->func_hash;
> > > +
> > > +   err =3D register_ftrace_function_nolock(&tmp_ops);
> > > +   if (err)
> > > +           goto unlock;
> > > +
> > > +   /*
> > > +    * Call __ftrace_hash_update_ipmodify() here, so that we can call
> > > +    * ops->ops_func for the ops. This is needed because the above
> > > +    * register_ftrace_function_nolock() worked on tmp_ops.
> > > +    */
> > > +   err =3D __ftrace_hash_update_ipmodify(ops, orig_hash, orig_hash, =
true);
> >                                                                        =
 ^^^^
> > Does __ftrace_hash_update_ipmodify() accept a fourth argument? The
> > function signature shows it only takes three parameters (ops, old_hash,
> > new_hash). This looks like a compilation error.
>
> the whole patchset is based on bpf-next/master plus Song's livepatch
> fixes which change modify_ftrace_direct_hash function, it's mentioned
> in the cover letter

Ohh. Will send bpf PR to Linus today and merge into bpf-next afterwards.

