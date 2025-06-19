Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEA3C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 18:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZceMbioqBbewD3owIhn7K1TqwrkJEhTrkMiW9ziRQ9Q=; b=l0Lk2RkSAd6E1t9HyJUq7rQxGY
	QvwQQL78yTsPdfATbIcgOS4Lecy8iOakPBP9+gdS7hXhCPlIfM7HFSzp0VeWDT2UbqZlIPG0Q1DSH
	meAbGz6N5/HteYXkqJb+LcIIeOIYY2KHSbq6ykS5ziYiD7oBCVndDMeZlnMcPvPta+Q0SyvVcZu1T
	iFl5XVextnvp99kL4OkBmqrXdFNFWKWIFfH3v3d1FWHmpfeg+W2q/Tng5s+8yNcO1n7hcv/cekPMF
	fa7qPq/Vcx9c9mitaW2DDBY6JP0Z91J6/O9+maZMUHjrJzxE+kBJF3HtQtyRBZZryM6kopEEfRMhR
	A+MIVMYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKAx-0000000DxXJ-3aeD;
	Thu, 19 Jun 2025 18:39:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHhp-0000000Dap2-1jxS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 16:01:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F883113E;
	Thu, 19 Jun 2025 09:01:12 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0185B3F66E;
	Thu, 19 Jun 2025 09:01:30 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 0/2] Improve POE handling for uaccess
Date: Thu, 19 Jun 2025 17:00:40 +0100
Message-ID: <20250619160042.2499290-1-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_090137_498326_89646AB7 
X-CRM114-Status: UNSURE (   8.06  )
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

This short series attempts to approach POE (Overlay) faults consistently
w.r.t. uaccess. We currently assume that spurious Overlay faults are
handled by retrying the access [1], but this isn't the case.

Patch 1 ensures that spurious Overlay faults are indeed ignored. This
being done, it typically isn't worth using an ISB when writing to
POR_EL0. Patch 2 removes the remaining ISB in the signal handling code.

Patch 1 changes the fault handling logic to rely solely on POR_EL0 and
VMA metadata to determine if a pkey fault occurred, instead of the
Overlay bit in ESR_EL1. The rationale is detailed in that patch; it
is worth noting that powerpc made a similar change but for a different
reason [2].

[1] https://lore.kernel.org/linux-arm-kernel/ZtYNGBrcE-j35fpw@arm.com/
[2] https://lore.kernel.org/all/20200505071729.54912-3-aneesh.kumar@linux.ibm.com/
---
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Joey Gouly <joey.gouly@arm.com>
Cc: Will Deacon <will@kernel.org>
---

Kevin Brodsky (2):
  arm64: poe: Handle spurious Overlay faults
  arm64: signal: Remove ISB when resetting POR_EL0

 arch/arm64/kernel/process.c |  5 +++++
 arch/arm64/kernel/signal.c  |  7 +++++--
 arch/arm64/mm/fault.c       | 30 +++++++++++++++++++++---------
 3 files changed, 31 insertions(+), 11 deletions(-)


base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
-- 
2.47.0


