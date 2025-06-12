Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EFDC71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 03:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JOAq8vEvqe6TvPJm8Wg2iDByWMCQ03eG8N89zbe3X8s=; b=qy7utZOUf+/u9v
	Ad11HKDaE/vYqQesUH4WIcShqbjQiaeie12g8g/2hJIFQ8FZ9Z5rNB/VKhAaBp/YQTaiGmKR65qw1
	tkB8CK4CVMB1AKuVPyAI3zCJfdng+LTMHxrWbZRmAVgWwQgbv2xI6E6H8/WtKX6C+Jv3l1LXISA/l
	hga6/cUk2TYqRSYwOSXRTQ3PfkNUHJ3IcecGwUq1YbhUDQNf8t16q90IY9HxNcJygHLn/uqeHAIHf
	FO03C5vPwpsN55bFXDqMZvPS2NkS0eG/N6+kAjjl8pSnjIDsKa563pSUpHuTEcgzsJzSnfOMIWq8H
	w5Vi1Y9M2bz6b2BHcdDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPYlZ-0000000C4wz-0Tms;
	Thu, 12 Jun 2025 03:38:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPYjQ-0000000C4kM-3f7j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 03:36:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D21B11595;
	Wed, 11 Jun 2025 20:35:37 -0700 (PDT)
Received: from a076716.blr.arm.com (a076716.blr.arm.com [10.164.21.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1DE1B3F66E;
	Wed, 11 Jun 2025 20:35:53 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH V4 0/2] arm64/debug: Drop redundant DBG_MDSCR_* macros
Date: Thu, 12 Jun 2025 09:05:45 +0530
Message-Id: <20250612033547.480952-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_203600_955223_CA85D917 
X-CRM114-Status: UNSURE (   8.51  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, Will Deacon <will@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

MDSCR_EL1 has already been defined in tools sysreg format and hence can be
used in all debug monitor related call paths. Subsequently all DBG_MDSCR_*
macros become redundant and hence can be dropped off completely. While here
convert all variables handling MDSCR_EL1 register as u64 which reflects its
true width as well.

This series applies on v6.16-rc1

Changes in V4:

- Updated the commit message in [PATCH 1/2] explainig rationale for changing
  mdscr variable as u64 per Mark

Changes in V3:

https://lore.kernel.org/all/20250610053128.4118784-1-anshuman.khandual@arm.com/

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
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Joey Gouly <joey.gouly@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: kvmarm@lists.linux.dev
Cc: kvm@vger.kernel.org

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


