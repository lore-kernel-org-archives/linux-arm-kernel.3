Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568F5E83043
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 02:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RPk1LrytNdHjk318KpBPet/THWK+RTHsKMb5L95THHQ=; b=XIJ5lRZO3j6C8eo3Ivvb2eQytj
	bVjoNRDsi/4DM5Zs1krFfCgCc6Cm+2z0UjEW9cnIhsly5IMhejTP7a8I02JX3WSZZuV1f1HFxEyyM
	XKWYJ4d5Bu9D7cWsFnOfnrfeOAUni4tOL8LIhLQDEwxa0vqtwsYt8s0N5GEuDw8KTaLWiBAxDpdP6
	rDoZSMPWvOADJ2l9VQQ6p1KWMnVSbMutj4PNICyWBJ3xElAwhTqgke1m1LvC0jKvKp+s9PZxFpptQ
	Y2wD4WQPqgLxglA+22avVeKLbwalFqSrot+2su4fqnGkiuxegcDMmJChJed/Tqym0goLAC/MmnB6G
	twaEYvpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn6SJ-00000005wLq-05kl;
	Tue, 03 Feb 2026 02:47:55 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn6SG-00000005wLN-21B2;
	Tue, 03 Feb 2026 02:47:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770086872; x=1801622872;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3MWDqfAiOl05f1xqVVZA4n5IjZ6LdE0DQsZtDWx3Bds=;
  b=SZPNS4Kl80eyaql3Hk9giOTPCoiiiihwIT5NEsiK1DJu7tLtZo1RieSE
   hLiv3jKwgOtkgw/JIyfluuFkInyQZw6pU7mAqgkYRwOMxS6wZJBv8XhJZ
   bwlquz+bSiO9V9jfvS0KHM57AafmwXeetkW/D7G8lGb0KF8usiNNYSoF4
   vDfxqr6tiYO1caeuTTWrTs6sctH9h2HvfoJf/XXBfpRJFvfcjvzwt9Pwn
   0ztt2OXhCaGDB6GCqqAORqatfHwgP0givOT4PFt6D4v6qx8VdnCRgO363
   eZNq+2LhoBAj8hbfgek1Uit1BEocKnn7OOzYXpcuLRFJVSF8CB1NGYonq
   w==;
X-CSE-ConnectionGUID: 9QuKm1H8S22eAsw6VlnTDg==
X-CSE-MsgGUID: eyp/nLgVSfSVw1jpBdJIsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71152114"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="71152114"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 18:47:50 -0800
X-CSE-ConnectionGUID: CwdI2bP1SrK5HF7IKM+DFA==
X-CSE-MsgGUID: ZoAomjiAQAu1YwAmfa/Q/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; 
   d="scan'208";a="208991699"
Received: from spr.sh.intel.com ([10.112.229.196])
  by orviesa010.jf.intel.com with ESMTP; 02 Feb 2026 18:47:43 -0800
From: Dapeng Mi <dapeng1.mi@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zide Chen <zide.chen@intel.com>,
	Falcon Thomas <thomas.falcon@intel.com>,
	Dapeng Mi <dapeng1.mi@intel.com>,
	Xudong Hao <xudong.hao@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Subject: [Patch v3 0/4] Perf tools: perf-regs bug fix and optimization
Date: Tue,  3 Feb 2026 10:43:52 +0800
Message-Id: <20260203024356.444942-1-dapeng1.mi@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_184752_571019_D6E97D9B 
X-CRM114-Status: GOOD (  11.78  )
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

Changes:
 v2 -> v3:
  * Fix the abort issue for "-I" or "--user-regs" options. (Patch 1/4)
  * Address Ian's comments.

 v1 -> v2:
  * Fixing "PERF_REG_EXTENDED_MASK" redefinition building error by
    changing the "asm/perf_regs.h" header path to relative UAPI path.
    (Patch 1/3)
  * Spliting xxx_reg_mask() and xxx_sdt_arg_parse_op() conversion into 2
    patches.

This patch-set remove the below three architecture specific __weak
functions and converted them into the general architecture specific
functions which are dispatched base on "em_machine".

uint64_t arch__intr_reg_mask(void);
uint64_t arch__user_reg_mask(void);
int arch_sdt_arg_parse_op(char *old_op, char **new_op);

The advantage of this conversion is that these architectural functions
can be called even for a different architecture with host instead of
only called on the host architecture.

Although the converted functions shown below can be called on any
architecture, currently they are still only called for the host
architecture (EM_HOST).

int perf_sdt_arg_parse_op(uint16_t e_machine, char *old_op, char **new_op);
uint64_t perf_intr_reg_mask(uint16_t e_machine);
uint64_t perf_user_reg_mask(uint16_t e_machine);

