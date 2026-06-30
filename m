Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B74C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 00:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOlH0k64nXzoulGrqNZ8xRnSugCqzg2nnknXpcOTvOc=; b=tv5v41BpiW6qxUZpab1QlchfbU
	XHu2QHQ3ZSUJbvhZ/Rp5zmE5Hu3lOCPxTzOX1eddYRPzysQteHEFgxwfx2Dwf2EInV0PO96LJRVtK
	sWP+H0t+TMxr3VuI8kp0cP+x01hp1qcI8zK5YeqzxAepfYfijYWXzPM4FOWYR+eZmkrNKnmt/0/6P
	rRDpp4mLUbRw2dcnsoBRoUDrdOzbUNSqDPOgppY1Tv59SngHYhCGBcZUn0VC/9IVz9hPL0XiqOir4
	cMhY8NJP4UcRSLIDw0/en6SkY1u3HLcJ8NwgjcXjwl/ApHfdcrnAG/KA5EnyoXUzQ5S0vqV/ixC5L
	CkPxlqBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weMT6-0000000FcDp-0xXE;
	Tue, 30 Jun 2026 00:36:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weMT4-0000000FcDY-3OdX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 00:36:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 36A1343B47;
	Tue, 30 Jun 2026 00:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DBEA1F00A3A;
	Tue, 30 Jun 2026 00:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782779810;
	bh=ZOlH0k64nXzoulGrqNZ8xRnSugCqzg2nnknXpcOTvOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X1UMMah6r+Uj+zs0NTdwwtjDmoPta5VAXf2c5dtpK8WzkO13w4+kEPOsEd0DLT84F
	 BZoWOlC4CSiIuurywqalHVK2s6mZjiqGCAXyzCXCTN/nWbcWZCFRY4hKaxtg1ro2d9
	 oSE5v+8EA+dKHXfq8bR/uYeGuRpSsEjk7vH9NPVJcDV792QfnvlopAedf59f5D6ciJ
	 PHyRKwc+auBD5yxBkwdZSBFvTDfWc61zp0hNCas1nJuwY2QvoN/idpKpml8vZgCfb6
	 9O0PSPVQWYLaiMUoALxrprzsSi/jiqxo+XbMlrT4ZKXnsYfb7AKD4yhut418kVGvG7
	 p4e7Cz9q1SyDA==
Date: Mon, 29 Jun 2026 17:36:48 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Al Grant <al.grant@arm.com>,
	Paschalis Mpeis <paschalis.mpeis@arm.com>,
	Amir Ayupov <aaupov@fb.com>, linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org, linux-perf-users@vger.kernel.org,
	Leo Yan <leo.yan@linux.dev>
Subject: Re: [PATCH v10 0/9] perf cs-etm: Support thread stack and callchain
Message-ID: <akMPoLNBbAEyNU64@google.com>
References: <20260617-b4-arm_cs_callchain_support_v1-v10-0-e8b6e5d63db5@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260617-b4-arm_cs_callchain_support_v1-v10-0-e8b6e5d63db5@arm.com>
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

Hi Leo,

