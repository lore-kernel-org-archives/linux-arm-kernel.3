Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D08C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 12:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oHVDl0a8hPTFmn2Ct3bwJBTDXuxqYSk0wSmd90Ydsnw=; b=nyiSOfK8xABIHW
	ft9AABLhv7TeIuQ54ahEDnNEFiJ1eWf3PXmH3UXOSx+kKa/1JGDcLs7ADKZzWYig2nwp/MZwqU0/k
	93OiaNNmS0egbw2gyNRhg5rukLoHCcfqX7OgtCC8zkvh7xENEreXujfaiCLqUe5LBwaZeX0nY58Gn
	JQjHkpVLoDlsWXp7gFAq2c868O2rtT7o9lRK8PCBuOWCcCxPbgf/JyiiphTDiIt6o7MznxV8Updq8
	xgMI2cJ+ro9Z0EsAZPtd1CUq1buHqMYzUs8wXTdrav9sRhT1yU1RCDWojAggpCr8ClvF67iFKxTHp
	+e0on+cU+WjzMMD2QP0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woh61-00000005GOE-3Gyo;
	Tue, 28 Jul 2026 12:39:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woh5z-00000005GNX-0SRW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 12:39:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30EA61A9A;
	Tue, 28 Jul 2026 05:39:36 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 697093F86F;
	Tue, 28 Jul 2026 05:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785242380; bh=sDf8G/U2jwEJKijTrykFX6woe/52UXXgD/kVNcJr1/U=;
	h=From:To:Cc:Subject:Date:From;
	b=DPgwmTFsquV6gpRk55zrZqCBgLpjukPuAxCL2twrXEosv4V/rITab9Ie2Gcu526/t
	 X+7hxlIFjzJyU/3f5gYxp7rSusuIUUibT3bunzETTx5tL8lAcOgHPXVgLe5mSTfHAh
	 h6iQOn7l0sBug8+KxmkNilduMPMueysXHOuWPNvk=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 00/13] arm64: Preemptible this_cpu_*() operations
