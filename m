Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091A1C5516E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 18:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNanfJS2VAokGlGAjWn3IsZqHmLvq5n2BcQ0vWSl7Jc=; b=pZ6Md3Fs/PaBnLDVjI7+IcqyI9
	R6fezZ0XV1NfxHfwSwf600eYNth9DW8P9LMy19Ss6sh+tHRLvC7YhxphudT9PH7/zbcFClwCf+/7/
	+1u1duAE/c17t7qMLoE6cpRMndiUKsATY5mLqJNeMDY5QmkAmPLg7nS++c+ywZGLGEl0/DjEmhQeG
	DnAd75knINIuwwoVscqkb9kPM2EyWhs4JfCg/v3LPGFRIBZYW5T55+vzg9H2hqkDXs04E3c9tpbZx
	JOtedgWpMyWNVaMkkWTzjqbm7l+Dp8cbI73KLjSPHdp0W3qgg3te0DMamwy4uvdVON78d+aO61AZd
	zA1YvBtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpVFf-0000000B8UN-1kMn;
	Thu, 30 Jul 2026 18:13:03 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpVFX-0000000B8Qb-24d5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 18:12:56 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c999f162c9aso52833a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 11:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785435174; x=1786039974; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cNanfJS2VAokGlGAjWn3IsZqHmLvq5n2BcQ0vWSl7Jc=;
        b=gWJtWPdJ0a0EOXKE4+gr9ny9GSuk0+R6jctPSDnRRBm+JCL546L725WVLCaCEhwEYt
         ttq6P7OeoMhGgCs1d/gozk/ukg6dyxoQgDK+vNQuUQr99VBVuejZ85uvCNDIxImmR+DW
         ig8ZMAaota1SiJMlPMfgruVFSgHx0kD8kdWigccrbP8VJE5gaxZLFV6iY5W5nkDHwRv0
         yiQlCDXOK6L2HTf5xiGkyrUMkRQqBSBBbJl3W/rR5B26Bfqo8Qw7RLMtoVn43Hw7I3bd
         f4BIEvK5XbBZRMmSl8aa45Siafs0RCv1B2KFxPzd7XaI18jZhP0OHQfk/8/LzXI5ypsF
         GWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785435174; x=1786039974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cNanfJS2VAokGlGAjWn3IsZqHmLvq5n2BcQ0vWSl7Jc=;
        b=srachwYXTlhLzR4xjNUZOGzamqMGKOYQpqqzDPPLBvADDP7ijoTl+qkdzmsa4ThntA
         JmxfYQPnq8U0+mSQ0eHMawfDXbpG/HJ6PeDjvjvu0v6TWNcvLIHtrKv3K6UMDRUCjFYF
         wOrrj0aNmguWLNRZclt09PaTUWYMALL2AHRIuAXzBM8iDwvfmomHyW0XOYhjpFx/NHFU
         grwyM5w7I7QeBuoUw5aOSP9nrDLy0zjxvkKJ7kF1+vrnGx876kmA7C34v8s5SrfaICtX
         b/6FUghtkHy8QuDqPMGmqWQm4S9qByQ2nzt0IlGpIjk4TCnfP2AwZsqTS0Ij33FmgvYL
         a7LA==
X-Forwarded-Encrypted: i=1; AHgh+RoTMriIFAtFBkfKkgCL9KXYgBz4wQ1C5EWztWss/H/l0vKtLCVI5t1ZGo5V9L0ofZGiqCPmQo+Te+haxgBXF7ve@lists.infradead.org
X-Gm-Message-State: AOJu0YyK2SubKJKljfJPiZBhD40zsJF94QGqJyJiZ0P61EtbxwhFiXGX
	3AjrvrdytNMNxex8gZh6lQtOpgSpjQfZepeh9mzN8FLuUXWX5Qjpd9yV
X-Gm-Gg: AR+sD12FyXvpHsMn0b4jwCeq+qU7XzgsTsV3qB814MC4URRKvgNurlAbZjpwCdX4l5X
	BwnzxbP/MmBEj2vDbOracLmq9+zEhVfZHZ7skJgV3yY/IK0Y2Mm+CMfirK4jCMoVFtBRH63kmYm
	wO/n398vY1Xj8yzj5mN+rp4U2EELk/SxpAfePg/epu1d58GiVfRHkXbv+vWsQjBVNtw6HayGNsr
	S1Yzzow+4LA8KiykhW1Yo6mqRU/7qGhHP9+oNY72CndAhA1wlEeYgVTy/VWX4taJ7tiNzYK75QZ
	kLdxf6JF6Hjf0XRUkQtmQSwgyykaeD7DoPdEA/fB/zX6AwenPpVhcthkFkE+46d8VY4gRHqXmFt
	3WKNbjssE6KWOC8GhY9tIxGZ9oqcvlqxBc3ioLSqEzMlh+GxEL8gGopYmOz+Zk6MUyP2o1x2aWM
	a2PL8qYQFQ4cN/up6cDBqrq0Sqryhe2Va1j/ET2MUeAeztvAY2UKwr0JRu9eLUXR9O4RzgLv5oo
	G5ntaqbyyELISuV+7nTXha1mktZHU7yteM4UTsTDPxK0P2smH4ia3krMR53uC8jYU3i0CPnIX4=
