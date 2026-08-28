Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB27C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 12:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHN2OGlf9GRTtKA96vHo/h+pDHfL02/7NECu7KyWS+I=; b=C/9pK+hVASTDsF20KAHZAicWPK
	Skp4OPy7rQzxlgt2C1RXKRDaj4wTtYsGDOlGa/lq0mNSafeIwBYAEwHfBOugbG/DhS94HjxoNEbb/
	XLmKxDQYsGlazRpzxepIfKYN+up4YHf4JciR5HBaxHqSdSoornWOtTfbSlGfzNEzKXJlM3hSzVp2N
	nJYss3rcCcXtooj7bxCsdadvFE4DaX/YXmI1m3NIF2GB9lUkDCjWh8n6WtyabYswNz96i7CmsLRox
	Fk/8Mtl+hAM0TDXMKF/hTskQeCwcEECuohlvGT4IFXcbmwKgdPT0wbK21y3dPhuKo53Rur/HBORus
	Fmf5rARg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzw8u-00000005mDo-12fl;
	Fri, 28 Aug 2026 12:57:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzw8t-00000005mDf-1eti;
	Fri, 28 Aug 2026 12:57:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qHN2OGlf9GRTtKA96vHo/h+pDHfL02/7NECu7KyWS+I=; b=ZBP0PlIgUBT5PXNCWPnT6ZNLza
	iqi8pjnn5U2zgxLE3/f1oPZ9VivUarl90IrtBOBu31xNSGl542Eh2cQMsbuXL8RhZI7DhRsskA9Ov
	9C4dP5+Pwos2L2HWhnCqdm9+DLYTiHOEm8b8L+wIALCO+s8eaRWQDHTNysdJS3RfEZmJ/Z2v+ePz6
	+a5Nb5uJOArtDnR8MEwaQG+AR1VGkPILsrjEtlxSAmpUHVbTu9adhmtvtwM2kOgyivnGev1wctlAd
	c63CCdNSci5tpTj6b9w2phQOg1GEBotE4nJuU+zmBShMnRddlInXXJyDYh+NPB3FJbKSJCWhodF24
	EYMbarmQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzw8p-0000000Eih6-0Dlt;
	Fri, 28 Aug 2026 12:57:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3A54630116A; Fri, 28 Aug 2026 14:57:06 +0200 (CEST)
Date: Fri, 28 Aug 2026 14:57:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: David Stevens <stevensd@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>, suleiman@google.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev
Subject: Re: [RFC 06/10] Reclaim memory from blocked kernel stacks
Message-ID: <20260828125706.GQ687043@noisy.programming.kicks-ass.net>
References: <20260827232948.2520558-1-stevensd@google.com>
 <20260827232948.2520558-7-stevensd@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827232948.2520558-7-stevensd@google.com>
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

On Thu, Aug 27, 2026 at 04:29:44PM -0700, David Stevens wrote:
> +DEFINE_CLASS(allow_stack_reclaim, bool,
> +	     ({
> +		if (!_T)
> +			current->flags &= ~PF_RECLAIMABLE_STACK;
> +	      }),
> +	     ({
> +		bool was_set = current->flags & PF_RECLAIMABLE_STACK;
> +
> +		current->flags |= PF_RECLAIMABLE_STACK;
> +		was_set;
> +	      }),
> +	     void)

> +	allow_stack_reclaim(prev);

> +void __allow_stack_reclaim(struct task_struct *tsk)
> +{
> +	union stack_reclaim_state prev_state, target_state;
> +
> +	if (WARN_ON_ONCE(tsk->__state == TASK_DEAD))
> +		return;
> +
> +	prev_state.val = READ_ONCE(tsk->stack_reclaim_state.val);
> +	do {
> +		target_state.val = prev_state.val;
> +
> +		if (prev_state.stack_state != STACK_PREPARE_RECLAIM) {
> +			WARN(prev_state.stack_state != STACK_IN_USE,
> +			     "Reclaimable state %x for previously running task", prev_state.val);
> +			return;
> +		}
> +		target_state.stack_state = STACK_RECLAIMABLE;
> +	} while (!try_cmpxchg(&tsk->stack_reclaim_state.val, &prev_state.val, target_state.val));
> +
> +	if (irq_work_queue(&tsk->stack_reclaim_work->irq_work)) {
> +		/*
> +		 * Take a ref that gets released by do_reclaim_stack() so we don't
> +		 * have to worry about races with remove_from_stack_shrinker().
> +		 */
> +		get_task_struct(tsk);
> +	}
> +}

> +static inline void allow_stack_reclaim(struct task_struct *tsk)
> +{
> +	if (unlikely(tsk->flags & PF_RECLAIMABLE_STACK))
> +		__allow_stack_reclaim(tsk);
> +}

So you have a guard with the same name as a function, but the function
only functions when inside the guard of the same name. WTF ?!

Anyway, it looks like you're sprinkling this guard around a few specific
block sites. Which seems to suggest your PF_ flag *should* have been a
TASK_ flag, no?