Date: Tue, 28 Jul 2026 13:38:46 +0100
Message-Id: <20260728123859.2911495-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_053943_268546_6C273EBC 
X-CRM114-Status: GOOD (  19.21  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, peterz@infradead.org, catalin.marinas@arm.com, hca@linux.ibm.com, linux-kernel@vger.kernel.org, ruanjinjie@huawei.com, yang@os.amperecomputing.com, maz@kernel.org, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Currently arm64's this_cpu_*() ops transiently disable preemption in
order to guarantee that the address generation and memory access(es)
occur on the same CPU, which has some unfortunate overhead. In
particular, re-enabling preemption requires a conditional call to
preempt_schedule[_notrace](), which has a number of adverse impacts on
code generation.

This series reworks arm64's this_cpu_*() operations such that they do
not need to disable preemption, avoiding the related overhead in the
fast paths. Instead, the ope register a "PCPU GPR" critical section,
during which which the entry code will apply a fixup to GPRs containing
the percpu offset and the generated percpu address.

The scheme is described in detail in patch 6, and is similar to the
approach Heiko Carstens applied to s390 [1].

For example, an outlined this_cpu_read() goes from:

| <outline_this_cpu_write_u64>:
|        paciasp
|        stp     x29, x30, [sp, #-16]!
|        mrs     x2, sp_el0
|        mov     x29, sp
|        ldr     w3, [x2, #8]
|        add     w3, w3, #0x1
|        str     w3, [x2, #8]
|        mrs     x3, tpidr_el1
|        str     x1, [x0, x3]
|        ldr     x0, [x2, #8]
|        sub     x0, x0, #0x1
|        str     w0, [x2, #8]
|        cbz     x0, 1f
|        ldr     x0, [x2, #8]
|        cbnz    x0, 2f
| 1:     bl      preempt_schedule_notrace
| 2:     ldp     x29, x30, [sp], #16
|        autiasp
|        ret

... to:

| <outline_this_cpu_write_u64>:
|        mrs     x2, sp_el0
|        mov     w3, #0x7c60
|        strh    w3, [x2, #20]
|        mrs     x3, tpidr_el1
|        str     x1, [x0, x3]
|        strh    wzr, [x2, #20]
|        ret

Comparing defconfig before and after, the Image size is reduced by 64K, though
.text is only reduced by ~7.5K:

| [mark@lakrids:~/src/linux]% ls -al Image-defconfig-*
| -rw-r--r-- 1 mark mark 41552384 Jul 28 11:07 Image-defconfig-after
| -rw-r--r-- 1 mark mark 41617920 Jul 28 11:01 Image-defconfig-v7.2-rc4
| [mark@lakrids:~/src/linux]% ls -al vmlinux-defconfig-*
| -rwxr-xr-x 1 mark mark 158239216 Jul 28 11:07 vmlinux-defconfig-after
| -rwxr-xr-x 1 mark mark 158699800 Jul 28 11:01 vmlinux-defconfig-v7.2-rc4
| [mark@lakrids:~/src/linux]% size vmlinux-defconfig-*
|    text    data     bss     dec     hex filename
| 20323522        21028511         730840 42082873        2822239 vmlinux-defconfig-after
| 20331206        21028447         730840 42090493        2823ffd vmlinux-defconfig-v7.2-rc4

From looking at the generated code, there are some reasonable savings we
could make with a few changes to alternatives, notably:

* Patching the read of TPIDR_ELx using a callback. This would remove the
  need for replacement instructions, saving ~12K for defconfig, and
  meaning real instructions in .text would be packed more densely.
  There's work underway to apply similar patching for
  ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE.

* Allowing {relocation,veneer}-free replacement sequences to be placed
  in .altinst_rreplacement again. This would allow real instructions in
  .text to be packed more densely, with ~80K of .text moving into
  .altinstr_replacement where it would be freed after init.

  I've thrown togther a prototype [2].

I'm sending this as an RFC as:

(1) I haven't had the chance to benchmark this. While I think the
    changes look good from inspection, we should obviously get some
    actual performance figures.

(2) I haven't wired up everything for SDEI exception entry/return.
    This should only require some mechinical rework to the
    __sdei_asm_handler() assembly, and I've noted this as a TODO on
    patch 6.

    Patches 1 and 2 are complete as-is, and can be taken without the
    rest of the series.

(3) I'm not sure whether this_cpu_read() should use a plain LDR, or use
    LDA[P]R when LTO is in use to match READ_ONCE(). Using LDA[P]R 
    might require some refactoring of the existing READ_ONCE() code to
    share the logic.

    I've noted this as a question on patch 7.

Thanks,
Mark.

[1] https://lore.kernel.org/linux-s390/20260526055702.1429061-1-hca@linux.ibm.com/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=arm64/alternatives/cleanup
 
Mark Rutland (13):
  arm64: preempt: Simplify and optimize __preempt_count_dec_and_test()
  arm64: preempt: Treat should_resched() as unlikely
  arm64: ptrace: Always inline pt_regs_[read,write}_reg()
  arm64: percpu: Factor out percpu offset asm
  arm64: gpr-num: Add wxN aliases for wN registers
  arm64: percpu: Add infrastructure for preemptible this_cpu_*() ops
  arm64: percpu: Implement preemptible read/write ops
  arm64: percpu: Implement preemptible void RMW ops
  arm64: percpu: Implement preemptible return RMW ops
  arm64: percpu: Implement preemptible XCHG ops
  arm64: percpu: Implement preemptible CMPXCHG ops
  arm64: percpu: Implement preemptible CMPXCHG128 ops
  arm64: percpu: Remove _pcp_protect*() wrappers

 arch/arm64/include/asm/gpr-num.h     |   5 +
 arch/arm64/include/asm/percpu.h      | 437 +++++++++++++++++++++------
 arch/arm64/include/asm/preempt.h     |  29 +-
 arch/arm64/include/asm/ptrace.h      |  12 +-
 arch/arm64/include/asm/thread_info.h |   1 +
 arch/arm64/kernel/asm-offsets.c      |   2 +
 arch/arm64/kernel/entry-common.c     |  38 +++
 arch/arm64/kernel/entry.S            |  13 +
 8 files changed, 417 insertions(+), 120 deletions(-)

-- 
2.30.2


