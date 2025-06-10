Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C47C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 05:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cP2QfquxT0TRQQXOkYDdUrUSoF0fS6Q6N7pRoXnw6RA=; b=MjkmNFDCyZTvLJ
	M2Dh1qjIbHGhRXSHQhqNnAg42D9YIpa5lNg0zEtP+n75ImXF64GzMch3iq2NPyywpL9+JKte4hesd
	4iqsv6MIjbnD10vSlOn+TG70/7nlfQ73Dj1vdBLJlsky4wNvhTxuOqZuXzMSb6lH4RxPGD5Z4JKRB
	T/3n9zmVQ5S7TpZ7ncZ0EoemKkvdSI447vWxMVZs5luzaN4LA5Wf6aVVYWl1Q7z7zXly4ajnCGcmR
	5MBubE7uWG86BK7vpmq95ze/o+qwZgDgbs3KDz7xy+6Be+IUOpnelxJI277Bn8MnlFatBXIME1Who
	Fq/Yfw/elIxpfjCuHTSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOrfA-00000005qzQ-3ksl;
	Tue, 10 Jun 2025 05:36:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOraI-00000005qJT-3LpN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 05:31:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AC8814BF;
	Mon,  9 Jun 2025 22:31:20 -0700 (PDT)
Received: from a076716.blr.arm.com (a076716.blr.arm.com [10.164.21.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0A8373F59E;
	Mon,  9 Jun 2025 22:31:36 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH V3 0/2] arm64/debug: Drop redundant DBG_MDSCR_* macros
Date: Tue, 10 Jun 2025 11:01:26 +0530
Message-Id: <20250610053128.4118784-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_223142_880419_A55DA93B 
X-CRM114-Status: UNSURE (   7.79  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

MDSCR_EL1 has already been defined in tools sysreg format and hence can be
used in all debug monitor related call paths. Subsequently all DBG_MDSCR_*
macros become redundant and hence can be dropped off completely. While here
convert all variables handling MDSCR_EL1 register as u64 which reflects its
true width as well.

This series applies on v6.16-rc1

Changes in V3:

- Split out the self test changes into a separate patch per Mark
- Added RB tag from Ada

Changes in V2:

https://lore.kernel.org/all/20250508044752.234543-1-anshuman.khandual@arm.com/

- Changed reg, val width to u64 in cortex_a76_erratum_1463225_svc_handler() per Ada
- Changed mdscr register width to uint64_t in enable_monitor_debug_exceptions() and
  install_ss() per Ada
    
Changes in V1:

https://lore.kernel.org/all/20250417105253.3188976-1-anshuman.khandual@arm.com/

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

Anshuman Khandual (2):
  arm64/debug: Drop redundant DBG_MDSCR_* macros
  KVM: selftests: Change MDSCR_EL1 register holding variables as uint64_t

 arch/arm64/include/asm/assembler.h            |  4 ++--
 arch/arm64/include/asm/debug-monitors.h       |  6 -----
 arch/arm64/kernel/debug-monitors.c            | 22 +++++++++----------
 arch/arm64/kernel/entry-common.c              |  4 ++--
 .../selftests/kvm/arm64/debug-exceptions.c    |  4 ++--
 5 files changed, 17 insertions(+), 23 deletions(-)

-- 
2.25.1


