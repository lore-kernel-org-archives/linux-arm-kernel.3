Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D85DCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 09:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fG+uaJu6TK3lnUSUxSyutzKp+XPY4Dn9K3fqHz92KKY=; b=WL6M7xAxahm0ihEjLTbsiqrYyM
	5PSlulSj/ZyduV/jFCHWL5KNHuTXwPZFmPUmYrMw10URlLCiF6EHhhjDQRq1M/mB/cButV/yoQljs
	nQIc9/TfqCbt9P3U4qSLdKaAOsGtBN+Q537g026GBf5BO7g+fEZpHnQUoFnAKaza5NzvlgNOuQN23
	WGMWZ+JBrScsrJZL9/w4O6Y8B7WJJRsQdr8cEBBiKm/ASHJdhdKdKjzQieMLxYmRnbkAWtYgSm/6A
	XJCcFAwhi/dCe4NVQI/t6CaTYD+UwOdQzCRE+8ud6WMsrWUTs0tkkia63615+L2PA4sjd9LsybTOg
	JFEqf2lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHPT-0000000DJuq-28re;
	Wed, 10 Sep 2025 09:46:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHPQ-0000000DJt5-1yGY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 09:46:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B1D116F8;
	Wed, 10 Sep 2025 02:46:27 -0700 (PDT)
Received: from a076716.blr.arm.com (a076716.blr.arm.com [10.164.21.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 384DA3F63F;
	Wed, 10 Sep 2025 02:46:30 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org
Subject: [PATCH 0/3] arm64/ptdump: Add cmdline 'early_ptdump'
Date: Wed, 10 Sep 2025 15:16:20 +0530
Message-Id: <20250910094623.2356282-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_024636_549222_195B9E86 
X-CRM114-Status: UNSURE (   9.27  )
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

Enable early kernel page table dump for debug purpose when required through
a new kernel command line option 'early_ptdump'. But first this reorganizes
ptdump_init() separating out the debugfs creation, so that it can be called
early on in setup_arch(). This also adds kernel dmesg console print support
for existing pt_dump_seq_[printf|puts]() helpers.

This series applies on v6.17-rc5

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-efi@vger.kernel.org

Changes in V1:

- Dropped ARM64_PTDUMP_CONSOLE and instead enabled cmdline 'early_ptdump'

Changes in RFC:

https://lore.kernel.org/all/20250818091436.938517-1-anshuman.khandual@arm.com/

Anshuman Khandual (3):
  arm64/ptdump: Re-organize ptdump_init()
  arm64/ptdump: Enable console output in pt_dump_seq_[printf|puts]()
  arm64/ptdump: Add 'early_ptdump' kernel command line option

 .../admin-guide/kernel-parameters.txt         |  4 ++
 arch/arm64/include/asm/ptdump.h               |  4 ++
 arch/arm64/kernel/setup.c                     |  3 ++
 arch/arm64/mm/ptdump.c                        | 51 +++++++++++++++----
 drivers/firmware/efi/arm-runtime.c            |  4 +-
 5 files changed, 53 insertions(+), 13 deletions(-)

-- 
2.25.1


