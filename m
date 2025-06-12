Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8503C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 06:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZT1q8VwCdE0CtIsr1CnU/DTYu0PZsqPDY3Z49/cttbs=; b=1Xnqezq4fX1InWJanm2skfSFwV
	ju/VtrVmVdvTW6zjc2soxw3AGV5Q+PSvvuFLvPvRpTIo4bl5sR88tgZHtFKg1HhoZbP4/n9SHZXb+
	xQ5HdoWCLGaD/XlhnYThKRAyFriAW7dPEM9mhjiqojBk88Sic2Nc0cUAlwP75sRVzfyJCdwYZsIg8
	s5S7sQgusR1WD+lAZleagCn6eJL/qpRA5gUsq6Rmmo0F6gxHd8cVFzNxCXbQeRyEZmWeBRDthwqh+
	sNAmtSvoy4RaNv0i19PNUxMBboDBIcrYjhCerUcc8nXZAIldNKbPTE46tzsfxVKcdszmafeV9OzL0
	ZSdeocog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPbiS-0000000CLyn-1wsc;
	Thu, 12 Jun 2025 06:47:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPbgL-0000000CLLZ-1rmX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 06:45:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11DE014BF;
	Wed, 11 Jun 2025 23:44:40 -0700 (PDT)
Received: from [10.163.33.129] (unknown [10.163.33.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 711AB3F59E;
	Wed, 11 Jun 2025 23:44:52 -0700 (PDT)
Message-ID: <f89faeb2-1091-41af-ae06-f49bd2d4866a@arm.com>
Date: Thu, 12 Jun 2025 12:14:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/10] arm64: sysreg: Add new PMSFCR_EL1 fields and
 PMSDSFR_EL1 register
To: James Clark <james.clark@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
 <20250605-james-perf-feat_spe_eft-v3-1-71b0c9f98093@linaro.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250605-james-perf-feat_spe_eft-v3-1-71b0c9f98093@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_234501_543762_CD8DE30F 
X-CRM114-Status: GOOD (  12.13  )
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

On 05/06/25 4:18 PM, James Clark wrote:
> Add new fields and register that are introduced for the features
> FEAT_SPE_EFT (extended filtering) and FEAT_SPE_FDS (data source
> filtering).
> 
> Tested-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  arch/arm64/tools/sysreg | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 8a8cf6874298..2e897d8a4040 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -2859,11 +2859,20 @@ Field	0	RND
>  EndSysreg
>  
>  Sysreg	PMSFCR_EL1	3	0	9	9	4
> -Res0	63:19
> +Res0	63:53
> +Field	52	SIMDm
> +Field	51	FPm
> +Field	50	STm
> +Field	49	LDm
> +Field	48	Bm
> +Res0	47:21
> +Field	20	SIMD
> +Field	19	FP
>  Field	18	ST
>  Field	17	LD
>  Field	16	B
> -Res0	15:4
> +Res0	15:5
> +Field	4	FDS
>  Field	3	FnE
>  Field	2	FL
>  Field	1	FT
> 

These register fields checks out against ARM ARM DDI 0487 (L.b)

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

