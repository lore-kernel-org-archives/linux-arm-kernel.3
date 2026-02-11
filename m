Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55315ECD6CA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 17:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GlKIrt//5Y1IFz3539+UocwejT8QeUmL32NrPRGJBAM=; b=A0syRVlg39p//yUYwTywqKpI97
	fUYzziNidrdVfwLNJMyv3AftmJQIJMQ0siKE/UK8cOo8Vzjmwb2/kIWdb1lLBFNAHCJdAFZNksLRD
	aJ+SdfEKyOVS1OrW/8NQBsi1VcQwA8ZekVfpEv8iFa64EhPeShZ3eLbohh4NbyEzKn8bGGs530HK7
	6NrornsaFkf0xk+lOc1xvni+Coj0CqP8rkus/BFMxuXkOc3gKA00MvIC5W7JiSKd6UKS20Nj44W6V
	Xtl/6f9kS6UJEPpW71Prd2eyBIcjdq0juySpCDBWZVp+gDqKnpRwlg3/Io/CsfHzJOUAwIHSn/1mc
	JbpRdAdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqDkV-00000000sZc-0p7E;
	Wed, 11 Feb 2026 17:11:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqDkR-00000000sXx-3nJL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 17:11:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D305E339;
	Wed, 11 Feb 2026 09:11:23 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E37E3F63F;
	Wed, 11 Feb 2026 09:11:26 -0800 (PST)
Date: Wed, 11 Feb 2026 17:11:23 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	bpf@vger.kernel.org, arnd@arndb.de, will@kernel.org,
	peterz@infradead.org, akpm@linux-foundation.org,
	mark.rutland@arm.com, harisokn@amazon.com, cl@gentwo.org,
	ast@kernel.org, rafael@kernel.org, daniel.lezcano@linaro.org,
	memxor@gmail.com, zhenglifeng1@huawei.com,
	xueshuai@linux.alibaba.com, joao.m.martins@oracle.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v9 04/12] arm64: support WFET in
 smp_cond_load_relaxed_timeout()
Message-ID: <aYy4O66B6T63tRaa@arm.com>
References: <20260209023153.2661784-1-ankur.a.arora@oracle.com>
 <20260209023153.2661784-5-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209023153.2661784-5-ankur.a.arora@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_091132_101667_FE215597 
X-CRM114-Status: GOOD (  10.82  )
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

On Sun, Feb 08, 2026 at 06:31:45PM -0800, Ankur Arora wrote:
> diff --git a/arch/arm64/include/asm/cmpxchg.h b/arch/arm64/include/asm/cmpxchg.h
> index d7a540736741..dfb7d10a18be 100644
> --- a/arch/arm64/include/asm/cmpxchg.h
> +++ b/arch/arm64/include/asm/cmpxchg.h
> @@ -12,6 +12,7 @@
>  
>  #include <asm/barrier.h>
>  #include <asm/lse.h>
> +#include <asm/delay-const.h>
>  
>  /*
>   * We need separate acquire parameters for ll/sc and lse, since the full
> @@ -208,9 +209,13 @@ __CMPXCHG_GEN(_mb)
>  	__cmpxchg128((ptr), (o), (n));						\
>  })
>  
> +/* Re-declared here to avoid include dependency. */
> +extern u64 (*arch_timer_read_counter)(void);

We have a bug in udelay() because the above might read the physical
counter while WFET uses the virtual one. See this thread:

https://lore.kernel.org/all/ktosachvft2cgqd5qkukn275ugmhy6xrhxur4zqpdxlfr3qh5h@o3zrfnsq63od/

We could use __arch_counter_get_cntvct_stable() as in Marc's suggestion
for the udelay() fix (or just wait to see the outcome of the above
thread).

The rest looks fine.

-- 
Catalin

