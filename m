Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9280D5B175
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 15:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c1HVE5iTJsVXawLpc/SH/1Lz2/bA9CTwze4YimX69RY=; b=zcki3AkCwV0H+8ZR6MfHGOrx66
	+jeZgNbfbf1P28uUWbv44GP5lszYE6e4bxxMdgu9F1qr6FBuh4UoiLRe8afmhBeXWOv8u/iC9Iq1+
	9YVG+l9HiVFDtXufFTscTVI20vz4bagyOC+Twgl4MFVnPJg14SzSw0kkBAw1awRLSHJEXn8x2oWn5
	/PCDwpwB4AVr1h1UdJjwSCAX7Uxp2l9WowBNsq1F5CKaWknOf3joT64LJsAmPvOW4vtnfR8z8t7nO
	iC38K76uPJOL98kiQh1mMnP9qaXSle2plU5d3W4SjJgUrA65DfAIgLCeF8kL7SaVXP8o6zyfhBUY8
	9IwjI6GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVA8C-00000003qvE-3gSL;
	Mon, 15 Dec 2025 15:05:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVA89-00000003qsE-21Lu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 15:04:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62D991713;
	Mon, 15 Dec 2025 07:04:49 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41F803F73B;
	Mon, 15 Dec 2025 07:04:51 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Woodhouse <dwmw2@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jann Horn <jannh@google.com>,
	Juergen Gross <jgross@suse.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	x86@kernel.org
Subject: [PATCH v6 14/14] mm: Add basic tests for lazy_mmu
Date: Mon, 15 Dec 2025 15:03:23 +0000
Message-ID: <20251215150323.2218608-15-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251215150323.2218608-1-kevin.brodsky@arm.com>
References: <20251215150323.2218608-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_070457_640116_C354D458 
X-CRM114-Status: GOOD (  17.81  )
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

Add basic KUnit tests for the generic aspects of the lazy MMU mode:
ensure that it appears active when it should, depending on how
enable/disable and pause/resume pairs are nested.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 mm/Kconfig                     | 12 ++++++
 mm/Makefile                    |  1 +
 mm/tests/lazy_mmu_mode_kunit.c | 71 ++++++++++++++++++++++++++++++++++
 3 files changed, 84 insertions(+)
 create mode 100644 mm/tests/lazy_mmu_mode_kunit.c

diff --git a/mm/Kconfig b/mm/Kconfig
index 62073bd61544..ac48deb44884 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1471,6 +1471,18 @@ config ARCH_HAS_LAZY_MMU_MODE
 	  MMU-related architectural state to be deferred until the mode is
 	  exited. See <linux/pgtable.h> for details.
 
+config LAZY_MMU_MODE_KUNIT_TEST
+	tristate "KUnit tests for the lazy MMU mode" if !KUNIT_ALL_TESTS
+	depends on ARCH_HAS_LAZY_MMU_MODE
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  Enable this option to check that the lazy MMU mode interface behaves
+	  as expected. Only tests for the generic interface are included (not
+	  architecture-specific behaviours).
+
+	  If unsure, say N.
+
 source "mm/damon/Kconfig"
 
 endmenu
diff --git a/mm/Makefile b/mm/Makefile
index 2d0570a16e5b..9175f8cc6565 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -147,3 +147,4 @@ obj-$(CONFIG_SHRINKER_DEBUG) += shrinker_debug.o
 obj-$(CONFIG_EXECMEM) += execmem.o
 obj-$(CONFIG_TMPFS_QUOTA) += shmem_quota.o
 obj-$(CONFIG_PT_RECLAIM) += pt_reclaim.o
+obj-$(CONFIG_LAZY_MMU_MODE_KUNIT_TEST) += tests/lazy_mmu_mode_kunit.o
diff --git a/mm/tests/lazy_mmu_mode_kunit.c b/mm/tests/lazy_mmu_mode_kunit.c
new file mode 100644
index 000000000000..2720eb995714
--- /dev/null
+++ b/mm/tests/lazy_mmu_mode_kunit.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <kunit/test.h>
+#include <linux/pgtable.h>
+
+static void expect_not_active(struct kunit *test)
+{
+	KUNIT_EXPECT_FALSE(test, is_lazy_mmu_mode_active());
+}
+
+static void expect_active(struct kunit *test)
+{
+	KUNIT_EXPECT_TRUE(test, is_lazy_mmu_mode_active());
+}
+
+static void lazy_mmu_mode_active(struct kunit *test)
+{
+	expect_not_active(test);
+
+	lazy_mmu_mode_enable();
+	expect_active(test);
+
+	{
+		/* Nested section */
+		lazy_mmu_mode_enable();
+		expect_active(test);
+
+		lazy_mmu_mode_disable();
+		expect_active(test);
+	}
+
+	{
+		/* Paused section */
+		lazy_mmu_mode_pause();
+		expect_not_active(test);
+
+		{
+			/* No effect (paused) */
+			lazy_mmu_mode_enable();
+			expect_not_active(test);
+
+			lazy_mmu_mode_disable();
+			expect_not_active(test);
+
+			lazy_mmu_mode_pause();
+			expect_not_active(test);
+
+			lazy_mmu_mode_resume();
+			expect_not_active(test);
+		}
+
+		lazy_mmu_mode_resume();
+		expect_active(test);
+	}
+
+	lazy_mmu_mode_disable();
+	expect_not_active(test);
+}
+
+static struct kunit_case lazy_mmu_mode_test_cases[] = {
+	KUNIT_CASE(lazy_mmu_mode_active),
+	{}
+};
+
+static struct kunit_suite lazy_mmu_mode_test_suite = {
+	.name = "lazy_mmu_mode",
+	.test_cases = lazy_mmu_mode_test_cases,
+};
+kunit_test_suite(lazy_mmu_mode_test_suite);
+
+MODULE_DESCRIPTION("Tests for the lazy MMU mode");
+MODULE_LICENSE("GPL");
-- 
2.51.2