On Wed, Jun 17, 2026 at 04:08:51PM +0100, Leo Yan wrote:
> This series adds thread-stack and synthesized callchain support for Arm
> CoreSight, which comes from older series [1] but heavily rewritten.
> 
> CS ETM previously kept last-branch state in a per-trace-queue buffer.
> That effectively makes the state per CPU, while the call/return history
> belongs to a thread. This series moves branch tracking to the common
> thread-stack code.
> 
> The series records CoreSight branches with thread_stack__event(), uses
> thread_stack__br_sample() for last branch entries, flushes thread stacks
> after decoder resets.
> 
> A decoder reset between AUX trace buffers is treated as a global trace
> discontinuity, so all thread stacks are flushed, so avoids carrying
> stale call/return history across a trace discontinuity.
> 
> One limitation remains for instructions emulated by the kernel. In that
> case the exception return address may not match the return address
> stored in the thread stack, because after exception return can be one
> instruction ahead. The stack can still recover when a later return
> matches an upper caller. Given emulated instructions are not the common
> target for performance callchain analysis. Supporting this would require
> extending the common thread-stack path to accept both the real target
> address and an adjusted address for stack matching, so this series
> leaves that extra complexity out.
> 
> The series has been tested on Orion6 board:
> 
>   perf test 136 -vvv
>   136: CoreSight synthesized callchain:
>   --- start ---
>   test child forked, pid 3539
>   ---- end(0) ----
>   136: CoreSight synthesized callchain			: Ok
> 
>   perf script --itrace=g16i10il64
> 
>   callchain_test   17468 [005] 1031003.229943:         10 instructions:
>               aaaac32507c4 main+0x8 (/home/kernel/leoy/test_cs_callchain/callchain_test)
>               ffff90bd225c __libc_start_call_main+0x7c (/usr/lib/aarch64-linux-gnu/libc.so.6)
>               ffff90bd233c call_init+0x9c (inlined)
>               ffff90bd233c __libc_start_main_impl+0x9c (inlined)
>               aaaac3250670 _start+0x30 (/home/kernel/leoy/test_cs_callchain/callchain_test)
> 
>   callchain_test   17468 [005] 1031003.229943:         10 instructions:
>               aaaac3250774 do_svc+0xc (/home/kernel/leoy/test_cs_callchain/callchain_test)
>               aaaac3250798 print+0xc (/home/kernel/leoy/test_cs_callchain/callchain_test)
>               aaaac32507b0 foo+0xc (/home/kernel/leoy/test_cs_callchain/callchain_test)
>               aaaac32507c8 main+0xc (/home/kernel/leoy/test_cs_callchain/callchain_test)
>               ffff90bd225c __libc_start_call_main+0x7c (/usr/lib/aarch64-linux-gnu/libc.so.6)
>               ffff90bd233c call_init+0x9c (inlined)
>               ffff90bd233c __libc_start_main_impl+0x9c (inlined)
>               aaaac3250670 _start+0x30 (/home/kernel/leoy/test_cs_callchain/callchain_test)
> 
>   callchain_test   17468 [005] 1031003.229944:         10 instructions:
>           ffff800080010c20 vectors+0x420 ([kernel.kallsyms])
>               aaaac3250784 do_svc+0x1c (/home/kernel/leoy/test_cs_callchain/callchain_test)
>               aaaac3250798 print+0xc (/home/kernel/leoy/test_cs_callchain/callchain_test)
>               aaaac32507b0 foo+0xc (/home/kernel/leoy/test_cs_callchain/callchain_test)
>               aaaac32507c8 main+0xc (/home/kernel/leoy/test_cs_callchain/callchain_test)
>               ffff90bd225c __libc_start_call_main+0x7c (/usr/lib/aarch64-linux-gnu/libc.so.6)
>               ffff90bd233c call_init+0x9c (inlined)
>               ffff90bd233c __libc_start_main_impl+0x9c (inlined)
>               aaaac3250670 _start+0x30 (/home/kernel/leoy/test_cs_callchain/callchain_test)
> 
> Note, the test fails on Juno board which is caused by many discontinuity
> packets (mainly caused by NO_SYNC elem). This is likely caused by the
> FIFO overflow on the path.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20200220052701.7754-1-leo.yan@linaro.org/
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Will you send a new version or want to merge this?  It seems there are
some remaining comments from Sashiko.

Thanks,
Namhyung


