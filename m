Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE75DC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 08:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U08S6bLxyQhDFXz9H3gyB4utEcaZGmnAtgkdoh3pZ5c=; b=EXgq3dQ+ULYcm95vCxqWU/FrtB
	DpvtaMOmxJc5phqyOsbGPEaQG/S3u38B4HIiUKzR9jTw6OKafWhfpkCqjZy7dGoLpKLE5bocr7Khv
	lZKPkalzbch8YEIeOLSJGdOgHndFNVoZZAyHV0MoGKcuYV1d8zAIlrh/NBxi4nF9t0Z1dgdDsSzNR
	Ge2vdOIVklm0K6oCHvq+i6+Feimtm7RzQgVuRxPA30Sa9/0pLhAh2gML2BjQkG8nvD/KY8DmpxC5D
	29r55lgR3gy8qfqF638wwfyQxR+YytwKcw7yEroYalpHwfiJJRX3CaWpNI7JA9Zrhz8cWa0WGnrZX
	n/0lqmjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0XM-0000000DVSO-3oLy;
	Fri, 14 Mar 2025 08:37:00 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0Hd-0000000DQvO-3xqG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 08:20:49 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4ZDcfS1V3szCs8d;
	Fri, 14 Mar 2025 16:17:04 +0800 (CST)
Received: from kwepemf500004.china.huawei.com (unknown [7.202.181.242])
	by mail.maildlp.com (Postfix) with ESMTPS id D6A5E1800E4;
	Fri, 14 Mar 2025 16:20:37 +0800 (CST)
Received: from lihuafei.huawei.com (10.90.53.74) by
 kwepemf500004.china.huawei.com (7.202.181.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 14 Mar 2025 16:20:36 +0800
From: Li Huafei <lihuafei1@huawei.com>
To: <namhyung@kernel.org>, <acme@kernel.org>, <leo.yan@linux.dev>,
	<james.clark@linaro.org>, <mark.rutland@arm.com>, <john.g.garry@oracle.com>,
	<will@kernel.org>, <irogers@google.com>
CC: <mike.leach@linaro.org>, <peterz@infradead.org>, <mingo@redhat.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<kjain@linux.ibm.com>, <mhiramat@kernel.org>, <atrajeev@linux.vnet.ibm.com>,
	<sesse@google.com>, <adrian.hunter@intel.com>, <kan.liang@linux.intel.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <lihuafei1@huawei.com>
Subject: [PATCH 0/7] Add data type profiling support for arm64
Date: Sat, 15 Mar 2025 00:21:30 +0800
Message-ID: <20250314162137.528204-1-lihuafei1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.74]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf500004.china.huawei.com (7.202.181.242)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_012046_304578_EE591FEB 
X-CRM114-Status: GOOD (  15.97  )
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

Hi,

This patchset supports arm64 perf data type profiling. Data type
profiling was introduced by Namhyung [1], which associates PMU sampling
(here referring to memory access-related event sampling) with the
referenced data types, providing developers with an effective tool for
analyzing the impact of memory usage and layout. For more detailed
background, please refer to [2].

Namhyung initially supported this feature only on x86, and later Athira
added support for it on powerpc [3]. Unlike the x86 implementation, the
powerpc implementation parses operands directly from raw instruction
code instead of using the results from assembler disassembly. As Athira
mentioned, this is mainly because not all memory access instructions on
powerpc have explicit memory reference assembler notations '()' in their
assembly code. On arm64, all memory access instructions have the
notation '[]', so my implementation is similar to x86, using the
disassembly results from objdump, llvm, or libcapstone, and parsing
based on strings. I believe this has the advantage of reusing the
complex instruction parsing logic of the assembler, but it may not
perform as well as raw instruction parsing in terms of efficiency.

Below is a brief description of this patchset:
 - Patch 1 first identifies load and store instructions and provides a
   parsing function.
 - Patches 2-3 are refactoring patches. They primarily move the code for
   extracting registers and offsets to specific architecture
   implementations. Additionally, a new callback function
   'extract_reg_offset' is introduced to avoid having too many
   architecture-specific implementations in the function
   'annotate_get_insn_location()'.
 - Patch 4 implements the extract_reg_offset callback for arm64.
   Currently, it does not support parsing instructions with register
   pairs or register offsets in operands. Register pairs often appear in
   stack push/pop instructions, and register offsets are common when
   accessing per-CPU variables, both of which require special handling.
 - Patch 5 adds support for instruction tracing on arm64, primarily
   addressing the issue where DWARF does not generate information for
   intermediate pointers in pointer chains.
 - Patches 6-7 further enhance instruction tracing. Patch 6 supports
   parsing accesses to global variables, while Patch 7 focuses on
   resolving accesses to the kernel's current pointer.

