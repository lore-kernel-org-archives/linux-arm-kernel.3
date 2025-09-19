Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4978DCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 11:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/rUH7jDim/iDoq9ZyeDizoMEUiPmn7/ATNJ2S1xOgM=; b=cZ0q19TKY7WTeMl6zquGgTfSmU
	MI8l0IdrAyf+7jadFtysrtofSFA5wRuRPH1PNUhiZCwRztx2634rOpQjk2IZ0TzdQAusoVWlD/A45
	dDCppAu8Ora1+7dwus7rbZ6STGaDNIGp8Un10+HC6jIPuOo8XyGj1mzLWf6oripeZAOfmLZzybQeb
	Qp4o5q1MKHGdiFBauNdp8ecWLRQ/+T69Jy9gOeKmEiZ5tFhhDxCpHXfRb4gMsJrtYZgK/vdE3OK89
	KSKRz2HlAyGTOgYOQJVNddh4BVIa05r361x/xkfBsYeYxgeezAoCDn4II+35hKjaZ7Ysoq+8Ul99C
	MDyHPMEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZMi-00000002i7L-1woC;
	Fri, 19 Sep 2025 11:33:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZMg-00000002i79-3Z2f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 11:33:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF0E260053;
	Fri, 19 Sep 2025 11:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF28C4CEF0;
	Fri, 19 Sep 2025 11:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758281601;
	bh=60tCwws14AuRTFjXSEyQh2FegsOGpWR0H6cOtV+AU1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V5NAluUHjHtCOMCXJ4XwrXs4pzxwgex/sH+MaMTdYp/oCzjboGHROfXR3FRjc8ndF
	 s96itkkalOZXQEcUq7lUR+jO6oFiqROlEWpduBktsh9dTUd4s8cpn3jhJcXL1Br77Z
	 vFlYVtXPD/0sEnom513qD3tQ6gD7Z0p/xbX6OP/pjnVHsxQ+Y0e+rL18zP32spqHua
	 FmUpsY8KM9uAFpayuLzH1dxO7K8CGMBAycEqaO5+ot5XRMvnrFcv4tAN5wydjYhks/
	 COFZVxCOeSNJqiSxFs5tgFlkwVrhaOsd5z523Volgjc0h253cGVeK8fJ+WRVqPcIFv
	 hGCCnyx5DrkIg==
Date: Fri, 19 Sep 2025 12:33:16 +0100
From: Will Deacon <will@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 4/8] arm64/fpsimd: Permit kernel mode NEON with IRQs
 off
Message-ID: <aM0_fHqDtDyhZ8L-@willie-the-truck>
References: <20250918103010.2973462-10-ardb+git@google.com>
 <20250918103010.2973462-14-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918103010.2973462-14-ardb+git@google.com>
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

On Thu, Sep 18, 2025 at 12:30:15PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Currently, may_use_simd() will return false when called from a context
> where IRQs are disabled. One notable case where this happens is when
> calling the ResetSystem() EFI runtime service from the reboot/poweroff
> code path. For this case alone, there is a substantial amount of FP/SIMD
> support code to handle the corner case where a EFI runtime service is
> invoked with IRQs disabled.
> 
> The only reason kernel mode SIMD is not allowed when IRQs are disabled
> is that re-enabling softirqs in this case produces a noisy diagnostic
> when lockdep is enabled. The warning is valid, in the sense that
> delivering pending softirqs over the back of the call to
> local_bh_enable() is problematic when IRQs are disabled.
> 
> While the API lacks a facility to simply mask and unmask softirqs
> without triggering their delivery, disabling softirqs is not needed to
> begin with when IRQs are disabled, given that softirqs are only every
> taken asynchronously over the back of a hard IRQ.
> 
> So dis/enable softirq processing conditionally, based on whether IRQs
> are enabled, and relax the check in may_use_simd().
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/include/asm/simd.h |  2 +-
>  arch/arm64/kernel/fpsimd.c    | 16 ++++++++++------
>  2 files changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/simd.h b/arch/arm64/include/asm/simd.h
> index 8e86c9e70e48..abd642c92f86 100644
> --- a/arch/arm64/include/asm/simd.h
> +++ b/arch/arm64/include/asm/simd.h
> @@ -29,7 +29,7 @@ static __must_check inline bool may_use_simd(void)
>  	 */
>  	return !WARN_ON(!system_capabilities_finalized()) &&
>  	       system_supports_fpsimd() &&
> -	       !in_hardirq() && !irqs_disabled() && !in_nmi();
> +	       !in_hardirq() && !in_nmi();
>  }
>  
>  #else /* ! CONFIG_KERNEL_MODE_NEON */
> diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
> index c37f02d7194e..96a226316d1f 100644
> --- a/arch/arm64/kernel/fpsimd.c
> +++ b/arch/arm64/kernel/fpsimd.c
> @@ -225,10 +225,12 @@ static void fpsimd_bind_task_to_cpu(void);
>   */
>  static void get_cpu_fpsimd_context(void)
>  {
> -	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
> -		local_bh_disable();
> -	else
> +	if (!IS_ENABLED(CONFIG_PREEMPT_RT)) {
> +		if (!irqs_disabled())
> +			local_bh_disable();
> +	} else {
>  		preempt_disable();
> +	}
>  }
>  
>  /*
> @@ -240,10 +242,12 @@ static void get_cpu_fpsimd_context(void)
>   */
>  static void put_cpu_fpsimd_context(void)
>  {
> -	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
> -		local_bh_enable();
> -	else
> +	if (!IS_ENABLED(CONFIG_PREEMPT_RT)) {
> +		if (!irqs_disabled())
> +			local_bh_enable();

This is a little ugly, so I think a small comment summarising the
penultimate paragraph of your commit message would help to explain the dance
you're doing.

With that:

Acked-by: Will Deacon <will@kernel.org>

Will

