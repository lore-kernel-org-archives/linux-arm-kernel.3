Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7537DCFA441
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 19:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8MhwnoCi7MCRE1z5EUEpsstrAvdtSwgJTvQGH9kHI8=; b=NzTKd1Zw8cRfiEtB+IHJw7hwNY
	UM7w3E115WlemI9b4BSPzLoXVH9k7S+ZqyCeiBeCo9h5M2QKZ/3ZMGxiVNZXDFUUuiFliJm4M5cKI
	L49qxreGNymmXrkIvVRuqF7YF/Y8RL3E59H1Bqp3YqhFF38QzcU/zj8mQaPdnaBI0l+MOwQO+nKiF
	toEXZfX7Al5eJunjbIvMpCHRUxYpw8w/ygbah/W/Bl10A6RieblpPV2mU0BgqjgsedlQAwoH+FpOT
	673KIxiAux/4ibnFSoT8ugWD6o4AdyQzvlPQ7coXzMdbSvxOxKrRWK+u76wOBGMlS6chL1EdmNdz1
	H7vcB4YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMAFi-00000007H6b-3ePc;
	Thu, 20 Nov 2025 19:23:34 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMAFg-00000007H5w-08fF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 19:23:33 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2960771ec71so2187975ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 11:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrife-io.20230601.gappssmtp.com; s=20230601; t=1763666611; x=1764271411; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J8MhwnoCi7MCRE1z5EUEpsstrAvdtSwgJTvQGH9kHI8=;
        b=hpVfWf1cRWJVC6Ulh4keSSgOpy9SFJJqqhkhNX5Oig+I0PQtx/4QqmkGWFrhIkRty8
         AfIMoWrBqafSSBzE6TGKJjAa3KmpEudgx4QHEsp/JGoIotw5fNOGIMDjrzrtp5imvo2D
         uZCQorSCKbrl8+bOSg/T8l5NwyAb1TkY3dqhreoxq7ccJV+hOrDARdvutLZsi0vatR+u
         Lx/5SRc7B7jhct5wCCbjqhjOZ+mdB9bHqjlLZEf+3WZv+w7kXSSy6wwtmctR/zOGV+xS
         p7JdqMi9fsGpE19lF7m2iHx46BhzUKrV10aFKU2SCyXrrwHaTkEFSQQs1XK6wLq3Roe/
         kWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763666611; x=1764271411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J8MhwnoCi7MCRE1z5EUEpsstrAvdtSwgJTvQGH9kHI8=;
        b=rzXDatdhfV89Ge4GhbZP5mCmpGIt44GLmE0pmo1GVuJ49pE8vtLx4l9TrhVyADyUme
         rXEYZ1dU9X3blO1vsqqp2ACFNLCNVgk2m9zGCAd+4qx0e5iW+ziTznI0A2hfAbZ7t5Au
         0f6yMm68DgYC1aJuHxfhYwl/qORxMJ0vtKwd1I00gVc/7Y37QxLNuozomFUe8bFPDCeh
         vtZSKSmX/DbQeQIebeCmGXhqgdRR1mEl7Kzbfn0WNGFkn8EGQOtoJlpecuX0SnOh3hAq
         T1a8z+9Mglla5rZlfpmPHjVjK9lC5uWGA4JXimFx246GJ+XT+lf1SoOprB79Yp+EOXCs
         Hf2w==
X-Forwarded-Encrypted: i=1; AJvYcCXA0eZRGQrVGpzSy3k7uOhgvVYgMhD6mDQRiI6uS1RqR6GsQ8g1c46Bc9PWD8OHQla3ee73zC0YH9lznZNMPRRE@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj6g5DSJ0d8lK0em68kIP24A1BR3Bp/jzOojs9zdvpJ1iup2Vm
	+DAyjuL4++bx0QKdGshdhtDYY5YAz551aJ12EepnEU8GLDBpbJNWU05A23pHppuV5mA=
