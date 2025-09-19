Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED6DCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 09:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=113+0UW3aTJ7xjbchqSKfivU7UCXntP0p0iNQPyaXss=; b=iqbpWKyMSWSU6Aa+xnm0g+2C4r
	lRmGtaBeWNVL7cQ++PqQCB2HT1BjuI87X3EKZuL+m0lFNzqFSo2cckWUCYAkwgmI5RzQjXuDIPZXZ
	nmkF++kjY5lYKAQmUed0D4J0oiPHRUxeUXgEE2vVHahrxZs91owQun74AnbNB/mrxKHLBGN5d/h/P
	eWgxOllshnmV1wvTZ8IqfM6GnUkNhHMwIrRHY5bg6EcyX2zrrYSZdSV+6xOBc5rZzLv6F1aQWABwv
	n2qPH3Qqy288U4uwc8GRI6H6lg1bKokNr6l/KW8/MGkuvJB4jcgAQY71kdH3iZXIU+YKxmpQXxfAR
	W1pzVNFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXFu-00000002Lv0-2lw2;
	Fri, 19 Sep 2025 09:18:14 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXFs-00000002Lu6-1tfq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 09:18:14 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4cSn2W4lkqztTby;
	Fri, 19 Sep 2025 17:17:07 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 4B559140159;
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
Subject: [PATCH RFC 1/2] arm64: atomics: reimplement __xchg* with __lse_ll_sc_body()
Date: Fri, 19 Sep 2025 17:17:46 +0800
Message-ID: <20250919091747.3702-2-yangyicong@huawei.com>
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
X-CRM114-CacheID: sfid-20250919_021812_805099_FBA55EEA 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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

Almost all the atomic operations are implemented with __lse_ll_sc_body()
and split the LL/SC and LSE implementations to separate headers. One
exception is __xchg*, though its variant __cmpxchg128* is already using
__lse_ll_sc_body().

Reimplement __xchg* with __lse_ll_sc_body() and move the LL/SC and LSE
to their own headers, use symbolic names for operands as well. This will
make the code more organized, readable and easy for extension.

No functional changes intended. Tested with kernel's boot time
atomic64_selftest.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 arch/arm64/include/asm/atomic_ll_sc.h | 40 +++++++++++++++++
 arch/arm64/include/asm/atomic_lse.h   | 36 +++++++++++++++
 arch/arm64/include/asm/cmpxchg.h      | 63 +++++++++------------------
 3 files changed, 96 insertions(+), 43 deletions(-)

diff --git a/arch/arm64/include/asm/atomic_ll_sc.h b/arch/arm64/include/asm/atomic_ll_sc.h
index 89d2ba272359..95d91a5fd216 100644
--- a/arch/arm64/include/asm/atomic_ll_sc.h
+++ b/arch/arm64/include/asm/atomic_ll_sc.h
@@ -236,6 +236,46 @@ __ll_sc_atomic64_dec_if_positive(atomic64_t *v)
 	return result;
 }
 
