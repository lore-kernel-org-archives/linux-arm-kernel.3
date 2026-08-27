Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC67C61DCD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sNvDMcYcMTOOUWSf0yI2ssQ/wZJvPJdat4hMuINy2z0=; b=4x3l4NtqwcbC5PkpcBoDpklaQB
	zMjUhxPStonzWgnU9visYr1Tlb8DdQiVQhugORmQhz+VLeg4SVkZ5M6eOK6AjxhKkhZJJdR9HA3u6
	+myp9JFIc0TAzBXGscAGTz6/aS/2FoxNUSP1Gtf8g2JLarEqs+fD1Lp/VjHvTsRa8d2/DkLXEzKK4
	KeHAaipzPrn0kDHW01cRfBD1KEomcjGB4zZq5fiLpk2L0+yvelUumdhxry3PzWpFJSVj7rns8U5LT
	fNwRo11Znve4aSBHFPgoa56MC+v7SEmGAEyzctwcSU4qqlbLdlzzGbdHZpYgwdrz0VWu7lxKFb29n
	i6pKy4sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcvX-00000004Ku5-18eB;
	Thu, 27 Aug 2026 16:26:07 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcuI-00000004Jkk-1OlQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:24:53 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=sNvDMcYcMTOOUWSf0yI2ssQ/wZJvPJdat4hMuINy2z0=;
	b=BJTaHo4n0ixCzKigfowoDpi1iFHxi/BPkiYvQINGtSZCkkOuUVNmJStblIjFJBX0MHygpMizO
	T93Fl6tGtVWApqAi048i50K1FsBqDB3x5gfEBI9dt6Gk9b8F9p3OdAtaAQIuBuLkQM1TcGjS5c6
	8nNX9Wr9Vl2naXdJkZbevwk=
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hW6KC4wvNzHnH56;
	Fri, 28 Aug 2026 00:23:59 +0800 (CST)
Received: from mscpeml500004.china.huawei.com (unknown [7.188.26.250])
	by mail.maildlp.com (Postfix) with ESMTPS id AD9AA40570;
	Fri, 28 Aug 2026 00:24:35 +0800 (CST)
Received: from mscphis00949.huawei.com (10.123.66.11) by
 mscpeml500004.china.huawei.com (7.188.26.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 27 Aug 2026 19:24:35 +0300
From: Nikita Panov <panov.nikita@huawei.com>
To: <catalin.marinas@arm.com>, <akpm@linux-foundation.org>,
	<david@kernel.org>, <ljs@kernel.org>, <vbabka@kernel.org>, <cl@gentwo.org>,
	<linux@armlinux.org.uk>, <will@kernel.org>, <mark.rutland@arm.com>,
	<liam@infradead.org>, <rppt@kernel.org>, <surenb@google.com>,
	<mhocko@suse.com>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <wangkefeng.wang@huawei.com>,
	<artem.kuzin@huawei.com>, <panov.nikita@huawei.com>
Subject: [RFC PATCH 00/18] mm: arm64: Add kernel replication feature
Date: Fri, 28 Aug 2026 00:11:40 +0800
Message-ID: <20260827161158.3618409-1-panov.nikita@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.123.66.11]
X-ClientProxiedBy: mscpeml100003.china.huawei.com (10.199.174.67) To
 mscpeml500004.china.huawei.com (7.188.26.250)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_092450_675561_C24EA8F5 
X-CRM114-Status: GOOD (  30.82  )
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
Reply-To: artem.kuzin@huawei.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Current status:

There were several prior submissions with some sort of replication
for NUMA systems, including one from our side for the x86_64 platform.
In the last couple years, several research articles related to solving
locality issues on NUMA machines through replication emerged as well.

[1]  - arm64 kernel text replication
[2]  - x86 NUMA-aware kernel replication
[3]  - x86 kernel text replication
[4]  - NUMA replication of user data
[5]  - Mitosis: Transparently Self-Replicating Page-Tables for Large-Memory Machines
[6]  - WASP: Workload-Aware Self-Replicating Page-Tables for NUMA Servers
[7]  - PaCaR: Improved Buffered I/O Locality on NUMA Systems with Page Cache Replication
[8]  - Memory page replication for Linux on X86 processors
[12] - Optimize this_cpu_*() ops for non-x86 (ARM64 for this series)

As of today, none of it was merged into mainline.

Patch set description:

This patchset implements initial support of the kernel
text and ro-data replication for arm64 platform.
Linux-next was used as a baseline.
(903c1cf6dff9 Add linux-next specific files for 20260821).
This patch set heavily relies on our previous submission [2],
their generic part is the same, these solutions might be merged into a single one.
However, after thorough re-evaluation, we were not able to observe
performance improvement for the x86 platform, so we have decided to stop this
direction and switch on arm64.

Current implementation supports the next functionality:

