Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439EC1077604
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 19:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EPIHHvtX9fAfHhKsC/NjKwfiF5fq6YCcNUUfN5sJ8As=; b=WUZukpUgFVtni49hzT8pUJ8sHt
	6whxW53Mx9iVihBRGKKpl3BYsNfw99layzAzKrZ53CUA7tEYU5A+2+bw6JRovlTNZv5+5ciDxwB5h
	cGjgtMfo+UwojcsN0IGtBLL9+vSx5pth8xL5kUw/7mEK6fNJlRwtACEkFTsJ7+nv7nYvPFES1a6pH
	OJSpWBsWJUu7Q5xzH3RO38Lm9v4VZuOV/rluJiPe6mWDLjFOy+0113db9GuuVzUbaVTJMmRKXC1Se
	S34a5dgRMvKrVMm2Huqz4r+I9Lnbh7tfWZtYtNwTHGTNa7JY5N7JHYGBDhejQPS5B4bmkEAKZmkrN
	bwz/Jpkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2wQT-00000009Dow-2cSz;
	Wed, 18 Mar 2026 19:19:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2wQQ-00000009DnG-0qCZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 19:19:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 819CF1BF7;
	Wed, 18 Mar 2026 12:19:15 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB4863F73B;
	Wed, 18 Mar 2026 12:19:19 -0700 (PDT)
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
Subject: [PATCH v2 0/4] arm64: Work around C1-Pro erratum 4193714 (CVE-2026-0995)
Date: Wed, 18 Mar 2026 19:19:12 +0000
Message-ID: <20260318191918.2653160-1-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_121926_378015_1B3DBD12 
X-CRM114-Status: GOOD (  15.39  )
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

That's version 2 of the workaround for C1-Pro erratum 4193714. Version 1
was posted here:

https://lore.kernel.org/r/20260302165801.3014607-1-catalin.marinas@arm.com/

The logic is pretty much the same, we use a global sme_active_cpus mask
to track which CPUs run in user-space with SME enabled and an IPI is
sent to those CPUs to synchronise the TLB maintenance.

Main changes since v1:

- The workaround won't be enabled if SME is disabled

- Replace the __tlbi_sync_s1ish(NULL) calls from arch_tlbbatch_flush()
  with a dedicated __tlbi_sync_s1ish_batch() function

- Dropped the DMB in sme_set_active() before returning to user, replaced
  it with a comment and a link to the list discussion on why it is not
  necessary

- Use alternative_has_cap_unlikely() instead of cpus_have_final_cap()
  since it's a local CPU erratum feature and only used after the
  capabilities have been finalised

I'll post a separate RFC patch (linked here) showing how using a per-mm
cpumask looks like. The downside of that approach is that
arch_tlbbatch_add_pending() will require a DSB, practically cancelling
any TLBI batching for unaffected CPUs. Yet another option would be to
add a struct mm and some flag in struct arch_tlbflush_unmap_batch and
use full global broadcast if more than one mm is targeted or
mm_cpumask() otherwise. Given that this is used on the TTU path, it's
possible to have more than one owner of an unmapped page. I haven't done
any assessment how of this would happen.

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

Thanks.

Catalin Marinas (3):
  arm64: tlb: Introduce __tlbi_sync_s1ish_{kernel,batch}() for TLB
    maintenance
  arm64: tlb: Pass the corresponding mm to __tlbi_sync_s1ish()
  arm64: errata: Work around early CME DVMSync acknowledgement

James Morse (1):
  KVM: arm64: Add SMC hook for SME dvmsync erratum

 arch/arm64/Kconfig                    | 12 ++++
 arch/arm64/include/asm/cpucaps.h      |  2 +
 arch/arm64/include/asm/cputype.h      |  2 +
 arch/arm64/include/asm/fpsimd.h       | 21 +++++++
 arch/arm64/include/asm/mmu.h          |  1 +
 arch/arm64/include/asm/tlbflush.h     | 50 ++++++++++++++---
 arch/arm64/kernel/cpu_errata.c        | 30 ++++++++++
 arch/arm64/kernel/entry-common.c      |  3 +
 arch/arm64/kernel/fpsimd.c            | 81 +++++++++++++++++++++++++++
 arch/arm64/kernel/process.c           |  7 +++
 arch/arm64/kernel/sys_compat.c        |  2 +-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 17 ++++++
 arch/arm64/tools/cpucaps              |  1 +
 include/linux/arm-smccc.h             |  5 ++
 14 files changed, 225 insertions(+), 9 deletions(-)


