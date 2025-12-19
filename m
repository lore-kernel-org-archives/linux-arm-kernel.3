Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D141AD7496D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 09:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCGmpPdYb0Ltj1HSEShjNZdXJFFU/MaFibrJ3AqDnRs=; b=KjwjERgnbSrUooo1n6WC4Qupg4
	pUrCi+TKT41NlSYmRzTLMwW9ZOsr2+9+QIGrft+F141q3+B1yDveXRMrNyl68oeEDOMkSyua5HZ4W
	XB4pkEbLBj86UpzX6eKzGfpdP5PtKy+NyUe4Pa5UgsroWbgB8+ARhhFEol/B0ZkM+nPwM3HmKwLJh
	kRWGSEtXmiIYT/P89yrGXLEU8LGdoLNLzXYNkNqeKg+EAG2NrZLU3WFBPWShLLO5pKQ/Lj+m1pCAw
	suUpbkD9TrLL6u+02Lptj+LtsjtoId8y4r2KUKSttkn6UKl4UyR7qcsMaIkyCC5QNkZrqn0122xSd
	UDsblaqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWmG-00000009wos-01Ts;
	Fri, 19 Dec 2025 09:28:01 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWmB-00000009wmg-1D59
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 09:27:56 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-43246af170aso862855f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 01:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766136473; x=1766741273; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nCGmpPdYb0Ltj1HSEShjNZdXJFFU/MaFibrJ3AqDnRs=;
        b=HaF215zt7nDye0Z6VGQlQGyNFDJ3U5vC5Xaj4Lz0nDG/odf6VffEh5F2dbdQYF78+6
         OIPSK5aMYqDCFCnhzu8btKH6xBZD/XjymyR6lSekqBYGZjKPyZQiSjH5hOzFW9jRNnFq
         amrfT2xife5p1wt2BDhFSzHMivU9rZhStv87FsM/Z5uDqNLC6l2lnCsV4VSyEtgnNhAk
         dqegkMsRGTc64GQ1YYKFEOMJnFC0h+A4HcGaT53zOwRAeII1Fcmoy50RRUh3LTeNlLS+
         rjnzvd/4ZfcsdsnXKbIxsIB9nlYztoV6HLo0EbK7+QIx0aD3QJgZPQLNgWYcQW2t1bjD
         riWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766136473; x=1766741273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nCGmpPdYb0Ltj1HSEShjNZdXJFFU/MaFibrJ3AqDnRs=;
        b=PelBYW7+Cdqa2mVbwRypNQndPQhI2av8VUw9ZFGvV8SB/kHYEN62aOtvbMKYuYapP/
         S6biGlnvnvhpoZ+KndJPdbUX476YyI4z+kWrcDz5HgQefsS3hvHb9PrPfwq4dE+SEPLf
         gXkJdclk1djj+n4cW/00Z5FyRI6aVY02vWTbnY65r4t5SPejX4tUcT19tYYG3XV4Y9l6
         6CXlZbVuwJiu/xpqJDs/IsnfNapS6jhDp4qxwqG5foj5oXSkenWSCEveRCWaYH5vrA6e
         YkC8YpeIBXg0EjGUs90cuIdvPv1u5qNl4JdWN0a7VEW61BsV2Y+2+vWyEYDyKVi4UWom
         SrXA==
X-Forwarded-Encrypted: i=1; AJvYcCXaaQvR+RLwxpxLEDfbRDwLJEtGqes/IMvFpJaZpbfTOxQrU8QUq5QvDd4yToc0HY0LfefF940KE1Lc1QgFfURs@lists.infradead.org
X-Gm-Message-State: AOJu0Yx97rqaF50BMpuKB/LqSZ5O/X0SSg9tP86f+UUH87WTea61KW2w
	QmiTT51lABSyBZl/5sNLXJplzyi63VpkDpAbng9tznpFFmK8KCPNfdH0
X-Gm-Gg: AY/fxX6hkmQ9HjgsiLzGNtESdMSQs5C3q2M8SNJZt0bqrj2P090lw0RpZeZ/0jTGN49
	Pp216C3nQ7ew+MbJLUELTPiyofTVEgnepe+lXxB8//7khcwkuN9SX0ANSjSzbkRPStlP0fmWVdz
	5SW7tQKrCWncY2d/djNsr+WSaQHWRmLHFds71yG2aY3G6P80NO8XK3abLrOXlx786jZpyos9opH
	SvIfYm17wXx4Ov7GuEM/qZSElgzjf1gVWhVsttjMFJLcSXdxmCUtsMCkqh7U9/Ul2uSQVvWPWuk
	nL2L+tNxz27HJssVeFp3+pnDmazICmZk0B9H+O+T1Pp6kdcVcZSuZlQ5lbvJDPpvUsJI/YcDEl9
	e03sS+acTcrKZcDN/PEHo26FerVMrSJtHJMDhKWcksIq9dcZ7tkbiVt38e9hm
