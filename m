Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC39CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6THNwrpoBfouLzYXf4ByDtFHFToTMlZqLQcLkTvGv/c=; b=N4pk1RHJhLKmAp+Io0DOrAjn8X
	lIsxlo/TmVl8CpdSl2GjWwYMc02Ps+xoU2hMpEnQaBTqQHX0iNNsOeZastPKyKnF2DM8qWlsppL2h
	g2JwG1TsUClJdY8h7HHiCZzaMIwkXgLjQ8+JRas66ZQRFc1nzVXe4reE1us/jG+g6ie2Ct0jBsQp3
	14eFFiUfyYJ0/qnc+3/2wHgHQXPRMxVa13Yb3w27SAkD1IJY90lVnY19DcIHLXpZPKTM3T/dPygP3
	metdRa+Q7RAEndcu/t9XBlq813x/yO3CRyVYOmsYwru5RxFgnKyViYcyx5rEiJNIRVNFiPkhLPM3Q
	GDf6/rfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDgq-0000000EDl7-0zKF;
	Mon, 01 Sep 2025 23:11:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6Ds-0000000D1Uz-47zF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 15:13:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 26719175A;
	Mon,  1 Sep 2025 08:13:24 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 847B83F6A8;
	Mon,  1 Sep 2025 08:13:28 -0700 (PDT)
Date: Mon, 1 Sep 2025 16:13:25 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, broonie@kernel.org,
	oliver.upton@linux.dev, anshuman.khandual@arm.com, robh@kernel.org,
	james.morse@arm.com, mark.rutland@arm.com, joey.gouly@arm.com,
	ahmed.genidi@arm.com, kevin.brodsky@arm.com,
	scott@os.amperecomputing.com, mbenes@suse.cz,
	james.clark@linaro.org, frederic@kernel.org, rafael@kernel.org,
	pavel@kernel.org, ryan.roberts@arm.com, suzuki.poulose@arm.com,
	maz@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v4 4/5] arm64: initialise SCTLR2_EL1 at cpu_soft_restart()
Message-ID: <aLW4FTcqommWSIej@e133380.arm.com>
References: <20250821172408.2101870-1-yeoreum.yun@arm.com>
 <20250821172408.2101870-5-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821172408.2101870-5-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_081333_060962_EDC07C74 
X-CRM114-Status: GOOD (  16.98  )
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

Hi,

On Thu, Aug 21, 2025 at 06:24:07PM +0100, Yeoreum Yun wrote:
> Explicitly initialize the SCTLR2_ELx register before launching
> a new kernel via kexec() to avoid leaving SCTLR2_ELx with an
> arbitrary value when the new kernel runs.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  arch/arm64/kernel/cpu-reset.S      | 4 ++++
>  arch/arm64/kvm/hyp/nvhe/hyp-init.S | 3 +++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/kernel/cpu-reset.S b/arch/arm64/kernel/cpu-reset.S
> index c87445dde674..c8888891dc8d 100644
> --- a/arch/arm64/kernel/cpu-reset.S
> +++ b/arch/arm64/kernel/cpu-reset.S
> @@ -37,6 +37,10 @@ SYM_TYPED_FUNC_START(cpu_soft_restart)
>  	 * regime if HCR_EL2.E2H == 1
>  	 */
>  	msr	sctlr_el1, x12
> +
> +	mov_q	x12, INIT_SCTLR2_EL1
> +	set_sctlr2_elx	1, x12, x8
> +

Nit: does it matter whether we reset SCTLR2 before SCTLR?

I can't find a convincing architectural reason why they need to be
reset in a particular order, but it looks a bit strange that the
cpu_soft_restart and __kvm_handle_stub_hvc versions of this reset the
registers in the opposite order...

>  	isb
>  
>  	cbz	x0, 1f				// el2_switch?
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-init.S b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
> index aada42522e7b..cc569656fe35 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-init.S
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
> @@ -255,6 +255,9 @@ SYM_CODE_START(__kvm_handle_stub_hvc)
>  	mov	x0, xzr
>  reset:
>  	/* Reset kvm back to the hyp stub. */
> +	mov_q 	x5, INIT_SCTLR2_EL2
> +	set_sctlr2_elx	2, x5, x4
> +
>  	mov_q	x5, INIT_SCTLR_EL2_MMU_OFF
>  	pre_disable_mmu_workaround
>  	msr	sctlr_el2, x5

Otherwise, I guess this is fine.

Cheers
---Dave

