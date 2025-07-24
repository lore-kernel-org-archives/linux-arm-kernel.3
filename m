Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5034C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AZl1q9LmOXHZ/8XIAy4UC2IfNCdnuwk/LvRHnLrxDfs=; b=3DQPidSo1mzBICaywiUjvyKrRg
	mH+t90oVg9Fy13R6CB62IeUU5qw+zHq8r6mpjd42v7l7VL/2clnaNquXJvvkI5BXVzrqipbjySDuT
	p4xiDqjIy2V6D+uwy8sCSDQNyUzfSUO4mvlVUt74pYqHnbYUYs12I1v4H/h+LnexfK6tFOH7ATCji
	VeXZMBhSLZnD8/lmU0jqhf6YzwPWAjreZU/nVQELF7JpoyIaZjp9uBycQQViRoOR705fxXx8JaYoG
	AHXnDR9ZqJOWcyeuebPqeylRS17mlBj82jSmdpvGBXWirGORYiIJyYKanMlrJpe4Nd/2/BfDsDPtk
	MfinGXug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewOl-00000007cBX-3Rb6;
	Thu, 24 Jul 2025 13:54:15 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueujZ-00000007OWh-1Yd4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 12:07:39 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4bnqQ23FPGzSjcp;
	Thu, 24 Jul 2025 20:02:50 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 0D58C1402ED;
	Thu, 24 Jul 2025 20:07:23 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 24 Jul 2025 20:07:22 +0800
Received: from localhost.localdomain (10.50.165.33) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 24 Jul 2025 20:07:22 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>, <catalin.marinas@arm.com>,
	<maz@kernel.org>, <broonie@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <wangkefeng.wang@huawei.com>, <baohua@kernel.org>,
	<jonathan.cameron@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <yangyicong@hisilicon.com>,
	<linuxarm@huawei.com>, <tiantao6@hisilicon.com>
Subject: [RFT PATCH] arm64: atomics: prefetch the destination prior to LSE operations
Date: Thu, 24 Jul 2025 20:06:51 +0800
Message-ID: <20250724120651.27983-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_050737_729852_512F70F6 
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Yicong Yang <yangyicong@hisilicon.com>

commit 0ea366f5e1b6 ("arm64: atomics: prefetch the destination word for write prior to stxr")
adds prefetch prior to LL/SC operations due to performance concerns -
change the cacheline status from exclusive could be significant. This is
also true for LSE operations, so prefetch the destination prior to LSE
operations.

Tested on my HIP08 server (2 * 64 CPU) using `perf bench -r 100 futex all`
which could stress the spinlock of the futex hash bucket:
                        6.16-rc7 patched
futex/hash(ops/sec)     171843   204757 +19.15%
futex/wake(ms)          0.4630   0.4216 +8.94%
futex/wake-parallel(ms) 0.0048   0.0039 +18.75%
futex/requeue(ms)       0.1487   0.1508 -1.41%
(2nd validation)                 0.1484 +0.2%
futex/lock-pi(ops/sec)  125      126    +0.8%

For a single wake test for different threads number using `perf bench
-r 100 futex wake -t <threads>`:
threads 6.16-rc7 patched
1       0.0035   0.0032 +8.57%
48      0.1454   0.1221 +16.02%
96      0.3047   0.2304 +24.38%
160     0.5489   0.5012 +8.69%
192     0.6675   0.5906 +11.52%
256     0.9445   0.8092 +14.33%

There're some variation for close numbers but overall results
look positive.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---

RFT for tests and feedbacks since not sure it's general or just the optimization
on some specific implementations.

 arch/arm64/include/asm/atomic_lse.h | 7 +++++++
 arch/arm64/include/asm/cmpxchg.h    | 3 ++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/atomic_lse.h b/arch/arm64/include/asm/atomic_lse.h
