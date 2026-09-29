Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A73CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 03:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nAu9I11wCZbEgfjoBBQOuGXm3l1adZEVZbodMdFHRcA=; b=piGvXyhiRshbTrsHFf0c8B8mb0
	WDHNK/6EAUeDZ+VHIMsdoFb/+63/+x3jP71xikdMQGBY5nhhdc8sR9KBtdR7EmBK6XJo2OP1eAIVa
	k6A9ot5utTqudT0vutgucARyanZVsRGRtljM2BKV6+hEhXrSvzuiI14WeOgDBlC6cW8Wx4Rf3UvPS
	l8/3OMZ93wo6NrgbcaGjk86vs27zizyEiiqUfb8SwN+wdOfMEVaiB2KCq6N4US6fmtvqgP5aAv0S9
	vocE5H+0WL5cB03/6sZIgT9C6lug5ju1oClMyLNZ9YyS8VAXrMSWYaeC2eDL3k/neF5165UEADGdG
	Q38s288A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOiw-00000002F29-00hw;
	Tue, 29 Sep 2026 03:41:46 +0000
Received: from out199-6.us.a.mail.aliyun.com ([47.90.199.6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOit-00000002F16-1mKR;
	Tue, 29 Sep 2026 03:41:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790653298; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=nAu9I11wCZbEgfjoBBQOuGXm3l1adZEVZbodMdFHRcA=;
	b=GMV9XxXGhunyLWbLkLyHvk5t2HqyGidpsgcYFfEjVi5JOmL8zHWBi9tvPdNFVviTahPhJdAtlBq+BiIyfzkAOehVxpphWszB6l5q6wKtcZ9H5TX5SIQa1ZdJN23cASV8fZofAgmMn2mnEu+qKQ7rgNGAsCQIHu+QEYYC1B0aUCE=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XBrsV8l_1790653293;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XBrsV8l_1790653293 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 29 Sep 2026 11:41:37 +0800
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
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] perf riscv: Implement rdtsc()
Date: Tue, 29 Sep 2026 11:41:31 +0800
Message-ID: <20260929034133.2153-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_204143_742858_FA1C4789 
X-CRM114-Status: GOOD (  13.16  )
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

Changes since v1:
- Define rdtsc() for RV64 only. RV32 now keeps the weak stub.
- Declare the capability through the build system rather than through a
  weak arch__rdtsc_supported() hook, following the PERF_HAVE_JITDUMP
  pattern, as Leo Yan suggested.

Tests:
======
- riscv64 QEMU virt guest with sscofpmf, comparing the build before the
  series with the build after it: before, the "TSC support" subtest skips
  and the conversion subtest fails while comparing against the stub's
  constant 0; after, both report Ok.
- riscv64 and riscv32 cross builds: the compile command of
  tests/perf-time-to-tsc.o carries -DHAVE_RDTSC on rv64 and not on
  rv32, so RV32 stays on the weak stub.
- x86_64 host and arm64 cross builds: -DHAVE_RDTSC is in effect for
  both, and on the host the "TSC support" subtest still reports Ok.

Chen Pei (2):
  perf riscv: Implement rdtsc()
  perf tsc: Declare TSC support from the build system

 tools/perf/Makefile.config          |  4 ++++
 tools/perf/arch/arm64/Makefile      |  1 +
 tools/perf/arch/riscv/Makefile      |  1 +
 tools/perf/arch/riscv/util/Build    |  1 +
 tools/perf/arch/riscv/util/tsc.c    | 27 +++++++++++++++++++++++++++
 tools/perf/arch/x86/Makefile        |  1 +
 tools/perf/tests/perf-time-to-tsc.c | 19 ++++---------------
 7 files changed, 39 insertions(+), 15 deletions(-)
 create mode 100644 tools/perf/arch/riscv/util/tsc.c

-- 
2.50.1


