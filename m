Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F2FC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 16:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+T4XfGGWKqGO5qW1/hqmDcFVs8BqeHmlk6ZGjsJbB94=; b=bgc8kdgMPYa/94QXaTQhZ+UHEe
	ZWymLN+ZLrIUgC4lc1S6Q9M2OWdmm7Hw5AmM+hOzcmtVhtdrGmly9dP3w3kPscGZV+oDHaEoiTjmQ
	jnoQ/xYUHiUeTsoR5ZKAL6YuJNWwOeaV0iV3D1LyABERhCM5kX/8kaZnTMt+cwPDDFIhZVhhqrgbM
	IMsXPYc6d5Bb3uMTBoy3xoiIHgM2GgK19wSxomg9NV6vwKI3SEpg4mga0Pq796IuhOBDpOHMqwok2
	gIWY4rxJUctymYO/4amSxnyDiYUWQYdxSveWomrlTZuuSmb1Psc+qx3SMTHP3IKBiDf+wHU8n3E0s
	BaaCh0Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqd2-00000007KML-14JH;
	Mon, 20 Jul 2026 16:14:04 +0000
Received: from out-184.mta0.migadu.com ([2001:41d0:1004:224b::b8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqcy-00000007KJi-13Zv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 16:14:03 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784564037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+T4XfGGWKqGO5qW1/hqmDcFVs8BqeHmlk6ZGjsJbB94=;
	b=BmBCJn/zjvoUN3dJ/h86NgWrMl2qctmyTZq5mSsahYAlreJS4EGoNak7ghDwYNWl5SmcLW
	xfWStDIGO50m9DnWxygu+hizx6GIzcf2E06pS7FNh4kJzeW921f3kgfHaz3E1/gGpUqPW0
	wm+kFXcs7ITJPC2SzWJcdaN6iir0Dq4=
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	alexandru.elisei@arm.com,
	vdonnefort@google.com,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	qperret@google.com,
	ardb@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	tabba@google.com,
	fuad.tabba@linux.dev
Subject: [PATCH v1 00/11] KVM: arm64: Restore type-checking across the host/hyp hypercall boundary
Date: Mon, 20 Jul 2026 17:13:32 +0100
Message-Id: <20260720161343.1367007-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_091400_781041_0B160C90 
X-CRM114-Status: GOOD (  21.51  )
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

Hi folks,

For a change, I thought I'd send a series that's neither a bunch of
Sashiko bug fixes nor pKVM-specific.

The SMCCC conversion of the host/hyp interface reduced every hypercall
to a function number and a pile of registers: kvm_call_hyp_nvhe() never
shows the compiler a callable, so the caller's arguments and the
handler's DECLARE_REG() casts can disagree in type, count or order
without a diagnostic. Reviewing a fix for exactly that class of bug,
Marc wrote [1]:

  "we lost all form of type-checking when everything was hastily
   converted to SMCCC to avoid function pointers. Somehow, I feel that
   the cure was worse than the disease.

   I wish we'd reintroduce some form of compile-time checks, maybe by
   having generated stubs?"

and sketched the shape he preferred [2]: a generated nvhe_hvc_##f()
stub that does the type-checking, driven by "some form of declarative
IDL", with "both the caller and callee stubs ... totally generated".

This series implements that, in plain preprocessor macros rather
than an external generator, in the mold of the syscall wrappers.
Each hypercall's signature is declared once, in kvm_hcall.h:
kvm_call_hyp_nvhe() resolves to a typed nvhe_hvc_##f() stub
generated from the declaration, and the hyp-main.c handlers
unmarshal their arguments through glue that is type-checked
against the same declaration. A mistyped or stale call, or a
handler that drifts from its caller, now fails to compile. On top
of that shared declaration, host-VA parameters gain a __hostva
sparse address space, so dereferencing one at EL2 without
kern_hyp_va_host() translation is flagged by sparse. The address
space is KVM-private and lives with the interface it annotates
rather than in compiler_types.h, like x86's __seg_gs in asm/percpu.h.
The deeper instances of that bug class, host VAs reached through
struct fields after the boundary, are follow-up work.

The declarations do not also generate the function-number enum or the
dispatch table. The enum carries the availability-band markers that
decide when each hypercall becomes reachable, and its base entry is
consumed from assembly, so generating it would hide the banding. The
remaining duplication cannot drift silently: a name mismatch between
declaration, caller and handler fails to compile, and a missing
dispatch-table entry is rejected at run time as
SMCCC_RET_NOT_SUPPORTED.

Along the way it turned out "make C=2" has never checked the nVHE
objects at all: the custom %.nvhe.o rule reuses rule_cc_o_c, which
only hooks the checker for C=1, and that only on a rebuild. Patches
2-5 fix the hook and the handful of pre-existing sparse warnings it
flushes out, so the checker lands clean. The libfdt objects under
arch/arm64/kernel/pi/ have the same gap through the same rule, so
patch 6 gives them the same one-line fix; it touches arm64 core
rather than KVM, so it can go through either tree. Patch 1 is
adjacent: trace_remote_event.h is not self-contained (it uses bool
without including linux/types.h), which the nVHE include order had
been silently working around; it can go through the tracing tree
instead if preferred.

The first six patches do not depend on the type-checking work (the
tracing-header fix, the sparse cleanups, and the two C=2 hook fixes),
so they could be taken on their own, ahead of the rest of the series
if that is easier.

The series is structured as follows:

  01:     Make trace_remote_event.h self-contained.
  02-04:  Fix the pre-existing sparse warnings in the nVHE code.
  05:     Run the source checker on nVHE objects under C=2.
  06:     Same for the libfdt objects under arch/arm64/kernel/pi/.
  07:     Pass the host-VA hypercall arguments as pointers at EL2.
  08:     Move the dispatch macros to a new kvm_hcall.h.
  09:     Declare the hypercall signatures, type-check the callers.
  10:     Generate the handler unmarshalling, type-check the handlers.
  11:     Tag host-VA parameters __hostva for sparse.

The generated code is unchanged, checked by comparing the disassembly
of every KVM object, function by function, against the base: the
callers are identical apart from hypercall returns now being tested at
their declared width and the stage-2 TLB-flush level argument now
being sign-extended as it is loaded (an s8 passed as an int), and the
handlers are instruction-for-instruction identical apart from
flush_hyp_vcpu()/sync_hyp_vcpu() being inlined into their only
caller. The extra argument that prompted the thread, a
mistyped or reordered argument, and a handler that disagrees with its
declaration all now fail to compile. checkpatch complains about the
__KVM_HCALL_MAP() machinery, the (type, name) pair syntax and the
generated signature typedefs, as it does about __MAP() in the syscall
wrappers; the idiom cannot be parenthesized, and the typedef is what
checks the handler against the declaration. Enforcing the
__hostva tag needs sparse v0.6.5-rc1 or later for __typeof_unqual__,
as all sparse checking on current kernels does; no stable sparse
release has it yet, so build from sparse.git (checker-valid.sh skips
the check, with a warning, on anything older).

Based on Linux 7.2-rc4 (1590cf0329716).

Cheers,
/fuad

[1] https://lore.kernel.org/all/86zf7po2n3.wl-maz@kernel.org/
[2] https://lore.kernel.org/all/86wm2tnsd8.wl-maz@kernel.org/

Fuad Tabba (11):
  tracing: Include linux/types.h in trace_remote_event.h
  KVM: arm64: nVHE: Share the stacktrace per-CPU declarations with EL2
  KVM: arm64: nVHE: Declare the hyp event IDs before defining them
  KVM: arm64: nVHE: Use NULL to reset the trace buffer backing pointer
  KVM: arm64: nVHE: Run the source checker under C=2
  arm64: pi: Run the source checker on the libfdt objects under C=2
  KVM: arm64: nVHE: Pass host VA arguments as pointers
  KVM: arm64: Move the host hypercall interface to its own header
  KVM: arm64: Type-check hypercall arguments at the caller
  KVM: arm64: nVHE: Check hypercall handlers against the declared ABI
  KVM: arm64: Tag host-VA hypercall parameters __hostva

 arch/arm64/include/asm/kvm_hcall.h       | 255 +++++++++++++
 arch/arm64/include/asm/kvm_host.h        |  48 +--
 arch/arm64/include/asm/kvm_mmu.h         |  10 +
 arch/arm64/include/asm/stacktrace/nvhe.h |  10 +-
 arch/arm64/kernel/pi/Makefile            |   1 +
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h   |   7 +-
 arch/arm64/kvm/hyp/include/nvhe/trace.h  |   5 +-
 arch/arm64/kvm/hyp/nvhe/Makefile         |   1 +
 arch/arm64/kvm/hyp/nvhe/events.c         |   2 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c       | 443 +++++++++++------------
 arch/arm64/kvm/hyp/nvhe/pkvm.c           |  12 +-
 arch/arm64/kvm/hyp/nvhe/stacktrace.c     |   3 +-
 arch/arm64/kvm/hyp/nvhe/trace.c          |   6 +-
 arch/arm64/kvm/hyp_trace.c               |   2 +-
 arch/arm64/kvm/stacktrace.c              |   3 -
 include/linux/trace_remote_event.h       |   2 +
 16 files changed, 508 insertions(+), 302 deletions(-)
 create mode 100644 arch/arm64/include/asm/kvm_hcall.h


base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
-- 
2.39.5


