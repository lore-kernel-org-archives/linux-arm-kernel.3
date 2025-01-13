Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2265DC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 17:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+b1vwyUt9X+x+fq4vNsQWkXSJqfTlOBMiVr4yBA8vrE=; b=eIjnf7nXiYCgyh37cOMAHl8z5C
	rJlXXcrSj6sPwciV8Ahqoyee6st6mcUNIFtsxkoQHWKWCKrgoSS1iNY9U/3b0yu4LIXKfvk5jnIya
	hYVo4ul84zz37bt02pQ0VHAnKRBiYeqQVQrny6J5ErFodM41e9/POPIonHhyjRqBe563tESHPkr4T
	jVbsC3g9EHA4Xjif7zsehwp+eNkjI4byvYjKM6sv+QR6YR2o8qmWl4tm1pmqut3KzEsP1lXugs0Zh
	PixjUQsuiKyq3zMwSpt8BG3Lf9HTtMjTpzJTNuTNG3ww4+VS6XpAC8fBqykw7Xd1BER4t7MkhUGI2
	9QBvQJ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNxE-00000005zX8-3Yio;
	Mon, 13 Jan 2025 17:10:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNtp-00000005yrn-1MoZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 17:06:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA6671A25;
	Mon, 13 Jan 2025 09:07:16 -0800 (PST)
Received: from udebian.localdomain (unknown [10.1.25.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D4483F673;
	Mon, 13 Jan 2025 09:06:46 -0800 (PST)
From: Yury Khrustalev <yury.khrustalev@arm.com>
To: linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sandipan Das <sandipan@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	nd@arm.com,
	Yury Khrustalev <yury.khrustalev@arm.com>
Subject: [RESEND v4 2/3] selftests/mm: Use PKEY_UNRESTRICTED macro
Date: Mon, 13 Jan 2025 17:06:18 +0000
Message-Id: <20250113170619.484698-3-yury.khrustalev@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250113170619.484698-1-yury.khrustalev@arm.com>
References: <20250113170619.484698-1-yury.khrustalev@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_090649_453060_FAF6421A 
X-CRM114-Status: GOOD (  12.04  )
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

Replace literal 0 with macro PKEY_UNRESTRICTED where pkey_*() functions
are used in mm selftests for memory protection keys.

Signed-off-by: Yury Khrustalev <yury.khrustalev@arm.com>
Suggested-by: Joey Gouly <joey.gouly@arm.com>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
---
 tools/testing/selftests/mm/mseal_test.c            | 6 +++---
 tools/testing/selftests/mm/pkey-helpers.h          | 3 ++-
 tools/testing/selftests/mm/pkey_sighandler_tests.c | 4 ++--
 tools/testing/selftests/mm/protection_keys.c       | 2 +-
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/mm/mseal_test.c b/tools/testing/selftests/mm/mseal_test.c
index 01675c412b2a..30ea37e8ecf8 100644
--- a/tools/testing/selftests/mm/mseal_test.c
+++ b/tools/testing/selftests/mm/mseal_test.c
@@ -218,7 +218,7 @@ bool seal_support(void)
 bool pkey_supported(void)
 {
 #if defined(__i386__) || defined(__x86_64__) /* arch */
-	int pkey = sys_pkey_alloc(0, 0);
+	int pkey = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
 
 	if (pkey > 0)
 		return true;
@@ -1671,7 +1671,7 @@ static void test_seal_discard_ro_anon_on_pkey(bool seal)
 	setup_single_address_rw(size, &ptr);
 	FAIL_TEST_IF_FALSE(ptr != (void *)-1);
 
-	pkey = sys_pkey_alloc(0, 0);
+	pkey = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
 	FAIL_TEST_IF_FALSE(pkey > 0);
 
 	ret = sys_mprotect_pkey((void *)ptr, size, PROT_READ | PROT_WRITE, pkey);
@@ -1683,7 +1683,7 @@ static void test_seal_discard_ro_anon_on_pkey(bool seal)
 	}
 
 	/* sealing doesn't take effect if PKRU allow write. */
-	set_pkey(pkey, 0);
+	set_pkey(pkey, PKEY_UNRESTRICTED);
 	ret = sys_madvise(ptr, size, MADV_DONTNEED);
 	FAIL_TEST_IF_FALSE(!ret);
 
diff --git a/tools/testing/selftests/mm/pkey-helpers.h b/tools/testing/selftests/mm/pkey-helpers.h
index f7cfe163b0ff..10fa3ca9b05b 100644
--- a/tools/testing/selftests/mm/pkey-helpers.h
+++ b/tools/testing/selftests/mm/pkey-helpers.h
@@ -12,6 +12,7 @@
 #include <stdlib.h>
 #include <ucontext.h>
 #include <sys/mman.h>
+#include <linux/mman.h>
 
 #include "../kselftest.h"
 
@@ -224,7 +225,7 @@ static inline u32 *siginfo_get_pkey_ptr(siginfo_t *si)
 static inline int kernel_has_pkeys(void)
 {
 	/* try allocating a key and see if it succeeds */
-	int ret = sys_pkey_alloc(0, 0);
+	int ret = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
 	if (ret <= 0) {
 		return 0;
 	}
diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
index c593a426341c..2015ed7e0928 100644
--- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
+++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
@@ -314,7 +314,7 @@ static void test_sigsegv_handler_with_different_pkey_for_stack(void)
 	__write_pkey_reg(pkey_reg);
 
 	/* Protect the new stack with MPK 1 */
-	pkey = pkey_alloc(0, 0);
+	pkey = pkey_alloc(0, PKEY_UNRESTRICTED);
 	pkey_mprotect(stack, STACK_SIZE, PROT_READ | PROT_WRITE, pkey);
 
 	/* Set up alternate signal stack that will use the default MPK */
@@ -487,7 +487,7 @@ static void test_pkru_sigreturn(void)
 	__write_pkey_reg(pkey_reg);
 
 	/* Protect the stack with MPK 2 */
-	pkey = pkey_alloc(0, 0);
+	pkey = pkey_alloc(0, PKEY_UNRESTRICTED);
 	pkey_mprotect(stack, STACK_SIZE, PROT_READ | PROT_WRITE, pkey);
 
 	/* Set up alternate signal stack that will use the default MPK */
diff --git a/tools/testing/selftests/mm/protection_keys.c b/tools/testing/selftests/mm/protection_keys.c
index 4990f7ab4cb7..cca7435a7bc5 100644
--- a/tools/testing/selftests/mm/protection_keys.c
+++ b/tools/testing/selftests/mm/protection_keys.c
@@ -491,7 +491,7 @@ int sys_pkey_alloc(unsigned long flags, unsigned long init_val)
 int alloc_pkey(void)
 {
 	int ret;
-	unsigned long init_val = 0x0;
+	unsigned long init_val = PKEY_UNRESTRICTED;
 
 	dprintf1("%s()::%d, pkey_reg: 0x%016llx shadow: %016llx\n",
 			__func__, __LINE__, __read_pkey_reg(), shadow_pkey_reg);
-- 
2.39.5


