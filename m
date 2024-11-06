Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73556D44D55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 11:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=58kGrfeVq2CuCcd99sNgGdxG4moqweOY1MYVaFoTru8=; b=XEoIQH+vkK7kuTK8CL7YS+HQRC
	a7FglJJNRyUVRtjRF9fxXPK30xq5T8ZJ84ZE1+4yORO0uDzJOrgB9LriypLeN6vZJwr+OZrS993Wo
	Yy7Pw379tnXqx/q8g0AVdGwPiUCtMQQVOGaAsbgVnBMoEq3SF60XpoqXFPADpM3Qspyk5qCGe7kVK
	ApkiqpgbwnBpYmMeXThDnWils0Ib7TT2gn+/ipFs0UCtXDRENrOKbVhrpHcPtTMgueQOckGa0u5oE
	dLSvulQFpU5eUNPPaarq8+IDq5/R5c258C6CZeH7IFdfQrLMpuBH4DtObBOLvp/k5wdZ0ka3Tv0V3
	ZzXz2aFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8eff-000000033Xf-2Mou;
	Wed, 06 Nov 2024 11:57:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8dtf-00000002sNM-3wlq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 11:08:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7859A5C585B;
	Wed,  6 Nov 2024 11:07:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 147B3C4CECD;
	Wed,  6 Nov 2024 11:08:17 +0000 (UTC)
Date: Wed, 6 Nov 2024 11:08:15 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Haris Okanovic <harisokn@amazon.com>
Cc: ankur.a.arora@oracle.com, linux-pm@vger.kernel.org, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	pbonzini@redhat.com, wanpengli@tencent.com, vkuznets@redhat.com,
	rafael@kernel.org, daniel.lezcano@linaro.org, peterz@infradead.org,
	arnd@arndb.de, lenb@kernel.org, mark.rutland@arm.com,
	mtosatti@redhat.com, sudeep.holla@arm.com, cl@gentwo.org,
	misono.tomohiro@fujitsu.com, maobibo@loongson.cn,
	joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: Re: [PATCH 1/5] asm-generic: add smp_vcond_load_relaxed()
Message-ID: <ZytOH2oigoC-qVLK@arm.com>
References: <20240925232425.2763385-1-ankur.a.arora@oracle.com>
 <20241105183041.1531976-1-harisokn@amazon.com>
 <20241105183041.1531976-2-harisokn@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105183041.1531976-2-harisokn@amazon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_030824_130878_578E2D83 
X-CRM114-Status: GOOD (  17.65  )
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

On Tue, Nov 05, 2024 at 12:30:37PM -0600, Haris Okanovic wrote:
> diff --git a/include/asm-generic/barrier.h b/include/asm-generic/barrier.h
> index d4f581c1e21d..112027eabbfc 100644
> --- a/include/asm-generic/barrier.h
> +++ b/include/asm-generic/barrier.h
> @@ -256,6 +256,31 @@ do {									\
>  })
>  #endif
>  
> +/**
> + * smp_vcond_load_relaxed() - (Spin) wait until an expected value at address
> + * with no ordering guarantees. Spins until `(*addr & mask) == val` or
> + * `nsecs` elapse, and returns the last observed `*addr` value.
> + *
> + * @nsecs: timeout in nanoseconds

FWIW, I don't mind the relative timeout, it makes the API easier to use.
Yes, it may take longer in absolute time if the thread is scheduled out
before local_clock_noinstr() is read but the same can happen in the
caller anyway. It's similar to udelay(), it can take longer if the
thread is scheduled out.

> + * @addr: pointer to an integer
> + * @mask: a bit mask applied to read values
> + * @val: Expected value with mask
> + */
> +#ifndef smp_vcond_load_relaxed
> +#define smp_vcond_load_relaxed(nsecs, addr, mask, val) ({	\
> +	const u64 __start = local_clock_noinstr();		\
> +	u64 __nsecs = (nsecs);					\
> +	typeof(addr) __addr = (addr);				\
> +	typeof(*__addr) __mask = (mask);			\
> +	typeof(*__addr) __val = (val);				\
> +	typeof(*__addr) __cur;					\
> +	smp_cond_load_relaxed(__addr, (				\
> +		(VAL & __mask) == __val ||			\
> +		local_clock_noinstr() - __start > __nsecs	\
> +	));							\
> +})

The generic implementation has the same problem as Ankur's current
series. smp_cond_load_relaxed() can't wait on anything other than the
variable at __addr. If it goes into a WFE, there's nothing executed to
read the timer and check for progress. Any generic implementation of
such function would have to use cpu_relax() and polling.

-- 
Catalin