X-Received: by 2002:a05:6a21:6b8c:b0:3c6:82ab:ed81 with SMTP id adf61e73a8af0-3c90d5d1e91mr1200355637.48.1785435174529;
        Thu, 30 Jul 2026 11:12:54 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (131.197.81.34.bc.googleusercontent.com. [34.81.197.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b124e4sm21998197eec.6.2026.07.30.11.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 11:12:54 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: will@kernel.org,
	joro@8bytes.org,
	akpm@linux-foundation.org
Cc: robin.murphy@arm.com,
	nicolinc@nvidia.com,
	cychu@google.com,
	hhchung@google.com,
	amitamishra@google.com,
	marscheng@google.com,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 2/2] Revert "lib/sort.c: add _nonatomic() variants with cond_resched()"
Date: Thu, 30 Jul 2026 18:12:16 +0000
Message-ID: <20260730181216.2709088-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
In-Reply-To: <20260730181216.2709088-1-visitorckw@gmail.com>
References: <20260730181216.2709088-1-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_111255_548610_6E12E91C 
X-CRM114-Status: GOOD (  20.36  )
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

This reverts commit e2a33a2a3258794891cdd6ca4b1318da6594d157.

After replacing the only in-tree user of sort_nonatomic() in the
arm-smmu-v3 driver with the standard sort(), the _nonatomic() variants
are no longer used anywhere in the kernel.

Remove sort_nonatomic() and sort_r_nonatomic() to clean up dead code.
This effectively drops the wrapper function __sort_r() and eliminates
the may_schedule branch and cond_resched() call from the inner loop of
the core sorting routine, slightly simplifying and optimizing the code.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 include/linux/sort.h |  11 -----
 lib/sort.c           | 110 ++++++++++++-------------------------------
 2 files changed, 31 insertions(+), 90 deletions(-)

diff --git a/include/linux/sort.h b/include/linux/sort.h
index c01ef804a0eb..871775978af0 100644
--- a/include/linux/sort.h
+++ b/include/linux/sort.h
@@ -23,15 +23,4 @@ void sort(void *base, size_t num, size_t size,
 	  cmp_func_t cmp_func,
 	  swap_func_t swap_func);
 
-/* Versions that periodically call cond_resched(): */
-
-void sort_r_nonatomic(void *base, size_t num, size_t size,
-		      cmp_r_func_t cmp_func,
-		      swap_r_func_t swap_func,
-		      const void *priv);
-
-void sort_nonatomic(void *base, size_t num, size_t size,
-		    cmp_func_t cmp_func,
-		    swap_func_t swap_func);
-
 #endif
diff --git a/lib/sort.c b/lib/sort.c
index 52363995ccc5..8e73dc55476b 100644
--- a/lib/sort.c
+++ b/lib/sort.c
@@ -186,13 +186,36 @@ static size_t parent(size_t i, unsigned int lsbit, size_t size)
 	return i / 2;
 }
 
