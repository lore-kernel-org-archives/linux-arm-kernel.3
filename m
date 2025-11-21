Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD6ECFC27C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 13:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHb504fa+R3MQSYXb7rM8ukJxMXoBFNQYhj0anYj8Ok=; b=QE2K/F2wgnCUSIWis573TUjxV9
	uFNuivx2PPDyI3WtchYxNWueImtbJtDtZq2CtHfMxyWiVhGXqBqFqPjl8i9S2chlZ7L+Mm3k1Whkw
	JRjrCNa/oEFBGZlrSwRgXCybhGeSN2g1cCvWIDYGoKI8aZfbhgE8smaJ4KMXSpAy5Gbihhp05fHb6
	MEQXGZbN7WA8TzMfDkjia9Y5dXuQ1X9Y5+o+B+6KcAvmxrYa5+0GxQ+/4r7Nd59Imz/qagTeLHeHe
	o0ia6mkFTPCnlpYnRkExiHFRq8aZeWnmqyg7OUUIfVlCCDjyej5BwePFFLtYdeTom/pyGcmBUp8hN
	8xmpyuYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRZN-00000008Sd8-12N6;
	Fri, 21 Nov 2025 13:53:01 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRZK-00000008ScX-1SZr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 13:52:59 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-42b3377aaf2so1182882f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 05:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763733176; x=1764337976; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dHb504fa+R3MQSYXb7rM8ukJxMXoBFNQYhj0anYj8Ok=;
        b=gMAkO2WqjpdHAqlPGvULV1OoYRj7lYFDJWv6OGqgDw8WKq+Ld8LnLfVdKebWGMo+wX
         A7NL5GEmqX/oSJ5SLi5GfeOd6G5AwHpme+ZvEnEvA8ZWRZh1d4QR90Ww8kD21mURxPap
         5W/nxZlG63a7gbeOSLwHoKE2e+A9YyJicJvAcVXIIxYgtbzRMqH+YrtfAEN1X7sVk9H0
         Z/ZKPxAZv/d509Yp4gpBZUQFGVyHdDaptZ6yzj9k5EhgOXNODSSGgZlbADxSUIj21B7L
         b0hwzBl1yrJxSTf80bUtYxd0h2wYM4A7zE8wQnNlSc2hv/qWEi46TS+Nr10pa7KFUL5v
         0RiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763733176; x=1764337976;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dHb504fa+R3MQSYXb7rM8ukJxMXoBFNQYhj0anYj8Ok=;
        b=fkGva1y6NZnsxPyudhEZqfPvYoMLXWtAIvtnUzhiAXN/DKEzvrC+iU89bm803ApiBP
         olKMLYwfFTgqF/P2MN/0kxo18OA6W/c8IFfOdM8MvGFXZAqLpJvOgWsrUAMMHLl0vw3A
         soFaFX1InfsFk+Ocw6aAYsmfhnnNWdICC4Pw/RTfR5B0OzHid20qnWdlv6L2mu91uvTw
         QwSbDjThOUOe3If1/VtefDjC38iWMt1MXzgrK0JO+IpXOvv3YjKdyKydSlm+SFh2l3i2
         Cjd+bVU3JdzC7+XS6FHqD+/duTaIXv8L7ZAUz5Yx8pOzRpBoZfB4rLwvcGE2d2bb+eAd
         Dxxw==
X-Forwarded-Encrypted: i=1; AJvYcCVCvVy7wqK1KoHiS9dhdV3WiV4jrAXqGwgGYh8rPRNdSkhaBojsp2g7Ld2QrbTzqDd4OEROeSCx1pMSmlA0WGWC@lists.infradead.org
X-Gm-Message-State: AOJu0YxejrjeEvDevEQDPnuw4GQnCuwRS6dju765DGmu1bDtgOda0hj4
	I32Ix0aKvKLEtginfQzjxNLAjn/VFM7WlVPWNcSSqCQL89ea1+3q3iTl
X-Gm-Gg: ASbGncvyM8EVssT6El0nZ2BaiSoAZIerc5UabeTvzcL2GeBCLBjpdRFBvF/4eWXpsZe
	Ag0hzh2NUsfkWN3zS1FOZhFmO6AxF4SRiPV56ohPAfy5hvYC4dfkH7I0Wp299ZIb+k4SqEX/zCG
	HIF77dB0wWhBoRqW6LM2l3Im2JRLw6XMCugcLlCMUYSNbSDGnzgH0V7ISmBu+8gp5firpA+wnOp
	cH7RpsvipN/oPYYQyK9ZIzeB2iSe0839yaIiti4Oe4y2ULWo5+r3MVv6w2vK5tllniS/jSJfzB+
	jdOqned9hjJL8bSvybkJSKw6Yk6eyjnoDlPqc11YYKZQ0PzBIuVFuHDqAIvZhPuCp7ljLDwX9hh
	SldQD8Ju6STXoCBMQNnC633WMcM8OjwrjALGVhhkch+QPz4kfiT8hfJKUgDOk
