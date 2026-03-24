Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A41EF532E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 06:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1qcNMjs/6HgqVDyYip4FGqGPvQZzqVe+4OKCwRy55VI=; b=eqbUCJkEAVctu7lY8TXc7Uiq7r
	hwS2ZWKwwp0JD4OAPu9hRRyWT/vFPgyvr80PYeFbIIwVfReq/BLJ7vLwZYfhmCyQFCqqhaJ87riix
	C9WUULl/ZZ+Jx0k3+DCoU+F6crk/9tCnaadjio/KndLEVu3lp0OvMlmp5nLsLTMZUce2JcZMAoLHt
	EGJ4E+k/Qr9LcO3EgqR+HX0LfXyVN/7bc3brs8iD7Q+zKY3PgyVLNLs83EEiw762HvWouZSPlPrdd
	8qSIVhSjZuQlME9GUiEqA90UqCay2A8ozNf+lC1NvsJVVS4mhtLrKHQW8c0trWJUF0BdHlU+/t3IT
	ObLkhHTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vVN-00000000oYM-0FZ6;
	Tue, 24 Mar 2026 06:44:45 +0000
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vVL-00000000oHJ-1D1y;
	Tue, 24 Mar 2026 06:44:43 +0000
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
Subject: [PATCH 14/17] raid6_kunit: dynamically allocate data buffers using vmalloc
Date: Tue, 24 Mar 2026 07:40:49 +0100
Message-ID: <20260324064115.3217136-15-hch@lst.de>
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

Use vmalloc for the data buffers instead of using static .data allocations.
This provides for better out of bounds checking and avoids wasting kernel
memory after the test has run.  vmalloc is used instead of kmalloc to
provide for better out of bounds access checking as in other kunit tests.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 lib/raid/raid6/tests/raid6_kunit.c | 75 +++++++++++++++++++++++-------
 1 file changed, 59 insertions(+), 16 deletions(-)

diff --git a/lib/raid/raid6/tests/raid6_kunit.c b/lib/raid/raid6/tests/raid6_kunit.c
index 7095952ad8e3..1793b952a595 100644
--- a/lib/raid/raid6/tests/raid6_kunit.c
+++ b/lib/raid/raid6/tests/raid6_kunit.c
@@ -7,19 +7,20 @@
 
 #include <kunit/test.h>
 #include <linux/prandom.h>
+#include <linux/vmalloc.h>
 #include "../algos.h"
 
 MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 
 #define RAID6_KUNIT_SEED		42
+#define RAID6_KUNIT_MAX_FAILURES	2
 
 #define NDISKS		16	/* Including P and Q */
 
 static struct rnd_state rng;
 static void *dataptrs[NDISKS];
-static char data[NDISKS][PAGE_SIZE] __attribute__((aligned(PAGE_SIZE)));
-static char recovi[PAGE_SIZE] __attribute__((aligned(PAGE_SIZE)));
-static char recovj[PAGE_SIZE] __attribute__((aligned(PAGE_SIZE)));
+static void *test_buffers[NDISKS];
+static void *test_recov_buffers[RAID6_KUNIT_MAX_FAILURES];
 
 struct test_args {
 	unsigned int recov_idx;
@@ -35,8 +36,8 @@ static void makedata(int start, int stop)
 	int i;
 
 	for (i = start; i <= stop; i++) {
-		prandom_bytes_state(&rng, data[i], PAGE_SIZE);
-		dataptrs[i] = data[i];
+		prandom_bytes_state(&rng, test_buffers[i], PAGE_SIZE);
+		dataptrs[i] = test_buffers[i];
 	}
 }
 
@@ -55,12 +56,13 @@ static char member_type(int d)
 static void test_recover(struct kunit *test, int faila, int failb)
 {
 	const struct test_args *ta = test->param_value;
+	int i;
 
-	memset(recovi, 0xf0, PAGE_SIZE);
-	memset(recovj, 0xba, PAGE_SIZE);
+	for (i = 0; i < RAID6_KUNIT_MAX_FAILURES; i++)
+		memset(test_recov_buffers[i], 0xf0, PAGE_SIZE);
 
-	dataptrs[faila] = recovi;
-	dataptrs[failb] = recovj;
+	dataptrs[faila] = test_recov_buffers[0];
+	dataptrs[failb] = test_recov_buffers[1];
 
 	if (faila > failb)
 		swap(faila, failb);
@@ -83,18 +85,20 @@ static void test_recover(struct kunit *test, int faila, int failb)
 		ta->recov->data2(NDISKS, PAGE_SIZE, faila, failb, dataptrs);
 	}
 
