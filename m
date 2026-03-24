Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F7AF532C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 06:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fStmksvtywXlbYrMkIeKxeAAlIJznjKfNiH+KK7VUOE=; b=utNUNTJM/VtahXg/jtHJ2Ulzqu
	olHux4XQhRnQm6k+OsJMFj8CbcUa8XosozCyw47O8DZeV5QL0OGoaAPRkmvEnk37am6U1q88HXuV6
	dplZ0pDKmYAFrKkHCCaCJ/m6AK1CaKTlAKJ+XBhOaD/f85lXDkqXxb/Z0zbmQ/IV4oinUi+QvTGHl
	Fmq2H+Tm2E/J1hyoYTdHMLje+LqvBZrYzEM2h3MKD+H6dmQISK+UmnWvdHVenHFvcH8QlTOCANY/G
	bxNBSqhBkeAz7pp2J4gVldeecoeC/P5fJZB7Th15oue5GZlIIXe7BkWfamGjgFCa/k8b0oIFXbDYH
	aEKHZEcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vVv-00000000p8N-3PTc;
	Tue, 24 Mar 2026 06:45:19 +0000
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vVt-00000000ovK-05zE;
	Tue, 24 Mar 2026 06:45:17 +0000
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
Subject: [PATCH 17/17] raid6_kunit: randomize buffer alignment
Date: Tue, 24 Mar 2026 07:40:52 +0100
Message-ID: <20260324064115.3217136-18-hch@lst.de>
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

Add code to add random alignment to the buffers to test the case where
they are not page aligned, and to move the buffers to the end of the
allocation so that they are next to the vmalloc guard page.

This does not include the recovery buffers as the recovery requires
page alignment.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 lib/raid/raid6/tests/raid6_kunit.c | 41 +++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/lib/raid/raid6/tests/raid6_kunit.c b/lib/raid/raid6/tests/raid6_kunit.c
index a0a473643e91..d2fd4a9b74d4 100644
--- a/lib/raid/raid6/tests/raid6_kunit.c
+++ b/lib/raid/raid6/tests/raid6_kunit.c
@@ -20,6 +20,7 @@ MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 
 static struct rnd_state rng;
 static void *test_buffers[RAID6_KUNIT_MAX_BUFFERS];
+static void *aligned_buffers[RAID6_KUNIT_MAX_BUFFERS];
 static void *test_recov_buffers[RAID6_KUNIT_MAX_FAILURES];
 static size_t test_buflen;
 
@@ -43,6 +44,14 @@ static unsigned int random_length(unsigned int max_length)
 	return (rand32() % (max_length + 1)) & ~511;
 }
 
+/* Generate a random alignment that is a multiple of 64. */
+static unsigned int random_alignment(unsigned int max_alignment)
+{
+	if (max_alignment == 0)
+		return 0;
+	return (rand32() % (max_alignment + 1)) & ~63;
+}
+
 static void makedata(int start, int stop)
 {
 	int i;
@@ -73,7 +82,7 @@ static void test_recover_one(struct kunit *test, unsigned int nr_buffers,
 	for (i = 0; i < RAID6_KUNIT_MAX_FAILURES; i++)
 		memset(test_recov_buffers[i], 0xf0, test_buflen);
 
-	memcpy(dataptrs, test_buffers, sizeof(dataptrs));
+	memcpy(dataptrs, aligned_buffers, sizeof(dataptrs));
 	dataptrs[faila] = test_recov_buffers[0];
 	dataptrs[failb] = test_recov_buffers[1];
 
@@ -95,13 +104,13 @@ static void test_recover_one(struct kunit *test, unsigned int nr_buffers,
 		ta->recov->data2(nr_buffers, len, faila, failb, dataptrs);
 	}
 
-	KUNIT_EXPECT_MEMEQ_MSG(test, test_buffers[faila], test_recov_buffers[0],
+	KUNIT_EXPECT_MEMEQ_MSG(test, aligned_buffers[faila], dataptrs[faila],
 			len,
 			"faila miscompared: %3d[%c] buffers %u len %u (failb=%3d[%c])\n",
 			faila, member_type(nr_buffers, faila),
 			nr_buffers, len,
 			failb, member_type(nr_buffers, failb));
-	KUNIT_EXPECT_MEMEQ_MSG(test, test_buffers[failb], test_recov_buffers[1],
+	KUNIT_EXPECT_MEMEQ_MSG(test, aligned_buffers[failb], dataptrs[failb],
 			len,
 			"failb miscompared: %3d[%c] buffers %u len %u (faila=%3d[%c])\n",
 			failb, member_type(nr_buffers, failb),
@@ -140,9 +149,9 @@ static void test_rmw_one(struct kunit *test, unsigned int nr_buffers,
 {
 	const struct test_args *ta = test->param_value;
 
-	ta->gen->xor_syndrome(nr_buffers, p1, p2, len, test_buffers);
+	ta->gen->xor_syndrome(nr_buffers, p1, p2, len, aligned_buffers);
 	makedata(p1, p2);
-	ta->gen->xor_syndrome(nr_buffers, p1, p2, len, test_buffers);
+	ta->gen->xor_syndrome(nr_buffers, p1, p2, len, aligned_buffers);
 	test_recover(test, nr_buffers, len);
 }
 
@@ -168,13 +177,33 @@ static void raid6_test_one(struct kunit *test)
 	unsigned int nr_buffers =
 		(rand32() % (RAID6_KUNIT_MAX_BUFFERS - 2)) + 3;
 	unsigned int len = random_length(RAID6_KUNIT_MAX_BYTES);
+	unsigned int max_alignment;
+	int i;
 
 	/* Nuke syndromes */
 	memset(test_buffers[nr_buffers - 2], 0xee, test_buflen);
 	memset(test_buffers[nr_buffers - 1], 0xee, test_buflen);
 
+	/*
+	 * If we're not using the entire buffer size, inject randomize alignment
+	 * into the buffer.
+	 */
+	max_alignment = RAID6_KUNIT_MAX_BYTES - len;
+	if (rand32() % 2 == 0) {
+		/* Use random alignments mod 64 */
+		for (i = 0; i < nr_buffers; i++)
+			aligned_buffers[i] = test_buffers[i] +
+				random_alignment(max_alignment);
+	} else {
+		/* Go up to the guard page, to catch buffer overreads */
+		unsigned int align = test_buflen - len;
+
+		for (i = 0; i < nr_buffers; i++)
+			aligned_buffers[i] = test_buffers[i] + align;
+	}
+
 	/* Generate assumed good syndrome */
-	ta->gen->gen_syndrome(nr_buffers, len, test_buffers);
+	ta->gen->gen_syndrome(nr_buffers, len, aligned_buffers);
 
 	test_recover(test, nr_buffers, len);
 
-- 
2.47.3


