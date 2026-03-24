Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45CCF532E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 06:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+jX6dAxcdqCTNOckLdCf0QTntAgXHVIU7/JVikNKrc=; b=NBLp7Ia/BzrQIMZbtbqHUjhkiA
	2x9S2F8DuhzgQmiQN2fJ80PBVOn/BSWsU8pj+A/OJFSjgdfqJykm62QBR6AMhMiD2cZCqk4rdBWqI
	QmPQUhH4d69TCImMc2jpyc5fzaxkyw295iH9/LjyP8mqxSxS9rTVOAh/P0Q6ID7QNVWIhBPzxFlws
	HQ5fz4syv9xpfJPyzk9qyzoEfQ8Qg9z1xxW88tzNeroZKDYRiVF0P/fy8DhbxYP78h6vUOb0hi/Jq
	27ydVZTkI54np9jdnFptAEKInTkEFv+q2eDBCIwJuqZR6YOt9PYPNUiHaOkQ4zIWDcYgp/AaOvwGk
	E7wjPy4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vVp-00000000p2O-3V1P;
	Tue, 24 Mar 2026 06:45:13 +0000
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vVi-00000000oih-0hhx;
	Tue, 24 Mar 2026 06:45:06 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Dan Williams <dan.j.williams@intel.com>,
	Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fnnas.com>,
	Li Nan <linan122@huawei.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-raid@vger.kernel.org
Subject: [PATCH 16/17] raid6_kunit: randomize parameters and increase limits
Date: Tue, 24 Mar 2026 07:40:51 +0100
Message-ID: <20260324064115.3217136-17-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324064115.3217136-1-hch@lst.de>
References: <20260324064115.3217136-1-hch@lst.de>
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

The current test has double-quadratic behavior in the selection for
the updated ("XORed") disks, and in the selection of updated pointers,
which makes scaling it to more tests difficult.  At the same time it
only ever tests with the maximum number of disks, which leaves a
coverage hole for smaller ones.

Fix this by randomizing the total number, failed disks and regions
to update, and increasing the upper number of tests disks.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 lib/raid/raid6/tests/raid6_kunit.c | 188 +++++++++++++++++++----------
 1 file changed, 124 insertions(+), 64 deletions(-)

diff --git a/lib/raid/raid6/tests/raid6_kunit.c b/lib/raid/raid6/tests/raid6_kunit.c
index ba6cfabc67a4..a0a473643e91 100644
--- a/lib/raid/raid6/tests/raid6_kunit.c
+++ b/lib/raid/raid6/tests/raid6_kunit.c
@@ -13,13 +13,15 @@
 MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 
 #define RAID6_KUNIT_SEED		42
+#define RAID6_KUNIT_NUM_TEST_ITERS	10
+#define RAID6_KUNIT_MAX_BUFFERS		64 /* Including P and Q */
 #define RAID6_KUNIT_MAX_FAILURES	2
-
-#define NDISKS		16	/* Including P and Q */
+#define RAID6_KUNIT_MAX_BYTES		PAGE_SIZE
 
 static struct rnd_state rng;
-static void *test_buffers[NDISKS];
+static void *test_buffers[RAID6_KUNIT_MAX_BUFFERS];
 static void *test_recov_buffers[RAID6_KUNIT_MAX_FAILURES];
