Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4507ACA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 11:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WckmAPZbaukEs+RVJghNnOv3T9/fWO7s3iZjGrVnHs=; b=jkgArZ7E7lp+RLCtOe3edTR/5M
	mjcIjDJ4qp8ITtLyB8XswxZx1g1HI9gsN68M+amy/4qvU7jClggEAg2A96js6FcitCD6LXhZJ9Tew
	NQKWOp/+TaydEzvjqAjP1tnxBHqMoV84NC8X6eEqd2+Nb1Y4UrUC1HvZzVV1G8WGaJISbPP4Jo81b
	rW6ZEGXU1lasGRYgAsuVpynL3IbgS3zjzPgr9LCWimKIqxCx29qNdloPEvJ5x8Ym5zkiszXPijGdP
	tWPTLM+JWBI+Jms4E64S92L+VZuIEp6VWYqOg7U5zV/rpkaaTIdWuEbNuh0tJnRKuxB0RU6Po4Job
	lgekjgSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3AP-0000000C7XP-1ITW;
	Mon, 01 Sep 2025 11:57:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut1cy-0000000BtCN-3GCB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 10:19:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C72B31A25;
	Mon,  1 Sep 2025 03:18:58 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B57893F6A8;
	Mon,  1 Sep 2025 03:19:06 -0700 (PDT)
Date: Mon, 1 Sep 2025 11:19:04 +0100
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
Subject: Re: [PATCH v7 06/12] arm64/boot: Enable EL2 requirements for
 SPE_FEAT_FDS
Message-ID: <20250901101904.GK745921@e132581.arm.com>
References: <20250814-james-perf-feat_spe_eft-v7-0-6a743f7fa259@linaro.org>
 <20250814-james-perf-feat_spe_eft-v7-6-6a743f7fa259@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814-james-perf-feat_spe_eft-v7-6-6a743f7fa259@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_031908_853677_F91D3766 
X-CRM114-Status: GOOD (  14.98  )
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

On Thu, Aug 14, 2025 at 10:25:28AM +0100, James Clark wrote:

[...]

> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
> index 3a4ca7f9acfb..a0361ddcdca4 100644
> --- a/arch/arm64/include/asm/el2_setup.h
> +++ b/arch/arm64/include/asm/el2_setup.h
> @@ -392,6 +392,17 @@
>  	orr	x0, x0, #HDFGRTR2_EL2_nPMICFILTR_EL0
>  	orr	x0, x0, #HDFGRTR2_EL2_nPMUACR_EL1
>  .Lskip_pmuv3p9_\@:
> +	/* If SPE is implemented, */
> +	__spe_vers_imp .Lskip_spefds_\@, ID_AA64DFR0_EL1_PMSVer_IMP, x1
> +	/* we can read PMSIDR and */
> +	mrs_s	x1, SYS_PMSIDR_EL1
> +	and	x1, x1,  #PMSIDR_EL1_FDS
> +	/* if FEAT_SPE_FDS is implemented, */
> +	cbz	x1, .Lskip_spefds_\@
> +	/* disable traps to PMSDSFR. */

Nitpick: the comment is a bit ambiguous for me. Would it be better to
say "disable traps to EL2" or "set the PMSDSFR bit to disable trapping" ?

Otherwise, LGTM:

Reviewed-by: Leo Yan <leo.yan@arm.com>

> +	orr	x0, x0, #HDFGRTR2_EL2_nPMSDSFR_EL1
> +
> +.Lskip_spefds_\@:
>  	msr_s   SYS_HDFGRTR2_EL2, x0
>  	msr_s   SYS_HDFGWTR2_EL2, x0
>  	msr_s   SYS_HFGRTR2_EL2, xzr
> 
> -- 
> 2.34.1
> 

