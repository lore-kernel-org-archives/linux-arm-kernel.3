Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B90C71134
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 19:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfaJOpv3mUy2icwksqhPk33BN1FPzJVNdC2/jiofR9M=; b=1g8N9kTvg0p5rGfhKuj9qQWUMi
	590FMzWOPc75UPiO3m8ZaCZVMR55zQHxsLEtDVprYMg1aLnzbiWdpsDLr/16bRRcbbREwWwPVn+ZA
	Ftn9ReOcywp6JuUVyw3toOMo5fjFccw8sj/2t5ZTQQpzuFHTrzz9am7GKvjtPoWTkJRoBFSup7W3f
	ZVUUsGXZkFazt8zisEwhkFD34ZCEzYGLLHALC0xTdKqBwqrDgPAOl/Sb7oPiLWYg9dJ6ATx7oPDnW
	CGCi9IW5WdcrhLrsEhNHqB49fCi8c6qckzo4T46xuximuqASE3SKsqE7BNeEfMdAFv/FNpsF1HpNb
	JrtQCXxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRWR-0000000B1HE-3IBo;
	Wed, 11 Jun 2025 19:54:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPN0r-0000000AKEM-2JAp
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 15:05:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nfaJOpv3mUy2icwksqhPk33BN1FPzJVNdC2/jiofR9M=; b=hdPLJTHflCZ0/nLXJQSRaQfDDS
	UVwmO8fbXFGK0SwEeNMGfbcoM+BqWZxS04/9xj3kEFgFCvOeb96+urxrkpqpJuZtYYJfNLZ7sj0e2
	vAcatVqXYiQPg4SyBzmymMT5f1GBHQSD9Ox5AY71DFra527req4yAnrrK1AdYNdq647hB8P3k8k0I
	xi90OhPhuSOqnkhiNRk1Yu3BbzADY2raLU/fyX1odsmlY+uZhsE42JN7LPRGkFP4q1jqj5abXXXNN
	MFDdzjOhsvu9O7pTzVU/tu6SJeJ9FgBVj1xJiR53SYLL89Ve7W9VKcQtMZVsOiEQR0c2az1bAtmIf
	wC1TiINw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPN0o-00000002PiX-3vtA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 15:05:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A8DB15A1;
	Wed, 11 Jun 2025 08:04:49 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E5C9F3F59E;
	Wed, 11 Jun 2025 08:04:43 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	pcc@google.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	hardevsinh.palaniya@siliconsignals.io,
	samuel.holland@sifive.com,
	palmer@rivosinc.com,
	charlie@rivosinc.com,
	thiago.bauermann@linaro.org,
	bgray@linux.ibm.com,
	tglx@linutronix.de,
	puranjay@kernel.org,
	david@redhat.com,
	yang@os.amperecomputing.com,
	mbenes@suse.cz,
	joel.granados@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v6 7/7] kselftest/arm64/mte: add MTE_STORE_ONLY testcases
Date: Wed, 11 Jun 2025 16:04:17 +0100
Message-Id: <20250611150417.44850-8-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250611150417.44850-1-yeoreum.yun@arm.com>
References: <20250611150417.44850-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_160511_459630_DDFD77FA 
X-CRM114-Status: GOOD (  14.22  )
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

Since ARMv8.9, FEAT_MTE_STORE_ONLY can be used to restrict raise of tag
check fault on store operation only.

Adds new test cases using MTE_STORE_ONLY feature.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../selftests/arm64/mte/check_mmap_options.c  | 361 +++++++++++++++++-
 .../testing/selftests/arm64/mte/check_prctl.c |  25 +-
 2 files changed, 366 insertions(+), 20 deletions(-)

diff --git a/tools/testing/selftests/arm64/mte/check_mmap_options.c b/tools/testing/selftests/arm64/mte/check_mmap_options.c
index 447c0ef25f71..c100af3012cb 100644
--- a/tools/testing/selftests/arm64/mte/check_mmap_options.c
+++ b/tools/testing/selftests/arm64/mte/check_mmap_options.c
@@ -35,6 +35,11 @@ enum mte_mem_check_type {
 	CHECK_CLEAR_PROT_MTE = 2,
 };
 
