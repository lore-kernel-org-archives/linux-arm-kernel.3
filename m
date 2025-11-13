Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9651DCD8C8F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 16:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=80JtMfsdtaRpjMfo2AMqSTwjIMkYXc61RQPSQzuIeBo=; b=DF3C7YZAEqPiY3W4l1amgeOr3Y
	pRZ+CNMOrJOebIHJoDCrruYBKDKlba2QxhQlBfX+MUj3HH8QjscUt0orZdT/G01RYVVGIgEVhv6d4
	0wiIiTol2Ls/W2HdPej2VvRtjtth7tnJVf9MQZD+HMj2eIARsQOX9Ch4sqRioCo5akGAswH6/awtq
	KWckef7I3/e1wwie/seCSx0Dk3mN+TlLDuhe+g4W8lqCBcg33V5ZLIP6PhBwN8LdHCIHfj/IGpzBv
	PQ4v1xBtW+TOh6Fjm2NdlQjDkWh6W2Uh0Qdok0fz7w7+t5DjJ7PqxLyLoqziagUoCBnxf4xmZt9Z/
	XLJXAvxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZkJ-0000000AlJj-2Art;
	Thu, 13 Nov 2025 16:00:27 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZkG-0000000AlGl-47BQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 16:00:26 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-64162c04f90so1698737a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 08:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763049623; x=1763654423; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=80JtMfsdtaRpjMfo2AMqSTwjIMkYXc61RQPSQzuIeBo=;
        b=L3XkqpkryQeNqaE+l1zM1OX7InET27xugAIkO5viLVCifZlosY3qIhMphbWWPW50Q+
         48V4sGDZ67bagwTD0gkLS377W7oCvZm5FyWX5X2SzJEfFgoWH7c4luVMoh2D1XvCKmw1
         dj749XZT6HY+/HLqLM17bg+flaY4VcsBPHKNksND9nItJOV8Dh4ES89s/QGXlayDVPfl
         AdzKSuL11z7tun+n0c9l6HtsTMqD7TIf5jWBIR52UDqx/+V2+V1QwmJuf/drJWQTowxp
         ik+IyDKGqTocQtr8qq+rM8dqdL03ejZsZEOB74m6ezY85TTebGXVV6IbH8CkBglX8hrY
         h5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763049623; x=1763654423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=80JtMfsdtaRpjMfo2AMqSTwjIMkYXc61RQPSQzuIeBo=;
        b=KPPpx3yvkChOahzaE/w/vsT1XI1IagXAhYbKJoit6Ry3KTKc5p0T585IW6nSMjMLry
         gnoGy4jlnI8AVw9z7dx73VA1HLKqkFiZVd4KcIJ5lYe4xJCHTuEA/JaL4iZkPH1Iq9eK
         46cXGplekHTG1oGndKeQzzDI3bgpL3V4zhFYtpZ4+eMZTDk2dtYmPzBAuTba96i2er0O
         0L138nI5iWBCaSb9Wn+52BNLShuzamPfEKVKZPj3q1nXUcMpkEVZ4M0e6aDDUk1h9LhA
         V1ePYFUUupk8cfi89HNzJCCeST1JBOkMOussu9chmKdnOG3wNqm5r3/d7zKtMnidRW/z
         T7AQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsQ9nLnNau/+4GVbh/YjGXqAxrPkZrmFA+1fN9yaRRbmMpYxm4ZdNJzu+13PHShgKvRN2lKkLhx72SwKZ7uVto@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy5OF/g58BSHVRMtk9OiuPuNvgAwTk3lE6zTIP2dk25PTelf38
	ByQJVJi33IckvK6lG/jH5tCYlCYElCJolp9VvoB6YLyU6LTpuKoNsuMU
X-Gm-Gg: ASbGnctSK+23giHsT8UsXAJrk7IprgrNDDAFHETPCjB6CcE4BgQsm3PV7nJBFJoZpIp
	h9ECLy6gzE5KG6RMTUG0LGpIUlK+0onF2btGx5UxfMNXkR+RwXGdS3BO1/0a0+Ws1gIoIwOxOSx
	aahsD467I+GDI21rf1JicqOnZxab8Uq2LOhlLxx7BFlyU464paHNH7RVd6/NflSh8gi/8i/T8mW
	eLd+0e1dxfeWUZPnzHQItdJSeDXR+iQ81AzxPcXH/nZtDhReByVJJyfJKpSj8ucUOsnTepBCZXq
	ikEQf570DD6ct12lsb+3bWwIXm3KToZgESbqVwN9KtuJpFH7p3B+baAaAkqHEkn9O9A8XM8gTkj
	jTnUhbxGjw9JngdrNMA/awE/bxHSAWfI9NhhlY+tVe493QIX4zS7SNC08+zwAZ+TOMlTV+7dx4I
	0yxBJ9KCQgM54Sp02WKyfzwQs=
X-Google-Smtp-Source: AGHT+IHxWTR+gxCCm5O+QnaZgcQbkYMnHS+HofPNLwkm1lurpI4br2sYZn3D0vg/6s301g3YrvxytA==
X-Received: by 2002:a17:907:6d0b:b0:b72:d309:5337 with SMTP id a640c23a62f3a-b7331b4c280mr700851766b.65.1763049622904;
        Thu, 13 Nov 2025 08:00:22 -0800 (PST)
