Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97D5C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 07:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/MjXQFe+MVwzoUH8qiNyQcOycIU9TgFZ0JPfQEvC6M=; b=sRmbbIPPty1I2atedHEL636KSy
	zqOIFe5bx1UqDKY/bfD6lcni2NFxYhDTqDG2kjklDYwSmW2ek5xvAVFwFciuF2qBfwHX8gwFakYUR
	DPw7N80TmjYBsS09HjZ460PdsvwW6XYHb8rqPKrzaUfM5tYuSOe/mKOxRiF86tpKi04j/E8bxgOTa
	hb7wGQ6JaPfdbrmXFulRL9rlhHMgvqywwX+rBM08EhLyXIzyHDXSyHMH4VkFxE6pSv8RRIMlFcDeo
	O8zEw57Y9QvN+V71+NrVE2saKGgGHRyD/ERB1jy8CJGkO5Dk5t5O9QZUZ//KieBMVS5RwSb0PGdDm
	Revrpk8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Gbb-00000007IyS-0HKr;
	Wed, 23 Sep 2026 06:37:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GbY-00000007IxR-0HNS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 06:37:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33A5F1516;
	Tue, 22 Sep 2026 23:37:12 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0D453F86C;
	Tue, 22 Sep 2026 23:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790145435; bh=o4hG7piVOUQgAGaxVWLjt4d5r0pbx4AC/Tq7g2GLnac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sYX/4OjfLkbaAjPqf/UqqZ4gmpM6iQcIn8+LGG5oxSljlAeunNYcNxQTa9+dW+JlT
	 PY3EsuxYwFI2XfdpFU8OXUB6HdSxRMe/jaG93jLLZtSa1LP61xzJf2NCOacuiFpdwM
	 tDjnTuDPs+OrZqibBW6yS1Eh2kGE7u6la5KDo2xU=
Date: Wed, 23 Sep 2026 12:07:12 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	James Clark <james.clark@linaro.org>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64/boot: Disable trapping of PMZR_EL0 writes to EL2
Message-ID: <x2yybbtclm2lv6shjrootdf466tsnxqrpvtd3s75jcxrlrv6hi@7swnsdxykxdc>
References: <20260922181430.3532371-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922181430.3532371-1-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_233720_265004_D94AC6A5 
X-CRM114-Status: GOOD (  23.19  )
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

On Tue, Sep 22, 2026 at 07:14:30PM +0100, Fuad Tabba wrote:
> __init_el2_fgt2() writes one mask to both HDFGRTR2_EL2 and HDFGWTR2_EL2.
> PMZR_EL0 is write-only, so its trap bit, nPMZR_EL0, exists only in
> HDFGWTR2_EL2 and is therefore never set: a PMZR_EL0 write from the host
> traps to EL2, where the nVHE hypervisor has no handler and BUG()s. The
> kernel never writes PMZR_EL0, but kernel.perf_user_access=1 has the PMU
> driver set PMUSERENR_EL0.UEN for a task with a user-read event, so a
> write from EL0 reaches the trap and takes the host down without a panic
> message.
> 
> Accumulate the HDFGWTR2_EL2 bits separately, as __init_el2_fgt() already
> does for HDFGWTR_EL2, and set nPMZR_EL0 with the other FEAT_PMUv3p9
> bits.
> 
> Fixes: 858c7bfcb35e1 ("arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
> Based on Linux 7.3-rc4 (93f51579e7df2).
> 
>  Documentation/arch/arm64/booting.rst | 1 +
>  arch/arm64/include/asm/el2_setup.h   | 9 ++++++++-
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
> index 13ef311dace83..3fea4b14ef7c2 100644
> --- a/Documentation/arch/arm64/booting.rst
> +++ b/Documentation/arch/arm64/booting.rst
> @@ -465,6 +465,7 @@ Before jumping into the kernel, the following conditions must be met:
>      - HDFGWTR2_EL2.nPMICNTR_EL0 (bit 2) must be initialised to 0b1.
>      - HDFGWTR2_EL2.nPMICFILTR_EL0 (bit 3) must be initialised to 0b1.
>      - HDFGWTR2_EL2.nPMUACR_EL1 (bit 4) must be initialised to 0b1.
> +    - HDFGWTR2_EL2.nPMZR_EL0 (bit 21) must be initialised to 0b1.
>  
>    For CPUs with SPE data source filtering (FEAT_SPE_FDS):
>  
> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
> index aa8ec9df80243..87560d8b254e6 100644
> --- a/arch/arm64/include/asm/el2_setup.h
> +++ b/arch/arm64/include/asm/el2_setup.h
> @@ -418,6 +418,7 @@
>  	b.lt	.Lskip_fgt2_\@
>  
>  	mov	x0, xzr
> +	mov	x2, xzr
>  	mrs	x1, id_aa64dfr0_el1
>  	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMUVer_SHIFT, #4
>  	cmp	x1, #ID_AA64DFR0_EL1_PMUVer_V3P9
> @@ -426,6 +427,11 @@
>  	orr	x0, x0, #HDFGRTR2_EL2_nPMICNTR_EL0
>  	orr	x0, x0, #HDFGRTR2_EL2_nPMICFILTR_EL0
>  	orr	x0, x0, #HDFGRTR2_EL2_nPMUACR_EL1
> +	orr	x2, x2, #HDFGWTR2_EL2_nPMICNTR_EL0
> +	orr	x2, x2, #HDFGWTR2_EL2_nPMICFILTR_EL0
> +	orr	x2, x2, #HDFGWTR2_EL2_nPMUACR_EL1
> +	/* PMZR_EL0 is write-only, so it has no read trap to disable */
> +	orr	x2, x2, #HDFGWTR2_EL2_nPMZR_EL0
>  .Lskip_pmuv3p9_\@:
>  	/* If SPE is implemented, */
>  	__spe_vers_imp .Lskip_spefds_\@, ID_AA64DFR0_EL1_PMSVer_IMP, x1
> @@ -436,10 +442,11 @@
>  	cbz	x1, .Lskip_spefds_\@
>  	/* disable traps of PMSDSFR to EL2. */
>  	orr	x0, x0, #HDFGRTR2_EL2_nPMSDSFR_EL1
> +	orr	x2, x2, #HDFGWTR2_EL2_nPMSDSFR_EL1
>  
>  .Lskip_spefds_\@:
>  	msr_s   SYS_HDFGRTR2_EL2, x0
> -	msr_s   SYS_HDFGWTR2_EL2, x0
> +	msr_s   SYS_HDFGWTR2_EL2, x2
>  	msr_s   SYS_HFGRTR2_EL2, xzr
>  	msr_s   SYS_HFGWTR2_EL2, xzr
>  	msr_s   SYS_HFGITR2_EL2, xzr
> 
> base-commit: 93f51579e7df248780214094418f205253383cc5
> -- 
> 2.39.5
> 

