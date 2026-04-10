Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D462DF4484C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 12:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=K4NT27D0mqg0VfaBgETboxq8yA7MxcA9Ab7uPnykYS8=; b=QlXFldrhkNZdMv
	HeCNQHRQs6DI0tPXZ+Fq/C86HtUZE+THM8K41Mi3qk3UlRYzXDyZ5qfvYCMFmMTc4v/FtkURpNA+E
	VAg//9wkc7PRWvLl1WPlUnClwhWowstG91mmSsOfayBL8s60AHgqAKEoXXXykaYbgZMY3HJJYCZy0
	Kwglwh95B8NAJCA1xBbJsMNsseITGMee5juWKERDTfpuOtCEQiQYPWWxMnwfjc3vSCzo8q6k+8b5C
	hz7rVYHOGJaaxWqyP2NH/V65EMY+OJ1ecotIUi1LR0tJW6365F2p4LJAHSdR2737YoKdYkUDGMGrY
	eS2hGEYdNQ2XhcVrtEzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAqA-0000000CAho-1U8s;
	Fri, 10 Apr 2026 12:20:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAq8-0000000CAfJ-3ZaD;
	Fri, 10 Apr 2026 12:20:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 460E06132D;
	Fri, 10 Apr 2026 12:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25608C2BC87;
	Fri, 10 Apr 2026 12:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823599;
	bh=p4ShM3O0GBFCP2qPjb6zSxh+Ha5oLOtvBK8/RtfAnVs=;
	h=Date:From:To:Cc:Subject:References:From;
	b=dAmn2yz62WI0i12fcQ9F03BvOYg2+eAhjig+X04BVmpX8c9M01sHZgZEu1rVRhWki
	 aMBfoGnUl9WpMMqLWFryj6yJQ9lwTCD1i0oDG/S5mN25bXyGqKT30GrztgQQ3rav4T
	 BmbqmYb8KPxXW6sSQ9CXXe5EvhipWJeX23ghk7uDybakuO9EcTg4cMG5iBSrRe/GPa
	 tJ33MSKa5EFjbZHZi72K/jby5Pm2bPWRte8ZG3Zb5p2f71WeXeB85PUV24dYQuwkS9
	 ZuUw9oOAlqL+roK/1FBLE3TIhiCqSUqlbqWXBE/GwV9uTSEnFXIo6OPA+8wwtYtllu
	 kFOMRP9PboEEQ==
Date: Fri, 10 Apr 2026 14:19:56 +0200
Message-ID: <20260410120318.794680738@kernel.org>
User-Agent: quilt/0.68
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>,
 linux-mm@kvack.org,
 Arnd Bergmann <arnd@arndb.de>,
 x86@kernel.org,
 Lu Baolu <baolu.lu@linux.intel.com>,
 iommu@lists.linux.dev,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 linux-crypto@vger.kernel.org,
 Vlastimil Babka <vbabka@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Bernie Thompson <bernie@plugable.com>,
 linux-fbdev@vger.kernel.org,
 "Theodore Tso" <tytso@mit.edu>,
 linux-ext4@vger.kernel.org,
 Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 kasan-dev@googlegroups.com,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Thomas Sailer <t.sailer@alumni.ethz.ch>,
 linux-hams@vger.kernel.org,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 linux-alpha@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org,
 Dinh Nguyen <dinguyen@kernel.org>,
 Jonas Bonn <jonas@southpole.se>,
 linux-openrisc@vger.kernel.org,
 Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org
Subject: [patch 18/38] lib/tests: Replace get_cycles() with ktime_get()
References: <20260410120044.031381086@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

get_cycles() is the historical access to a fine grained time source, but it
is a suboptimal choice for two reasons:

   - get_cycles() is not guaranteed to be supported and functional on all
     systems/platforms. If not supported or not functional it returns 0,
     which makes benchmarking moot.

   - get_cycles() returns the raw counter value of whatever the
     architecture platform provides. The original x86 Time Stamp Counter
     (TSC) was despite its name tied to the actual CPU core frequency.
     That's not longer the case. So the counter value is only meaningful
     when the CPU operates at the same frequency as the TSC or the value is
     adjusted to the actual CPU frequency. Other architectures and
     platforms provide similar disjunct counters via get_cycles(), so the
     result is operations per BOGO-cycles, which is not really meaningful.

Use ktime_get() instead which provides nanosecond timestamps with the
granularity of the underlying hardware counter, which is not different to
the variety of get_cycles() implementations.

This provides at least understandable metrics, i.e. operations/nanoseconds,
and is available on all platforms. As with get_cycles() the result might
have to be put into relation with the CPU operating frequency, but that's
not any different.