+static size_t test_buflen;
 
 struct test_args {
 	unsigned int recov_idx;
@@ -30,105 +32,162 @@ struct test_args {
 
 static struct test_args args;
 
+static u32 rand32(void)
+{
+	return prandom_u32_state(&rng);
+}
+
+/* Generate a random length that is a multiple of 512. */
+static unsigned int random_length(unsigned int max_length)
+{
+	return (rand32() % (max_length + 1)) & ~511;
+}
+
 static void makedata(int start, int stop)
 {
 	int i;
 
 	for (i = start; i <= stop; i++)
-		prandom_bytes_state(&rng, test_buffers[i], PAGE_SIZE);
+		prandom_bytes_state(&rng, test_buffers[i], test_buflen);
 }
 
-static char member_type(int d)
+static char member_type(unsigned int nr_buffers, int d)
 {
-	switch (d) {
-	case NDISKS-2:
+	if (d == nr_buffers - 2)
 		return 'P';
-	case NDISKS-1:
+	if (d == nr_buffers - 1)
 		return 'Q';
-	default:
-		return 'D';
-	}
+	return 'D';
 }
 
-static void test_recover(struct kunit *test, int faila, int failb)
+static void test_recover_one(struct kunit *test, unsigned int nr_buffers,
+		unsigned int len, int faila, int failb)
 {
 	const struct test_args *ta = test->param_value;
-	void *dataptrs[NDISKS];
+	void *dataptrs[RAID6_KUNIT_MAX_BUFFERS];
 	int i;
 
+	if (faila > failb)
+		swap(faila, failb);
+
 	for (i = 0; i < RAID6_KUNIT_MAX_FAILURES; i++)
-		memset(test_recov_buffers[i], 0xf0, PAGE_SIZE);
+		memset(test_recov_buffers[i], 0xf0, test_buflen);
 
 	memcpy(dataptrs, test_buffers, sizeof(dataptrs));
 	dataptrs[faila] = test_recov_buffers[0];
 	dataptrs[failb] = test_recov_buffers[1];
 
-	if (faila > failb)
-		swap(faila, failb);
-
-	if (failb == NDISKS - 1) {
+	if (failb == nr_buffers - 1) {
 		/*
 		 * We don't implement the data+Q failure scenario, since it
 		 * is equivalent to a RAID-5 failure (XOR, then recompute Q).
 		 */
-		if (faila != NDISKS - 2)
+		if (WARN_ON_ONCE(faila != nr_buffers - 2))
 			return;
 
 		/* P+Q failure.  Just rebuild the syndrome. */
-		ta->gen->gen_syndrome(NDISKS, PAGE_SIZE, dataptrs);
-	} else if (failb == NDISKS - 2) {
+		ta->gen->gen_syndrome(nr_buffers, len, dataptrs);
+	} else if (failb == nr_buffers - 2) {
 		/* data+P failure. */
-		ta->recov->datap(NDISKS, PAGE_SIZE, faila, dataptrs);
+		ta->recov->datap(nr_buffers, len, faila, dataptrs);
 	} else {
 		/* data+data failure. */
-		ta->recov->data2(NDISKS, PAGE_SIZE, faila, failb, dataptrs);
+		ta->recov->data2(nr_buffers, len, faila, failb, dataptrs);
 	}
 
 	KUNIT_EXPECT_MEMEQ_MSG(test, test_buffers[faila], test_recov_buffers[0],
-			PAGE_SIZE,
-			"faila miscompared: %3d[%c] (failb=%3d[%c])\n",
-			faila, member_type(faila),
-			failb, member_type(failb));
+			len,
+			"faila miscompared: %3d[%c] buffers %u len %u (failb=%3d[%c])\n",
+			faila, member_type(nr_buffers, faila),
+			nr_buffers, len,
+			failb, member_type(nr_buffers, failb));
 	KUNIT_EXPECT_MEMEQ_MSG(test, test_buffers[failb], test_recov_buffers[1],
-			PAGE_SIZE,
-			"failb miscompared: %3d[%c] (faila=%3d[%c])\n",
-			failb, member_type(failb),
-			faila, member_type(faila));
+			len,
+			"failb miscompared: %3d[%c] buffers %u len %u (faila=%3d[%c])\n",
+			failb, member_type(nr_buffers, failb),
+			nr_buffers, len,
+			faila, member_type(nr_buffers, faila));
 }
 
-static void raid6_test(struct kunit *test)
+static void test_recover(struct kunit *test, unsigned int nr_buffers,
+		unsigned int len)
+{
+	int iterations, i;
+
+	/* Test P+Q recovery */
+	test_recover_one(test, nr_buffers, len, nr_buffers - 2, nr_buffers - 1);
+
+	/* Test data+P recovery */
+	for (i = 0; i < nr_buffers - 2; i++)
+		test_recover_one(test, nr_buffers, len, i, nr_buffers - 2);
+
+	/* Test data+data recovery using random sampling */
+	iterations = nr_buffers * 2; /* should provide good enough coverage */
+	for (i = 0; i < iterations; i++) {
+		int faila = rand32() % (nr_buffers - 2), failb;
+
+		do {
+			failb = rand32() % (nr_buffers - 2);
+		} while (failb == faila);
+
+		test_recover_one(test, nr_buffers, len, faila, failb);
+	}
+}
+
+/* Simulate rmw run */
+static void test_rmw_one(struct kunit *test, unsigned int nr_buffers,
+		unsigned int len, int p1, int p2)
+{
+	const struct test_args *ta = test->param_value;
+
+	ta->gen->xor_syndrome(nr_buffers, p1, p2, len, test_buffers);
+	makedata(p1, p2);
+	ta->gen->xor_syndrome(nr_buffers, p1, p2, len, test_buffers);
+	test_recover(test, nr_buffers, len);
+}
+
+static void test_rmw(struct kunit *test, unsigned int nr_buffers,
+		unsigned int len)
+{
+	int iterations = nr_buffers / 2, i;
+
+	for (i = 0; i < iterations; i++) {
+		int p1 = rand32() % (nr_buffers - 2);
+		int p2 = rand32() % (nr_buffers - 2);
+
+		if (p2 < p1)
+			swap(p1, p2);
+		test_rmw_one(test, nr_buffers, len, p1, p2);
+	}
+}
+
+static void raid6_test_one(struct kunit *test)
 {
 	const struct test_args *ta = test->param_value;
-	int i, j, p1, p2;
+	/* including P/Q we need at least three buffers */
+	unsigned int nr_buffers =
+		(rand32() % (RAID6_KUNIT_MAX_BUFFERS - 2)) + 3;
+	unsigned int len = random_length(RAID6_KUNIT_MAX_BYTES);
 
 	/* Nuke syndromes */
-	memset(test_buffers[NDISKS - 2], 0xee, PAGE_SIZE);
-	memset(test_buffers[NDISKS - 1], 0xee, PAGE_SIZE);
+	memset(test_buffers[nr_buffers - 2], 0xee, test_buflen);
+	memset(test_buffers[nr_buffers - 1], 0xee, test_buflen);
 
 	/* Generate assumed good syndrome */
-	ta->gen->gen_syndrome(NDISKS, PAGE_SIZE, test_buffers);
-
-	for (i = 0; i < NDISKS - 1; i++)
-		for (j = i + 1; j < NDISKS; j++)
-			test_recover(test, i, j);
-
-	if (!ta->gen->xor_syndrome)
-		return;
-
-	for (p1 = 0; p1 < NDISKS - 2; p1++) {
-		for (p2 = p1; p2 < NDISKS - 2; p2++) {
-			/* Simulate rmw run */
-			ta->gen->xor_syndrome(NDISKS, p1, p2, PAGE_SIZE,
-					test_buffers);
-			makedata(p1, p2);
-			ta->gen->xor_syndrome(NDISKS, p1, p2, PAGE_SIZE,
-					test_buffers);
-
-			for (i = 0; i < NDISKS - 1; i++)
-				for (j = i + 1; j < NDISKS; j++)
-					test_recover(test, i, j);
-		}
-	}
+	ta->gen->gen_syndrome(nr_buffers, len, test_buffers);
+
+	test_recover(test, nr_buffers, len);
+
+	if (ta->gen->xor_syndrome)
+		test_rmw(test, nr_buffers, len);
+}
+
+static void raid6_test(struct kunit *test)
+{
+	int i;
+
+	for (i = 0; i < RAID6_KUNIT_NUM_TEST_ITERS; i++)
+		raid6_test_one(test);
 }
 
 static const void *raid6_gen_params(struct kunit *test, const void *prev,
@@ -172,23 +231,24 @@ static int raid6_suite_init(struct kunit_suite *suite)
 	 * so that it is immediately followed by a guard page.  This allows
 	 * buffer overreads to be detected, even in assembly code.
 	 */
+	test_buflen = round_up(RAID6_KUNIT_MAX_BYTES, PAGE_SIZE);
 	for (i = 0; i < RAID6_KUNIT_MAX_FAILURES; i++) {
-		test_recov_buffers[i] = vmalloc(PAGE_SIZE);
+		test_recov_buffers[i] = vmalloc(test_buflen);
 		if (!test_recov_buffers[i])
 			goto out_free_recov_buffers;
 	}
-	for (i = 0; i < NDISKS; i++) {
-		test_buffers[i] = vmalloc(PAGE_SIZE);
+	for (i = 0; i < RAID6_KUNIT_MAX_BUFFERS; i++) {
+		test_buffers[i] = vmalloc(test_buflen);
 		if (!test_buffers[i])
 			goto out_free_buffers;
 	}
 
-	makedata(0, NDISKS - 1);
+	makedata(0, RAID6_KUNIT_MAX_BUFFERS - 1);
 
 	return 0;
 
 out_free_buffers:
-	for (i = 0; i < NDISKS; i++)
+	for (i = 0; i < RAID6_KUNIT_MAX_BUFFERS; i++)
 		vfree(test_buffers[i]);
 out_free_recov_buffers:
 	for (i = 0; i < RAID6_KUNIT_MAX_FAILURES; i++)
@@ -200,7 +260,7 @@ static void raid6_suite_exit(struct kunit_suite *suite)
 {
 	int i;
 
-	for (i = 0; i < NDISKS; i++)
+	for (i = 0; i < RAID6_KUNIT_MAX_BUFFERS; i++)
 		vfree(test_buffers[i]);
 	for (i = 0; i < RAID6_KUNIT_MAX_FAILURES; i++)
 		vfree(test_recov_buffers[i]);
-- 
2.47.3


