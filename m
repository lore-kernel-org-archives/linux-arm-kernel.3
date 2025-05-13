Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C20EC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 12:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+NohZbTcDDUqcokVFsB1Rzxsn9BE+RTwvD4Eur0ZSjY=; b=xUCikrW+jj/mKDJGzbAC2m9op5
	eX5wCUOSxyNAkLzsXwZa+mFXn02VL0dm/AqTd7+UE4DCGbZaLdPJTfBnKNApWl1Q7xkoXXeONmwTF
	AknGILkO1OAQeneSiwu7HEJm23xtPWQ8ZhW+JdM7/E5tWAexlLQnC7j0NNlk+2r5+7j8DQOluQDJW
	G91jN+Jv4UM8hFtxGAtKR8lZ/5iTVgx7IUnX9M3u5RZf5wrL865xClPkVWzROzpFYE/9/Zd9X/qgB
	1Si0fLgAHGQuV6/xsBTxIgX5PGRnU/01P1UNF6Nb3gG6e1ey07+IQav07bZfbWAWjuk0MBcyskwDb
	1uMl5xPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEojN-0000000CM7r-1I6G;
	Tue, 13 May 2025 12:27:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEohF-0000000CLoq-1EPJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 12:25:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747139119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+NohZbTcDDUqcokVFsB1Rzxsn9BE+RTwvD4Eur0ZSjY=;
	b=Z5LFr6Mwuru5pUxX68qkwDc/ngPGXUKES32LpWDYosU+BMNnFYTyHAIBiUUpmmD1uQgFCt
	fZrTvfxYhMFBxCgqkyNX0ZsFxRznl8ZY+JmGMwKWyA3xOLXB4KydFhJBKyjDiC2wi45Ng8
	3uX7CtR1i8QRATze+nxwDL8idwOWHms=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-125-ryTaCo-OMpGhEnoVD6gj1g-1; Tue,
 13 May 2025 08:25:16 -0400
X-MC-Unique: ryTaCo-OMpGhEnoVD6gj1g-1
X-Mimecast-MFC-AGG-ID: ryTaCo-OMpGhEnoVD6gj1g_1747139115
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 375D41956051;
	Tue, 13 May 2025 12:25:15 +0000 (UTC)
Received: from localhost (unknown [10.22.80.42])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4EC5A30002E7;
	Tue, 13 May 2025 12:25:13 +0000 (UTC)
Date: Tue, 13 May 2025 09:25:12 -0300
From: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH v2 00/11] arm64: debug: remove hook registration, split
 exception entry
Message-ID: <aCM6KOHu2i0NqaBC@uudg.org>
References: <20250512174326.133905-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
In-Reply-To: <20250512174326.133905-1-ada.coupriediaz@arm.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3LNpPBqWHyIVn6hDAfIHKfUe-7Gi5zjv-qwfMWNQC8k_1747139115
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_052521_558029_816B65D0 
X-CRM114-Status: GOOD (  44.40  )
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

On Mon, May 12, 2025 at 06:43:15PM +0100, Ada Couprie Diaz wrote:
> Hi,
> 
> This series simplifies the debug exception entry path by removing handler
> registration mechanisms for the debug exception handlers, a holdover from
> the arm kernel, as well as the break and stepping handlers.
> This moves much of the code related to debug exceptions outside of
> `mm/fault.c` where it didn't make much sense.
> This allows us to split the debug exception entries: going from one common
> path per EL for all debug exceptions to a unique one per exception and EL.
> 
> The result is a much simpler and fully static exception entry path, which
> we tailor to the different exceptions and their constraints.
> 
> The series is structured as such :
> 1 : related clean-up in the signle step handler
> 2-4 : software breakpoints and single step handlers registration removal
> 5: preparatory function duplication that gets cleaned-up in patch 11
> 6-11 : debug exception splitting and handler registration removal
> 
> * Patch 2 copies and extends the `early_brk64` break handling for the
> normal path, byassing the dynamic registration.
> * Patch 3 does something similar for the single stepping handlers.
> * Patches 6 through 10 split each individual debug exception from
> the unified path by creating specific handlers, adapting them to
> their constraints and calling into them, bypassing the dynamically
> registered handlers used before.
> * Patches 4 and 11 are clean-ups removing the code that has been replaced
> and made redundant by the preceding patches.
> 
> Single Step Exception
> ===
> 
> Of note, this allows us to make the single exception handling mostly
> preemptible coming from EL0 in patch 7, fixing an issue with PREEMPT_RT[0].
> The commit message details the reasoning on why this should be safe.
> It is *definitely* not preemptible at EL1 in the current state, given
> that the EL1 software step exception is handled by KGDB.
> 
> CC-ing Luis and Sebastian as they were active on the original bug report.

I have been running the ssdd test in a tight loop on a kernel with your
patches and PREEMPT_RT enabled, on two different aarch64 boxes (8 cores and
144 cores). So far, so good. The patch series seems to have solved the
problem I reported.

For the first 10h of tests the kernel also had LOCKDEP and locking debug
features enabled. Now I am running the test with a production-like
configuration. As soon as these tests are done I will run a few more sanity
tests and reply here with my test ACK.

Is there any specific test you would like me to run on that test setup I
have?

As for the code review, I am not that well versed on ARM debug exceptions,
I may take a bit longer to complete the task with the required accuracy.