This is part of a larger effort to remove get_cycles() usage from
non-architecture code.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org
---
 lib/interval_tree_test.c |   16 ++++++++--------
 lib/rbtree_test.c        |   46 +++++++++++++++++++++++-----------------------
 lib/test_vmalloc.c       |   10 +++++-----
 3 files changed, 36 insertions(+), 36 deletions(-)

--- a/lib/interval_tree_test.c
+++ b/lib/interval_tree_test.c
@@ -65,13 +65,13 @@ static void init(void)
 static int basic_check(void)
 {
 	int i, j;
-	cycles_t time1, time2, time;
+	ktime_t time1, time2, time;
 
 	printk(KERN_ALERT "interval tree insert/remove");
 
 	init();
 
-	time1 = get_cycles();
+	time1 = ktime_get();
 
 	for (i = 0; i < perf_loops; i++) {
 		for (j = 0; j < nnodes; j++)
@@ -80,11 +80,11 @@ static int basic_check(void)
 			interval_tree_remove(nodes + j, &root);
 	}
 
-	time2 = get_cycles();
+	time2 = ktime_get();
 	time = time2 - time1;
 
 	time = div_u64(time, perf_loops);
-	printk(" -> %llu cycles\n", (unsigned long long)time);
+	printk(" -> %llu nsecs\n", (unsigned long long)time);
 
 	return 0;
 }
@@ -93,7 +93,7 @@ static int search_check(void)
 {
 	int i, j;
 	unsigned long results;
-	cycles_t time1, time2, time;
+	ktime_t time1, time2, time;
 
 	printk(KERN_ALERT "interval tree search");
 
@@ -102,7 +102,7 @@ static int search_check(void)
 	for (j = 0; j < nnodes; j++)
 		interval_tree_insert(nodes + j, &root);
 
-	time1 = get_cycles();
+	time1 = ktime_get();
 
 	results = 0;
 	for (i = 0; i < search_loops; i++)
@@ -113,12 +113,12 @@ static int search_check(void)
 			results += search(&root, start, last);
 		}
 
-	time2 = get_cycles();
+	time2 = ktime_get();
 	time = time2 - time1;
 
 	time = div_u64(time, search_loops);
 	results = div_u64(results, search_loops);
