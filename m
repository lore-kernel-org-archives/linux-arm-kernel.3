Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031B5F89246
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 10:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iZd+HSwTTqX6wJ1eZzoHdn2wLLo459TdBXSR/xX1yMA=; b=GJ/uytbOhESWVunfG0m3ZkR+CS
	O+AjfHaWeP7N8qLgiDxp0zz+I6+ssL0Uhjy/qt1KM/dygvNQoFFU8XFUXociZw0/FVD12MJGnRWvH
	GAD9jIH5+pglDi3vBtm/hMcn67PdU8KHCWe8X1zVGvdCXgqDGTQiCLvxiT0G65uxf6dHjphukF0wS
	6nEKJmZGSNBmhMJDhDFxmxbke9HPdpPtoBKo5HiR+iBYTYpw02RhFqZpXkHLDTADMLMKoVSLNV+Q3
	F1UA2Aq/YWInXrBwB5C6pvC+NbFzltOiUVGDPSRTqvHEpnVLNJTT9tvZuKLxQJaT1AUNsyDvhng5+
	+PU7BphQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7uB-00000008O5x-3bjz;
	Tue, 21 Apr 2026 10:00:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7u4-00000008O3d-3e79
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 10:00:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 737C825E4;
	Tue, 21 Apr 2026 03:00:18 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.57.89.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3EFAC3FBCB;
	Tue, 21 Apr 2026 03:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776765624; bh=/8RmMYmmwNGvGVhnupL/glGhwB2u023lC29k8r4ek9k=;
	h=From:To:Cc:Subject:Date:From;
	b=XFxvG5ToWnTtlw+Z4Xr+lHHH7itSBWAaA62sUcsSt03kEafsTV4eQIM3mZtxvdOYi
	 dgjKtcFyffdmGWCKigmIe5RZw6GHrUXCROZAOFrSCezcpjWQ8haGTg96HEWZTdXyII
	 iTZA52g6ydTyLvfk78rzYKQwMhsgUJeLoHH+xu8w=
From: Catalin Marinas <catalin.marinas@arm.com>
To: stable@vger.kernel.org
Cc: Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6.18.y 0/6] arm64: Stable backport of the C1-Pro erratum 4193714 workaround
Date: Tue, 21 Apr 2026 11:00:11 +0100
Message-ID: <20260421100018.335793-1-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_030024_942312_E6124B80 
X-CRM114-Status: GOOD (  10.68  )
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

Hi Greg, Sasha,

As the workaround for this CPU bug just went in, I'm sending it for
stable 6.18. The first two patches are prerequisites to make the
backporting easier. I do not intend to send them for stable 6.12 since
SME is not supported in that version anyway (Android folk did their own
backports already).

A heads-up, the workaround itself is larger than the recommended max 100
lines suitability for stable backports.

Thanks.

Catalin Marinas (4):
  arm64: tlb: Introduce __tlbi_sync_s1ish_{kernel,batch}() for TLB
    maintenance
  arm64: tlb: Pass the corresponding mm to __tlbi_sync_s1ish()
  arm64: cputype: Add C1-Pro definitions
  arm64: errata: Work around early CME DVMSync acknowledgement

Mark Rutland (2):
  arm64: tlb: Allow XZR argument to TLBI ops
  arm64: tlb: Optimize ARM64_WORKAROUND_REPEAT_TLBI

 Documentation/arch/arm64/silicon-errata.rst |   2 +
 arch/arm64/Kconfig                          |  12 ++
 arch/arm64/include/asm/cpucaps.h            |   2 +
 arch/arm64/include/asm/cputype.h            |   2 +
 arch/arm64/include/asm/fpsimd.h             |  21 +++
 arch/arm64/include/asm/tlbbatch.h           |  10 +-
 arch/arm64/include/asm/tlbflush.h           | 143 ++++++++++++++++----
 arch/arm64/kernel/cpu_errata.c              |  30 ++++
 arch/arm64/kernel/entry-common.c            |   3 +
 arch/arm64/kernel/fpsimd.c                  |  79 +++++++++++
 arch/arm64/kernel/process.c                 |  36 +++++
 arch/arm64/kernel/sys_compat.c              |   2 +-
 arch/arm64/kvm/hyp/nvhe/mm.c                |   2 +-
 arch/arm64/kvm/hyp/nvhe/tlb.c               |   8 +-
 arch/arm64/kvm/hyp/pgtable.c                |   2 +-
 arch/arm64/kvm/hyp/vhe/tlb.c                |  10 +-
 arch/arm64/tools/cpucaps                    |   1 +
 17 files changed, 325 insertions(+), 40 deletions(-)


