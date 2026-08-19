Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18BAC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 15:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdLaB6VEAeC+U/8YeI7SVEdgcOKfzqRZtUUW9GMZSi8=; b=i6UskspbgIHIWE6GZqAz5yiGr7
	zbxuz0w71CRmTvHlA3gVciP6/dcgO6BNmr6CNRsdUUEwWlYbbKF26gfqDubAv/YpkideGT+xq0J+0
	+3wAlVOdqf1aAJlNUkfha/zsVeckwKpzbOSxrrgw565b+mqu0/IN4mpxVUrg6GvmjwgmlUF2PdXns
	RxXJpbd00oYrqhK9Kjb80HZzHAkjI76S5hT13FpW2XZegWrmca5gJtMvMSqS5p+UO8BDRC38EnL8K
	+yHvRgC+tsrNviWPZWjv5WnAuTpJxMPSYB2r8hGdObMm/Btah6SlXfVElV7A0ECos00Chhsuj+OxN
	pnsNzNLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwiA2-0000000A58z-0N8P;
	Wed, 19 Aug 2026 15:25:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwi9y-0000000A57c-1SEK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 15:25:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46F4714BF;
	Wed, 19 Aug 2026 08:24:50 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 62BED3F763;
	Wed, 19 Aug 2026 08:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787153094; bh=WT7rwFcaxAiBqLgKPjGOrHU1jVlw5l32YWnE4swf+EY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=acRDmdzODvRXR7RhcrI3yQM2Dh53KjP/ez6oXvTp3qOi367H74eiDBPypXUzm5zZU
	 Dnr5CK2f+0CfCRLAQDq9JeeDxilQVsKhfhlhsqauczKC/RVhTrC9YQDDYUmo2Lound
	 GNcaJfKKaXGZrY2JwDnAm7xUp+zKRy9+eUThUZ30=
Date: Wed, 19 Aug 2026 16:24:51 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org, yeoreum.yun@arm.com
Subject: Re: [PATCH] arm64: process: Fix context switching MTE store-only tag
 check
Message-ID: <aoXKwwpJGO44cWVD@e129823.arm.com>
References: <20260819144859.5447-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819144859.5447-1-vladimir.murzin@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_082458_428722_E90B380B 
X-CRM114-Status: GOOD (  15.88  )
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


> SCTLR_EL1.TCSO0 is set when user opt-in for MTE store-only tag check
> mode. However, it is not part of SCTLR_USER_MASK which imply that on
> context switch we never clear SCTLR_EL1.TCSO0, so we are leaking that
> setting into another task.
> Fix that by including SCTLR_EL1_TCSO0_MASK into SCTLR_USER_MASK
> 
> Fixes: 4d51ff5bba00 ("arm64/kernel: Support store-only mte tag check")
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/include/asm/processor.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
> index c2a627f39314..6dfbcacd9ba0 100644
> --- a/arch/arm64/include/asm/processor.h
> +++ b/arch/arm64/include/asm/processor.h
> @@ -264,7 +264,7 @@ static inline void task_set_sve_vl_onexec(struct task_struct *task,
>  
>  #define SCTLR_USER_MASK                                                        \
>  	(SCTLR_ELx_ENIA | SCTLR_ELx_ENIB | SCTLR_ELx_ENDA | SCTLR_ELx_ENDB |   \
> -	 SCTLR_EL1_TCF0_MASK)
> +	 SCTLR_EL1_TCF0_MASK | SCTLR_EL1_TCSO0_MASK)
>  
>  static inline void arch_thread_struct_whitelist(unsigned long *offset,
>  						unsigned long *size)
> -- 
> 2.34.1

Oops, Sorry for this.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
-- 
Sincerely,
Yeoreum Yun

