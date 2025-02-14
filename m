Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93950C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 11:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TOfh3FhVQkDA7LTv1HV6A7ZxubTAusax/NEXIfDBhVo=; b=l0Owz5AyoKTcccKXBwbnZ9LBXs
	4/4o8CnFj1gEWtUFeD1jaUkLJ+zTBigpDj2OoSRu/t8Kj8WRbxIOi/tKqM4E4gJRvL2/92JvxHgHI
	IBQQgl+2IKY7bZ1SWIvU0Tu8AgRZwht91hrkFLwoA9BQW2dcS6zCu2ujPPa8LYufulK95rOfw6rjx
	ORDgPdH+JARRxIcV/miBSMAkO0j7AoPVJ5F5wcruftfNCvlHw56hGD2XI0PsE6dJFdVCRQZlBrYWH
	1mFTwuCsYU4voieVYSjl+j/I2AGdsKYgN82KqOGAzpIbCgz59GE1wPseG4aBePbHM5nvISaVfz5aq
	IRKUe79A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1titcH-0000000Ectp-2o60;
	Fri, 14 Feb 2025 11:12:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1titad-0000000EcTj-1HGv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 11:10:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70FFF113E;
	Fri, 14 Feb 2025 03:10:54 -0800 (PST)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1865B3F6A8;
	Fri, 14 Feb 2025 03:10:31 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH] perf: arm64: Fix compilation error
Date: Fri, 14 Feb 2025 11:10:25 +0000
Message-Id: <20250214111025.14478-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_031035_388195_A2704CE6 
X-CRM114-Status: GOOD (  13.13  )
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

Since the commit dc6d2bc2d893 ("perf sample: Make user_regs and
intr_regs optional"), the building for Arm64 reports error:

arch/arm64/util/unwind-libdw.c: In function ‘libdw__arch_set_initial_registers’:
arch/arm64/util/unwind-libdw.c:11:32: error: initialization of ‘struct regs_dump *’ from incompatible pointer type ‘struct regs_dump **’ [-Werror=incompatible-pointer-types]
   11 |  struct regs_dump *user_regs = &ui->sample->user_regs;
      |                                ^
cc1: all warnings being treated as errors
make[6]: *** [/home/niayan01/linux/tools/build/Makefile.build:85: arch/arm64/util/unwind-libdw.o] Error 1
make[5]: *** [/home/niayan01/linux/tools/build/Makefile.build:138: util] Error 2
arch/arm64/tests/dwarf-unwind.c: In function ‘test__arch_unwind_sample’:
arch/arm64/tests/dwarf-unwind.c:48:27: error: initialization of ‘struct regs_dump *’ from incompatible pointer type ‘struct regs_dump **’ [-Werror=incompatible-pointer-types]
   48 |  struct regs_dump *regs = &sample->user_regs;
      |                           ^

To fix the issue, use the helper perf_sample__user_regs() to retrieve
the user_regs.

Fixes: dc6d2bc2d893 ("perf sample: Make user_regs and intr_regs optional")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/arch/arm64/tests/dwarf-unwind.c | 2 +-
 tools/perf/arch/arm64/util/unwind-libdw.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/arch/arm64/tests/dwarf-unwind.c b/tools/perf/arch/arm64/tests/dwarf-unwind.c
index b2603d0d3737..440d00f0de14 100644
--- a/tools/perf/arch/arm64/tests/dwarf-unwind.c
+++ b/tools/perf/arch/arm64/tests/dwarf-unwind.c
@@ -45,7 +45,7 @@ static int sample_ustack(struct perf_sample *sample,
 int test__arch_unwind_sample(struct perf_sample *sample,
 		struct thread *thread)
 {
-	struct regs_dump *regs = &sample->user_regs;
+	struct regs_dump *regs = perf_sample__user_regs(sample);
 	u64 *buf;
 
 	buf = calloc(1, sizeof(u64) * PERF_REGS_MAX);
diff --git a/tools/perf/arch/arm64/util/unwind-libdw.c b/tools/perf/arch/arm64/util/unwind-libdw.c
index e056d50ab42e..b89b0a7e5ad9 100644
--- a/tools/perf/arch/arm64/util/unwind-libdw.c
+++ b/tools/perf/arch/arm64/util/unwind-libdw.c
@@ -8,7 +8,7 @@
 bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
 {
 	struct unwind_info *ui = arg;
-	struct regs_dump *user_regs = &ui->sample->user_regs;
+	struct regs_dump *user_regs = perf_sample__user_regs(ui->sample);
 	Dwarf_Word dwarf_regs[PERF_REG_ARM64_MAX], dwarf_pc;
 
 #define REG(r) ({						\
-- 
2.34.1


