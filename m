Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF50AC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 04:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CtxMSCKPf+Wkvxjg59JNH0r+l1IpWdwQef0QPwiYwRU=; b=wpi9Ep8sZg3W7u
	q+8qJ+dO2kZCr/Ki7nWTEbiCHO4ppDosrCvWVMcDSw5BanEN/vGguP9K+gKXaB5gwHRxvAkJAqGNd
	g2+fdApmn3Ub8R0LXT5eOnBoQ/wM5TKugw5YkfhFEQHYw2YtpDBb2cdHufB1xW5AB+IzlcUMh9Cn3
	SFnL3zulKQrCdMMN/oHIal5JgWBLPJAF37ej5Ub5AbqHtzschgH3gljb6VwxSP9WGqYxZHIW1THFc
	K7Wp8hdI2JFS5FsLPmfPLVat68fVhwCfF5dsyuTWcOdQB4GPhehEJth770nO0Oc62ubLbmngRgvK3
	V+suKFBvcOAOIep5h3OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wovWD-00000006o4A-30b2;
	Wed, 29 Jul 2026 04:03:45 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wovWA-00000006o2s-2y5s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 04:03:44 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=CtxMSCKPf+Wkvxjg59JNH0r+l1IpWdwQef0QPwiYwRU=;
	b=QQTQUSXE5bcIbql9XtaH44Hmjk3s80+QgXa320Nob/iTVDkDG11zqneVzQwJGYOzuJAqUNBsP
	xdRk/blw8GIIHr09qT21JJez413QyXERYatIQ9b1d6UwKqOjTLZNfj+wlnSPhyzz1cG3vu59ZFn
	7DteTHYyavVXxmKXj3VJ75o=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4h8z3f3066zpSvQ;
	Wed, 29 Jul 2026 11:54:22 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 57D2D40538;
	Wed, 29 Jul 2026 12:03:39 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 29 Jul 2026 12:03:38 +0800
Message-ID: <e2486a36-c582-4dd5-9f9b-dc5dad030e0e@huawei.com>
Date: Wed, 29 Jul 2026 12:03:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 04/13] arm64: percpu: Factor out percpu offset asm
To: Mark Rutland <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260728123859.2911495-1-mark.rutland@arm.com>
 <20260728123859.2911495-5-mark.rutland@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260728123859.2911495-5-mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_210343_137615_AB110999 
X-CRM114-Status: GOOD (  15.96  )
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
Cc: vladimir.murzin@arm.com, peterz@infradead.org, maz@kernel.org, hca@linux.ibm.com, linux-kernel@vger.kernel.org, yang@os.amperecomputing.com, catalin.marinas@arm.com, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



在 2026/7/28 20:38, Mark Rutland 写道:
> Depending on whether the kernel runs at EL1 or EL2, the percpu offset is
> stored in either TPIDR_EL1 or TPIDR_EL2, and __kern_my_cpu_offset() uses
> an ALTERNATIVE() sequence to read the relevant TPIDR_ELx.
> 
> In subsequent patches we'll need to read the percpu offset in other
> assembly sequences. Factor the ALTERNATIVE sequence out of
> __kern_my_cpu_offset() into a new __KERN_ASM_CPU_OFFSET() macro so that
> we can share the code sequence.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> 
> There should be no functional change as a result of this patch.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Vladimir Murzin <vladimir.murzin@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Yang Shi <yang@os.amperecomputing.com>
> ---
>  arch/arm64/include/asm/percpu.h | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
> index b57b2bb009677..98823c97d534c 100644
> --- a/arch/arm64/include/asm/percpu.h
> +++ b/arch/arm64/include/asm/percpu.h
> @@ -29,6 +29,11 @@ static inline unsigned long __hyp_my_cpu_offset(void)
>  	return read_sysreg(tpidr_el2);
>  }
>  
> +#define __KERN_ASM_CPU_OFFSET(dst)					\
> +	ALTERNATIVE("mrs " dst ", tpidr_el1",				\
> +		    "mrs " dst ", tpidr_el2",				\
> +		       ARM64_HAS_VIRT_HOST_EXTN)
> +
>  static inline unsigned long __kern_my_cpu_offset(void)
>  {
>  	unsigned long off;
> @@ -37,11 +42,11 @@ static inline unsigned long __kern_my_cpu_offset(void)
>  	 * We want to allow caching the value, so avoid using volatile and
>  	 * instead use a fake stack read to hazard against barrier().
>  	 */
> -	asm(ALTERNATIVE("mrs %0, tpidr_el1",
> -			"mrs %0, tpidr_el2",
> -			ARM64_HAS_VIRT_HOST_EXTN)
> -		: "=r" (off) :
> -		"Q" (*(const unsigned long *)current_stack_pointer));
> +	asm(
> +	__KERN_ASM_CPU_OFFSET("%0")
> +	: "=r" (off)
> +	: "Q" (*(const unsigned long *)current_stack_pointer)
> +	);
>  
>  	return off;
>  }


