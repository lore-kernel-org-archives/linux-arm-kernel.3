Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB72C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 13:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0mr9Cnjsxk/N4w5E4Wkr7mfDQV+6DGIpUhTXDq6DpG0=; b=PK71PORSNEW+BY1jT+x2ESonJu
	VlnveIDMu0zrVsNV9VQgPiP+48ZJO3aW/MLOSXi8UO2/oPB+jRbZe2R3lP+FPcDgW0Ccs3sOJkYNZ
	QTNNxQxw+AUprvfnU0ZXQSzuVybcc967ks00fRHPkVrTQh0OwMmzzwGPYMplhXvIAZ5XqEJbw+2ti
	eFkl5TwPzmldIeEuv/fWY+0vnzXhJpUCLZfGA3bzUlrM+uHcOodq3TZhrO7fsswotI++OLRHfmcQb
	rpJgMCM5HQ/lau+r4YHD+o/kjosW6OOAbo3GI2PEj7+bIeZICbXhGn6f5j9zOOtMVnHPGHySgetCE
	NsFRhPdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJBS-00000002Hfl-1Fiu;
	Mon, 14 Jul 2025 13:25:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIuB-00000002EOQ-1zoY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 13:07:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9060A5C5B85;
	Mon, 14 Jul 2025 13:07:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4972C4CEED;
	Mon, 14 Jul 2025 13:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752498458;
	bh=jqkD9NnjSzNMQFIzMgtc42gfx4cD5lfa7KYuegCaDgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VAXIvsSc1FY8lEunNfVO1/aODep/5SEf1uGccoGx/j4JCYuAJkOVB6g7tjj6OCohl
	 Ds63TKBa9uGAI5Begs2L3F0mx3o+FzUT4NRLxWKkdcFb0VEmZPdKB2+zYDFrYGEo3v
	 oGXMB5VwZVJXzXkT8GdpT1MGcS/4+8yKiI6LsWM3yZpaDdW11OlW3qJStxlUU5pFTz
	 9Jlk6GwJdt0gqvRJ/eYY0yeKrFmmXg/DNemtjkLqQKFn/7dlgHZCaiNgcFe3L7uaWj
	 2u3/Zrp2ylTk0ni52XWHN4Zd6Q1usfQ6NYGDFtLT3WTnym1/Z6VJ0FXiQZWqN3xpnd
	 FrT3HtTnySjeA==
Date: Mon, 14 Jul 2025 14:07:32 +0100
From: Will Deacon <will@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	James Clark <james.clark@linaro.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	German Gomez <german.gomez@arm.com>,
	Ali Saidi <alisaidi@amazon.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v3 01/14] drivers/perf: arm_spe: Expose event filter
Message-ID: <aHUBFGPck-O3vs9b@willie-the-truck>
References: <20250707-arm_spe_support_hitm_overhead_v1_public-v3-0-33ea82da3280@arm.com>
 <20250707-arm_spe_support_hitm_overhead_v1_public-v3-1-33ea82da3280@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707-arm_spe_support_hitm_overhead_v1_public-v3-1-33ea82da3280@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_060739_598276_247F64AD 
X-CRM114-Status: GOOD (  23.30  )
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

On Mon, Jul 07, 2025 at 02:39:23PM +0100, Leo Yan wrote:
> Expose an "event_filter" entry in the caps folder to inform user space
> about which events can be filtered.
> 
> Change the return type of arm_spe_pmu_cap_get() from u32 to u64 to
> accommodate the added event filter entry.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/perf/arm_spe_pmu.c | 36 ++++++++++++++++++++----------------
>  1 file changed, 20 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
> index 3efed8839a4ec5604eba242cb620327cd2a6a87d..78d8cb59b66d7bc6319eb4ee40e6d2d32ffb8bdf 100644
> --- a/drivers/perf/arm_spe_pmu.c
> +++ b/drivers/perf/arm_spe_pmu.c
> @@ -115,6 +115,7 @@ enum arm_spe_pmu_capabilities {
>  	SPE_PMU_CAP_FEAT_MAX,
>  	SPE_PMU_CAP_CNT_SZ = SPE_PMU_CAP_FEAT_MAX,
>  	SPE_PMU_CAP_MIN_IVAL,
> +	SPE_PMU_CAP_EVENT_FILTER,
>  };
>  
>  static int arm_spe_pmu_feat_caps[SPE_PMU_CAP_FEAT_MAX] = {
> @@ -122,7 +123,21 @@ static int arm_spe_pmu_feat_caps[SPE_PMU_CAP_FEAT_MAX] = {
>  	[SPE_PMU_CAP_ERND]	= SPE_PMU_FEAT_ERND,
>  };
>  
> -static u32 arm_spe_pmu_cap_get(struct arm_spe_pmu *spe_pmu, int cap)
> +static u64 arm_spe_pmsevfr_res0(u16 pmsver)
> +{
> +	switch (pmsver) {
> +	case ID_AA64DFR0_EL1_PMSVer_IMP:
> +		return PMSEVFR_EL1_RES0_IMP;
> +	case ID_AA64DFR0_EL1_PMSVer_V1P1:
> +		return PMSEVFR_EL1_RES0_V1P1;
> +	case ID_AA64DFR0_EL1_PMSVer_V1P2:
> +	/* Return the highest version we support in default */
> +	default:
> +		return PMSEVFR_EL1_RES0_V1P2;
> +	}
> +}

Hmm. This logic was already a little shakey and so I'm not sure it's a
good idea to expose it directly to userspace. Maintaining RES0 masks for
different versions of SPE won't scale and there are already things that
we can't sensibly handle. For example, E[8]:

  | When (FEAT_SPEv1p4 is implemented or filtering on event 8 is
  | optionally supported) and event 8 is implemented:

So, stepping back, can we remove this stuff altogether? The bits are
RAZ/WI in the case that the even is not implement, but that means that:

  | Software can rely on the field reading as all 0s, and on writes being
  | ignored.

so why are we even bothering to police this?

In other words, remove arm_spe_pmsevfr_res0() and the two checks that
use it in arm_spe_pmu_event_init(). If userspace tries to filter events
that aren't implemented, then it gets to keep the pieces.

Will

