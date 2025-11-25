Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC7ED0EE13
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 18:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+AG7wRpqHMNfnJeCQpOQEh9m5Efqdn4nU5nA0/8ob0=; b=wC8Tv4Y+Lh0+naVFSjyIRRjyCy
	b9IVLcZN4AKu1FwnN1qrmMeER41bU7cZu2npiiyHfyMUWehmwpn00QZ0PVBughY39N+ZoeSWfz3/S
	KjM31j1dcSS+x5zkiOUGMlKt1TlF6BC1NV7hQP71b0irA6pbHzMZ+df4P+TOC6vMXmXxEGJxYFecD
	1jYfqgU7SV4u+eDMxcYTppZTYnDPPqSp05KnxF++AhhiCu39vfp3k1jJNm5IUJEogQYxX7LT1vS7W
	gt4u9Fsd7ZjDiSqihmwhf+txRhh2MNpHD8o1buJJOMeIroQsr3HXLtypNAyofrTanpEJglKwEMa/R
	B5g2aj7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNxVg-0000000DkMs-2ZHy;
	Tue, 25 Nov 2025 18:11:28 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNxVe-0000000DkLt-1eAG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 18:11:27 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2960771ec71so10073345ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 10:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrife-io.20230601.gappssmtp.com; s=20230601; t=1764094285; x=1764699085; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3+AG7wRpqHMNfnJeCQpOQEh9m5Efqdn4nU5nA0/8ob0=;
        b=wV5t0Bsi6jcPbbqxn6JxaMA3pASTGSnxV5QQroHgN/RI8m/ivI2qjsJfwXkyBwnYNF
         JuWOHzYj4F6DtAZ5HK/dmZz46c5JOzmnPpzNnmGklFIvdfUlZAEPR7p4whimYckEq1ux
         0okTstsaa2JBke+LgZNIPWyWn4JW2N60I6WeSGCSyCBZNh4rfqIKNz3dXg7ZIGCyVVnk
         rWFSlfXdmTT+lJQC1meJXl0aBAEnW8LsWXm4aUPW2kA94lXO91MczBFeywqVXw9BjTDK
         q6dhYx/2bASANN4RjXFhm8iRPBPDQAwBNVJD8rg5zLbFrNl8BPwoCUxBbHKRTmKRpnIU
         21Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764094285; x=1764699085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+AG7wRpqHMNfnJeCQpOQEh9m5Efqdn4nU5nA0/8ob0=;
        b=jCby1n7mF2VBsnCy4WdeidiJ904R1RBVZwJu858MBogB8Rl35Uui+gAi12t5RHTT5q
         SYnqAQ/yIqeUaLv+P1Yg3tHM+sduLpiil1HdjFGBU0FdzlfBHyt9oFLNaj6+Tsvpai2a
         zYoimv4D9v5LOqurH1WL77SCN3AkjoqcKBhQeTQcxfynKHInms1TMz3p4b1tFKeJQOfI
         0QlTAe8ZZ8MTul8e4AB637RDuHv+Ti9NWZhjuV/15PO0AI0w6GBIo0XLphi1wgBmw7vL
         mEGJG3AKCkBJ5MzGIOsMDGc8PILvCjzkMXOlFg2drNwZ96ZsXtISnPx0ObsHDXKa5jP3
         4PVw==
X-Forwarded-Encrypted: i=1; AJvYcCX3oWRD0ev+7vI5m/Xg174l5uO8/nJdyJp9NjS+gg8QrCalepsVxAoFxHMnBEa6igp7T2QByX+ekS0fs5Dq77Ci@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4Gqs7j2gQlNutfbowgIcgbVlSd5cXe7AFRvZuIcgms4IyX+xm
	SREfBdryU1CwqWjxuTY6gRdugP39bhavKiAY3xJb8Pca/ZWo9YxXgaFOWyBo2RzkJ+M=
