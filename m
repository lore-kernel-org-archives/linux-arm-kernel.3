Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD827CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 11:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5dcUNwqX13oJt9eTUWl4hxYV0M/Izj9HMawndI9ohc=; b=EEdMOVWOA/XpGST1BZ8FY8KgW5
	2EsKa4pYZasUM4FY9jYybHqYj9gFsy+V9Wk3qCYqEyt8pQPhOaocHRMXm7KwMmBHVfZ0+GyFX0RMG
	WeQpLeQes+cUnizz5VaGuE0mAz5tN0XAT7W1/LpBi5+NifBv7h8/cKp1DshnW0VbGw4BOhqDHhuBu
	i1bkTEd5Z/bKhnUa0ytF8prfLmMJJAHsz0NX6QtkpxkmlyHN1cVYBdni/E0CVGqGTya0Ss/gO/OtO
	wFE4JkdjPAKIPnKmg+htqqvV0UMc3U73AOnGF+qt+aczo9qEiS5wskmF/G67RpB4SjdWnCWs0x/LL
	csAvlhOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwcQ-0000000FWxZ-0fsc;
	Mon, 18 May 2026 11:58:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwcN-0000000FWvo-1giY
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 11:58:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=W5dcUNwqX13oJt9eTUWl4hxYV0M/Izj9HMawndI9ohc=; b=Sj0DLZx1TFNtXevQR1zdC/bsbb
	vjXoiGi1ZgpMtPaGNMRa9txyChVZGFw3moONRa06KVlek7EecVovJJbSW8OytT0RbXu5gx18+O1qg
	VB7KTuS9U4KasiuOQceCUsAK+vimR/dm0aD1RtyhX6/m32fVAKqjecOPTf6yDRmvH9znGYbCEmKYs
	ArwZRJPfrbWLJ8xtAxPhwlcbmvso6RbpfdjD07OfFMMkPneIKo+GR6u0yFiiaGTdHAZs1qt+CaLrl
	iRz/cM+vXyYI20p/Lx58sUKb+83JknenmAbgvR8p6ctwma5H5o6GPEoMEffgIay/DqaL34UiXmZTb
	XXwS5CwA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwcJ-0000000B2JM-4AZk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 11:58:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1A5B4617;
	Mon, 18 May 2026 04:58:32 -0700 (PDT)
Received: from e134710.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3F703F85F;
	Mon, 18 May 2026 04:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779105518; bh=lFx22FK8BwhqLRtXVDa7n9zPnHQJet90r0IFTaX1i1s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XK4nRpA8S3v+L9YccG5DJAAOi8Zx0AvlNIF4npTvFjqg0+WFnuopmK0sJ52zJoPap
	 yvK8P1xEySgfnrJ3v7z6dyGJX2G8CE80PTn/cm2BiLNdQMY7Z9oefyMZelyf8irkVc
	 afyirj9Zw8QmbN8joH6K/Y2+pA5urG+Pax7y6KnE=
From: Ahmed Tiba <ahmed.tiba@arm.com>
Date: Mon, 18 May 2026 12:57:47 +0100
Subject: [PATCH v4 04/10] ACPI: APEI: GHES: move estatus cache helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-topics-ahmtib01-ras_ffh_arm_internal_review-v4-4-42698675ba61@arm.com>
References: <20260518-topics-ahmtib01-ras_ffh_arm_internal_review-v4-0-42698675ba61@arm.com>
In-Reply-To: <20260518-topics-ahmtib01-ras_ffh_arm_internal_review-v4-0-42698675ba61@arm.com>
To: rafael@kernel.org, bp@alien8.de, saket.dumbre@intel.com, 
 will@kernel.org, xueshuai@linux.alibaba.com, mchehab@kernel.org, 
 krzk+dt@kernel.org, dave@stgolabs.net, conor+dt@kernel.org, 
 vishal.l.verma@intel.com, jic23@kernel.org, corbet@lwn.net, 
 guohanjun@huawei.com, dave.jiang@intel.com, catalin.marinas@arm.com, 
 lenb@kernel.org, tony.luck@intel.com, skhan@linuxfoundation.org, 
 djbw@kernel.org, alison.schofield@intel.com, ira.weiny@intel.com, 
 robh@kernel.org