+enum mte_tag_op_type {
+	TAG_OP_ALL = 0,
+	TAG_OP_STONLY = 1,
+};
+
 struct check_mmap_testcase {
 	int check_type;
 	int mem_type;
@@ -42,17 +47,24 @@ struct check_mmap_testcase {
 	int mapping;
 	int tag_check;
 	int atag_check;
+	int tag_op;
 	bool enable_tco;
 };
 
+#define TAG_OP_ALL		0
+#define TAG_OP_STONLY		1
+
 static size_t page_size;
 static int sizes[] = {
 	1, 537, 989, 1269, MT_GRANULE_SIZE - 1, MT_GRANULE_SIZE,
 	/* page size - 1*/ 0, /* page_size */ 0, /* page size + 1 */ 0
 };
 
-static int check_mte_memory(char *ptr, int size, int mode, int tag_check, int atag_check)
+static int check_mte_memory(char *ptr, int size, int mode,
+		int tag_check,int atag_check, int tag_op)
 {
+	char buf[MT_GRANULE_SIZE];
+
 	if (!mtefar_support && atag_check == ATAG_CHECK_ON)
 		return KSFT_SKIP;
 
@@ -81,16 +93,34 @@ static int check_mte_memory(char *ptr, int size, int mode, int tag_check, int at
 	if (cur_mte_cxt.fault_valid == true && tag_check == TAG_CHECK_OFF)
 		return KSFT_FAIL;
 
+	if (tag_op == TAG_OP_STONLY) {
+		mte_initialize_current_context(mode, (uintptr_t)ptr, -UNDERFLOW);
+		memcpy(buf, ptr - UNDERFLOW, MT_GRANULE_SIZE);
+		mte_wait_after_trig();
+		if (cur_mte_cxt.fault_valid == true)
+			return KSFT_FAIL;
+
+		mte_initialize_current_context(mode, (uintptr_t)ptr, size + OVERFLOW);
+		memcpy(buf, ptr + size, MT_GRANULE_SIZE);
+		mte_wait_after_trig();
+		if (cur_mte_cxt.fault_valid == true)
+			return KSFT_FAIL;
+	}
+
 	return KSFT_PASS;
 }
 
-static int check_anonymous_memory_mapping(int mem_type, int mode, int mapping, int tag_check, int atag_check)
+static int check_anonymous_memory_mapping(int mem_type, int mode, int mapping,
+		int tag_check, int atag_check, int tag_op)
 {
 	char *ptr, *map_ptr;
 	int run, result, map_size;
 	int item = ARRAY_SIZE(sizes);
 
-	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG, false);
+	if (tag_op == TAG_OP_STONLY && !mtestonly_support)
+		return KSFT_SKIP;
+
+	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG, tag_op);
 	for (run = 0; run < item; run++) {
 		map_size = sizes[run] + OVERFLOW + UNDERFLOW;
 		map_ptr = (char *)mte_allocate_memory(map_size, mem_type, mapping, false);
@@ -106,7 +136,7 @@ static int check_anonymous_memory_mapping(int mem_type, int mode, int mapping, i
 			munmap((void *)map_ptr, map_size);
 			return KSFT_FAIL;
 		}
-		result = check_mte_memory(ptr, sizes[run], mode, tag_check, atag_check);
+		result = check_mte_memory(ptr, sizes[run], mode, tag_check, atag_check, tag_op);
 		mte_clear_tags((void *)ptr, sizes[run]);
 		mte_free_memory((void *)map_ptr, map_size, mem_type, false);
 		if (result != KSFT_PASS)
@@ -115,14 +145,18 @@ static int check_anonymous_memory_mapping(int mem_type, int mode, int mapping, i
 	return KSFT_PASS;
 }
 
-static int check_file_memory_mapping(int mem_type, int mode, int mapping, int tag_check, int atag_check)
+static int check_file_memory_mapping(int mem_type, int mode, int mapping,
+		int tag_check, int atag_check, int tag_op)
 {
 	char *ptr, *map_ptr;
 	int run, fd, map_size;
 	int total = ARRAY_SIZE(sizes);
 	int result = KSFT_PASS;
 
-	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG, false);
+	if (tag_op == TAG_OP_STONLY && !mtestonly_support)
+		return KSFT_SKIP;
+
+	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG, tag_op);
 	for (run = 0; run < total; run++) {
 		fd = create_temp_file();
 		if (fd == -1)
@@ -144,7 +178,7 @@ static int check_file_memory_mapping(int mem_type, int mode, int mapping, int ta
 			close(fd);
 			return KSFT_FAIL;
 		}
-		result = check_mte_memory(ptr, sizes[run], mode, tag_check, atag_check);
+		result = check_mte_memory(ptr, sizes[run], mode, tag_check, atag_check, tag_op);
 		mte_clear_tags((void *)ptr, sizes[run]);
 		munmap((void *)map_ptr, map_size);
 		close(fd);
@@ -177,10 +211,10 @@ static int check_clear_prot_mte_flag(int mem_type, int mode, int mapping, int at
 			ksft_print_msg("FAIL: mprotect not ignoring clear PROT_MTE property\n");
 			return KSFT_FAIL;
 		}
-		result = check_mte_memory(ptr, sizes[run], mode, TAG_CHECK_ON, atag_check);
+		result = check_mte_memory(ptr, sizes[run], mode, TAG_CHECK_ON, atag_check, TAG_OP_ALL);
 		mte_free_memory_tag_range((void *)ptr, sizes[run], mem_type, UNDERFLOW, OVERFLOW);
 		if (result != KSFT_PASS)
-			return KSFT_FAIL;
+			return result;
 
 		fd = create_temp_file();
 		if (fd == -1)
@@ -201,7 +235,7 @@ static int check_clear_prot_mte_flag(int mem_type, int mode, int mapping, int at
 			close(fd);
 			return KSFT_FAIL;
 		}
-		result = check_mte_memory(ptr, sizes[run], mode, TAG_CHECK_ON, atag_check);
+		result = check_mte_memory(ptr, sizes[run], mode, TAG_CHECK_ON, atag_check, TAG_OP_ALL);
 		mte_free_memory_tag_range((void *)ptr, sizes[run], mem_type, UNDERFLOW, OVERFLOW);
 		close(fd);
 		if (result != KSFT_PASS)
@@ -219,6 +253,7 @@ const char *format_test_name(struct check_mmap_testcase *tc)
 	const char *mapping_str;
 	const char *tag_check_str;
 	const char *atag_check_str;
+	const char *tag_op_str;
 
 	switch (tc->check_type) {
 	case CHECK_ANON_MEM:
@@ -303,6 +338,23 @@ const char *format_test_name(struct check_mmap_testcase *tc)
 	         check_type_str, mapping_str, sync_str, mem_type_str,
 	         tag_check_str, atag_check_str);
 
+	switch (tc->tag_op) {
+	case TAG_OP_ALL:
+		tag_op_str = "";
+		break;
+	case TAG_OP_STONLY:
+		tag_op_str = " / store-only";
+		break;
+	default:
+		assert(0);
+		break;
+	}
+
+	snprintf(test_name, TEST_NAME_MAX,
+	         "Check %s with %s mapping, %s mode, %s memory and %s (%s%s)\n",
+	         check_type_str, mapping_str, sync_str, mem_type_str,
+	         tag_check_str, atag_check_str, tag_op_str);
+
 	return test_name;
 }
 
@@ -318,6 +370,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_PRIVATE,
 			.tag_check = TAG_CHECK_OFF,
 			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_ALL,
 			.enable_tco = true,
 		},
 		{
@@ -327,6 +380,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_PRIVATE,
 			.tag_check = TAG_CHECK_OFF,
 			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_ALL,
 			.enable_tco = true,
 		},
 		{
@@ -336,6 +390,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_PRIVATE,
 			.tag_check = TAG_CHECK_OFF,
 			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_ALL,
 			.enable_tco = false,
 		},
 		{
@@ -345,6 +400,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_PRIVATE,
 			.tag_check = TAG_CHECK_OFF,
 			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_ALL,
 			.enable_tco = false,
 		},
 		{
@@ -354,6 +410,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_PRIVATE,
 			.tag_check = TAG_CHECK_ON,
 			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_ALL,
 			.enable_tco = false,
 		},
 		{
@@ -363,6 +420,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_PRIVATE,
 			.tag_check = TAG_CHECK_ON,
 			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_ALL,
 			.enable_tco = false,
 		},
 		{
@@ -372,6 +430,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_SHARED,
 			.tag_check = TAG_CHECK_ON,
 			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_ALL,
 			.enable_tco = false,
 		},
 		{
@@ -381,6 +440,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_SHARED,
 			.tag_check = TAG_CHECK_ON,
 			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_ALL,
 			.enable_tco = false,
 		},
 		{
@@ -390,6 +450,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_PRIVATE,
 			.tag_check = TAG_CHECK_ON,
 			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_ALL,
 			.enable_tco = false,
 		},
 		{
@@ -399,6 +460,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_PRIVATE,
 			.tag_check = TAG_CHECK_ON,
 			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_ALL,
 			.enable_tco = false,
 		},
 		{
@@ -408,6 +470,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_SHARED,
 			.tag_check = TAG_CHECK_ON,
 			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_ALL,
 			.enable_tco = false,
 		},
 		{
@@ -417,6 +480,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_SHARED,
 			.tag_check = TAG_CHECK_ON,
 			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_ALL,
 			.enable_tco = false,
 		},
 		{
@@ -426,6 +490,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_PRIVATE,
 			.tag_check = TAG_CHECK_ON,
 			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_ALL,
 			.enable_tco = false,
 		},
 		{
@@ -435,6 +500,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_PRIVATE,
 			.tag_check = TAG_CHECK_ON,
 			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_ALL,
 			.enable_tco = false,
 		},
 		{
@@ -444,6 +510,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_SHARED,
 			.tag_check = TAG_CHECK_ON,
 			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_ALL,
 			.enable_tco = false,
 		},
 		{
@@ -453,6 +520,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_SHARED,
 			.tag_check = TAG_CHECK_ON,
 			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_ALL,
 			.enable_tco = false,
 		},
 		{
@@ -462,6 +530,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_PRIVATE,
 			.tag_check = TAG_CHECK_ON,
 			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_ALL,
 			.enable_tco = false,
 		},
 		{
@@ -471,6 +540,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_PRIVATE,
 			.tag_check = TAG_CHECK_ON,
 			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_ALL,
 			.enable_tco = false,
 		},
 		{
@@ -480,6 +550,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_SHARED,
 			.tag_check = TAG_CHECK_ON,
 			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_ALL,
 			.enable_tco = false,
 		},
 		{
@@ -489,6 +560,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_SHARED,
 			.tag_check = TAG_CHECK_ON,
 			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_ALL,
 			.enable_tco = false,
 		},
 		{
@@ -498,6 +570,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_PRIVATE,
 			.tag_check = TAG_CHECK_ON,
 			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_ALL,
 			.enable_tco = false,
 		},
 		{
@@ -507,6 +580,257 @@ int main(int argc, char *argv[])
 			.mapping = MAP_PRIVATE,
 			.tag_check = TAG_CHECK_ON,
 			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_ALL,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_ANON_MEM,
+			.mem_type = USE_MMAP,
+			.mte_sync = MTE_SYNC_ERR,
+			.mapping = MAP_PRIVATE,
+			.tag_check = TAG_CHECK_ON,
+			.atag_check = ATAG_CHECK_ON,
+			.tag_op = TAG_OP_ALL,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_ANON_MEM,
+			.mem_type = USE_MPROTECT,
+			.mte_sync = MTE_SYNC_ERR,
+			.mapping = MAP_PRIVATE,
+			.tag_check = TAG_CHECK_ON,
+			.atag_check = ATAG_CHECK_ON,
+			.tag_op = TAG_OP_ALL,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_ANON_MEM,
+			.mem_type = USE_MMAP,
+			.mte_sync = MTE_SYNC_ERR,
+			.mapping = MAP_SHARED,
+			.tag_check = TAG_CHECK_ON,
+			.atag_check = ATAG_CHECK_ON,
+			.tag_op = TAG_OP_ALL,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_ANON_MEM,
+			.mem_type = USE_MPROTECT,
+			.mte_sync = MTE_SYNC_ERR,
+			.mapping = MAP_SHARED,
+			.tag_check = TAG_CHECK_ON,
+			.atag_check = ATAG_CHECK_ON,
+			.tag_op = TAG_OP_ALL,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_FILE_MEM,
+			.mem_type = USE_MMAP,
+			.mte_sync = MTE_SYNC_ERR,
+			.mapping = MAP_PRIVATE,
+			.tag_check = TAG_CHECK_ON,
+			.atag_check = ATAG_CHECK_ON,
+			.tag_op = TAG_OP_ALL,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_FILE_MEM,
+			.mem_type = USE_MPROTECT,
+			.mte_sync = MTE_SYNC_ERR,
+			.mapping = MAP_PRIVATE,
+			.tag_check = TAG_CHECK_ON,
+			.atag_check = ATAG_CHECK_ON,
+			.tag_op = TAG_OP_ALL,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_FILE_MEM,
+			.mem_type = USE_MMAP,
+			.mte_sync = MTE_SYNC_ERR,
+			.mapping = MAP_SHARED,
+			.tag_check = TAG_CHECK_ON,
+			.atag_check = ATAG_CHECK_ON,
+			.tag_op = TAG_OP_ALL,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_FILE_MEM,
+			.mem_type = USE_MPROTECT,
+			.mte_sync = MTE_SYNC_ERR,
+			.mapping = MAP_SHARED,
+			.tag_check = TAG_CHECK_ON,
+			.atag_check = ATAG_CHECK_ON,
+			.tag_op = TAG_OP_ALL,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_FILE_MEM,
+			.mem_type = USE_MMAP,
+			.mte_sync = MTE_ASYNC_ERR,
+			.mapping = MAP_PRIVATE,
+			.tag_check = TAG_CHECK_ON,
+			.atag_check = ATAG_CHECK_ON,
+			.tag_op = TAG_OP_ALL,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_ANON_MEM,
+			.mem_type = USE_MMAP,
+			.mte_sync = MTE_SYNC_ERR,
+			.mapping = MAP_PRIVATE,
+			.tag_check = TAG_CHECK_ON,
+			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_STONLY,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_ANON_MEM,
+			.mem_type = USE_MPROTECT,
+			.mte_sync = MTE_SYNC_ERR,
+			.mapping = MAP_PRIVATE,
+			.tag_check = TAG_CHECK_ON,
+			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_STONLY,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_ANON_MEM,
+			.mem_type = USE_MMAP,
+			.mte_sync = MTE_SYNC_ERR,
+			.mapping = MAP_SHARED,
+			.tag_check = TAG_CHECK_ON,
+			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_STONLY,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_ANON_MEM,
+			.mem_type = USE_MPROTECT,
+			.mte_sync = MTE_SYNC_ERR,
+			.mapping = MAP_SHARED,
+			.tag_check = TAG_CHECK_ON,
+			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_STONLY,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_ANON_MEM,
+			.mem_type = USE_MMAP,
+			.mte_sync = MTE_ASYNC_ERR,
+			.mapping = MAP_PRIVATE,
+			.tag_check = TAG_CHECK_ON,
+			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_STONLY,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_ANON_MEM,
+			.mem_type = USE_MPROTECT,
+			.mte_sync = MTE_ASYNC_ERR,
+			.mapping = MAP_PRIVATE,
+			.tag_check = TAG_CHECK_ON,
+			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_STONLY,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_ANON_MEM,
+			.mem_type = USE_MMAP,
+			.mte_sync = MTE_ASYNC_ERR,
+			.mapping = MAP_SHARED,
+			.tag_check = TAG_CHECK_ON,
+			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_STONLY,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_ANON_MEM,
+			.mem_type = USE_MPROTECT,
+			.mte_sync = MTE_ASYNC_ERR,
+			.mapping = MAP_SHARED,
+			.tag_check = TAG_CHECK_ON,
+			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_STONLY,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_FILE_MEM,
+			.mem_type = USE_MMAP,
+			.mte_sync = MTE_SYNC_ERR,
+			.mapping = MAP_PRIVATE,
+			.tag_check = TAG_CHECK_ON,
+			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_STONLY,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_FILE_MEM,
+			.mem_type = USE_MPROTECT,
+			.mte_sync = MTE_SYNC_ERR,
+			.mapping = MAP_PRIVATE,
+			.tag_check = TAG_CHECK_ON,
+			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_STONLY,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_FILE_MEM,
+			.mem_type = USE_MMAP,
+			.mte_sync = MTE_SYNC_ERR,
+			.mapping = MAP_SHARED,
+			.tag_check = TAG_CHECK_ON,
+			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_STONLY,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_FILE_MEM,
+			.mem_type = USE_MPROTECT,
+			.mte_sync = MTE_SYNC_ERR,
+			.mapping = MAP_SHARED,
+			.tag_check = TAG_CHECK_ON,
+			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_STONLY,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_FILE_MEM,
+			.mem_type = USE_MMAP,
+			.mte_sync = MTE_ASYNC_ERR,
+			.mapping = MAP_PRIVATE,
+			.tag_check = TAG_CHECK_ON,
+			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_STONLY,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_FILE_MEM,
+			.mem_type = USE_MPROTECT,
+			.mte_sync = MTE_ASYNC_ERR,
+			.mapping = MAP_PRIVATE,
+			.tag_check = TAG_CHECK_ON,
+			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_STONLY,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_FILE_MEM,
+			.mem_type = USE_MMAP,
+			.mte_sync = MTE_ASYNC_ERR,
+			.mapping = MAP_SHARED,
+			.tag_check = TAG_CHECK_ON,
+			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_STONLY,
+			.enable_tco = false,
+		},
+		{
+			.check_type = CHECK_FILE_MEM,
+			.mem_type = USE_MPROTECT,
+			.mte_sync = MTE_ASYNC_ERR,
+			.mapping = MAP_SHARED,
+			.tag_check = TAG_CHECK_ON,
+			.atag_check = ATAG_CHECK_OFF,
+			.tag_op = TAG_OP_STONLY,
 			.enable_tco = false,
 		},
 		{
@@ -516,6 +840,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_PRIVATE,
 			.tag_check = TAG_CHECK_ON,
 			.atag_check = ATAG_CHECK_ON,
+			.tag_op = TAG_OP_STONLY,
 			.enable_tco = false,
 		},
 		{
@@ -525,6 +850,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_PRIVATE,
 			.tag_check = TAG_CHECK_ON,
 			.atag_check = ATAG_CHECK_ON,
+			.tag_op = TAG_OP_STONLY,
 			.enable_tco = false,
 		},
 		{
@@ -534,6 +860,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_SHARED,
 			.tag_check = TAG_CHECK_ON,
 			.atag_check = ATAG_CHECK_ON,
+			.tag_op = TAG_OP_STONLY,
 			.enable_tco = false,
 		},
 		{
@@ -543,6 +870,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_SHARED,
 			.tag_check = TAG_CHECK_ON,
 			.atag_check = ATAG_CHECK_ON,
+			.tag_op = TAG_OP_STONLY,
 			.enable_tco = false,
 		},
 		{
@@ -552,6 +880,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_PRIVATE,
 			.tag_check = TAG_CHECK_ON,
 			.atag_check = ATAG_CHECK_ON,
+			.tag_op = TAG_OP_STONLY,
 			.enable_tco = false,
 		},
 		{
@@ -561,6 +890,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_PRIVATE,
 			.tag_check = TAG_CHECK_ON,
 			.atag_check = ATAG_CHECK_ON,
+			.tag_op = TAG_OP_STONLY,
 			.enable_tco = false,
 		},
 		{
@@ -570,6 +900,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_SHARED,
 			.tag_check = TAG_CHECK_ON,
 			.atag_check = ATAG_CHECK_ON,
+			.tag_op = TAG_OP_STONLY,
 			.enable_tco = false,
 		},
 		{
@@ -579,6 +910,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_SHARED,
 			.tag_check = TAG_CHECK_ON,
 			.atag_check = ATAG_CHECK_ON,
+			.tag_op = TAG_OP_STONLY,
 			.enable_tco = false,
 		},
 		{
@@ -588,6 +920,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_PRIVATE,
 			.tag_check = TAG_CHECK_ON,
 			.atag_check = ATAG_CHECK_ON,
+			.tag_op = TAG_OP_STONLY,
 			.enable_tco = false,
 		},
 		{
@@ -597,6 +930,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_PRIVATE,
 			.tag_check = TAG_CHECK_ON,
 			.atag_check = ATAG_CHECK_ON,
+			.tag_op = TAG_OP_ALL,
 			.enable_tco = false,
 		},
 		{
@@ -606,6 +940,7 @@ int main(int argc, char *argv[])
 			.mapping = MAP_PRIVATE,
 			.tag_check = TAG_CHECK_ON,
 			.atag_check = ATAG_CHECK_ON,
+			.tag_op = TAG_OP_ALL,
 			.enable_tco = false,
 		},
 	};
