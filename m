Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73016D10371
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 02:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=TZ4RYHKWMk6te1n8wHtQDmZfYAX6NhBLOmrUfw40bIM=; b=Fx7CQjmN4SQhAkZBKkP3cqKzPL
	5J23CYxIMOOZ4EK3HbuM9Kuy0Dwd9G89+QFWZG71bHZuQ1tgrAFuLc1mI4n+5FOhtycIaEVLIBNHL
	6ahomWJsA5YDDCTb3StoBI2zEKArhEyXvjSIHmRnl9c1YTVheACRFoBzzWH3uiC7oMZNpOpb27EK8
	QjqAC/G5tNiJ+fI6qYyK6Cv0VKk1Jw1/WD3V8RMZEOBIozOdkmE5jxEMKliTNeeRcLgjFjDLqWONj
	ovelES/A/sMClz3/SwBfenX03kLFYf4cyk/Gb0G2jSrCu1ME6IfSHb1AH02N41YE3WqxzqUeXVJO9
	uUU49PyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO4zd-0000000ED4E-2E4k;
	Wed, 26 Nov 2025 02:10:53 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO4zZ-0000000ED2y-1Vwt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 02:10:52 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20251126021038epoutp039a35e4617bcc379539d5a074b397c939~7bI6dAuWn1983519835epoutp03E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 02:10:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20251126021038epoutp039a35e4617bcc379539d5a074b397c939~7bI6dAuWn1983519835epoutp03E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1764123038;
	bh=TZ4RYHKWMk6te1n8wHtQDmZfYAX6NhBLOmrUfw40bIM=;
	h=From:To:Cc:Subject:Date:References:From;
	b=rKVKRvBBvU5BY+QrBUwfEMtjnbtiABJzpELgY2BFq/gX1zwnnZpe0t3p7pS24oi80
	 57jZfTt8mx2V+hiqz6mJlYZIejTb03QKYpjwpF3qficxMvaHNvm++Xm7EUZlM72tnW
	 GYl0zFP+iTOsXkaf6haNq6pak/kBJny7mMuY8vrQ=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTPS id
	20251126021038epcas1p1c283c8fe460a1e65238782769ebc8917~7bI6G1SU50544105441epcas1p1L;
	Wed, 26 Nov 2025 02:10:38 +0000 (GMT)
Received: from epcas1p4.samsung.com (unknown [182.195.38.195]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4dGNM21jQzz2SSKZ; Wed, 26 Nov
	2025 02:10:38 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251126021037epcas1p2c5caf948ede87748ee1d4ef536a62126~7bI5OUK9C0541505415epcas1p2b;
	Wed, 26 Nov 2025 02:10:37 +0000 (GMT)
Received: from U20PB1-0362.tn.corp.samsungelectronics.net (unknown
	[10.91.131.200]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251126021037epsmtip1ffbc329e8ad9878e1e32a954ca9cdc60~7bI5LSh-Y1245212452epsmtip1a;
	Wed, 26 Nov 2025 02:10:37 +0000 (GMT)
From: Seongsu Park <sgsu.park@samsung.com>
To: will@kernel.org, peterz@infradead.org, boqun.feng@gmail.com,
	mark.rutland@arm.com, gary@garyguo.net, catalin.marinas@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Seongsu Park <sgsu.park@samsung.com>
Subject: [PATCH] arm64: atomics: lse: Remove unused parameters from
 ATOMIC_FETCH_OP_AND macros
Date: Wed, 26 Nov 2025 11:10:25 +0900
Message-Id: <20251126021025.3239562-1-sgsu.park@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251126021037epcas1p2c5caf948ede87748ee1d4ef536a62126
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-711,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251126021037epcas1p2c5caf948ede87748ee1d4ef536a62126
References: <CGME20251126021037epcas1p2c5caf948ede87748ee1d4ef536a62126@epcas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_181050_831010_C103CD00 
X-CRM114-Status: GOOD (  11.34  )
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

The ATOMIC_FETCH_OP_AND and ATOMIC64_FETCH_OP_AND macros accept 'mb' and 
'cl' parameters but never use them in their implementation. These macros 
simply delegate to the corresponding andnot functions, which handle the 
actual atomic operations and memory barriers.

Signed-off-by: Seongsu Park <sgsu.park@samsung.com>
---
 arch/arm64/include/asm/atomic_lse.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/atomic_lse.h b/arch/arm64/include/asm/atomic_lse.h
index 87f568a94e55..afad1849c4cf 100644
--- a/arch/arm64/include/asm/atomic_lse.h
+++ b/arch/arm64/include/asm/atomic_lse.h
@@ -103,17 +103,17 @@ static __always_inline void __lse_atomic_and(int i, atomic_t *v)
 	return __lse_atomic_andnot(~i, v);
 }
 
-#define ATOMIC_FETCH_OP_AND(name, mb, cl...)				\
+#define ATOMIC_FETCH_OP_AND(name)					\
 static __always_inline int						\
 __lse_atomic_fetch_and##name(int i, atomic_t *v)			\
 {									\
 	return __lse_atomic_fetch_andnot##name(~i, v);			\
 }
 
-ATOMIC_FETCH_OP_AND(_relaxed,   )
-ATOMIC_FETCH_OP_AND(_acquire,  a, "memory")
-ATOMIC_FETCH_OP_AND(_release,  l, "memory")
-ATOMIC_FETCH_OP_AND(        , al, "memory")
+ATOMIC_FETCH_OP_AND(_relaxed)
+ATOMIC_FETCH_OP_AND(_acquire)
+ATOMIC_FETCH_OP_AND(_release)
+ATOMIC_FETCH_OP_AND(        )
 
 #undef ATOMIC_FETCH_OP_AND
 
@@ -210,17 +210,17 @@ static __always_inline void __lse_atomic64_and(s64 i, atomic64_t *v)
 	return __lse_atomic64_andnot(~i, v);
 }
 
-#define ATOMIC64_FETCH_OP_AND(name, mb, cl...)				\
+#define ATOMIC64_FETCH_OP_AND(name)					\
 static __always_inline long						\
 __lse_atomic64_fetch_and##name(s64 i, atomic64_t *v)			\
 {									\
 	return __lse_atomic64_fetch_andnot##name(~i, v);		\
 }
 
-ATOMIC64_FETCH_OP_AND(_relaxed,   )
-ATOMIC64_FETCH_OP_AND(_acquire,  a, "memory")
-ATOMIC64_FETCH_OP_AND(_release,  l, "memory")
-ATOMIC64_FETCH_OP_AND(        , al, "memory")
+ATOMIC64_FETCH_OP_AND(_relaxed)
+ATOMIC64_FETCH_OP_AND(_acquire)
+ATOMIC64_FETCH_OP_AND(_release)
+ATOMIC64_FETCH_OP_AND(        )
 
 #undef ATOMIC64_FETCH_OP_AND
 
-- 
2.34.1


