Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260F9C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 19:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WHYUOKK7U7WbuFeGCDoU47xdHUPnONWxq8l7VmN/M7s=; b=FilOYyKz8DAwbOlXQMI9JQZZW7
	aBM9EkYtja6YzraCmG7A7DLLTEfuev9O9OOn5i9YPGu6m3KT4pU2YoBolo6fFxGLX0TEhjiCPfn7F
	vxaYls2s0fA9EHY5ARxQzC/Os+OhXGP04/ptJWdIXXrw70CVM6J3MI1Bv6JJ9/ATpAvz1LYnPeS0i
	KKS7WnHWKjTtSKaMgFcGxm2lvd1Bo5danvldpkCtkvuUcFktjm8WhH6RvclR/SyOCbL7W7fAKRMJX
	MR1RgMy+4cwIkPdoSlZSa1/DQCMiKKHRz7oFKrPP49v7yvAvtRliv6Z35lnJIMdWUs9p+GFhpexAj
	I5UCbIUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCNg3-0000000DCCJ-3Oe4;
	Tue, 06 May 2025 19:10:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKAp-0000000CUFM-0jP6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 15:25:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8722E1007;
	Tue,  6 May 2025 08:25:22 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CD8833F58B;
	Tue,  6 May 2025 08:25:29 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	daniel.kiss@arm.com,
	david.spickett@arm.com,
	luis.machado@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	richard.sandiford@arm.com,
	sander.desmalen@arm.com,
	tabba@google.com,
	tamas.petz@arm.com,
	tkjos@google.com,
	will@kernel.org,
	yury.khrustalev@arm.com
Subject: [PATCH 00/20] arm64: FPSIMD/SVE/SME fixes + re-eanble SME
Date: Tue,  6 May 2025 16:25:03 +0100
Message-Id: <20250506152523.1107431-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_082535_257735_F3557DE9 
X-CRM114-Status: UNSURE (   9.69  )
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

Hi all,

These patches fix a number of problems in the FPSIMD/SVE/SME code, and
finally re-enable SME support.

There are a few (mostly minor) ABI changes detailed in the patches.
Notably the clone() ABI is changed due to an incompatiblity with the
AAPCS64 ZA lazy saving scheme and the way this has been deployed in
userspace. The full details of that are in patch 13.

The series is based on the for-next/sme-fixes branch from the arm64
tree, and I've pushed the series to the 'arm64/fpsimd/sme-fixes' branch
of my kernel.org repo, also tagged as 'arm64-fpsimd-fixes-20250506'.

That repo can be found at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
  https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/

Mark.

Mark Rutland (20):
  kselftest/arm64: fp-ptrace: Fix expected FPMR value when PSTATE.SM is
    changed
  arm64/fpsimd: Do not discard modified SVE state
  arm64/fpsimd: signal: Clear PSTATE.SM when restoring FPSIMD frame only
  arm64/fpsimd: signal: Mandate SVE payload for streaming-mode state
  arm64/fpsimd: ptrace: Consistently handle partial writes to
    NT_ARM_(S)SVE
  arm64/fpsimd: Clarify sve_sync_*() functions
  arm64/fpsimd: Factor out {sve,sme}_state_size() helpers
  arm64/fpsimd: Add task_smstop_sm()
  arm64/fpsimd: signal: Use SMSTOP behaviour in setup_return()
  arm64/fpsimd: Remove redundant task->mm check
  arm64/fpsimd: Consistently preserve FPSIMD state during clone()
  arm64/fpsimd: Clear PSTATE.SM during clone()
  arm64/fpsimd: Make clone() compatible with ZA lazy saving
  arm64/fpsimd: ptrace/prctl: Ensure VL changes do not resurrect stale
    data
  arm64/fpsimd: ptrace/prctl: Ensure VL changes leave task in a valid
    state
  arm64/fpsimd: ptrace: Save task state before generating SVE header
  arm64/fpsimd: ptrace: Do not present register data for inactive mode
  arm64/fpsimd: ptrace: Mandate SVE payload for streaming-mode state
  arm64/fpsimd: ptrace: Gracefully handle errors
  arm64/fpsimd: Allow CONFIG_ARM64_SME to be selected

 Documentation/arch/arm64/sme.rst             |   6 +-
 arch/arm64/Kconfig                           |   1 -
 arch/arm64/include/asm/fpsimd.h              |  61 +++--
 arch/arm64/kernel/entry-common.c             |  46 +++-
 arch/arm64/kernel/fpsimd.c                   | 231 +++++++++----------
 arch/arm64/kernel/process.c                  | 112 +++++----
 arch/arm64/kernel/ptrace.c                   | 137 ++++++-----
 arch/arm64/kernel/signal.c                   |  36 ++-
 tools/testing/selftests/arm64/abi/tpidr2.c   |  14 +-
 tools/testing/selftests/arm64/fp/fp-ptrace.c |  62 +++--
 10 files changed, 392 insertions(+), 314 deletions(-)

-- 
2.30.2


