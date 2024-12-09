Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EB0E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOq30mCTMw8bLBxJLSt678CfNIOCZrff0ceauMXHs6E=; b=A4vIXOI357OJXOn1v8e31YpfLv
	6ifzlZ9uBV2w6ctHoOQO0gB09wIyWLZox4Rr5r9bBnMMFKNNA4h0RTSV4n29Uz2ZjENafGn11r0EL
	BBfZFI9Hdocf3hIWqRGjqaCSvY2CFplZNeMX1wSyLKd6QJc8urDrUVc1BTIzh4pGtBwWTzUhuQnhi
	+Y2WY54ClMtO+jsh1BqrcdI1FJXn15c5HQK1JQtdI6uwpxm2WRFviwJJiUrbin5mew9V3EvMO8KOr
	Goe/KsQ+X3H2oPAr4ASJKSBCgcpQ56PG6wd/BvyTn4e9uOC9HJnOPYXvDb5DT9ZW5LRi7o1PO8WF9
	Hi67vKiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaaj-00000007CKF-3KOv;
	Mon, 09 Dec 2024 10:02:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaPl-000000079MT-1pQq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 09:50:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20D711650;
	Mon,  9 Dec 2024 01:51:21 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 173E63F720;
	Mon,  9 Dec 2024 01:50:50 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	akpm@linux-foundation.org,
	aruna.ramakrishna@oracle.com,
	catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	joey.gouly@arm.com,
	keith.lucas@oracle.com,
	ryan.roberts@arm.com,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 06/14] selftests/mm: Remove unused pkey helpers
Date: Mon,  9 Dec 2024 09:50:11 +0000
Message-ID: <20241209095019.1732120-7-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241209095019.1732120-1-kevin.brodsky@arm.com>
References: <20241209095019.1732120-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_015053_562236_AEA8B551 
X-CRM114-Status: GOOD (  10.28  )
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

Commit 5f23f6d082a9 ("x86/pkeys: Add self-tests") introduced a
number of helpers and functions that don't seem to have ever been
used. Let's remove them.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 tools/testing/selftests/mm/pkey-helpers.h    | 34 --------------------
 tools/testing/selftests/mm/protection_keys.c | 34 --------------------
 2 files changed, 68 deletions(-)

diff --git a/tools/testing/selftests/mm/pkey-helpers.h b/tools/testing/selftests/mm/pkey-helpers.h
index f7cfe163b0ff..472febd992eb 100644
--- a/tools/testing/selftests/mm/pkey-helpers.h
+++ b/tools/testing/selftests/mm/pkey-helpers.h
@@ -26,9 +26,7 @@
 #ifndef DEBUG_LEVEL
 #define DEBUG_LEVEL 0
 #endif
-#define DPRINT_IN_SIGNAL_BUF_SIZE 4096
 extern int dprint_in_signal;
-extern char dprint_in_signal_buffer[DPRINT_IN_SIGNAL_BUF_SIZE];
 
 extern int test_nr;
 extern int iteration_nr;
@@ -171,38 +169,6 @@ static inline void write_pkey_reg(u64 pkey_reg)
 			pkey_reg, __read_pkey_reg());
 }
 
-/*
- * These are technically racy. since something could
- * change PKEY register between the read and the write.
- */
-static inline void __pkey_access_allow(int pkey, int do_allow)
-{
-	u64 pkey_reg = read_pkey_reg();
-	int bit = pkey * 2;
-
-	if (do_allow)
-		pkey_reg &= (1<<bit);
-	else
-		pkey_reg |= (1<<bit);
-
-	dprintf4("pkey_reg now: %016llx\n", read_pkey_reg());
-	write_pkey_reg(pkey_reg);
-}
-
-static inline void __pkey_write_allow(int pkey, int do_allow_write)
-{
-	u64 pkey_reg = read_pkey_reg();
-	int bit = pkey * 2 + 1;
-
-	if (do_allow_write)
-		pkey_reg &= (1<<bit);
-	else
-		pkey_reg |= (1<<bit);
-
-	write_pkey_reg(pkey_reg);
-	dprintf4("pkey_reg now: %016llx\n", read_pkey_reg());
-}
-
 #define ALIGN_UP(x, align_to)	(((x) + ((align_to)-1)) & ~((align_to)-1))
 #define ALIGN_DOWN(x, align_to) ((x) & ~((align_to)-1))
 #define ALIGN_PTR_UP(p, ptr_align_to)	\
diff --git a/tools/testing/selftests/mm/protection_keys.c b/tools/testing/selftests/mm/protection_keys.c
index 4990f7ab4cb7..fcbebc4490b4 100644
--- a/tools/testing/selftests/mm/protection_keys.c
+++ b/tools/testing/selftests/mm/protection_keys.c
@@ -53,7 +53,6 @@ int test_nr;
 
 u64 shadow_pkey_reg;
 int dprint_in_signal;
-char dprint_in_signal_buffer[DPRINT_IN_SIGNAL_BUF_SIZE];
 
 void cat_into_file(char *str, char *file)
 {
@@ -397,12 +396,6 @@ void signal_handler(int signum, siginfo_t *si, void *vucontext)
 	dprint_in_signal = 0;
 }
 
-int wait_all_children(void)
-{
-	int status;
-	return waitpid(-1, &status, 0);
-}
-
 void sig_chld(int x)
 {
 	dprint_in_signal = 1;
@@ -817,39 +810,12 @@ void *malloc_pkey_hugetlb(long size, int prot, u16 pkey)
 	return ptr;
 }
 
-void *malloc_pkey_mmap_dax(long size, int prot, u16 pkey)
-{
-	void *ptr;
-	int fd;
-
-	dprintf1("doing %s(size=%ld, prot=0x%x, pkey=%d)\n", __func__,
-			size, prot, pkey);
-	pkey_assert(pkey < NR_PKEYS);
-	fd = open("/dax/foo", O_RDWR);
-	pkey_assert(fd >= 0);
-
-	ptr = mmap(0, size, prot, MAP_SHARED, fd, 0);
-	pkey_assert(ptr != (void *)-1);
-
-	mprotect_pkey(ptr, size, prot, pkey);
-
-	record_pkey_malloc(ptr, size, prot);
-
-	dprintf1("mmap()'d for pkey %d @ %p\n", pkey, ptr);
-	close(fd);
-	return ptr;
-}
-
 void *(*pkey_malloc[])(long size, int prot, u16 pkey) = {
 
 	malloc_pkey_with_mprotect,
 	malloc_pkey_with_mprotect_subpage,
 	malloc_pkey_anon_huge,
 	malloc_pkey_hugetlb
-/* can not do direct with the pkey_mprotect() API:
-	malloc_pkey_mmap_direct,
-	malloc_pkey_mmap_dax,
-*/
 };
 
 void *malloc_pkey(long size, int prot, u16 pkey)
-- 
2.47.0


