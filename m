Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01C6CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 21:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Uo1Q+JyKjzqklMUSlgpFqPoc/n+0/uEkDESFH1+iV3M=; b=01ywzQPx8/iCjH
	5O0jIfqSmRv/Oe6M8YUhKMNnSWz3KNxxunBTc6s6hkmVL9M70YsbiSiEq7NSBqeJTMP6uWcNr1IlR
	7HuE2dsp043NkDMDbS2uUE1uygcdGYwLjXbmCG8XKZohrMEuM32anhMrkWKBiV6LeVo6GKo0v79Yj
	0xvsaLsKvi+HOOvU37F5rKc2UCY0Tn/XvJxkC1z4rii0XQX5gZ7COlbuEGi2qKS1/hQ7PerrcZ1Ei
	9WYIys8YidR28Pdz3Mu20woG5ELbp9Zlg8IW6NFsT4FCncHKzDrYJtX0NvRO7e9pyABN1TCCJi85P
	g1Q75x/YS+GW9u3pAGgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHpDb-00000004412-1Sgr;
	Fri, 16 Oct 2026 21:11:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHpDX-0000000440A-30sb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 21:11:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD9F914BF;
	Fri, 16 Oct 2026 14:11:50 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E27C3F673;
	Fri, 16 Oct 2026 14:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792185114; bh=dsXT5fLLEfFPy9a4CG9YHn/vrX1wJDM9KohaEcRDfBg=;
	h=From:Subject:Date:To:Cc:From;
	b=dPVuiv3E6QcGGRi0I8/8Qunhdh/9Fvh4pxI2q+3sCT0k87DQBr5c7A8KrOmm4YlZP
	 xr07TjQA1RIJNnZyCk3Wpu1VkSCJhzXhGMG6JAJ25LBeUiM4Ti5g2Z4UJQUImPthfh
	 Hz+SpBl0ll0fadNvipL8ZTkEkRKMlnLCVgS66XPg=
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2 00/11] coresight: trbe: Refactor buffer handling and add
 trigger support
Date: Fri, 16 Oct 2026 22:11:38 +0100
Message-Id: <20261016-trbe_buffer_refactor_v2-v2-0-383ac26382fa@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAuT0moC/3WP3WqEMBCFX0VyXUt+NEYpy75HWWSSTLqBVbuJK
 y3LvntHxctCIDmZmfOdebKMKWJmXfFkCZeY4zSSkG8Fc1cYv7CMnjSTXGquRVPOyWJvHyFg6hM
 GcPOU+kWWxgiFSgWPxjKa/qZi/NmcPy+krzFT5+8GWuT6u3s2Qv/rSYeXFW+lNFULba3PkIZ3N
 w3s8toRCe8PyjzvHDZgzrBl7oqP1V7wwx5HsDfsfczbHdO9p/08PQ/ijlOhblxQom2tOHCndSE
 LGUsSQ5y7QlXKBWetQhe8NRygbjRU0rgAyuoafGOUqSQFff0B6t+eHGQBAAA=
X-Change-ID: 20260617-trbe_buffer_refactor_v2-8813e33fde8b
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792185112; l=5167;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=dsXT5fLLEfFPy9a4CG9YHn/vrX1wJDM9KohaEcRDfBg=;
 b=HQmpywo/iu7/80eeDg3wxKMvF63OdxAFFn42fksScyDKp6q87KvphQB0dybS8L0ciFsd7dEZX
 8OOPvIGiBfYB1YqeAFMhmtR4W3UKp0b0AWyhf8SglR9bK9es8Ir+Kj0
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_141155_938453_676DA8A0 
X-CRM114-Status: GOOD (  10.40  )
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

TRBE currently stops trace collection at each buffer limit, so interrupt
latency can cause trace loss. This series adds trigger-based maintenance
and WRAP mode to reduce these gaps, while protecting unconsumed data and
retaining limit-based handling where required by errata.

The perf changes preserve decoder state across contiguous indexed AUX
fragments, with resets when continuity cannot be established. Thread
stacks still flush at each data block boundary. For normal recording, a
quarter-buffer watermark wakes userspace earlier.

The 11 patches cover:

  Patches 01-02: Next-buffer computation cleanup and refactoring.
  Patches 03-07: Trigger support, headroom, save/restore, and KUnit tests.
  Patches 08-11: Decoder continuity and earlier userspace wakeups.

This series is based on coresight-next and requires
"coresight: trbe: Refactor buffer and IRQ handling" [1] to be applied first.

This series has been tested on the Orion6 board with TRBE and the
Juno-r2 board with ETR using the following commands:

  perf record -e cs_etm// -a -- bash -c 'for i in {1..5}; do timeout 0.1 yes > /dev/null; sleep 0.1; done'
  perf script --itrace=i1000iTZ

