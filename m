Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353A2CD484E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 05:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eieqJh591jkivWgUpSd0uAjJTAcruVOirF8ZRJ69/fk=; b=AMLl+kFl0U4AfXLgkqsQzagxnr
	sQ11FAPqGjAnhaHvlRSrsKYuIIdiTnR2cc1O56Uv9SWuajWuuTJ2A7BE0ZhGyaeK2jNqFmDF5qTZ9
	c4UV/TcUkhRS9iCTiGgYq+B7y73nQeCz0yD8LZxWe6fDBW+UZ1WKV8shRxYloAVAoYBIn9Uiij1MU
	c8CyEmwq0UafgB5Oyb4/clYkRTKcXwCD1zjg292qtUD2H+FUj4wCUBeu+YHTGlsU4tq0p2OkqQW2t
	L6Wn7MuXOnmibz6i7WaOeGM91MDDe6F8AdlXebEFxMRKm3JmK6J2KReRgO/L2m0m0CeJEsbAD8XHv
	8tR3EbUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfd8-0000000FdPm-3hhL;
	Tue, 12 May 2026 05:26:06 +0000
Received: from 2a02-8389-2341-5b80-decc-1a96-daaa-a2cc.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:decc:1a96:daaa:a2cc] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMfd7-0000000FdFG-1HIB;
	Tue, 12 May 2026 05:26:05 +0000
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
Subject: [PATCH 18/19] raid6_kunit: randomize parameters and increase limits
Date: Tue, 12 May 2026 07:20:58 +0200
Message-ID: <20260512052230.2947683-19-hch@lst.de>
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

The current test has double-quadratic behavior in the selection for
the updated ("XORed") disks, and in the selection of updated pointers,
which makes scaling it to more tests difficult.  At the same time it
only ever tests with the maximum number of disks, which leaves a
coverage hole for smaller ones.

Fix this by randomizing the total number, failed disks and regions
to update, and increasing the upper number of tests disks.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 lib/raid/raid6/tests/raid6_kunit.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/lib/raid/raid6/tests/raid6_kunit.c b/lib/raid/raid6/tests/raid6_kunit.c
index 775a0051f9a4..d6ac777dcaee 100644
--- a/lib/raid/raid6/tests/raid6_kunit.c
+++ b/lib/raid/raid6/tests/raid6_kunit.c
@@ -8,6 +8,7 @@
 #include <kunit/test.h>
 #include <linux/prandom.h>
 #include <linux/vmalloc.h>
+#include <linux/raid/pq.h>
 #include "../algos.h"
 
 MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
@@ -43,6 +44,12 @@ static unsigned int random_length(unsigned int max_length)
 	return round_up((rand32() % max_length) + 1, 512);
 }
 
+static unsigned int random_nr_buffers(void)
+{
+	return (rand32() % (RAID6_KUNIT_MAX_BUFFERS - (RAID6_MIN_DISKS - 1))) +
+			RAID6_MIN_DISKS;
+}
+
 static void makedata(int start, int stop)
 {
 	int i;
@@ -169,9 +176,7 @@ static void test_rmw(struct kunit *test, unsigned int nr_buffers,
 static void raid6_test_one(struct kunit *test)
 {
 	const struct test_args *ta = test->param_value;
-	/* including P/Q we need at least three buffers */
-	unsigned int nr_buffers =
-		(rand32() % (RAID6_KUNIT_MAX_BUFFERS - 2)) + 3;
+	unsigned int nr_buffers = random_nr_buffers();
 	unsigned int len = random_length(RAID6_KUNIT_MAX_BYTES);
 
 	/* Nuke syndromes */
-- 
2.53.0