-#include <linux/sched.h>
-
-static void __sort_r(void *base, size_t num, size_t size,
-		     cmp_r_func_t cmp_func,
-		     swap_r_func_t swap_func,
-		     const void *priv,
-		     bool may_schedule)
+/**
+ * sort_r - sort an array of elements
+ * @base: pointer to data to sort
+ * @num: number of elements
+ * @size: size of each element
+ * @cmp_func: pointer to comparison function
+ * @swap_func: pointer to swap function or NULL
+ * @priv: third argument passed to comparison function
+ *
+ * This function does a heapsort on the given array.  You may provide
+ * a swap_func function if you need to do something more than a memory
+ * copy (e.g. fix up pointers or auxiliary data), but the built-in swap
+ * avoids a slow retpoline and so is significantly faster.
+ *
+ * The comparison function must adhere to specific mathematical
+ * properties to ensure correct and stable sorting:
+ * - Antisymmetry: cmp_func(a, b) must return the opposite sign of
+ * cmp_func(b, a).
+ * - Transitivity: if cmp_func(a, b) <= 0 and cmp_func(b, c) <= 0, then
+ * cmp_func(a, c) <= 0.
+ *
+ * Sorting time is O(n log n) both on average and worst-case. While
+ * quicksort is slightly faster on average, it suffers from exploitable
+ * O(n*n) worst-case behavior and extra memory requirements that make
+ * it less suitable for kernel use.
+ */
+void sort_r(void *base, size_t num, size_t size,
+	    cmp_r_func_t cmp_func,
+	    swap_r_func_t swap_func,
+	    const void *priv)
 {
 	/* pre-scale counters for performance */
 	size_t n = num * size, a = (num/2) * size;
@@ -263,9 +286,6 @@ static void __sort_r(void *base, size_t num, size_t size,
 			b = parent(b, lsbit, size);
 			do_swap(base + b, base + c, size, swap_func, priv);
 		}
-
-		if (may_schedule)
-			cond_resched();
 	}
 
 	n -= size;
@@ -273,63 +293,8 @@ static void __sort_r(void *base, size_t num, size_t size,
 	if (n == size * 2 && do_cmp(base, base + size, cmp_func, priv) > 0)
 		do_swap(base, base + size, size, swap_func, priv);
 }
-
-/**
- * sort_r - sort an array of elements
- * @base: pointer to data to sort
- * @num: number of elements
- * @size: size of each element
- * @cmp_func: pointer to comparison function
- * @swap_func: pointer to swap function or NULL
- * @priv: third argument passed to comparison function
- *
- * This function does a heapsort on the given array.  You may provide
- * a swap_func function if you need to do something more than a memory
- * copy (e.g. fix up pointers or auxiliary data), but the built-in swap
- * avoids a slow retpoline and so is significantly faster.
- *
- * The comparison function must adhere to specific mathematical
- * properties to ensure correct and stable sorting:
- * - Antisymmetry: cmp_func(a, b) must return the opposite sign of
- * cmp_func(b, a).
- * - Transitivity: if cmp_func(a, b) <= 0 and cmp_func(b, c) <= 0, then
- * cmp_func(a, c) <= 0.
- *
- * Sorting time is O(n log n) both on average and worst-case. While
- * quicksort is slightly faster on average, it suffers from exploitable
- * O(n*n) worst-case behavior and extra memory requirements that make
- * it less suitable for kernel use.
- */
-void sort_r(void *base, size_t num, size_t size,
-	    cmp_r_func_t cmp_func,
-	    swap_r_func_t swap_func,
-	    const void *priv)
-{
-	__sort_r(base, num, size, cmp_func, swap_func, priv, false);
-}
 EXPORT_SYMBOL(sort_r);
 
-/**
- * sort_r_nonatomic - sort an array of elements, with cond_resched
- * @base: pointer to data to sort
- * @num: number of elements
- * @size: size of each element
- * @cmp_func: pointer to comparison function
- * @swap_func: pointer to swap function or NULL
- * @priv: third argument passed to comparison function
- *
- * Same as sort_r, but preferred for larger arrays as it does a periodic
- * cond_resched().
- */
-void sort_r_nonatomic(void *base, size_t num, size_t size,
-		      cmp_r_func_t cmp_func,
-		      swap_r_func_t swap_func,
-		      const void *priv)
-{
-	__sort_r(base, num, size, cmp_func, swap_func, priv, true);
-}
-EXPORT_SYMBOL(sort_r_nonatomic);
-
 void sort(void *base, size_t num, size_t size,
 	  cmp_func_t cmp_func,
 	  swap_func_t swap_func)
@@ -339,19 +304,6 @@ void sort(void *base, size_t num, size_t size,
 		.swap = swap_func,
 	};
 
-	return __sort_r(base, num, size, _CMP_WRAPPER, SWAP_WRAPPER, &w, false);
+	return sort_r(base, num, size, _CMP_WRAPPER, SWAP_WRAPPER, &w);
 }
 EXPORT_SYMBOL(sort);
-
-void sort_nonatomic(void *base, size_t num, size_t size,
-		    cmp_func_t cmp_func,
-		    swap_func_t swap_func)
-{
-	struct wrapper w = {
-		.cmp  = cmp_func,
-		.swap = swap_func,
-	};
-
-	return __sort_r(base, num, size, _CMP_WRAPPER, SWAP_WRAPPER, &w, true);
-}
-EXPORT_SYMBOL(sort_nonatomic);
-- 
2.55.0.508.g3f0d502094-goog


