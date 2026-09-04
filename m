Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE24AC79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bc+LGQ0zWlWLs/kKpiifO7igu4kZALH+DsVSDPfEdfk=; b=WP+x4Ug2ll+nLP
	T0CsEanQTWAHTN/QTdb6R2K1sTxjOzZssaoKKJcjC28NypYggOS6FQy+5mQRTIOyKvpaZPsXEm1k9
	GA+dEeunfyFcLj04TYogImn9E80c8DEPZDOVyaHE36kv4Op9Nw6FQJTtIG11KI9aXRfkIKMbuFoIJ
	iFKa6HgJswqdt9L/UrK8q+D2IcM8NpnD6t5wdVR1UEIplcwZq4is5HzW2E9DysYXL9VMrBQOFCL9G
	K8btrGB3U1CC413jooTH61gSOztjf9CJq4k/vcjfHl2ieETvkiCdKnKraXl3gHd+mnabuB9jzFhfc
	HRKUrrL5ts1bILqx5NHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Wcq-00000002h7L-3Sjw;
	Fri, 04 Sep 2026 16:18:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Wco-00000002h63-1mkN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 16:18:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3146A153B;
	Fri,  4 Sep 2026 09:18:41 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DE0B13FBD2;
	Fri,  4 Sep 2026 09:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788538724; bh=GcKZFnQgJw6u5Wdp85aJgg7AOSBlCknf/ylfv6Qx5pc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=haYv9cqPbHyCyzqV6DnRopzNdyRyff9gUFLb7W7pquC3UpagbLYT+D3QTHRh5Vr4R
	 OG7VN0f6SijGhVtxQ1qqkzonIn0Xb1BlGQHHIz+IgoI8m7W1PghRpPtQ/EtTTwBOe3
	 uOY1LwhCHJLn0V3em1srmJqGECg2/xqIC2PjeV9s=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 07/21] arm64: preempt: Treat should_resched() as unlikely
Date: Fri,  4 Sep 2026 17:17:44 +0100
Message-Id: <20260904161758.376504-8-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260904161758.376504-1-mark.rutland@arm.com>
References: <20260904161758.376504-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_091846_505585_3C09A9E6 
X-CRM114-Status: GOOD (  11.17  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, usama.anjum@arm.com, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, will@kernel.org, ardb@kernel.org
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
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/include/asm/preempt.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index 92ae2eb95a738..0a99ef9b59609 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -78,7 +78,7 @@ static inline int __preempt_count_sub_return(int val)
 static inline bool should_resched(int preempt_offset)
 {
 	u64 pc = READ_ONCE(current_thread_info()->preempt_count);
-	return pc == preempt_offset;
+	return unlikely(pc == preempt_offset);
 }
 
 static inline bool __preempt_count_dec_and_test(void)
-- 
2.30.2


