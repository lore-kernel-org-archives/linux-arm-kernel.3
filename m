Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EF8D25954
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 07:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y7hKFTZmLWROuxYljJ/HFgvZeLzACVWcpOdIFiA5Jd4=; b=LYRxodeZsV82O3fL3ujWzJNEnG
	5H3fHkPLkjVsUFXbKkmx540yadhPBv5kHRuzYKvNarUa4b4GmkMeTqUJEeb30V4M62ATQbRaoDpp1
	Ku1IYIqT9OUCknkstjZytbJFHn7roiCWT/xMmbCfTdWv2rkxGwVD96csTePW9KLzL2rebdR4TAQIO
	/lcSrZmt99MmJtp0GBqPVu7+r4s5K8w0eVHTtTZbULMMio/F+t2qKkSZHoLFcSHPMaLw4rDVmUiSb
	lIyydp8n+2wgZrcLIu1GnuMueFtV33sBkGUIHHimKUTrFkFgsHe0+QLAQJI0omoygStAWvb0cJOeW
	SQQ6nsCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkd9m-0000000Djof-1kgA;
	Tue, 27 Jan 2026 07:06:34 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkd9k-0000000Djo2-0s8X;
	Tue, 27 Jan 2026 07:06:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769497592; x=1801033592;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ACZftaD9x/8kasD2JGn/3hsCxktEdhw4iX+XDtFVowE=;
  b=gYNLPl0qowu+1WQDY+frD4j6tpdWBfJ7Y693S85qHHxeWxcN5OEYevsz
   t5mpfMrIynvXdLFaVxHu60OHYjQ6mxC+vEBi0vXzSAoHIhncPhGrbjZtT
   oLRsgcXe/kSYN/e/CWXAB7u7hhJQ4s6OZcFia+zombMkPlN48xPmVSDZz
   yyCEFIpxqm9Ks4HytFnjpDZ/4A4WhfYe/sx9lIQ/IVEdG30awAhRN/m8K
   2ZXOKNxV9O7oTfbAXQuFt3aWOCz17xfuaQIFvTGzPB+fPAtxhFtXS9rjN
   dItyhWjz7KSRN1F4pBIk6PIecIhEZyQZ9FhKPpVFwQ9vz1DFvzAOvNFfh
   Q==;
X-CSE-ConnectionGUID: W89nfiiASPa66/R/i+YGPg==
X-CSE-MsgGUID: z16v79d6R22XDeg6NJaoxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70742982"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="70742982"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 23:06:29 -0800
X-CSE-ConnectionGUID: VmYqbMMUSaqYTGZ/i+axQQ==
X-CSE-MsgGUID: rVsPGBUkRDOElYJt+COD9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="208331249"
Received: from spr.sh.intel.com ([10.112.229.196])
  by fmviesa009.fm.intel.com with ESMTP; 26 Jan 2026 23:06:24 -0800
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
Subject: [Patch v2 0/3] Perf tools: remove arch-specific __weak
Date: Tue, 27 Jan 2026 15:02:56 +0800
Message-Id: <20260127070259.2720468-1-dapeng1.mi@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_230632_264451_043C09D2 
X-CRM114-Status: GOOD (  11.88  )
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

No functional changes are intended in this patch-set.

Please notice this patchset depends on Ian's two patchset,
[1] https://lore.kernel.org/lkml/20260117052849.2205545-1-irogers@google.com/
[2] https://lore.kernel.org/all/20260121021735.3625244-1-irogers@google.com/

Tests:
  * This patch-set is only tested on x86 platforms. No issues are found
    for both intr-regs and user-regs options.
  * Tests on other architectures are welcomed and appreciated.

Changes:
 v1 -> v2:
  * Fixing "PERF_REG_EXTENDED_MASK" redefinition building error by
    changing the "asm/perf_regs.h" header path to relative UAPI path.
    (Patch 1/3)
  * Spliting xxx_reg_mask() and xxx_sdt_arg_parse_op() conversion into 2
    patches.

History:
  v1: https://lore.kernel.org/all/20260123090938.2222960-1-dapeng1.mi@linux.intel.com/


Dapeng Mi (3):
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
 tools/perf/arch/csky/include/perf_regs.h      |   1 +
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
 tools/perf/util/parse-regs-options.c          |   2 +-
 .../util/perf-regs-arch/perf_regs_aarch64.c   | 137 ++++++++-
 .../perf/util/perf-regs-arch/perf_regs_arm.c  |   7 +-
 .../perf/util/perf-regs-arch/perf_regs_csky.c |   7 +-
 .../util/perf-regs-arch/perf_regs_loongarch.c |   7 +-
 .../perf/util/perf-regs-arch/perf_regs_mips.c |   7 +-
 .../util/perf-regs-arch/perf_regs_powerpc.c   | 176 ++++++++++-
 .../util/perf-regs-arch/perf_regs_riscv.c     |   7 +-
 .../perf/util/perf-regs-arch/perf_regs_s390.c |   7 +-
 .../perf/util/perf-regs-arch/perf_regs_x86.c  | 281 ++++++++++++++++-
 tools/perf/util/perf_regs.c                   | 103 ++++++-
 tools/perf/util/perf_regs.h                   |  27 +-
 tools/perf/util/probe-file.c                  |   3 +-
 42 files changed, 767 insertions(+), 717 deletions(-)
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


