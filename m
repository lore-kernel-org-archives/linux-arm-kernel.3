Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984C2D5D69F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 02:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3R/pG+FN6ewlTbN+JnDkv2UO84G3m1YZ/5crkcJIlc=; b=CjpVXiw+vCLLP2LdhfODxQbRFL
	U6/JLnxuqrNwdiTMO6JlQ6Fjlj6DRHfb2pLNK56fEF6s5tmN/cafwBMMFY4wM5967/R5QhRntUCKG
	rB1YgBaJ7G1yY8l3ppUAzw/Fd9M1Tx//QjLIA7UyScyIOZx3GfGf1zgeQUJBHHIMojGfVMQx88HdO
	ccXabOc+Vl783O/EEemoHlvAlxnrPvpgEOVMF8oFBQvWwWaM1NOUBNVmDABeCwcQByL6mo+DKQQGt
	PExUZppNwEdFMIeA+d8rVyhj83C2KRgiaW+ySUhcXA4kNd+aS6HY9FG9qcllmQv6WpXU+xhl1Q11s
	+8g5dgvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9EqD-0000000923B-2ScO;
	Fri, 08 Nov 2024 02:35:17 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9EoR-000000091rL-1JD8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 02:33:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1731033206;
	bh=Od4ZbTbr3sZbXAyDeOXmtGglhQppl3hPFpw6ndci1Y4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Xs5VoxTzsh+wgWcpPl81Hpsr2ta0KGRlNHZ6jJDMaqFKLUa9cTvb31WWRaKcSYlSL
	 IUvpxmAKmSe5/cgxdJNWUuY7gMcw4rSXDQYb2LzTFk+mP+LacgWYBK3COQZGi7gUmg
	 D14SO6OoHvTAjK/WsHCgMpICGdFP3s5qCXoavkTQ=
Received: by gentwo.org (Postfix, from userid 1003)
	id 7BBBA4027B; Thu,  7 Nov 2024 18:33:26 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 7A009400CA;
	Thu,  7 Nov 2024 18:33:26 -0800 (PST)
Date: Thu, 7 Nov 2024 18:33:26 -0800 (PST)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
cc: linux-pm@vger.kernel.org, kvm@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
    linux-arch@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, 
    tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
    dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
    pbonzini@redhat.com, vkuznets@redhat.com, rafael@kernel.org, 
    daniel.lezcano@linaro.org, peterz@infradead.org, arnd@arndb.de, 
    lenb@kernel.org, mark.rutland@arm.com, harisokn@amazon.com, 
    mtosatti@redhat.com, sudeep.holla@arm.com, maz@kernel.org, 
    misono.tomohiro@fujitsu.com, maobibo@loongson.cn, zhenglifeng1@huawei.com, 
    joao.m.martins@oracle.com, boris.ostrovsky@oracle.com, 
    konrad.wilk@oracle.com
Subject: Re: [PATCH v9 01/15] asm-generic: add barrier
 smp_cond_load_relaxed_timeout()
In-Reply-To: <20241107190818.522639-2-ankur.a.arora@oracle.com>
Message-ID: <9cecd8a5-82e5-69ef-502b-45219a45006b@gentwo.org>
References: <20241107190818.522639-1-ankur.a.arora@oracle.com> <20241107190818.522639-2-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_183327_415483_E36912C8 
X-CRM114-Status: GOOD (  12.28  )
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

On Thu, 7 Nov 2024, Ankur Arora wrote:

> +#ifndef smp_cond_time_check_count
> +/*
> + * Limit how often smp_cond_load_relaxed_timeout() evaluates time_expr_ns.
> + * This helps reduce the number of instructions executed while spin-waiting.
> + */
> +#define smp_cond_time_check_count	200
> +#endif

I dont like these loops that execute differently depending on the
hardware. Can we use cycles and ns instead to have defined periods of
time? Later patches establish the infrastructure to convert cycles to
nanoseconds and microseconds. Use that?

> +#ifndef smp_cond_load_relaxed_timeout
> +#define smp_cond_load_relaxed_timeout(ptr, cond_expr, time_expr_ns,	\
> +				      time_limit_ns) ({			\
> +	typeof(ptr) __PTR = (ptr);					\
> +	__unqual_scalar_typeof(*ptr) VAL;				\
> +	unsigned int __count = 0;					\
> +	for (;;) {							\
> +		VAL = READ_ONCE(*__PTR);				\
> +		if (cond_expr)						\
> +			break;						\
> +		cpu_relax();						\
> +		if (__count++ < smp_cond_time_check_count)		\
> +			continue;					\
> +		if ((time_expr_ns) >= time_limit_ns)			\
> +			break;						\

Calling the clock retrieval function repeatedly should be fine and is
typically done in user space as well as in kernel space for functions that
need to wait short time periods.


