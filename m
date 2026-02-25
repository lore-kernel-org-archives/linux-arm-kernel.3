Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC60AF55452
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 03:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F2hOOyzqgljk3YO/GRZi/BPp0AFh9TQuRMZ57AbcLEw=; b=fU5oBEu0F9VC9UdUSj3cLavJkn
	q6uzPKBHQpoEXyTNBQ2tc97zJhgrbkg4jzFg6suy+y6q+3W7gQEuBanoHdnvJsu1cTyc0mwkqJ16j
	lGm44zZcJ/zewkT73reVz1gRfApMzN852FjTIXGz4/JQZkPTty9ggtd4P6r7dSrtylrqt7lMPODp+
	fDniNRJVw5lX8x2X6I6aEDUvcUrnQ97nP+HQCUHMld0Lj3lGssU5SnDfmGm7TBblugS6fo0XJgAmj
	MGOg3PuTS53hBhLG0DtB6vmAv/knp4aHx0LsheQFep2nIe+s0wC0a2z+OCSKjpwNYx9kG6BRR80lB
	Miit+y3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv5wX-00000003A9z-3mzO;
	Wed, 25 Feb 2026 03:52:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv5wV-00000003A98-37fL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 03:52:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 753ED165C;
	Tue, 24 Feb 2026 19:51:59 -0800 (PST)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0B0543F7BD;
	Tue, 24 Feb 2026 19:52:03 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: [PATCH 0/2] arm64/mm: Drop TTBR_CNP_BIT and TTBR_ASID_MASK
Date: Wed, 25 Feb 2026 03:51:55 +0000
Message-Id: <20260225035157.1159962-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_195207_818075_EA1980F5 
X-CRM114-Status: UNSURE (   8.21  )
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

Directly use existing tools sysreg format field macros TTBRx_EL1_CNP_BIT/
TTBRx_EL1_ASID_MASK, while also dropping off now redundant custom macros
TTBR_CNP_BIT and TTBR_ASID_MASK. With this change in place, there are no
more TTBR_EL1 register based custom macros left in the tree.

This was discussed and suggested earlier.

https://lore.kernel.org/linux-arm-kernel/aRb8ezhQd0c0jp9G@J2N7QTR9R3/

Series applies on v7.0-rc1.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: kvmarm@lists.linux.dev

Anshuman Khandual (2):
  arm64/mm: Directly use TTBRx_EL1_ASID_MASK
  arm64/mm: Directly use TTBRx_EL1_CnP

 arch/arm64/include/asm/asm-uaccess.h   | 2 +-
 arch/arm64/include/asm/mmu.h           | 1 -
 arch/arm64/include/asm/mmu_context.h   | 2 +-
 arch/arm64/include/asm/pgtable-hwdef.h | 2 --
 arch/arm64/include/asm/uaccess.h       | 6 +++---
 arch/arm64/kernel/entry.S              | 2 +-
 arch/arm64/kernel/mte.c                | 4 ++--
 arch/arm64/kvm/at.c                    | 2 +-
 arch/arm64/kvm/hyp/nvhe/hyp-init.S     | 4 ++--
 arch/arm64/kvm/nested.c                | 4 ++--
 arch/arm64/mm/context.c                | 8 ++++----
 arch/arm64/mm/mmu.c                    | 2 +-
 12 files changed, 18 insertions(+), 21 deletions(-)

-- 
2.30.2


