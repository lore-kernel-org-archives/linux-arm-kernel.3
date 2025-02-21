Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E243C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 04:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IRRu/rONp5pZUehKprmm/LxEhjRQ+z1/HaE4di9Mkps=; b=mkfTEPbiQmgKxdwXRHU34v+n5u
	6z9A6KUpIjsPtcV2dBLYGQf8IbjJSlaeWhWzmmBcWuZppuwCk5A64c13K8mDhRNZX2yFcG8SvZkM+
	UOiaNUDlCtEzz6dyM885JX9E0cbQB42xFuB9NBhJ5subGHNqZ2Perczafyt8MtHPp8pIOiaTlvJQR
	2rOyUwOurBjEeuV1zaZ5dn1zpE/uogY4S/DySmoDsmD4pmf+7rZAE56z3ZokojelFrsVLzaOHv+SH
	rstkGffEMkiJvRME+jMfHmSWr//k0ztZhbs9CGC4WDbiocvKWWbJKRGQ+7CN0O0jfl5epjCy0z9Nu
	jydX2inw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlKta-000000048ZB-1BeL;
	Fri, 21 Feb 2025 04:44:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlKs5-000000048Cp-2h44
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 04:42:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 174BE1C01;
	Thu, 20 Feb 2025 20:42:58 -0800 (PST)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.40.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8167F3F6A8;
	Thu, 20 Feb 2025 20:42:35 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 0/8] arm64/mm: Drop PXD_TABLE_BIT
Date: Fri, 21 Feb 2025 10:12:19 +0530
Message-Id: <20250221044227.1145393-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_204241_729757_CCA9D9A7 
X-CRM114-Status: UNSURE (   9.93  )
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

Remove the PXX_TABLE_BIT definitions and instead rely on PXX_TYPE_MASK,
PXX_TYPE_SECT and PXX_TYPE_TABLE. The latter versions are more abstract
and also include the PTE_VALID bit.

This abstraction is valuable for the impending D128 page table support,
which doesn't have a single page table bit to determine table vs block.
Instead it has the skip level (SKL) field, where it will consider 0 to
mean table and any other value to mean a block entry. So PXX_TABLE_BIT
therefore doesn't fit into the D128 model well, but the type fields do.

This series applies on v6.14-rc3.

Changes in V2:

- Changed pmd_mkhuge() and pud_mkhuge() implementation
- Changed pud_bad() implementation with an additional patch

Changes in V1:

https://lore.kernel.org/all/20241005123824.1366397-1-anshuman.khandual@arm.com/

Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: James Morse <james.morse@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

Anshuman Khandual (6):
  KVM: arm64: ptdump: Test PMD_TYPE_MASK for block mapping
  arm64/ptdump: Test PMD_TYPE_MASK for block mapping
  arm64/mm: Clear PXX_TYPE_MASK in mk_[pmd|pud]_sect_prot()
  arm64/mm: Clear PXX_TYPE_MASK and set PXD_TYPE_SECT in [pmd|pud]_mkhuge()
  arm64/mm: Check PXD_TYPE_TABLE in [p4d|pgd]_bad()
  arm64/mm: Drop PXD_TABLE_BIT

Ryan Roberts (2):
  arm64/mm: Check PUD_TYPE_TABLE in pud_bad()
  arm64/mm: Check pmd_table() in pmd_trans_huge()

 arch/arm64/include/asm/pgtable-hwdef.h |  5 --
 arch/arm64/include/asm/pgtable.h       | 65 ++++++++++++++++++--------
 arch/arm64/kvm/ptdump.c                |  4 +-
 arch/arm64/mm/ptdump.c                 |  4 +-
 4 files changed, 50 insertions(+), 28 deletions(-)

-- 
2.25.1