X-Google-Smtp-Source: AGHT+IFQ2PJAV2V/f/yufGQdBh2mTA4a80qGAW4aT6F0XegW/TNsy0SedHzzQNPnq9UvVkxWMsAwzg==
X-Received: by 2002:a05:6000:4202:b0:42b:2a41:f1a with SMTP id ffacd0b85a97d-42cc1cc2a7amr2525379f8f.26.1763733175918;
        Fri, 21 Nov 2025 05:52:55 -0800 (PST)
Received: from krava ([2a02:8308:a00c:e200::b44f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34fe8sm11228058f8f.15.2025.11.21.05.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:52:55 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 21 Nov 2025 14:52:53 +0100
To: bot+bpf-ci@kernel.org
Cc: rostedt@kernel.org, revest@google.com, mark.rutland@arm.com,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, menglong8.dong@gmail.com,
	song@kernel.org, martin.lau@kernel.org, eddyz87@gmail.com,
	yonghong.song@linux.dev, clm@meta.com, ihor.solodrai@linux.dev
Subject: Re: [PATCHv3 bpf-next 4/8] ftrace: Add update_ftrace_direct_del
 function
Message-ID: <aSButfibgD140NXI@krava>
References: <20251120212402.466524-5-jolsa@kernel.org>
 <35e436ca1a638c9e30456c2a3645c23a20b2483160e3bb34b7c73fe42776f4df@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35e436ca1a638c9e30456c2a3645c23a20b2483160e3bb34b7c73fe42776f4df@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_055258_436765_0C55EE3B 
X-CRM114-Status: GOOD (  23.11  )
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

On Thu, Nov 20, 2025 at 10:23:46PM +0000, bot+bpf-ci@kernel.org wrote:
> > diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> > index 9cf4cd56d..c571deeff 100644
> > --- a/include/linux/ftrace.h
> > +++ b/include/linux/ftrace.h
> > @@ -551,6 +551,7 @@ int modify_ftrace_direct(struct ftrace_ops *ops, unsigned long addr);
> >  int modify_ftrace_direct_nolock(struct ftrace_ops *ops, unsigned long addr);
> >
> >  int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash);
> > +int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash);
> >
> >  void ftrace_stub_direct_tramp(void);
> >
> > @@ -583,6 +584,11 @@ static inline int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace
> >  	return -ENODEV;
> >  }
> >
> > +static inline int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
> > +{
> > +	return -ENODEV;
> > +}
> > +
> 
> [ ... ]
> 
> > diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> > index 850ff55ff..cc730a8fd 100644
> > --- a/kernel/trace/ftrace.c
> > +++ b/kernel/trace/ftrace.c
> 
> [ ... ]
> 
> > +/**
> > + * hash_sub - substracts @b from @a and returns the result
> > + * @a: struct ftrace_hash object
> > + * @b: struct ftrace_hash object
> > + *
> > + * Returns struct ftrace_hash object on success, NULL on error.
> > + */
> > +static struct ftrace_hash *hash_sub(struct ftrace_hash *a, struct ftrace_hash *b)
> > +{
> > +	struct ftrace_func_entry *entry, *del;
> > +	struct ftrace_hash *sub;
> > +	int size, i;
> > +
> > +	sub = alloc_and_copy_ftrace_hash(a->size_bits, a);
>                                            ^^^^^^^^^^^^
> 
> Can hash_sub() handle a NULL hash pointer in parameter a?  I notice the
> parallel function hash_add() safely handles NULL via hash_count() and
> alloc_and_copy_ftrace_hash() which checks ftrace_hash_empty().
> 
> However, hash_sub() directly dereferences a->size_bits before passing a
> to alloc_and_copy_ftrace_hash().  This will crash if a is NULL.
> 
> This matters because update_ftrace_direct_del() calls hash_sub() with
> old_filter_hash which can be NULL:
> 
>     old_filter_hash = ops->func_hash ? ops->func_hash->filter_hash : NULL;
>     ...
>     new_filter_hash = hash_sub(old_filter_hash, hash);
> 
> The existing update_ftrace_direct_add() has the same defensive check and
> passes the potentially-NULL old_filter_hash to hash_add(), which handles
> it correctly.

so we never call update_ftrace_direct_del without having
update_ftrace_direct_add called, which ensures the existence of filter_hash,
but it's probably good idea to do explicit check for future

thanks,
jirka


> 
> > +	if (!sub)
> > +		goto error;
> > +
> > +	size = 1 << b->size_bits;
> > +	for (i = 0; i < size; i++) {
> > +		hlist_for_each_entry(entry, &b->buckets[i], hlist) {
> > +			del = __ftrace_lookup_ip(sub, entry->ip);
> > +			if (WARN_ON_ONCE(!del))
> > +				goto error;
> > +			remove_hash_entry(sub, del);
> > +			kfree(del);
> > +		}
> > +	}
> > +	return sub;
> > +
> > + error:
> > +	free_ftrace_hash(sub);
> > +	return NULL;
> > +}
> > +
> > +int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
> > +{
> 
> [ ... ]
> 
> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/19552032346


