Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F5BCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fBpwPKLk6vnL8UYY5mDy+ubFHlNRnEvJu55vl4sTdU=; b=w/zaSu4mBs+e5Q/GKmud6QrY3q
	6ytuDjiOXHw7Fyk6yrGfy4G3MsiXnS2vNP4s6Byc7IzylFGR0333VC6GujQrHqltMhdryE/7xkpys
	ukxE+lPpv6xLjAdteQHlbHTCM1iREyqwPD8iLVx5l1JoVg71tB9ZmiCnRCcwDB80RkLme7UhgyJuI
	AN8dfSTbRcYRSD6e5oTe1reqlXMLxoS2sT4LVWZMX2C9h+DPNqow6ZiQNi3lcfGMdG6N4UAdvH3ER
	oXoeDyGczQokfN3Lu4wuUghs0wDciByqvwYs4KYfPOmlfoe5JSP9iyrJvVg2Es9lMZszN6kXvnSH+
	6/MSI2nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsDO-00000004rPJ-1VoE;
	Tue, 09 Sep 2025 06:52:30 +0000
Received: from smtprelay0015.hostedemail.com ([216.40.44.15] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvl2m-00000002tuM-28HF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 23:13:06 +0000
Received: from omf07.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 06F5F13A9C6;
	Mon,  8 Sep 2025 23:13:00 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf07.hostedemail.com (Postfix) with ESMTPA id 8BFCD20024;
	Mon,  8 Sep 2025 23:12:57 +0000 (UTC)
Date: Mon, 8 Sep 2025 19:13:43 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 02/24] ring-buffer: Introduce ring-buffer remotes
Message-ID: <20250908191343.70aec65c@gandalf.local.home>
In-Reply-To: <20250821081412.1008261-3-vdonnefort@google.com>
References: <20250821081412.1008261-1-vdonnefort@google.com>
	<20250821081412.1008261-3-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: ni7ydp9qrbpt8wgjrstbwwnyqtmr8gbj
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 8BFCD20024
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19spjhfSY8UjKtitQgQ6eGgmVn5ZRZnrII=
X-HE-Tag: 1757373177-398356
X-HE-Meta: U2FsdGVkX1+IYfgT6MRlvk2osIuZXjZrIlcJ4j9/jdqdanGEhbZpZhCkTpcCHolekSvIfER4UCHritpDYKSNxXgeJHqJ4HFNi+KSq85REf37ElikqMQ6enV+we450+7K3/zRwvh3tzoU7hK8b8RkMPcS01+e25BZJtT2vPtAg89pc47YLCh+ATrC5dFyupHwG+ffe8rj9YC5oUtdktmWy+uf6QV05vyZnBq60DRLd762Jv9bKMP0uAX+xN1XtX59B2qr+VZRXRqL3s5QelwxrIDGbc5C5hrUH+iqYvqKWKiSVN3T/L9jqWqw5z4P/aAxnhKoWd14umpKUdFJzHSrdxJxP+WXbLKj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_161304_614624_453F8F30 
X-CRM114-Status: GOOD (  23.95  )
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

On Thu, 21 Aug 2025 09:13:50 +0100
Vincent Donnefort <vdonnefort@google.com> wrote:

