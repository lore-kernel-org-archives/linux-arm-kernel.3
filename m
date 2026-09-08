Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4717CC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BuetLOGSOWWoiBi/3LKcGz9VePW0xcqBJGc/dDjxY7w=; b=gR4jD9V8a/u1Ok
	mMVy9stko43EUSTRt8ZsGm8V7pVB2gZbsOkMlJ9f7WIqCEf3tBX5Udc38dpIpM+XuDF9dMmfVvkRQ
	MWIoZTvLsQ/AAW7pyF3a5mMtty4lWAKEVmRkuSPenAsjn8Ubuj/4eVEjMvWGVBbXGXHYq6ZCm6piC
	xXHibA4qmzi/r+6pImWpJ31SVzvDzKIjEjRz86M9VQRPFXUiLAQ43SyhguN1TxuF5qOxcfE/cNdKD
	ijNnX4g6SA2aBuo3gsf46BTXHQU27HZbUSQyURofrFk/70M6F7EQLb1siKqD8U6LNjZmMRI5586AM
	tEj060mMmnIaUAyZoN5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xbV-00000009RwI-145w;
	Tue, 08 Sep 2026 15:19:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xbT-00000009Rvn-0Jmp
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 15:19:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=BuetLOGSOWWoiBi/3LKcGz9VePW0xcqBJGc/dDjxY7w=; b=YbCIeibFzW3RrcJpvDT2pafFmI
	uE+IqkzSSkTjqWoQUph2e1VZgqPZ9MM7FLs7jeUAmEyq9LXZr/j/+rsp51EkcXaic+O8wVbz1Kp3O
	2pXFzaKRU4H5gDODy7SfurbV0gGwWxbUmGHPLf5CyJLC58Wx/YlhJgjg/d4rKBzwr/w9tTyrB0i6Q
	arRc00vR4eMF5yTRG1tu2t3TGR6CRkdUGXwxMHPbH2PQlT/xlqVYDe3C+k9a6BMnVke71TN3qHxXC
	4ybAted311USCsdsAfUWxK7XYli266iS/ELqKGR/0kMGwLF3kAzyFQS+7zL2k7N/HEjuTsiO9Wg+9
	r7ei1ozg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3xbP-000000000X4-3E3a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:19:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5CDB1476;
	Tue,  8 Sep 2026 08:19:10 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D459D3F7B4;
	Tue,  8 Sep 2026 08:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788880754; bh=BsIvtuBar/wrgFohR+cdVkNa49fe8IIL2JvmYClbIJU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lkMG+MZ4xRFlRzNYktKmb+43jXpbVgvJFNL/8G7hyUV9QBXTXwQqoNki2KgLtmoLz
	 tDl5XPFOpWVP9vq6Sde6uo2NKfFXrB9B3LEqSnJ9iPzPrSiCJEqo0CrSTAHxB69b+o
	 QUgipLKHuj3ks0Hq3a/UB9f5BERmmqxjaUFMQS3A=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 04/21] arm64: cmpxchg: LL/SC: Avoid redundant extension
Date: Tue,  8 Sep 2026 16:17:24 +0100
Message-Id: <20260908151741.394589-5-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260908151741.394589-1-mark.rutland@arm.com>
References: <20260908151741.394589-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_161916_177775_B2926E23 
X-CRM114-Status: GOOD (  18.60  )
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
Cc: mark.rutland@arm.com, vladimir.murzin@arm.com, ryan.roberts@arm.com, usama.anjum@arm.com, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, david@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The __ll_sc__cmpxchg_case_##name##sz() template always takes 'old' as an
unsigned long. When 'sz' is less than 32 bits, the 'old' is explicitly
truncated so that old[31:sz-1] is zero, which is necessary so that the
W-register EOR+CBNZ sequence doesn't fail spuriously.

For 32-bit types specifically, no extension is necessary, but as 'old'
is 64 bits, the caller must extend 'old' to 64 bits. This leads to a
redundant instruction (typically a MOV) to extend the value, as can be
seen from disassembly of the test case below.

Avoid this by always taking 'old' as a 'u##sz' type, and explicitly
zero-extend this to a 64-bit or 32-bit type matching the X or W register
used by the assembly. To make this work, the table of cases now
explicitly lists 'x' for the cases where an X register is used.

For 32-bit types this removes the redundant instruction. For 64-bit
types there is no truncation, and hence no change. For {16,8}-bit types,
the existing zero-extension to 64-bit is equivalent to the new
zero-extension to 32-bit, and compilers happen to use the same
instructions for this.

I've placed the logic for zero extension into a new <asm/xwreg.h> header
as it will be used by other logic in subsequent patches.

Test case:

| u32 outline_cmpxchg_u32(u32 *p, u32 o, u32 n)
| {
|         return cmpxchg(p, o, n);
| }

Before this patch:

| <outline_cmpxchg_u32>:
|        b       1f
|        casal   w1, w2, [x0]
|        mov     w0, w1
|        ret
| 1:     mov     w3, w1
|        prfm    pstl1strm, [x0]
| 2:     ldxr    w1, [x0]
|        eor     w4, w1, w3
|        cbnz    w4, 3f
|        stlxr   w4, w2, [x0]
|        cbnz    w4, 2b
|        dmb     ish
| 3:     mov     w0, w1
|        ret

After this patch:

| <outline_cmpxchg_u32>:
|        b       1f
|        casal   w1, w2, [x0]
|        mov     w0, w1
|        ret
| 1:     prfm    pstl1strm, [x0]
| 2:     ldxr    w3, [x0]
|        eor     w4, w3, w1
|        cbnz    w4, 3f
|        stlxr   w4, w2, [x0]
|        cbnz    w4, 2b
|        dmb     ish
| 3:     mov     w0, w3
|        ret

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/include/asm/atomic_ll_sc.h | 27 +++++++++++++--------------
 arch/arm64/include/asm/xwreg.h        | 16 ++++++++++++++++
 2 files changed, 29 insertions(+), 14 deletions(-)
 create mode 100644 arch/arm64/include/asm/xwreg.h

