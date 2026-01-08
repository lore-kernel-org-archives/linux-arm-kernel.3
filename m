Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94959D1D46B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 15:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=iDiLF5B0kyyxIKQ1zoCvucH1+zJL8APzy5+KK+rmh1g=; b=E7PUkZpJCpIUn7
	GOHH+cZ5uyI4IdiK4TzaYFLgaqGb1TNEMX3oyRkoMmFJ87uokdetYmH25rZ+5qwaalMF5TbM+INJF
	5yuvmctliV+4N17+UH3RaQj5ed3m3vd9XehpsLCgKFEv3igoyDFh5Ah6rYVWotaHs7tOtCZueeBBm
	azyP4GgXLMO672WK0zPp6dkz2EPiIXu2NEkA6mGpWlr10L1d61+m8rmTpkSIUpQ2g5Nn4+/ZRY8Tc
	Ln9W0RhxFgNPCBNeJEUHq7CtoT5uWIzKcEENvaMj5mZzhDBiXZXNJEm9GScrJuosvTQvZp3vC/Y1s
	x4zKuWyYtylwZDBw/dAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdraw-0000000HSag-2fmp;
	Thu, 08 Jan 2026 15:06:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrau-0000000HSZr-0Ywj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 15:06:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF41F40A83;
	Thu,  8 Jan 2026 15:06:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB885C116C6;
	Thu,  8 Jan 2026 15:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767884795;
	bh=WqUsThSkZqg0Rt4j5q8noYu3Yxf9rMBVzwxyxaQnKvk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=SeCastCNpTCVNsGm22/LzeiWcW52S/GziT9j+yVusIyyiCbcfcctRzstfParREtRk
	 Wpd/87nUY6nc+Hw+iyPTVn0bfX6MZyjnSDHVZlq/o+nzWGMbl+G0BUpfumttvOLPBu
	 fFC5GSNpCujtQMBjMF2VxUVCIqMMIvWpynLLPKX15hxCm39IjU9r4JfG4vqY4fkIMZ
	 fbmcSLIY/L2x1vegqDj34uKDovDydls8ym2y3XnwkiTv5gn6aPFkmMwzyCf293qi4t
	 /B7Y6zP4mSv380WHxHX7mPiUC5id1dpPWGoCgwUb06tEK8e89NKLgXfyAHivRnmaKl
	 G91EdxLpbvMMA==
Date: Thu, 8 Jan 2026 15:06:30 +0000
From: Will Deacon <will@kernel.org>
To: Carl Worth <carl@os.amperecomputing.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Taehyun Noh <taehyun@utexas.edu>, andreyknvl@gmail.com,
	pcc@google.com, yeoreum.yun@arm.com
Subject: Re: [PATCH 2/2] arm64: mte: Defer disabling of TCO until
 user_access_begin/end
Message-ID: <aV_H9h-nSM1HlWnR@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030-mte-tighten-tco-v1-2-88c92e7529d9@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_070636_210926_6CB06789 
X-CRM114-Status: GOOD (  33.69  )
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

On Thu, Oct 30, 2025 at 08:49:32PM -0700, Carl Worth wrote:
> The PSTATE.TCO (Tag Checking Override) register, when set causes MTE
> tag checking to be disabled. The TCO bit is automatically set by the
> hardware when an exception is taken.
> 
> Prior to this commit, mte_disable_tco_entry would clear TCO (enable
> tag checking) for either of two cases: 1. When the kernel wants tag
> checking (KASAN) or 2. when userspace wants tag checking (via
> SCTLR.TCF0).
> 
> In the case of userspace desired tag checking, (that is, when KASAN is
> off), clearing TCO on entry to the kernel has negative performance
> implications. This results in excess kernel space tag checking that
> has not been requested.
> 
> For this case, move the clearing of TCO to user_space_access_begin,
> and set it again in user_access_end. This restricts the tag checking
> to only the duration of the userspace accesses as desired.
> 
> This patch has been measured to eliminate over 97% of kernel-side tag
> checking during "perf bench futex hash"
> 
> Reported-by: Taehyun Noh <taehyun@utexas.edu>
> Signed-off-by: Carl Worth <carl@os.amperecomputing.com>
> ---
>  arch/arm64/include/asm/mte.h     | 21 +++++++++++++--------
>  arch/arm64/include/asm/uaccess.h | 32 +++++++++++++++++++++++++++++++-
>  2 files changed, 44 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
> index 70dabc884616..3608ba452da5 100644
> --- a/arch/arm64/include/asm/mte.h
> +++ b/arch/arm64/include/asm/mte.h
> @@ -258,15 +258,20 @@ static inline void set_kernel_mte_policy(struct task_struct *task)
>  		return;
>  
>  	/*
> -	 * Re-enable tag checking (TCO set on exception entry). This is only
> -	 * necessary if MTE is enabled in either the kernel or the userspace
> -	 * task. With MTE disabled in the kernel and disabled or asynchronous
> -	 * in userspace, tag check faults (including in uaccesses) are not
> -	 * reported, therefore there is no need to re-enable checking.
> -	 * This is beneficial on microarchitectures where re-enabling TCO is
> -	 * expensive.
> +	 * TCO is set on exception entry, (which overrides either of TCF
> +	 * or TCF0 and disables tag checking).
> +	 *
> +	 * If KASAN is enabled and using MTE/(aka "hw_tags") we clear
> +	 * TCO so that the kernel gets the tag-checking it needs for
> +	 * KASAN_HW_TAGS.
> +	 *
> +	 * When the kernel needs to enable tag-checking temporarily,
> +	 * (such as before accessing userspace memory in the case that
> +	 * userspace has requested tag checking), the kernel can
> +	 * temporarily change the state of TCO. See
> +	 * user_access_begin().
>  	 */
> -	if (kasan_hw_tags_enabled() || user_uses_tagcheck())
> +	if (kasan_hw_tags_enabled())
>  		asm volatile(SET_PSTATE_TCO(0));
>  }
>  
> diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
> index 1aa4ecb73429..248741a66c91 100644
> --- a/arch/arm64/include/asm/uaccess.h
> +++ b/arch/arm64/include/asm/uaccess.h
> @@ -417,11 +417,41 @@ static __must_check __always_inline bool user_access_begin(const void __user *pt
>  {
>  	if (unlikely(!access_ok(ptr,len)))
>  		return 0;
> +
> +	/*
> +	 * Enable tag checking for the user access if MTE is enabled
> +	 * in the userspace task.
> +	 *
> +	 * Note: We don't need to do anything if KASAN is enabled,
> +	 * since that means the tag checking override (TCO) will
> +	 * already be disabled. In turn, the TCF0 bits will control
> +	 * whether user-space tag checking happens .
> +	 */
> +	if (!kasan_hw_tags_enabled() && user_uses_tagcheck())
> +		asm volatile(SET_PSTATE_TCO(0));
> +
>  	uaccess_ttbr0_enable();
>  	return 1;
>  }

What about all the uaccess routines that don't call user_access_begin? For
example, copy_from_user().

Will

