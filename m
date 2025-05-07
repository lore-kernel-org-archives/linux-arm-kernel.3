Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53ABFC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 10:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xymQuJkXyvQ7GBrxNdmYeOavulBm9Ct0V954yHm1mEQ=; b=47aEGBPLez4pMqinLXQrkA+EMo
	cLNnSU+CtaAt4B+1gOg3cs3tKQFct5svRHAzgJM8cUJrmZ+ZSVb70PnSj4CAHYjPizOJAhAqn0EZ4
	6rC+02lyTUh9ftGWZ+JY7tMFi3cW8rNjjE1TDVS97ZeY2zLOCyGSakI/t69bALK8fcoz9zoukMjyt
	S5GwdMAcrL5+QX2rYaAlFWdJJATHzY1OFZ0NgVs3hW8vVzO5RyxZtJjB9RmDq0G7BJAP7Irpkslbl
	o6vS7kHWgJ2XhwEqwTeKxtQjoPzFW/2+s5J6nmKLTvmqKBA3TQ9NKy/tDTLfLlgDRRJQZmfq8P7nJ
	F6FGGDkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCbpM-0000000F5Vw-2Z8r;
	Wed, 07 May 2025 10:16:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCbXi-0000000F2Re-0mXN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 09:58:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA7D9339;
	Wed,  7 May 2025 02:58:11 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E9EC83F5A1;
	Wed,  7 May 2025 02:58:18 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	pcc@google.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	yury.khrustalev@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	shmeerali.kolothum.thodi@huawei.com,
	james.morse@arm.com,
	mark.rutland@arm.com,
	huangxiaojia2@huawei.com,
	akpm@linux-foundation.org,
	surenb@google.com,
	robin.murphy@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v4 5/6] kselftest/arm64/mte: refactor check_mmap_option test
Date: Wed,  7 May 2025 10:57:56 +0100
Message-Id: <20250507095757.1663684-6-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250507095757.1663684-1-yeoreum.yun@arm.com>
References: <20250507095757.1663684-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_025822_313951_0585066B 
X-CRM114-Status: GOOD (  11.00  )
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

Before add mtefar testcase on check_mmap_option.c,
refactor check_mmap_option.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../selftests/arm64/mte/check_mmap_options.c  | 158 +++++++++++++-----
 1 file changed, 118 insertions(+), 40 deletions(-)

diff --git a/tools/testing/selftests/arm64/mte/check_mmap_options.c b/tools/testing/selftests/arm64/mte/check_mmap_options.c
index b37bf481c9f9..a784b3a31d4f 100644
--- a/tools/testing/selftests/arm64/mte/check_mmap_options.c
+++ b/tools/testing/selftests/arm64/mte/check_mmap_options.c
@@ -3,6 +3,7 @@
 
 #define _GNU_SOURCE
 
+#include <assert.h>
 #include <errno.h>
 #include <fcntl.h>
 #include <signal.h>
@@ -24,6 +25,12 @@
 #define TAG_CHECK_ON		0
 #define TAG_CHECK_OFF		1
 
+#define TEST_NAME_MAX		256
+
+#define CHECK_ANON_MEM		0
+#define CHECK_FILE_MEM		1
+#define CHECK_CLEAR_PROT_MTE	2
+
 static size_t page_size;
 static int sizes[] = {
 	1, 537, 989, 1269, MT_GRANULE_SIZE - 1, MT_GRANULE_SIZE,
@@ -183,10 +190,98 @@ static int check_clear_prot_mte_flag(int mem_type, int mode, int mapping)
 	return KSFT_PASS;
 }
 