X-Gm-Gg: ASbGnct3pCbDisgeevfkPiuMNVq/3KVdjhobCf4bx0Np8Xlb3kojHhRAo8XxaAEA0li
	Fz7XJJjEV7xdEQ4JxUqx/ULZGozSpMb5MQO5+UvqLYCNlFQcJT0+YypZlQDIkceGdSIgLav/E2l
	RvTjMAh4DiImGNh5PqdHfuXVXk1wYh+6Znwc8XwE1Eq6gsONC1b4yq6OvLV+X7AsHSYulY0QFzl
	fns8krVQObAzDWrtq3B6iZDyEHqmRdHmXGPbqqe7JOmpoNVqY23pxAAX/muIZerguFmUvRblkqB
	Jqahn8qRhCzYYNWNWpAarn0ZVVjNcQdngnQh/tFAjosaim/9y1dXRWSzK7xkjuOAqmnHNN8obfw
	7iWANr0Lbqa/rMozTHd+XjjerpnYOGKB7D+402lFkiUSGpH5ZzwEFmDl1HF/TjdqVgfKs81If
X-Google-Smtp-Source: AGHT+IE/mwElOYfVHTU7C/qAO/GFBjQzTy2DO6bb48PfZHOrE+QUNtwUoIfSS8L1DHZs0v1AkcJJBw==
X-Received: by 2002:a17:903:2acb:b0:266:914a:2e7a with SMTP id d9443c01a7336-29b5b11c5e9mr31171165ad.6.1763666611115;
        Thu, 20 Nov 2025 11:23:31 -0800 (PST)
Received: from t14 ([2001:5a8:47ec:d700:51d0:d4a0:ba29:b604])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b107cc2sm34687195ad.16.2025.11.20.11.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 11:23:30 -0800 (PST)
Date: Thu, 20 Nov 2025 11:23:27 -0800
From: Jordan Rife <jordan@jrife.io>
To: bot+bpf-ci@kernel.org
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-s390@vger.kernel.org, x86@kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, martin.lau@linux.dev, puranjay@kernel.org, iii@linux.ibm.com, 
	mingo@redhat.com, martin.lau@kernel.org, eddyz87@gmail.com, 
	yonghong.song@linux.dev, clm@meta.com, ihor.solodrai@linux.dev
Subject: Re: [RFC PATCH bpf-next 3/7] bpf: Enable BPF_LINK_UPDATE for
 fentry/fexit/fmod_ret links
Message-ID: <mpa6euqqnmqmc5ioqnkcji5k4fqtrqqi3tyus74jhhaxouxruj@qnl2ciik2p7e>
References: <20251118005305.27058-4-jordan@jrife.io>
 <47cb75777a482c283798d055c22c0a8c536abe74e9877bb8d01fbccaef840a2e@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47cb75777a482c283798d055c22c0a8c536abe74e9877bb8d01fbccaef840a2e@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_112332_080024_CF0736C3 
X-CRM114-Status: GOOD (  27.73  )
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