-	printk(" -> %llu cycles (%lu results)\n",
+	printk(" -> %llu nsecs (%lu results)\n",
 	       (unsigned long long)time, results);
 
 	for (j = 0; j < nnodes; j++)
--- a/lib/rbtree_test.c
+++ b/lib/rbtree_test.c
@@ -243,14 +243,14 @@ static void check_augmented(int nr_nodes
 static int basic_check(void)
 {
 	int i, j;
-	cycles_t time1, time2, time;
+	ktime_t time1, time2, time;
 	struct rb_node *node;
 
 	printk(KERN_ALERT "rbtree testing");
 
 	init();
 
-	time1 = get_cycles();
+	time1 = ktime_get();
 
 	for (i = 0; i < perf_loops; i++) {
 		for (j = 0; j < nnodes; j++)
@@ -259,14 +259,14 @@ static int basic_check(void)
 			erase(nodes + j, &root);
 	}
 
-	time2 = get_cycles();
+	time2 = ktime_get();
 	time = time2 - time1;
 
 	time = div_u64(time, perf_loops);
-	printk(" -> test 1 (latency of nnodes insert+delete): %llu cycles\n",
+	printk(" -> test 1 (latency of nnodes insert+delete): %llu nsecs\n",
 	       (unsigned long long)time);
 
-	time1 = get_cycles();
+	time1 = ktime_get();
 
 	for (i = 0; i < perf_loops; i++) {
 		for (j = 0; j < nnodes; j++)
@@ -275,52 +275,52 @@ static int basic_check(void)
 			erase_cached(nodes + j, &root);
 	}
 
-	time2 = get_cycles();
+	time2 = ktime_get();
 	time = time2 - time1;
 
 	time = div_u64(time, perf_loops);
-	printk(" -> test 2 (latency of nnodes cached insert+delete): %llu cycles\n",
+	printk(" -> test 2 (latency of nnodes cached insert+delete): %llu nsecs\n",
 	       (unsigned long long)time);
 
 	for (i = 0; i < nnodes; i++)
 		insert(nodes + i, &root);
 
-	time1 = get_cycles();
+	time1 = ktime_get();
 
 	for (i = 0; i < perf_loops; i++) {
 		for (node = rb_first(&root.rb_root); node; node = rb_next(node))
 			;
 	}
 
-	time2 = get_cycles();
+	time2 = ktime_get();
 	time = time2 - time1;
 
 	time = div_u64(time, perf_loops);
-	printk(" -> test 3 (latency of inorder traversal): %llu cycles\n",
+	printk(" -> test 3 (latency of inorder traversal): %llu nsecs\n",
 	       (unsigned long long)time);
 
-	time1 = get_cycles();
+	time1 = ktime_get();
 
 	for (i = 0; i < perf_loops; i++)
 		node = rb_first(&root.rb_root);
 
-	time2 = get_cycles();
+	time2 = ktime_get();
 	time = time2 - time1;
 
 	time = div_u64(time, perf_loops);
 	printk(" -> test 4 (latency to fetch first node)\n");
-	printk("        non-cached: %llu cycles\n", (unsigned long long)time);
+	printk("        non-cached: %llu nsecs\n", (unsigned long long)time);
 
-	time1 = get_cycles();
+	time1 = ktime_get();
 
 	for (i = 0; i < perf_loops; i++)
 		node = rb_first_cached(&root);
 
-	time2 = get_cycles();
+	time2 = ktime_get();
 	time = time2 - time1;
 
 	time = div_u64(time, perf_loops);
-	printk("        cached: %llu cycles\n", (unsigned long long)time);
+	printk("        cached: %llu nsecs\n", (unsigned long long)time);
 
 	for (i = 0; i < nnodes; i++)
 		erase(nodes + i, &root);
@@ -345,13 +345,13 @@ static int basic_check(void)
 static int augmented_check(void)
 {
 	int i, j;
-	cycles_t time1, time2, time;
+	ktime_t time1, time2, time;
 
 	printk(KERN_ALERT "augmented rbtree testing");
 
 	init();
 
-	time1 = get_cycles();
+	time1 = ktime_get();
 
 	for (i = 0; i < perf_loops; i++) {
 		for (j = 0; j < nnodes; j++)
@@ -360,13 +360,13 @@ static int augmented_check(void)
 			erase_augmented(nodes + j, &root);
 	}
 
-	time2 = get_cycles();
+	time2 = ktime_get();
 	time = time2 - time1;
 
 	time = div_u64(time, perf_loops);
-	printk(" -> test 1 (latency of nnodes insert+delete): %llu cycles\n", (unsigned long long)time);
+	printk(" -> test 1 (latency of nnodes insert+delete): %llu nsecs\n", (unsigned long long)time);
 
-	time1 = get_cycles();
+	time1 = ktime_get();
 
 	for (i = 0; i < perf_loops; i++) {
 		for (j = 0; j < nnodes; j++)
@@ -375,11 +375,11 @@ static int augmented_check(void)
 			erase_augmented_cached(nodes + j, &root);
 	}
 
-	time2 = get_cycles();
+	time2 = ktime_get();
 	time = time2 - time1;
 
 	time = div_u64(time, perf_loops);
-	printk(" -> test 2 (latency of nnodes cached insert+delete): %llu cycles\n", (unsigned long long)time);
+	printk(" -> test 2 (latency of nnodes cached insert+delete): %llu nsecs\n", (unsigned long long)time);
 
 	for (i = 0; i < check_loops; i++) {
 		init();
--- a/lib/test_vmalloc.c
+++ b/lib/test_vmalloc.c
@@ -454,8 +454,8 @@ static struct test_driver {
 	struct task_struct *task;
 	struct test_case_data data[ARRAY_SIZE(test_case_array)];
 
-	unsigned long start;
-	unsigned long stop;
+	ktime_t start;
+	ktime_t stop;
 } *tdriver;
 
 static void shuffle_array(int *arr, int n)
@@ -490,7 +490,7 @@ static int test_func(void *private)
 	 */
 	synchronize_srcu(&prepare_for_test_srcu);
 
-	t->start = get_cycles();
+	t->start = ktime_get();
 	for (i = 0; i < ARRAY_SIZE(test_case_array); i++) {
 		index = random_array[i];
 
@@ -519,7 +519,7 @@ static int test_func(void *private)
 
 		t->data[index].time = delta;
 	}
-	t->stop = get_cycles();
+	t->stop = ktime_get();
 	test_report_one_done();
 
 	/*
@@ -619,7 +619,7 @@ static void do_concurrent_test(void)
 				t->data[j].time);
 		}
 
-		pr_info("All test took worker%d=%lu cycles\n",
+		pr_info("All test took worker%d=%lld nsecs\n",
 			i, t->stop - t->start);
 	}
 


