Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32320CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 18:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLjmOO9Imra/tK5RPFIsLXDdpmNXUJwWiKD0++d4PGI=; b=NcmISqftp2h6CPX1fLZU/frn/7
	xumrqlXr1ClZuzs1G5BVfzgYCT/yxEFkeKw2C/DalEUcDmEQToG+K8zPUHhXyEDi2eND69ZRDKfxS
	mPAivQrNmNG4X+5uvIca6ew8NlIhUxpBh60GZnU9DwBM3fRrZnw6rKfmhyXktR1LooOpR/u7C6vSM
	m7uicNDPhGvY1iitmIag602zIbJ5Rd4Ip/YPk7DZZOCle+p9YgKd7fF5NT7Ua+mvW/28R2YrcpZow
	OZNxVlzoCrQU13+G2isOSYPia4LxU8xUJyKwxbNLWA3vKWz9XxIWU9AQmWPHTIxUM2LUIHSFCrfmr
	D6o3SHbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Nf4-0000000Az60-07Np;
	Thu, 02 Oct 2025 18:04:14 +0000
Received: from fra-out-003.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([3.72.182.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Nf1-0000000Az3k-1ZCP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 18:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1759428251; x=1790964251;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eLjmOO9Imra/tK5RPFIsLXDdpmNXUJwWiKD0++d4PGI=;
  b=HahsvoNPFZLhkYZxlJtcxY1Po9EgLQaNCC6ZuED+MOtjmBJtt/XSfliw
   w4L/JIDvWeMyHhALZu6LW55A66lzPeWWUL5NG84gvITxRJVqpysD2uVpg
   iZu/rv4YchY6CdS4RvDs84RlQWsdweo81EnKs1WNEv3YloeqN751wuhcj
   QfYJ3qFnp70nzmUF7cjmBrxJBEcV8oVFfTgmXziB+U5VMO7iNiejQyQOj
   c8dmdYtVF0/xiEX67QDsySVSxPigxGCn/1TihDAkEywhE99Ik96aufKgB
   cUmUsCwnycsq53u3KeTUDivT7dCrcPKV2IdfxHKoA91Y9nPa1wdYXfq4q
   w==;
X-CSE-ConnectionGUID: vNx6RvxpQJ61hTjIiHjHmg==
X-CSE-MsgGUID: lmj+3ElrTLqd85N4gv8UQQ==
X-IronPort-AV: E=Sophos;i="6.18,310,1751241600"; 
   d="scan'208";a="3025749"
Received: from ip-10-6-3-216.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.3.216])
  by internal-fra-out-003.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 18:04:01 +0000
Received: from EX19MTAEUB002.ant.amazon.com [54.240.197.224:12150]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.3.52:2525] with esmtp (Farcaster)
 id c0d02434-d1a7-44a1-9ae4-1bdce494e9c2; Thu, 2 Oct 2025 18:04:00 +0000 (UTC)