Received: from krava (37-188-200-155.red.o2.cz. [37.188.200.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fed90c0sm189439066b.65.2025.11.13.08.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 08:00:22 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 13 Nov 2025 17:00:16 +0100
To: bot+bpf-ci@kernel.org
Cc: rostedt@kernel.org, revest@google.com, mark.rutland@arm.com,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, menglong8.dong@gmail.com,
	song@kernel.org, martin.lau@kernel.org, eddyz87@gmail.com,
	yonghong.song@linux.dev, clm@meta.com, ihor.solodrai@linux.dev
Subject: Re: [PATCHv2 bpf-next 4/8] ftrace: Add update_ftrace_direct_del
 function
Message-ID: <aRYAkKc2uQyofL1i@krava>
References: <20251113123750.2507435-5-jolsa@kernel.org>
 <367c6cc9ffa12937ce18f37fc1271e3d17a3f7aa6ea6d1152cc8a41539994865@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <367c6cc9ffa12937ce18f37fc1271e3d17a3f7aa6ea6d1152cc8a41539994865@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_080025_039926_2311ED33 
X-CRM114-Status: GOOD (  21.98  )
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

On Thu, Nov 13, 2025 at 01:02:21PM +0000, bot+bpf-ci@kernel.org wrote:
> > diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> > index ded3a306a..433c36c3a 100644
> > --- a/include/linux/ftrace.h
> > +++ b/include/linux/ftrace.h
> > @@ -543,6 +543,7 @@ int modify_ftrace_direct(struct ftrace_ops *ops, unsigned long addr);
> >  int modify_ftrace_direct_nolock(struct ftrace_ops *ops, unsigned long addr);
> >
> >  int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash);
> > +int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash);
> >
> >  void ftrace_stub_direct_tramp(void);
> 
> [ ... ]
> 
> > diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> > index 311ce6406..345f3fdd2 100644
> > --- a/kernel/trace/ftrace.c
> > +++ b/kernel/trace/ftrace.c
> 
> [ ... ]
> 
> > +int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
> > +{
> > +	struct ftrace_hash *new_hash = NULL, *filter_hash = NULL, *free_hash = NULL;
> > +	struct ftrace_func_entry *del, *entry;
> > +	unsigned long size, i;
> > +	int err = -EINVAL;
> > +
> > +	if (!hash_count(hash))
> > +		return 0;
> > +	if (check_direct_multi(ops))
> > +		return -EINVAL;
> > +	if (!(ops->flags & FTRACE_OPS_FL_ENABLED))
> > +		return -EINVAL;
> > +	if (direct_functions == EMPTY_HASH)
> > +		return -EINVAL;
> > +
> > +	mutex_lock(&direct_mutex);
> > +
> > +	/* Make sure requested entries are already registered. */
> > +	size = 1 << hash->size_bits;
> > +	for (i = 0; i < size; i++) {
> > +		hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
> > +			del = __ftrace_lookup_ip(direct_functions, entry->ip);
> > +			if (!del || del->direct != entry->direct)
> > +				goto out_unlock;
> > +		}
> > +	}
> > +
> > +	err = -ENOMEM;
> > +	filter_hash = hash_sub(ops->func_hash->filter_hash, hash);
> > +	if (!filter_hash)
> > +		goto out_unlock;
> > +
> > +	new_hash = hash_sub(direct_functions, hash);
> > +	if (!new_hash)
> > +		goto out_unlock;
> 
> Can this leak new_hash?  If hash_sub() succeeds for both filter_hash
> and new_hash, but then either unregister_ftrace_function() or
> ftrace_update_ops() fails below, we goto out_unlock without freeing
> new_hash.  The cleanup code only frees filter_hash:
> 
> > +
> > +	/* If there's nothing left, we need to unregister the ops. */
> > +	if (ftrace_hash_empty(filter_hash)) {
> > +		err = unregister_ftrace_function(ops);
> > +		/* cleanup for possible another register call */
> > +		ops->func = NULL;
> > +		ops->trampoline = 0;
> > +		ftrace_free_filter(ops);
> > +		ops->func_hash->filter_hash = NULL;
> > +	} else {
> > +		err = ftrace_update_ops(ops, filter_hash, EMPTY_HASH);
> > +	}
> > +
> > +	if (!err) {
> > +		free_hash = direct_functions;
> > +		rcu_assign_pointer(direct_functions, new_hash);
> > +	}
> > +
> > + out_unlock:
> > +	mutex_unlock(&direct_mutex);
> > +
> > +	if (free_hash && free_hash != EMPTY_HASH)
> > +		call_rcu_tasks(&free_hash->rcu, register_ftrace_direct_cb);
> > +	if (filter_hash)
> > +		free_ftrace_hash(filter_hash);
> > +
> > +	return err;
> > +}
> 
> If err != 0, new_hash remains allocated but is never freed.  Should the
> cleanup code add free_ftrace_hash(new_hash) when it's non-NULL?

yep, that's a miss, will fix

thanks,
jirka