There are still areas for improvement in the current implementation:
 - Support more types of memory access instructions, such as those
   involving register pairs and register offsets.
 - Handle all data processing instructions (e.g., mov, add), as these
   instructions can change the state of registers and may affect the
   accuracy of instruction tracking.
 - Supporting parsing of special memory access scenarios like per-CPU
   variables and arrays.

The patch set is based on 6.14-rc6 (commit 80e54e84911a). After applying
this patch set, the date type profiling results on arm64 are as follows
(SPE support is required):

 # perf mem record -a -K -- sleep 1
 # perf annotate --data-type --type-stat --stdio
 Only instruction-based sampling period is currently supported by Arm SPE.
 Annotate data type stats:
 total 556, ok 357 (64.2%), bad 199 (35.8%)
 -----------------------------------------------------------
         10 : no_sym
         36 : no_insn_ops
         65 : no_var
         70 : no_typeinfo
         18 : bad_offset
         59 : insn_track
 
 Annotate type: 'struct rq' in [kernel.kallsyms] (29 samples):
 ============================================================================
  Percent     offset       size  field
   100.00          0      0xe80  struct rq        {
     0.00          0        0x4      raw_spinlock_t      __lock {
     0.00          0        0x4          arch_spinlock_t raw_lock {
     0.00          0        0x4              union        {
     0.00          0        0x4                  atomic_t        val {
     0.00          0        0x4                      int counter;
                                                 };
     0.00          0        0x2                  struct   {
     0.00          0        0x1                      u8  locked;
     0.00        0x1        0x1                      u8  pending;
                                                 };
     0.00          0        0x4                  struct   {
     0.00          0        0x2                      u16 locked_pending;
     0.00        0x2        0x2                      u16 tail;
                                                 };
                                             };
                                         };
                                     };
    13.79        0x4        0x4      unsigned int        nr_running;
    13.79        0x8        0x4      unsigned int        nr_numa_running;
     0.00        0xc        0x4      unsigned int        nr_preferred_running;
     0.00       0x10        0x4      unsigned int        numa_migrate_on;
     0.00       0x18        0x8      long unsigned int   last_blocked_load_update_tick;
     0.00       0x20        0x4      unsigned int        has_blocked_load;
     0.00       0x40       0x20      call_single_data_t  nohz_csd {
     0.00       0x40       0x10          struct __call_single_node       node {
     0.00       0x40        0x8              struct llist_node   llist {
     0.00       0x40        0x8                  struct llist_node*      next;
                                             };
     0.00       0x48        0x4              union        {
     0.00       0x48        0x4                  unsigned int    u_flags;
     0.00       0x48        0x4                  atomic_t        a_flags {
     0.00       0x48        0x4                      int counter;
                                                 };
                                             };
     ...

Thanks,
Huafei

[1] https://lore.kernel.org/lkml/20231213001323.718046-1-namhyung@kernel.org/
[2] https://lwn.net/Articles/955709/
[3] https://lore.kernel.org/all/20240718084358.72242-1-atrajeev@linux.vnet.ibm.com/#r

Li Huafei (7):
  perf annotate: Handle arm64 load and store instructions
  perf annotate: Advance the mem_ref check to mov__parse()
  perf annotate: Add 'extract_reg_offset' callback function to extract
    register number and access offset
  perf annotate: Support for the 'extract_reg_offset' callback function
    in arm64
  perf annotate-data: Support instruction tracking for arm64
  perf annotate-data: Handle arm64 global variable access
  perf annotate-data: Handle the access to the 'current' pointer on
    arm64

 tools/perf/arch/arm64/annotate/instructions.c | 302 +++++++++++++++++-
 .../perf/arch/powerpc/annotate/instructions.c |  10 +
 tools/perf/arch/x86/annotate/instructions.c   |  99 ++++++
 tools/perf/util/Build                         |   1 +
 tools/perf/util/annotate-data.c               |  23 +-
 tools/perf/util/annotate-data.h               |   4 +-
 tools/perf/util/annotate.c                    | 112 +------
 tools/perf/util/disasm.c                      |  14 +
 tools/perf/util/disasm.h                      |   4 +
 tools/perf/util/dwarf-regs-arm64.c            |  25 ++
 tools/perf/util/include/dwarf-regs.h          |   7 +
 11 files changed, 490 insertions(+), 111 deletions(-)
 create mode 100644 tools/perf/util/dwarf-regs-arm64.c

-- 
2.25.1


