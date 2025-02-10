Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94582C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 12:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DG+imX9dr2ubf4YMc+TLFIKjF4sj7MoO1QzVZ11a5Es=; b=Iq1b5cIPTLu/biaPUK417a+tWr
	UOhhqBCL5p6TS14g4w4LK9mJWzusZMbmMiTE1YuFJ1oyIZFyaHryDsaIDmgajhab69ddbbvbfjFCo
	1VJr1DoMSlfLog/JZctnow746malj+g7H++p6mohS/oN1MxVpMGq2IDLbMyhUApIx80RmFWszTgLu
	s9sgQ+eq7qodHx2HAlVLSr6IntPT8jqttsn3X0J5vxIMnHvcJaLfcQQiyRUq1Mj/uxIF2Av385fz5
	HX2DAlVKm0R0zwuGLmHwG71sm0TnuLqUeu3Hww43Q2oRFWY/Jxpy0/LHNea2PEqfLP3e3QXcKJUoJ
	rSDEGWRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thT1y-0000000HQIU-256Y;
	Mon, 10 Feb 2025 12:36:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thSvi-0000000HP1m-2Dq4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 12:30:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2C461BA8;
	Mon, 10 Feb 2025 04:30:47 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A03C3F5A1;
	Mon, 10 Feb 2025 04:30:19 -0800 (PST)
Date: Mon, 10 Feb 2025 12:30:16 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, oleg@redhat.com,
	sstabellini@kernel.org, tglx@linutronix.de, peterz@infradead.org,
	luto@kernel.org, mingo@redhat.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kees@kernel.org, wad@chromium.org,
	akpm@linux-foundation.org, samitolvanen@google.com,
	masahiroy@kernel.org, hca@linux.ibm.com, aliceryhl@google.com,
	rppt@kernel.org, xur@google.com, paulmck@kernel.org, arnd@arndb.de,
	mbenes@suse.cz, puranjay@kernel.org, pcc@google.com,
	ardb@kernel.org, sudeep.holla@arm.com, guohanjun@huawei.com,
	rafael@kernel.org, liuwei09@cestc.cn, dwmw@amazon.co.uk,
	Jonathan.Cameron@huawei.com, liaochang1@huawei.com,
	kristina.martsenko@arm.com, ptosi@google.com, broonie@kernel.org,
	thiago.bauermann@linaro.org, kevin.brodsky@arm.com,
	joey.gouly@arm.com, liuyuntao12@huawei.com, leobras@redhat.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH -next v5 00/22] arm64: entry: Convert to generic entry
Message-ID: <Z6nxWM8cnhd32yfW@J2N7QTR9R3>
References: <20241206101744.4161990-1-ruanjinjie@huawei.com>
 <c34ebe3f-b78a-1a17-0c6a-48d3874f8be9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c34ebe3f-b78a-1a17-0c6a-48d3874f8be9@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_043026_625163_86A4DCC5 
X-CRM114-Status: GOOD (  20.19  )
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

On Sat, Feb 08, 2025 at 09:15:08AM +0800, Jinjie Ruan wrote:
> On 2024/12/6 18:17, Jinjie Ruan wrote:
> > Currently, x86, Riscv, Loongarch use the generic entry. Convert arm64
> > to use the generic entry infrastructure from kernel/entry/*. The generic
> > entry makes maintainers' work easier and codes more elegant, which aslo
> > removed a lot of duplicate code.
> > 
> > The main steps are as follows:
> > - Make arm64 easier to use irqentry_enter/exit().
> > - Make arm64 closer to the PREEMPT_DYNAMIC code of generic entry.
> > - Split generic entry into generic irq entry and generic syscall to
> >   make the single patch more concentrated in switching to one thing.
> > - Switch to generic irq entry.
> > - Make arm64 closer to the generic syscall code.
> > - Switch to generic entry completely.
> > 
> > Changes in v5:
> > - Not change arm32 and keep inerrupts_enabled() macro for gicv3 driver.
> > - Move irqentry_state definition into arch/arm64/kernel/entry-common.c.
> > - Avoid removing the __enter_from_*() and __exit_to_*() wrappers.
> > - Update "irqentry_state_t ret/irq_state" to "state"
> >   to keep it consistently.
> > - Use generic irq entry header for PREEMPT_DYNAMIC after split
> >   the generic entry.
> > - Also refactor the ARM64 syscall code.
> > - Introduce arch_ptrace_report_syscall_entry/exit(), instead of
> >   arch_pre/post_report_syscall_entry/exit() to simplify code.
> > - Make the syscall patches clear separation.
> > - Update the commit message.
> 
> Gentle Ping.

I've left soem comments.

As I mentioned previously, I'd very much prefer that we do the syscall
entry logic changes *later* (i.e. as a follow-up patch series), after
we've got the irq/exception entry logic sorted.

I reckon we've got just enough time to get the irq/exception entry
changes ready this cycle, with another round or two of review. So can we
please put the syscall bits aside for now? ... that and run all the
tests you mention in patch 22 on the irq/exception entry changes alone.

Mark.