Cc: Ahmed Tiba <ahmed.tiba@arm.com>, devicetree@vger.kernel.org, 
 linux-acpi@vger.kernel.org, linux-doc@vger.kernel.org, 
 Dmitry.Lamerov@arm.com, linux-cxl@vger.kernel.org, Michael.Zhao2@arm.com, 
 acpica-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779105490; l=11290;
 i=ahmed.tiba@arm.com; s=20260219; h=from:subject:message-id;
 bh=lFx22FK8BwhqLRtXVDa7n9zPnHQJet90r0IFTaX1i1s=;
 b=p+L5vphRyYdouYSzoH/XVFh+X2bOsDHEwLzZA4wo49gzIKKN33G7w0EO1iMy5zwxcOJYCuiFU
 TLnJep9kBQFDPVWYiEcgRHQtM1+FIDxICRXqCcVe83HlZAmP4IEXmtR
X-Developer-Key: i=ahmed.tiba@arm.com; a=ed25519;
 pk=xVOtd+Qklh/4tuM3tB+BEZD4jj5a6W59C3KCNX6v7OE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_125840_789001_3849158B 
X-CRM114-Status: GOOD (  23.48  )
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

Relocate the estatus cache allocation and lookup helpers from ghes.c into
ghes_cper.c. This code move keeps the logic intact while making the cache
implementation available to forthcoming users.

Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
---
 drivers/acpi/apei/ghes.c      | 138 +----------------------------------------
 drivers/acpi/apei/ghes_cper.c | 140 ++++++++++++++++++++++++++++++++++++++++++
 include/acpi/ghes_cper.h      |   6 ++
 3 files changed, 147 insertions(+), 137 deletions(-)

diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index 91638ae7e05e..adab7404310e 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -113,10 +113,7 @@ static DEFINE_MUTEX(ghes_devs_mutex);
  */
 static DEFINE_SPINLOCK(ghes_notify_lock_irq);
 