-	KUNIT_EXPECT_MEMEQ_MSG(test, data[faila], recovi, PAGE_SIZE,
+	KUNIT_EXPECT_MEMEQ_MSG(test, test_buffers[faila], test_recov_buffers[0],
+			PAGE_SIZE,
 			"faila miscompared: %3d[%c] (failb=%3d[%c])\n",
 			faila, member_type(faila),
 			failb, member_type(failb));
-	KUNIT_EXPECT_MEMEQ_MSG(test, data[failb], recovj, PAGE_SIZE,
+	KUNIT_EXPECT_MEMEQ_MSG(test, test_buffers[failb], test_recov_buffers[1],
+			PAGE_SIZE,
 			"failb miscompared: %3d[%c] (faila=%3d[%c])\n",
 			failb, member_type(failb),
 			faila, member_type(faila));
 
 skip:
-	dataptrs[faila] = data[faila];
-	dataptrs[failb] = data[failb];
+	dataptrs[faila] = test_buffers[faila];
+	dataptrs[failb] = test_buffers[failb];
 }
 
 static void raid6_test(struct kunit *test)
@@ -103,8 +107,8 @@ static void raid6_test(struct kunit *test)
 	int i, j, p1, p2;
 
 	/* Nuke syndromes */
-	memset(data[NDISKS - 2], 0xee, PAGE_SIZE);
-	memset(data[NDISKS - 1], 0xee, PAGE_SIZE);
+	memset(test_buffers[NDISKS - 2], 0xee, PAGE_SIZE);
+	memset(test_buffers[NDISKS - 1], 0xee, PAGE_SIZE);
 
 	/* Generate assumed good syndrome */
 	ta->gen->gen_syndrome(NDISKS, PAGE_SIZE, (void **)&dataptrs);
@@ -163,16 +167,55 @@ static struct kunit_case raid6_test_cases[] = {
 
 static int raid6_suite_init(struct kunit_suite *suite)
 {
+	int i;
+
 	prandom_seed_state(&rng, RAID6_KUNIT_SEED);
-	makedata(0, NDISKS - 1);
 	memset(&args, 0, sizeof(args));
+
+	/*
+	 * Allocate the test buffer using vmalloc() with a page-aligned length
+	 * so that it is immediately followed by a guard page.  This allows
+	 * buffer overreads to be detected, even in assembly code.
+	 */
+	for (i = 0; i < RAID6_KUNIT_MAX_FAILURES; i++) {
+		test_recov_buffers[i] = vmalloc(PAGE_SIZE);
+		if (!test_recov_buffers[i])
+			goto out_free_recov_buffers;
+	}
+	for (i = 0; i < NDISKS; i++) {
+		test_buffers[i] = vmalloc(PAGE_SIZE);
+		if (!test_buffers[i])
+			goto out_free_buffers;
+	}
+
+	makedata(0, NDISKS - 1);
+
 	return 0;
+
+out_free_buffers:
+	for (i = 0; i < NDISKS; i++)
+		vfree(test_buffers[i]);
+out_free_recov_buffers:
+	for (i = 0; i < RAID6_KUNIT_MAX_FAILURES; i++)
+		vfree(test_recov_buffers[i]);
+	return -ENOMEM;
+}
+
+static void raid6_suite_exit(struct kunit_suite *suite)
+{
+	int i;
+
+	for (i = 0; i < NDISKS; i++)
+		vfree(test_buffers[i]);
+	for (i = 0; i < RAID6_KUNIT_MAX_FAILURES; i++)
+		vfree(test_recov_buffers[i]);
 }
 
 static struct kunit_suite raid6_test_suite = {
 	.name		= "raid6",
 	.test_cases	= raid6_test_cases,
 	.suite_init	= raid6_suite_init,
+	.suite_exit	= raid6_suite_exit,
 };
 kunit_test_suite(raid6_test_suite);
 
-- 
2.47.3