> +int ring_buffer_poll_remote(struct trace_buffer *buffer, int cpu);
> +
> +struct trace_buffer *
> +__ring_buffer_alloc_remote(struct ring_buffer_remote *remote,
> +			   struct lock_class_key *key);
> +
> +#define ring_buffer_remote(remote)				\
> +({								\
> +	static struct lock_class_key __key;			\
> +	__ring_buffer_alloc_remote(remote, &__key);		\

If this allocates, then it should have "alloc" in its name too. Why isn't this:

#define ring_buffer_alloc_remote(remote)			\

?

> +})
>  #endif /* _LINUX_RING_BUFFER_H */
> diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> index 064005c9347e..8044cb23ef88 100644
> --- a/kernel/trace/ring_buffer.c
> +++ b/kernel/trace/ring_buffer.c
> @@ -523,6 +523,8 @@ struct ring_buffer_per_cpu {
>  	struct trace_buffer_meta	*meta_page;
>  	struct ring_buffer_cpu_meta	*ring_meta;
>  
> +	struct ring_buffer_remote	*remote;
> +
>  	/* ring buffer pages to update, > 0 to add, < 0 to remove */
>  	long				nr_pages_to_update;
>  	struct list_head		new_pages; /* new pages to add */
> @@ -545,6 +547,8 @@ struct trace_buffer {
>  
>  	struct ring_buffer_per_cpu	**buffers;
>  
> +	struct ring_buffer_remote	*remote;
> +
>  	struct hlist_node		node;
>  	u64				(*clock)(void);
>  
> @@ -2296,6 +2300,40 @@ static int __rb_allocate_pages(struct ring_buffer_per_cpu *cpu_buffer,
>  	return -ENOMEM;
>  }
> 


> +int ring_buffer_poll_remote(struct trace_buffer *buffer, int cpu)
> +{
> +	struct ring_buffer_per_cpu *cpu_buffer;
> +	unsigned long flags;
> +
> +	if (cpu != RING_BUFFER_ALL_CPUS) {
> +		if (!cpumask_test_cpu(cpu, buffer->cpumask))
> +			return -EINVAL;
> +
> +		cpu_buffer = buffer->buffers[cpu];
> +
> +		raw_spin_lock_irqsave(&cpu_buffer->reader_lock, flags);

The above can be replaced by:

		guard(raw_spinlock)(&cpu_buffer->reader_lock);

> +		if (rb_read_remote_meta_page(cpu_buffer))
> +			rb_wakeups(buffer, cpu_buffer);
> +		raw_spin_unlock_irqrestore(&cpu_buffer->reader_lock, flags);

Then we don't need the unlock.

> +
> +		return 0;
> +	}
> +
> +	/*
> +	 * Make sure all the ring buffers are up to date before we start reading
> +	 * them.
> +	 */
> +	for_each_buffer_cpu(buffer, cpu) {
> +		cpu_buffer = buffer->buffers[cpu];
> +
> +		raw_spin_lock_irqsave(&cpu_buffer->reader_lock, flags);

Ditto.

> +		rb_read_remote_meta_page(buffer->buffers[cpu]);
> +		raw_spin_unlock_irqrestore(&cpu_buffer->reader_lock, flags);
> +	}
> +
> +	for_each_buffer_cpu(buffer, cpu) {
> +		cpu_buffer = buffer->buffers[cpu];
> +
> +		raw_spin_lock_irqsave(&cpu_buffer->reader_lock, flags);

Ditto.

-- Steve


> +		if (rb_num_of_entries(cpu_buffer))
> +			rb_wakeups(buffer, buffer->buffers[cpu]);
> +		raw_spin_unlock_irqrestore(&cpu_buffer->reader_lock, flags);
> +	}
> +
> +	return 0;
> +}
> +
>  #ifdef CONFIG_RING_BUFFER_ALLOW_SWAP
>  /**
>   * ring_buffer_swap_cpu - swap a CPU buffer between two ring buffers
> @@ -6600,6 +6801,7 @@ int ring_buffer_read_page(struct trace_buffer *buffer,
>  	unsigned int commit;
>  	unsigned int read;
>  	u64 save_timestamp;
> +	bool force_memcpy;
>  
>  	if (!cpumask_test_cpu(cpu, buffer->cpumask))
>  		return -1;
> @@ -6637,6 +6839,8 @@ int ring_buffer_read_page(struct trace_buffer *buffer,
>  	/* Check if any events were dropped */
>  	missed_events = cpu_buffer->lost_events;
>  
> +	force_memcpy = cpu_buffer->mapped || cpu_buffer->remote;
> +
>  	/*
>  	 * If this page has been partially read or
>  	 * if len is not big enough to read the rest of the page or
> @@ -6646,7 +6850,7 @@ int ring_buffer_read_page(struct trace_buffer *buffer,
>  	 */
>  	if (read || (len < (commit - read)) ||
>  	    cpu_buffer->reader_page == cpu_buffer->commit_page ||
> -	    cpu_buffer->mapped) {
> +	    force_memcpy) {
>  		struct buffer_data_page *rpage = cpu_buffer->reader_page->page;
>  		unsigned int rpos = read;
>  		unsigned int pos = 0;
> @@ -7222,7 +7426,7 @@ int ring_buffer_map(struct trace_buffer *buffer, int cpu,
>  	unsigned long flags, *subbuf_ids;
>  	int err;
>  
> -	if (!cpumask_test_cpu(cpu, buffer->cpumask))
> +	if (!cpumask_test_cpu(cpu, buffer->cpumask) || buffer->remote)
>  		return -EINVAL;
>  
>  	cpu_buffer = buffer->buffers[cpu];


