Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E832ACD8C8F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 16:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzb4D1GabgQR1ju/bq7TjXAWkIanxQvrQtrf25MzCcs=; b=tx3LpfHCOjXotTZES+k2ZwXxjo
	qWiHghmxMc5QDfzODZEQqzjvnYEXvffUcErfzmR1NphJ8a27KWJPkisDO5DrcuekB7GLZK9xQ/NHL
	oiXTqphkGiGXaee5W7xBTCk4+j/54KQAnY5J5RvVfXLnJJtmqlYDosVaygRrMg7jp9DqBZhjW6Cvw
	JN6SYCI19JDZP05A+dAM0h2HEC+neGUvf9QB33zdZ/fNJvwoF8jqD/PjaxKc2R0g2zJZEh5VfHKyt
	/wONGi62j7i0/d2ZLBKm32aenBgcPtUMEFw2ttpTkDo3FaHyesLOXPq2ZSxtTo2pYlFWg0S4fWzj3
	972FEEQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZkF-0000000AlGO-20XB;
	Thu, 13 Nov 2025 16:00:23 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZk5-0000000Al8l-1A1G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 16:00:14 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-64320b9bb4bso2194280a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 08:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763049612; x=1763654412; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gzb4D1GabgQR1ju/bq7TjXAWkIanxQvrQtrf25MzCcs=;
        b=JRzKItBuYvbQOA3nK+I+GUNr0exEXiuy1/5X9Xi9GAHWc0d32Q4JzrVj1Ubb+dWicN
         FqsRh+3Npl3cm6ngYLlZ4H+ZvbU1LIUl4qvXCeEFUO5UUwNvV7beugVbw/SItx2u/TK0
         WHGm2bPNfpyv7Ek2c/A/EngbHB86wHM7fVHQfCPvb17SNhZGek5E09e28tBNkv0TiQ91
         8gCxDbHYG+s7I2hdMl1B3p9fH9LyO/cxdlJ9NN30TxyYlrOLFi1/8UNzT9DDGlhhXImo
         Q+nGsncif60PJHUo27Mr7iCecV7Wd9N7NHT0xJR4Uk9WaPTKKgRGva0foFYSKJkO/G/c
         NrrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763049612; x=1763654412;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gzb4D1GabgQR1ju/bq7TjXAWkIanxQvrQtrf25MzCcs=;
        b=AF3fDDZvaw02f2E5vogvdHSgwl0XVf5eRXbkFqNc9FJxwy7Nv8g5bSLb9dN+/wC03B
         pWlGO11RiCJMQH2zJbeFrXjpuF25TKwyHucQL2rXO7jEfkrtEaWbjjfGx5139A+ZW4gH
         ew9PC2A9hdQsZRWV8ePMBu6hqhzd+ty9p7LWEpI8nICf2ddbeSZcF3xjaainL8n18ynM
         LeLOiW+DbJrRZkU+C3fDG/XvaM8mITWk57GpKq6pAeLIEcnMaOjhn8TBbA/0QaV8yYKC
         IMyyaUrrT0k6A4MWPjRhGP4JzzzgV4Z526ZA9Tl08bDAZlvzeojs/5rFGoBNni4ql6vl
         Ck3A==
X-Forwarded-Encrypted: i=1; AJvYcCVc+z/Xcb8A4rdUb6S2D0x52Kt/uNVuF8k6kiRiK7j3WAkrlvFvMtqaiXl5StU2uI6Mlq1/dSbx6Oeb34xmi8CX@lists.infradead.org
X-Gm-Message-State: AOJu0YxzrGa4wzysWfvOwfnqMlG5Qk1IZrEYAXTbxQUgvTGfy2MP9uFs
	6ggDGjF08iENOF24qRGZVTJgmofObKU1sOGvREHjSugmbGZuZlRhnWib
X-Gm-Gg: ASbGncsKNexE9Jajn6INQkSfekvozmiYcSL6YCCh0N6XuXLKQzChI+77RNfAdd0i9CT
	bGtgHMOYq3w2Z/7g0PFnr9NHECFvn9wwBIO8rTMouxzL03E6r26ZbtWlh/o9+dG8Shv7TeMZIJr
	mXq4W4MagW8pmHA6BtEbFZTf3BdKRR5ZvHFMd7EPFlwLZ4pwjcS+ol5zt8UDUyfTGvcF1tma9Nv
	Ek1oDuI5lVv2xCnsv2YiQQFHs1drxxdwMjaTJ1FdykugF/tk/xIXKz7g0UBz1F0wXRUfPyDiMAn
	3C1EwPZZKYnC8g1PLQ5zQ9HP5IXJDl/T8v9HIjdlhRB94UFHUS7HfT3eQz1v3eCM4KHmtBpQ0lU
	iHP8ntK4rTSKmoyN2T8wkDUcAEQKpPVMcbMt0rmtq5uV/P5189uXSGVvkoTWRIYPv+Q6ttL4h+s
	Y05kRporQJnOaRH89d61UkLjQ=
