Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE71FC3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 14:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XRuTsOTHSCNgWjIxcnkKdjHYwi2LjAtFm4CM1DmCVx8=; b=b3APEmfUt98HNn5NKc8Zy2wtNE
	YGR8nJo//765Ci+9w5t7N5y49DAaVT3WTq4ag6+sBqz/xrSjJe0pij/DAGjqFuN6sP/Re+sALdWHF
	dNsPeXI1+hbuPdUo6/x2SzDZXqWdBtu4qL51hMJ0YYIzGyuNPz19GHsNPDmPCMVn1GMHyZhM8U6Q9
	JMtSoeV0r6k/jo+UCpz6YlapYw+WGCGZBIEYpE9e3VGX87IvssRvMR+lbB9kohFtd4tVjaheApBN5
	Kxrcsv1SdSxAF/Q8PKoBtFCSLdy5OX5cD9m6cX96rOBKoV03AoQZNQc80bPrSDBNlV7BwNjtu3FAs
	dPY+uUyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2Hg-00000000vq3-2lBn;
	Thu, 08 May 2025 14:31:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1HL-00000000kIj-1KLS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 13:27:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4ECEA106F;
	Thu,  8 May 2025 06:27:00 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4B9093F58B;
	Thu,  8 May 2025 06:27:08 -0700 (PDT)
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
Subject: [PATCH v2 00/24] arm64: FPSIMD/SVE/SME fixes + re-enable SME
Date: Thu,  8 May 2025 14:26:20 +0100
Message-Id: <20250508132644.1395904-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_062711_446541_32CE0358 
X-CRM114-Status: GOOD (  10.65  )
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
tree, and I've pushed the series to the 'arm64-fpsimd-fixes-20250508'
tag of my kernel.org repo, which can be found at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
  https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/

Since v1 [1]:
* Split kselftest changes into separate patches
* Add patch to clean up FPSIMD context restoration
* Remove redundant read of TPIDR2 in copy_thread()
* Fix sve/sme typo in change_live_vector_length() error handling
* Add Acked-by and Reviewed-by tags
* Fix a number of commit message typos
* Clarify commit message for sve_set_common() error handling

[1] https://lore.kernel.org/linux-arm-kernel/20250506152523.1107431-1-mark.rutland@arm.com/

Mark.

Mark Rutland (24):
  arm64/fpsimd: Do not discard modified SVE state
  arm64/fpsimd: signal: Clear PSTATE.SM when restoring FPSIMD frame only
  arm64/fpsimd: signal: Mandate SVE payload for streaming-mode state
  arm64/fpsimd: signal: Consistently read FPSIMD context
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
  kselftest/arm64: fp-ptrace: Fix expected FPMR value when PSTATE.SM is
    changed
  kselftest/arm64: tpidr2: Adjust to new clone() behaviour
  kselftest/arm64: fp-ptrace: Adjust to new VL change behaviour
  kselftest/arm64: fp-ptrace: Adjust to new inactive mode behaviour

 Documentation/arch/arm64/sme.rst             |   6 +-
 arch/arm64/Kconfig                           |   1 -
 arch/arm64/include/asm/fpsimd.h              |  61 +++--
 arch/arm64/kernel/entry-common.c             |  46 +++-
 arch/arm64/kernel/fpsimd.c                   | 231 +++++++++----------
 arch/arm64/kernel/process.c                  | 115 +++++----
 arch/arm64/kernel/ptrace.c                   | 137 ++++++-----
 arch/arm64/kernel/signal.c                   |  91 ++++----
 tools/testing/selftests/arm64/abi/tpidr2.c   |  14 +-
 tools/testing/selftests/arm64/fp/fp-ptrace.c |  62 +++--
 10 files changed, 421 insertions(+), 343 deletions(-)

-- 
2.30.2


