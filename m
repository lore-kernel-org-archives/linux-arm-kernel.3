Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D38C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 12:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hpa3Is0IlT4rI8jjz+fN/mGkvSSYcr87GyhJ+zyKSPk=; b=nj0Eo1UK8IlPonIYTFoG49DZPF
	KMiisFeSlh5gTWJHxwg9P3rf/9RvmKfXAb5SETzozq24T2p+fp+2vX90cDBQ1EVy21EiBISRG2yYc
	VVibAxwgUl3UCeBaYPQb5R4Xrrd5zi8aliGqCFPGEeqTgvhG8AieurIFMxDTTAsv3YWbPEjbtFEnG
	NKBLYrW1fVdhe/4pa8+KSeVyIWxFFZma9hV2ySuBfVfATTbT8e9jhxFdETRdnG0tSZ8aK8cchNrdU
	wlEmUQjCNEqSg/aJ2/sYc+bFMGIBnIoPQGx+PIXSsLxpU7oj0WJYr/4mF3d3QB82VlJLyjAzryeKc
	pn20Zt2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thSjG-0000000HMtq-43Eq;
	Mon, 10 Feb 2025 12:17:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thSKu-0000000HJQU-3pHM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 11:52:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64AAF1424;
	Mon, 10 Feb 2025 03:52:40 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E19BC3F5A1;
	Mon, 10 Feb 2025 03:52:11 -0800 (PST)
Date: Mon, 10 Feb 2025 11:52:09 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, oleg@redhat.com,
	sstabellini@kernel.org, tglx@linutronix.de, peterz@infradead.org,
	luto@kernel.org, mingo@redhat.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kees@kernel.org, wad@chromium.org,
	akpm@linux-foundation.org, samitolvanen@google.com,
	masahiroy@kernel.org, hca@linux.ibm.com, aliceryhl@google.com,
	rppt@kernel.org, xur@google.com, paulmck@kernel.org, arnd@arndb.de,
	mbenes@suse.cz, puranjay@kernel.org, pcc@google.com,
	ardb@kernel.org, sudeep.holla@arm.com, guohanjun@huawei.com,
	rafael@kernel.org, liuwei09@cestc.cn, dwmw@amazon.co.uk,
	Jonathan.Cameron@huawei.com, liaochang1@huawei.com,
	kristina.martsenko@arm.com, ptosi@google.com, broonie@kernel.org,
	thiago.bauermann@linaro.org, kevin.brodsky@arm.com,
	joey.gouly@arm.com, liuyuntao12@huawei.com, leobras@redhat.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH -next v5 07/22] arm64: entry: preempt_schedule_irq() only
 if PREEMPTION enabled
Message-ID: <Z6noaWUwn4uCeNN3@J2N7QTR9R3>
References: <20241206101744.4161990-1-ruanjinjie@huawei.com>
 <20241206101744.4161990-8-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206101744.4161990-8-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_035224_988952_455EA883 
X-CRM114-Status: GOOD (  18.20  )
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

On Fri, Dec 06, 2024 at 06:17:29PM +0800, Jinjie Ruan wrote:
> The generic entry check PREEMPTION for both PREEMPT_DYNAMIC
> enabled and PREEMPT_DYNAMIC disabled.
> 
> Whether PREEMPT_DYNAMIC enabled or not, PREEMPTION should
> be enabled to allow reschedule before EL1 exception return, so
> move PREEMPTION check ahead in preparation for moving arm64 over
> to the generic entry code.

This is just moving the IS_ENABLED() check. It'd be clearer to say
something like "hoist the IS_ENABLED() check earlier", but equally we
could do that earleir in the series by folding this into the prior
patch.

Mark.

> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/entry-common.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 80b47ca02db2..029f8bd72f8a 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -109,9 +109,6 @@ void raw_irqentry_exit_cond_resched(void)
>  #ifdef CONFIG_PREEMPT_DYNAMIC
>  	if (!static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
>  		return;
> -#else
> -	if (!IS_ENABLED(CONFIG_PREEMPTION))
> -		return;
>  #endif
>  
>  	if (!preempt_count()) {
> @@ -142,7 +139,8 @@ static __always_inline void __exit_to_kernel_mode(struct pt_regs *regs,
>  			return;
>  		}
>  
> -		raw_irqentry_exit_cond_resched();
> +		if (IS_ENABLED(CONFIG_PREEMPTION))
> +			raw_irqentry_exit_cond_resched();
>  
>  		trace_hardirqs_on();
>  	} else {
> -- 
> 2.34.1
> 