@@ -643,7 +978,8 @@ int main(int argc, char *argv[])
 								     test_cases[i].mte_sync,
 								     test_cases[i].mapping,
 								     test_cases[i].tag_check,
-								     test_cases[i].atag_check),
+								     test_cases[i].atag_check,
+								     test_cases[i].tag_op),
 				      format_test_name(&test_cases[i]));
 			break;
 		case CHECK_FILE_MEM:
@@ -651,7 +987,8 @@ int main(int argc, char *argv[])
 							        test_cases[i].mte_sync,
 							        test_cases[i].mapping,
 							        test_cases[i].tag_check,
-							        test_cases[i].atag_check),
+							        test_cases[i].atag_check,
+								test_cases[i].tag_op),
 				      format_test_name(&test_cases[i]));
 			break;
 		case CHECK_CLEAR_PROT_MTE:
diff --git a/tools/testing/selftests/arm64/mte/check_prctl.c b/tools/testing/selftests/arm64/mte/check_prctl.c
index 4c89e9538ca0..e9ad8761b3fb 100644
--- a/tools/testing/selftests/arm64/mte/check_prctl.c
+++ b/tools/testing/selftests/arm64/mte/check_prctl.c
@@ -60,7 +60,7 @@ void check_basic_read(void)
 /*
  * Attempt to set a specified combination of modes.
  */
