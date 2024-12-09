Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7143FE77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 09:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCzdiDFlbZh79PcakPauCEvqAaIH/wVADAjSs7kWDGA=; b=UTglPWApydeIiWhFUgRxS5CcUr
	L/ICgXreExwQv5Gf46CiOgMSr/49yU0x/nqioc5rtHIw8gGlvGaSCNpLDhbB0xl++Tartn/oiLvPb
	AdOoVM8gcFxpPUv8ernouLk26cL/ZplNReHz9/mdTaqGF8UhVw0R+GM0vRkjH4W5TtBSy1SsSmIdt
	KxVJlXRPt9H+aadleEESd8rFiqoXPzL7n9NbOkG9ZGfRCJKu9pgV4qGbh+aLBaNXAqY0YgxYGl/26
	uk2JEaPDxvRDsDPWqrK9V6KLIyXbWq9nmNiB7umQkvw/944GHCePoPHCL15ICIxTqp1TVEl1bIZGP
	OAiRo1rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaWj-00000007BiB-1WTK;
	Mon, 09 Dec 2024 09:58:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaPc-000000079DM-14zB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 09:50:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3C21113E;
	Mon,  9 Dec 2024 01:51:11 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA0E13F720;
	Mon,  9 Dec 2024 01:50:41 -0800 (PST)
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
Subject: [PATCH 02/14] selftests/mm: Fix -Wmaybe-uninitialized warnings
Date: Mon,  9 Dec 2024 09:50:07 +0000
Message-ID: <20241209095019.1732120-3-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241209095019.1732120-1-kevin.brodsky@arm.com>
References: <20241209095019.1732120-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_015044_372385_498C3D52 
X-CRM114-Status: GOOD (  10.86  )
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

A few -Wmaybe-uninitialized warnings show up when building the mm
tests with -O2. None of them looks worrying; silence them by
initialising the problematic variables.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 tools/testing/selftests/mm/ksm_tests.c       | 2 +-
 tools/testing/selftests/mm/mremap_test.c     | 2 +-
 tools/testing/selftests/mm/soft-dirty.c      | 2 +-
 tools/testing/selftests/mm/uffd-unit-tests.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/ksm_tests.c b/tools/testing/selftests/mm/ksm_tests.c
index b748c48908d9..dcdd5bb20f3d 100644
--- a/tools/testing/selftests/mm/ksm_tests.c
+++ b/tools/testing/selftests/mm/ksm_tests.c
@@ -776,7 +776,7 @@ static int ksm_cow_time(int merge_type, int mapping, int prot, int timeout, size
 
 int main(int argc, char *argv[])
 {
-	int ret, opt;
+	int ret = 0, opt;
 	int prot = 0;
 	int ksm_scan_limit_sec = KSM_SCAN_LIMIT_SEC_DEFAULT;
 	int merge_type = KSM_MERGE_TYPE_DEFAULT;
diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index 5a3a9bcba640..056b227f4a30 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -384,7 +384,7 @@ static void mremap_move_within_range(unsigned int pattern_seed, char *rand_addr)
 static long long remap_region(struct config c, unsigned int threshold_mb,
 			      char *rand_addr)
 {
-	void *addr, *src_addr, *dest_addr, *dest_preamble_addr;
+	void *addr, *src_addr, *dest_addr, *dest_preamble_addr = NULL;
 	unsigned long long t, d;
 	struct timespec t_start = {0, 0}, t_end = {0, 0};
 	long long  start_ns, end_ns, align_mask, ret, offset;
diff --git a/tools/testing/selftests/mm/soft-dirty.c b/tools/testing/selftests/mm/soft-dirty.c
index bdfa5d085f00..8e1462ce0532 100644
--- a/tools/testing/selftests/mm/soft-dirty.c
+++ b/tools/testing/selftests/mm/soft-dirty.c
@@ -128,7 +128,7 @@ static void test_mprotect(int pagemap_fd, int pagesize, bool anon)
 {
 	const char *type[] = {"file", "anon"};
 	const char *fname = "./soft-dirty-test-file";
-	int test_fd;
+	int test_fd = 0;
 	char *map;
 
 	if (anon) {
diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index 74c884713bf7..9ff71fa1f9bf 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -1122,7 +1122,7 @@ uffd_move_test_common(uffd_test_args_t *targs, unsigned long chunk_size,
 	char c;
 	unsigned long long count;
 	struct uffd_args args = { 0 };
-	char *orig_area_src, *orig_area_dst;
+	char *orig_area_src = NULL, *orig_area_dst = NULL;
 	unsigned long step_size, step_count;
 	unsigned long src_offs = 0;
 	unsigned long dst_offs = 0;
-- 
2.47.0