On Tue, Nov 18, 2025 at 01:19:33AM +0000, bot+bpf-ci@kernel.org wrote:
> > diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> > index 23fcbcd26..7daf40cbd 100644
> > --- a/include/linux/bpf.h
> > +++ b/include/linux/bpf.h
> > @@ -1215,6 +1215,8 @@ enum {
> >
> >  struct bpf_tramp_links {
> >  	struct bpf_tramp_link *links[BPF_MAX_TRAMP_LINKS];
> > +	struct bpf_tramp_link *update_link;
> > +	struct bpf_prog *update_prog;
> >  	int nr_links;
> >  };
> 
> [ ... ]
> 
> > @@ -1840,6 +1843,13 @@ struct bpf_tramp_link {
> >  	u64 cookie;
> >  };
> >
> > +static inline struct bpf_prog *
> > +bpf_tramp_links_prog(struct bpf_tramp_links *tl, int i)
> > +{
> > +	return tl->links[i] == tl->update_link ? tl->update_prog :
> > +						 tl->links[i]->link.prog;
> > +}
> 
> This helper is added but the architecture-specific code in
> arch/x86/net/bpf_jit_comp.c, arch/arm64/net/bpf_jit_comp.c, and
> arch/s390/net/bpf_jit_comp.c continues to access tl->links[i]->link.prog
> directly. When __bpf_trampoline_update() passes tlinks with update_link
> and update_prog set, won't arch_prepare_bpf_trampoline() and
> arch_bpf_trampoline_size() use the old program instead of the new one?
> 
> For example, in arch/x86/net/bpf_jit_comp.c around line 2966:
>     struct bpf_prog *p = l->link.prog;
> 
> This should probably use bpf_tramp_links_prog() to get the correct
> program during updates. The same pattern appears in the other arch
> implementations.

This is done in follow up patches in this series.

> > diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
> > index 171440f37..486f945f6 100644
> > --- a/kernel/bpf/trampoline.c
> > +++ b/kernel/bpf/trampoline.c
> > @@ -232,7 +232,10 @@ static int register_fentry(struct bpf_trampoline *tr, void *new_addr)
> >  }
> >
> >  static struct bpf_tramp_links *
> > -bpf_trampoline_get_progs(const struct bpf_trampoline *tr, int *total, bool *ip_arg)
> > +bpf_trampoline_get_progs(const struct bpf_trampoline *tr,
> > +			 struct bpf_tramp_link *update_link,
> > +			 struct bpf_prog *update_prog,
> > +			 int *total, bool *ip_arg)
> >  {
> >  	struct bpf_tramp_link *link;
> >  	struct bpf_tramp_links *tlinks;
> > @@ -252,6 +255,11 @@ bpf_trampoline_get_progs(const struct bpf_trampoline *tr, int *total, bool *ip_a
> >  		hlist_for_each_entry(link, &tr->progs_hlist[kind], tramp_hlist) {
> >  			*ip_arg |= link->link.prog->call_get_func_ip;
> >  			*links++ = link;
> > +			if (link == update_link) {
> > +				*ip_arg |= update_prog->call_get_func_ip;
> > +				tlinks[kind].update_link = update_link;
> > +				tlinks[kind].update_prog = update_prog;
> > +			}
> >  		}
> >  	}
> >  	return tlinks;
> 
> [ ... ]
> 
> > @@ -397,7 +405,10 @@ static struct bpf_tramp_image *bpf_tramp_image_alloc(u64 key, int size)
> >  	return ERR_PTR(err);
> >  }
> >
> > -static int bpf_trampoline_update(struct bpf_trampoline *tr, bool lock_direct_mutex)
> > +static int __bpf_trampoline_update(struct bpf_trampoline *tr,
> > +				   struct bpf_tramp_link *update_link,
> > +				   struct bpf_prog *update_prog,
> > +				   bool lock_direct_mutex)
> >  {
> >  	struct bpf_tramp_image *im;
> >  	struct bpf_tramp_links *tlinks;
> > @@ -405,7 +416,11 @@ static int bpf_trampoline_update(struct bpf_trampoline *tr, bool lock_direct_mut
> >  	bool ip_arg = false;
> >  	int err, total, size;
> >
> > -	tlinks = bpf_trampoline_get_progs(tr, &total, &ip_arg);
> > +	if (update_link && !bpf_trampoline_supports_update_prog())
> > +		return -ENOTSUPP;
> > +
> > +	tlinks = bpf_trampoline_get_progs(tr, update_link, update_prog,
> > +					  &total, &ip_arg);
> 
> [ ... ]
> 
> > @@ -503,6 +518,11 @@ static int bpf_trampoline_update(struct bpf_trampoline *tr, bool lock_direct_mut
> >  	goto out;
> >  }
> >
> > +static int bpf_trampoline_update(struct bpf_trampoline *tr, bool lock_direct_mutex)
> > +{
> > +	return __bpf_trampoline_update(tr, NULL, NULL, lock_direct_mutex);
> > +}
> > +
> >  static enum bpf_tramp_prog_type bpf_attach_type_to_tramp(struct bpf_prog *prog)
> >  {
> >  	switch (prog->expected_attach_type) {
> > @@ -626,7 +646,7 @@ static int __bpf_trampoline_update_prog(struct bpf_tramp_link *link,
> >  		return 0;
> >  	}
> >
> > -	return -ENOTSUPP;
> > +	return __bpf_trampoline_update(tr, link, new_prog, true);
> >  }
> 
> [ ... ]
> 
> > @@ -1136,6 +1156,11 @@ arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *image, void *image
> >  	return -ENOTSUPP;
> >  }
> >
> > +bool __weak bpf_trampoline_supports_update_prog(void)
> > +{
> > +	return false;
> > +}
> 
> The commit message says "For now, only x86, arm64, and s390 are
> implemented" but none of these architectures appear to be updated in
> this patch or in the visible preceding commits (627b0f207, b0184022d).
> Without overriding bpf_trampoline_supports_update_prog() to return true
> and updating the arch code to use bpf_tramp_links_prog(), the feature
> will always return -ENOTSUPP on all architectures. Was this patch meant
> to include the arch-specific implementations, or are they in a separate
> series?

The architecture-specific implementations for x86, arm64, and s390 are
in follow up patches in this series.

> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/19450205468