-void set_mode_test(const char *name, int hwcap2, int mask)
+void set_mode_test(const char *name, int hwcap2, int hwcap3, int mask)
 {
 	int ret;
 
@@ -69,6 +69,11 @@ void set_mode_test(const char *name, int hwcap2, int mask)
 		return;
 	}
 
+	if ((getauxval(AT_HWCAP3) & hwcap3) != hwcap3) {
+		ksft_test_result_skip("%s\n", name);
+		return;
+	}
+
 	ret = set_tagged_addr_ctrl(mask);
 	if (ret < 0) {
 		ksft_test_result_fail("%s\n", name);
@@ -81,7 +86,7 @@ void set_mode_test(const char *name, int hwcap2, int mask)
 		return;
 	}
 
-	if ((ret & PR_MTE_TCF_MASK) == mask) {
+	if ((ret & (PR_MTE_TCF_MASK | PR_MTE_STORE_ONLY)) == mask) {
 		ksft_test_result_pass("%s\n", name);
 	} else {
 		ksft_print_msg("Got %x, expected %x\n",
@@ -93,12 +98,16 @@ void set_mode_test(const char *name, int hwcap2, int mask)
 struct mte_mode {
 	int mask;
 	int hwcap2;
+	int hwcap3;
 	const char *name;
 } mte_modes[] = {
-	{ PR_MTE_TCF_NONE,  0,          "NONE"  },
-	{ PR_MTE_TCF_SYNC,  HWCAP2_MTE, "SYNC"  },
-	{ PR_MTE_TCF_ASYNC, HWCAP2_MTE, "ASYNC" },
-	{ PR_MTE_TCF_SYNC | PR_MTE_TCF_ASYNC,  HWCAP2_MTE, "SYNC+ASYNC"  },
+	{ PR_MTE_TCF_NONE,                                        0,          0,                     "NONE"  },
+	{ PR_MTE_TCF_SYNC,                                        HWCAP2_MTE, 0,                     "SYNC"  },
+	{ PR_MTE_TCF_ASYNC,                                       HWCAP2_MTE, 0,                     "ASYNC" },
+	{ PR_MTE_TCF_SYNC | PR_MTE_TCF_ASYNC,                     HWCAP2_MTE, 0,                     "SYNC+ASYNC"  },
+	{ PR_MTE_TCF_SYNC | PR_MTE_STORE_ONLY,                    HWCAP2_MTE, HWCAP3_MTE_STORE_ONLY, "SYNC+STONLY" },
+	{ PR_MTE_TCF_ASYNC | PR_MTE_STORE_ONLY,                   HWCAP2_MTE, HWCAP3_MTE_STORE_ONLY, "ASYNC+STONLY" },
+	{ PR_MTE_TCF_SYNC | PR_MTE_TCF_ASYNC | PR_MTE_STORE_ONLY, HWCAP2_MTE, HWCAP3_MTE_STORE_ONLY, "SYNC+ASYNC+STONLY" },
 };
 
 int main(void)
@@ -106,11 +115,11 @@ int main(void)
 	int i;
 
 	ksft_print_header();
-	ksft_set_plan(5);
+	ksft_set_plan(ARRAY_SIZE(mte_modes));
 
 	check_basic_read();
 	for (i = 0; i < ARRAY_SIZE(mte_modes); i++)
-		set_mode_test(mte_modes[i].name, mte_modes[i].hwcap2,
+		set_mode_test(mte_modes[i].name, mte_modes[i].hwcap2, mte_modes[i].hwcap3,
 			      mte_modes[i].mask);
 
 	ksft_print_cnts();
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


