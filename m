Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E68DD7496D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 09:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4nPSaxdkYRmJvc/bAjl6gt7fyBjx03ifV8lSbnPKMU=; b=Ez1re33SUi1wOryiNc74bFabZE
	SiipkeQ3FfJLh/BzjYIPGWj9ZjmwmiPRXNXZV2XPGtt+msUXWbmXrsvajFRcoVLl+vQ3eVTwG5ZvL
	7dNxxG4Wh2P1umFNZNDs1Blp4WgHSy4h3PWVlISdTCsKjUcRmWAjOA8d8xvt0DwIpg0fWBw187zfq
	Rg0Z0ktW83Wr62V/CzqMWSAvQJ4H25NJLbFwtr9J7NRGGfZwIcGPL2rhUqpNE8j63pMWzhI2WNKZW
	pUPsjTnb4jXJ3a2xz0RAoYP6KOzeNogsKnWBIZA3DUBQzLmlMIgt0Jkyce03FVmGrTaXj2DyAfoJw
	RHCvzEMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWm1-00000009wkl-19wW;
	Fri, 19 Dec 2025 09:27:45 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWlz-00000009wkB-0AhK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 09:27:44 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-477aa218f20so9796145e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 01:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766136461; x=1766741261; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l4nPSaxdkYRmJvc/bAjl6gt7fyBjx03ifV8lSbnPKMU=;
        b=nJKVMId3IwmEz4TqS9TOnC5do5K+Wmiy4Q0Ab06fh4b2vRCjYS3Nw5HSNpBuOzDszq
         AyVitnGs2KeppY9bsZapqEmPXvMXcerqsxUMi3q2s022AEVBK5kdmFuA3tnsqYmBi3Hr
         TY/uFrdjoMoWB1h5n8ifDSF5vKCXqes9xa6Bj2vAbGC4mdlvcHT3L5L+mRL13OGww+B3
         WtBKm3nDjg2tje8MBQlNOgaJu8C7xmUDaSIyb1ePC0pJr1hghJBaLZc10N7bNYIK+Oaf
         eOlpBlM0+LEFP7XL0qrhDQNhq4RIx3hVmFT7RBgZ8/2e6CSN1ZkJbjxRlDww2sYt1SEn
         dLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766136461; x=1766741261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l4nPSaxdkYRmJvc/bAjl6gt7fyBjx03ifV8lSbnPKMU=;
        b=w2jxXJA1whymyzqbyKfE9iJEYP4Hn2+42z84C5s9F7bihdwonNhkG+q6gtQ1FtFyZh
         rF2hyuersFDYGVEQZQ7T93fhKDZk1uP+NE1qNdrcjNcijlEGBj0CvDGlbIUN/BOaZ5gL
         JNGrKR/Az/ZeVHosHHgPtgIDrsEZBRTcPqjYK+txm1w0AqrMtgILh1zWmygqM0KazNG/
         koAK2RwdXMYV8nu4aQsN8nS5NwfWTeyADhCa0AidmPTj9MG7K1oFPrdT4eQJmgHYSs+3
         EZPTzzicyRfGSFoHAm0skurQeYZ2U4+p//yv3HlRRvcReEKN4EbL/wAn7sCKLPgPAZZw
         lbjw==
X-Forwarded-Encrypted: i=1; AJvYcCWbK13xKp0dzXDv6m5x7B5nSXqlK6BuGXf+QnKSXwCWWOBYJ7U5G/m5i5HmVSQVBeiGCWorVFaTGsnv3NCDvN8N@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1b29pautvplkM1+XXW7Lfa+vaZjAjsIC3Xi0tllg3kvhCqcv5
	J4R+xEIxcM7kBjzhIzvLBpconpw963puHBSE4S2xSnIU3syyyreGQNIK
X-Gm-Gg: AY/fxX7DKetc2Ua2tbY0+aqDY3YyqsZNeKQ0ogn7RpF7n3pZUHXOy4D2scuRUCi7Lhp
	pnmc3aC/m6sHuoHZnJf2m9MPjrAGE95R1Cf1UBEsyt9h9KNNRwtRbDhaxJFH2xAOC8BHeuzgTeN
	KQ4WwJ9i4KXQOSfr8J6qpKXGbnnCbLYL40Xa4SaeKWN8xMoPj3B7B4frPjzCG2AUpReu5Hsv5FW
	8I5j1h3EXzJdcIrB9gY+emiQD31F2pWOYuPvUcYhQGmqJOqZZOwtFlCZZCPngt3VyfCbGd2DrzP
	zYEXuTC/Zk4WQ3+7UScJPaJKTLVhO7q5ocAkziZh9jHiDy+G/3wydb5qq3dyahbRCYMtYfXHNrk
	4k8zib/5IyyOsjwjTLHUsskkC5FcPYKovQmmx99p/bO4Zp153NJCc5Dyv+sJf
