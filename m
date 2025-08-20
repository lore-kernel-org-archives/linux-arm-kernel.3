Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8B0CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 18:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVu6+r9ritv5Rj3Y5Yea2dPr2F0oa8WRm8M6/dY902M=; b=t3Sr7+2imgk9+TRpQRkv/qkUEt
	a1h60wDwq3DlHY6AS/JP/ud+aUZ4Z9n0r1vqnCO/pxAmP7kHfJI9NxHdG0qASx4tQ0+vIXWY3kDAj
	MAU954xgZpSxpWS4Iyiq57MgYcsZcJ+Tnej2+aii/ilMqHWF5aBq9tSGeq79QRjK0TFo0+HF/fDsI
	eeLDiAuvT9takSiASycI25NY0hH2KWm/s/FunsijpZScB0hFdYHzJ9Si1Xu6PeX8bpzBZNh0qKzgS
	aSKJvKWywyW8fdoRKOgs3QoAw0aCdUHvJD1xyFsCIaIjNsVz1MZIhQVrzdbsaxPPaudzXdj/H1F3q
	AGvyqS1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoniQ-0000000EhZk-0Jrj;
	Wed, 20 Aug 2025 18:39:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokTN-0000000EChc-0QkK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 15:11:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63D991D31;
	Wed, 20 Aug 2025 08:11:24 -0700 (PDT)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.68])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9CFA3F738;
	Wed, 20 Aug 2025 08:11:28 -0700 (PDT)
Date: Wed, 20 Aug 2025 16:11:25 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, broonie@kernel.org,
	oliver.upton@linux.dev, anshuman.khandual@arm.com, robh@kernel.org,
	james.morse@arm.com, mark.rutland@arm.com, joey.gouly@arm.com,
	ahmed.genidi@arm.com, kevin.brodsky@arm.com,
	scott@os.amperecomputing.com, mbenes@suse.cz,
	james.clark@linaro.org, frederic@kernel.org, rafael@kernel.org,
	pavel@kernel.org, ryan.roberts@arm.com, suzuki.poulose@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v3 4/5] arm64: initialise SCTLR2_EL1 at cpu_soft_restart()
Message-ID: <aKXlnZ8HXHBZMj4T@e133380.arm.com>
References: <20250813120118.3953541-1-yeoreum.yun@arm.com>
 <20250813120118.3953541-5-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813120118.3953541-5-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_081133_182770_EFD55D8F 
X-CRM114-Status: GOOD (  18.54  )
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

On Wed, Aug 13, 2025 at 01:01:17PM +0100, Yeoreum Yun wrote:
> SCTLR2_EL1 register is optional starting from ARMv8.8/ARMv9.3,
> and becomes mandatory from ARMv8.9/ARMv9.4
> and serveral architectural feature are controled by bits in
> these registers.
> 
> Before, launching new kernel via kexec, initialise SCTLR2_EL1 explicitly.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  arch/arm64/kernel/cpu-reset.S | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/kernel/cpu-reset.S b/arch/arm64/kernel/cpu-reset.S
> index c87445dde674..123564af345b 100644
> --- a/arch/arm64/kernel/cpu-reset.S
> +++ b/arch/arm64/kernel/cpu-reset.S
> @@ -37,6 +37,12 @@ SYM_TYPED_FUNC_START(cpu_soft_restart)
>  	 * regime if HCR_EL2.E2H == 1
>  	 */
>  	msr	sctlr_el1, x12
> +
> +alternative_if ARM64_HAS_SCTLR2
> +	mov_q	x12, INIT_SCTLR2_EL1
> +	msr_s	SYS_SCTLR2_EL1, x12
> +alternative_else_nop_endif
> +

It would be better to do this based on the ID regs.

Although the previous kernel _shouldn't_ have used SCTLR2 if the
capability ARM64_HAS_SCTLR2 did not get enabled, it would be better to
enforce a clean state here for the new kernel.

If so, maybe one of the macros that you already defined can be used
here?  (But it's also fine to open-code it.)

>  	isb
>  
>  	cbz	x0, 1f				// el2_switch?

[...]

In the case where the el2_switch argument in non-zero, don't we also
need to do something to reinitialise SCTLR2_EL2 after switching back
to EL2, in the HVC_SOFT_RESTART handler?

Maybe I missed something.

Cheers
---Dave

