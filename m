Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F72C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 16:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9GEvDsXQVjfGXflnG4ay5A/yOJxSyhlur+mhjCCZbBU=; b=AUTQEwpKiH6Gmx
	b+AfyP6QNHRsVP4EqyErmvW+I4qFepC7e4DFLMdP0Ynkg3sfmC0dtd+JJ2he4dP6H7PZgCa5W9Q+E
	6umzvGOsSj8bqrHy2d3hBBUOG6QzLC316Y1NTUZoLEtkvKOImWWtQnFJfM/pNj+XD51qHoZ7AGCn/
	2k2tr+silV2bL883az34rjZZCJBkS19RZBpSlnKpSdr50M3fLygsxT8cHYfsY/IXWfNqDcdDCVN1I
	nkPgjxBhJ38vbXqLy8nXnWYhMEPUfmFCb/dVBDvf1q5ONmzuSbIRJCHM/X3GuznaDrl8KGWOONTFY
	lCtbrizG2laVA2gQHjyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8M6P-00000000G33-3vL5;
	Fri, 25 Apr 2025 16:40:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8L6t-000000004MH-45Va
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 15:37:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6960F106F;
	Fri, 25 Apr 2025 08:36:54 -0700 (PDT)
Received: from e137867.arm.com (unknown [10.57.45.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6D0F83F59E;
	Fri, 25 Apr 2025 08:36:58 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 00/11] arm64: debug: remove hook registration, split exception entry
Date: Fri, 25 Apr 2025 16:36:36 +0100
Message-ID: <20250425153647.438508-1-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_083704_098708_102DCBB0 
X-CRM114-Status: GOOD (  13.58  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

This series simplifies the debug exception entry path by removing handler
registration mechanisms for the debug exception handlers, a holdover from
the arm kernel, as well as the break and stepping handlers.
This moves much of the code related to debug exceptions outside of
`mm/fault.c` where it didn't make much sense.
This allows us to split the debug exception entries: going from one common
path per EL for all debug exceptions to a unique one per exception and EL.

The result is a much simpler and fully static exception entry path, which
we tailor to the different exceptions and their constraints.

The series is structured as such :
1 : related clean-up in the signle step handler
2-4 : software breakpoints and single step handlers registration removal
5: preparatory function duplication that gets cleaned-up in patch 11
6-11 : debug exception splitting and handler registration removal

* Patch 2 copies and extends the `early_brk64` break handling for the
normal path, byassing the dynamic registration.
* Patch 3 does something similar for the single stepping handlers.
* Patches 6 through 10 split each individual debug exception from
the unified path by creating specific handlers, adapting them to
their constraints and calling into them, bypassing the dynamically
registered handlers used before.
* Patches 4 and 11 are clean-ups removing the code that has been replaced
and made redundant by the preceding patches.

Testing
===

Testing EL1 debug exceptions can only be properly done with perf.
A simple test of hardware breakpoints, watchpoints, and software stepping
can be achieved by using `perf stat sleep 0.01` and adding hardware events
for `jiffies` and `hrtimer_nanosleep`, which guarantees a
hardware watchpoint and breakpoint.
Inserting a `WARN()` at a convenient place will allow testing both early
and late software breakpoints at EL1, or using KGDB to test without
changing code.

For EL0 debug exceptions, the easiest is to setup a basic program and use
GDB with a list of pre-programmed commands setting hardware and software
breakpoints as well as watchpoints. Setpping will occur naturally when
encountering breakpoints.

All tests maintained behaviour after the patches.

I also tested with KASAN on, with no apparent impact.

See below for some testing examples.


Based on v6.15-rc3.
Thanks,
Ada


Testing examples
===

Perf (for EL1):
~~~
Assuming that `perf` is on your $PATH and building with `kallsyms`

  #!/bin/bash
  
  watch_addr=$(sudo cat /proc/kallsyms | grep "D jiffies$" | cut -f1 -d\  )
  break_addr=$(sudo cat /proc/kallsyms | grep "clock_nanosleep$" | cut -f1 -d\  )
  
  cmd="sleep 0.01"
  
  sudo perf stat -a -e mem:0x${watch_addr}/8:w -e mem:0x${break_addr}:x ${cmd}

NB: This does /not/ test EL1 BRKs.


GDB commands (for EL0):
~~~
The following C example, compiled with `-g -O0`

  int main() {
          int add = 0xAA;
          int target = 0;

          target += add;

  #ifdef COMPAT
      __asm__("BKPT");
  #else
      __asm__("BRK 1");
  #endif
  
          return target;
  }

Combined with the following GDB command-list

  start
  hbreak 3
  watch target
  commands 2
  continue
  end
  commands 3
  continue
  end
  continue
  jump 11
  continue
  quit

Executed as such : `gdb -x ${COMMAND_LIST_FILE} ./a.out`
should go through the whole program, return 0252/170/0xAA, and
exercise all EL0 debug exception entries.
By using a cross-compiler and passing and additional `-DCOMPAT` argument
during compilation, the `BKPT32` path can also be tested.
NOTE: `BKPT` *will* make GDB loop infinitely, that is expected. Sending
SIGINT to GDB will break the loop and the execution should complete.

Ada Couprie Diaz (11):
  arm64: debug: Clean up single_step_handler logic
  arm64: debug: call software break handlers statically
  arm64: debug: call step handlers statically
  arm64: debug: remove break/step handler registration infrastructure
  arm64: entry: Add entry and exit functions for debug exceptions
  arm64: debug: split hardware breakpoint exeception entry
  arm64: debug: split single stepping exception entry
  arm64: debug: split hardware watchpoint exception entry
  arm64: debug: split brk64 exception entry
  arm64: debug: split bkpt32 exception entry
  arm64: debug: remove debug exception registration infrastructure

 arch/arm64/include/asm/debug-monitors.h       |  26 ---
 arch/arm64/include/asm/exception.h            |   6 +-
 arch/arm64/include/asm/kgdb.h                 |   4 +
 arch/arm64/include/asm/kprobes.h              |   6 +
 arch/arm64/include/asm/system_misc.h          |   4 -
 arch/arm64/include/asm/traps.h                |   6 +
 arch/arm64/include/asm/uprobes.h              |   3 +
 arch/arm64/kernel/debug-monitors.c            | 198 ++++++++----------
 arch/arm64/kernel/entry-common.c              | 129 +++++++++++-
 arch/arm64/kernel/hw_breakpoint.c             |  34 ++-
 arch/arm64/kernel/kgdb.c                      |  39 +---
 arch/arm64/kernel/probes/kprobes.c            |  31 +--
 arch/arm64/kernel/probes/kprobes_trampoline.S |   2 +-
 arch/arm64/kernel/probes/uprobes.c            |  18 +-
 arch/arm64/kernel/traps.c                     |  77 +------
 arch/arm64/mm/fault.c                         |  75 -------
 16 files changed, 285 insertions(+), 373 deletions(-)

-- 
2.43.0


