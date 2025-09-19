Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16B8CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 09:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2pGtWcSWKwWcZihDX2ZMuxIBwZZUXKhEKn0www3qKQ=; b=xdMrBruKCUd1a8prQtN3txMc5q
	dkgNRAfSSgXNHsTs+oDbP5red6UFoaxnh2CqNQIH1uDfFm9RuuODTFcFlrUoPZbZVXqMka7Q51VvD
	yn/a1FEcUHkhWw/theV/cC0OUxpPCMvHmWUHZrQr3xV+9bnJXfm6l1VK6lX6UVtZD7hl5BMZkmVk+
	05sO7nU2rGqJXYDnboA5LxPHNSZGBKRbyy9bQZKZYUQatm/48VH+Rpsgj+Bp80VdTQ9ZlDiCZFyWn
	QEr8T6wHURFkzU6SnXSyP3TKoYU5BA9aHygkUUPDmF2p+2Ra2IGMMSM31iZ8dYxMGSREGv7aP/JF8
	3WDqm1qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXG3-00000002Lxy-10gs;
	Fri, 19 Sep 2025 09:18:23 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXFu-00000002Lu4-1vPH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 09:18:16 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4cSmyD5fxBzddJ4;
	Fri, 19 Sep 2025 17:13:24 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 50BAE1402DB;
	Fri, 19 Sep 2025 17:18:01 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 19 Sep 2025 17:17:56 +0800
