Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969C2CA5FBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rVhYULiQIiXpvEVgVOH62p6HcckY/rvq8TKnXOWaETw=; b=OCCd6pLHTAbE3iuW+j9xQuvK7M
	kGcMBHqNRRItjWN6cVyQiYD9jacFpLRdeqOiOw0/6u3Z6M0Jwnvp8cMNY8d/HLa/bu4tgC/UbvRt4
	4OVsP+MNmsEbx24Cww3bikyGi2ZiE7UkSfXqkjKUdx96xN9UkacKycuWwCBwrx0+MtPl6hfpFh7BS
	tWh5ayB3OfdF0dvNEoyPROpUvKSAiSqt1uMag61Yd5vlMF+GPcgt2ksQ/0yHG5nX9ZlM58F+vf7Jr
	aV/NgcSY/4Co3UcNfq5lAbSo+95zMRnICcYa343mn/cDVVr42laZ17QW2SSHb5qiA0XUoUdOj1Qkr
	RVzDtarQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrNN-00000005iRY-0REl;
	Wed, 30 Sep 2026 10:17:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrN9-00000005iLj-0OyC
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 10:17:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rVhYULiQIiXpvEVgVOH62p6HcckY/rvq8TKnXOWaETw=; b=bWqzB+7luiGPynVnaMu6lZvfZ3
	LHuec00VDCtkVv/1YxrN/Am3TioGPsxwpEvBtqAIIuXAdMLz6+IbFHDV+4g81GWZ9XZONtuzR9xVp
	xLZpfT7ce2Hfiy0Co1+r3wr+Op0nrOnPSfL9oWspzpGLvO7oWs1U4WHkWMBE9HT0/nIbrP5Ak94da
	vCvLabr73zmeZg4W74r/QaGHtoZJdmJtIuml4G65qqhfCCIZPwMCdeq+aOI8jXBgnjWsWLiuKzIE6
	9Pt81PET5nAS8oXaLKZX/Svoegr1+Skpda44P6jhiyH4GmsjwBPFH3t4pIDK/q/hffOSDfw0ULMpm
	vrJCH4hQ==;
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBrN3-00000003dSv-00Pz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 10:17:08 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=rVhYULiQIiXpvEVgVOH62p6HcckY/rvq8TKnXOWaETw=;
	b=rIrIfhrWY2HJoi4f7DJ9degH0E+/1jXU4nTF3XgMS4rsD4xUK+XJ2bXY8qSGjalo4h+VrAsXk
	8K3UJHD/p2jYoDt4gsM2UOTBw6qMTHieuxsY++GV4nxbdMAczQg6nLqDLVEnw29kMwleUjXvV/G
	koQkzDQ9wwzmPtu2RlRqxRY=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4hvrJ64w47z12LHk;
	Wed, 30 Sep 2026 18:04:54 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id C7F294058C;
	Wed, 30 Sep 2026 18:16:56 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 18:16:55 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<oleg@redhat.com>, <shuah@kernel.org>, <kees@kernel.org>,
	<luto@amacapital.net>, <wad@chromium.org>, <peterz@infradead.org>,
	<ada.coupriediaz@arm.com>, <linusw@kernel.org>, <kevin.brodsky@arm.com>,
	<yeoreum.yun@arm.com>, <james.morse@arm.com>, <thuth@redhat.com>,
	<tglx@kernel.org>, <vladimir.murzin@arm.com>, <broonie@kernel.org>,
	<ryan.roberts@arm.com>, <liqiang01@kylinos.cn>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v20 01/15] arm64: ptrace: Drop redundant pseudo-single-step for SYSEMU_SINGLESTEP
Date: Wed, 30 Sep 2026 18:17:51 +0800
Message-ID: <20260930101805.1770358-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930101805.1770358-1-ruanjinjie@huawei.com>
References: <20260930101805.1770358-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_111706_278133_8FDE9BC2 
X-CRM114-Status: GOOD (  15.91  )
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

PTRACE_SYSEMU_SINGLESTEP sets both _TIF_SYSCALL_EMU and _TIF_SINGLESTEP.

With _TIF_SINGLESTEP set, the arm64 syscall-exit path synthesises a
pseudo-single-step exception:

	ptrace_report_syscall_exit(regs, 1)
	  -> user_single_step_report()
	     -> info.si_signo = SIGTRAP
	     -> info.si_code = SI_USER
	     -> force_sig_info(&info)

But for PTRACE_SYSEMU_SINGLESTEP it is redundant: the stop before
the instruction following the SVC is already delivered by the hardware
single-step state machine, so the tracer ends up with two stops
at the same PC as below:

	sig=133 si_code=133  SS=0  pc=0x400638   [syscall-enter-stop]
	sig=5   si_code=0    SS=0  pc=0x400638   [pseudo-step, dropped here]
	sig=5   si_code=2    SS=1  pc=0x400638   [hardware single-step]

The pseudo-step was added by commit ac2081cdc4d9 ("arm64: ptrace:
Consistently use pseudo-singlestep exceptions") because a ptrace stop
taken while a system call is in progress may corrupt the stepping state.
For an emulated system call that cannot happen, as the call never runs:

- No syscall-exit-stop, because _TIF_SINGLESTEP is set

- No seccomp trap, because syscall_trace_enter() returns NO_SYSCALL
  when SYSCALL_EMU is set, before the seccomp check

- The syscall body is not executed, so nothing can take a stop while it
  is in progress.

Introduce report_single_step(), which returns false when _TIF_SYSCALL_EMU
is set, so the pseudo-step is skipped for the emulated case. This also
matches the generic entry behaviour.

PTRACE_SINGLESTEP and PTRACE_SYSCALL are unaffected:
- PTRACE_SYSCALL: SYSCALL_TRACE is set and _TIF_SINGLESTEP is not, so
  the syscall-exit-stop is reported as before and no pseudo-step is
  involved;

- PTRACE_SINGLESTEP: _TIF_SINGLESTEP is set but _TIF_SYSCALL_EMU is
  not, so the pseudo-step is still synthesised.  It is still needed
  here, because the system call does execute and the hazard described
  above applies.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Oleg Nesterov <oleg@redhat.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index f743cbec1c3a..96462de75d4b 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2482,16 +2482,26 @@ int syscall_trace_enter(struct pt_regs *regs)
 	return regs->syscallno;
 }
 
+static inline bool report_single_step(unsigned long flags)
+{
+	if (flags & _TIF_SYSCALL_EMU)
+		return false;
+
+	return flags & _TIF_SINGLESTEP;
+}
+
 void syscall_trace_exit(struct pt_regs *regs)
 {
 	unsigned long flags = read_thread_flags();
+	bool step;
 
 	audit_syscall_exit(regs);
 
 	if (flags & _TIF_SYSCALL_TRACEPOINT)
 		trace_sys_exit(regs, syscall_get_return_value(current, regs));
 
-	if (flags & (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP))
+	step = report_single_step(flags);
+	if (step || flags & _TIF_SYSCALL_TRACE)
 		report_syscall_exit(regs);
 
 	rseq_syscall(regs);
-- 
2.34.1