diff --git a/arch/arm64/include/asm/atomic_ll_sc.h b/arch/arm64/include/asm/atomic_ll_sc.h
index 89d2ba2723590..160c1251f0ec9 100644
--- a/arch/arm64/include/asm/atomic_ll_sc.h
+++ b/arch/arm64/include/asm/atomic_ll_sc.h
@@ -11,6 +11,7 @@
 #define __ASM_ATOMIC_LL_SC_H
 
 #include <linux/stringify.h>
+#include <asm/xwreg.h>
 
 #ifndef CONFIG_CC_HAS_K_CONSTRAINT
 #define K
@@ -239,20 +240,17 @@ __ll_sc_atomic64_dec_if_positive(atomic64_t *v)
 #define __CMPXCHG_CASE(w, sfx, name, sz, mb, acq, rel, cl, constraint)	\
 static __always_inline u##sz						\
 __ll_sc__cmpxchg_case_##name##sz(volatile void *ptr,			\
-					 unsigned long old,		\
+					 u##sz old,			\
 					 u##sz new)			\
 {									\
+	/*                                                              \
+	 * Sub-word sizes require zero extension so that EOR+CBNZ won't	\
+	 * consume non-zero upper bits of the register containing "old".\
+	 */								\
+	xwreg_t(w) cmpval = xwreg_zero_extend(old, w, sz);		\
 	unsigned long tmp;						\
 	u##sz oldval;							\
 									\
-	/*								\
-	 * Sub-word sizes require explicit casting so that the compare  \
-	 * part of the cmpxchg doesn't end up interpreting non-zero	\
-	 * upper bits of the register containing "old".			\
-	 */								\
-	if (sz < 32)							\
-		old = (u##sz)old;					\
-									\
 	asm volatile(							\
 	"	prfm	pstl1strm, %[v]\n"				\
 	"1:	ld" #acq "xr" #sfx "\t%" #w "[oldval], %[v]\n"		\
@@ -264,7 +262,8 @@ __ll_sc__cmpxchg_case_##name##sz(volatile void *ptr,			\
 	"2:"								\
 	: [tmp] "=&r" (tmp), [oldval] "=&r" (oldval),			\
 	  [v] "+Q" (*(u##sz *)ptr)					\
-	: [old] __stringify(constraint) "r" (old), [new] "r" (new)	\
+	: [old] __stringify(constraint) "r" (cmpval),			\
+	  [new] "r" (new)						\
 	: cl);								\
 									\
 	return oldval;							\
@@ -278,19 +277,19 @@ __ll_sc__cmpxchg_case_##name##sz(volatile void *ptr,			\
 __CMPXCHG_CASE(w, b,     ,  8,        ,  ,  ,         , K)
 __CMPXCHG_CASE(w, h,     , 16,        ,  ,  ,         , K)
 __CMPXCHG_CASE(w,  ,     , 32,        ,  ,  ,         , K)
-__CMPXCHG_CASE( ,  ,     , 64,        ,  ,  ,         , L)
+__CMPXCHG_CASE(x,  ,     , 64,        ,  ,  ,         , L)
 __CMPXCHG_CASE(w, b, acq_,  8,        , a,  , "memory", K)
 __CMPXCHG_CASE(w, h, acq_, 16,        , a,  , "memory", K)
 __CMPXCHG_CASE(w,  , acq_, 32,        , a,  , "memory", K)
-__CMPXCHG_CASE( ,  , acq_, 64,        , a,  , "memory", L)
+__CMPXCHG_CASE(x,  , acq_, 64,        , a,  , "memory", L)
 __CMPXCHG_CASE(w, b, rel_,  8,        ,  , l, "memory", K)
 __CMPXCHG_CASE(w, h, rel_, 16,        ,  , l, "memory", K)
 __CMPXCHG_CASE(w,  , rel_, 32,        ,  , l, "memory", K)
-__CMPXCHG_CASE( ,  , rel_, 64,        ,  , l, "memory", L)
+__CMPXCHG_CASE(x,  , rel_, 64,        ,  , l, "memory", L)
 __CMPXCHG_CASE(w, b,  mb_,  8, dmb ish,  , l, "memory", K)
 __CMPXCHG_CASE(w, h,  mb_, 16, dmb ish,  , l, "memory", K)
 __CMPXCHG_CASE(w,  ,  mb_, 32, dmb ish,  , l, "memory", K)
-__CMPXCHG_CASE( ,  ,  mb_, 64, dmb ish,  , l, "memory", L)
+__CMPXCHG_CASE(x,  ,  mb_, 64, dmb ish,  , l, "memory", L)
 
 #undef __CMPXCHG_CASE
 
diff --git a/arch/arm64/include/asm/xwreg.h b/arch/arm64/include/asm/xwreg.h
new file mode 100644
index 0000000000000..d55e3ac68f7eb
--- /dev/null
+++ b/arch/arm64/include/asm/xwreg.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_XWREG_H
+#define __ASM_XWREG_H
+
+#include <asm/types.h>
+
+#define __xwreg_t_x		u64
+#define __xwreg_t_w		u32
+#define xwreg_t(xw)		__xwreg_t_##xw
+
+/*
+ * Zero extend 'v' from 'sz' bits (8/16/32/64) to fill an X or W register.
+ */
+#define xwreg_zero_extend(v, xw, sz)	((xwreg_t(xw))(u##sz)(v))
+
+#endif /* __ASM_XWREG_H */
-- 
2.30.2