X-Gm-Gg: ASbGnct+OvqJKF7d3tpGgx+dIGTse1HJ01LE3I3RbnsdPtrwTy4RMGAxOmsgjDMS78o
	/KEU/jjxBf6+90sOyNCjiv89oIYvLU3OSM+pfm2YJhvJj75Kt1VOUWCAghSf+t49Vh2siE1uzsd
	yZudMvlkcFylrRqQdtk2YOfj0zs4br7AnoYkgfTT/1L+0RUPf2c3myIPe3dVNu3j0gmdGn+jTCv
	T5fBzKnkJ/vcj7Pd5gGSUHpiidk2UUmpMekj/gV8mJYAoEXHgg99jXtT1marc9QlEkWZKrRkk4X
	cX0AMZ7uTBV70yFdY3TnBOOeqCFINdMv+Y+ne3w00yNgC550ycbzBFXfigJJbkqwueIrRDt3n5d
	bssT8mdLeWzzCtiAOZl1GKbk8ZxUwzrQpmcZWT0oB4DAACqyuVJXBgIc6mC9HIS6pevfWwIYo
X-Google-Smtp-Source: AGHT+IEBGikt6OJ5HWjVqcKpTHFX0gDBgZQ5MqEUP1FjP7tMlbvmRvYkAvH4AF2C4YKp+tr7YiXW9w==
X-Received: by 2002:a17:902:ef08:b0:266:914a:2e7a with SMTP id d9443c01a7336-29b70255276mr91488805ad.6.1764094285502;
        Tue, 25 Nov 2025 10:11:25 -0800 (PST)
Received: from t14 ([2001:5a8:47ec:d700:7dee:b1a1:fd3f:6b76])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b2bf60csm173038775ad.101.2025.11.25.10.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 10:11:25 -0800 (PST)
Date: Tue, 25 Nov 2025 10:11:23 -0800
From: Jordan Rife <jordan@jrife.io>
To: Jiri Olsa <olsajiri@gmail.com>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-s390@vger.kernel.org, x86@kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Puranjay Mohan <puranjay@kernel.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>
Subject: Re: [RFC PATCH bpf-next 1/7] bpf: Set up update_prog scaffolding for
 bpf_tracing_link_lops
Message-ID: <mlzsxvgexxalfqxgszivdrg2vuiadtxfydg4p4bvfqpj2wqjep@v5tkqwnlfohy>
References: <20251118005305.27058-1-jordan@jrife.io>
 <20251118005305.27058-2-jordan@jrife.io>
 <aSCUrtsBrfS2iTkB@krava>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSCUrtsBrfS2iTkB@krava>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_101126_435200_8D4C4B2B 
X-CRM114-Status: GOOD (  35.54  )
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

