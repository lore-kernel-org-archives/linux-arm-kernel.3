Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1C4CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 07:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hCS4TXb/yjxR/7rucPhfP1yRmhwmB8qp8AUgxMaihoU=; b=dx1SG5Z7x4PFbWYztNMIilrre7
	hDP2OgZZdRPFSMPhnBFCycHoA35Nz5iKjLQlIi6D9lQa5jnabbcJUmjL6hXo3FmNOB+HV9svJoK0l
	iC5WKOi7ipztO5TwSKugoSl+TlF+wN6+oXRQQ2z1Z9aP9LGXQ5p8uZeFOdtzp1nEKoCxKTeLqEb8V
	qZUwnXh5nc/2YjaqUHlvL4o0MitjzPFpZB6O72ITRjCF5zAFkZlzXtbpQ/O/xqfMyYKDalSLif4W7
	GA0+O6jdaaVVYl+YpyedtgIWr6pPsEZlpHnm1CFBdoJaYEogDwnSavcZPjD1+1tE8jNfDPp0vHu7T
	hF0hn4mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unue5-00000006p7X-23Ss;
	Mon, 18 Aug 2025 07:51:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrwj-00000006Vay-0Iqu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 04:58:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96C631762;
	Sun, 17 Aug 2025 21:58:01 -0700 (PDT)
Received: from a076716.blr.arm.com (a076716.blr.arm.com [10.164.21.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E67E13F58B;
	Sun, 17 Aug 2025 21:58:06 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] arm64/sysreg: Clean up TCR_XXX field macros
Date: Mon, 18 Aug 2025 10:27:55 +0530
Message-Id: <20250818045759.672408-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_215813_155197_FFB2DCFF 
X-CRM114-Status: UNSURE (   8.10  )
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

Currently [V]TCR[1|2]_EL[1|2] sysreg field macros are sprinkled across the
arm64 platform code including KVM implementation. Clean these up via adding
required register filed definitions in tools sysreg format and subsequently
doing all necessary replacements. The cleanup does not cause any functional
change.

This applies on v6.17-rc2

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Mark Brown <broonie@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: kvmarm@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

Anshuman Khandual (4):
  arm64/sysreg: Update TCR_EL1 register
  arm64/sysreg: Replace TCR_EL1 field macros
  arm64/sysreg: Add TCR_EL2 register
  arm64/sysreg: Add VTCR_EL2 register

 arch/arm64/include/asm/assembler.h         |   6 +-
 arch/arm64/include/asm/cputype.h           |   2 +-
 arch/arm64/include/asm/kvm_arm.h           |  45 +-----
 arch/arm64/include/asm/kvm_nested.h        |   6 +-
 arch/arm64/include/asm/mmu_context.h       |   4 +-
 arch/arm64/include/asm/pgtable-hwdef.h     | 107 ++------------
 arch/arm64/include/asm/pgtable-prot.h      |   2 +-
 arch/arm64/include/asm/sysreg.h            |   4 -
 arch/arm64/kernel/cpufeature.c             |   4 +-
 arch/arm64/kernel/pi/map_kernel.c          |   8 +-
 arch/arm64/kernel/vmcore_info.c            |   2 +-
 arch/arm64/kvm/arm.c                       |   6 +-
 arch/arm64/kvm/at.c                        |  48 +++----
 arch/arm64/kvm/hyp/include/hyp/switch.h    |   2 +-
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h |   2 +-
 arch/arm64/kvm/hyp/nvhe/switch.c           |   2 +-
 arch/arm64/kvm/hyp/nvhe/tlb.c              |   2 +-
 arch/arm64/kvm/hyp/pgtable.c               |   6 +-
 arch/arm64/kvm/hyp/vhe/tlb.c               |   2 +-
 arch/arm64/kvm/nested.c                    |  10 +-
 arch/arm64/kvm/pauth.c                     |  12 +-
 arch/arm64/mm/proc.S                       |  29 ++--
 arch/arm64/tools/sysreg                    | 153 +++++++++++++++++++--
 tools/arch/arm64/include/asm/cputype.h     |   2 +-
 24 files changed, 241 insertions(+), 225 deletions(-)

-- 
2.25.1