[1] https://lore.kernel.org/linux-arm-kernel/20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com/

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Changes in v2:
- Split the enable/disable, perf-handle lifecycle, and IRQ handling fixes
  into the separate prerequisite series, leaving 11 patches here.
- Restrict KUnit buffer and padding stubs to the synthetic test handle,
  preserving normal buffer lookup and AUX accounting for real perf IRQs.
- Centralize decoder-reset decisions in cs_etm__get_trace(), while
  retaining thread-stack flushing at every data block boundary.
- Reset per-thread decoders for unknown or changed CPUs, preserve CPU
  metadata on all split pieces, and retain resets through empty fragments.
- Reset the decoder on logical AUX offset discontinuities, including
  clipped snapshots and missing AUX records, while preserving continuity
  across internal buffer splits.
- Link to v1: https://lore.kernel.org/r/20251201-trbe_buffer_refactor_v1-1-v1-0-7da32b076b28@arm.com

---
Leo Yan (11):
      coresight: trbe: Remove misleading comment
      coresight: trbe: Refactor next buffer computation
      coresight: trbe: Track trigger count support per CPU
      coresight: trbe: Use trigger mode for buffer maintenance
      coresight: trbe: Leave headroom for stop-on-trigger mode
      coresight: trbe: Save and restore trigger counter
      coresight: trbe: Add KUnit tests for compute normal buffer
      perf cs-etm: Reset decoder on COLLISION flag
      perf cs-etm: Reset per-thread decoder on CPU migration
      perf cs-etm: Reset decoder on AUX offset discontinuity
      perf cs-etm: Set watermark for AUX trace

 drivers/hwtracing/coresight/Kconfig                |  15 +
 .../coresight/coresight-trbe-kunit-tests.c         | 644 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-trbe.c       | 342 ++++++++---
 drivers/hwtracing/coresight/coresight-trbe.h       |  18 +
 tools/perf/arch/arm/util/cs-etm.c                  |  15 +
 tools/perf/util/auxtrace.h                         |   2 +
 tools/perf/util/cs-etm.c                           |  92 ++-
 7 files changed, 1029 insertions(+), 99 deletions(-)
---
base-commit: 343cfcbb3ecfdb80aa576a428cfa3b65ad783842
change-id: 20260617-trbe_buffer_refactor_v2-8813e33fde8b
prerequisite-message-id: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
prerequisite-patch-id: 295f75af9986fc6193b0f3ec0f144096c1194efd
prerequisite-patch-id: 60541bcf6bd25acf076fca2dd2e62ea382541fd5
prerequisite-patch-id: 0a6dbd3a69611c9bdca8ad61ea943d6577251fb8
prerequisite-patch-id: 0f4dc971d1375cd5672a63cd148b6e7f6dfdd9b3
prerequisite-patch-id: b42114d2185bbd15c9095191417aad34137cc5e9
prerequisite-patch-id: fdcdce0d19c611de475c6e9737ef544a9fb19153
prerequisite-patch-id: 948b6aa1254adfc9f89a5aba3ef45e41d891debe
prerequisite-patch-id: ba1cc65a72bcfef9e22fea14f52eeaeeb2c551d3
prerequisite-patch-id: d0efcfbe7d1f7886aaa5c34655c14a979bf55863
prerequisite-patch-id: af045abf5718e35f16a5b98ec7c04213cf24d426
prerequisite-patch-id: d0af1d9f5551622858815d148de5dc3c94cdf564
prerequisite-patch-id: 9d02a95ecafda17debf728ef1098b98030019a10
prerequisite-patch-id: c6251f03223c3bd4bcf43abc292907dd93cad527
prerequisite-patch-id: 690af6c1769b93d8712aa73b322bb4e5f0acdc66
prerequisite-patch-id: 21c3d8dacd550b977ae549a1865e43523ed64f98
prerequisite-patch-id: 0b5666068c0fed73e6906473b38861556881e5b0
prerequisite-patch-id: f5c97c9acc3e691b3612999eae97c3366acf3d97
prerequisite-patch-id: 55846a3b80ca3196062d06522af768ac83751d97
prerequisite-patch-id: 5f5be1d1c925a9c0d945eba516a9075153045292
prerequisite-patch-id: 8e39271308702e557abc4e4e79fc96d0157844a7
prerequisite-patch-id: b99199a58c4a87408c4c2b0b39ee4861f5cd9d80
prerequisite-patch-id: 1bdbfe0417a4a98984b2fbe8d664738657de3032
prerequisite-patch-id: aeab33675e29539d239c8ffdf4bbd4cf861972c6

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


