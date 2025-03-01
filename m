Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773B7C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 07:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+XlLjospi/pTgO4kQI2VjN8VjdTkjc4zyHpzF3bj1eU=; b=e/o52GAsXDeyydk+UC0yIudaqC
	HOI7ok3WOGirbZeoHxGvy0z0oo+7vNjRxWzg23acNkz0CTZV/OlZc85++fdNIb5B+v8NgynBivk1j
	J1+AhZ1tm4CNb/oXxFIMbmDzf2LqQmFUmA1nJ1iWFHfQG2Yldn8Kpop0kuKzLhIMQGWzJL14XtNs3
	Bu0XlvL3ZS1R0bcSydEAPC4jRL85nHnLjzMuA3jSS7g68MmYweU+yF0Vv90uMIDaF/jyf/8Sdm46G
	D5o5AKilC+muOKVRhw46i8Aukv9eIfHAAWJK0hLxthDc+9NDHqPw8jPMLn2eJvt54KWiBzKLLV/dv
	VN0pHUdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toGzX-0000000DY8V-3qG9;
	Sat, 01 Mar 2025 07:10:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toGun-0000000DXOZ-1RKo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 07:05:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0ABDB5C04BD;
	Sat,  1 Mar 2025 07:03:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A97C4CEE5;
	Sat,  1 Mar 2025 07:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740812736;
	bh=+fhqb2OIeApH9GqBSR9/bHlgcwJ4dCJAUctYxXvGHYg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DZtZgzDeox7blJGzCTytvlYuN5NP0CFoYki+ophtf02ztIfhu/1AKHYqsWYIX2cxm
	 Pmar+FfLsz6PzA/fxnXx7TimQN9YnfriWup5AChiRqpZObzVJ5sOEicRyNSm51W1id
	 5bdDX+Znij/+CYescJwwOr+GEU2yrwc1AryFBAKf8mOryLBvFARkvBh9fC2uB4Wnwf
	 zpFJFhCobDOZqSjO56dd1RNLIEcCnDD6br/mHEddETFd6u9kwQsxHwUe76tx0TAS+l
	 vYX7rTUlSg0iroXbbpOhUzq8nGWWY21upMM+nL+rGjsXxdIeoWjGOv+gt2fMF0VUmR
	 Qwccz0LEaUWMA==
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Leo Yan <leo.yan@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v20 00/11] arm64/perf: Enable branch stack sampling
Date: Sat,  1 Mar 2025 07:05:24 +0000
Message-Id: <174080569248.3208873.17639032755999041028.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250218-arm-brbe-v19-v20-0-4e9922fc2e8e@kernel.org>
References: <20250218-arm-brbe-v19-v20-0-4e9922fc2e8e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_230537_421635_73701DBC 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
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

On Tue, 18 Feb 2025 14:39:55 -0600, Rob Herring (Arm) wrote:
> This series enables perf branch stack sampling support on arm64 via a
> v9.2 arch feature called Branch Record Buffer Extension (BRBE). Details
> on BRBE can be found in the Arm ARM[1] chapter D18.
> 
> I've picked up this series from Anshuman. v19 and v20 versions have been
> reworked quite a bit by Mark and myself. The bulk of those changes are
> in patch 11.
> 
> [...]

Applied cleanups to will (for-next/perf), thanks!

[01/11] perf: arm_pmuv3: Call kvm_vcpu_pmu_resync_el0() before enabling counters
        https://git.kernel.org/will/c/04bd15c4cbc3
[02/11] perf: arm_pmu: Don't disable counter in armpmu_add()
        https://git.kernel.org/will/c/dcca27bc1ecc
[03/11] perf: arm_pmuv3: Don't disable counter in armv8pmu_enable_event()
        https://git.kernel.org/will/c/4b0567ad0be5
[04/11] perf: arm_v7_pmu: Drop obvious comments for enabling/disabling counters and interrupts
        https://git.kernel.org/will/c/7a5387748215
[05/11] perf: arm_v7_pmu: Don't disable counter in (armv7|krait_|scorpion_)pmu_enable_event()
        https://git.kernel.org/will/c/7bf1001e0d91
[06/11] perf: apple_m1: Don't disable counter in m1_pmu_enable_event()
        https://git.kernel.org/will/c/c2e793da59fc
[07/11] perf: arm_pmu: Move PMUv3-specific data
        https://git.kernel.org/will/c/dc4d58a752ea

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

