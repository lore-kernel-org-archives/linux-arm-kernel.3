Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22038CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 16:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JFjJ3chQBlRIN0hsHqEkUSzdHiH7QHCP1Kf/P9mVSpE=; b=nAGmBkDwNfCvYjLc7lBrPxIhwY
	T2t4vSrFjE+d6hKckG8d2DUpMsOGd33hfjt4I4kNpifFFAzKqG4HSTI1U7Pu2Zw/wOn/2VgGNmLgR
	VB/5bZ7ygB++Lvf0BAZOQUKuqwg3VShZIEJy4BfSpnFptm41kpB9edlsd1YqrtIAuiMy1SzvTz8cX
	lfaRGodUpmlAMUqxv3ClPAKa0hJRxH4tdsE8E967Mizj7d9iiqICWVOZbQhjra4R/049JZvx4hihq
	qctrxr6mubBQygANAmydLPbETZaHhk0AvCisG9Q5ESbI73x8xq+RP0w4yWAqeLDbLBDjLkV8e+Sn9
	gDI7z+tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4M4n-0000000Aodm-0mYX;
	Thu, 02 Oct 2025 16:22:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4M4l-0000000AodZ-3AxZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 16:22:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 26EF463E98;
	Thu,  2 Oct 2025 16:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20C3C4CEF9;
	Thu,  2 Oct 2025 16:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759422158;
	bh=l9WPWBv5LEU7jTy0oYjT1qC7YlRew4lHrXzJr22cHlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c6oY0weUsmnibisRSgXf+q2hw0W0V/+mpe1HWu3Lbq15KgyY3PR2eha1UBxIQcoBS
	 2K2KOrgX+Kn+13PspoAoxLPV46aXl4GIo9j+b/clHq31pTVaSxEpGpkRSKlYIdQl2z
	 YlJrpja2qTqCyt/uXxVQSEA/+Zklt2ZVwOB4mupmAg26AJ0YoMdJ427jblWuo7NzVi
	 m4vIMrAloqvlq1r0hnKPaql61ecWjL6/WllGSYQOgOQp7RysIo1Tf0bZN7UPr6+QTu
	 8Xf/tUd68Se/UmRuF5ARv6Y2uVF3t9pTrKlvbSBQe48EiywtOERCq85s4Iel6d/qpw
	 UTCvuFSa/0ZSg==
Date: Thu, 2 Oct 2025 09:22:38 -0700
From: Kees Cook <kees@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au,
	linux@armlinux.org.uk, Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>, Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH v2 20/20] arm64/fpsimd: Allocate kernel mode FP/SIMD
 buffers on the stack
Message-ID: <202510020920.2FE08A4F90@keescook>
References: <20251001210201.838686-22-ardb+git@google.com>
 <20251001210201.838686-42-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001210201.838686-42-ardb+git@google.com>
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

On Wed, Oct 01, 2025 at 11:02:22PM +0200, Ard Biesheuvel wrote:
> [...]
> diff --git a/arch/arm64/include/asm/simd.h b/arch/arm64/include/asm/simd.h
> index d9f83c478736..7ddb25df5c98 100644
> --- a/arch/arm64/include/asm/simd.h
> +++ b/arch/arm64/include/asm/simd.h
> @@ -43,8 +43,11 @@ static __must_check inline bool may_use_simd(void) {
>  
>  #endif /* ! CONFIG_KERNEL_MODE_NEON */
>  
> -DEFINE_LOCK_GUARD_0(ksimd, kernel_neon_begin(), kernel_neon_end())
> +DEFINE_LOCK_GUARD_1(ksimd,
> +		    struct user_fpsimd_state,
> +		    kernel_neon_begin(_T->lock),
> +		    kernel_neon_end(_T->lock))
>  
> -#define scoped_ksimd()	scoped_guard(ksimd)
> +#define scoped_ksimd()	scoped_guard(ksimd, &(struct user_fpsimd_state){})

I love it!

> [...]
> -void kernel_neon_end(void)
> +void kernel_neon_end(struct user_fpsimd_state *s)
>  {
>  	if (!system_supports_fpsimd())
>  		return;
> @@ -1899,8 +1910,9 @@ void kernel_neon_end(void)
>  	if (!IS_ENABLED(CONFIG_PREEMPT_RT) && in_serving_softirq() &&
>  	    test_thread_flag(TIF_KERNEL_FPSTATE))
>  		fpsimd_load_kernel_state(current);
> -	else
> -		clear_thread_flag(TIF_KERNEL_FPSTATE);
> +	else if (test_and_clear_thread_flag(TIF_KERNEL_FPSTATE))
> +		if (cmpxchg(&current->thread.kernel_fpsimd_state, s, NULL) != s)
> +			BUG();

I always question BUG() uses -- is there a recoverable way to deal with
a mismatch here? I assume not and that this is the best we can do, but I
thought I'd just explicitly ask. :)

-Kees

-- 
Kees Cook

