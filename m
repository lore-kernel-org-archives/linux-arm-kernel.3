Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1080CD77880
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 16:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ErXY6nxOxUwUsvSRdSz14VL8yK1jnSnBdUVB671MQ98=; b=Cn1e+mti4M4sZSHokO5zGlvFSL
	amqSS+kCk55+7SBS3lmTCE4dbEDO86ZjRq+amPfLaaRHru1XELEGEQFLz32db84CpZo2MXb+kYsLc
	gCKbpO0k6qxA5Sri1D10DT5nqn0OHcVfcA6RJf/UbVHi55Y5QUe1mpAqX9D5ETFcZ0Z4MJULVz5ab
	mIPU/SOlXvleGOSTjCb8EfW04gHzsNt/sn+2o+sQkXLiUrmkIyQLXPx3KYUPJKOLtcz80qvufqLSY
	ZLo/v1kjqZH7qg9U0+vLe9D3JH0yJ+GFDWOWMAtGEy9Ioi7OtgyLL96m2seXDbZWRSxcnrljGHIht
	0c0SeoaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKNH-00000009DzA-2g7N;
	Fri, 23 Jan 2026 16:51:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKNE-00000009DyG-3cdF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 16:51:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEDB41476;
	Fri, 23 Jan 2026 08:50:55 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE1153F694;
	Fri, 23 Jan 2026 08:51:00 -0800 (PST)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: alexandru.elisei@arm.com,
	andrew.jones@linux.dev,
	eric.auger@redhat.com,
	joey.gouly@arm.com,
	maz@kernel.org,
	kvmarm@lists.linux.dev,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [kvm-unit-tests PATCH v6 00/14] arm64: EL2 support
Date: Fri, 23 Jan 2026 16:50:39 +0000
Message-Id: <20260123165053.2250754-1-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_085104_955717_2821AFF0 
X-CRM114-Status: GOOD (  11.30  )
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

Hi all,

This series is for adding support to running the kvm-unit-tests at EL2.

Changes since v5[1]:
	- make debug bp/wp skip on EL2
	- fix microbench test
	- add to CI
	- applied the fixup's Drew talked about in v5

About this failure in micro-bench:

	- micro-bench hits the assert in gicv3_lpi_alloc_tables()
		lib/arm/gic-v3.c:183: assert failed: gicv3_data.redist_base[cpu]: Redistributor for cpu0 not initialized. Did cpu0 enable the GIC?	

in micro-bench.c lpi_prep() looks like this:

	static bool lpi_prep(void)
	{
	        struct its_collection *col1;
	        struct its_device *dev2;
	        if (!gicv3_its_base())
	                return false;

QEMU by default runs with gic-v2, so gicv3_its_base() should have returned
false and the lpi tests skipped. However because of the overflow mentioned in
the first commit (new to v6), the its_data.base was being overwritten to a
non-zero value.  This meant the test tried to do gic-v3 things on a gic-v2.

Thanks,
Joey

[1] https://lore.kernel.org/kvmarm/20260114115703.926685-1-joey.gouly@arm.com/


Alexandru Elisei (2):
  arm64: micro-bench: use smc when at EL2
  arm64: selftest: update test for running at EL2

Joey Gouly (12):
  arm64: fix overflow in gic-v2 initialisation
  arm64: set SCTLR_EL1 to a known value for secondary cores
  arm64: drop to EL1 if booted at EL2
  arm64: efi: initialise SCTLR_ELx fully
  arm64: efi: initialise the EL
  arm64: timer: use hypervisor timers when at EL2
  arm64: micro-bench: fix timer IRQ
  arm64: pmu: count EL2 cycles
  arm64: run at EL2 if supported
  arm64: add EL2 environment variable
  arm64: debug: skip tests at EL2
  arm64: gitlab-ci: add EL2 tests to CI

 .gitlab-ci.yml             | 30 +++++++++++++++++
 arm/cstart64.S             | 66 ++++++++++++++++++++++++++++++++++++--
 arm/debug.c                | 10 ++++++
 arm/efi/crt0-efi-aarch64.S |  5 +++
 arm/micro-bench.c          | 26 +++++++++++++--
 arm/pmu.c                  | 13 +++++---
 arm/run                    |  9 ++++++
 arm/selftest.c             | 23 ++++++++++---
 arm/timer.c                | 12 +++++--
 lib/acpi.h                 |  2 ++
 lib/arm/asm/setup.h        |  8 +++++
 lib/arm/asm/timer.h        | 11 +++++++
 lib/arm/gic.c              | 17 ++++++----
 lib/arm/setup.c            |  4 +++
 lib/arm/timer.c            | 19 +++++++++--
 lib/arm64/asm/sysreg.h     | 19 +++++++++++
 lib/arm64/processor.c      | 14 ++++++++
 scripts/arch-run.bash      |  5 +++
 18 files changed, 266 insertions(+), 27 deletions(-)

-- 
2.25.1


