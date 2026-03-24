Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C65F532E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 06:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5pfyRkCL6UBpVyH22oNsv600en31GzFI3N/5vNKjvw=; b=FQUioccx04Z/vAII4rLt9hYYpV
	ro1RUSLOdHz0TaE7zGrHUITj5HvUBrL4WnuoFtlM7+C0Os3kMj8QtX6LIa+WWRy8kc4GYY8ZfQ1vp
	jQ6YuQGHFRca6uHBiXkOvmeqKwdBKvkDWgG5KUiCZgWIyD0m7XJGWjRdhbfeec05I35D+b7DZtYL9
	qggjgRKqlMcPViNpHNYVKUF0qFAi9XtMzwhKv5bpdJXbPyk2EckMeiLbOy3kNa51fgwiSdq8+t8Kl
	Prax1ZSo7FvXydCbFUyiD8mZzZ9ZO1g0QL/H3KzjFTUmdianmqA0YJqIqOXoASRUgFKKmwmhfJq2W
	dIr1eV+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vV9-00000000oJ3-3gxW;
	Tue, 24 Mar 2026 06:44:31 +0000
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vV6-00000000o4Y-0DC7;
	Tue, 24 Mar 2026 06:44:28 +0000
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
Subject: [PATCH 13/17] raid6_kunit: use KUNIT_CASE_PARAM
Date: Tue, 24 Mar 2026 07:40:48 +0100
Message-ID: <20260324064115.3217136-14-hch@lst.de>
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

The raid6 test combines various generation and recovery algorithms.  Use
KUNIT_CASE_PARAM and provide a generator that iterates over the possible
combinations instead of looping inside a single test instance.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 lib/raid/raid6/tests/raid6_kunit.c | 120 ++++++++++++++++-------------
 1 file changed, 68 insertions(+), 52 deletions(-)

diff --git a/lib/raid/raid6/tests/raid6_kunit.c b/lib/raid/raid6/tests/raid6_kunit.c
index abc854cf4a98..7095952ad8e3 100644
--- a/lib/raid/raid6/tests/raid6_kunit.c
+++ b/lib/raid/raid6/tests/raid6_kunit.c
@@ -21,6 +21,15 @@ static char data[NDISKS][PAGE_SIZE] __attribute__((aligned(PAGE_SIZE)));
 static char recovi[PAGE_SIZE] __attribute__((aligned(PAGE_SIZE)));
 static char recovj[PAGE_SIZE] __attribute__((aligned(PAGE_SIZE)));
 
+struct test_args {
+	unsigned int recov_idx;
+	const struct raid6_recov_calls *recov;
+	unsigned int gen_idx;
+	const struct raid6_calls *gen;
+};
+
+static struct test_args args;
+
 static void makedata(int start, int stop)
 {
 	int i;
@@ -43,9 +52,10 @@ static char member_type(int d)
 	}
 }
 
-static void test_disks(struct kunit *test, const struct raid6_calls *calls,
-		const struct raid6_recov_calls *ra, int faila, int failb)
+static void test_recover(struct kunit *test, int faila, int failb)
 {
+	const struct test_args *ta = test->param_value;
+
 	memset(recovi, 0xf0, PAGE_SIZE);
 	memset(recovj, 0xba, PAGE_SIZE);
 
@@ -64,25 +74,23 @@ static void test_disks(struct kunit *test, const struct raid6_calls *calls,
 			goto skip;
 
 		/* P+Q failure.  Just rebuild the syndrome. */
-		calls->gen_syndrome(NDISKS, PAGE_SIZE, dataptrs);
+		ta->gen->gen_syndrome(NDISKS, PAGE_SIZE, dataptrs);
 	} else if (failb == NDISKS - 2) {
 		/* data+P failure. */
-		ra->datap(NDISKS, PAGE_SIZE, faila, dataptrs);
+		ta->recov->datap(NDISKS, PAGE_SIZE, faila, dataptrs);
 	} else {
 		/* data+data failure. */
-		ra->data2(NDISKS, PAGE_SIZE, faila, failb, dataptrs);
+		ta->recov->data2(NDISKS, PAGE_SIZE, faila, failb, dataptrs);
 	}
 
 	KUNIT_EXPECT_MEMEQ_MSG(test, data[faila], recovi, PAGE_SIZE,
-		"algo=%-8s/%-8s faila miscompared: %3d[%c] (failb=%3d[%c])\n",
-	       calls->name, ra->name,
-	       faila, member_type(faila),
-	       failb, member_type(failb));
+			"faila miscompared: %3d[%c] (failb=%3d[%c])\n",
+			faila, member_type(faila),
+			failb, member_type(failb));
 	KUNIT_EXPECT_MEMEQ_MSG(test, data[failb], recovj, PAGE_SIZE,
-		"algo=%-8s/%-8s failb miscompared: %3d[%c] (faila=%3d[%c])\n",
-	       calls->name, ra->name,
-	       failb, member_type(failb),
-	       faila, member_type(faila));
+			"failb miscompared: %3d[%c] (faila=%3d[%c])\n",
+			failb, member_type(failb),
+			faila, member_type(faila));
 
 skip:
 	dataptrs[faila] = data[faila];