Best regards,
Luis

 
> Cc: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> 
> Testing
> ===
> 
> Testing EL1 debug exceptions can only be properly done with perf.
> A simple test of hardware breakpoints, watchpoints, and software stepping
> can be achieved by using `perf stat sleep 0.01` and adding hardware events
> for `jiffies` and `hrtimer_nanosleep`, which guarantees a
> hardware watchpoint and breakpoint.
> Inserting a `WARN()` at a convenient place will allow testing both early
> and late software breakpoints at EL1, or using KGDB to test without
> changing code.
> 
> For EL0 debug exceptions, the easiest is to setup a basic program and use
> GDB with a list of pre-programmed commands setting hardware and software
> breakpoints as well as watchpoints. Setpping will occur naturally when
> encountering breakpoints.
> 
> All tests maintained behaviour after the patches.
> 
> I also tested with KASAN on, with no apparent impact.
> 
> See below for some testing examples.
> 
> Regarding [0], I tested a PREEMPT_RT kernel with the patches, running
> `ssdd` on loop as well as some spammy GDB stepping, and some
> hardware watchpoints on a tight loop without any issues.
> 
> 
> Based on v6.15-rc6.
> Thanks,
> Ada
> 
> v2 :
>  - Move the BP hardening call outside of the handlers to `entry-common`,
>    as they are not needed coming from EL1.
>  - Make the EL0 software stepping exception mostly preemptible
>    - Move `reinstall_hw_bps()` call to `entry-common`
>    - Don't disable preemption in `el0_softstp()`
>    - Unmask DAIF before `do_softstep()` in `el0_softstp()`
>    - Update comments to make sense with the changes
>  - Simplify the single step handler, as it always returns 0 and could not
>    trigger the `arm64_notify_die()` call.
>  - Fix some commit messages
> v1 : https://lore.kernel.org/linux-arm-kernel/20250425153647.438508-1-ada.coupriediaz@arm.com
> 
> [0]: https://lore.kernel.org/linux-arm-kernel/Z6YW_Kx4S2tmj2BP@uudg.org/
> 
> 
> Testing examples
> ===
> 
> Perf (for EL1):
> ~~~
> Assuming that `perf` is on your $PATH and building with `kallsyms`
> 
>   #!/bin/bash
>   
>   watch_addr=$(sudo cat /proc/kallsyms | grep "D jiffies$" | cut -f1 -d\  )
>   break_addr=$(sudo cat /proc/kallsyms | grep "clock_nanosleep$" | cut -f1 -d\  )
>   
>   cmd="sleep 0.01"
>   
>   sudo perf stat -a -e mem:0x${watch_addr}/8:w -e mem:0x${break_addr}:x ${cmd}
> 
> NB: This does /not/ test EL1 BRKs.
> 
> 
> GDB commands (for EL0):
> ~~~
> The following C example, compiled with `-g -O0`
> 
>   int main() {
>           int add = 0xAA;
>           int target = 0;
> 
>           target += add;
> 
>   #ifdef COMPAT
>       __asm__("BKPT");
>   #else
>       __asm__("BRK 1");
>   #endif
>   
>           return target;
>   }
> 
> Combined with the following GDB command-list
> 
>   start
>   hbreak 3
>   watch target
>   commands 2
>   continue
>   end
>   commands 3
>   continue
>   end
>   continue
>   jump 11
>   continue
>   quit
> 
> Executed as such : `gdb -x ${COMMAND_LIST_FILE} ./a.out`
> should go through the whole program, return 0252/170/0xAA, and
> exercise all EL0 debug exception entries.
> By using a cross-compiler and passing and additional `-DCOMPAT` argument
> during compilation, the `BKPT32` path can also be tested.
> NOTE: `BKPT` *will* make GDB loop infinitely, that is expected. Sending
> SIGINT to GDB will break the loop and the execution should complete.
> 
> Ada Couprie Diaz (11):
>   arm64: debug: clean up single_step_handler logic
>   arm64: debug: call software break handlers statically
>   arm64: debug: call step handlers statically
>   arm64: debug: remove break/step handler registration infrastructure
>   arm64: entry: Add entry and exit functions for debug exceptions
>   arm64: debug: split hardware breakpoint exeception entry
>   arm64: debug: split single stepping exception entry
>   arm64: debug: split hardware watchpoint exception entry
>   arm64: debug: split brk64 exception entry
>   arm64: debug: split bkpt32 exception entry
>   arm64: debug: remove debug exception registration infrastructure
> 
>  arch/arm64/include/asm/debug-monitors.h       |  26 ---
>  arch/arm64/include/asm/exception.h            |   6 +-
>  arch/arm64/include/asm/kgdb.h                 |   4 +
>  arch/arm64/include/asm/kprobes.h              |   6 +
>  arch/arm64/include/asm/system_misc.h          |   4 -
>  arch/arm64/include/asm/traps.h                |   6 +
>  arch/arm64/include/asm/uprobes.h              |   3 +
>  arch/arm64/kernel/debug-monitors.c            | 205 +++++++-----------
>  arch/arm64/kernel/entry-common.c              | 148 ++++++++++++-
>  arch/arm64/kernel/hw_breakpoint.c             |  35 ++-
>  arch/arm64/kernel/kgdb.c                      |  39 +---
>  arch/arm64/kernel/probes/kprobes.c            |  31 +--
>  arch/arm64/kernel/probes/kprobes_trampoline.S |   2 +-
>  arch/arm64/kernel/probes/uprobes.c            |  18 +-
>  arch/arm64/kernel/traps.c                     |  77 +------
>  arch/arm64/mm/fault.c                         |  75 -------
>  16 files changed, 294 insertions(+), 391 deletions(-)
> 
> 
> base-commit: 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3
> -- 
> 2.43.0
> 
---end quoted text---


