Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2C6CD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 08:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZlFlL/ldqFxlJ/mCuoKEqDloBHgz/6+XLcrhP5/h8w=; b=05VNWjVxByVG06Biz+LwYGmuRd
	3eHiKqYCy28unpvCAqH/77pcDZgR9vhnqoGAt58QSmsji5HKQ7bCPAHwwgH/PwWFyVDvD4hQskyNj
	79XEUW3/Hu9X055Dgbs7bpwz5/MNyyP9ezUv6wGzp2TYVO+Dq0cjW2CIEzrIpYbR6DBUmyoc1H9mJ
	IOWSa4btVAS0bg3g0lS4uzPD+QTevfw1ReW6egQVr3V6BTt4531SuJ+7o61nGRGY17RYyZe3Q3+C+
	2jZncrkfihD9hcpEycFdWkfn5r0CoGgijdI3MbrYmbV6pkYjiYH6PtoCOoUXDiYEM8eanwxPfxvjz
	zqIuzihQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtgQ-0000000EsxB-0lHr;
	Mon, 18 May 2026 08:50:42 +0000
Received: from out199-7.us.a.mail.aliyun.com ([47.90.199.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtgF-0000000EskK-2Dxn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 08:50:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1779094227; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=4ZlFlL/ldqFxlJ/mCuoKEqDloBHgz/6+XLcrhP5/h8w=;
	b=uJoZGfGR2uabJ0rfA3C8SFKfpGjjGGUQuFOZlnA8fZcspelZrbuRcVnJ3RI4zeamr2LYLH4AZPW9DSJxXcUoTjCtT4R+pCcSI0S/l1pcw2eJji3+Y9Tu5YbsprOcziR2kj0GcU6QxNoOz00AGfukC30ObrQeOy9GdvzLa4pctV8=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=tianruidong@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X365dBE_1779094223;
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0X365dBE_1779094223 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 18 May 2026 16:50:25 +0800
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
Subject: [PATCH v14 8/8] lib/tests: memcpy_kunit: add memcpy_mc() and memcpy_mc_large() test
Date: Mon, 18 May 2026 16:49:52 +0800
Message-ID: <20260518084956.2538442-9-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260518084956.2538442-1-tianruidong@linux.alibaba.com>
References: <20260518084956.2538442-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_015032_360031_A8E739EA 
X-CRM114-Status: GOOD (  12.88  )
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

memcpy_mc() is the Machine-Check safe memcpy variant that returns the
number of bytes NOT copied on a hardware memory error, or 0 on success.

Add two test cases modeled after the existing memcpy_test() and
memcpy_large_test() implementations:

Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 lib/tests/memcpy_kunit.c | 113 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 112 insertions(+), 1 deletion(-)

diff --git a/lib/tests/memcpy_kunit.c b/lib/tests/memcpy_kunit.c
index 85df53ccfb0c..b4b2dafb50f1 100644
--- a/lib/tests/memcpy_kunit.c
+++ b/lib/tests/memcpy_kunit.c
@@ -552,6 +552,115 @@ static void copy_mc_page_test(struct kunit *test)
 		memcmp(page_dst + PAGE_SIZE, page_zero, PAGE_SIZE), 0,
 		"copy_mc_page overflow into adjacent page");
 }
