Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B7BCD4F50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 05:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9R537ys66SDQq4UyRsVqig8kco2STTEA250dwLwyPU=; b=FmM5nyAfyifjvvd4RCSUeiPJUp
	VmeVvUVpQsyLsI+3QWPfmMcBhiJZSoec/UyZPPukORualVVkYVFeS3n248G7Cy1lljkm/iGCvwpXK
	VbJUTaaJDCEjlkXwO/7bZ7BBpcfNIew6lRji8Cty1QM+fzguflSrYHVnC+RU+/NLth2Ryocuh/aIO
	PwXDcJI2RuX/2En0GwbwVvHgB6V7l5ai5T0KMdLW9amcajZuvIaH4JDWTaoY6xt3jdozb/IPKiyuv
	yEnIs+lzOxQc+h1crkb51BEQWG5bFPRT/DNFMjNFfIQU1xCi1cGwIajjPSYoS90c3tdou0oBSiqly
	U/aFaluA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOqPa-0000000EHOw-1TGM;
	Mon, 18 May 2026 05:21:06 +0000
Received: from [2001:4bb8:2d1:6fdb:d67d:128c:34ba:85b8] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOqPX-0000000EH97-322d;
	Mon, 18 May 2026 05:21:04 +0000
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
Subject: [PATCH 11/18] raid6: use static_call for gen_syndrom and xor_syndrom
Date: Mon, 18 May 2026 07:17:54 +0200
Message-ID: <20260518051804.462141-12-hch@lst.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260518051804.462141-1-hch@lst.de>
References: <20260518051804.462141-1-hch@lst.de>
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

Avoid indirect calls for P/Q parity generation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Ard Biesheuvel <ardb@kernel.org>
Tested-by: Ard Biesheuvel <ardb@kernel.org> # kunit only on arm64
---
 lib/raid/raid6/algos.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/lib/raid/raid6/algos.c b/lib/raid/raid6/algos.c
index 30d7cb34874f..ff99202cad46 100644
--- a/lib/raid/raid6/algos.c
+++ b/lib/raid/raid6/algos.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/gfp.h>
 #include <linux/raid/pq.h>
+#include <linux/static_call.h>
 #include <kunit/visibility.h>
 #include "algos.h"
 
@@ -23,7 +24,8 @@ static unsigned int raid6_nr_algos;
 static const struct raid6_recov_calls *raid6_recov_algo;
 
 /* Selected algorithm */
-static struct raid6_calls raid6_call;
+DEFINE_STATIC_CALL_NULL(raid6_gen_syndrome_impl, *raid6_intx1.gen_syndrome);
+DEFINE_STATIC_CALL_NULL(raid6_xor_syndrome_impl, *raid6_intx1.xor_syndrome);
 
 /**
  * raid6_gen_syndrome - generate RAID6 P/Q parity
@@ -48,7 +50,7 @@ void raid6_gen_syndrome(int disks, size_t bytes, void **ptrs)
 	WARN_ON_ONCE(bytes & 511);
 	WARN_ON_ONCE(disks < RAID6_MIN_DISKS);
 
-	raid6_call.gen_syndrome(disks, bytes, ptrs);
+	static_call(raid6_gen_syndrome_impl)(disks, bytes, ptrs);
 }
 EXPORT_SYMBOL_GPL(raid6_gen_syndrome);
 
@@ -85,7 +87,7 @@ void raid6_xor_syndrome(int disks, int start, int stop, size_t bytes,
 	WARN_ON_ONCE(disks < RAID6_MIN_DISKS);
 	WARN_ON_ONCE(stop < start);
 
-	raid6_call.xor_syndrome(disks, start, stop, bytes, ptrs);
+	static_call(raid6_xor_syndrome_impl)(disks, start, stop, bytes, ptrs);
 }
 EXPORT_SYMBOL_GPL(raid6_xor_syndrome);
 
@@ -96,7 +98,7 @@ EXPORT_SYMBOL_GPL(raid6_xor_syndrome);
  */
 bool raid6_can_xor_syndrome(void)
 {
-	return !!raid6_call.xor_syndrome;
+	return !!static_call_query(raid6_xor_syndrome_impl);
 }
 EXPORT_SYMBOL_GPL(raid6_can_xor_syndrome);
 
@@ -195,7 +197,8 @@ static int raid6_choose_gen(void *(*const dptrs)[RAID6_TEST_DISKS],
 		return -EINVAL;
 	}
 
-	raid6_call = *best;
+	static_call_update(raid6_gen_syndrome_impl, best->gen_syndrome);
+	static_call_update(raid6_xor_syndrome_impl, best->xor_syndrome);
 
 	pr_info("raid6: using algorithm %s gen() %ld MB/s\n",
 		best->name,
@@ -240,7 +243,10 @@ static int __init raid6_select_algo(void)
 	if (!IS_ENABLED(CONFIG_RAID6_PQ_BENCHMARK) || raid6_nr_algos == 1) {
 		pr_info("raid6: skipped pq benchmark and selected %s\n",
 			raid6_algos[raid6_nr_algos - 1]->name);
-		raid6_call = *raid6_algos[raid6_nr_algos - 1];
+		static_call_update(raid6_gen_syndrome_impl,
+				raid6_algos[raid6_nr_algos - 1]->gen_syndrome);
+		static_call_update(raid6_xor_syndrome_impl,
+				raid6_algos[raid6_nr_algos - 1]->xor_syndrome);
 		return 0;
 	}
 
-- 
2.53.0


