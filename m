Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2939DD6D22E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 15:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yjdh15ryxFdfgGi6Q0Dpp1SODJwJ5/l1cIMgrVuZuPk=; b=tCf8ntkSqzCr1oNwk12sKmLKYf
	GN+g4OXFFOUve4flYDqO0PKIwnilE08AAKefrjr9I46d6k2CbzZvQaaBrrT/6q6fvl+xQtzkdsqwl
	fvM1SCzwhWD1jBlVg7j0aWlelg4kdGpp7FZn+kFwWf3OSOeY1h60bjK6u74cQO3VAPkZh56h0PInu
	O/lOJfdQD67OkcE/mToIfKx7FHZbArDm1LBs/+Bhjp9/ITP/ZlZN7w2yuQhGqPVz8PQVhWGuvY7Nf
	NwDHMVq0LP+U3Ickz1lDSSlB/YbfZC0NXFv/nCjYEnTa9SPLbYf4DRtQ4gzOpIDlBs5JFAX731SEV
	geWFLUvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWFli-00000008fvE-15dS;
	Thu, 18 Dec 2025 15:18:18 +0000
Received: from smtprelay0015.hostedemail.com ([216.40.44.15] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWFlf-00000008ftp-0oib
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 15:18:16 +0000
Received: from omf03.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 698F512E4C;
	Thu, 18 Dec 2025 15:18:07 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf03.hostedemail.com (Postfix) with ESMTPA id ABF8A6000C;
	Thu, 18 Dec 2025 15:18:04 +0000 (UTC)
Date: Thu, 18 Dec 2025 10:19:42 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Jiri Olsa <jolsa@kernel.org>
Cc: Steven Rostedt <rostedt@kernel.org>, Florent Revest <revest@google.com>,
 Mark Rutland <mark.rutland@arm.com>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Menglong Dong <menglong8.dong@gmail.com>, Song Liu
 <song@kernel.org>
Subject: Re: [PATCHv5 bpf-next 6/9] ftrace: Add update_ftrace_direct_mod
 function
Message-ID: <20251218101942.0716efd6@gandalf.local.home>
In-Reply-To: <20251215211402.353056-7-jolsa@kernel.org>
References: <20251215211402.353056-1-jolsa@kernel.org>
	<20251215211402.353056-7-jolsa@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: ABF8A6000C
X-Stat-Signature: 7stoz3y9s7gbc4gkicouzdj7p4f5jkai
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18Tawb5aeJtZNDj3eiQyPJECxVNSgJGjLo=
X-HE-Tag: 1766071084-610297
X-HE-Meta: U2FsdGVkX1+XAMvJSK/Fo4/cUd56YAbeR4EMtxvTGxe6O5eiPBzwZZQW8AjtW8GvcqRXaAi4Xg0Dfvb0qmXfsZLi2ZL09yQG6rNuFLlECwO2WvT+949txinB85A5fYnB02qTqj7gtGAxxhgGPNrqLC9pyVnRe33f2Rk/S9T02jpAO7kSFrZ8DDy98lJe1FxTGRbWK8qJAV7KjclFuPIKC3I/4QM2Re8ZpHqBQRF7CT9qYdlEEZFjrYgjNEZdGEQrSeP36Bm9+ENQRURwkY1X6RLmM5CeZwCBC3eFkBqHvp8NBDWiEu8ngW5hNYYU4tHuxg2zp3RSXNQ7DBGBfQihaUSvhWpda+YW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_071815_299339_98CE7B17 
X-CRM114-Status: GOOD (  23.65  )
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

On Mon, 15 Dec 2025 22:13:59 +0100
Jiri Olsa <jolsa@kernel.org> wrote:

> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index 48dc0de5f2ce..95a38fb18ed7 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -6489,6 +6489,78 @@ int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
>  	return err;
>  }
>  

Kerneldoc needed.

> +int update_ftrace_direct_mod(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
> +{
> +	struct ftrace_func_entry *entry, *tmp;
> +	static struct ftrace_ops tmp_ops = {
> +		.func		= ftrace_stub,
> +		.flags		= FTRACE_OPS_FL_STUB,
> +	};
> +	struct ftrace_hash *orig_hash;
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
> +	if (do_direct_lock)
> +		mutex_lock(&direct_mutex);

This optional taking of the direct_mutex lock needs some serious rationale
and documentation.

> +
> +	orig_hash = ops->func_hash ? ops->func_hash->filter_hash : NULL;
> +	if (!orig_hash)
> +		goto unlock;
> +
> +	/* Enable the tmp_ops to have the same functions as the direct ops */
> +	ftrace_ops_init(&tmp_ops);
> +	tmp_ops.func_hash = ops->func_hash;
> +
> +	err = register_ftrace_function_nolock(&tmp_ops);
> +	if (err)
> +		goto unlock;
> +
> +	/*
> +	 * Call __ftrace_hash_update_ipmodify() here, so that we can call
> +	 * ops->ops_func for the ops. This is needed because the above
> +	 * register_ftrace_function_nolock() worked on tmp_ops.
> +	 */
> +	err = __ftrace_hash_update_ipmodify(ops, orig_hash, orig_hash, true);
> +	if (err)
> +		goto out;
> +
> +	/*
> +	 * Now the ftrace_ops_list_func() is called to do the direct callers.
> +	 * We can safely change the direct functions attached to each entry.
> +	 */
> +	mutex_lock(&ftrace_lock);

I'm going to need some time staring at this code. It looks like it may be
relying on some internals here.

-- Steve


> +
> +	size = 1 << hash->size_bits;
> +	for (i = 0; i < size; i++) {
> +		hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
> +			tmp = __ftrace_lookup_ip(direct_functions, entry->ip);
> +			if (!tmp)
> +				continue;
> +			tmp->direct = entry->direct;
> +		}
> +	}
> +
> +	mutex_unlock(&ftrace_lock);
> +
> +out:
> +	/* Removing the tmp_ops will add the updated direct callers to the functions */
> +	unregister_ftrace_function(&tmp_ops);
> +
> +unlock:
> +	if (do_direct_lock)
> +		mutex_unlock(&direct_mutex);
> +	return err;
> +}
> +
>  #endif /* CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS */
>  
>  /**