+const char *format_test_name(int check_type, int mem_type, int sync,
+		       int mapping, int tag_check)
+{
+	static char test_name[TEST_NAME_MAX];
+	const char* check_type_str;
+	const char* mem_type_str;
+	const char* sync_str;
+	const char* mapping_str;
+	const char* tag_check_str;
+
+	switch (check_type) {
+	case CHECK_ANON_MEM:
+		check_type_str = "anonymous memory";
+		break;
+	case CHECK_FILE_MEM:
+		check_type_str = "file memory";
+		break;
+	case CHECK_CLEAR_PROT_MTE:
+		check_type_str = "clear PROT_MTE flags";
+		break;
+	default:
+		assert(0);
+		break;
+	}
+
+	switch (mem_type) {
+	case USE_MMAP:
+		mem_type_str = "mmap";
+		break;
+	case USE_MPROTECT:
+		mem_type_str = "mmap/mprotect";
+		break;
+	default:
+		assert(0);
+		break;
+	}
+
+	switch (sync) {
+	case MTE_NONE_ERR:
+		sync_str = "no error";
+		break;
+	case MTE_SYNC_ERR:
+		sync_str = "sync error";
+		break;
+	case MTE_ASYNC_ERR:
+		sync_str = "async error";
+		break;
+	default:
+		assert(0);
+		break;
+	}
+
+	switch (mapping) {
+	case MAP_SHARED:
+		mapping_str = "shared";
+		break;
+	case MAP_PRIVATE:
+		mapping_str = "private";
+		break;
+	default:
+		assert(0);
+		break;
+	}
+
+	switch (tag_check) {
+	case TAG_CHECK_ON:
+		tag_check_str = "tag check on";
+		break;
+	case TAG_CHECK_OFF:
+		tag_check_str = "tag check off";
+		break;
+	default:
+		assert(0);
+		break;
+	}
+
+	snprintf(test_name, TEST_NAME_MAX,
+	         "Check %s with %s mapping, %s mode, %s memory and %s\n",
+	         check_type_str, mapping_str, sync_str, mem_type_str, tag_check_str);
+
+	return test_name;
+}
+
 int main(int argc, char *argv[])
 {
 	int err;
 	int item = ARRAY_SIZE(sizes);
+	int check_type[] = { CHECK_ANON_MEM, CHECK_FILE_MEM };
+	int mem_type[] = { USE_MMAP, USE_MPROTECT };
+	int mte_sync[] = { MTE_SYNC_ERR, MTE_ASYNC_ERR };
+	int mapping[] = { MAP_PRIVATE, MAP_SHARED };
+	int c, mt, s, m;
 
 	err = mte_default_setup();
 	if (err)
@@ -210,54 +305,37 @@ int main(int argc, char *argv[])
 	mte_enable_pstate_tco();
 
 	evaluate_test(check_anonymous_memory_mapping(USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF),
-	"Check anonymous memory with private mapping, sync error mode, mmap memory and tag check off\n");
+		      format_test_name(CHECK_ANON_MEM, USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF));
+
 	evaluate_test(check_file_memory_mapping(USE_MPROTECT, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF),
-	"Check file memory with private mapping, sync error mode, mmap/mprotect memory and tag check off\n");
+		      format_test_name(CHECK_FILE_MEM, USE_MPROTECT, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF));
 
 	mte_disable_pstate_tco();
