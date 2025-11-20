Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EB5CF649C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 01:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1fhiBgC3wmo6EcbTrmkFhDT2xdiGtSvH1A3Oi7bw9Ek=; b=NkRUeRS493UpZSK7VGKvpGY65K
	5E2TAMqrt30O+lkZ47XrQzANeZa6Y9jbiiiCdj+MMcbtTNuB72Y+wSovM2dzUZj55h6bH2ir2Ww9e
	2275WjDD0Gxn/q8XM8MNa1dvmC0cTFTL8EiXwGyx2DLl54m05R6rLj7e95sAqLFycCu0+FQW5rzNn
	udp6xt/HzbtFWlMAA18cOva55drVvi3IZ0zBKo3VY9q9heoEQheTtu+nvlfUBa/PEXnA22WDsI5Zk
	K7NqTItFGUzF1YJUrDkjgt0Q7FD0Qqd+z805xuTTg3KDc+OVWM6cmmVY6aXGtt67tEymAENNOfCCb
	XzXPqeCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLtsl-00000005x06-1QnD;
	Thu, 20 Nov 2025 01:54:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLtsj-00000005wzR-1s8X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 01:54:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 26B58441C3;
	Thu, 20 Nov 2025 01:54:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94ED9C4CEF5;
	Thu, 20 Nov 2025 01:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763603684;
	bh=/bYl3PfE31ZepLHyLYI1pggKbRkiLRQgnDFKccns06Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JohDXqXE59Z8ijFqQfx9apJXrtQaIpyff899jEd9yeCinqsEssuZZOSlffP3mnX1M
	 k5cOOzyw3RMnuadAF4/LSHar0tA+MOijnrEhaguqi6CoL8E/faNQj4NgpUM6kVYe2J
	 XHCuIQMr+zy/IkEt7NPmKohBfMtQcogn0vl3wgmwQMWq66GiyFTyDYYYQ4EGWpIO6A
	 +XnSlk07tIOqnHSoQH87pFTjiU6pCxkH3lXtDgkSX8rSZq/m0YRnBV/8NDgEOAHSmO
	 7nvFTaiNnS9Z2+c2pKgBTs7iayTLfyyeL+sawnlz8ZnLK5voFDbbjzZkcOoceWGW3P
	 jr46nBMBIOZoQ==
Date: Wed, 19 Nov 2025 17:54:39 -0800
From: Namhyung Kim <namhyung@kernel.org>
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
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v10 0/5] perf: arm_spe: Armv8.8 SPE features
Message-ID: <aR503-f-ZrnWzZh2@google.com>
References: <20251111-james-perf-feat_spe_eft-v10-0-1e1b5bf2cd05@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251111-james-perf-feat_spe_eft-v10-0-1e1b5bf2cd05@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_175445_524758_F3FC94A2 
X-CRM114-Status: GOOD (  23.91  )
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

Hello,

On Tue, Nov 11, 2025 at 11:37:54AM +0000, James Clark wrote:
> Support SPE_FEAT_FDS data source filtering.

What's the state of this series?  I can merge the tools part (3, 4, 5)
once the kernel part lands somewhere.

Thanks,
Namhyung

> 
> ---
> Changes in v10:
> - Pick up Peter's ack
> - Slightly clarify commit message regarding the difference between the
>   data source filter and the data source
> - Link to v9: https://lore.kernel.org/r/20251029-james-perf-feat_spe_eft-v9-0-d22536b9cf94@linaro.org
> 
> Changes in v9:
> - Fix another typo in docs: s/data_src_filter/inv_data_src_filter/g
> - Drop already applied patches for other features. Only the data source
>   filtering patches remain.
> - Rebase on latest perf-tools-next
> - Link to v8: https://lore.kernel.org/r/20250901-james-perf-feat_spe_eft-v8-0-2e2738f24559@linaro.org
> 
> Changes in v8:
> - Define __spe_vers_imp before it's used
> - "disable traps to PMSDSFR" -> "disable traps of PMSDSFR to EL2"
> - Link to v7: https://lore.kernel.org/r/20250814-james-perf-feat_spe_eft-v7-0-6a743f7fa259@linaro.org
> 
> Changes in v7:
> - Fix typo in docs: s/data_src_filter/inv_data_src_filter/g
> - Pickup trailers
> - Link to v6: https://lore.kernel.org/r/20250808-james-perf-feat_spe_eft-v6-0-6daf498578c8@linaro.org
> 
> Changes in v6:
> - Rebase to resolve conflict with BRBE changes in el2_setup.h
> - Link to v5: https://lore.kernel.org/r/20250721-james-perf-feat_spe_eft-v5-0-a7bc533485a1@linaro.org
> 
> Changes in v5:
> - Forgot to pickup tags from v4
> - Forgot to drop test and review tags on v4 patches that were
>   significantly modified
> - Update commit message for data source filtering to mention inversion
> - Link to v4: https://lore.kernel.org/r/20250721-james-perf-feat_spe_eft-v4-0-0a527410f8fd@linaro.org
> 
> Changes in v4:
> - Rewrite "const u64 feat_spe_eft_bits" inline
> - Invert data source filter so that it's possible to exclude all data
>   sources without adding an additional 'enable filter' flag
> - Add a macro in el2_setup.h to check for an SPE version
> - Probe valid filter bits instead of hardcoding them
> - Take in Leo's commit to expose the filter bits as it depends on the
>   new filter probing
> - Link to v3: https://lore.kernel.org/r/20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org
> 
> Changes in v3:
> - Use PMSIDR_EL1_FDS instead of 1 << PMSIDR_EL1_FDS_SHIFT
> - Add VNCR offsets
> - Link to v2: https://lore.kernel.org/r/20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org
> 
> Changes in v2:
> - Fix detection of FEAT_SPE_FDS in el2_setup.h
> - Pickup Marc Z's sysreg change instead which matches the json
> - Restructure and expand docs changes
> - Link to v1: https://lore.kernel.org/r/20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org
> 
> ---
> James Clark (5):
>       perf: Add perf_event_attr::config4
>       perf: arm_spe: Add support for filtering on data source
>       tools headers UAPI: Sync linux/perf_event.h with the kernel sources
>       perf tools: Add support for perf_event_attr::config4
>       perf docs: arm-spe: Document new SPE filtering features
> 
>  drivers/perf/arm_spe_pmu.c                |  37 +++++++++++
>  include/uapi/linux/perf_event.h           |   2 +
>  tools/include/uapi/linux/perf_event.h     |   2 +
>  tools/perf/Documentation/perf-arm-spe.txt | 104 +++++++++++++++++++++++++++---
>  tools/perf/tests/parse-events.c           |  13 +++-
>  tools/perf/util/parse-events.c            |  11 ++++
>  tools/perf/util/parse-events.h            |   1 +
>  tools/perf/util/parse-events.l            |   1 +
>  tools/perf/util/pmu.c                     |   8 +++
>  tools/perf/util/pmu.h                     |   1 +
>  10 files changed, 170 insertions(+), 10 deletions(-)
> ---
> base-commit: 081006b7c8e19406dc6674c6b6d086764d415b5c
> change-id: 20250312-james-perf-feat_spe_eft-66cdf4d8fe99
> 
> Best regards,
> -- 
> James Clark <james.clark@linaro.org>
> 

