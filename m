Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E54CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 08:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxPtrRmU/hgbR36FcYWyNMdb1qYQ73ySD1foCqKr6wY=; b=4REzPxZJlsuHlwAurd5QVgF59B
	+Ae2pYOxflSKWw3Yl3mkzzDk9RCdHS+yXxIQqnYJcTMfLHxhOqHY4c31ZwCj7lIGI6h2f10M2ma2V
	JBhwCderS0xwl6y9b20X0SZ7m0xqnJddb8iXdHfC66o7FrLgZg+BFtieGooCaela0X9oBZb87lJvV
	x04GA17oX2WCW7KiUQ3W7wNSM3Z22BUYkNIDls7fwNKI/DGYkfGjEVEgq3yNn7XFn7M7WDxWFHsw4
	hbetn6/3THQA/JLAxiAsy6Gxp/ERab3k7nqvn54sAENvjapy1E38yvl03eVjAFoX3QZQ+FAPCfAhx
	lK7/eJ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyRR2-00000007GZV-2N5W;
	Tue, 16 Sep 2025 08:53:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyRR1-00000007GZ5-0ehh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 08:53:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 07FE260143;
	Tue, 16 Sep 2025 08:53:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D768C4CEEB;
	Tue, 16 Sep 2025 08:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758012788;
	bh=x1vfpZMTu0dHJho+pMOfAAm3yf/Mhb06EGt/9k5KZqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YwR15Hw5jn3tFb4Mfe4A8rfByvNpFsa4+L4hIVpF8effWXB1RbJ6jp8ca77/XkJEi
	 esAb/PiHMhyGHN8Ql1817x+/6PADODi1UGpNuwQwEFuexlS8y1PrWKTrKrXh7WYO4Q
	 mWkau3c64o7aheV6n72emzl51Zr7T+3PGbjK6dJgbEJTF/GO7a+YKKjXxFgGhvhZkV
	 CeJaXbT57laXYuNwKo7ZmoM368VqgT7EULizAf6Lpk/f9OiXvZFKAiFOe59YwKidp8
	 50KCBZpAEnQacdlDqw0pIo2EDFnJi4Z3nr0ZMfE9ayZyus2d2VHj5xvdnLkLpx5krd
	 V0oMxvmP8FNGQ==
Date: Tue, 16 Sep 2025 09:53:00 +0100
From: Will Deacon <will@kernel.org>
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
	Mark Rutland <mark.rutland@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v3 3/6] arm64: cputype: Add Cortex-A720AE definitions
Message-ID: <aMklbKwro2bSX76t@willie-the-truck>
References: <87tt13i0lh.wl-kuninori.morimoto.gx@renesas.com>
 <87plbri0k3.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87plbri0k3.wl-kuninori.morimoto.gx@renesas.com>
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

On Tue, Sep 16, 2025 at 02:38:36AM +0000, Kuninori Morimoto wrote:
> Add cputype definitions for Cortex-A720AE.
> This patch is assuming A720AE feature is same as A720.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  arch/arm64/include/asm/cputype.h       | 2 ++
>  arch/arm64/kernel/cpu_errata.c         | 1 +
>  arch/arm64/kernel/proton-pack.c        | 1 +
>  tools/arch/arm64/include/asm/cputype.h | 2 ++
>  tools/perf/util/arm-spe.c              | 1 +
>  5 files changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
> index 661735616787e..b10eba7f52476 100644
> --- a/arch/arm64/include/asm/cputype.h
> +++ b/arch/arm64/include/asm/cputype.h
> @@ -96,6 +96,7 @@
>  #define ARM_CPU_PART_NEOVERSE_V3	0xD84
>  #define ARM_CPU_PART_CORTEX_X925	0xD85
>  #define ARM_CPU_PART_CORTEX_A725	0xD87
> +#define ARM_CPU_PART_CORTEX_A720AE	0xD89
>  #define ARM_CPU_PART_NEOVERSE_N3	0xD8E
>  
>  #define APM_CPU_PART_XGENE		0x000
> @@ -185,6 +186,7 @@
>  #define MIDR_NEOVERSE_V3 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_V3)
>  #define MIDR_CORTEX_X925 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_X925)
>  #define MIDR_CORTEX_A725 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A725)
> +#define MIDR_CORTEX_A720AE MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A720AE)
>  #define MIDR_NEOVERSE_N3 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_N3)
>  #define MIDR_THUNDERX	MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX)
>  #define MIDR_THUNDERX_81XX MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX_81XX)
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

This needs an Ack from somebody at Arm who can confirm that (a) k38 is
correct for A720AE and (b) that all versions of the CPU are affected.

> diff --git a/tools/arch/arm64/include/asm/cputype.h b/tools/arch/arm64/include/asm/cputype.h
> index 139d5e87dc959..0192dc7ec9ca9 100644
> --- a/tools/arch/arm64/include/asm/cputype.h
> +++ b/tools/arch/arm64/include/asm/cputype.h
> @@ -96,6 +96,7 @@
>  #define ARM_CPU_PART_NEOVERSE_V3	0xD84
>  #define ARM_CPU_PART_CORTEX_X925	0xD85
>  #define ARM_CPU_PART_CORTEX_A725	0xD87
> +#define ARM_CPU_PART_CORTEX_A720AE	0xD89
>  #define ARM_CPU_PART_NEOVERSE_N3	0xD8E
>  
>  #define APM_CPU_PART_XGENE		0x000
> @@ -185,6 +186,7 @@
>  #define MIDR_NEOVERSE_V3 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_V3)
>  #define MIDR_CORTEX_X925 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_X925)
>  #define MIDR_CORTEX_A725 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A725)
> +#define MIDR_CORTEX_A720AE MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A720AE)
>  #define MIDR_NEOVERSE_N3 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_N3)
>  #define MIDR_THUNDERX	MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX)
>  #define MIDR_THUNDERX_81XX MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX_81XX)
> diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
> index 8942fa598a84f..bda6f3554f7e6 100644
> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -555,6 +555,7 @@ static int arm_spe__synth_instruction_sample(struct arm_spe_queue *speq,
>  
>  static const struct midr_range common_ds_encoding_cpus[] = {
>  	MIDR_ALL_VERSIONS(MIDR_CORTEX_A720),
> +	MIDR_ALL_VERSIONS(MIDR_CORTEX_A720AE),
>  	MIDR_ALL_VERSIONS(MIDR_CORTEX_A725),
>  	MIDR_ALL_VERSIONS(MIDR_CORTEX_X1C),
>  	MIDR_ALL_VERSIONS(MIDR_CORTEX_X3),

Please post tools/ patches separately as they are merged independently
of the kernel changes.

Will

