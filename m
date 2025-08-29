Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C96CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 19:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/Dj04vWIeuHCsy+8+zt4TdMtpI2sSyrmJEPdLR6nowk=; b=qGAvNbzDIUNg4j9XRmChjsk+/q
	pIarsVYkcnCg3NKPnjh+4YxIQrNkyCKMKJy6DKF7bZsK99H/K7G3QGNlD8jngAmLtgzZSijX1Z2HP
	TgZzaQmQeKVeESiwvAve4o5hwS5QBWMlsTVqjNy98F9qt2u4ZUZFwLYjaUVnRp3OtjPU9HbPbFeUn
	FfDg392F8hsPJaKIdlQ0bTuUvGkks15UVcITKVteag72uQLqhJcWp5Q/9h/pIC/KmRcnNh/NHD8rY
	2TMZl4ybqLLB/RaR8pYnaFFRDK5DcdscfIbkCAyPkHhz0v9N2BEWgGlRWs1mMtYh8YZmS5KAufSbI
	2ZNk/1Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us4tF-00000006kx6-44e9;
	Fri, 29 Aug 2025 19:36:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us18P-00000006DG5-1ljE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 15:35:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C958719F0;
	Fri, 29 Aug 2025 08:35:15 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0483D3F738;
	Fri, 29 Aug 2025 08:35:22 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 0/2] Don't broadcast TLBI if mm was only active on local CPU
Date: Fri, 29 Aug 2025 16:35:06 +0100
Message-ID: <20250829153510.2401161-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_083525_502119_11BB1B9E 
X-CRM114-Status: GOOD (  14.37  )
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

Hi All,

This is an RFC for my implementation of an idea from James Morse to avoid
broadcasting TBLIs to remote CPUs if it can be proven that no remote CPU could
have ever observed the pgtable entry for the TLB entry that is being
invalidated. It turns out that x86 does something similar in principle.

The primary feedback I'm looking for is; is this actually correct and safe?
James and I both believe it to be, but it would be useful to get further
validation.

Beyond that, the next question is; does it actually improve performance?
stress-ng's --tlb-shootdown stressor suggests yes; as concurrency increases, we
do a much better job of sustaining the overall number of "tlb shootdowns per
second" after the change:

+------------+--------------------------+--------------------------+--------------------------+
|            |     Baseline (v6.15)     |        tlbi local        |        Improvement       |
+------------+-------------+------------+-------------+------------+-------------+------------+
| nr_threads |     ops/sec |    ops/sec |     ops/sec |    ops/sec |     ops/sec |    ops/sec |
|            | (real time) | (cpu time) | (real time) | (cpu time) | (real time) | (cpu time) |
+------------+-------------+------------+-------------+------------+-------------+------------+
|          1 |        9109 |       2573 |        8903 |       3653 |         -2% |        42% |
|          4 |        8115 |       1299 |        9892 |       1059 |         22% |       -18% |
|          8 |        5119 |        477 |       11854 |       1265 |        132% |       165% |
|         16 |        4796 |        286 |       14176 |        821 |        196% |       187% |
|         32 |        1593 |         38 |       15328 |        474 |        862% |      1147% |
|         64 |        1486 |         19 |        8096 |        131 |        445% |       589% |
|        128 |        1315 |         16 |        8257 |        145 |        528% |       806% |
+------------+-------------+------------+-------------+------------+-------------+------------+

But looking at real-world benchmarks, I haven't yet found anything where it
makes a huge difference; When compiling the kernel, it reduces kernel time by
~2.2%, but overall wall time remains the same. I'd be interested in any
suggestions for workloads where this might prove valuable.

All mm selftests have been run and no regressions are observed. Applies on
v6.17-rc3.

Thanks,
Ryan


Ryan Roberts (2):
  arm64: tlbflush: Move invocation of __flush_tlb_range_op() to a macro
  arm64: tlbflush: Don't broadcast if mm was only active on local cpu

 arch/arm64/include/asm/mmu.h         |  12 +++
 arch/arm64/include/asm/mmu_context.h |   2 +
 arch/arm64/include/asm/tlbflush.h    | 116 ++++++++++++++++++++++++---
 arch/arm64/mm/context.c              |  30 ++++++-
 4 files changed, 145 insertions(+), 15 deletions(-)

--
2.43.0