index 87f568a94e55..a45e49d5d857 100644
--- a/arch/arm64/include/asm/atomic_lse.h
+++ b/arch/arm64/include/asm/atomic_lse.h
@@ -16,6 +16,7 @@ __lse_atomic_##op(int i, atomic_t *v)					\
 {									\
 	asm volatile(							\
 	__LSE_PREAMBLE							\
+	"	prfm	pstl1strm, %[v]\n"				\
 	"	" #asm_op "	%w[i], %[v]\n"				\
 	: [v] "+Q" (v->counter)						\
 	: [i] "r" (i));							\
@@ -41,6 +42,7 @@ __lse_atomic_fetch_##op##name(int i, atomic_t *v)			\
 									\
 	asm volatile(							\
 	__LSE_PREAMBLE							\
+	"	prfm	pstl1strm, %[v]\n"				\
 	"	" #asm_op #mb "	%w[i], %w[old], %[v]"			\
 	: [v] "+Q" (v->counter),					\
 	  [old] "=r" (old)						\
@@ -123,6 +125,7 @@ __lse_atomic64_##op(s64 i, atomic64_t *v)				\
 {									\
 	asm volatile(							\
 	__LSE_PREAMBLE							\
+	"	prfm	pstl1strm, %[v]\n"				\
 	"	" #asm_op "	%[i], %[v]\n"				\
 	: [v] "+Q" (v->counter)						\
 	: [i] "r" (i));							\
@@ -148,6 +151,7 @@ __lse_atomic64_fetch_##op##name(s64 i, atomic64_t *v)			\
 									\
 	asm volatile(							\
 	__LSE_PREAMBLE							\
+	"	prfm	pstl1strm, %[v]\n"				\
 	"	" #asm_op #mb "	%[i], %[old], %[v]"			\
 	: [v] "+Q" (v->counter),					\
 	  [old] "=r" (old)						\
@@ -230,6 +234,7 @@ static __always_inline s64 __lse_atomic64_dec_if_positive(atomic64_t *v)
 
 	asm volatile(
 	__LSE_PREAMBLE
+	"	prfm	pstl1strm, %[v]\n"				\
 	"1:	ldr	%x[tmp], %[v]\n"
 	"	subs	%[ret], %x[tmp], #1\n"
 	"	b.lt	2f\n"
@@ -253,6 +258,7 @@ __lse__cmpxchg_case_##name##sz(volatile void *ptr,			\
 {									\
 	asm volatile(							\
 	__LSE_PREAMBLE							\
+	"	prfm	pstl1strm, %[v]\n"				\
 	"	cas" #mb #sfx "	%" #w "[old], %" #w "[new], %[v]\n"	\
 	: [v] "+Q" (*(u##sz *)ptr),					\
 	  [old] "+r" (old)						\
@@ -295,6 +301,7 @@ __lse__cmpxchg128##name(volatile u128 *ptr, u128 old, u128 new)		\
 									\
 	asm volatile(							\
 	__LSE_PREAMBLE							\
+	"	prfm	pstl1strm, %[v]\n"				\
 	"	casp" #mb "\t%[old1], %[old2], %[new1], %[new2], %[v]\n"\
 	: [old1] "+&r" (x0), [old2] "+&r" (x1),				\
 	  [v] "+Q" (*(u128 *)ptr)					\
diff --git a/arch/arm64/include/asm/cmpxchg.h b/arch/arm64/include/asm/cmpxchg.h
index d7a540736741..daacbabeadb7 100644
--- a/arch/arm64/include/asm/cmpxchg.h
+++ b/arch/arm64/include/asm/cmpxchg.h
@@ -32,8 +32,9 @@ static inline u##sz __xchg_case_##name##sz(u##sz x, volatile void *ptr)		\
 	"	cbnz	%w1, 1b\n"						\
 	"	" #mb,								\
 	/* LSE atomics */							\
+	"	prfm	pstl1strm, %2\n"					\
 	"	swp" #acq_lse #rel #sfx "\t%" #w "3, %" #w "0, %2\n"		\
-		__nops(3)							\
+		__nops(2)							\
 	"	" #nop_lse)							\
 	: "=&r" (ret), "=&r" (tmp), "+Q" (*(u##sz *)ptr)			\
 	: "r" (x)								\
-- 
2.24.0


