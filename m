Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13172F483CC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 16:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7E4iGggLEZtKPGI1B8dQZnNuGnRx8L/h6RWX6sEq+Wk=; b=J3iBcQQj4gbitllWxR+KV3ad3G
	w+AuhybretdA/JhMg8MrZscVgn8C3KMP1UgZRUksFGgqQodKUkRB4C7jCpKD7axqJLwUslPuPNcIg
	lnlmzRVS24c/ZiFLcWKabl1mDTHodPJ17dVzs/fR1Are9oLQCwNPMTTR6uAUE0qGNRGDAeUg48A1K
	d8Z1RijcytP79CdFaICHaEWfxvM+Q2+cEEtENVSHmIb+1Hj6GQtkBgrT7oxjpvPnk41Ir6YxTFOc4
	WlKFlE6aYDunER9ezyfz1gby2i7tQEntWOMuADKMEyaaor3r+E4h20pcdyi9kCtXRKsSwxmJtPCDV
	rHWj06RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4i4h-0000000H7sH-2Prx;
	Mon, 23 Mar 2026 16:24:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4i4e-0000000H7qx-2Fxm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 16:24:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5D2114BF;
	Mon, 23 Mar 2026 09:24:06 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 44CAD3F73B;
	Mon, 23 Mar 2026 09:24:11 -0700 (PDT)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	kvmarm@lists.linux.dev
Subject: [PATCH v3 0/5] arm64: Work around C1-Pro erratum 4193714 (CVE-2026-0995)
Date: Mon, 23 Mar 2026 16:24:00 +0000
Message-ID: <20260323162408.4163113-1-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_092416_622258_880FDF68 
X-CRM114-Status: UNSURE (   9.86  )
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

Here's version 3 of the workaround for C1-Pro erratum 4193714. Version 2 was
posted here:

https://lore.kernel.org/r/20260318191918.2653160-1-catalin.marinas@arm.com

Main changes since v2:

- Renamed the config option, cpucap and SMCCC macro to include the
  '4193714' suffix instead of 'SME_DVMSYNC'

- Pushed smp_processor_id() into sme_{set,clear}_active()

- Updated silicon-errata.rst

- Moved the CPU part definition to a separate patch

Erratum description:

Arm C1-Pro prior to r1p3 has an erratum (4193714) where a TLBI+DSB
sequence might fail to ensure the completion of all outstanding SME
(Scalable Matrix Extension) memory accesses. The DVMSync message is
acknowledged before the SME accesses have fully completed, potentially
allowing pages to be reused before all in-flight accesses are done.

The workaround consists of executing a DSB locally (via IPI)
on all affected CPUs running with SME enabled, after the TLB
invalidation. This ensures the SME accesses have completed before the
IPI is acknowledged.

This has been assigned CVE-2026-0995:

https://developer.arm.com/documentation/111823/latest/

Catalin Marinas (4):
  arm64: tlb: Introduce __tlbi_sync_s1ish_{kernel,batch}() for TLB
    maintenance
  arm64: tlb: Pass the corresponding mm to __tlbi_sync_s1ish()
  arm64: cputype: Add C1-Pro definitions
  arm64: errata: Work around early CME DVMSync acknowledgement

James Morse (1):
  KVM: arm64: Add SMC hook for SME dvmsync erratum

 Documentation/arch/arm64/silicon-errata.rst |  2 +
 arch/arm64/Kconfig                          | 12 +++
 arch/arm64/include/asm/cpucaps.h            |  2 +
 arch/arm64/include/asm/cputype.h            |  2 +
 arch/arm64/include/asm/fpsimd.h             | 21 +++++
 arch/arm64/include/asm/mmu.h                |  1 +
 arch/arm64/include/asm/tlbflush.h           | 50 ++++++++++--
 arch/arm64/kernel/cpu_errata.c              | 30 +++++++
 arch/arm64/kernel/entry-common.c            |  3 +
 arch/arm64/kernel/fpsimd.c                  | 89 +++++++++++++++++++++
 arch/arm64/kernel/process.c                 |  7 ++
 arch/arm64/kernel/sys_compat.c              |  2 +-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c       | 17 ++++
 arch/arm64/tools/cpucaps                    |  1 +
 include/linux/arm-smccc.h                   |  6 ++
 15 files changed, 236 insertions(+), 9 deletions(-)


