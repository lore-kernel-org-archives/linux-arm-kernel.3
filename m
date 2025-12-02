Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8216AD116F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 14:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ChX94tIO4F5AVgFaNDBv+eRZdyX4C0RWh7xUNZbENe8=; b=KC68LFUxJFxmUS4m6sBpjhbhUf
	DDS3SQYAYZT6apy5qFbgAWxuKQuQ65A7O2pJ18krk27Q39X+zwspdfS4V/T5j8X7uAYIDBQn/7XLt
	Eyf7eaTMIxifHzjEq9cromIgu0/L1BlMPbblRbztuZ+J58Ch5ElQL7MRvD8pRbLJ2Pw7yD8RSU7cc
	Dni+GpFoSDpXQ1LFANn5aTLU2B/ryH2HCFCFgBdpy3xHkNDqhM6DMAZTfBTQJbjy3Vyr60L/KoJXF
	+hmV9xW1pLeYoReb5a56lfESgvBPPPMvId3vSgR/TTq+20ohVsZh11dUIGCDdkEGTNvHmZHK2bhTo
	E4GdSRzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQRS7-00000005VUd-0Sx9;
	Tue, 02 Dec 2025 14:34:03 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQRS4-00000005VU7-1SMj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 14:34:01 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1764686035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ChX94tIO4F5AVgFaNDBv+eRZdyX4C0RWh7xUNZbENe8=;
	b=1DvGH/Ms8RajWMeieHHvc05U81FOOJeB6tWZ4+YpLlMGuSeF4Tj9++A65ZJJshkN/l6UC8
	NH8E9FYYEsxQTjDtph55wCwWhAhHaboIIAgXvUZ4Qc5CTeVdMNZSryVym6KNA8DMsAG7hM
	UezMjjmxpr4F3amCWw1jiUDP+mOwydgd5rXLWMwOYeHbRG9CpBUKIF3nz0tEyrPVnNU6mW
	S4qaoPi6v9ejcVhIByvmRR7alfFmFW7X7SenljlJ3MuFSxngpdL+kGHLJkiy7IlayBJAY5
	Zrq68oxo6Fhr6NgCpzcI8Qj8ra9WePILHkL2fbyIclihOVqthHGRZngJaKkKQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1764686035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ChX94tIO4F5AVgFaNDBv+eRZdyX4C0RWh7xUNZbENe8=;
	b=q9Uv3+OWc5BH7qs3/BlgDKohsfbzLxXOjODsrmlEk5SfzDeXUG3qgPzgeUhQ2Za5tRUF1J
	lNp1G/Q7XFwbpFBQ==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Breno Leitao <leitao@debian.org>,
 linux@armlinux.org.uk, paulmck@kernel.org, usamaarif642@gmail.com,
 leo.yan@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com, rmikey@meta.com, Petr
 Mladek <pmladek@suse.com>
Subject: Re: [PATCH] printk/nbcon: Restore IRQ in atomic flush after each
 emitted record
In-Reply-To: <20251202135832.156559-1-pmladek@suse.com>
References: <20251202135832.156559-1-pmladek@suse.com>
Date: Tue, 02 Dec 2025 15:39:54 +0106
Message-ID: <87o6oheywd.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_063400_528344_D59C89E4 
X-CRM114-Status: GOOD (  15.49  )
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

On 2025-12-02, Petr Mladek <pmladek@suse.com> wrote:
> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index 3fa403f9831f..6b8becb6ecd9 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1549,6 +1549,7 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
>  {
>  	struct nbcon_write_context wctxt = { };
>  	struct nbcon_context *ctxt = &ACCESS_PRIVATE(&wctxt, ctxt);
> +	unsigned long flags;
>  	int err = 0;
>  
>  	ctxt->console			= con;
> @@ -1557,18 +1558,31 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
>  	ctxt->allow_unsafe_takeover	= nbcon_allow_unsafe_takeover();
>  
>  	while (nbcon_seq_read(con) < stop_seq) {
> -		if (!nbcon_context_try_acquire(ctxt, false))
> +		/*
> +		 * Atomic flushing does not use console driver synchronization
> +		 * (i.e. it does not hold the port lock for uart consoles).
> +		 * Therefore IRQs must be disabled to avoid being interrupted
> +		 * and then calling into a driver that will deadlock trying
> +		 * to acquire console ownership.
> +		 */
> +		local_irq_save(flags);
> +		if (!nbcon_context_try_acquire(ctxt, false)) {
> +			local_irq_restore(flags);
>  			return -EPERM;
> +		}
>  
>  		/*
>  		 * nbcon_emit_next_record() returns false when the console was
>  		 * handed over or taken over. In both cases the context is no
>  		 * longer valid.
>  		 */
> -		if (!nbcon_emit_next_record(&wctxt, true))
> +		if (!nbcon_emit_next_record(&wctxt, true)) {
> +			local_irq_restore(flags);
>  			return -EAGAIN;
> +		}
>  
>  		nbcon_context_release(ctxt);
> +		local_irq_restore(flags);


I am not really happy about all the local_irq_restore() usage. Using
guard syntax would be nice here, but AFAICT there is no guard for
local_irq_save()/_restore(). :-/ And I could not come up with any other
alternative that looked more elegant. So let's just keep it this way.

Reviewed-by: John Ogness <john.ogness@linutronix.de>

