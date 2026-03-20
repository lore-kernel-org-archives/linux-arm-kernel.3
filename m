Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571D3108B900
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 11:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ziZ1qJxZ1h9434WPlqwPgAclO8RnqWxwPcpA5LJYEIw=; b=qSjTERstSPPJq9
	1GlEukBGso5yZmXyDGtxkSKrygBETzIVxLsBIWTTQFqYfHSIaBUaRE+DfcrRgL1CEfnBBL0LmEZn0
	ff8D4MGPmaFNKzQU85wMHL5JpjceeSxgWs5kCkuTgZC6a/+pGIHn76Fv77I3n1ht6Xj7cTrKbKzWB
	SqroXSxSYpNphyJXV+WOjtpwrvN5vTfxzf3B+Zo+gwQFEQTj7SIL3qYX9fTMHX2HX86v6DtRuZTZL
	U97iELQz8afft6QSCCN0pS8UcbhvTcVAzzyU0IAwrRb4+8vZZ3pdHzMpV9KnzTC6mN4IRr32cIR+M
	0/PtUY7ftxrig/BPlhYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Y3u-0000000ChXI-47fK;
	Fri, 20 Mar 2026 11:30:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Y3s-0000000ChWu-3CRn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 11:30:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C73861682;
	Fri, 20 Mar 2026 04:30:30 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3CC673F7BD;
	Fri, 20 Mar 2026 04:30:35 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	peterz@infradead.org,
	tglx@kernel.org,
	vladimir.murzin@arm.com,
	will@kernel.org
Subject: [PATCH 0/2] arm64/entry: Fix involuntary preemption exception masking
Date: Fri, 20 Mar 2026 11:30:24 +0000
Message-Id: <20260320113026.3219620-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_043040_867494_5587E2A5 
X-CRM114-Status: GOOD (  12.45  )
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
Cc: mark.rutland@arm.com, ruanjinjie@huawei.com, linux-kernel@vger.kernel.org, luto@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi all,

Since the move to generic IRQ entry, arm64's involuntary kernel
preemption logic has been subtly broken, and preemption can lead to
tasks running with some exceptions masked unexpectedly.

Patch 1 describes the gory details, but the gist is that due to the way
exceptions work on arm64 architecturally, and due to the number of
independently maskable exceptions, some aspects of the generic irq entry
code aren't a great fit, and arm64 needs to manage more of the
sequencing and state management itself. Doing so will also make it
possible to implement new stuff in the near future (e.g. architectural
NMI).

Patch 2 is purely a cleanup atop patch 1.

Thomas, Peter, I have some questions at the end of the patch 1 commit
message, but otherwise I hope this looks good to you. I'm assuming that
this should go via the arm64 tree, so I'm looking for your acks on both
patches.

Mark.

Mark Rutland (2):
  arm64/entry: Fix involuntary preemption exception masking
  arm64/entry: Remove arch_irqentry_exit_need_resched()

 arch/Kconfig                          |  3 +++
 arch/arm64/Kconfig                    |  1 +
 arch/arm64/include/asm/entry-common.h | 27 ---------------------------
 arch/arm64/kernel/entry-common.c      | 27 +++++++++++++++++++++++++++
 kernel/entry/common.c                 | 20 ++++----------------
 5 files changed, 35 insertions(+), 43 deletions(-)

-- 
2.30.2