+/*
+ * memcpy_mc() is a Machine-Check safe memcpy variant.
+ * Signature: int memcpy_mc(void *dst, const void *src, size_t len)
+ * Returns:   0 on success, or number of bytes NOT copied on MC error.
+ *
+ * In the normal (no-poison) path it must behave identically to memcpy()
+ * and always return 0.
+ */
+static void memcpy_mc_test(struct kunit *test)
+{
+#define TEST_OP "memcpy_mc"
+	struct some_bytes control = {
+		.data = { 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
+			  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
+			  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
+			  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
+		},
+	};
+	struct some_bytes zero = { };
+	struct some_bytes middle = {
+		.data = { 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
+			  0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0x00,
+			  0x00, 0x00, 0x00, 0x20, 0x20, 0x20, 0x20, 0x20,
+			  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
+		},
+	};
+	struct some_bytes three = {
+		.data = { 0x00, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
+			  0x20, 0x00, 0x00, 0x20, 0x20, 0x20, 0x20, 0x20,
+			  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
+			  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
+			},
+	};
+	struct some_bytes dest = { };
+	int ret, count;
+	u8 *ptr;
+
+	/* Verify static initializers. */
+	check(control, 0x20);
+	check(zero, 0);
+	compare("static initializers", dest, zero);
+
+	/* Verify assignment. */
+	dest = control;
+	compare("direct assignment", dest, control);
+
+	/* Verify complete overwrite. */
+	ret = memcpy_mc(dest.data, control.data, sizeof(dest.data));
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	compare("complete overwrite", dest, control);
+
+	/* Verify middle overwrite: 7 bytes at offset 12. */
+	dest = control;
+	ret = memcpy_mc(dest.data + 12, zero.data, 7);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	compare("middle overwrite", dest, middle);
+
+	/* Verify zero-length copy is a no-op. */
+	dest = control;
+	ret = memcpy_mc(dest.data, zero.data, 0);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	compare("zero length", dest, control);
+
+	/* Verify argument side-effects aren't repeated. */
+	dest = control;
+	ptr = dest.data;
+	count = 1;
+	memcpy(ptr++, zero.data, count++);
+	ptr += 8;
+	memcpy(ptr++, zero.data, count++);
+	compare("argument side-effects", dest, three);
+#undef TEST_OP
+}
+
+static void memcpy_mc_large_test(struct kunit *test)
+{
+	init_large(test);
+
+	/* Sweep 1..1024 bytes x shifting offset to cover all template paths. */
+	for (int bytes = 1; bytes <= ARRAY_SIZE(large_src); bytes++) {
+		for (int offset = 0; offset < ARRAY_SIZE(large_src); offset++) {
+			int right_zero_pos = offset + bytes;
+			int right_zero_size = ARRAY_SIZE(large_dst) - right_zero_pos;
+			int ret;
+
+			ret = memcpy_mc(large_dst + offset, large_src, bytes);
+			KUNIT_ASSERT_EQ_MSG(test, ret, 0,
+				"memcpy_mc returned %d with size %d at offset %d",
+				ret, bytes, offset);
+
+			/* No write before copy area. */
+			KUNIT_ASSERT_EQ_MSG(test,
+				memcmp(large_dst, large_zero, offset), 0,
+				"with size %d at offset %d", bytes, offset);
+			/* No write after copy area. */
+			KUNIT_ASSERT_EQ_MSG(test,
+				memcmp(&large_dst[right_zero_pos], large_zero,
+				       right_zero_size), 0,
+				"with size %d at offset %d", bytes, offset);
+			/* Byte-for-byte exact. */
+			KUNIT_ASSERT_EQ_MSG(test,
+				memcmp(large_dst + offset, large_src, bytes), 0,
+				"with size %d at offset %d", bytes, offset);
+
+			memset(large_dst + offset, 0, bytes);
+		}
+		cond_resched();
+	}
+}
 #endif /* CONFIG_ARCH_HAS_COPY_MC */
 
 static struct kunit_case memcpy_test_cases[] = {
@@ -564,6 +673,8 @@ static struct kunit_case memcpy_test_cases[] = {
 	KUNIT_CASE(copy_page_test),
 #ifdef CONFIG_ARCH_HAS_COPY_MC
 	KUNIT_CASE(copy_mc_page_test),
+	KUNIT_CASE(memcpy_mc_test),
+	KUNIT_CASE_SLOW(memcpy_mc_large_test),
 #endif
 	{}
 };
@@ -575,5 +686,5 @@ static struct kunit_suite memcpy_test_suite = {
 
 kunit_test_suite(memcpy_test_suite);
 
-MODULE_DESCRIPTION("test cases for memcpy(), memmove(), memset() and copy_page()");
+MODULE_DESCRIPTION("test cases for memcpy(), memmove(), memset(), copy_page() and memcpy_mc()");
 MODULE_LICENSE("GPL");
-- 
2.39.3


