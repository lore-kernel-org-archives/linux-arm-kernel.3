Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E22CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 10:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLLXMUpdydKZncQoWJNf6WyJ37Ux+BsFHT+8WRbvPeY=; b=zbDjxwtws2T1fbmCN53X5e53cb
	v+N+DE0r4rDqnETxTbYANe/P+akrDcC6VaRGE6rVQNiAaXJvUDYT2gdMyhJILb/yLZ73p5S7Y1krz
	TrjThTTNoc7559p9Zt55KItAd4ulAyY1x0F9Jes4bAZrvHoY85dSiXDPUvHGDoa2aI/IlR/zc8GU8
	AsEDJmQRjJlhilQFe6nuPvZEqExE5a5kjAq9g3o0XDt1G5nK5VvrB16xyB2PZ3h+hHe0GMbdcGaJv
	T93Ll1cve0uhDUN+J/Kn+JnIw/j6Fhmob0TgDUU18ND4k0sXtQCeDMTTJ0glXAp2bsTMLT9pA/h4I
	GFy3PG8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCD8-0000000H95X-2q1L;
	Thu, 18 Sep 2025 10:49:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCD6-0000000H94h-29DV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 10:49:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D09D1A2D;
	Thu, 18 Sep 2025 03:49:47 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D8793F673;
	Thu, 18 Sep 2025 03:49:51 -0700 (PDT)
Date: Thu, 18 Sep 2025 11:49:48 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Liang,  Kan" <kan.liang@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ian Rogers <irogers@google.com>, Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	John Garry <john.g.garry@oracle.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Leo Yan <leo.yan@linux.dev>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v5 5/7] arm64: errata: Expand speculative SSBS workaround
 for Cortex-A720AE
Message-ID: <aMvjzPBAKtaIzXC1@J2N7QTR9R3.cambridge.arm.com>
References: <87ms6snut0.wl-kuninori.morimoto.gx@renesas.com>
 <87frcknum8.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87frcknum8.wl-kuninori.morimoto.gx@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_034956_592885_27AF3396 
X-CRM114-Status: GOOD (  16.78  )
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

On Thu, Sep 18, 2025 at 06:27:12AM +0000, Kuninori Morimoto wrote:
> It is same as Cortex-A720.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

It might be worth saying that Cortex-A720AE is explciitly describedon
Arm's "Arm CPU Security Bulletin: Spectre/Meltdown" page at:

  https://developer.arm.com/documentation/110280/3-0/

... and is described identially to Cortex-A720.

No need to respin for that, Will can choose to add that if he wants.

Either way:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm64/kernel/cpu_errata.c  | 1 +
>  arch/arm64/kernel/proton-pack.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> index 59d723c9ab8f5..7ff6b49beaaff 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -531,6 +531,7 @@ static const struct midr_range erratum_spec_ssbs_list[] = {
>  	MIDR_ALL_VERSIONS(MIDR_CORTEX_A710),
>  	MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
>  	MIDR_ALL_VERSIONS(MIDR_CORTEX_A720),
> +	MIDR_ALL_VERSIONS(MIDR_CORTEX_A720AE),
>  	MIDR_ALL_VERSIONS(MIDR_CORTEX_A725),
>  	MIDR_ALL_VERSIONS(MIDR_CORTEX_X1),
>  	MIDR_ALL_VERSIONS(MIDR_CORTEX_X1C),
> diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
> index edf1783ffc817..f9a32dfde0067 100644
> --- a/arch/arm64/kernel/proton-pack.c
> +++ b/arch/arm64/kernel/proton-pack.c
> @@ -884,6 +884,7 @@ static u8 spectre_bhb_loop_affected(void)
>  	static const struct midr_range spectre_bhb_k38_list[] = {
>  		MIDR_ALL_VERSIONS(MIDR_CORTEX_A715),
>  		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720),
> +		MIDR_ALL_VERSIONS(MIDR_CORTEX_A720AE),
>  		{},
>  	};
>  	static const struct midr_range spectre_bhb_k32_list[] = {
> -- 
> 2.43.0
> 

