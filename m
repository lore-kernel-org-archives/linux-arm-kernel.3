Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F845E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 13:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UkoRw9BarGGVCa4YcmvxLTgpRYyO516ABNKabA4DQpo=; b=M9EDlooqvd3GfhVgy/wG3l9Dxx
	9rrXWDVa7rBCPsZa/ew2Vl8JzsE4Jwpb+p9Nppi89j4WtRRj7Pf7tLDhUrjmMjqBxVjpEvCDPBWTi
	CEPB0nHMlwL+VmZBI6OMlnVDlStgsDjGHQ8ldGW8x36hBy7xjv11KX7ffC7IFywUGCQznx0GRqQ67
	rh0E3xuS2OcXw86ohuagyd1Vb78rhbdPrZPjQbdfMweITYWgT9bYUoYulJ209G0oy2j497NXWj8Zb
	jHhKHXemXKwwF5ZU25u0vnMdh9Rt/Ve6hWxJvJA6UB+ub08Rm8g3nDlJf92ZFb4cFOnPCGiB44LZd
	i4BlE8Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0em-0000000BdGy-2pOk;
	Tue, 10 Dec 2024 13:52:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0di-0000000Bd44-31SI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 13:51:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 57DB95C631C;
	Tue, 10 Dec 2024 13:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C58C4CED6;
	Tue, 10 Dec 2024 13:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733838661;
	bh=ZXg1bGozVdzn4a1tzlvDLtBv4mWbQKIU/XP6jeBIDvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yf/VLn2IQhrXOEzbHiLZVrJssWuYF5wdEhW0xeWpZnpKA5ogq7bmRblmgPOoIPExb
	 qDmFeAJsOhFmvg0N8uuL+IpFFeLdmUXKNtt3zQNIy5mHNEEXSYHX4BbLa6cxzh7SVM
	 3Fj7X0jnC1pipSs1zsUOkP7Jd5r0jLEEEWudF1d+cH7SQwKvghPYc+4HEjGYEcxLC7
	 TQ2GNtjGAnkN9RNJSFrEprr6Ri7FngS8zf38cVNimyVvSfa/GuCJZ2YleDRGEFoiGQ
	 JUs7rG7AUMKGfPAIDS7ylefYJM5qU+wqsAWuURPi0BwNpx3MyzbEGtmMlYMWeSZ0e0
	 nuu81ImImT/ng==
Date: Tue, 10 Dec 2024 13:50:52 +0000
From: Will Deacon <will@kernel.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-pm@vger.kernel.org, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, catalin.marinas@arm.com,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	pbonzini@redhat.com, vkuznets@redhat.com, rafael@kernel.org,
	daniel.lezcano@linaro.org, peterz@infradead.org, arnd@arndb.de,
	lenb@kernel.org, mark.rutland@arm.com, harisokn@amazon.com,
	mtosatti@redhat.com, sudeep.holla@arm.com, cl@gentwo.org,
	maz@kernel.org, misono.tomohiro@fujitsu.com, maobibo@loongson.cn,
	zhenglifeng1@huawei.com, joao.m.martins@oracle.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v9 05/15] arm64: barrier: add support for
 smp_cond_relaxed_timeout()
Message-ID: <20241210135052.GB15607@willie-the-truck>
References: <20241107190818.522639-1-ankur.a.arora@oracle.com>
 <20241107190818.522639-6-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107190818.522639-6-ankur.a.arora@oracle.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_055102_790753_7FE3BE6A 
X-CRM114-Status: GOOD (  18.69  )
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

On Thu, Nov 07, 2024 at 11:08:08AM -0800, Ankur Arora wrote:
> Support a waited variant of polling on a conditional variable
> via smp_cond_relaxed_timeout().
> 
> This uses the __cmpwait_relaxed() primitive to do the actual
> waiting, when the wait can be guaranteed to not block forever
> (in case there are no stores to the waited for cacheline.)
> For this we depend on the availability of the event-stream.
> 
> For cases when the event-stream is unavailable, we fallback to
> a spin-waited implementation which is identical to the generic
> variant.
> 
> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> ---
>  arch/arm64/include/asm/barrier.h | 54 ++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/barrier.h b/arch/arm64/include/asm/barrier.h
> index 1ca947d5c939..ab2515ecd6ca 100644
> --- a/arch/arm64/include/asm/barrier.h
> +++ b/arch/arm64/include/asm/barrier.h
> @@ -216,6 +216,60 @@ do {									\
>  	(typeof(*ptr))VAL;						\
>  })
>  
> +#define __smp_cond_load_timeout_spin(ptr, cond_expr,			\
> +				     time_expr_ns, time_limit_ns)	\
> +({									\
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
> +		__count = 0;						\
> +	}								\
> +	(typeof(*ptr))VAL;						\
> +})

This is a carbon-copy of the asm-generic timeout implementation. Please
can you avoid duplicating that in the arch code?

Will

