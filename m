Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1AEC8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 17:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mwYvb/eY2Vzfu8oQfbtqOKtsSA5GvavWBHfNNMubz3s=; b=H9Lkn3psstiSKm+wrAzyD9qJmq
	Dqr0Yk8TPApHmafP18opiEVfVLbjKULmLtE8bq5BXiTvR/tE9/cR6+vIf3faqCuW86POstw2KqeNw
	5/uwvSMjKPATRZq0PacUI7oHTpsnmDePjpRbcu8yqYU59heMlr28gA4ACYdXTYldVxl25khHRTbIc
	vQgByQ0viwITe5IGhDsUOnoWa28GU62uibJEZDDNJ0k89wvWuLxSZSvYnbXImmDUMz5IjO6qnq744
	2xEbvZp6OBTqFVFB+/0zBmNR3P/3jlDPXzdqYT3qkaATRvSLey+NVSsuuHXw53uqfGKlqXScECgnU
	HaEoGcDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWIeX-000000037Fw-2kqn;
	Mon, 30 Jun 2025 17:50:49 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWHRw-00000002wY6-2SPZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 16:33:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1751301223;
	bh=BfXV8nqJ4EJ9pAm1ijz8SPYTeiXmwHI+9FWI3o9x+xA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VoZvzgPSHgQz64AOBA4PTZyz7X7SB6QqJVzFGTBWN9We1UDw27WHcc32a2BX+JIRN
	 UfnaQgWCo3DgKP0YpEAm67lwobotgv3nGri4FqNmT4TeH22VyWpt7h7FJLLM2i1O6W
	 vXMpYk2kyO941eYmixOvVjyWGh4ORET2NNPiW2jI=
Received: by gentwo.org (Postfix, from userid 1003)
	id 0D18540748; Mon, 30 Jun 2025 09:33:43 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 0BDDB401E1;
	Mon, 30 Jun 2025 09:33:43 -0700 (PDT)
Date: Mon, 30 Jun 2025 09:33:43 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, arnd@arndb.de, 
    catalin.marinas@arm.com, will@kernel.org, peterz@infradead.org, 
    akpm@linux-foundation.org, mark.rutland@arm.com, harisokn@amazon.com, 
    ast@kernel.org, memxor@gmail.com, zhenglifeng1@huawei.com, 
    xueshuai@linux.alibaba.com, joao.m.martins@oracle.com, 
    boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v3 5/5] arm64: barrier: Handle waiting in
 smp_cond_load_relaxed_timewait()
In-Reply-To: <20250627044805.945491-6-ankur.a.arora@oracle.com>
Message-ID: <e2e8788d-86b4-092a-37f5-286b776cc061@gentwo.org>
References: <20250627044805.945491-1-ankur.a.arora@oracle.com> <20250627044805.945491-6-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_093344_659179_C2448FAD 
X-CRM114-Status: GOOD (  14.32  )
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

On Thu, 26 Jun 2025, Ankur Arora wrote:

> @@ -222,6 +223,53 @@ do {									\
>  #define __smp_timewait_store(ptr, val)					\
>  		__cmpwait_relaxed(ptr, val)
>
> +/*
> + * Redefine ARCH_TIMER_EVT_STREAM_PERIOD_US locally to avoid include hell.
> + */
> +#define __ARCH_TIMER_EVT_STREAM_PERIOD_US 100UL
> +extern bool arch_timer_evtstrm_available(void);
> +
> +static inline u64 ___smp_cond_spinwait(u64 now, u64 prev, u64 end,
> +				       u32 *spin, bool *wait, u64 slack);
> +/*
> + * To minimize time spent spinning, we want to allow a large overshoot.
> + * So, choose a default slack value of the event-stream period.
> + */
> +#define SMP_TIMEWAIT_DEFAULT_US __ARCH_TIMER_EVT_STREAM_PERIOD_US
> +
> +static inline u64 ___smp_cond_timewait(u64 now, u64 prev, u64 end,
> +				       u32 *spin, bool *wait, u64 slack)
> +{
> +	bool wfet = alternative_has_cap_unlikely(ARM64_HAS_WFXT);
> +	bool wfe, ev = arch_timer_evtstrm_available();

An unitialized and initialized variable on the same line. Maybe separate
that. Looks confusing and unusual to me.

> +	u64 evt_period = __ARCH_TIMER_EVT_STREAM_PERIOD_US;
> +	u64 remaining = end - now;
> +
> +	if (now >= end)
> +		return 0;
> +	/*
> +	 * Use WFE if there's enough slack to get an event-stream wakeup even
> +	 * if we don't come out of the WFE due to natural causes.
> +	 */
> +	wfe = ev && ((remaining + slack) > evt_period);

The line above does not matter for the wfet case and the calculation is
ignored. We hope that in the future wfet will be the default case.