Tests:
  * This patch-set is only tested on x86 platforms. No issues are found
    for both intr-regs and user-regs options.
  * Tests on other architectures are welcomed and appreciated.

History:
  v1: https://lore.kernel.org/all/20260123090938.2222960-1-dapeng1.mi@linux.intel.com/
  v2: https://lore.kernel.org/all/20260127070259.2720468-1-dapeng1.mi@linux.intel.com/

Dapeng Mi (4):
  perf regs: Fix abort for "-I" or "--user-regs" options
  perf arch: Update arch headers to use relative UAPI paths
  perf regs: Remove __weak attributive arch__xxx_reg_mask() functions
  perf regs: Remove __weak attributive arch_sdt_arg_parse_op() function

 tools/perf/arch/arm/include/perf_regs.h       |   2 +-
 tools/perf/arch/arm/util/Build                |   2 -
 tools/perf/arch/arm/util/perf_regs.c          |  13 -
 tools/perf/arch/arm64/include/perf_regs.h     |   2 +-
 tools/perf/arch/arm64/util/Build              |   1 -
 tools/perf/arch/arm64/util/perf_regs.c        | 141 ---------
 tools/perf/arch/csky/Build                    |   1 -
 tools/perf/arch/csky/include/perf_regs.h      |   2 +-
 tools/perf/arch/csky/util/Build               |   1 -
 tools/perf/arch/csky/util/perf_regs.c         |  13 -
 tools/perf/arch/loongarch/include/perf_regs.h |   2 +-
 tools/perf/arch/loongarch/util/Build          |   1 -
 tools/perf/arch/loongarch/util/perf_regs.c    |  13 -
 tools/perf/arch/mips/include/perf_regs.h      |   2 +-
 tools/perf/arch/mips/util/Build               |   1 -
 tools/perf/arch/mips/util/perf_regs.c         |  13 -
 tools/perf/arch/powerpc/include/perf_regs.h   |   2 +-
 tools/perf/arch/powerpc/util/Build            |   1 -
 tools/perf/arch/powerpc/util/perf_regs.c      | 172 -----------
 tools/perf/arch/riscv/include/perf_regs.h     |   9 +-
 tools/perf/arch/riscv/util/Build              |   1 -
 tools/perf/arch/riscv/util/perf_regs.c        |  13 -
 tools/perf/arch/s390/include/perf_regs.h      |   2 +-
 tools/perf/arch/s390/util/Build               |   1 -
 tools/perf/arch/s390/util/perf_regs.c         |  13 -
 tools/perf/arch/x86/include/perf_regs.h       |   2 +-
 tools/perf/arch/x86/util/Build                |   1 -
 tools/perf/arch/x86/util/perf_regs.c          | 283 ------------------
 tools/perf/util/evsel.c                       |   4 +-
 tools/perf/util/parse-regs-options.c          |  13 +-
 .../util/perf-regs-arch/perf_regs_aarch64.c   | 139 ++++++++-
 .../perf/util/perf-regs-arch/perf_regs_arm.c  |   7 +-
 .../perf/util/perf-regs-arch/perf_regs_csky.c |   7 +-
 .../util/perf-regs-arch/perf_regs_loongarch.c |   7 +-
 .../perf/util/perf-regs-arch/perf_regs_mips.c |   7 +-
 .../util/perf-regs-arch/perf_regs_powerpc.c   | 183 ++++++++++-
 .../util/perf-regs-arch/perf_regs_riscv.c     |   7 +-
 .../perf/util/perf-regs-arch/perf_regs_s390.c |   7 +-
 .../perf/util/perf-regs-arch/perf_regs_x86.c  | 281 ++++++++++++++++-
 tools/perf/util/perf_regs.c                   | 109 ++++++-
 tools/perf/util/perf_regs.h                   |  27 +-
 tools/perf/util/probe-file.c                  |   3 +-
 42 files changed, 787 insertions(+), 724 deletions(-)
 delete mode 100644 tools/perf/arch/arm/util/perf_regs.c
 delete mode 100644 tools/perf/arch/arm64/util/perf_regs.c
 delete mode 100644 tools/perf/arch/csky/Build
 delete mode 100644 tools/perf/arch/csky/util/Build
 delete mode 100644 tools/perf/arch/csky/util/perf_regs.c
 delete mode 100644 tools/perf/arch/loongarch/util/perf_regs.c
 delete mode 100644 tools/perf/arch/mips/util/perf_regs.c
 delete mode 100644 tools/perf/arch/powerpc/util/perf_regs.c
 delete mode 100644 tools/perf/arch/riscv/util/perf_regs.c
 delete mode 100644 tools/perf/arch/s390/util/perf_regs.c
 delete mode 100644 tools/perf/arch/x86/util/perf_regs.c

-- 
2.34.1