X-Google-Smtp-Source: AGHT+IHUg8m5nO6prqhXXrSop0u0iR1DdBAnMZvxLkNNj0vJkvj5xpmWgf1HYEe7mOE2U9QwaFpzYw==
X-Received: by 2002:a05:6402:4544:b0:640:9bed:85a5 with SMTP id 4fb4d7f45d1cf-6434f82b24dmr70380a12.8.1763049611134;
        Thu, 13 Nov 2025 08:00:11 -0800 (PST)
Received: from krava (37-188-200-155.red.o2.cz. [37.188.200.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3d8775sm1729153a12.5.2025.11.13.08.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 08:00:10 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 13 Nov 2025 17:00:04 +0100
To: bot+bpf-ci@kernel.org
Cc: rostedt@kernel.org, revest@google.com, mark.rutland@arm.com,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, menglong8.dong@gmail.com,
	song@kernel.org, martin.lau@kernel.org, eddyz87@gmail.com,
	yonghong.song@linux.dev, clm@meta.com, ihor.solodrai@linux.dev
Subject: Re: [PATCHv2 bpf-next 5/8] ftrace: Add update_ftrace_direct_mod
 function
Message-ID: <aRYAhDqGsOHZzTL-@krava>
References: <20251113123750.2507435-6-jolsa@kernel.org>
 <c3260fe9e3d8ad79c75a6e8281f9fae5580beb3fcdd08e2015f417e11ec0a1b2@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3260fe9e3d8ad79c75a6e8281f9fae5580beb3fcdd08e2015f417e11ec0a1b2@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_080013_352553_1926BBC1 
X-CRM114-Status: GOOD (  25.53  )
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

On Thu, Nov 13, 2025 at 01:02:17PM +0000, bot+bpf-ci@kernel.org wrote:
> > diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> > index 433c36c3a..bacb6d9ab 100644
> > --- a/include/linux/ftrace.h
> > +++ b/include/linux/ftrace.h
> > @@ -544,6 +544,7 @@ int modify_ftrace_direct_nolock(struct ftrace_ops *ops, unsigned long addr);
> >
> >  int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash);
> >  int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash);
> > +int update_ftrace_direct_mod(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock);
> >
> >  void ftrace_stub_direct_tramp(void);
> >
> > @@ -581,6 +582,11 @@ int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
> >  	return -ENODEV;
> >  }
> >
> > +int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^
> The stub function name doesn't match the declaration. Should this be
> update_ftrace_direct_mod() instead of modify_ftrace_direct_hash()?

it should, my bad

> 
> > +{
> > +	return -ENODEV;
> > +}
> > +
> 
> [ ... ]
> 
> > diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> > index 345f3fdd2..627d05b57 100644
> > --- a/kernel/trace/ftrace.c
> > +++ b/kernel/trace/ftrace.c
> > @@ -6445,6 +6445,74 @@ int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
> >  	return err;
> >  }
> >
> > +int update_ftrace_direct_mod(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
> > +{
> > +	struct ftrace_hash *orig_hash = ops->func_hash->filter_hash;
> > +	struct ftrace_func_entry *entry, *tmp;
> > +	static struct ftrace_ops tmp_ops = {
> > +		.func		= ftrace_stub,
> > +		.flags		= FTRACE_OPS_FL_STUB,
> > +	};
> > +	unsigned long size, i;
> > +	int err;
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
> > +	if (do_direct_lock)
> > +		mutex_lock(&direct_mutex);
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
>                                                                         ^^^^
> Does __ftrace_hash_update_ipmodify() accept a fourth argument? The
> function signature shows it only takes three parameters (ops, old_hash,
> new_hash). This looks like a compilation error.

the whole patchset is based on bpf-next/master plus Song's livepatch
fixes which change modify_ftrace_direct_hash function, it's mentioned
in the cover letter

> 
> > +	if (err)
> > +		goto out;
> 
> [ ... ]
> 
> > +
> > +out:
> > +	/* Removing the tmp_ops will add the updated direct callers to the functions */
> > +	unregister_ftrace_function(&tmp_ops);
>          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Can this deadlock when do_direct_lock is true? Looking at the code:
> 
>   update_ftrace_direct_mod() with do_direct_lock=true
>     -> mutex_lock(&direct_mutex)
>     -> register_ftrace_function_nolock(&tmp_ops) succeeds
>     -> __ftrace_hash_update_ipmodify() fails
>     -> goto out (still holding direct_mutex)
>     -> unregister_ftrace_function(&tmp_ops)
>        -> cleanup_direct_functions_after_ipmodify()
>           -> mutex_lock(&direct_mutex) /* deadlock */
> 
> The unregister path tries to reacquire direct_mutex that we're already
> holding.

I don't think this can happen because tmp_ops does not have
FTRACE_OPS_FL_IPMODIFY flag set

thanks,
jirka

> 
> > +
> > +unlock:
> > +	if (do_direct_lock)
> > +		mutex_unlock(&direct_mutex);
> > +	return err;
> > +}
> > +
> >  #endif /* CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS */
> 
> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/19332026793