Received: from DESKTOP-VM4LOUJ.huawei.com (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 19 Sep 2025 17:17:48 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>, <catalin.marinas@arm.com>,
	<maz@kernel.org>, <broonie@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <wangkefeng.wang@huawei.com>, <baohua@kernel.org>,
	<jonathan.cameron@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <yangyicong@hisilicon.com>,
	<linuxarm@huawei.com>, <yangyccccc@gmail.com>
Subject: [PATCH RFC 2/2] arm64: atomics: add optimization support for implementations using near atomics
Date: Fri, 19 Sep 2025 17:17:47 +0800
Message-ID: <20250919091747.3702-3-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20250919091747.3702-1-yangyicong@huawei.com>
References: <20250919091747.3702-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_021814_806914_78C8C0F6 
X-CRM114-Status: GOOD (  18.20  )
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

Atomic operations can be implemented in the CPU (near atomics) or
in the interconnect or at the Subordinate holding the data (far
atomics) [1]. The former one can be further optimized by prefetching
the destination prior to the atomic operations, similar to the
optimization for LL/SC operations mentioned in
commit 0ea366f5e1b6 ("arm64: atomics: prefetch the destination word for write prior to stxr")

Add a kconfig ARM64_NEAR_ATOMICS_OPTIMIZATION for compile-in the
optimization and a boot option arm64.near_atomics_optimization for
enabling on platforms implemented as near atomics.

Tested on a HIP09 server using `perf bench -r 100 futex all` which could
stress the spinlock of the futex hash bucket:
                        6.17-rc1 arm64.near_atomics_optimization
futex/hash(ops/sec)	418742	415325	-0.82%
futex/wake(ms)	        0.3954	0.3414	13.66%
futex/wake-parallel(ms)	0.0063	0.0067	-6.35%
(2nd validation)		0.0062	1.59%
futex/requeue(ms)	0.156	0.1565	-0.32%
futex/lock-pi(ops/sec)	103	104	0.97%

For a single wake test for different threads number using `perf bench
-r 100 futex wake -t <threads>`:
threads 6.17-rc1 arm64.near_atomics_optimization
1	0.0021	 0.002	4.76%
48	0.0907	 0.0761	16.10%
96	0.185	 0.1561	15.62%
160	0.3983	 0.3317	16.72%
192	0.4834	 0.4308	10.88%
256	0.6342	 0.5656	10.82%

There're some variation for close numbers but overall results
look positive. As for some more complex benchmarks like unixbench
and tbench, results also appears to be positive.

For unixbnech:
                                       6.17-rc1 arm64.near_atomics_optimization
Dhrystone 2 using register variables   6422.8	6427.8	0.08%
Double-Precision Whetstone             1637.7	1637.7	0.00%
Execl Throughput                       878.4	909.6	3.55%
File Copy 1024 bufsize 2000 maxblocks  1586.4	1603.8	1.10%
File Copy 256 bufsize 500 maxblocks    1022.6	1024.5	0.19%
File Copy 4096 bufsize 8000 maxblocks  2770.9	2935.6	5.94%
Pipe Throughput                        552	552.4	0.07%
Pipe-based Context Switching           345.1	373.8	8.32%
Process Creation                       394.5	410.5	4.06%
Shell Scripts (1 concurrent)           1602.2	1674.1	4.49%
Shell Scripts (8 concurrent)           5154.3	5382	4.42%
System Call Overhead                   229.3	229.3	0.00%
                                       ======================
System Benchmarks Index Score	       1159.6	1190.3	2.65%

For tbench:
threads     6.17-rc1      arm64.near_atomics_optimization
  1:        267.4067        279.8757 (    4.66%)
  4:       1065.8133       1117.1133 (    4.81%)
  8:       2107.9800       2236.3200 (    6.09%)
 16:       4200.2300       4420.2733 (    5.24%)
 32:       8065.9033       8388.0267 (    3.99%)
 64:      14284.0333      14624.7000 (    2.38%)
128:       7573.1800       8078.9900 (    6.68%)

Though this will be beneficial for near atomic implementations in most
cases tested, especially for the latency sensitive ones, I do observed
regression for extreme test cases like locktorture, the throughput
reduced 1~3% according to the test thread numbers.

[1] https://developer.arm.com/documentation/102714/0100/Atomic-fundamentals
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 arch/arm64/Kconfig                  | 18 ++++++++++++++++
 arch/arm64/include/asm/atomic_lse.h | 32 +++++++++++++++++++++++++++++
 arch/arm64/kernel/cpufeature.c      | 26 +++++++++++++++++++++++
 arch/arm64/tools/cpucaps            |  1 +
 4 files changed, 77 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index e9bbfacc35a6..73b640f9d21b 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1925,6 +1925,24 @@ config ARM64_USE_LSE_ATOMICS
 	  atomic routines. This incurs a small overhead on CPUs that do
 	  not support these instructions.
 
+config ARM64_NEAR_ATOMICS_OPTIMIZATION
+	bool "Optimization for near atomics implementation"
+	depends on ARM64_USE_LSE_ATOMICS
+	default n
+	help
+	  Atomic operations implemented in the CPU (near atomics) can be
+	  optimized by prefetching the cacheline in prior to the atomic
+	  operations. Choose this to compile the optimization in the kernel.
+	  You still need to enable the optimization at boot time with CMDLINE
+	  option arm64.near_atomics_optimization based on your system's
+	  implementation.
+
+	  Say Y here to compile the optimization code. N if your system's
+	  implementation is not near atomics or unknown. You may refer to
+	  https://developer.arm.com/documentation/102714/0100/Atomic-fundamentals
+	  for the basic principles of near atomics and far atomics on arm64
+	  CHI based systems.
+
 endmenu # "ARMv8.1 architectural features"
 
 menu "ARMv8.2 architectural features"
diff --git a/arch/arm64/include/asm/atomic_lse.h b/arch/arm64/include/asm/atomic_lse.h
index cb38c2120595..3e5b3fa02d37 100644
--- a/arch/arm64/include/asm/atomic_lse.h
+++ b/arch/arm64/include/asm/atomic_lse.h
@@ -16,6 +16,10 @@ __lse_atomic_##op(int i, atomic_t *v)					\
 {									\
 	asm volatile(							\
 	__LSE_PREAMBLE							\
+	ALTERNATIVE(							\
+	"	nop\n",							\
+	"	prfm	pstl1strm, %[v]\n",				\
+	ARM64_HAS_NEAR_ATOM_OPT, CONFIG_ARM64_NEAR_ATOMICS_OPTIMIZATION)\
 	"	" #asm_op "	%w[i], %[v]\n"				\
 	: [v] "+Q" (v->counter)						\
 	: [i] "r" (i));							\
@@ -41,6 +45,10 @@ __lse_atomic_fetch_##op##name(int i, atomic_t *v)			\
 									\
 	asm volatile(							\
 	__LSE_PREAMBLE							\
+	ALTERNATIVE(							\
+	"	nop\n",							\
+	"	prfm	pstl1strm, %[v]\n",				\
+	ARM64_HAS_NEAR_ATOM_OPT, CONFIG_ARM64_NEAR_ATOMICS_OPTIMIZATION)\
 	"	" #asm_op #mb "	%w[i], %w[old], %[v]"			\
 	: [v] "+Q" (v->counter),					\
 	  [old] "=r" (old)						\
@@ -123,6 +131,10 @@ __lse_atomic64_##op(s64 i, atomic64_t *v)				\
 {									\
 	asm volatile(							\
 	__LSE_PREAMBLE							\
+	ALTERNATIVE(							\
+	"	nop\n",							\
+	"	prfm	pstl1strm, %[v]\n",				\
+	ARM64_HAS_NEAR_ATOM_OPT, CONFIG_ARM64_NEAR_ATOMICS_OPTIMIZATION)\
 	"	" #asm_op "	%[i], %[v]\n"				\
 	: [v] "+Q" (v->counter)						\
 	: [i] "r" (i));							\
@@ -148,6 +160,10 @@ __lse_atomic64_fetch_##op##name(s64 i, atomic64_t *v)			\
 									\
 	asm volatile(							\
 	__LSE_PREAMBLE							\
+	ALTERNATIVE(							\
+	"	nop\n",							\
+	"	prfm	pstl1strm, %[v]\n",				\
+	ARM64_HAS_NEAR_ATOM_OPT, CONFIG_ARM64_NEAR_ATOMICS_OPTIMIZATION)\
 	"	" #asm_op #mb "	%[i], %[old], %[v]"			\
 	: [v] "+Q" (v->counter),					\
 	  [old] "=r" (old)						\
@@ -230,6 +246,10 @@ static __always_inline s64 __lse_atomic64_dec_if_positive(atomic64_t *v)
 
 	asm volatile(
 	__LSE_PREAMBLE
+	ALTERNATIVE(
+	"	nop\n",
+	"	prfm	pstl1strm, %[v]\n",
+	ARM64_HAS_NEAR_ATOM_OPT, CONFIG_ARM64_NEAR_ATOMICS_OPTIMIZATION)
 	"1:	ldr	%x[tmp], %[v]\n"
 	"	subs	%[ret], %x[tmp], #1\n"
 	"	b.lt	2f\n"
@@ -253,6 +273,10 @@ __lse__xchg_case_##name##sz(u##sz new, volatile void *ptr)		\
 									\
 	asm volatile(							\
 	__LSE_PREAMBLE							\
+	ALTERNATIVE(							\
+	"	nop\n",							\
+	"	prfm	pstl1strm, %[v]\n",				\
+	ARM64_HAS_NEAR_ATOM_OPT, CONFIG_ARM64_NEAR_ATOMICS_OPTIMIZATION)\
 	"	swp" #mb #sfx "\t%" #w "[new], %" #w "[old], %[v]\n"	\
 	: [old] "=r" (old),						\
 	  [v] "+Q" (*(u##sz *)ptr)					\
@@ -289,6 +313,10 @@ __lse__cmpxchg_case_##name##sz(volatile void *ptr,			\
 {									\
 	asm volatile(							\
 	__LSE_PREAMBLE							\
+	ALTERNATIVE(							\
+	"	nop\n",							\
+	"	prfm	pstl1strm, %[v]\n",				\
+	ARM64_HAS_NEAR_ATOM_OPT, CONFIG_ARM64_NEAR_ATOMICS_OPTIMIZATION)\
 	"	cas" #mb #sfx "	%" #w "[old], %" #w "[new], %[v]\n"	\
 	: [v] "+Q" (*(u##sz *)ptr),					\
 	  [old] "+r" (old)						\
@@ -331,6 +359,10 @@ __lse__cmpxchg128##name(volatile u128 *ptr, u128 old, u128 new)		\
 									\
 	asm volatile(							\
 	__LSE_PREAMBLE							\
+	ALTERNATIVE(							\
+	"	nop\n",							\
+	"	prfm	pstl1strm, %[v]\n",				\
+	ARM64_HAS_NEAR_ATOM_OPT, CONFIG_ARM64_NEAR_ATOMICS_OPTIMIZATION)\
 	"	casp" #mb "\t%[old1], %[old2], %[new1], %[new2], %[v]\n"\
 	: [old1] "+&r" (x0), [old2] "+&r" (x1),				\
 	  [v] "+Q" (*(u128 *)ptr)					\
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9ad065f15f1d..021f9bed4671 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2520,6 +2520,24 @@ test_has_mpam_hcr(const struct arm64_cpu_capabilities *entry, int scope)
 	return idr & MPAMIDR_EL1_HAS_HCR;
 }
 
+#ifdef CONFIG_ARM64_NEAR_ATOMICS_OPTIMIZATION
+
+static bool near_atom_opt;
+
+static int __init early_near_atom_opt(char *p)
+{
+	return kstrtobool(p, &near_atom_opt);
+}
+early_param("arm64.near_atomics_optimization", early_near_atom_opt);
+
+static bool
+has_near_atom_opt(const struct arm64_cpu_capabilities *entry, int scope)
+{
+	return near_atom_opt;
+}
+
+#endif /* CONFIG_ARM64_NEAR_ATOMICS_OPTIMIZATION */
+
 static const struct arm64_cpu_capabilities arm64_features[] = {
 	{
 		.capability = ARM64_ALWAYS_BOOT,
@@ -2580,6 +2598,14 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		ARM64_CPUID_FIELDS(ID_AA64ISAR0_EL1, ATOMIC, IMP)
 	},
 #endif /* CONFIG_ARM64_LSE_ATOMICS */
+#ifdef CONFIG_ARM64_NEAR_ATOMICS_OPTIMIZATION
+	{
+		.desc = "Optimization for near atomics implementation",
+		.capability = ARM64_HAS_NEAR_ATOM_OPT,
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.matches = has_near_atom_opt,
+	},
+#endif /* CONFIG_ARM64_NEAR_ATOMICS_OPTIMIZATION */
 	{
 		.desc = "Virtualization Host Extensions",
 		.capability = ARM64_HAS_VIRT_HOST_EXTN,
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index ef0b7946f5a4..75ffc451940d 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -44,6 +44,7 @@ HAS_HCX
 HAS_LDAPR
 HAS_LPA2
 HAS_LSE_ATOMICS
+HAS_NEAR_ATOM_OPT
 HAS_MOPS
 HAS_NESTED_VIRT
 HAS_BBML2_NOABORT
-- 
2.24.0


