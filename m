Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C90CE9B37E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 16:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cPjyCL0gUOlhHaYZxjIiL+oiIsAV0RNsDK/XQD1z6MM=; b=ydQ75OaK7S1Bk3e5LhNQOHmEJL
	xR93lX+GwU7jtZdZ88f60D/Y3yqj3p1xH8HEdGwh/56SF3m7IAcbMiu2ZWs1g4IHF4hibrPG1PFWM
	+jBGB3gz+ZUbpWnrufaQW97O+N83RopO61aApFyM8uwAbDNQ1Mh8Mp7TFaSTG9ffvwHM74cs22J5U
	wSOxwTj4RiObISSJhJmUsux+y684wRQjbwPUt9eTcIzqo2mFxof4ypQFsLQJ5wRHz2UkZ+XOXHBEh
	QO9Lcz/l1m8hmZrkYXOk7SyFypbbmCStklPUOkvOyIAZLUPQabolQw8P5n9dISwX/Ro3rFRRSkHNB
	BFPJNfJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6av-0000000DXci-359Z;
	Mon, 02 Mar 2026 16:58:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx6au-0000000DXcQ-1SyX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 16:58:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 56BFD60008;
	Mon,  2 Mar 2026 16:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFBB7C19423;
	Mon,  2 Mar 2026 16:58:04 +0000 (UTC)
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
Subject: [PATCH 0/4] arm64: Work around C1-Pro erratum 4193714 (CVE-2026-0995)
Date: Mon,  2 Mar 2026 16:57:53 +0000
Message-ID: <20260302165801.3014607-1-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Arm C1-Pro prior to r1p3 has an erratum (4193714) where a TLBI+DSB
sequence might fail to ensure the completion of all outstanding SME
(Scalable Matrix Extension) memory accesses. The DVMSync message is
acknowledged before the SME accesses have fully completed, potentially
allowing pages to be reused before all in-flight accesses are done.

The workaround consists of executing a DSB locally (via IPI)
on all affected CPUs running with SME enabled, after the TLB
invalidation. This ensures the SME accesses have completed before the
IPI is acknowledged.

The first two patches are preparatory: patch 1 adds
__tlbi_sync_s1ish_kernel() to distinguish kernel from user TLB
maintenance; patch 2 passes the mm_struct to __tlbi_sync_s1ish().

Patch 3 implements the actual erratum workaround for the kernel
(non-virtualised) case. It applies only to user mappings and limited to
tasks using SME (tracked via a new MMCF_SME_DVMSYNC flag) and running at
EL0. The smp_call_function() does not need an explicit DSB on the
interrupted CPUs since SCTLR_EL1.IESB=1 forces the completion of SME
accesses when entering the kernel from EL0.

Patch 4 handles the pKVM case. The aim is to ensure the kernel will not
compromise the security of protected guests. pKVM delegates the
workaround to EL3 via an SMC call (to Trusted Firmware-A). The TF-A
patches are provided separately in the project's repository.

Since SME in guests is not currently supported, no additional KVM
workaround needed to prevent guests from exploiting the erratum.

This has been assigned CVE-2026-0995:

https://developer.arm.com/documentation/111823/latest/

Backports available here (no stable-6.12.y since SME is not supported):

https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git errata/c1-pro-erratum-4193714-stable-6.19.y
https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git errata/c1-pro-erratum-4193714-stable-6.18.y
https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git errata/c1-pro-erratum-4193714-android16-6.12-lts

Thanks.

Catalin Marinas (3):
  arm64: tlb: Use __tlbi_sync_s1ish_kernel() for kernel TLB maintenance
  arm64: tlb: Pass the corresponding mm to __tlbi_sync_s1ish()
  arm64: errata: Work around early CME DVMSync acknowledgement

James Morse (1):
  KVM: arm64: Add SMC hook for SME dvmsync erratum

 arch/arm64/Kconfig                    | 12 ++++
 arch/arm64/include/asm/cpucaps.h      |  2 +
 arch/arm64/include/asm/cputype.h      |  2 +
 arch/arm64/include/asm/fpsimd.h       | 29 ++++++++++
 arch/arm64/include/asm/mmu.h          |  1 +
 arch/arm64/include/asm/tlbflush.h     | 39 ++++++++++---
 arch/arm64/kernel/cpu_errata.c        | 19 +++++++
 arch/arm64/kernel/entry-common.c      |  3 +
 arch/arm64/kernel/fpsimd.c            | 81 +++++++++++++++++++++++++++
 arch/arm64/kernel/process.c           |  7 +++
 arch/arm64/kernel/sys_compat.c        |  2 +-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 17 ++++++
 arch/arm64/tools/cpucaps              |  1 +
 include/linux/arm-smccc.h             |  5 ++
 14 files changed, 211 insertions(+), 9 deletions(-)


