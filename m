Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED46CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 15:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3N8l4T7mp47tFSd/EXFsd5tDqUHvsW23SoAUY7mUwsQ=; b=PgBZ5aB+JZaYMVYRCm8wkj1M/Y
	NTUbqLUnBIMcnJiMkVcJPoyOkV6h6htyTxoF9ajprIh5t3onxp7NFy6+UcQQ9X1HhO6DzPNkjPc7V
	97YlvWKTbjS3Pl6dD/+xG+pMl5y7dE8qZkXFedTlpbWVFGPl2WbWrCrNA5zXPvcP3x+1MgfnX01ex
	XGIEfyxCIB2uI9v63YXyGnlX3wV23KhUNT85aF/ZnPFWOiGinAFThbpuMVhCpGV9aM3lkcgqogMtU
	mV8iebi02UWwDU/GP16sY/EtJYsnLP0mBplptWyGtnjOGUyv7uKRF6WI5ckzm8OAgUKjyAPX1oHrk
	5srTrFlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2Hc-0000000FqcW-0lnz;
	Thu, 06 Nov 2025 15:52:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2Hb-0000000FqcK-0nx9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 15:52:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2287161908;
	Thu,  6 Nov 2025 15:52:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 178D3C4CEF7;
	Thu,  6 Nov 2025 15:52:15 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Willy Tarreau <w@1wt.eu>,
	Mark Rutland <mark.rutland@arm.com>,
	Yicong Yang <yangyccccc@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] arm64: Use load LSE atomics for the non-return per-CPU atomic operations
Date: Thu,  6 Nov 2025 15:52:13 +0000
Message-ID: <20251106155213.3186582-1-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The non-return per-CPU this_cpu_*() atomic operations are implemented as
STADD/STCLR/STSET when FEAT_LSE is available. On many microarchitecture
implementations, these instructions tend to be executed "far" in the
interconnect or memory subsystem (unless the data is already in the L1
cache). This is in general more efficient when there is contention as it
avoids bouncing cache lines between CPUs. The load atomics (e.g. LDADD
without XZR as destination), OTOH, tend to be executed "near" with the
data loaded into the L1 cache.

STADD executed back to back as in srcu_read_{lock,unlock}*() incur an
additional overhead due to the default posting behaviour on several CPU
implementations. Since the per-CPU atomics are unlikely to be used
concurrently on the same memory location, encourage the hardware to to
execute them "near" by issuing load atomics - LDADD/LDCLR/LDSET - with
the destination register unused (but not XZR).

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Link: https://lore.kernel.org/r/e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop
Reported-by: Paul E. McKenney <paulmck@kernel.org>
Tested-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/percpu.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 9abcc8ef3087..d4dff4b0cf50 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -77,7 +77,7 @@ __percpu_##name##_case_##sz(void *ptr, unsigned long val)		\
 	"	stxr" #sfx "\t%w[loop], %" #w "[tmp], %[ptr]\n"		\
 	"	cbnz	%w[loop], 1b",					\
 	/* LSE atomics */						\
-		#op_lse "\t%" #w "[val], %[ptr]\n"			\
+		#op_lse "\t%" #w "[val], %" #w "[tmp], %[ptr]\n"	\
 		__nops(3))						\
 	: [loop] "=&r" (loop), [tmp] "=&r" (tmp),			\
 	  [ptr] "+Q"(*(u##sz *)ptr)					\
@@ -124,9 +124,9 @@ PERCPU_RW_OPS(8)
 PERCPU_RW_OPS(16)
 PERCPU_RW_OPS(32)
 PERCPU_RW_OPS(64)
-PERCPU_OP(add, add, stadd)
-PERCPU_OP(andnot, bic, stclr)
-PERCPU_OP(or, orr, stset)
+PERCPU_OP(add, add, ldadd)
+PERCPU_OP(andnot, bic, ldclr)
+PERCPU_OP(or, orr, ldset)
 PERCPU_RET_OP(add, add, ldadd)
 
 #undef PERCPU_RW_OPS

