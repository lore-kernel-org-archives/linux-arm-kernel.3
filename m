Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E07CCFA06
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 05:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gb8PSAF++P1qn+P4oL6jVgUHaWgPdpj5NFHTaU9CpMc=; b=BakitPFx/JRrdvFDKkJCh3qjsB
	VTnBqy2rbGzZAMZ3SXVydcd0x5ReJTkmt1FhtKhtwExhLxJti9CK2Z7Gg9MvfYSCj83pnRPhdOwZQ
	niFlW7i2ZbiXI5Iz7fH0Bet9YL14n0gTA3ePo3blCvmbd6nfxmy1e7agdjvXkL3uNRuzpO3VYT9UW
	HA6Xeyxv3Hn2Oh+3TfrQ6uqEQ3C1kBcMY3KkrifDSf6y2PIMnQ+Bq6a8Swfc8CW+XvhPzwGRQHRO0
	LszRZ4ck1tEbyNAJstMLZdNmbFtv+rGJpnoMKLFi9kTqih/1wPSk71iXnoGJYlW3ZdpR2tA2D7eCO
	6jII34Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFn5N-00000009Dub-3Pj4;
	Mon, 03 Nov 2025 05:26:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFn5K-00000009Dsr-01wC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 05:26:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4613028FA;
	Sun,  2 Nov 2025 21:26:18 -0800 (PST)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BA0523F63F;
	Sun,  2 Nov 2025 21:26:24 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] arm64/mm: TTBRx_EL1 related changes
Date: Mon,  3 Nov 2025 05:26:12 +0000
Message-Id: <20251103052618.586763-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_212630_094489_D1F12434 
X-CRM114-Status: UNSURE (   7.92  )
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

This series contains some TTBRx_EL1 related changes, aimed at standardizing
TTBRx_EL1 register field accesses via tools sysreg format and also explains
52 PA specific handling methods via a new macro along with in code comments

This series applies on v6.18-rc4

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

Anshuman Khandual (6):
  arm64/mm: Directly use TTBRx_EL1_ASID_MASK
  arm64/mm: Directly use TTBRx_EL1_CnP
  arm64/mm: Represent TTBR_BADDR_MASK_52 with TTBRx_EL1_BADDR_MASK
  arm64/mm: Ensure correct 48 bit PA gets into TTBRx_EL1
  arm64/mm: Describe 52 PA folding into TTBRx_EL1
  arm64/mm: Describe TTBR1_BADDR_4852_OFFSET

 arch/arm64/include/asm/asm-uaccess.h   |  2 +-
 arch/arm64/include/asm/assembler.h     |  3 ++-
 arch/arm64/include/asm/mmu_context.h   |  2 +-
 arch/arm64/include/asm/pgtable-hwdef.h | 23 ++++++++++++++++++++---
 arch/arm64/include/asm/pgtable.h       |  5 +++--
 arch/arm64/include/asm/uaccess.h       |  6 +++---
 arch/arm64/kernel/entry.S              |  2 +-
 arch/arm64/kernel/mte.c                |  4 ++--
 arch/arm64/mm/context.c                |  8 ++++----
 arch/arm64/mm/mmu.c                    |  2 +-
 10 files changed, 38 insertions(+), 19 deletions(-)

-- 
2.30.2


