Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78911C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 12:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=419KN+4kNCoqwT/bg3p1DwChGvlb6Rr5+FRaPL1OlUE=; b=mWYbUgpGZvbr5P
	u2eVmsW4ND3TAOQvawZamSZSMTjYvkrUadVNWjYkWL3MBD7pXUPOcOwLU+GZF1xYbcKKspWP+OXX5
	eXwPSaZydyr67uO+yNO/38W7eK0HMlNKT9kmy9McSVueSVrtxJp3/BhpSyhkik2n83IrMmdU2uQ/T
	w2pM6lwNBR7JzMlxzFzoUF5R+gWIiPdVY5cfkJ2MbmOKj9qXGsrvXQYccc2D1zSAkDDGR5vxwbHT+
	wNqDj9scmOL8c67twwkJd4+vMARjyhCXSriZw0RJvUXufHT+7aEhNTwrnWTOnAN6Zx7MXRSisixBg
	ZLQ/+zQNwqMT1r4LufnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woh68-00000005GQc-436i;
	Tue, 28 Jul 2026 12:39:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woh63-00000005GOY-2dqw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 12:39:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8DD6175D;
	Tue, 28 Jul 2026 05:39:41 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 115513F86F;
	Tue, 28 Jul 2026 05:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785242385; bh=pWV6z+z312qnQhlJKvuL2knNIVHFC+IiSIOeS+l3yo8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mRQYazPbq72oSunmh6AVdfciE8lWRNEeSEHGp7Gcpoktx5MLCAKN5WaGtYL4tRYGO
	 cvhyB9Mj4ljHJhr2mlCNAw1a/tSyi2ArfO06FpiRf6nU4YK5ZBW2v/QejfsPvw+2DK
	 4VOFxfpseuDtt473gvuQa39Xz8gQLJLMFdj7H9Xs=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 02/13] arm64: preempt: Treat should_resched() as unlikely
Date: Tue, 28 Jul 2026 13:38:48 +0100
Message-Id: <20260728123859.2911495-3-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260728123859.2911495-1-mark.rutland@arm.com>
References: <20260728123859.2911495-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_053947_721913_57B8400A 
X-CRM114-Status: GOOD (  11.19  )
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

The arm64 implementation of should_resched() doesn't treat the need to
resched as unlikely, while all other implementations do, e.g.

* asm-generic since:
  bdb43806589096ac ("sched: Extract the basic add/sub preempt_count modifiers")

* x86 since:
  c2daa3bed53a8117 ("sched, x86: Provide a per-cpu preempt_count implementation")

* s390 since:
  c360192bf4a8dc72 ("s390/preempt: move preempt_count to the lowcore")

Do the same for arm64.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/include/asm/preempt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index ca2ad1a8db095..3ef24ab8f3399 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -58,7 +58,7 @@ static inline void __preempt_count_sub(int val)
 static inline bool should_resched(int preempt_offset)
 {
 	u64 pc = READ_ONCE(current_thread_info()->preempt_count);
-	return pc == preempt_offset;
+	return unlikely(pc == preempt_offset);
 }
 
 static inline bool __preempt_count_dec_and_test(void)
-- 
2.30.2


