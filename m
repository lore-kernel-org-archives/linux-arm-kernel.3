Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620ABD39406
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 10:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2NGSEAaMAlCwLL/MoCvtxuUdGXcrFtaMt1M5+uXFCss=; b=IPoCXnE+GgIEwQzH8zS7pkXz7B
	lWf1WBP9lhzfWTmHv5CWBwojeYNrPLFqoVcXbJeIHCHdLlytG952Q5RxxL4F7jd4O/SGh678JmDEY
	sUUMqxb07o4AMIBuhGrN6BscA//uoONe3LrMrv/2ZDQjGvjX6mRA7VUxdwZ0YouZuyulKqB9M18T5
	cWgf7Ym1XKT2O3lQeGBP0zpyjx1mo/jvgXu1eRU6Joc+ShTSkoQ8UKi+HWZYQhLcIHeKGkcrk0scW
	85YtmHlTF7j0lF1wcPfe8raN3Lb5UDRf7KCWCtZJwJz3+9BSyWQACdir6GzHZp4N7Uq5kNvBzYhE3
	YHbvIBPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8F2r-0000000HNfD-2G6F;
	Thu, 02 Apr 2026 10:13:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8F2l-0000000HNbI-43y0
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 10:12:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=2NGSEAaMAlCwLL/MoCvtxuUdGXcrFtaMt1M5+uXFCss=; b=YzfgRvIpB1MC0ecE/XdIR0rUsd
	b1thZtTcSeySEqa7NnEa0E28PdAHD67r6kuCecn1hb8cnrfin1a3P/pnRXGa+TCK6BUoYCudccNt3
	rgzIllMZG2o7Of6Bk9s14aXES8FaWdbiri8//Ve7v9zFb8JCfqNGqkBRlyrLVQ9MVrJlHoJOCWhbZ
	KL2oPAmzopfJ3M5Nx7JZqoLEnqey5LRqT3Xc1nvKZKRSe9Itnt7/yGRvLP+3s4iQlHzSl0YvF+aRs
	M+aQ6RdsB9RqRdcFCWIifnDMYKfNDiHD8nOsA9fzxepBEXzkgKXhMTG05EZKKHlP0fQ19NK2wbc4e
	ae7EfVYQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8F2h-00000002DJK-4A0F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 10:12:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25DAC2C43;
	Thu,  2 Apr 2026 03:12:44 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E2FE13F915;
	Thu,  2 Apr 2026 03:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775124769; bh=gMkdj72tTWqp5MNCSgd7FUlXbpiNeyU9WUoFZj6vYiA=;
	h=From:To:Cc:Subject:Date:From;
	b=E3UFe2UmXpmbzwbR8ugAmNPfdOzIcJ2cgXcmmoZb6MCcZyxKduAMIWV8R+KLwXYPZ
	 OkOgQsRV0VB+NZDKc89nqwC/XH+KJ561A0CgB5rZPEcDwrDkjlTDf5ZBh84IJnUf2F
	 S/G1LWH0+XijbQ5+jg7Ttu4DN2rLPIkU6sLHWE8A=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 0/4] arm64: Work around C1-Pro erratum 4193714 (CVE-2026-0995)
Date: Thu,  2 Apr 2026 11:12:40 +0100
Message-ID: <20260402101246.3870036-1-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_111252_570350_EC4BA4A4 
X-CRM114-Status: GOOD (  14.42  )
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

Here's version 4 of the workaround for C1-Pro erratum 4193714. Version 3
was posted here:

https://lore.kernel.org/r/20260323162408.4163113-1-catalin.marinas@arm.com

The most significant change since v3 was the drop of the global
sme_dvmsync_cpus mask in favour of mm_cpumask(). Sashiko reported a
potential DoS if a malicious app does an madvise(MADV_PAGEOUT)
continuously. This would trigger a flood of IPIs to unrelated apps that
run at EL0 with SME on. We knew about this and deemed it low risk but I
thought I'd do some testing. On a Raspberry Pi 4 (no SME but hacked the
kernel to assume workaround always on) I can get about 30% drop in the
victim throughput due to the IPIs.

Since using mm_cpumask() to track which threads of an app run in
user-space with SME enabled, we can drop the MMCF_SME_DVMSYNC flag as
well. One downside is that arch_tlbbatch_add_pending() now needs a DSB
before checking the mm_cpumask() if the workaround is enabled. The
actual IPI is still batched. On hardware where this erratum is present
(small number of CPUs), I don't expect this to be noticeable.

Other changes since v3:

- Included acks from Mark Rutland but dropped it for the forth patch as
  it was heavily reworked.

- Dropped the KVM workaround due to conflicts with next. I'll rebase
  this patch it after -rc1. I also dropped the KVM and SMCCC people from
  cc until the KVM part will be posted.

- Added a raw_spin_lock() around the sme_enable_dvmsync() function and
  cpumask allocation. This function is called simultaneously on multiple
  CPUs via stop_machine(). In practice, CONFIG_CPUMASK_OFFSTACK is
  likely off on such hardware and no allocation needed.

I'll push the patches provisionally to for-next/c1-pro-erratum-4193714
for some exposure in -next. It doesn't necessarily mean they'll go
upstream for 7.1-rc1.

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

 Documentation/arch/arm64/silicon-errata.rst |  2 +
 arch/arm64/Kconfig                          | 12 +++
 arch/arm64/include/asm/cpucaps.h            |  2 +
 arch/arm64/include/asm/cputype.h            |  2 +
 arch/arm64/include/asm/fpsimd.h             | 21 +++++
 arch/arm64/include/asm/tlbbatch.h           | 10 ++-
 arch/arm64/include/asm/tlbflush.h           | 96 +++++++++++++++++++--
 arch/arm64/kernel/cpu_errata.c              | 30 +++++++
 arch/arm64/kernel/entry-common.c            |  3 +
 arch/arm64/kernel/fpsimd.c                  | 90 +++++++++++++++++++
 arch/arm64/kernel/process.c                 | 37 ++++++++
 arch/arm64/kernel/sys_compat.c              |  2 +-
 arch/arm64/tools/cpucaps                    |  1 +
 13 files changed, 297 insertions(+), 11 deletions(-)