+
 	evaluate_test(check_anonymous_memory_mapping(USE_MMAP, MTE_NONE_ERR, MAP_PRIVATE, TAG_CHECK_OFF),
-	"Check anonymous memory with private mapping, no error mode, mmap memory and tag check off\n");
+		      format_test_name(CHECK_ANON_MEM, USE_MMAP, MTE_NONE_ERR, MAP_PRIVATE, TAG_CHECK_OFF));
 	evaluate_test(check_file_memory_mapping(USE_MPROTECT, MTE_NONE_ERR, MAP_PRIVATE, TAG_CHECK_OFF),
-	"Check file memory with private mapping, no error mode, mmap/mprotect memory and tag check off\n");
-
-	evaluate_test(check_anonymous_memory_mapping(USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_ON),
-	"Check anonymous memory with private mapping, sync error mode, mmap memory and tag check on\n");
-	evaluate_test(check_anonymous_memory_mapping(USE_MPROTECT, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_ON),
-	"Check anonymous memory with private mapping, sync error mode, mmap/mprotect memory and tag check on\n");
-	evaluate_test(check_anonymous_memory_mapping(USE_MMAP, MTE_SYNC_ERR, MAP_SHARED, TAG_CHECK_ON),
-	"Check anonymous memory with shared mapping, sync error mode, mmap memory and tag check on\n");
-	evaluate_test(check_anonymous_memory_mapping(USE_MPROTECT, MTE_SYNC_ERR, MAP_SHARED, TAG_CHECK_ON),
-	"Check anonymous memory with shared mapping, sync error mode, mmap/mprotect memory and tag check on\n");
-	evaluate_test(check_anonymous_memory_mapping(USE_MMAP, MTE_ASYNC_ERR, MAP_PRIVATE, TAG_CHECK_ON),
-	"Check anonymous memory with private mapping, async error mode, mmap memory and tag check on\n");
-	evaluate_test(check_anonymous_memory_mapping(USE_MPROTECT, MTE_ASYNC_ERR, MAP_PRIVATE, TAG_CHECK_ON),
-	"Check anonymous memory with private mapping, async error mode, mmap/mprotect memory and tag check on\n");
-	evaluate_test(check_anonymous_memory_mapping(USE_MMAP, MTE_ASYNC_ERR, MAP_SHARED, TAG_CHECK_ON),
-	"Check anonymous memory with shared mapping, async error mode, mmap memory and tag check on\n");
-	evaluate_test(check_anonymous_memory_mapping(USE_MPROTECT, MTE_ASYNC_ERR, MAP_SHARED, TAG_CHECK_ON),
-	"Check anonymous memory with shared mapping, async error mode, mmap/mprotect memory and tag check on\n");
-
-	evaluate_test(check_file_memory_mapping(USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_ON),
-	"Check file memory with private mapping, sync error mode, mmap memory and tag check on\n");
-	evaluate_test(check_file_memory_mapping(USE_MPROTECT, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_ON),
-	"Check file memory with private mapping, sync error mode, mmap/mprotect memory and tag check on\n");
-	evaluate_test(check_file_memory_mapping(USE_MMAP, MTE_SYNC_ERR, MAP_SHARED, TAG_CHECK_ON),
-	"Check file memory with shared mapping, sync error mode, mmap memory and tag check on\n");
-	evaluate_test(check_file_memory_mapping(USE_MPROTECT, MTE_SYNC_ERR, MAP_SHARED, TAG_CHECK_ON),
-	"Check file memory with shared mapping, sync error mode, mmap/mprotect memory and tag check on\n");
-	evaluate_test(check_file_memory_mapping(USE_MMAP, MTE_ASYNC_ERR, MAP_PRIVATE, TAG_CHECK_ON),
-	"Check file memory with private mapping, async error mode, mmap memory and tag check on\n");
-	evaluate_test(check_file_memory_mapping(USE_MPROTECT, MTE_ASYNC_ERR, MAP_PRIVATE, TAG_CHECK_ON),
-	"Check file memory with private mapping, async error mode, mmap/mprotect memory and tag check on\n");
-	evaluate_test(check_file_memory_mapping(USE_MMAP, MTE_ASYNC_ERR, MAP_SHARED, TAG_CHECK_ON),
-	"Check file memory with shared mapping, async error mode, mmap memory and tag check on\n");
-	evaluate_test(check_file_memory_mapping(USE_MPROTECT, MTE_ASYNC_ERR, MAP_SHARED, TAG_CHECK_ON),
-	"Check file memory with shared mapping, async error mode, mmap/mprotect memory and tag check on\n");
+		      format_test_name(CHECK_FILE_MEM, USE_MPROTECT, MTE_NONE_ERR, MAP_PRIVATE, TAG_CHECK_OFF));
+
+	for (c = 0 ; c < ARRAY_SIZE(check_type); c++) {
+		for (s = 0; s < ARRAY_SIZE(mte_sync); s++) {
+			for (m = 0; m < ARRAY_SIZE(mapping); m++) {
+				for (mt = 0; mt < ARRAY_SIZE(mem_type); mt++) {
+					if (check_type[c] == CHECK_ANON_MEM)
+						evaluate_test(check_anonymous_memory_mapping(mem_type[mt], mte_sync[s], mapping[m], TAG_CHECK_ON),
+							format_test_name(CHECK_ANON_MEM, mem_type[mt], mte_sync[s], mapping[m], TAG_CHECK_ON));
+					else
+						evaluate_test(check_file_memory_mapping(mem_type[mt], mte_sync[s], mapping[m], TAG_CHECK_ON),
+							format_test_name(CHECK_FILE_MEM, mem_type[mt], mte_sync[s], mapping[m], TAG_CHECK_ON));
+				}
+			}
+		}
+	}
 
 	evaluate_test(check_clear_prot_mte_flag(USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE),
-	"Check clear PROT_MTE flags with private mapping, sync error mode and mmap memory\n");
+		      format_test_name(CHECK_CLEAR_PROT_MTE, USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_ON));
 	evaluate_test(check_clear_prot_mte_flag(USE_MPROTECT, MTE_SYNC_ERR, MAP_PRIVATE),
-	"Check clear PROT_MTE flags with private mapping and sync error mode and mmap/mprotect memory\n");
+		      format_test_name(CHECK_CLEAR_PROT_MTE, USE_MPROTECT, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_ON));
 
 	mte_restore_setup();
 	ksft_print_cnts();
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


