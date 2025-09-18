Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4492CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 16:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p11Y5JXmqdlFdSGugeLR1g3a70K+tYO61MErIJp98Ts=; b=tdFN6vsBne+fDAykFRLU9FQ1CR
	g/j+WQ4Rs6aEHnONnhgk1/z5+rrzmloLzOgDPMvry/xluzXKQ4OUJQKpLHAbg3kK/E/M08u+jyTw9
	NOeO0t4mFAO3IwaXYRWykdW/8Yv0LOVB4vlpZHaYP1BhMs/zMh1KOIJoF9KWiYnGbNyd41ekux7iY
	xAshMbOEsgWNEw/oWcmy1Qi3JOjIeXfPX/JWQUxNjplidqWOUap8o6uUsEmahKfxKo8A/NMSb0c+g
	gruRpA190ABne8U5oUU+GwUFCM88QyXHNplCvmwltQmuB/SE0FMerQbwyPgYmIrVpmbQjhMSiMGcQ
	qDgubNPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHjJ-00000000f01-0Ypv;
	Thu, 18 Sep 2025 16:43:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHjG-00000000ey1-31PH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 16:43:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6CB4243C34;
	Thu, 18 Sep 2025 16:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD63C4CEE7;
	Thu, 18 Sep 2025 16:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758213810;
	bh=h9r87sKSL8lye2f7s8CYcNKEjCq+sl5T4kGt0qLKA3k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OcLwB/3cK+Hq+E9fTHI2F7AqsGyYBmhJhVW+2ehxX2i9V5DZrqNfhwfCZjvaGOjbl
	 rX2srpTymZHXqt3zFrM4lr5DXNUo2WDVcH/pxM+k3Cw2zZQ7cT/aUSHIhqHsVD+ZE2
	 JcmwQRAkRTF1/7p7pVl8Et614GC2LXL/f9IdRyOg1HqOE0x11DS2MNuIBW6G6Bg900
	 CBIW888sSRlyjQuskjphNYG5eD3tBVZmC/SFVp/BRJ8+DdqECfhaVw9Som8m/+SYL9
	 eqORwm725/v2zzuTh2sOxoKf0D9Zysp/61f4NTK7l6aR+NF49JWgs84aZuLeuk/Z/v
	 3GIAyc8byUKlg==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Leo Yan <leo.yan@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	James Clark <james.clark@linaro.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v8 00/12] perf: arm_spe: Armv8.8 SPE features
Date: Thu, 18 Sep 2025 17:43:08 +0100
Message-Id: <175820142456.3469431.6863967464115578024.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250901-james-perf-feat_spe_eft-v8-0-2e2738f24559@linaro.org>
References: <20250901-james-perf-feat_spe_eft-v8-0-2e2738f24559@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_094330_792955_8E2D200C 
X-CRM114-Status: GOOD (  10.77  )
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

On Mon, 01 Sep 2025 13:40:29 +0100, James Clark wrote:
> Support 3 new SPE features: FEAT_SPEv1p4 filters, FEAT_SPE_EFT extended
> filtering, and SPE_FEAT_FDS data source filtering. The features are
> independent can be applied separately:
> 
>   * Prerequisite sysreg changes - patch 1
>   * FEAT_SPEv1p4 - patches 2 - 3
>   * FEAT_SPE_EFT - patch 4
>   * FEAT_SPE_FDS - patches 5 - 9
>   * FEAT_SPE_FDS Perf tool changes - patches 10 - 12
> 
> [...]

I took the first 6 patches but 7 and 8 still need maintainer acks before
I can pick up 9 as well.

Applied to will (for-next/perf), thanks!

[01/12] arm64: sysreg: Add new PMSFCR_EL1 fields and PMSDSFR_EL1 register
        https://git.kernel.org/will/c/a7005ff2d0a5
[02/12] perf: arm_spe: Support FEAT_SPEv1p4 filters
        https://git.kernel.org/will/c/b4401403afb9
[03/12] perf: arm_spe: Expose event filter
        https://git.kernel.org/will/c/51b9f16697cd
[04/12] perf: arm_spe: Add support for FEAT_SPE_EFT extended filtering
        https://git.kernel.org/will/c/dad9603c5ea3
[05/12] arm64/boot: Factor out a macro to check SPE version
        https://git.kernel.org/will/c/510a8fa49dc1
[06/12] arm64/boot: Enable EL2 requirements for SPE_FEAT_FDS
        https://git.kernel.org/will/c/00d7a1af5ab5

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

