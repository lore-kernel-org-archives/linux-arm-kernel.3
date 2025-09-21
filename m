Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4924CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 00:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+lXIYhLlzu+x+bA2hh6HXLbTFYA0zWZ8uT/1UBVEoSg=; b=Mn20oHA0wELJFbTDI1QQXRElvx
	EunVirDMsqtjSZZxp+O66FIPpTImEFJ8le/QATrrgvgX24GUu7AeV/zMAceTeXX+fbt1crsBrsD8G
	gicqYkKTxb4C6F/JNoi0fA11rAj4FXxnVQtT+uMsYhBfBTjHQ3/llHwvcEKsUki9vDZkEF9v2a8U6
	rLB8TgkF4o+URjuQQGEZMeiJygEqST+UIAAKBHR6Y4SjpKASAPZvdUMXgYLGiNrhw7KN1ghNncE9U
	n3EjwwOHWwRm3Jl1/W292R7GUw8XK1hkH1ZejyMAYYsUHfe9+OLFUJsBZMAMsT3hkrfPU9XEVjpj+
	NHiJ+h8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v08KK-00000006AFu-1xEC;
	Sun, 21 Sep 2025 00:53:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v08KH-00000006AEy-2D4v
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 00:53:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD9691655;
	Sat, 20 Sep 2025 17:53:01 -0700 (PDT)
Received: from a076716.blr.arm.com (a076716.blr.arm.com [10.164.21.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A3A8D3F66E;
	Sat, 20 Sep 2025 17:53:06 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	will@kernel.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V5 0/4] arm64/sysreg: Clean up TCR_EL1 field macros
Date: Sun, 21 Sep 2025 06:22:56 +0530
Message-Id: <20250921005300.2535994-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_175313_607885_4485420E 
X-CRM114-Status: UNSURE (   7.96  )
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

Currently TCR_EL1 field macros are sprinkled across the arm64 platform code
including KVM implementation. Clean these up via updating required register
filed definitions in tools sysreg format and then subsequently doing all
necessary replacements. All required TCR_XXX macros have been moved from
(asm/pgtable-hwdef.h) into KVM header (asm/kvm_arm.h) for their continued
usage in KVM.

The cleanup does not cause any functional change.

This applies on v6.17-rc6

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Mark Brown <broonie@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: kvmarm@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

Changes in V5:

- Split tools header and KVM changes into separate patches per Will

Changes in V4:

https://lore.kernel.org/all/20250907123000.414181-1-anshuman.khandual@arm.com/

- Dropped all unused TCR_XXX macros while moving into KVM header

Changes in V3:

https://lore.kernel.org/all/20250901072037.743380-1-anshuman.khandual@arm.com/

- KVM TCR_XXX flags are expressed via TCR_EL1_XXX flags per Marc

Changes in V2:

https://lore.kernel.org/all/20250829060215.1086792-1-anshuman.khandual@arm.com/

- Fixed ARM ARM version from 7.B to L.B
- Changed UnsignedEnum into Enum per Mark
- Dropped all TCR_EL1 replacements from KVM code
- Moved existing TCR_XXX macros from (asm/pgtable-hwdef.h) into KVM header
  (asm/kvm_arm.h) for their continued usage
- Dropped patches 3 and 4 which could be done subsequently

Changes in V1:

https://lore.kernel.org/linux-arm-kernel/20250818045759.672408-1-anshuman.khandual@arm.com/

Anshuman Khandual (4):
  tools: header : arm64: Replace TCR_NFD[0|1] with TCR_EL1_NFD[0|1]
  arm64/sysreg: Update TCR_EL1 register
  arm64/sysreg: Replace TCR_EL1 field macros
  KVM: arm64: Move inside all required TCR_XXX macros

 arch/arm64/include/asm/assembler.h     |  6 +-
 arch/arm64/include/asm/cputype.h       |  2 +-
 arch/arm64/include/asm/kvm_arm.h       | 43 +++++++++++
 arch/arm64/include/asm/mmu_context.h   |  4 +-
 arch/arm64/include/asm/pgtable-hwdef.h | 98 +-------------------------
 arch/arm64/include/asm/pgtable-prot.h  |  2 +-
 arch/arm64/include/asm/sysreg.h        |  2 -
 arch/arm64/kernel/cpufeature.c         |  4 +-
 arch/arm64/kernel/pi/map_kernel.c      |  8 +--
 arch/arm64/kernel/vmcore_info.c        |  2 +-
 arch/arm64/mm/proc.S                   | 36 ++++++----
 arch/arm64/tools/sysreg                | 52 +++++++++++---
 tools/arch/arm64/include/asm/cputype.h |  2 +-
 13 files changed, 127 insertions(+), 134 deletions(-)

-- 
2.25.1