+#define __XCHG_CASE(w, sfx, name, sz, mb, acq, rel, cl)			\
+static __always_inline u##sz						\
+__ll_sc__xchg_case_##name##sz(u##sz new, volatile void *ptr)		\
+{									\
+	u##sz old;							\
+	unsigned long tmp;						\
+									\
+	asm volatile(							\
+	"	prfm	pstl1strm, %[v]\n"				\
+	"1:	ld" #acq "xr" #sfx "\t%" #w "[old], %[v]\n"		\
+	"	st" #rel "xr" #sfx "\t%w[tmp], %" #w "[new], %[v]\n"	\
+	"	cbnz	%w[tmp], 1b\n"					\
+	"	" #mb							\
+	: [old] "=&r" (old), [tmp] "=&r" (tmp),				\
+	  [v] "+Q" (*(u##sz *)ptr)					\
+	: [new] "r" (new)						\
+	: cl);								\
+									\
+	return old;							\
+}
+
+__XCHG_CASE(w, b,     ,  8,        ,  ,  ,         )
+__XCHG_CASE(w, h,     , 16,        ,  ,  ,         )
+__XCHG_CASE(w,  ,     , 32,        ,  ,  ,         )
+__XCHG_CASE( ,  ,     , 64,        ,  ,  ,         )
+__XCHG_CASE(w, b, acq_,  8,        , a,  , "memory")
+__XCHG_CASE(w, h, acq_, 16,        , a,  , "memory")
+__XCHG_CASE(w,  , acq_, 32,        , a,  , "memory")
+__XCHG_CASE( ,  , acq_, 64,        , a,  , "memory")
+__XCHG_CASE(w, b, rel_,  8,        ,  , l, "memory")
+__XCHG_CASE(w, h, rel_, 16,        ,  , l, "memory")
+__XCHG_CASE(w,  , rel_, 32,        ,  , l, "memory")
+__XCHG_CASE( ,  , rel_, 64,        ,  , l, "memory")
+__XCHG_CASE(w, b,  mb_,  8, dmb ish,  , l, "memory")
+__XCHG_CASE(w, h,  mb_, 16, dmb ish,  , l, "memory")
+__XCHG_CASE(w,  ,  mb_, 32, dmb ish,  , l, "memory")
+__XCHG_CASE( ,  ,  mb_, 64, dmb ish,  , l, "memory")
+
+#undef __XCHG_CASE
+
 #define __CMPXCHG_CASE(w, sfx, name, sz, mb, acq, rel, cl, constraint)	\
 static __always_inline u##sz						\
 __ll_sc__cmpxchg_case_##name##sz(volatile void *ptr,			\
diff --git a/arch/arm64/include/asm/atomic_lse.h b/arch/arm64/include/asm/atomic_lse.h
index 87f568a94e55..cb38c2120595 100644
--- a/arch/arm64/include/asm/atomic_lse.h
+++ b/arch/arm64/include/asm/atomic_lse.h
@@ -245,6 +245,42 @@ static __always_inline s64 __lse_atomic64_dec_if_positive(atomic64_t *v)
 	return (long)v;
 }
 
+#define __XCHG_CASE(w, sfx, name, sz, mb, cl...)			\
+static __always_inline u##sz						\
+__lse__xchg_case_##name##sz(u##sz new, volatile void *ptr)		\
+{									\
+	u##sz old;							\
+									\
+	asm volatile(							\
+	__LSE_PREAMBLE							\
+	"	swp" #mb #sfx "\t%" #w "[new], %" #w "[old], %[v]\n"	\
+	: [old] "=r" (old),						\
+	  [v] "+Q" (*(u##sz *)ptr)					\
+	: [new] "r" (new)						\
+	: cl);								\
+									\
+	return old;							\
+}
+
+__XCHG_CASE(w, b,     ,  8,   )
+__XCHG_CASE(w, h,     , 16,   )
+__XCHG_CASE(w,  ,     , 32,   )
+__XCHG_CASE(x,  ,     , 64,   )
+__XCHG_CASE(w, b, acq_,  8,  a, "memory")
+__XCHG_CASE(w, h, acq_, 16,  a, "memory")
+__XCHG_CASE(w,  , acq_, 32,  a, "memory")
+__XCHG_CASE(x,  , acq_, 64,  a, "memory")
+__XCHG_CASE(w, b, rel_,  8,  l, "memory")
+__XCHG_CASE(w, h, rel_, 16,  l, "memory")
+__XCHG_CASE(w,  , rel_, 32,  l, "memory")
+__XCHG_CASE(x,  , rel_, 64,  l, "memory")
+__XCHG_CASE(w, b,  mb_,  8, al, "memory")
+__XCHG_CASE(w, h,  mb_, 16, al, "memory")
+__XCHG_CASE(w,  ,  mb_, 32, al, "memory")
+__XCHG_CASE(x,  ,  mb_, 64, al, "memory")
+
+#undef __XCHG_CASE
+
 #define __CMPXCHG_CASE(w, sfx, name, sz, mb, cl...)			\
 static __always_inline u##sz						\
 __lse__cmpxchg_case_##name##sz(volatile void *ptr,			\
diff --git a/arch/arm64/include/asm/cmpxchg.h b/arch/arm64/include/asm/cmpxchg.h
index d7a540736741..14cb05cf13cb 100644
--- a/arch/arm64/include/asm/cmpxchg.h
+++ b/arch/arm64/include/asm/cmpxchg.h
@@ -13,51 +13,28 @@
 #include <asm/barrier.h>
 #include <asm/lse.h>
 
-/*
- * We need separate acquire parameters for ll/sc and lse, since the full
- * barrier case is generated as release+dmb for the former and
- * acquire+release for the latter.
- */
-#define __XCHG_CASE(w, sfx, name, sz, mb, nop_lse, acq, acq_lse, rel, cl)	\
-static inline u##sz __xchg_case_##name##sz(u##sz x, volatile void *ptr)		\
-{										\
-	u##sz ret;								\
-	unsigned long tmp;							\
-										\
-	asm volatile(ARM64_LSE_ATOMIC_INSN(					\
-	/* LL/SC */								\
-	"	prfm	pstl1strm, %2\n"					\
-	"1:	ld" #acq "xr" #sfx "\t%" #w "0, %2\n"				\
-	"	st" #rel "xr" #sfx "\t%w1, %" #w "3, %2\n"			\
-	"	cbnz	%w1, 1b\n"						\
-	"	" #mb,								\
-	/* LSE atomics */							\
-	"	swp" #acq_lse #rel #sfx "\t%" #w "3, %" #w "0, %2\n"		\
-		__nops(3)							\
-	"	" #nop_lse)							\
-	: "=&r" (ret), "=&r" (tmp), "+Q" (*(u##sz *)ptr)			\
-	: "r" (x)								\
-	: cl);									\
-										\
-	return ret;								\
+#define __XCHG_CASE(name, sz)						\
+static inline u##sz __xchg_case_##name##sz(u##sz x, volatile void *ptr)	\
+{									\
+	return __lse_ll_sc_body(_xchg_case_##name##sz, x, ptr);		\
 }
 
-__XCHG_CASE(w, b,     ,  8,        ,    ,  ,  ,  ,         )
-__XCHG_CASE(w, h,     , 16,        ,    ,  ,  ,  ,         )
-__XCHG_CASE(w,  ,     , 32,        ,    ,  ,  ,  ,         )
-__XCHG_CASE( ,  ,     , 64,        ,    ,  ,  ,  ,         )
-__XCHG_CASE(w, b, acq_,  8,        ,    , a, a,  , "memory")
-__XCHG_CASE(w, h, acq_, 16,        ,    , a, a,  , "memory")
-__XCHG_CASE(w,  , acq_, 32,        ,    , a, a,  , "memory")
-__XCHG_CASE( ,  , acq_, 64,        ,    , a, a,  , "memory")
-__XCHG_CASE(w, b, rel_,  8,        ,    ,  ,  , l, "memory")
-__XCHG_CASE(w, h, rel_, 16,        ,    ,  ,  , l, "memory")
-__XCHG_CASE(w,  , rel_, 32,        ,    ,  ,  , l, "memory")
-__XCHG_CASE( ,  , rel_, 64,        ,    ,  ,  , l, "memory")
-__XCHG_CASE(w, b,  mb_,  8, dmb ish, nop,  , a, l, "memory")
-__XCHG_CASE(w, h,  mb_, 16, dmb ish, nop,  , a, l, "memory")
-__XCHG_CASE(w,  ,  mb_, 32, dmb ish, nop,  , a, l, "memory")
-__XCHG_CASE( ,  ,  mb_, 64, dmb ish, nop,  , a, l, "memory")
+__XCHG_CASE(    ,  8)
+__XCHG_CASE(    , 16)
+__XCHG_CASE(    , 32)
+__XCHG_CASE(    , 64)
+__XCHG_CASE(acq_,  8)
+__XCHG_CASE(acq_, 16)
+__XCHG_CASE(acq_, 32)
+__XCHG_CASE(acq_, 64)
+__XCHG_CASE(rel_,  8)
+__XCHG_CASE(rel_, 16)
+__XCHG_CASE(rel_, 32)
+__XCHG_CASE(rel_, 64)
+__XCHG_CASE(mb_,  8)
+__XCHG_CASE(mb_, 16)
+__XCHG_CASE(mb_, 32)
+__XCHG_CASE(mb_, 64)
 
 #undef __XCHG_CASE
 
-- 
2.24.0


