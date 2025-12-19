Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0C5D7496D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 09:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qmnXlxHoWq0NbG8Ccw5YQt/6uSNtB/ujN6Gu6zmgr7g=; b=TYmTNNB1lJafC3LrXsL+iADWFO
	zs2FIu/Gzj+nbcec6cemq9VDgQeKuyWS8mayhuL7HtSkHZ5JtGhQs6S6xvJC8QJgZQ+f+o/9caQ/g
	oEKKPCtHuIXMD/oH+vzXXzcHvpTiX66SRrKUnHZadiYvN5IB3jsEZzw/26ebyGrO45QogqTZCnA6w
	elSfbeGGAOwq5ugFfK9+dvnoRzepKxzGvB9ztcdLYSv4KkETX4okgM4CDIU1OsRxm32t4dWtfsRai
	TUMuxKNSGfuQaG/3r4kwqOOcCCmzgwWaDR43q1cDZCmw0D8JgQGBG7uIe9UDQOFDkl2NB7WRmyw9i
	Wb3bUwaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWmA-00000009wmm-2PEF;
	Fri, 19 Dec 2025 09:27:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWm8-00000009wmH-3t0d
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 19 Dec 2025 09:27:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:Date:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qmnXlxHoWq0NbG8Ccw5YQt/6uSNtB/ujN6Gu6zmgr7g=; b=ZfV/FgzNOj0AlOtJB5WwTgNGcf
	RuP7nYlcY2cotOq18rORBYvfnJ0sTLtb57X6g1PRG+tYsz5poN6MPPdSKgca9xfk7Kp2l9bxeoFZJ
	1ZXzfG9Lf03L4QC0pgl4/PB1RZRXRgZ/z2HXf476JzDmEVxid1anyJmvN1PmdygyII8dX3YKEbgt8
	t8Vqs+PXDlnpZliMbTWJAd3z4qdBqEbVB70F5rsQF+zpriG9SKSQr3JyjsOTJ0TzmE9v/dXucqnmD
	T3WCaT1MNeVvWbPb3HaZQB7n5N5qphi1OGjWAbWBOUm+ZJGVg5uFPtUDw6as9NpRrIt/8HTr6u2OZ
	qLa7A0IQ==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVud-0000000ATjg-0Y81
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 08:32:37 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so15620245e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 01:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766136467; x=1766741267; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qmnXlxHoWq0NbG8Ccw5YQt/6uSNtB/ujN6Gu6zmgr7g=;
        b=KxJaABRyFr5YIRikUocqU+r7xvNJoIUoiKr6n4FOW3ySmFZUOAAZaOAu+2t+bXMn8E
         Q5zkAodYXL1TTnHw3uN6HImIk2s+RbfZ03rJ/Yy/zgqsNXyGQZU/jK6pvTh3dpX3Z3mS
         R8Q+LgSfI8SJlCD8HwEH64xsMWBYEd8N0ch0IobQy3LOGyYP4VkraTfdy+k9nHLJt9Mj
         DxjAMqWKQKmnP3tlciWbgRnxQfgeN5J8JRt5CktEQofZkeakANqgxoTt70q+1zMMaEdF
         8BL6dH1id4BEaKxNqIbykmqPv21NcnawboafRnW9bhK2ZMHomWjQlMoSGhp//4r02Vqs
         AAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766136467; x=1766741267;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qmnXlxHoWq0NbG8Ccw5YQt/6uSNtB/ujN6Gu6zmgr7g=;
        b=kIhCBjkHglSSx4bKzT1JD5eeTMTvM5VU0MO+sW7QZa4PuqZEqbuzIUeQ2lwHjUKCuw
         i2USRC5xDEg8t96UDW+EU3bQmBS8L/SFgwKz2SiPeNkS3DtwBM8lqmJC4WV5I8/fUs8t
         wntB3L65tpi19XwTFGQfV1HXnKOsxrZMeUKEQJXo2OCi+/q8Po4H7QJDMy2kfzK3fV7a
         XXa1seBnwo2Q7u/uUcqm1D7ZXZkkWBAzQej6b57uAGItlMLWMOz3IYrJaSmHwX8gQQNT
         ThCXKNF2Lm8zXPqQoGeQXAMpwFMuY2DwESj9iOMhCh4NGvSWbOLKouBKACv8mNx1SbPs
         /mpw==
