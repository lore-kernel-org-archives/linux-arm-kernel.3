Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE070FEEF34
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 13:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZFfS+7kj/oW0Ioe770S1h2/nYS/JFQoXdkqF6IcTsYE=; b=e+UTJcvZ/WhmWY
	7F95kT+rjrxygC6LbJ2uG/K3uY95+XtVcW/5P0LAquqxoC+CDx0WLseqfgaqeGkq7w3A+zbCCyqo1
	RFBYatHh/qzL9UUQaYdiP4CafSQpDM6N066rUtjcgQgPULwfNWhW4t3fVa7bsYbtpgpUU+z2I5waq
	5B528KYgbPFhk18OZ1J6eKo1YaxeR5R8dxhdg2SOCTSmvtLm7CeDJzIuub87ttXXcOmWyM2MAmTWy
	00W5/cgSpIuAyGEUIFRVKvdpFG4cXwxWnovyjLvGY2XOg8ixnQ+xjYNRpBG7rotQMP/xxh5BH4ahc
	P8kHczKcSsDclxirPcCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6Ih-00000006Utk-3P0W;
	Tue, 07 Apr 2026 13:17:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6If-00000006UtQ-1yws
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 13:17:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2694A16F2;
	Tue,  7 Apr 2026 06:16:53 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 065A03F7D8;
	Tue,  7 Apr 2026 06:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775567818; bh=RC8MlZLQXOs/wu22se6QPuN34nBCxoXl+ve1eY4SviU=;
	h=From:To:Cc:Subject:Date:From;
	b=OmftG4XWxu9BRZDz1jwAXLwP4FcvXPY9p5DaVEc3sxuMqTIpOBoXsc1qP2PFnLbDb
	 4QY79658o5BauA9Aq4VzY7avDQBuj9+tkSRP2TCMBbwT77oqf2b2kxJA76Q0Vutz/S
	 /M4rcM9y2BmgUaoI4sJva87HW/FOQ3MPknnWc6mw=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 00/10] arm64/entry: 
Date: Tue,  7 Apr 2026 14:16:40 +0100
Message-Id: <20260407131650.3813777-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_061701_651406_47BAADAA 
X-CRM114-Status: GOOD (  14.66  )
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
Cc: mark.rutland@arm.com, ruanjinjie@huawei.com, vladimir.murzin@arm.com, linux-kernel@vger.kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Since the move to generic IRQ entry, arm64's involuntary kernel
preemption logic has been subtly broken, and preemption can lead to
tasks running with some exceptions masked unexpectedly.

The gory details were discussed in the thread for my earlier attempt to
fix this:

  https://lore.kernel.org/linux-arm-kernel/20260320113026.3219620-1-mark.rutland@arm.com/
  https://lore.kernel.org/linux-arm-kernel/ab1prenkP-tFgUzK@J2N7QTR9R3.cambridge.arm.com/
  https://lore.kernel.org/linux-arm-kernel/ab2EZAXvL6bYcuKt@J2N7QTR9R3.cambridge.arm.com/
  https://lore.kernel.org/linux-arm-kernel/acPAzdtjK5w-rNqC@J2N7QTR9R3/

In summary, due to the way arm64's exceptions work architecturally, and
due to some constraints on sequencing during entry/exit, fixing this
properly requires tha arm64 handles more of the sequencing and
(architectural) state management itself.

This series attempts to make that possible by refactoring the generic
irqentry kernel mode entry/exit paths to look more like the user mode
entry/exit paths, with a separate 'prepare' step prior to return. The
refactoring also allows more of the generic irqentry code to be inlined
into architectural entry code, which can result in slightly better code
generation.

I've split the series into a prefix of changes for generic irqentry,
followed by changes to the arm64 code. I'm hoping that we can queue the
generic irqentry patches onto a stable branch, or take those via arm64.
The patches are as follows:

* Patches 1 and 2 are cleanup to the generic irqentry code. These have no
  functional impact, and I think these can be taken regardless of the
  rest of the series.

* Patches 3 to 5 refactor the generic irqentry code as described above,
  providing separate irqentry_{enter,exit}() functions and providing a
  split form of irqentry_exit_to_kernel_mode() similar to what exists
  for irqentry_exit_to_user_mode(). These patches alone should have no
  functional impact.

* Patch 6 is a minimal fix for the arm64 exception masking issues. This
  DOES NOT depend on the generic irqentry patches, and can be backported
  to stable.

* Patches 7 to 9 refactor the arm64 entry code and provide a more
  optimal fix (which permits preemption in more cases). These are split
  into separate patches to aid bisection.

* Patch 10 is a test which can detect exceptions being masked
  unexpectedly. I don't know whether we want to take this as-is, but
  I've included it here to aid testing and so that it gets archived for
  future reference.

The series is based on v7.0-rc3.

Thanks,
Mark.

Mark Rutland (10):
  entry: Fix stale comment for irqentry_enter()
  entry: Remove local_irq_{enable,disable}_exit_to_user()
  entry: Move irqentry_enter() prototype later
  entry: Split kernel mode logic from irqentry_{enter,exit}()
  entry: Split preemption from irqentry_exit_to_kernel_mode()
  arm64: entry: Don't preempt with SError or Debug masked
  arm64: entry: Consistently prefix arm64-specific wrappers
  arm64: entry: Use irqentry_{enter_from,exit_to}_kernel_mode()
  arm64: entry: Use split preemption logic
  arm64: Check DAIF (and PMR) at task-switch time

 arch/arm64/kernel/entry-common.c |  52 ++++----
 arch/arm64/kernel/process.c      |  25 ++++
 include/linux/entry-common.h     |   2 +-
 include/linux/irq-entry-common.h | 196 ++++++++++++++++++++++---------
 kernel/entry/common.c            | 107 ++---------------
 5 files changed, 202 insertions(+), 180 deletions(-)

-- 
2.30.2


