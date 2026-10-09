Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA921CA6018
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 03:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yEryO6q/rSnNf7cAisuB4DggIjqAxg4m34Zq90Y4CtY=; b=Czj3gLwtQDnSSb938AhuX8ObtR
	klioUdNQYkVfwu8sEIqaljmpiIH7+JdfWgqheGLDIknYI/6Ikd0TQHm+mLV1ebaNYL7KpCKNHN1nc
	34hBmWigIVeJL88spFPuAF8lN+MG5yriGr2knewMSc4qDArgXi7R5O9U3Zd2mGJPVHZW8Mn6Kd7T8
	wvUMAzLiv+AYTK9is5zPS3aLQtAP4VGc+nA7VYI1cnw2Xs4jRQLixsaVPj2xgy0HPoW5hBekbhw3n
	FoioiXYkV3U2B071KpSWL8qSIC6GbE8vY+iM5s5ojaELfbS3oeIECD6ZIKwwV+zyIhW28elASRj01
	YQj2UOrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF1Gb-00000005MfJ-4BwE;
	Fri, 09 Oct 2026 03:27:30 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF1GY-00000005MdK-1n6G;
	Fri, 09 Oct 2026 03:27:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791516442; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=yEryO6q/rSnNf7cAisuB4DggIjqAxg4m34Zq90Y4CtY=;
	b=RavHdLXOAPA40FYTIiclSUABwfIn0k6bwKgufVJZwchocNPs8tnMIltXOGucgPuYP/v3W560gLoq5HUL8s7jMkExXwka/0eFc6E/zR0NlKgxdifjGxTC2UgS2Lg3XZ59LaVMH949EiwqJ//7oNV7ywBi5sHsq3ZuJMfVy1pjVbs=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R371e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=23;SR=0;TI=SMTPD_---0XCS-sIR_1791516435;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XCS-sIR_1791516435 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 09 Oct 2026 11:27:20 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: acme@kernel.org,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org
Cc: mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	leo.yan@linux.dev,
	john.g.garry@oracle.com,
	will@kernel.org,
	mike.leach@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	guoren@kernel.org,
	anup@brainfault.org,
	david.laight.linux@gmail.com,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] perf riscv: Implement rdtsc()
Date: Fri,  9 Oct 2026 11:27:13 +0800
Message-ID: <20261009032715.2841-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_202726_959901_B5F5FBAC 
X-CRM114-Status: GOOD (  14.34  )
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

tools/perf falls back to the __weak rdtsc() stub in tools/perf/util/tsc.c
on every architecture that does not override it, riscv included.  The
stub returns a constant 0, so anything that reaches for the counter gets
a value that means nothing and cannot tell it apart from a counter that
happens to be at 0.

The time CSR is a natural TSC equivalent on riscv: readable from user
mode, constant frequency, and the same counter that riscv's
arch_perf_update_userpage() feeds the user page conversion fields from,
ever since commit 83c5e13b8cbb ("riscv: Prepare for user-space perf
event mmap support").  This series registers that on the tools side.

The two patches are split so that the first stands on its own:

1. Implement rdtsc() over the time CSR for riscv64.

2. Have the build system say which architectures have a usable counter,
   instead of a list of compiler macros inside the test.

What this is worth beyond the subtest result:

1. The subtest is the only reader of those conversion fields riscv
   can run, so it guards arithmetic that has shipped unexercised;
   registering the counter at the same time leaves a future riscv
   auxtrace driver the reading and the conversion already in place.

2. The flag lets a caller ask whether the architecture has a counter
   before it uses the value, without keeping its own copy of a list
   that has to be edited every time an architecture grows an
   implementation.

Changes since v2:
- Key off IS_BUILTIN(HAVE_RDTSC), with <tools/config.h> included, instead
  of an #ifndef block, as Adrian Hunter suggested.
- Collected the tags received on v2.

Changes since v1:
- Define rdtsc() for RV64 only. RV32 now keeps the weak stub.
- Declare the capability through the build system rather than through a
  weak arch__rdtsc_supported() hook, following the PERF_HAVE_JITDUMP
  pattern, as Leo Yan suggested.

Tests:
======
- Build side, this version: the compile command of
  tests/perf-time-to-tsc.o carries -DHAVE_RDTSC on riscv64, arm64 and the
  x86_64 host, and does not on riscv32, so RV32 stays on the weak stub.
- Same object built on the host with and without the flag: with it the
  "TSC support" subtest returns TEST_OK with the skip branch folded out,
  without it the pr_debug and the TEST_SKIP branch are still there.  That
  is the branch the #ifndef used to pick, so the change is behaviour
  preserving.
- riscv64 QEMU virt guest with sscofpmf, as reported on v2: before the
  series the "TSC support" subtest skips and the conversion subtest fails
  while comparing against the stub's constant 0; after, both report Ok.
  Patch 1 is unchanged here and the subtest decision is behaviour
  preserving, so v3 was verified on the build side only.

Chen Pei (2):
  perf riscv: Implement rdtsc()
  perf tsc: Declare TSC support from the build system

 tools/perf/Makefile.config          |  4 ++++
 tools/perf/arch/arm64/Makefile      |  1 +
 tools/perf/arch/riscv/Makefile      |  1 +
 tools/perf/arch/riscv/util/Build    |  1 +
 tools/perf/arch/riscv/util/tsc.c    | 27 +++++++++++++++++++++++++++
 tools/perf/arch/x86/Makefile        |  1 +
 tools/perf/tests/perf-time-to-tsc.c | 14 ++------------
 7 files changed, 37 insertions(+), 12 deletions(-)
 create mode 100644 tools/perf/arch/riscv/util/tsc.c

-- 
2.50.1