> ---
> Changes in v10:
> - Change to syscall(SYS_gettid) for build failure on x86 (James).
> - Extracted sample thread stack into cs_etm__sample_branch_stack().
> - Link to v9: https://lore.kernel.org/r/20260616-b4-arm_cs_callchain_support_v1-v9-0-f8fad931c413@arm.com
> 
> Changes in v9:
> - Added patch 01 to fixed thread leak during trace queue init (sashiko).
> - Added check in instruction and branch samples in
>   cs_etm__add_stack_event() (sashiko).
> - Released frontend_thread properly in cs_etm__context() (sashiko).
> - Refined cs_etm__flush_all_stack() to use switch (sashiko).
> - Gathered James' review tags.
> - Rebased on the latest perf-tools-next.
> - Link to v8: https://lore.kernel.org/r/20260611-b4-arm_cs_callchain_support_v1-v8-0-737948584fea@arm.com
> 
> Changes in v8:
> - Updated test_arm_coresight_disasm.sh to pass "--itrace=b" and updated
>   examples in arm-cs-trace-disasm.py (James).
> - Removed static annotation in callchain workload and renamed functions
>   with prefix "callchain_" to reduce naming conflict (James).
> - For callchain test pre-condition check, removed the aarch64 check and
>   added the root permission check (James).
> - Resolved the shellcheck errors (James).
> - Link to v7: https://lore.kernel.org/r/20260611-b4-arm_cs_callchain_support_v1-v7-0-1ba770c862ae@arm.com
> 
> Changes in v7:
> - Rebased on the latest perf-tools-next.
> - Used struct_size() for allocation callchain struct (James).
> - Added a helper cs_etm__packet_has_taken_branch() (James).
> - Minor improvements for the callchain test (used record-ctl FIFO and
>   reworked the validation callstack push / pop).
> - Link to v6: https://lore.kernel.org/r/20260526-b4-arm_cs_callchain_support_v1-v6-0-f9f49f53c9dd@arm.com
> 
> Changes in v6:
> - Heavily rewrote the patches since restarted the work after 6 years.
> - Changed to use the common thread-stack for branch stack and callchain
>   management.
> - Added a callchain test.
> - Link to v5: https://lore.kernel.org/linux-arm-kernel/20200220052701.7754-1-leo.yan@linaro.org/
> 
> Changes in v5:
> - Addressed Mike's suggestion for performance improvement for function
>   cs_etm__instr_addr() for quick calculation for non T32;
> - Removed the patch 'perf cs-etm: Synchronize instruction sample with
>   the thread stack' (Mike);
> - Fixed the issue for exception is taken for branch target address
>   accessing, for the branch sample and stack thread handling, the
>   related patches are 01, 02, 07;
> - Fixed the stack thread handling for instruction emulation and single
>   step with patches 08, 09.
> - Link to v4: https://lore.kernel.org/linux-arm-kernel/20200203020716.31832-1-leo.yan@linaro.org/
> 
> ---
> Leo Yan (9):
>       perf cs-etm: Fix thread leaks on trace queue init failure
>       perf cs-etm: Filter synthesized branch samples
>       perf cs-etm: Decode ETE exception packets
>       perf cs-etm: Refactor instruction size handling
>       perf cs-etm: Use thread-stack for last branch entries
>       perf cs-etm: Flush thread stacks after decoder reset
>       perf cs-etm: Support call indentation
>       perf cs-etm: Synthesize callchains for instruction samples
>       perf test: Add Arm CoreSight callchain test
> 
>  tools/perf/Documentation/perf-test.txt             |   6 +-
>  tools/perf/scripts/python/arm-cs-trace-disasm.py   |   9 +-
>  tools/perf/tests/builtin-test.c                    |   1 +
>  tools/perf/tests/shell/coresight/callchain.sh      | 172 ++++++++++
>  .../shell/coresight/test_arm_coresight_disasm.sh   |   4 +-
>  tools/perf/tests/tests.h                           |   1 +
>  tools/perf/tests/workloads/Build                   |   2 +
>  tools/perf/tests/workloads/callchain.c             |  33 ++
>  tools/perf/util/cs-etm.c                           | 377 +++++++++++++--------
>  9 files changed, 454 insertions(+), 151 deletions(-)
> ---
> base-commit: 8c214ad8cb8d692c82c6466b8e88973dbfa8e064
> change-id: 20260521-b4-arm_cs_callchain_support_v1-2c2a70719bcc
> 
> Best regards,
> -- 
> Leo Yan <leo.yan@arm.com>
> 

