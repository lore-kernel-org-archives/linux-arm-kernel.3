Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9168DCA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 11:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ac8GewWZkif0aSS6wJkbL42+34AbVq6PHLS9+ePYuK8=; b=mehKJbW7EAG0KXNz4MhVpPKfC9
	F4OBi2IdEhGAdFl4u9ektX5z37SXP5Fv2OBfk8tYilwaUD962rR0GjFY3JhfmNxSNCQohBvuIo9KV
	pbvD/LkDsoUnYzcFwfj3+71xVtY1bkfor8M58eC5fVbRjNlVjyfhaJbH0uikTXFhzwTCNM39ZqalQ
	z/bjviKirq1cmWpAExbPQSsnBotHhb57jZrAiZWZUWV95E5Z0g2+U0yJgEVKFICVHgj8hXjrbUHTQ
	hqIcRsiSMQOxop8/HTFGPI+bZewOy5u1JQQ4U+M69bne7V56dSXYWnE1T/VB2EwG9XHCA/+e8KhJk
	ZnwVLjMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut2ze-0000000C6C5-2cow;
	Mon, 01 Sep 2025 11:46:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut1QI-0000000Br9K-3KL9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 10:06:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41EA62680;
	Mon,  1 Sep 2025 03:05:52 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30E3F3F6A8;
	Mon,  1 Sep 2025 03:06:00 -0700 (PDT)
Date: Mon, 1 Sep 2025 11:05:58 +0100
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
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v7 05/12] arm64/boot: Factor out a macro to check SPE
 version
Message-ID: <20250901100558.GJ745921@e132581.arm.com>
References: <20250814-james-perf-feat_spe_eft-v7-0-6a743f7fa259@linaro.org>
 <20250814-james-perf-feat_spe_eft-v7-5-6a743f7fa259@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814-james-perf-feat_spe_eft-v7-5-6a743f7fa259@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_030602_904835_A7022F9B 
X-CRM114-Status: GOOD (  22.45  )
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

On Thu, Aug 14, 2025 at 10:25:27AM +0100, James Clark wrote:
> We check the version of SPE twice, and we'll add one more check in the
> next commit so factor out a macro to do this. Change the #3 magic number
> to the actual SPE version define (V1p2) to make it more readable.
> 
> No functional changes intended.
> 
> Tested-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  arch/arm64/include/asm/el2_setup.h | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
> index 46033027510c..3a4ca7f9acfb 100644
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
> @@ -255,6 +254,14 @@
>  .Lskip_brbe_\@:
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

Just wondering if we need to move the macro to the beginning of the
file, so that we can define it first and call it afterwards.

Otherwise, LGTM:

Reviewed-by: Leo Yan <leo.yan@arm.com>

>  /* Disable any fine grained traps */
>  .macro __init_el2_fgt
>  	mrs	x1, id_aa64mmfr0_el1
> @@ -263,10 +270,8 @@
>  
>  	mov	x0, xzr
>  	mov	x2, xzr
> -	mrs	x1, id_aa64dfr0_el1
> -	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
> -	cmp	x1, #3
> -	b.lt	.Lskip_spe_fgt_\@
> +	/* If SPEv1p2 is implemented, */
> +	__spe_vers_imp .Lskip_spe_fgt_\@, #ID_AA64DFR0_EL1_PMSVer_V1P2, x1
>  	/* Disable PMSNEVFR_EL1 read and write traps */
>  	orr	x0, x0, #HDFGRTR_EL2_nPMSNEVFR_EL1_MASK
>  	orr	x2, x2, #HDFGWTR_EL2_nPMSNEVFR_EL1_MASK
> 
> -- 
> 2.34.1
> 