X-Forwarded-Encrypted: i=1; AJvYcCVNzgdbdzT9UTrRd9VIWoO2v5YUmM8twIIQJvI5iXBBDLt3vOiMMcvSLUkNUr4gqGAvX83ApgFREXtLgSiHsDWd@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo9I87FIa5f8Y/dB/9s1OfVHxYrI2PA3h5VXzItD7gRdNY7Tlw
	KIFGldyo4hcMT9bxYk5OnO4QRV/BYTVHAuSQLOegbAFb9AHY5YJMP9wH
X-Gm-Gg: AY/fxX5T4v5cEv0mONjpIecBx5N2pU38AByU6QIEPUanNzG6J/8jW+amzN0Cfxh7WBk
	8bNLMvoUUfngD4c3gE+QP/4j/Zf8cCRPOkC0ayBoEv+LZR0P1xLSeen5dufMcfMvufvDGhWa/zW
	GSYxIOjdQBKL7eUkNxfzVTxDrBbyes/8eX0VUsjvdSmXNDvZPfWMsyqHhnOanu9bVbpSN1HV9jx
	lGUDD3WDQNr1RLHOwvw3XIzK95xI25EdlV7llzyZw0uJ/bDpEQQ55TCq1VGiS6qNFWSX3UBPwaD
	OxFd2jbdER+DIZfnzLQgkaRcybPNI2yQekF485l6FAZ2Lw7lzjAquVKOiHZlXhlBuueYcr3xRTD
	Zlu6BJWeRcr0cMbPKVq4v5PBOovz8o29+BSbBKJqyBhobtCCmzutSGi7JJfhF
X-Google-Smtp-Source: AGHT+IEyiXP2r+UagAVyzsxyVSYES1j9aAQG6eYvB7U3MJyHwiFSEqfhleLuOyMaRGuuYSwfofjO1g==
X-Received: by 2002:a05:600c:4e90:b0:46e:3d41:6001 with SMTP id 5b1f17b1804b1-47d1959440dmr18983345e9.34.1766136467150;
        Fri, 19 Dec 2025 01:27:47 -0800 (PST)
Received: from krava ([2a02:8308:a00c:e200::b44f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm90595515e9.12.2025.12.19.01.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 01:27:46 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 19 Dec 2025 10:27:45 +0100
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
Subject: Re: [PATCHv5 bpf-next 5/9] ftrace: Add update_ftrace_direct_del
 function
Message-ID: <aUUakb_Bv1sDfJUR@krava>
References: <20251215211402.353056-1-jolsa@kernel.org>
 <20251215211402.353056-6-jolsa@kernel.org>
 <20251217204814.38756224@robin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217204814.38756224@robin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_083235_560279_54AE6C03 
X-CRM114-Status: GOOD (  19.70  )
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

On Wed, Dec 17, 2025 at 08:48:14PM -0500, Steven Rostedt wrote:
> On Mon, 15 Dec 2025 22:13:58 +0100
> Jiri Olsa <jolsa@kernel.org> wrote:
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
> > +	if (!sub)
> > +		goto error;
> 
> Again, this can be just return NULL;

ok

> 
> > +
> > +	size = 1 << b->size_bits;
> > +	for (i = 0; i < size; i++) {
> 
> You can make this for (int i = 0; ...) too.

ok

> 
> > +		hlist_for_each_entry(entry, &b->buckets[i], hlist) {
> > +			del = __ftrace_lookup_ip(sub, entry->ip);
> > +			if (WARN_ON_ONCE(!del))
> > +				goto error;
> 
> And you can remove the error label here too:

ok

> 
> 			if (WARN_ON_ONCE(!del)) {
> 				free_ftrace_hash(sub);
> 				return NULL;
> 			}
> 
> 
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
> > +	struct ftrace_hash *old_direct_functions = NULL, *new_direct_functions;
> > +	struct ftrace_hash *old_filter_hash, *new_filter_hash = NULL;
> > +	struct ftrace_func_entry *del, *entry;
> 
> One variable per line.

ok

> 
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
> > +	mutex_lock(&direct_mutex);
> > +
> > +	old_filter_hash = ops->func_hash ? ops->func_hash->filter_hash : NULL;
> > +
> > +	if (!hash_count(old_filter_hash))
> > +		goto out_unlock;
> > +
> > +	/* Make sure requested entries are already registered. */
> > +	size = 1 << hash->size_bits;
> > +	for (i = 0; i < size; i++) {
> 
> 	for (int i = 0; ...) 

ack

thanks,
jirka