On Fri, Nov 21, 2025 at 05:34:54PM +0100, Jiri Olsa wrote:
> On Mon, Nov 17, 2025 at 04:52:53PM -0800, Jordan Rife wrote:
> 
> SNIP
> 
> > diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> > index f62d61b6730a..b0da7c428a65 100644
> > --- a/kernel/bpf/syscall.c
> > +++ b/kernel/bpf/syscall.c
> > @@ -63,6 +63,8 @@ static DEFINE_IDR(map_idr);
> >  static DEFINE_SPINLOCK(map_idr_lock);
> >  static DEFINE_IDR(link_idr);
> >  static DEFINE_SPINLOCK(link_idr_lock);
> > +/* Synchronizes access to prog between link update operations. */
> > +static DEFINE_MUTEX(trace_link_mutex);
> >  
> >  int sysctl_unprivileged_bpf_disabled __read_mostly =
> >  	IS_BUILTIN(CONFIG_BPF_UNPRIV_DEFAULT_OFF) ? 2 : 0;
> > @@ -3562,11 +3564,77 @@ static int bpf_tracing_link_fill_link_info(const struct bpf_link *link,
> >  	return 0;
> >  }
> >  
> > +static int bpf_tracing_link_update_prog(struct bpf_link *link,
> > +					struct bpf_prog *new_prog,
> > +					struct bpf_prog *old_prog)
> > +{
> > +	struct bpf_tracing_link *tr_link =
> > +		container_of(link, struct bpf_tracing_link, link.link);
> > +	struct bpf_attach_target_info tgt_info = {0};
> > +	int err = 0;
> > +	u32 btf_id;
> > +
> > +	mutex_lock(&trace_link_mutex);
> 
> that seems too much, we could add link->mutex

This penalizes all links though. Scanning through some other link types
in the kernel, most that I see that support update_prog have opted for a
global mutex as opposed to a per-link mutex. To me, it seems better to
go with this since contention is low instead of making link structs
bigger?
 
> > +
> > +	if (old_prog && link->prog != old_prog) {
> > +		err = -EPERM;
> > +		goto out;
> > +	}
> > +	old_prog = link->prog;
> > +	if (old_prog->type != new_prog->type ||
> > +	    old_prog->expected_attach_type != new_prog->expected_attach_type) {
> > +		err = -EINVAL;
> > +		goto out;
> > +	}
> > +
> > +	mutex_lock(&new_prog->aux->dst_mutex);
> > +
> > +	if (!new_prog->aux->dst_trampoline ||
> > +	    new_prog->aux->dst_trampoline->key != tr_link->trampoline->key) {
> 
> hum, would be easier (and still usefull) to allow just programs for the same function?

This behavior mirrors that of bpf_tracing_prog_attach below. I think
you'd lose some utility if you required dst_trampoline to match
trampoline here. A practical use case I can think of would be that you
might want to reuse the same program for several links or
detach/reattach the same program. In these scenarios, dst_trampoline
would have been cleared previously, so you'd need to do the
compatibility check again.
 
> > +		bpf_trampoline_unpack_key(tr_link->trampoline->key, NULL,
> > +					  &btf_id);
> > +		/* If there is no saved target, or the target associated with
> > +		 * this link is different from the destination specified at
> > +		 * load time, we need to check for compatibility.
> > +		 */
> > +		err = bpf_check_attach_target(NULL, new_prog, tr_link->tgt_prog,
> > +					      btf_id, &tgt_info);
> > +		if (err)
> > +			goto out_unlock;
> > +	}
> > +
> > +	err = bpf_trampoline_update_prog(&tr_link->link, new_prog,
> > +					 tr_link->trampoline);
> > +	if (err)
> > +		goto out_unlock;
> > +
> > +	/* Clear the trampoline, mod, and target prog from new_prog->aux to make
> > +	 * sure the original attach destination is not kept alive after a
> > +	 * program is (re-)attached to another target.
> > +	 */
> > +	if (new_prog->aux->dst_prog)
> > +		bpf_prog_put(new_prog->aux->dst_prog);
> > +	bpf_trampoline_put(new_prog->aux->dst_trampoline);
> 
> would it be possible just to take tr->mutex and unlink/link
> the programs, something like:
> 
>         mutex_lock(&tr->mutex);
> 
> 	__bpf_trampoline_unlink_prog(old_prog)
> 	__bpf_trampoline_link_prog(new_prog)
> 
>         mutex_unlock(&tr->mutex);

This is non-atomic though, so there would be some period between unlink
and link where the link target's trampoline doesn't have the program:

[old_prog]
[] <-
[new_prog]

Maybe it's not such a big deal for pure tracing stuff like fentry/fexit,
but it could create some weird and unexpected effects with freplace
links. Unfortunately, to guarantee atomicity, I think you have to push
the intent to actually update a specific program in a trampoline down a
layer (i.e. bpf_trampoline_update_prog).
  
> I might be missing something but this way we wouldn't need
> the arch chages in the following patches?

Alexei said he doesn't want to support update_prog for fentry/fexit;
dropping that from this series (patches 3-6) would remove arch-specific
stuff.

> jirka
> 
> 
> > +	module_put(new_prog->aux->mod);
> > +
> > +	new_prog->aux->dst_prog = NULL;
> > +	new_prog->aux->dst_trampoline = NULL;
> > +	new_prog->aux->mod = tgt_info.tgt_mod;
> > +	tgt_info.tgt_mod = NULL; /* Make module_put() below do nothing. */
> > +out_unlock:
> > +	mutex_unlock(&new_prog->aux->dst_mutex);
> > +out:
> > +	mutex_unlock(&trace_link_mutex);
> > +	module_put(tgt_info.tgt_mod);
> > +	return err;
> > +}
> > +
> >  static const struct bpf_link_ops bpf_tracing_link_lops = {
> >  	.release = bpf_tracing_link_release,
> >  	.dealloc = bpf_tracing_link_dealloc,
> >  	.show_fdinfo = bpf_tracing_link_show_fdinfo,
> >  	.fill_link_info = bpf_tracing_link_fill_link_info,
> > +	.update_prog = bpf_tracing_link_update_prog,
> >  };
> >  
> 
> SNIP

Thanks for taking a look!

Jordan

