Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542FDC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 17:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DNS4l74f2WsJSYxJOBJdGCYNHzKf6Xpmas5mNa1M0ek=; b=vDYlSgsjDC2J/4
	Xz/2cTvgVasrn5dNDx9Vq5nHekVbbJgrMBw2S0Q3zbBI+UB0DdNfmZybyzAN5zofHN2TAhLwtfyfC
	xKWEUyY7ALlufQxnIC3CP7WvBLRfAyrKimE4WuWxW1xeryef1HwT1t/qPwKelI60bOqa7GiUXEKfU
	EvWeVqkFi2DLFE3lDqrEmiITJW4dUXtVaO9Ow9l+H1AGPuvjcSYOsmxcyCuprb0vdjVS8NWJWBSIw
	/Fm/BHeF6s8JuKyw8j9qb9EtUCN14gQtb56LmK16uokU/Z5QarPyjgGZZ2fgvUoacjUr4l/5JdBJI
	4PBYRyHLpCuGqn7dMFvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIaG-00000002Pxq-0rIa;
	Tue, 04 Aug 2026 17:05:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIaD-00000002Pvo-2prv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 17:05:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03684165C;
	Tue,  4 Aug 2026 10:05:36 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C57793F632;
	Tue,  4 Aug 2026 10:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785863140; bh=dPZOoxvkh3zZ9logT85KPKrZMdzuLCbmCBCnCayEBkE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uplhS1DfuXL04uXKXgFUg0xq2q5kVUieqqPEixAQEzeIHG0RWBSP6HadUwKBzhqxr
	 8/l8rMF80x9D7xg19wY913vE3ovvx+sVg+aUwHxKRFyWB86KYqIfXg+1BWI2Nl+78l
	 Us2Iik4m4YWR7hP2xmytc6yqpJWO7TaI8iTj0rgY=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 06/20] arm64: preempt: Treat should_resched() as unlikely
Date: Tue,  4 Aug 2026 18:04:49 +0100
Message-Id: <20260804170503.3513916-7-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260804170503.3513916-1-mark.rutland@arm.com>
References: <20260804170503.3513916-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_100541_834633_F7F2CB40 
X-CRM114-Status: GOOD (  11.43  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, ryan.roberts@arm.com, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, david@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org
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


