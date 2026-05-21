Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A639CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 16:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2YGGMyXe7SMejzK+iwa7+2TNKMnNR9YtdBRWN/ulgbU=; b=UmG61Txnp1E7fRYPMzbbEf9ZLJ
	aOyPgmcMPmkSS53o5v8qoTbn8uGXcjOMzjtRdBfjmo/VDCU/iSWAwZ+UvS2wTRkiuT4uPLihhrvHV
	N3ASsNnSEzRvfbgvf1uOJuSRmPUTwkqnPh7U/53bdErlzYpZKwrQnlWaLdBMlA/LICq9FALAZCFfS
	CYMM+sdqYiJMHCvRxHyIubSjOsynZhXjYuSr80YtXTPJop48QHSDTl4rw3FDZTBCPM0jPL1mmRQrK
	MexDxgi+qMvWmtKXggLMlAx6L+N1cYiYNq1VYwJ6kqwpcRBzXs6jeo9JZdff+a/kGGwRoBQUKtH8K
	9i6cQINg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6Rs-00000008WHv-2XKv;
	Thu, 21 May 2026 16:40:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6Rr-00000008WHi-1LYS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 16:40:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5802360098;
	Thu, 21 May 2026 16:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB8051F000E9;
	Thu, 21 May 2026 16:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779381638;
	bh=2YGGMyXe7SMejzK+iwa7+2TNKMnNR9YtdBRWN/ulgbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fG/Z7QUpeZCEYhug5SVVxPYIo0JfhG3m2rPSBOkh2oi7CZgxxvB9zjFWuTOIVy5cY
	 WibkXJmWrgbFkp7QHACq5F6Iem5WFdybG71CCCQXQRLn6OhOj1sqIbllxlDq9rWych
	 k/HgBFcenei9SY6H7SZBfeYEoV3FeNc6blqLlL/dLvy1wOk+hF5rkTY6FpmDroESSW
	 5gLmhOhlH1x6Gh56UTM5lm9dycJvAAQL04TK+0rmz+Rz4Y2SqPQWmV9PN+UGN/P2dB
	 +kLiHstSBHah9ZoE5aC8tSp9SoddkWbQWO5752L+NPURwmmY3x7o3FCOiC+dqEGYM5
	 I58LauGj0TyDQ==
Date: Thu, 21 May 2026 17:40:32 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Waiman Long <longman@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-rt-devel@lists.linux.dev, Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 1/2] gfp_types: Introduce a new GFP_ATOMIC_RT gfp flag
Message-ID: <ag8zX5KJUKo70TvG@lucifer>
References: <20260520204628.933654-1-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520204628.933654-1-longman@redhat.com>
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

+cc Matthew who has fairly strong opinions on GFP flags and such :)

Also, please don't send 2 patch series with 2/2 in-reply-to 1/2, use a
cover letter + have patches reply to that :) [yes it's one of those
subjective things that people differ on a lot but generally how we do in
mm]

On Wed, May 20, 2026 at 04:46:27PM -0400, Waiman Long wrote:
> The GFP_ATOMIC flag is to be used in atomic context where user cannot
> sleep and need the allocation to succeed. However, it does not support
> contexts where preemption or interrupt is disabled under PREEMPT_RT
> like raw_spin_lock_irqsave() or plain preempt_disable().
>
> With the advance of the ALLOC_TRYLOCK allocation flag in the v7.1
> kernel, it is possible to allocate memory under such contexts by using
> spin_trylock to acquire the spinlock in the memory allocation path. This
> does increase the chance that the allocation can fail due to the presence
> of concurrent memory allocation requests. So its users must be able to
> handle such memory allocation failure gracefully.
>
> The ALLOC_TRYLOCK flag will only be enabled if none of the
> ___GFP_DIRECT_RECLAIM and ___GFP_KSWAPD_RECLAIM flags are set.
>
> Introduce a new GFP_ATOMIC_RT gfp flag for those PREEMPT_RT
> atomic contexts.  This new flag will fall back to GFP_ATOMIC in
> non-PREEMPT_RT kernel. GFP_ATOMIC can continue to be used in contexts
> where preemption and interrupt are not disabled in PREEMPT_RT kernel
> like spin_lock_irqsave().

This seems like the wrong place for the solution, now we have to remember
to use a specific GFP flag but only in one specific place in some IRQ code,
yet RT is fine with this in any other scenario?

This is really confusing.

Wouldn't we better off with a way of actively detecting this context
somehow in the page allocator?

It just instinctively feels like this is the wrong level of abstraction for
a fix here :)

>
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  include/linux/gfp_types.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
> index cd4972a7c97c..ac30882b6cd4 100644
> --- a/include/linux/gfp_types.h
> +++ b/include/linux/gfp_types.h
> @@ -316,6 +316,13 @@ enum {
>   * preempt_disable() - see "Memory allocation" in
>   * Documentation/core-api/real-time/differences.rst for more info.
>   *
> + * %GFP_ATOMIC_RT is similar to %GFP_ATOMIC with the addition that it can also
> + * be used in context where preemption and/or interrupt is disabled under
> + * PREEMPT_RT, but not in NMI or hardirq contexts. The allocation is more

I'm not sure 'GFP_ATOMIC_RT' really communicates all of this information.

> + * likely to fail under PREEMPT_RT due to the spin_trylock() nature of lock
> + * acquisition. So the caller must be ready to handle memory allocation failure
> + * gracefully.
> + *
>   * %GFP_KERNEL is typical for kernel-internal allocations. The caller requires
>   * %ZONE_NORMAL or a lower zone for direct access but can direct reclaim.
>   *
> @@ -388,4 +395,10 @@ enum {
>  			 __GFP_NOMEMALLOC | __GFP_NOWARN) & ~__GFP_RECLAIM)
>  #define GFP_TRANSHUGE	(GFP_TRANSHUGE_LIGHT | __GFP_DIRECT_RECLAIM)
>
> +#ifdef CONFIG_PREEMPT_RT
> +# define GFP_ATOMIC_RT	__GFP_HIGH
> +#else
> +# define GFP_ATOMIC_RT	GFP_ATOMIC
> +#endif
> +
>  #endif /* __LINUX_GFP_TYPES_H */
> --
> 2.54.0
>

Cheers, Lorenzo