1. Replicated kernel text and rodata per NUMA node
2. Vmalloc is able to work with replicated areas, so
   kernel modules text and rodata are also replicated during
   modules loading stage.
3. KPROBES, KGDB and all functionality that depends on
   kernel text patching work without any limitation.
4. KPTI, KASLR, and KASAN are supported.
5. Only part of a translation table related to
   replicated text and rodata is replicated
   (up to 2 pgd entries if kaslr is enabled)
6. 4K + 48bit and 64K + 48/52bit are supported and tested.
7. New cmdline option: "kernel_replication=on|off",
   to configure on the boot stage
8. For verification check dmesg output or /sys/kernel/debug/numa_replication/

In general, setting up a new pgd entry in kernel translation table
not often scenario, most of them are covered by current patch set.

TT overview:
                   NODE 0                   NODE 1
                   KERNEL                   KERNEL
           ---------------------    ---------------------
     PGD   |@| | |@|   | | | |*|    |@| | |@|   | | | |*|
           ---------------------    ---------------------
                              |                        |
            -------------------      -------------------
            |                        |
           ---------------------    ---------------------
     PUD   | | | | |   |@| |*|*|    | | | | |   |@| |*|*|
           ---------------------    ---------------------
                              |                        |
            -------------------      -------------------
            |                        |
           ---------------------    ---------------------
     PMD   |READ-ONLY|MUTABLE  |    |READ-ONLY|MUTABLE  |
           ---------------------    ---------------------
                  |       |                  |     |
                  |       --------------------------
                  |               |          |
                --------       -------      --------
   PHYS         |      |       |     |      |      |
    MEM         --------       -------      --------
                <------>                    <------>
                 NODE 0        Shared        NODE 1
                               between
                               nodes
* - entries unique in each table
@ - same entries accross replicated tables

Since for kernel space and user space different tables are used,
user space tables are not replicated at all, so synchronization
is not required.

Known problems:

1. Other combinations of base page size and va size (especially with 16K pages)
   should be adapted and verified.
2. Replicated translation tables for the vmalloc region are not local right now.
   Allocation performed with default memory policy, so translation tables
   for kernel modules will not be local. However,
   replicated text and rodata of the modules are local.
   In general, vmalloc patch should be cleaned up.
3. Any modifications of kernel PGD level. These modifications
   should be synchronized across all replicated tables.
   Right now, for example, memory hotplug/hotunplug
   lacks this support, vmemmap and kasan regions for
   added memory might not be observed correctly. This could be fixed
   by patching all places in the kernel where swapper_pg_dir
   is modified, or by "lazy" propagation on kernel faults in the pgd-level.
   Propagation approach will not help in the case of pgd_clear()
   on swapper_pg_dir though.

Overall, this patch set in an early PoC stage and require some improvements.

Overhead:

Memory overhead for the kernel itself is about 30MB per NUMA node
  on our deployment. For kernel modules - depends on their sizes, but text
  and ro-data are not that big.
CPU overhead - replication performed on the boot stage. After boot
  only "rare" operations are slowed down -
  module loading, text patching, kernel table pgd-level modifications.

Performance evaluation:

Our local testing was performed on
Kunpeng 920, 128 CPU, 4 nodes, 100Gb for each node.

Microbenchmark:
Kernel module with a huge text section (~50MB) filled with CPU-bound
instructions. For each NUMA node thread is spawned, each thread in a loop
executes isntructions. Total execution time of each thread is measured.
The insmod call bound to node 0 through numactl (less time is better).

node                 0        1        2        3
Before time, s     5.567    7.598   13.294   18.905
After  time, s     5.469    6.960    6.777    5.531

Diff               ~0%      -8.5%    -49%     -70%
In this benchmark, interconnect was not used by any other actors,
so microbenchmark numbers might be significantly improved.

Customer's evaluation:
We were provided with the following feedback on this patch set
directly from our customers. Unfortunately, we do not have details
regarding how these measurements were done other than it was
a production setup.
Evaulation was performed on Kunpeng 920 and 920B platforms:
CEPH distributed storage +5%
StarRocksDB              +5%

Couple more words about patch set and technology:

This patchset was merged into the innovative branch of
the openEuler distributive 1.5 year ago (openEuler-25.03)
and was actively tested in production environment [9], [10].
In addition, besides the kernel part, we have published
user space replication (for translation tables and rodata) as well,
but it is very complex and experimental
even compared to this patch set [11]. With replication in user
space, we were able to achieve the following numbers in
performance improvement:
MySQL + sysbench      1-6%
Spark TPC-H           4-20%
Phoronix test-suite   0-25%

Discussion:

The main question we'd like to discuss is the following:
Should the kernel replication feature be merged into the Linux
somewhere in the future? In any form, not specifically this patch set,
but the core concept itself.

If the answer is yes, please share your thoughts on this patch set. What else
should be fixed (or reimplemented and redsigned completly) in this patch
for mainline in your opinion? We'd be glad to do it, and in that case
I'll send an updated version in the near future.

