Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375A2D68BC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 01:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8lBjH3Y8fRtW6Jdc72d1hn8NLjBCw3hywThpScRhCy0=; b=dUX9FfPbx7pQk9PcSAB1M3b8Fa
	TMQ5vUFjhzyqF/WwW4aQM5xrNWUpIFZ/FZDdBXLqfnjadmfBgSOCaX6o6L+9Mp6vvZtFfooa0znpz
	XvK4CaVMIsU/cAZUoPhrPkWdQ41KBO08ssr8fs//djLp31Bq/4EbS+1PYfz+MJSChClI+VK+lJPIf
	OittYYFWk3cQ1n2QEaVTxQyxBxS5KDS/v/PUPzQ+ekmDk5vn8RBb2PwtFUPxpGqDo1jdkdDnmMaZ2
	v7KxwjkjXXZExm8DWgsu2UTXsj00nVHjr5XkZIpIOHeiWZfIyUqxYB7ZPFfxwkC/+jJkvt6ypSALh
	xXRishdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW37t-00000007fUB-1mhN;
	Thu, 18 Dec 2025 01:48:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW37q-00000007fTq-1iwB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 01:48:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ADA1843BDD;
	Thu, 18 Dec 2025 01:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 324F6C4CEF5;
	Thu, 18 Dec 2025 01:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766022497;
	bh=dQlBuB3KnyMoKeAYJ0vjAIrQK6ORdk+MFt6eBG/8Btg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SdxJLF3CukKnvJa2ypw7qV5usHJoBdKs7WGFk2LjAAUOVNYhDyZdXuftwp3XBJKDA
	 8F8zhdWarRMtr2qax8/EoTFH8U2t/Otkqesr9ld9RChHJZc6CbiJQm2/uOE2DHpDRj
	 AH8t+IswcNb98bAmui+BVD9WD5LeyeYkI4zpLP5tN/90wTXUvFRVLpn/w8Faffs+bv
	 toLDtCCwuTb9r9I/Pq9ZIemp5VBWw3N/reR1+rG+2YsoIaXG33sPUf9TpIToS9cgph
	 J8ALVsLj1LBDtOiDXpcjSxCZ4ibTyylPLmrBzBrFfftd+Pk/2575dO7JTNUMB5Qrp1
	 MElyM7Jle3vLg==
Date: Wed, 17 Dec 2025 20:48:14 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: Jiri Olsa <jolsa@kernel.org>
Cc: Florent Revest <revest@google.com>, Mark Rutland <mark.rutland@arm.com>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Menglong Dong
 <menglong8.dong@gmail.com>, Song Liu <song@kernel.org>
Subject: Re: [PATCHv5 bpf-next 5/9] ftrace: Add update_ftrace_direct_del
 function
Message-ID: <20251217204814.38756224@robin>
In-Reply-To: <20251215211402.353056-6-jolsa@kernel.org>
References: <20251215211402.353056-1-jolsa@kernel.org>
	<20251215211402.353056-6-jolsa@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_174818_516976_45451E9A 
X-CRM114-Status: GOOD (  19.20  )
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

On Mon, 15 Dec 2025 22:13:58 +0100
Jiri Olsa <jolsa@kernel.org> wrote:
> +/**
> + * hash_sub - substracts @b from @a and returns the result
> + * @a: struct ftrace_hash object
> + * @b: struct ftrace_hash object
> + *
> + * Returns struct ftrace_hash object on success, NULL on error.
> + */
> +static struct ftrace_hash *hash_sub(struct ftrace_hash *a, struct ftrace_hash *b)
> +{
> +	struct ftrace_func_entry *entry, *del;
> +	struct ftrace_hash *sub;
> +	int size, i;
> +
> +	sub = alloc_and_copy_ftrace_hash(a->size_bits, a);
> +	if (!sub)
> +		goto error;

Again, this can be just return NULL;

> +
> +	size = 1 << b->size_bits;
> +	for (i = 0; i < size; i++) {

You can make this for (int i = 0; ...) too.

> +		hlist_for_each_entry(entry, &b->buckets[i], hlist) {
> +			del = __ftrace_lookup_ip(sub, entry->ip);
> +			if (WARN_ON_ONCE(!del))
> +				goto error;

And you can remove the error label here too:

			if (WARN_ON_ONCE(!del)) {
				free_ftrace_hash(sub);
				return NULL;
			}


> +			remove_hash_entry(sub, del);
> +			kfree(del);
> +		}
> +	}
> +	return sub;
> +
> + error:
> +	free_ftrace_hash(sub);
> +	return NULL;
> +}
> +
> +int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
> +{
> +	struct ftrace_hash *old_direct_functions = NULL, *new_direct_functions;
> +	struct ftrace_hash *old_filter_hash, *new_filter_hash = NULL;
> +	struct ftrace_func_entry *del, *entry;

One variable per line.

> +	unsigned long size, i;
> +	int err = -EINVAL;
> +
> +	if (!hash_count(hash))
> +		return -EINVAL;
> +	if (check_direct_multi(ops))
> +		return -EINVAL;
> +	if (!(ops->flags & FTRACE_OPS_FL_ENABLED))
> +		return -EINVAL;
> +	if (direct_functions == EMPTY_HASH)
> +		return -EINVAL;
> +
> +	mutex_lock(&direct_mutex);
> +
> +	old_filter_hash = ops->func_hash ? ops->func_hash->filter_hash : NULL;
> +
> +	if (!hash_count(old_filter_hash))
> +		goto out_unlock;
> +
> +	/* Make sure requested entries are already registered. */
> +	size = 1 << hash->size_bits;
> +	for (i = 0; i < size; i++) {

	for (int i = 0; ...) 

-- Steve

> +		hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
> +			del = __ftrace_lookup_ip(direct_functions, entry->ip);
> +			if (!del || del->direct != entry->direct)
> +				goto out_unlock;
> +		}
> +	}
> +
> +	err = -ENOMEM;
> +	new_filter_hash = hash_sub(old_filter_hash, hash);
> +	if (!new_filter_hash)
> +		goto out_unlock;
> +
> +	new_direct_functions = hash_sub(direct_functions, hash);
> +	if (!new_direct_functions)
> +		goto out_unlock;
> +
> +	/* If there's nothing left, we need to unregister the ops. */
> +	if (ftrace_hash_empty(new_filter_hash)) {
> +		err = unregister_ftrace_function(ops);
> +		if (!err) {
> +			/* cleanup for possible another register call */
> +			ops->func = NULL;
> +			ops->trampoline = 0;
> +			ftrace_free_filter(ops);
> +			ops->func_hash->filter_hash = NULL;
> +		}
> +	} else {
> +		err = ftrace_update_ops(ops, new_filter_hash, EMPTY_HASH);
> +		/*
> +		 * new_filter_hash is dup-ed, so we need to release it anyway,
> +		 * old_filter_hash either stays on error or is already released
> +		 */
> +	}
> +
> +	if (err) {
> +		/* free the new_direct_functions */
> +		old_direct_functions = new_direct_functions;
> +	} else {
> +		rcu_assign_pointer(direct_functions, new_direct_functions);
> +	}
> +
> + out_unlock:
> +	mutex_unlock(&direct_mutex);
> +
> +	if (old_direct_functions && old_direct_functions != EMPTY_HASH)
> +		call_rcu_tasks(&old_direct_functions->rcu, register_ftrace_direct_cb);
> +	free_ftrace_hash(new_filter_hash);
> +
> +	return err;
> +}
> +
>  #endif /* CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS */
>  
>  /**