X-Farcaster-Flow-ID: c0d02434-d1a7-44a1-9ae4-1bdce494e9c2
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19MTAEUB002.ant.amazon.com (10.252.51.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Thu, 2 Oct 2025 18:03:58 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D018EUA004.ant.amazon.com (10.252.50.85) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20; Thu, 2 Oct 2025
 18:03:45 +0000
From: Eliav Farber <farbere@amazon.com>
To: <gregkh@linuxfoundation.org>, <kenneth.feng@amd.com>,
	<alexander.deucher@amd.com>, <christian.koenig@amd.com>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <linus.walleij@linaro.org>, <dmitry.torokhov@gmail.com>,
	<tglx@linutronix.de>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
	<samuel@sholland.org>, <agk@redhat.com>, <snitzer@kernel.org>,
	<mpatocka@redhat.com>, <clm@fb.com>, <dsterba@suse.com>,
	<luc.vanoostenryck@gmail.com>, <pmladek@suse.com>, <rostedt@goodmis.org>,
	<andriy.shevchenko@linux.intel.com>, <linux@rasmusvillemoes.dk>,
	<senozhatsky@chromium.org>, <akpm@linux-foundation.org>,
	<lijo.lazar@amd.com>, <asad.kamal@amd.com>, <kevinyang.wang@amd.com>,
	<David.Laight@ACULAB.COM>, <amd-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
	<linux-input@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <dm-devel@lists.linux.dev>,
	<linux-btrfs@vger.kernel.org>, <linux-sparse@vger.kernel.org>,
	<stable@vger.kernel.org>, <farbere@amazon.com>
CC: Arnd Bergmann <arnd@kernel.org>, Christoph Hellwig <hch@infradead.org>,
	Dan Carpenter <dan.carpenter@linaro.org>, "Jason A. Donenfeld"
	<Jason@zx2c4.com>, Jens Axboe <axboe@kernel.dk>, Lorenzo Stoakes
	<lorenzo.stoakes@oracle.com>, Mateusz Guzik <mjguzik@gmail.com>, "Matthew
 Wilcox" <willy@infradead.org>, Pedro Falcato <pedro.falcato@gmail.com>
Subject: [PATCH v3 09/11 6.1.y] minmax.h: move all the clamp() definitions after the min/max() ones
Date: Thu, 2 Oct 2025 18:00:27 +0000
Message-ID: <20251002180036.33738-10-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251002180036.33738-1-farbere@amazon.com>
References: <20251002180036.33738-1-farbere@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.116.181]
X-ClientProxiedBy: EX19D040UWA001.ant.amazon.com (10.13.139.22) To
 EX19D018EUA004.ant.amazon.com (10.252.50.85)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_110411_712288_851A768B 
X-CRM114-Status: GOOD (  18.77  )
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

From: David Laight <David.Laight@ACULAB.COM>

[ Upstream commit c3939872ee4a6b8bdcd0e813c66823b31e6e26f7 ]

At some point the definitions for clamp() got added in the middle of the
ones for min() and max().  Re-order the definitions so they are more
sensibly grouped.

Link: https://lkml.kernel.org/r/8bb285818e4846469121c8abc3dfb6e2@AcuMS.aculab.com
Signed-off-by: David Laight <david.laight@aculab.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jason A. Donenfeld <Jason@zx2c4.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Pedro Falcato <pedro.falcato@gmail.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 include/linux/minmax.h | 109 +++++++++++++++++++----------------------
 1 file changed, 51 insertions(+), 58 deletions(-)

diff --git a/include/linux/minmax.h b/include/linux/minmax.h
index 91aa1b90c1bb..75fb7a6ad4c6 100644
--- a/include/linux/minmax.h
+++ b/include/linux/minmax.h
@@ -99,22 +99,6 @@
 #define __careful_cmp(op, x, y) \
 	__careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
 
