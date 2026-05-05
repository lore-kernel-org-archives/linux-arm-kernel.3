Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F53CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 15:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bqakA0Xbm+bCDDojAI3r3XywQp7YxhrlEFHkPzc34q4=; b=nd86qw4xc8xcdHEDOT+RUxrBhJ
	FnKwofdcK9Owb92uzHXmuLv2iVfh1k3++AQDef6dJbnFMcCUo5hVEOP5FboWhgSicToRt2fdi+4ep
	/X0kujVDhfhQ9T67rZgHJ15IHUzfQtObHCapm4nLj2HEaFthEUha1ApRsFiIC+ZtijMSE0YRTq19B
	vfAExU0ZYVRAA+W4r71lKI9Dog/uZz9GV/VQvw0ZBsqTIkLX8JG120ZMuVfVhfrjGEw5muTuGrxrv
	sEpCzF5vLUMcJJFJ3hrYhEw5fSo7Go+fBo0K2ZTi1+ueDjSKjzNyZZ6hFg+PBGyY2laSfWcDnlk0u
	apvOJAEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIA0-0000000GkZb-1HnX;
	Tue, 05 May 2026 15:58:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKI9u-0000000GkXD-3nJF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 15:58:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5A25315D;
	Tue,  5 May 2026 08:57:58 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6AF8B3F905;
	Tue,  5 May 2026 08:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777996684; bh=aXYkulEifzZ5UT4zSs4Wpt4R7e6eXHJzHqfeopBm2AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pIo4Lh6NUoXnWA7ZCJrOGdCVc2Qkz7Ama6Bjy5iJNGwA1jjcZIbV++ZECmm5Rm483
	 fiWNaHLXIkAeV4+OixITFLP07CGoVJc/5IULiMHjwVHFAkNI0D3StHsCEyQqH9DNEU
	 Wi/OXOiqAMhvtrczA+RDS9ZzsKPz01GfpwOZVIqQ=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	ardb@kernel.org,
	lpieralisi@kernel.org,
	mark.rutland@arm.com,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	sudeep.holla@arm.com,
	robh@kernel.org,
	maz@kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [RFC PATCH v2 0/4] arm64: realm: Support for probing RSI earlier
Date: Tue,  5 May 2026 16:57:38 +0100
Message-ID: <20260505155742.623287-1-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429103535.266728-1-suzuki.poulose@arm.com>
References: <20260429103535.266728-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_085807_056346_C3E1BC51 
X-CRM114-Status: GOOD (  20.03  )
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

This is an updated series, addressing the review comments from AI agent on
the version 1 [0] of the series, (some of which were documented as short comings).
See below for the changes.

The Realm Guest linux support is broken without rodata=full (fortunately default
for arm64), as we detect the RSI support after we have created the Linear map
with Block/Contiguous mappings. If the boot CPU doesn't support BBML2_NOABORT
(there are CPUs out there with FEAT_RME and no - useable - BBML2_NOABORT)
we are then not able to split the page tables down to PTE level if the system
as such doesn't support BBML2.

See the following link for the discussion.

https://lore.kernel.org/all/20260330161705.3349825-2-ryan.roberts@arm.com/

The available options are :
 1. Start with PTE level mappings at paging_init() and then "FOLD" the page tables
    to Block/Cont mappings after we have the full picture available. Looking at the
    future (with BBML3), this might mean "additional work" for most of the systems
    at boot. But not bad as splitting them ?
 2. Hold the secondary CPUs in busy loop with MMU disabled and split the mappings
    by the boot CPU with MMU off (if Boot CPU can't support BBML2). This is tricky
    with the page allocations required to add the page-tables.
 3. Move the detection of Realm support earlier to make a better decision for
    paging_init(), with an added bonus of earlycon support for Realms without
    the user having to work out the "top bit" for the Realm.

This series is an attempt to implement (3) (without the earlycon support). We try
to probe the PSCI conduit early from the DT/ACPI. DT is not flattened at this time.

ACPI table is not mapped in full, so we have to map one table at a time and walk
from the Root of the table (RSDP) through to XSDT and find the FADT table from
the array of table pointers there. Minimal verification is performed on the 
tables (e.g., revision checks, standard FADT sanity checks). Checksum is not
verified, but should be possible to do for the parts we consume.

With arm64, during the normal boot, we could fallback to using DT if the ACPI
tables are not useable. So, during the early probe, we try to follow the similar
logic and probe the conduit from both DT and ACPI where available. If both of
them contain a conduit, we only proceed if they match. Otherwise, we skip the
early probe and do things the normal way. (Any sane system shouldn't have such
a mismatch, but..)

Once we probe the PSCI conduit, PSCI is probed, along with the presence of SMCCC.
With that in place, we try to probe the RSI support after the early probe and
advertise the Realm World. If the early probe wasn't successful, we fall back
to the late mode, where we could end up with (on a possibly rare broken firmware).

NOTE: This is an early RFC attempt to moving the PSCI detection earlier. The other
option(s) that may be worth exploring are:

1. On systems with EFI, parse this from EFI Stub and pass the data back in the
   DT Stub, under chosen node. e.g., "linux,uefi-arm-psci-conduit".
   Challenge: EFI stub doesn't seem to be ACPI aware. We could make that change,
   we only need a few table walks.
2. Have EFI firmware provide this information (with my limited knowledge on the
   area, this looks like too much work, and bending the standards)
3. Append arm64 boot protocol to have this information passed to the kernel.
   (Firmware provided) - (Steven's idea)
4. Any other options ?


This series is also available here :

git@git.gitlab.arm.com:linux-arm/linux-cca.git	cca-guest/early-rsi-detection/rfc-v2

Thoughts ?

Suzuki


Changes since v1:
 (Mainly addressing review comments from AI agent)
[0] https://lore.kernel.org/all/20260429103535.266728-1-suzuki.poulose@arm.com
 - Handle ACPI XSDT table properly for tables greater than a PAGE_SIZE
 - Stricter checking for the PSCI DT node, match the compatible to PSCI 0.2 or v1.0
   and honor the "status" property of the node, to be more closer to the late check

Suzuki K Poulose (4):
  arm64: acpi: Refactor FADT table verification
  psci: Add support for Early detection and init
  arm64: psci: Move detection and SMCCC probe earlier
  arm64: realm: Move RSI detection earlier

 arch/arm64/include/asm/acpi.h |   1 +
 arch/arm64/include/asm/rsi.h  |   1 +
 arch/arm64/kernel/acpi.c      | 151 ++++++++++++++++++++++++++++------
 arch/arm64/kernel/rsi.c       |  23 +++++-
 arch/arm64/kernel/setup.c     |  79 ++++++++++++++++++
 drivers/firmware/psci/psci.c  |  49 ++++++++++-
 include/linux/psci.h          |   2 +
 7 files changed, 277 insertions(+), 29 deletions(-)

-- 
2.43.0