X-Google-Smtp-Source: AGHT+IE7/VK4y7V4wJuk9vYv49B29c5HQgz1tSNGyKksyWwzYQwHH1FTIr4fJ/PQrOZ1NBe4x1lPWw==
X-Received: by 2002:a5d:5888:0:b0:431:307:21fc with SMTP id ffacd0b85a97d-4324e42e79emr2769680f8f.23.1766136473309;
        Fri, 19 Dec 2025 01:27:53 -0800 (PST)
Received: from krava ([2a02:8308:a00c:e200::b44f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa2beasm3929064f8f.33.2025.12.19.01.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 01:27:53 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 19 Dec 2025 10:27:51 +0100
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Steven Rostedt <rostedt@kernel.org>, Florent Revest <revest@google.com>,
	Mark Rutland <mark.rutland@arm.com>, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Menglong Dong <menglong8.dong@gmail.com>,
	Song Liu <song@kernel.org>
Subject: Re: [PATCHv5 bpf-next 6/9] ftrace: Add update_ftrace_direct_mod
 function
Message-ID: <aUUal38FoUFnndOI@krava>
References: <20251215211402.353056-1-jolsa@kernel.org>
 <20251215211402.353056-7-jolsa@kernel.org>
 <20251218101942.0716efd6@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218101942.0716efd6@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_012755_345390_0B73F736 
X-CRM114-Status: GOOD (  25.30  )
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

On Thu, Dec 18, 2025 at 10:19:42AM -0500, Steven Rostedt wrote:
> On Mon, 15 Dec 2025 22:13:59 +0100
> Jiri Olsa <jolsa@kernel.org> wrote:
> 
> > diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> > index 48dc0de5f2ce..95a38fb18ed7 100644
> > --- a/kernel/trace/ftrace.c
> > +++ b/kernel/trace/ftrace.c
> > @@ -6489,6 +6489,78 @@ int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
> >  	return err;
> >  }
> >  
> 
> Kerneldoc needed.

will add

> 
> > +int update_ftrace_direct_mod(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
> > +{
> > +	struct ftrace_func_entry *entry, *tmp;
> > +	static struct ftrace_ops tmp_ops = {
> > +		.func		= ftrace_stub,
> > +		.flags		= FTRACE_OPS_FL_STUB,
> > +	};
> > +	struct ftrace_hash *orig_hash;
> > +	unsigned long size, i;
> > +	int err = -EINVAL;
> > +
> > +	if (!hash_count(hash))
> > +		return -EINVAL;
> > +	if (check_direct_multi(ops))
> > +		return -EINVAL;
> > +	if (!(ops->flags & FTRACE_OPS_FL_ENABLED))
> > +		return -EINVAL;
> > +	if (direct_functions == EMPTY_HASH)
> > +		return -EINVAL;
> > +
> > +	if (do_direct_lock)
> > +		mutex_lock(&direct_mutex);
> 
> This optional taking of the direct_mutex lock needs some serious rationale
> and documentation.

it mirrors the use of modify_ftrace_direct/modify_ftrace_direct_nolock
when we do trampoline update from within ftrace_ops->ops_func callback

I'll add comments with more details

> 
> > +
> > +	orig_hash = ops->func_hash ? ops->func_hash->filter_hash : NULL;
> > +	if (!orig_hash)
> > +		goto unlock;
> > +
> > +	/* Enable the tmp_ops to have the same functions as the direct ops */
> > +	ftrace_ops_init(&tmp_ops);
> > +	tmp_ops.func_hash = ops->func_hash;
> > +
> > +	err = register_ftrace_function_nolock(&tmp_ops);
> > +	if (err)
> > +		goto unlock;
> > +
> > +	/*
> > +	 * Call __ftrace_hash_update_ipmodify() here, so that we can call
> > +	 * ops->ops_func for the ops. This is needed because the above
> > +	 * register_ftrace_function_nolock() worked on tmp_ops.
> > +	 */
> > +	err = __ftrace_hash_update_ipmodify(ops, orig_hash, orig_hash, true);
> > +	if (err)
> > +		goto out;
> > +
> > +	/*
> > +	 * Now the ftrace_ops_list_func() is called to do the direct callers.
> > +	 * We can safely change the direct functions attached to each entry.
> > +	 */
> > +	mutex_lock(&ftrace_lock);
> 
> I'm going to need some time staring at this code. It looks like it may be
> relying on some internals here.

ok, thanks

jirka