-#define __clamp(val, lo, hi)	\
-	((val) >= (hi) ? (hi) : ((val) <= (lo) ? (lo) : (val)))
-
-#define __clamp_once(val, lo, hi, uval, ulo, uhi) ({				\
-	__auto_type uval = (val);						\
-	__auto_type ulo = (lo);							\
-	__auto_type uhi = (hi);							\
-	BUILD_BUG_ON_MSG(statically_true(ulo > uhi),				\
-		"clamp() low limit " #lo " greater than high limit " #hi);	\
-	BUILD_BUG_ON_MSG(!__types_ok3(uval, ulo, uhi),				\
-		"clamp("#val", "#lo", "#hi") signedness error");		\
-	__clamp(uval, ulo, uhi); })
-
-#define __careful_clamp(val, lo, hi) \
-	__clamp_once(val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
-
 /**
  * min - return minimum of two values of the same or compatible types
  * @x: first value
@@ -170,6 +154,22 @@
 #define max3(x, y, z) \
 	__careful_op3(max, x, y, z, __UNIQUE_ID(x_), __UNIQUE_ID(y_), __UNIQUE_ID(z_))
 
+/**
+ * min_t - return minimum of two values, using the specified type
+ * @type: data type to use
+ * @x: first value
+ * @y: second value
+ */
+#define min_t(type, x, y) __cmp_once(min, type, x, y)
+
+/**
+ * max_t - return maximum of two values, using the specified type
+ * @type: data type to use
+ * @x: first value
+ * @y: second value
+ */
+#define max_t(type, x, y) __cmp_once(max, type, x, y)
+
 /**
  * min_not_zero - return the minimum that is _not_ zero, unless both are zero
  * @x: value1
@@ -180,6 +180,22 @@
 	typeof(y) __y = (y);			\
 	__x == 0 ? __y : ((__y == 0) ? __x : min(__x, __y)); })
 
+#define __clamp(val, lo, hi)	\
+	((val) >= (hi) ? (hi) : ((val) <= (lo) ? (lo) : (val)))
+
+#define __clamp_once(val, lo, hi, uval, ulo, uhi) ({				\
+	__auto_type uval = (val);						\
+	__auto_type ulo = (lo);							\
+	__auto_type uhi = (hi);							\
+	BUILD_BUG_ON_MSG(statically_true(ulo > uhi),				\
+		"clamp() low limit " #lo " greater than high limit " #hi);	\
+	BUILD_BUG_ON_MSG(!__types_ok3(uval, ulo, uhi),				\
+		"clamp("#val", "#lo", "#hi") signedness error");		\
+	__clamp(uval, ulo, uhi); })
+
+#define __careful_clamp(val, lo, hi) \
+	__clamp_once(val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
+
 /**
  * clamp - return a value clamped to a given range with strict typechecking
  * @val: current value
@@ -191,28 +207,30 @@
  */
 #define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
 
-/*
- * ..and if you can't take the strict
- * types, you can specify one yourself.
- *
- * Or not use min/max/clamp at all, of course.
- */
-
 /**
- * min_t - return minimum of two values, using the specified type
- * @type: data type to use
- * @x: first value
- * @y: second value
+ * clamp_t - return a value clamped to a given range using a given type
+ * @type: the type of variable to use
+ * @val: current value
+ * @lo: minimum allowable value
+ * @hi: maximum allowable value
+ *
+ * This macro does no typechecking and uses temporary variables of type
+ * @type to make all the comparisons.
  */
-#define min_t(type, x, y) __cmp_once(min, type, x, y)
+#define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo), (type)(hi))
 
 /**
- * max_t - return maximum of two values, using the specified type
- * @type: data type to use
- * @x: first value
- * @y: second value
+ * clamp_val - return a value clamped to a given range using val's type
+ * @val: current value
+ * @lo: minimum allowable value
+ * @hi: maximum allowable value
+ *
+ * This macro does no typechecking and uses temporary variables of whatever
+ * type the input argument @val is.  This is useful when @val is an unsigned
+ * type and @lo and @hi are literals that will otherwise be assigned a signed
+ * integer type.
  */
-#define max_t(type, x, y) __cmp_once(max, type, x, y)
+#define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
 
 /*
  * Do not check the array parameter using __must_be_array().
@@ -257,31 +275,6 @@
  */
 #define max_array(array, len) __minmax_array(max, array, len)
 
-/**
- * clamp_t - return a value clamped to a given range using a given type
- * @type: the type of variable to use
- * @val: current value
- * @lo: minimum allowable value
- * @hi: maximum allowable value
- *
- * This macro does no typechecking and uses temporary variables of type
- * @type to make all the comparisons.
- */
-#define clamp_t(type, val, lo, hi) __careful_clamp((type)(val), (type)(lo), (type)(hi))
-
-/**
- * clamp_val - return a value clamped to a given range using val's type
- * @val: current value
- * @lo: minimum allowable value
- * @hi: maximum allowable value
- *
- * This macro does no typechecking and uses temporary variables of whatever
- * type the input argument @val is.  This is useful when @val is an unsigned
- * type and @lo and @hi are literals that will otherwise be assigned a signed
- * integer type.
- */
-#define clamp_val(val, lo, hi) clamp_t(typeof(val), val, lo, hi)
-
 static inline bool in_range64(u64 val, u64 start, u64 len)
 {
 	return (val - start) < len;
-- 
2.47.3


