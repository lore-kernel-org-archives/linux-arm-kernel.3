Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FA2C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 09:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/0yanPD6sGyZoS3Q0AKlVkCAWcmX0vCPYDUPJU4ZmY=; b=E8uaLY1SwRcsw57JYiRLLb6/c8
	VxJIeBnmNdeTcXmhZAG5a+CQppjoe0ypsoQ07ipDeLESbCvFOMZAVWsm5JGL9ISVaEM2EyKnutGFz
	FB73QdOpOBkkfF3aAQQQvOqmy7z0OiuVTQDTMxiTHN3Op6H45av5vVqSo8w12muAs2ht04BF/x74O
	hXzzkhjdROgd5PIVbkYn/f885gPfJ+FoN+aL1XJB9E55q6qnt0IjBUSrKHw45k1ooWsnKTNoaQohl
	kS1H+Uk0+FHdJzkCKZkUYMc9/Rud0U1wPQiExg9bTYuuxqTOAhZiM38bv8X9d5TxFHgZn5Zjgniui
	i5FFmVhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukJHj-00000002Rg5-0c1c;
	Fri, 08 Aug 2025 09:21:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukJFF-00000002RRE-0xuz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 09:18:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 329B416F2;
	Fri,  8 Aug 2025 02:18:26 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9A8E3F673;
	Fri,  8 Aug 2025 02:18:33 -0700 (PDT)
Date: Fri, 8 Aug 2025 10:18:32 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v5 05/12] arm64/boot: Factor out a macro to check SPE
 version
Message-ID: <20250808091832.GA3420125@e132581.arm.com>
References: <20250721-james-perf-feat_spe_eft-v5-0-a7bc533485a1@linaro.org>
 <20250721-james-perf-feat_spe_eft-v5-5-a7bc533485a1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721-james-perf-feat_spe_eft-v5-5-a7bc533485a1@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_021837_342798_437346E2 
X-CRM114-Status: GOOD (  23.21  )
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

On Mon, Jul 21, 2025 at 02:04:59PM +0100, James Clark wrote:
> We check the version of SPE twice, and we'll add one more check in the
> next commit so factor out a macro to do this. Change the #3 magic number
> to the actual SPE version define (V1p2) to make it more readable.
> 
> No functional changes intended.

I failed to apply this patch on the mailine kernel, seems like this is
because your local tree does not include the commit:

  ae344bcb0d49 ("arm64: Handle BRBE booting requirements")

Please note the commit above has updated __init_el2_fgt so you might
need to update this patch.

Thanks,
Leo

> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  arch/arm64/include/asm/el2_setup.h | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
> index 9f38340d24c2..2bb0d28952e4 100644
> --- a/arch/arm64/include/asm/el2_setup.h
> +++ b/arch/arm64/include/asm/el2_setup.h
> @@ -103,8 +103,7 @@
>  	csel	x2, xzr, x0, eq			// all PMU counters from EL1
>  
>  	/* Statistical profiling */
> -	ubfx	x0, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
> -	cbz	x0, .Lskip_spe_\@		// Skip if SPE not present
> +	__spe_vers_imp .Lskip_spe_\@, ID_AA64DFR0_EL1_PMSVer_IMP, x0 // Skip if SPE not present
>  
>  	mrs_s	x0, SYS_PMBIDR_EL1              // If SPE available at EL2,
>  	and	x0, x0, #(1 << PMBIDR_EL1_P_SHIFT)
> @@ -189,6 +188,14 @@
>  .Lskip_set_cptr_\@:
>  .endm
>  
> +/* Branch to skip_label if SPE version is less than given version */
> +.macro __spe_vers_imp skip_label, version, tmp
> +    mrs    \tmp, id_aa64dfr0_el1
> +    ubfx   \tmp, \tmp, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
> +    cmp    \tmp, \version
> +    b.lt   \skip_label
> +.endm
> +
>  /* Disable any fine grained traps */
>  .macro __init_el2_fgt
>  	mrs	x1, id_aa64mmfr0_el1
> @@ -196,10 +203,8 @@
>  	cbz	x1, .Lskip_fgt_\@
>  
>  	mov	x0, xzr
> -	mrs	x1, id_aa64dfr0_el1
> -	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
> -	cmp	x1, #3
> -	b.lt	.Lskip_spe_fgt_\@
> +	/* If SPEv1p2 is implemented, */
> +	__spe_vers_imp .Lskip_spe_fgt_\@, #ID_AA64DFR0_EL1_PMSVer_V1P2, x1
>  	/* Disable PMSNEVFR_EL1 read and write traps */
>  	orr	x0, x0, #(1 << 62)
>  
> 
> -- 
> 2.34.1
> 
> 

