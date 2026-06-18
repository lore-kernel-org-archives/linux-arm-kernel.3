Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25180CD98F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 09:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kx58UzGJ5PzxcjTsuUEJwFleVBmeQq5F4w9/tyaV6pU=; b=aepIfhBiAxGKY1esOLGjfYUOqt
	UJ7AC3b1+elajOibRr01spIN9cqnu/sq8/+rREgsFkYJbsjywaHnVLvKmfBJlDTrxipWFfeZVeVYY
	eeEbjAA8R6h5f9YTbypeHcucC7ys8aIOUmla222E+2K7wvpfgYV34EQ/ztu7PNlJkXzl2iEboltcw
	XrO9CsG3dP5AV0G2vSk3HRwjFswL4qT7scB58rTsAyrFr4cj7kuUtWtg21oTuW8Hh5LTJmPxICuen
	EI+TLzkgwDhuwl7sO4ePBufjN6BWZ7ILpT7JXZ9hRuCrPzqex+XMaSxzgUBMfBBFaJikKLtCw5Kv5
	UoUeC0xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8x2-00000000vga-3JMA;
	Thu, 18 Jun 2026 09:22:20 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8wy-00000000vbX-1loG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 09:22:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781774534; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=kx58UzGJ5PzxcjTsuUEJwFleVBmeQq5F4w9/tyaV6pU=;
	b=DSBZIv+5kKiJ1ab9YSR23H+n0IE8iP3XAfkjsmErU0z4KgWplebxibcmuHRBhXu4XOV8aa8btMw0ycCd72TjMKTV25aTLsQUOQJpAq4iRRwkYINydCumV+E2kFNq1wiEJZ7hGs4Ftjenqt9xB0NxnLixVX6GgJceJag0JtwXzwc=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=tianruidong@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X56UT.A_1781774529;
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0X56UT.A_1781774529 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 18 Jun 2026 17:22:12 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	rafael@kernel.org,
	tony.luck@intel.com,
	guohanjun@huawei.com,
	mchehab@kernel.org,
	xueshuai@linux.alibaba.com,
	tongtiangen@huawei.com,
	james.morse@arm.com,
	robin.murphy@arm.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	ryabinin.a.a@gmail.com,
	glider@google.com,
	christophe.leroy@csgroup.eu,
	aneesh.kumar@kernel.org,
	naveen.n.rao@linux.ibm.com,
	tglx@linutronix.de,
	mingo@redhat.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	tianruidong@linux.alibaba.com
Subject: [PATCH v15 8/9] lib/test: memcpy_kunit: add copy_page() and copy_mc_page() tests
Date: Thu, 18 Jun 2026 17:21:22 +0800
Message-ID: <20260618092124.3901230-9-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260618092124.3901230-1-tianruidong@linux.alibaba.com>
References: <20260618092124.3901230-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_022216_641132_91006716 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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

Add KUnit tests for copy_page() and copy_mc_page(), modeled after
the existing memcpy_test() style: a static page-aligned src and a
two-page dst, filled with random bytes plus non-zero edges, then
verify byte-for-byte equality and that the adjacent page is
untouched.

Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 lib/tests/memcpy_kunit.c | 67 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 66 insertions(+), 1 deletion(-)

diff --git a/lib/tests/memcpy_kunit.c b/lib/tests/memcpy_kunit.c
index d36933554e46..812c1fa20fd9 100644
--- a/lib/tests/memcpy_kunit.c
+++ b/lib/tests/memcpy_kunit.c
@@ -493,6 +493,67 @@ static void memmove_overlap_test(struct kunit *test)
 	}
 }
 
+/* --- Page-sized copy tests --- */
+
+static u8 page_src[PAGE_SIZE] __aligned(PAGE_SIZE);
+static u8 page_dst[PAGE_SIZE * 2] __aligned(PAGE_SIZE);
+static const u8 page_pattern[PAGE_SIZE] __aligned(PAGE_SIZE);
+
+static void init_page(struct kunit *test)
+{
+	/* Get many bit patterns. */
+	get_random_bytes(page_src, PAGE_SIZE);
+
+	/* Make sure we have non-zero edges. */
+	set_random_nonzero(test, &page_src[0]);
+	set_random_nonzero(test, &page_src[PAGE_SIZE - 1]);
+
+	memset(page_dst, 0xA5, ARRAY_SIZE(page_dst));
+	memset(page_pattern, 0xA5, PAGE_SIZE);
+}
+
+static void copy_page_test(struct kunit *test)
+{
+	init_page(test);
+
+	/* Copy. */
+	copy_page(page_dst, page_src);
+
+	/* Verify byte-for-byte exact. */
+	KUNIT_ASSERT_EQ_MSG(test,
+		memcmp(page_dst, page_src, PAGE_SIZE), 0,
+		"copy_page content mismatch with random data");
+
+	/* Verify no overflow into second page. */
+	KUNIT_ASSERT_EQ_MSG(test,
+		memcmp(page_dst + PAGE_SIZE, page_pattern, PAGE_SIZE), 0,
+		"copy_page overflow into adjacent page");
+}
+
+#ifdef __HAVE_ARCH_COPY_MC_PAGE
+static void copy_mc_page_test(struct kunit *test)
+{
+	int ret;
+
+	init_page(test);
+
+	/* Copy and check return value. */
+	ret = copy_mc_page(page_dst, page_src);
+	KUNIT_ASSERT_EQ_MSG(test, ret, 0,
+		"copy_mc_page returned %d on clean memory", ret);
+
+	/* Verify byte-for-byte exact. */
+	KUNIT_ASSERT_EQ_MSG(test,
+		memcmp(page_dst, page_src, PAGE_SIZE), 0,
+		"copy_mc_page content mismatch with random data");
+
+	/* Verify no overflow into second page. */
+	KUNIT_ASSERT_EQ_MSG(test,
+		memcmp(page_dst + PAGE_SIZE, page_pattern, PAGE_SIZE), 0,
+		"copy_mc_page overflow into adjacent page");
+}
+#endif /* __HAVE_ARCH_COPY_MC_PAGE */
+
 static struct kunit_case memcpy_test_cases[] = {
 	KUNIT_CASE(memset_test),
 	KUNIT_CASE(memcpy_test),
@@ -500,6 +561,10 @@ static struct kunit_case memcpy_test_cases[] = {
 	KUNIT_CASE_SLOW(memmove_test),
 	KUNIT_CASE_SLOW(memmove_large_test),
 	KUNIT_CASE_SLOW(memmove_overlap_test),
+	KUNIT_CASE(copy_page_test),
+#ifdef __HAVE_ARCH_COPY_MC_PAGE
+	KUNIT_CASE(copy_mc_page_test),
+#endif
 	{}
 };
 
@@ -510,5 +575,5 @@ static struct kunit_suite memcpy_test_suite = {
 
 kunit_test_suite(memcpy_test_suite);
 
-MODULE_DESCRIPTION("test cases for memcpy(), memmove(), and memset()");
+MODULE_DESCRIPTION("test cases for memcpy(), memmove(), memset() and copy_page()");
 MODULE_LICENSE("GPL");
-- 
2.39.3