X-Google-Smtp-Source: AGHT+IFlqi3iHxkGvauVr0NGTT2g6Itjhn/GDO0PNuIXTX1fYZewz4dI/OFWH3DrEPm2JlrPjHWWLw==
X-Received: by 2002:a05:600c:820d:b0:477:7c7d:d9b7 with SMTP id 5b1f17b1804b1-47d1958e475mr18862055e9.33.1766136460836;
        Fri, 19 Dec 2025 01:27:40 -0800 (PST)
Received: from krava ([2a02:8308:a00c:e200::b44f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm88493555e9.7.2025.12.19.01.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 01:27:40 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 19 Dec 2025 10:27:38 +0100
To: Steven Rostedt <rostedt@kernel.org>
Cc: Florent Revest <revest@google.com>, Mark Rutland <mark.rutland@arm.com>,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Menglong Dong <menglong8.dong@gmail.com>,
	Song Liu <song@kernel.org>
Subject: Re: [PATCHv5 bpf-next 4/9] ftrace: Add update_ftrace_direct_add
 function
Message-ID: <aUUaiqP4kjGwlUMG@krava>
References: <20251215211402.353056-1-jolsa@kernel.org>
 <20251215211402.353056-5-jolsa@kernel.org>
 <20251217203909.474ae959@robin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217203909.474ae959@robin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_012743_117970_31E8A8AD 
X-CRM114-Status: GOOD (  23.79  )
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

On Wed, Dec 17, 2025 at 08:39:09PM -0500, Steven Rostedt wrote:
> On Mon, 15 Dec 2025 22:13:57 +0100
> Jiri Olsa <jolsa@kernel.org> wrote:
> 
> 
> > +/**
> > + * hash_add - adds two struct ftrace_hash and returns the result
> > + * @a: struct ftrace_hash object
> > + * @b: struct ftrace_hash object
> > + *
> > + * Returns struct ftrace_hash object on success, NULL on error.
> > + */
> > +static struct ftrace_hash *hash_add(struct ftrace_hash *a, struct ftrace_hash *b)
> > +{
> > +	struct ftrace_func_entry *entry;
> > +	struct ftrace_hash *add;
> > +	int size, i;
> > +
> > +	size = hash_count(a) + hash_count(b);
> > +	if (size > 32)
> > +		size = 32;
> > +
> > +	add = alloc_and_copy_ftrace_hash(fls(size), a);
> > +	if (!add)
> > +		goto error;
> 
> You can just return NULL here, as add is NULL.

ok

> 
> > +
> > +	size = 1 << b->size_bits;
> > +	for (i = 0; i < size; i++) {
> > +		hlist_for_each_entry(entry, &b->buckets[i], hlist) {
> > +			if (add_hash_entry_direct(add, entry->ip, entry->direct) == NULL)
> > +				goto error;
> 
> Could remove the error and have:
> 
> 			if (add_hash_entry_direct(add, entry->ip, entry->direct) == NULL) {
> 				free_ftrace_hash(add);
> 				return NULL;
> 			}

ok

> 
> 
> > +		}
> > +	}
> > +	return add;
> > +
> > + error:
> > +	free_ftrace_hash(add);
> > +	return NULL;
> > +}
> > +
> 
> Non static functions require a kerneldoc header.

ah right, will add

> 
> > +int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
> > +{
> > +	struct ftrace_hash *old_direct_functions = NULL, *new_direct_functions;
> > +	struct ftrace_hash *old_filter_hash, *new_filter_hash = NULL;
> 
> BTW, I prefer to not double up on variables. That is to have each on
> their own lines. Makes it easier to read for me.
> 
> > +	struct ftrace_func_entry *entry;
> > +	int i, size, err = -EINVAL;
> 
> Even here.

ok, will split

> 
> > +	bool reg;
> > +
> > +	if (!hash_count(hash))
> > +		return -EINVAL;
> > +
> > +	mutex_lock(&direct_mutex);
> > +
> > +	/* Make sure requested entries are not already registered. */
> > +	size = 1 << hash->size_bits;
> > +	for (i = 0; i < size; i++) {
> 
> If you want, you can remove the i declaration and use for(int i = 0; ... here.

ok

SNIP

> > +	}
> > +
> > +	if (err) {
> > +		/* reset direct_functions and free the new one */
> > +		rcu_assign_pointer(direct_functions, old_direct_functions);
> > +		old_direct_functions = new_direct_functions;
> > +	}
> > +
> > + out_unlock:
> > +	mutex_unlock(&direct_mutex);
> > +
> > +	if (old_direct_functions && old_direct_functions != EMPTY_HASH)
> > +		call_rcu_tasks(&old_direct_functions->rcu, register_ftrace_direct_cb);
> > +	if (new_filter_hash)
> 
> free_ftrace_hash() checks for NULL, so you don't need the above if statement.

ok

thanks,
jirka