@@ -91,58 +99,65 @@ static void test_disks(struct kunit *test, const struct raid6_calls *calls,
 
 static void raid6_test(struct kunit *test)
 {
+	const struct test_args *ta = test->param_value;
 	int i, j, p1, p2;
-	unsigned int r, g;
-
-	for (r = 0; ; r++) {
-		const struct raid6_recov_calls *ra = raid6_recov_algo_find(r);
-
-		if (!ra)
-			break;
-
-		for (g = 0; ; g++) {
-			const struct raid6_calls *calls = raid6_algo_find(g);
-
-			if (!calls)
-				break;
 
-			/* Nuke syndromes */
-			memset(data[NDISKS - 2], 0xee, PAGE_SIZE);
-			memset(data[NDISKS - 1], 0xee, PAGE_SIZE);
+	/* Nuke syndromes */
+	memset(data[NDISKS - 2], 0xee, PAGE_SIZE);
+	memset(data[NDISKS - 1], 0xee, PAGE_SIZE);
 
-			/* Generate assumed good syndrome */
-			calls->gen_syndrome(NDISKS, PAGE_SIZE,
-						(void **)&dataptrs);
+	/* Generate assumed good syndrome */
+	ta->gen->gen_syndrome(NDISKS, PAGE_SIZE, (void **)&dataptrs);
 
-			for (i = 0; i < NDISKS-1; i++)
-				for (j = i+1; j < NDISKS; j++)
-					test_disks(test, calls, ra, i, j);
+	for (i = 0; i < NDISKS - 1; i++)
+		for (j = i + 1; j < NDISKS; j++)
+			test_recover(test, i, j);
 
-			if (!calls->xor_syndrome)
-				continue;
+	if (!ta->gen->xor_syndrome)
+		return;
 
-			for (p1 = 0; p1 < NDISKS-2; p1++)
-				for (p2 = p1; p2 < NDISKS-2; p2++) {
+	for (p1 = 0; p1 < NDISKS - 2; p1++) {
+		for (p2 = p1; p2 < NDISKS - 2; p2++) {
+			/* Simulate rmw run */
+			ta->gen->xor_syndrome(NDISKS, p1, p2, PAGE_SIZE,
+					(void **)&dataptrs);
+			makedata(p1, p2);
+			ta->gen->xor_syndrome(NDISKS, p1, p2, PAGE_SIZE,
+					(void **)&dataptrs);
 
-					/* Simulate rmw run */
-					calls->xor_syndrome(NDISKS, p1, p2, PAGE_SIZE,
-								(void **)&dataptrs);
-					makedata(p1, p2);
-					calls->xor_syndrome(NDISKS, p1, p2, PAGE_SIZE,
-                                                                (void **)&dataptrs);
+			for (i = 0; i < NDISKS - 1; i++)
+				for (j = i + 1; j < NDISKS; j++)
+					test_recover(test, i, j);
+		}
+	}
+}
 
-					for (i = 0; i < NDISKS-1; i++)
-						for (j = i+1; j < NDISKS; j++)
-							test_disks(test, calls,
-									ra, i, j);
-				}
+static const void *raid6_gen_params(struct kunit *test, const void *prev,
+		char *desc)
+{
+	if (!args.gen) {
+next_algo:
+		args.recov_idx = 0;
+		args.gen = raid6_algo_find(args.gen_idx);
+		if (!args.gen)
+			return NULL;
+	}
 
-		}
+	if (args.recov)
+		args.recov_idx++;
+	args.recov = raid6_recov_algo_find(args.recov_idx);
+	if (!args.recov) {
+		args.gen_idx++;
+		goto next_algo;
 	}
+
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "gen=%s recov=%s",
+			args.gen->name, args.recov->name);
+	return &args;
 }
 
 static struct kunit_case raid6_test_cases[] = {
-	KUNIT_CASE(raid6_test),
+	KUNIT_CASE_PARAM(raid6_test, raid6_gen_params),
 	{},
 };
 
@@ -150,6 +165,7 @@ static int raid6_suite_init(struct kunit_suite *suite)
 {
 	prandom_seed_state(&rng, RAID6_KUNIT_SEED);
 	makedata(0, NDISKS - 1);
+	memset(&args, 0, sizeof(args));
 	return 0;
 }
 
-- 
2.47.3


