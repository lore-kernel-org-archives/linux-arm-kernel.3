Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28772E7C6E0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 20:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:Mime-Version:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QaGUZTYnRQ2wGpunAGr/0FtMXdyckbXL2oq4bK6APm0=; b=cfn7ptoWI/F99nVqRKJpCc4OCQ
	+R3FNYV84iWBlEZ0IauNOdppegoihZ/vxQgbLMUScBR6U1965Cjidknan6OLB77K7uasFEB10vTHp
	RIcGAhX1Sl/jHICI+iGsRfnfoqoPOCI62u4/tAxX31Rd0F07BSBVOA5uwcJrIfcR5RPR+Tp2xl4ia
	WMtdVKwbVqxRyX3nQtOMl+WgkCNgvxNuvbodKGioPwD+eBQKLiMxVFfc14RmB9kITStbDXPGtbYgQ
	pW5Ax1RlvAKk5cmfh7AmbwhK8nuLWtcsWsOwHmIg0QETH4ovFYJDCe4ULuwNGzmXSQpK2Xm0W1MxO
	pmKbFvPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmHAu-00000002wSF-0idg;
	Sat, 31 Jan 2026 20:02:32 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmHAr-00000002wQn-2p5N
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 20:02:31 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2b71041d135so3197986eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 12:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769889748; x=1770494548; darn=lists.infradead.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QaGUZTYnRQ2wGpunAGr/0FtMXdyckbXL2oq4bK6APm0=;
        b=Ro+vv5xmujxFKPjzp/bjDqBhSKPV3LEJxHvCIq+Bc+Q12O/FE8QjFbTqw6KpqHCDga
         otQ7a8ZacWu3QgBP/DXbQj2zfvhm9IaG3354zPEL91N6oTZwjU7Dil8K4cnXDq1mX1fh
         2TQeDd/lCWc+DiJUfEjZVHgRMfLkBI/rTW4SMoaIjz+lio1TNh4VvNZswmeD0Qc5YzIR
         HWdc5F3Nuo5MbNMQ8xYpPz4LRjFAZfvszh6lASCNqTEcU/PRx2lbwp3gLvMJPVtyD1Wm
         FZaC62KVgD5+GhVBvTz/0PHg0S7leEotOB/NliY3cD8PN5+zv7tDcA7+JNnPthlKHOPw
         dIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769889748; x=1770494548;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QaGUZTYnRQ2wGpunAGr/0FtMXdyckbXL2oq4bK6APm0=;
        b=ptVjepsJHh2D+cQfxbjQxcOA5h76/TIfej9IRNs/pOcpoiR2jkmaVAWhmpvT8tuVoy
         vuuP16O6MmJdlIz7C5oNb7XmQljPRBnu60oZYKgy/kfFj++DVsrmOi1s02cHQAtq3TM+
         Mji4FhS2oZFsJX3KUs28AS6a/kWZ0NlGlci4sMEAav/nNYnC4LEDttmEW9hk1tXGNz9n
         R2JVdd9yoQ6B9THhtJc1dDqqmjsdsIkyeZMRIrrthR8+eZ1jBjYP60YXvgGD+xhSoIPP
         h8yjrUwxQZvEblvsdz4AtrKIks+JRXwT0Q62iZRUchUhUiBaoh/cSSYlM2+1tWVwWRLq
         LJMA==
X-Forwarded-Encrypted: i=1; AJvYcCVX57uKgIu5bwFcHlxzAuV6MZ9pi7Ah0eYmgOhmzG9OFec1aK0baiNevDZWyDHb99M8jM1t8JE7/cXO5hN5yrcZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyUp7zezJZPqkHQHP/uOVztWmXvxMJxQyWG6w84ZB3K4cInZQ9H
	CgPWS65APl7XvFxzoUdzqmxdqcsyD/oub3uPQyk1AMZUOFBOSnI9vva9pZ+dCXLfD2r6B0rsGUe
	bZsVe6Hpyjg==
X-Received: from dlbpy24.prod.google.com ([2002:a05:7022:e998:b0:123:2708:9404])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:608d:b0:123:2de5:346e
 with SMTP id a92af1059eb24-125c18bebdbmr2411145c88.0.1769889747533; Sat, 31
 Jan 2026 12:02:27 -0800 (PST)
Date: Sat, 31 Jan 2026 12:02:18 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260131200224.1296136-1-irogers@google.com>
Subject: [PATCH v2 0/6] perf Cross platform KVM support
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Shimin Guo <shimin.guo@skydio.com>, Yunseong Kim <ysk@kzalloc.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Quan Zhou <zhouquan@iscas.ac.cn>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Blake Jones <blakejones@google.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Howard Chu <howardchu95@gmail.com>, 
	Anubhav Shelat <ashelat@redhat.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Chun-Tse Shao <ctshao@google.com>, Andi Kleen <ak@linux.intel.com>, 
	Dmitry Vyukov <dvyukov@google.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_120229_712106_36525C04 
X-CRM114-Status: GOOD (  15.63  )
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

