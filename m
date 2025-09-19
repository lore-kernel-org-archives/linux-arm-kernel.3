Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC8FCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 14:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZIH1+VId2V0kwfo2oejHmAl8OhAnfxz6ssL67G6sYs=; b=izUlpkh2qK4dyYldIoNeM6PI7P
	7VmJDNH74zPJjmdza9he99liYeEROYQQOu8Q8ZM6YpsvkNNy86iZvdq1d73OlN4PGANO6RRptZjol
	BmKYwU6NgKXDTLC24lH51b0khPk5l8XgiYgW95FzLqh6D9Dd0WaRwgCkdxtAB57bQDsrzE3lwP+j5
	FHIet0xPtM7LLiv6rySukjeCPU82Rg9IzuLXK7JbpP/YoduGPRB/1OQS6dgWwOvOtJnwsVfuOSySV
	v+Bggc/ZQB7NuaMHdehDTSVxsMQO6BMy8HMvPZzX915sWYIKQjWENb8WJhJ2ypX7iR5ZA7ORtQX5H
	e5ncSisw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzc10-0000000377p-0jVy;
	Fri, 19 Sep 2025 14:23:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzc0u-0000000373p-2rXw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 14:23:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 06B21601F6;
	Fri, 19 Sep 2025 14:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5554C4CEF0;
	Fri, 19 Sep 2025 14:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758291783;
	bh=MfwfWkTjerbB+d0i0G5HNE7kmzRVIYGXEQB1Ikndv9k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ix+5Ng0c5FySNsg5NyTGgDyZXSKOJoVks2r1a3pdh4TAmjDqenF/d02gxLt54YdXx
	 ZQRhNpdGL26W7TlRy/7uNemM3pYEgibOnzl6bQu4FZ3rVEiKbEmngfKVPWAHYLM+Oh
	 qlyonPjHkdOxhtyJybFwOeK4NmvzisXgHcRTYfyZbdUXUtnkn0TNN8Gws7MY6JdYP3
	 ITsyHzAYKOcfyf4N9NTQxAyyQSM3CN9dLUkb4h+icuMYUlBzScChPaVA/9U94itbK3
	 ey9jB1yIFk/I1R6hJ7bKg6s7Q2tc1CYNv0sKk/0IadPKpH7mmpZcf9ZmKjx+MEipKL
	 7xOxyNA/aeODg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uzc0r-00000007noh-0mIt;
	Fri, 19 Sep 2025 14:23:01 +0000
From: Marc Zyngier <maz@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
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
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: (subset) [PATCH v8 07/12] KVM: arm64: Add trap configs for PMSDSFR_EL1
Date: Fri, 19 Sep 2025 15:22:57 +0100
Message-ID: <175829175713.1763751.2418893976885655605.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250901-james-perf-feat_spe_eft-v8-7-2e2738f24559@linaro.org>
References: <20250901-james-perf-feat_spe_eft-v8-0-2e2738f24559@linaro.org> <20250901-james-perf-feat_spe_eft-v8-7-2e2738f24559@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, corbet@lwn.net, oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, peterz@infradead.org, mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, leo.yan@arm.com, anshuman.khandual@arm.com, james.clark@linaro.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Mon, 01 Sep 2025 13:40:36 +0100, James Clark wrote:
> SPE data source filtering (SPE_FEAT_FDS) adds a new register
> PMSDSFR_EL1, add the trap configs for it. PMSNEVFR_EL1 was also missing
> its VNCR offset so add it along with PMSDSFR_EL1.
> 
> 

Applied to next, thanks!

[07/12] KVM: arm64: Add trap configs for PMSDSFR_EL1
        commit: 557c82a4480719f64cf6530b5090001e9d908904

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



