Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D07CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 05:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cqy6EJ+DAAyM/VnpEUPz3z/s1EsfdtWJN6hwAdKq4KU=; b=dA+bvMxwTXNFBWA4rktLYn2AmU
	fyLeROFAbNdP2ET3s+/UjcIHdVuqBhYc8r+JSfUwi8ulbpYvIh8tMahc1/gesA0pdlQ6aSFAV85gp
	7T9aTDZUbDRazae6zKvj7kfRFTjGtV8FfZVv4/cDO5XTbpQnsJNhpVb60P1cok2eS+YjtWmy4F/Pq
	GRfUsSdU7sLe/lBU2mHJ/gKiXlyxnEG8IMsM4Zwtv72aIyGcQyrrU63h51DdrzAJxbQfFjoEsiwst
	1sHFC8AqaDhKTxUXkQ0/CqMmVPt0X3R0NeSwz1z3qCvXdc/hUV5hppyt5uRdQbUdQaK/zMEUNkLaz
	HYRZg/fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfcn-0000000Fd7k-3Vx7;
	Tue, 12 May 2026 05:25:45 +0000
Received: from 2a02-8389-2341-5b80-decc-1a96-daaa-a2cc.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:decc:1a96:daaa:a2cc] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfcl-0000000Fcw6-1H8r;
	Tue, 12 May 2026 05:25:43 +0000
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
Subject: [PATCH 16/19] raid6_kunit: cleanup dataptr handling
Date: Tue, 12 May 2026 07:20:56 +0200
Message-ID: <20260512052230.2947683-17-hch@lst.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260512052230.2947683-1-hch@lst.de>
References: <20260512052230.2947683-1-hch@lst.de>
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

Move the global dataptr array into test_recover() as all sites that fill
data or parity can use test_buffers directly, and this localized the
override for the failed slots to the recovery testing routine.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 lib/raid/raid6/tests/raid6_kunit.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/lib/raid/raid6/tests/raid6_kunit.c b/lib/raid/raid6/tests/raid6_kunit.c
index a4b65ccc9d20..28b4467977c5 100644
--- a/lib/raid/raid6/tests/raid6_kunit.c
+++ b/lib/raid/raid6/tests/raid6_kunit.c
@@ -18,7 +18,6 @@ MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 #define NDISKS		16	/* Including P and Q */
 
 static struct rnd_state rng;
-static void *dataptrs[NDISKS];
 static void *test_buffers[NDISKS];
 static void *test_recov_buffers[RAID6_KUNIT_MAX_FAILURES];
 
@@ -35,10 +34,8 @@ static void makedata(int start, int stop)
 {
 	int i;
 
-	for (i = start; i <= stop; i++) {
+	for (i = start; i <= stop; i++)
 		prandom_bytes_state(&rng, test_buffers[i], PAGE_SIZE);
-		dataptrs[i] = test_buffers[i];
-	}
 }
 
 static char member_type(int d)
@@ -56,11 +53,13 @@ static char member_type(int d)
 static void test_recover(struct kunit *test, int faila, int failb)
 {
 	const struct test_args *ta = test->param_value;
+	void *dataptrs[NDISKS];
 	int i;
 
 	for (i = 0; i < RAID6_KUNIT_MAX_FAILURES; i++)
 		memset(test_recov_buffers[i], 0xf0, PAGE_SIZE);
 
+	memcpy(dataptrs, test_buffers, sizeof(dataptrs));
 	dataptrs[faila] = test_recov_buffers[0];
 	dataptrs[failb] = test_recov_buffers[1];
 
@@ -70,7 +69,7 @@ static void test_recover(struct kunit *test, int faila, int failb)
 		 * is equivalent to a RAID-5 failure (XOR, then recompute Q).
 		 */
 		if (faila != NDISKS - 2)
-			goto skip;
+			return;
 
 		/* P+Q failure.  Just rebuild the syndrome. */
 		ta->gen->gen_syndrome(NDISKS, PAGE_SIZE, dataptrs);
@@ -92,10 +91,6 @@ static void test_recover(struct kunit *test, int faila, int failb)
 			"failb miscompared: %3d[%c] (faila=%3d[%c])\n",
 			failb, member_type(failb),
 			faila, member_type(faila));
-
-skip:
-	dataptrs[faila] = test_buffers[faila];
-	dataptrs[failb] = test_buffers[failb];
 }
 
 static void raid6_test(struct kunit *test)
@@ -108,7 +103,7 @@ static void raid6_test(struct kunit *test)
 	memset(test_buffers[NDISKS - 1], 0xee, PAGE_SIZE);
 
 	/* Generate assumed good syndrome */
-	ta->gen->gen_syndrome(NDISKS, PAGE_SIZE, (void **)&dataptrs);
+	ta->gen->gen_syndrome(NDISKS, PAGE_SIZE, test_buffers);
 
 	for (i = 0; i < NDISKS - 1; i++)
 		for (j = i + 1; j < NDISKS; j++)
@@ -121,10 +116,10 @@ static void raid6_test(struct kunit *test)
 		for (p2 = p1; p2 < NDISKS - 2; p2++) {
 			/* Simulate rmw run */
 			ta->gen->xor_syndrome(NDISKS, p1, p2, PAGE_SIZE,
-					(void **)&dataptrs);
+					test_buffers);
 			makedata(p1, p2);
 			ta->gen->xor_syndrome(NDISKS, p1, p2, PAGE_SIZE,
-					(void **)&dataptrs);
+					test_buffers);
 
 			for (i = 0; i < NDISKS - 1; i++)
 				for (j = i + 1; j < NDISKS; j++)
-- 
2.53.0