[1]  https://lwn.net/ml/linux-doc/ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk/
[2]  https://lwn.net/ml/linux-mm/20231228131056.602411-1-artem.kuzin@huawei.com/
[3]  https://lwn.net/Articles/36602/
[4]  https://lwn.net/Articles/45082/
[5]  https://github.com/mitosis-project/mitosis-asplos20-artifact
[6]  https://dl.acm.org/doi/10.1145/3620665.3640369
[7]  https://dl.acm.org/doi/10.1145/3767295.3769359
[8]  https://github.com/Carrefour/linux-replication
[9]  https://mailweb.openeuler.org/archives/list/kernel@openeuler.org/message/C7M5E2K2UD7FV7XYPWPZREJBCOCBIVRN/
[10] https://www.openeuler.org/whitepaper/en/openEuler%2025.03%20Technical%20White%20Paper.pdf
[11] https://mailweb.openeuler.org/archives/list/kernel@openeuler.org/message/73MAUDM6WCGSSOKPZGPNZAYRNQGUR6DE/
[12] https://lore.kernel.org/linux-mm/20260715180455.515692-1-yang@os.amperecomputing.com/

Nikita Panov (18):
  mm: arm64 add Kconfig option for kernel replication
  arm64: align kernel text and rodata
  mm: allow per-NUMA node local P4D/PUD/PMD/PTE allocation
  arm64: add arch callbacks for kernel replication
  mm: per-NUMA node replication core infrastructure
  mm: add support of memory protection for NUMA replicas
  arm64: add support of memory protection for NUMA replicas
  mm: set memory permissions for BPF handlers replicas
  mm: add replicas allocation support for vmalloc
  arm64: enable per-NUMA node kernel text and rodata replication
  mm: enable per-NUMA node kernel text and rodata replication
  arm64: make power management aware about kernel replication
  arm64: make kernel text patching aware about replicas
  arm64: add correct alignment to kimage in efi code
  arm64: add support of NUMA replication for ptdump
  arm64: add kernel modules text and rodata replication support
  mm: init kernel modules with replication support
  mm: introduce kernel cmdline option "kernel_replication="

 .../admin-guide/kernel-parameters.txt         |   7 +
 arch/arm64/include/asm/efi.h                  |  18 +-
 arch/arm64/include/asm/mmu_context.h          |   4 +
 arch/arm64/include/asm/numa_replication.h     |  54 ++
 arch/arm64/include/asm/pgtable.h              |   4 +
 arch/arm64/kernel/alternative.c               |  33 +-
 arch/arm64/kernel/hibernate.c                 |   5 +
 arch/arm64/kernel/module.c                    |  11 +
 arch/arm64/kernel/patching.c                  |  96 ++
 arch/arm64/kernel/sleep.S                     |   8 +
 arch/arm64/kernel/smp.c                       |   8 +
 arch/arm64/kernel/vmlinux.lds.S               |  22 +
 arch/arm64/mm/init.c                          |  49 ++
 arch/arm64/mm/kasan_init.c                    |   2 +
 arch/arm64/mm/mmu.c                           |  42 +-
 arch/arm64/mm/pageattr.c                      |  72 +-
 arch/arm64/mm/ptdump.c                        |  24 +-
 arch/arm64/net/bpf_jit_comp.c                 |   4 +-
 include/asm-generic/pgalloc.h                 |  90 ++
 include/asm-generic/pgtable-nop4d.h           |   5 +
 include/asm-generic/pgtable-nopmd.h           |   5 +
 include/asm-generic/pgtable-nopud.h           |   5 +
 include/asm-generic/set_memory.h              |  14 +
 include/linux/mm.h                            |  92 +-
 include/linux/mm_types.h                      |   3 +
 include/linux/moduleloader.h                  |   4 +
 include/linux/numa_kernel_replication.h       | 112 +++
 include/linux/set_memory.h                    |  21 +
 include/linux/vmalloc.h                       |  18 +
 init/main.c                                   |  17 +
 kernel/bpf/core.c                             |   4 +-
 kernel/bpf/trampoline.c                       |   2 +-
 kernel/module/main.c                          |  20 +
 kernel/module/strict_rwx.c                    |  12 +-
 mm/Kconfig                                    |  10 +
 mm/Makefile                                   |   2 +
 mm/execmem.c                                  |  39 +-
 mm/memory.c                                   | 129 +++
 mm/mm_init.c                                  |   3 +
 mm/numa_kernel_replication.c                  | 821 ++++++++++++++++++
 mm/vmalloc.c                                  | 454 ++++++++--
 41 files changed, 2246 insertions(+), 99 deletions(-)
 create mode 100644 arch/arm64/include/asm/numa_replication.h
 create mode 100644 include/linux/numa_kernel_replication.h
 create mode 100644 mm/numa_kernel_replication.c

--
2.34.1