-static struct gen_pool *ghes_estatus_pool;
-
-static struct ghes_estatus_cache __rcu *ghes_estatus_caches[GHES_ESTATUS_CACHES_SIZE];
-static atomic_t ghes_estatus_cache_alloced;
+struct gen_pool *ghes_estatus_pool;
 
 int ghes_estatus_pool_init(unsigned int num_ghes)
 {
@@ -733,139 +730,6 @@ static int ghes_print_estatus(const char *pfx,
 	return 0;
 }
 
-/*
- * GHES error status reporting throttle, to report more kinds of
- * errors, instead of just most frequently occurred errors.
- */
-static int ghes_estatus_cached(struct acpi_hest_generic_status *estatus)
-{
-	u32 len;
-	int i, cached = 0;
-	unsigned long long now;
-	struct ghes_estatus_cache *cache;
-	struct acpi_hest_generic_status *cache_estatus;
-
-	len = cper_estatus_len(estatus);
-	rcu_read_lock();
-	for (i = 0; i < GHES_ESTATUS_CACHES_SIZE; i++) {
-		cache = rcu_dereference(ghes_estatus_caches[i]);
-		if (cache == NULL)
-			continue;
-		if (len != cache->estatus_len)
-			continue;
-		cache_estatus = GHES_ESTATUS_FROM_CACHE(cache);
-		if (memcmp(estatus, cache_estatus, len))
-			continue;
-		atomic_inc(&cache->count);
-		now = sched_clock();
-		if (now - cache->time_in < GHES_ESTATUS_IN_CACHE_MAX_NSEC)
-			cached = 1;
-		break;
-	}
-	rcu_read_unlock();
-	return cached;
-}
-
-static struct ghes_estatus_cache *ghes_estatus_cache_alloc(
-	struct acpi_hest_generic *generic,
-	struct acpi_hest_generic_status *estatus)
-{
-	int alloced;
-	u32 len, cache_len;
-	struct ghes_estatus_cache *cache;
-	struct acpi_hest_generic_status *cache_estatus;
-
-	alloced = atomic_add_return(1, &ghes_estatus_cache_alloced);
-	if (alloced > GHES_ESTATUS_CACHE_ALLOCED_MAX) {
-		atomic_dec(&ghes_estatus_cache_alloced);
-		return NULL;
-	}
-	len = cper_estatus_len(estatus);
-	cache_len = GHES_ESTATUS_CACHE_LEN(len);
-	cache = (void *)gen_pool_alloc(ghes_estatus_pool, cache_len);
-	if (!cache) {
-		atomic_dec(&ghes_estatus_cache_alloced);
-		return NULL;
-	}
-	cache_estatus = GHES_ESTATUS_FROM_CACHE(cache);
-	memcpy(cache_estatus, estatus, len);
-	cache->estatus_len = len;
-	atomic_set(&cache->count, 0);
-	cache->generic = generic;
-	cache->time_in = sched_clock();
-	return cache;
-}
-
-static void ghes_estatus_cache_rcu_free(struct rcu_head *head)
-{
-	struct ghes_estatus_cache *cache;
-	u32 len;
-
-	cache = container_of(head, struct ghes_estatus_cache, rcu);
-	len = cper_estatus_len(GHES_ESTATUS_FROM_CACHE(cache));
-	len = GHES_ESTATUS_CACHE_LEN(len);
-	gen_pool_free(ghes_estatus_pool, (unsigned long)cache, len);
-	atomic_dec(&ghes_estatus_cache_alloced);
-}
-
-static void
-ghes_estatus_cache_add(struct acpi_hest_generic *generic,
-		       struct acpi_hest_generic_status *estatus)
-{
-	unsigned long long now, duration, period, max_period = 0;
-	struct ghes_estatus_cache *cache, *new_cache;
-	struct ghes_estatus_cache __rcu *victim;
-	int i, slot = -1, count;
-
-	new_cache = ghes_estatus_cache_alloc(generic, estatus);
-	if (!new_cache)
-		return;
-
-	rcu_read_lock();
-	now = sched_clock();
-	for (i = 0; i < GHES_ESTATUS_CACHES_SIZE; i++) {
-		cache = rcu_dereference(ghes_estatus_caches[i]);
-		if (cache == NULL) {
-			slot = i;
-			break;
-		}
-		duration = now - cache->time_in;
-		if (duration >= GHES_ESTATUS_IN_CACHE_MAX_NSEC) {
-			slot = i;
-			break;
-		}
-		count = atomic_read(&cache->count);
-		period = duration;
-		do_div(period, (count + 1));
-		if (period > max_period) {
-			max_period = period;
-			slot = i;
-		}
-	}
-	rcu_read_unlock();
-
-	if (slot != -1) {
-		/*
-		 * Use release semantics to ensure that ghes_estatus_cached()
-		 * running on another CPU will see the updated cache fields if
-		 * it can see the new value of the pointer.
-		 */
-		victim = xchg_release(&ghes_estatus_caches[slot],
-				      RCU_INITIALIZER(new_cache));
-
-		/*
-		 * At this point, victim may point to a cached item different
-		 * from the one based on which we selected the slot. Instead of
-		 * going to the loop again to pick another slot, let's just
-		 * drop the other item anyway: this may cause a false cache
-		 * miss later on, but that won't cause any problems.
-		 */
-		if (victim)
-			call_rcu(&unrcu_pointer(victim)->rcu,
-				 ghes_estatus_cache_rcu_free);
-	}
-}
-
 static void __ghes_panic(struct ghes *ghes,
 			 struct acpi_hest_generic_status *estatus,
 			 u64 buf_paddr, enum fixed_addresses fixmap_idx)
diff --git a/drivers/acpi/apei/ghes_cper.c b/drivers/acpi/apei/ghes_cper.c
index 8080e0f76dac..0a117f478afb 100644
--- a/drivers/acpi/apei/ghes_cper.c
+++ b/drivers/acpi/apei/ghes_cper.c
@@ -13,10 +13,14 @@
  */
 
 #include <linux/err.h>
+#include <linux/genalloc.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/math64.h>
 #include <linux/mm.h>
 #include <linux/ratelimit.h>
+#include <linux/rcupdate.h>
+#include <linux/sched/clock.h>
 #include <linux/slab.h>
 
 #include <acpi/apei.h>
@@ -27,6 +31,9 @@
 
 #include "apei-internal.h"
 
+static struct ghes_estatus_cache __rcu *ghes_estatus_caches[GHES_ESTATUS_CACHES_SIZE];
+static atomic_t ghes_estatus_cache_alloced;
+
 static void __iomem *ghes_map(u64 pfn, enum fixed_addresses fixmap_idx)
 {
 	phys_addr_t paddr;
@@ -258,3 +265,136 @@ void ghes_clear_estatus(struct ghes *ghes,
 	if (is_hest_type_generic_v2(ghes))
 		ghes_ack_error(ghes->generic_v2);
 }
+
+/*
+ * GHES error status reporting throttle, to report more kinds of
+ * errors, instead of just most frequently occurred errors.
+ */
+int ghes_estatus_cached(struct acpi_hest_generic_status *estatus)
+{
+	u32 len;
+	int i, cached = 0;
+	unsigned long long now;
+	struct ghes_estatus_cache *cache;
+	struct acpi_hest_generic_status *cache_estatus;
+
+	len = cper_estatus_len(estatus);
+	rcu_read_lock();
+	for (i = 0; i < GHES_ESTATUS_CACHES_SIZE; i++) {
+		cache = rcu_dereference(ghes_estatus_caches[i]);
+		if (cache == NULL)
+			continue;
+		if (len != cache->estatus_len)
+			continue;
+		cache_estatus = GHES_ESTATUS_FROM_CACHE(cache);
+		if (memcmp(estatus, cache_estatus, len))
+			continue;
+		atomic_inc(&cache->count);
+		now = sched_clock();
+		if (now - cache->time_in < GHES_ESTATUS_IN_CACHE_MAX_NSEC)
+			cached = 1;
+		break;
+	}
+	rcu_read_unlock();
+	return cached;
+}
+
+static struct ghes_estatus_cache *ghes_estatus_cache_alloc(
+	struct acpi_hest_generic *generic,
+	struct acpi_hest_generic_status *estatus)
+{
+	int alloced;
+	u32 len, cache_len;
+	struct ghes_estatus_cache *cache;
+	struct acpi_hest_generic_status *cache_estatus;
+
+	alloced = atomic_add_return(1, &ghes_estatus_cache_alloced);
+	if (alloced > GHES_ESTATUS_CACHE_ALLOCED_MAX) {
+		atomic_dec(&ghes_estatus_cache_alloced);
+		return NULL;
+	}
+	len = cper_estatus_len(estatus);
+	cache_len = GHES_ESTATUS_CACHE_LEN(len);
+	cache = (void *)gen_pool_alloc(ghes_estatus_pool, cache_len);
+	if (cache == NULL) {
+		atomic_dec(&ghes_estatus_cache_alloced);
+		return NULL;
+	}
+	cache_estatus = GHES_ESTATUS_FROM_CACHE(cache);
+	memcpy(cache_estatus, estatus, len);
+	cache->estatus_len = len;
+	atomic_set(&cache->count, 0);
+	cache->generic = generic;
+	cache->time_in = sched_clock();
+	return cache;
+}
+
+static void ghes_estatus_cache_rcu_free(struct rcu_head *head)
+{
+	struct ghes_estatus_cache *cache;
+	u32 len;
+
+	cache = container_of(head, struct ghes_estatus_cache, rcu);
+	len = cper_estatus_len(GHES_ESTATUS_FROM_CACHE(cache));
+	len = GHES_ESTATUS_CACHE_LEN(len);
+	gen_pool_free(ghes_estatus_pool, (unsigned long)cache, len);
+	atomic_dec(&ghes_estatus_cache_alloced);
+}
+
+void
+ghes_estatus_cache_add(struct acpi_hest_generic *generic,
+		       struct acpi_hest_generic_status *estatus)
+{
+	unsigned long long now, duration, period, max_period = 0;
+	struct ghes_estatus_cache *cache, *new_cache;
+	struct ghes_estatus_cache __rcu *victim;
+	int i, slot = -1, count;
+
+	new_cache = ghes_estatus_cache_alloc(generic, estatus);
+	if (!new_cache)
+		return;
+
+	rcu_read_lock();
+	now = sched_clock();
+	for (i = 0; i < GHES_ESTATUS_CACHES_SIZE; i++) {
+		cache = rcu_dereference(ghes_estatus_caches[i]);
+		if (cache == NULL) {
+			slot = i;
+			break;
+		}
+		duration = now - cache->time_in;
+		if (duration >= GHES_ESTATUS_IN_CACHE_MAX_NSEC) {
+			slot = i;
+			break;
+		}
+		count = atomic_read(&cache->count);
+		period = duration;
+		do_div(period, (count + 1));
+		if (period > max_period) {
+			max_period = period;
+			slot = i;
+		}
+	}
+	rcu_read_unlock();
+
+	if (slot != -1) {
+		/*
+		 * Use release semantics to ensure that ghes_estatus_cached()
+		 * running on another CPU will see the updated cache fields if
+		 * it can see the new value of the pointer.
+		 */
+		victim = xchg_release(&ghes_estatus_caches[slot],
+				      RCU_INITIALIZER(new_cache));
+
+		/*
+		 * At this point, victim may point to a cached item different
+		 * from the one based on which we selected the slot. Instead of
+		 * going to the loop again to pick another slot, let's just
+		 * drop the other item anyway: this may cause a false cache
+		 * miss later on, but that won't cause any problems.
+		 */
+		if (victim)
+			call_rcu(&unrcu_pointer(victim)->rcu,
+				 ghes_estatus_cache_rcu_free);
+	}
+}
diff --git a/include/acpi/ghes_cper.h b/include/acpi/ghes_cper.h
index 6b7632cfaf66..1b5dbeca9bb6 100644
--- a/include/acpi/ghes_cper.h
+++ b/include/acpi/ghes_cper.h
@@ -16,6 +16,7 @@
 #ifndef ACPI_APEI_GHES_CPER_H
 #define ACPI_APEI_GHES_CPER_H
 
+#include <linux/atomic.h>
 #include <linux/workqueue.h>
 
 #include <acpi/ghes.h>
@@ -54,6 +55,8 @@
 	((struct acpi_hest_generic_data *)                              \
 	((struct ghes_vendor_record_entry *)(vendor_entry) + 1))
 
+extern struct gen_pool *ghes_estatus_pool;
+
 static inline bool is_hest_type_generic_v2(struct ghes *ghes)
 {
 	return ghes->generic->header.type == ACPI_HEST_TYPE_GENERIC_ERROR_V2;
@@ -98,5 +101,8 @@ int __ghes_read_estatus(struct acpi_hest_generic_status *estatus,
 			u64 buf_paddr, enum fixed_addresses fixmap_idx,
 			size_t buf_len);
 #endif
+int ghes_estatus_cached(struct acpi_hest_generic_status *estatus);
+void ghes_estatus_cache_add(struct acpi_hest_generic *generic,
+			    struct acpi_hest_generic_status *estatus);
 
 #endif /* ACPI_APEI_GHES_CPER_H */

-- 
2.43.0


