Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7A1EDB7EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 10:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RvxWucOWWNDy817dYvW+Bn31pQ4N8NqJgBzSTsJJKkA=; b=Iv08Zq7OMLtjLQoZDrxPpCOHkI
	vQ1BC0wxmLeXNrcucHWwhqcAFWUYhR0xK+K8nuEjdQzJNKLYZ9uSSXHBdp9RrBLg8vNTyJv1Eqs+Y
	k1Pvns2XTdF/vgk3o8x3rnSFKc8FwU5j3fAolWqjyZ4AAmlx2VTS5b1ZIg0hjY9X06y2nBigy8JSs
	hrqiNZ/gOyaKLxv5Z0LnuuuC4tYvkXwllwwMn2YxhTkeMaHKkjQjTzWDkkLSfaoH4Mf8Oy5l/q6cz
	sCNVETndMVqwrV1qlnGgzSE1V+MMyqZjmHke6nQPNEHQD4R8GlOLM/22hCRcc/nmg3VbKnLNkJWXf
	m5Tj4b7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3fz-00000006HoX-1S4G;
	Tue, 07 Apr 2026 10:28:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3fw-00000006Hmg-1ziT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 10:28:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C712B1BB2;
	Tue,  7 Apr 2026 03:28:44 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD7953F641;
	Tue,  7 Apr 2026 03:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775557730; bh=0HFmuFOscvX8IJdE9J0bungu0qtaUEmlXeh6W8SzbFk=;
	h=From:To:Cc:Subject:Date:From;
	b=O6HBZlI2pPucWkUcjBRJeafBYCZ5KS8u2CV5jAMtZCSciXkpD/lb7Gmw2FGlrl0Fz
	 RMO9Z+YBV0+KsS5asl1JwxembGnebXeZZyF/T4AFALQn1iWhCQNGXZmW2v7Xcrbzuh
	 6R2QNvtaY2/ynOWbKZjXWPoSOIkp1/YO8m8Ah/OU=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 0/4] arm64: Work around C1-Pro erratum 4193714 (CVE-2026-0995)
Date: Tue,  7 Apr 2026 11:28:40 +0100
Message-ID: <20260407102848.2266988-1-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_032852_640886_984CCA8E 
X-CRM114-Status: GOOD (  12.08  )
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

That's version 5 of the C1-Pro workaround. Version 3 here:

https://lore.kernel.org/r/20260402101246.3870036-1-catalin.marinas@arm.com

Changes since v4:

- Static sme_dvmsync_cpus mask to avoid allocating under stop_machine().
  Sashiko was right, even GFP_ATOMIC won't work under a raw_spin_lock()

- batch->cpumask allocated lazily on arch_tlbbatch_add_pending() only to
  avoid a potential leak in case of task cloning failure. That's mostly
  theoretical as the (mobile) systems affected are expected to be built
  with CPUMASK_OFFSTACK=n (the GKI kernel defaults to NR_CPUS=32)

The other Sashiko report about the DSB in arch_tlbbatch_add_pending() is
correct but it's not much we can do about it. I don't expect this to be
noticeable at all on systems with a small number of CPUs.

As with v4, there's no longer a global sme_active_cpus mask, reducing
the risk DoS from a malicious app using SME.


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
 arch/arm64/kernel/fpsimd.c                  | 79 +++++++++++++++++
 arch/arm64/kernel/process.c                 | 36 ++++++++
 arch/arm64/kernel/sys_compat.c              |  2 +-
 arch/arm64/tools/cpucaps                    |  1 +
 13 files changed, 285 insertions(+), 11 deletions(-)