The existing perf kvm code is using the arch directory, which means a
data file can only be processed on the same machine type that it was
recorded. Switch to using the ELF machine of the session at runtime to
set up the KVM support, making it cross-architectural. So that the ELF
machine number is available early in initialization add it to the perf
data file header.

v2: Wire up the perf data header to have the e_machine and allow early
    initialization of the KVM operations based upon it.
v1: https://lore.kernel.org/lkml/20260128074106.788156-1-irogers@google.com/

Ian Rogers (6):
  perf test kvm: Add stat live testing
  perf kvm stat: Remove use of the arch directory
  perf kvm: Wire up e_machine
  perf session: Add e_flags to the e_machine helper
  perf header: Add e_machine/e_flags to the header
  perf thread: Don't require machine to compute the e_machine

 tools/perf/Makefile.config                    |   4 -
 tools/perf/arch/arm64/Makefile                |   1 -
 tools/perf/arch/arm64/util/Build              |   1 -
 tools/perf/arch/loongarch/Makefile            |   1 -
 tools/perf/arch/loongarch/util/Build          |   1 -
 tools/perf/arch/powerpc/Makefile              |   1 -
 tools/perf/arch/powerpc/util/Build            |   1 -
 tools/perf/arch/riscv/Makefile                |   1 -
 tools/perf/arch/riscv/util/Build              |   2 -
 tools/perf/arch/s390/Makefile                 |   1 -
 tools/perf/arch/s390/util/Build               |   1 -
 tools/perf/arch/x86/Makefile                  |   1 -
 tools/perf/arch/x86/util/Build                |   1 -
 tools/perf/builtin-kvm.c                      |  73 +++---
 tools/perf/builtin-report.c                   |   4 +-
 tools/perf/builtin-script.c                   |   6 +-
 tools/perf/tests/shell/kvm.sh                 |  30 ++-
 tools/perf/util/Build                         |   3 +-
 tools/perf/util/env.h                         |   3 +
 tools/perf/util/evsel.c                       |   6 +-
 tools/perf/util/evsel.h                       |   1 +
 tools/perf/util/header.c                      |  33 +++
 tools/perf/util/header.h                      |   1 +
 tools/perf/util/kvm-stat-arch/Build           |   6 +
 .../kvm-stat-arch}/arm64_exception_types.h    |   0
 .../kvm-stat-arch}/book3s_hcalls.h            |   0
 .../kvm-stat-arch}/book3s_hv_exits.h          |   0
 .../kvm-stat-arch/kvm-stat-arm64.c}           |  43 ++--
 .../kvm-stat-arch/kvm-stat-loongarch.c}       |  48 ++--
 .../kvm-stat-arch/kvm-stat-powerpc.c}         |  61 ++---
 .../kvm-stat-arch/kvm-stat-riscv.c}           |  42 ++--
 .../kvm-stat-arch/kvm-stat-s390.c}            |  38 ++--
 .../kvm-stat-arch/kvm-stat-x86.c}             |  44 ++--
 .../kvm-stat-arch}/riscv_trap_types.h         |   2 +-
 tools/perf/util/kvm-stat.c                    | 215 +++++++++++++++++-
 tools/perf/util/kvm-stat.h                    |  70 ++++--
 .../scripting-engines/trace-event-python.c    |   8 +-
 tools/perf/util/session.c                     |  62 ++++-
 tools/perf/util/session.h                     |   2 +-
 tools/perf/util/thread.c                      |   5 +
 40 files changed, 606 insertions(+), 217 deletions(-)
 create mode 100644 tools/perf/util/kvm-stat-arch/Build
 rename tools/perf/{arch/arm64/util => util/kvm-stat-arch}/arm64_exception_types.h (100%)
 rename tools/perf/{arch/powerpc/util => util/kvm-stat-arch}/book3s_hcalls.h (100%)
 rename tools/perf/{arch/powerpc/util => util/kvm-stat-arch}/book3s_hv_exits.h (100%)
 rename tools/perf/{arch/arm64/util/kvm-stat.c => util/kvm-stat-arch/kvm-stat-arm64.c} (62%)
 rename tools/perf/{arch/loongarch/util/kvm-stat.c => util/kvm-stat-arch/kvm-stat-loongarch.c} (77%)
 rename tools/perf/{arch/powerpc/util/kvm-stat.c => util/kvm-stat-arch/kvm-stat-powerpc.c} (78%)
 rename tools/perf/{arch/riscv/util/kvm-stat.c => util/kvm-stat-arch/kvm-stat-riscv.c} (57%)
 rename tools/perf/{arch/s390/util/kvm-stat.c => util/kvm-stat-arch/kvm-stat-s390.c} (77%)
 rename tools/perf/{arch/x86/util/kvm-stat.c => util/kvm-stat-arch/kvm-stat-x86.c} (88%)
 rename tools/perf/{arch/riscv/util => util/kvm-stat-arch}/riscv_trap_types.h (96%)

-- 
2.53.0.rc1.225.gd81095ad13-goog


