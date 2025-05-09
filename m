Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E1AC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 13:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lk5hseJDZLEJj8y3q9W91NPndzlr4BGhrO+m8OBMRmg=; b=Xri8e/QaPLnyM6QTrHW4PTeYSf
	exYALUHjGTonmku/zFk/hwjPCYrYRouo4Exncn6YWhwPqoOM2IYukjq3g8jwWCEGBVml8RDzyKQbC
	f+L3+pBer+UhfCDSyft0GlGfVdTiuErjLH21jTRTgq2I9xxTYiNiHRYwnZf4mHZxQehRHa83WQ4bw
	ASaOXaNmJzSlQX3OCqQZ+gN4VfdvI1EAOu9J8UghvME+/YuOvx8a6sss7YTWQxA5W9Gv8taelmzRp
	ghgUEvu7QRLY8OGHpUqzhoT44tncyhm/VhzcPUQly1t/AQqvChzMQRuVqJLpYoVZPW2IKAdY1naM/
	lQzLQGRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNjR-00000003ktW-3T8N;
	Fri, 09 May 2025 13:25:41 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMr5-00000003akR-2xZa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 12:29:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Lk
	5hseJDZLEJj8y3q9W91NPndzlr4BGhrO+m8OBMRmg=; b=WNpUvwASRRPCRIBj4s
	US2eJy60fDgd4lmfCzlElTjB+3kN1rkRtVYKYlJjeqLx92oPQ9PZBH8C00PVxzA7
	ul5YvMg2sCdL5bA5V9VkNotyTmX8i5ALOhes5M86jIQRDlg3HfhrgqQOeATvbqZF
	gX3n0jQVsEHhcHIOT7aK7MAII=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3h9ay9B1oNPDSAA--.2625S2;
	Fri, 09 May 2025 20:27:31 +0800 (CST)
From: Xavier Xia <xavier_qy@163.com>
To: 21cnbao@gmail.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	ioworker0@gmail.com
Cc: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	david@redhat.com,
	gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	will@kernel.org,
	willy@infradead.org,
	xavier_qy@163.com,
	ziy@nvidia.com
Subject: [PATCH v5] arm64/mm: Optimize loop to reduce redundant operations of contpte_ptep_get
Date: Fri,  9 May 2025 20:27:28 +0800
Message-Id: <20250509122728.2379466-1-xavier_qy@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3h9ay9B1oNPDSAA--.2625S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3GF1UCr47Cw1fWry7tF1rCrg_yoWxAF45pF
	WfCF1aqrZ7JFn3Ga1fGw1kJr15J3s3Jay7XrnIka18Aa4DZrZ5ZFW2kryFyryUGrWkX3y8
	Ar1UWr4DCFyDCF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piHa0PUUUUU=
X-Originating-IP: [101.132.132.191]
X-CM-SenderInfo: 50dyxvpubt5qqrwthudrp/1tbiVhNIEGgd7Lv1FgAAsc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_052932_040506_EBCC3C50 
X-CRM114-Status: GOOD (  17.48  )
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

This commit optimizes the contpte_ptep_get and contpte_ptep_get_lockless
function by adding early termination logic. It checks if the dirty and
young bits of orig_pte are already set and skips redundant bit-setting
operations during the loop. This reduces unnecessary iterations and
improves performance.

In order to verify the optimization performance, a test function has been
designed. The function's execution time and instruction statistics have
been traced using perf, and the following are the operation results on a
certain Qualcomm mobile phone chip:

Test Code:

	#define PAGE_SIZE 4096
	#define CONT_PTES 16
	#define TEST_SIZE (4096* CONT_PTES * PAGE_SIZE)
	#define YOUNG_BIT 8
	void rwdata(char *buf)
	{
		for (size_t i = 0; i < TEST_SIZE; i += PAGE_SIZE) {
			buf[i] = 'a';
			volatile char c = buf[i];
		}
	}
	void clear_young_dirty(char *buf)
	{
		if (madvise(buf, TEST_SIZE, MADV_FREE) == -1) {
			perror("madvise free failed");
			free(buf);
			exit(EXIT_FAILURE);
		}
		if (madvise(buf, TEST_SIZE, MADV_COLD) == -1) {
			perror("madvise free failed");
			free(buf);
			exit(EXIT_FAILURE);
		}
	}
	void set_one_young(char *buf)
	{
		for (size_t i = 0; i < TEST_SIZE; i += CONT_PTES * PAGE_SIZE) {
			volatile char c = buf[i + YOUNG_BIT * PAGE_SIZE];
		}
	}

	void test_contpte_perf() {
		char *buf;
		int ret = posix_memalign((void **)&buf, CONT_PTES * PAGE_SIZE,
				TEST_SIZE);
		if ((ret != 0) || ((unsigned long)buf % CONT_PTES * PAGE_SIZE)) {
			perror("posix_memalign failed");
			exit(EXIT_FAILURE);
		}

		rwdata(buf);
	#if TEST_CASE2 || TEST_CASE3
		clear_young_dirty(buf);
	#endif
	#if TEST_CASE2
		set_one_young(buf);
	#endif

		for (int j = 0; j < 500; j++) {
			mlock(buf, TEST_SIZE);

			munlock(buf, TEST_SIZE);
		}
		free(buf);
	}

	Descriptions of three test scenarios

Scenario 1
	The data of all 16 PTEs are both dirty and young.
	#define TEST_CASE2 0
	#define TEST_CASE3 0

Scenario 2
	Among the 16 PTEs, only the 8th one is young, and there are no dirty ones.
	#define TEST_CASE2 1
	#define TEST_CASE3 0

Scenario 3
	Among the 16 PTEs, there are neither young nor dirty ones.
	#define TEST_CASE2 0
	#define TEST_CASE3 1

Test results

|Scenario 1         |       Original|       Optimized|
|-------------------|---------------|----------------|
|instructions       |    37912436160|     18731580031|
|test time          |         4.2797|          2.2949|
|overhead of        |               |                |
|contpte_ptep_get() |         21.31%|           4.80%|

|Scenario 2         |       Original|       Optimized|
|-------------------|---------------|----------------|
|instructions       |    36701270862|     36115790086|
|test time          |         3.2335|          3.0874|
|Overhead of        |               |                |
|contpte_ptep_get() |         32.26%|          33.57%|

|Scenario 3         |       Original|       Optimized|
|-------------------|---------------|----------------|
|instructions       |    36706279735|     36750881878|
|test time          |         3.2008|          3.1249|
|Overhead of        |               |                |
|contpte_ptep_get() |         31.94%|          34.59%|

For Scenario 1, optimized code can achieve an instruction benefit of 50.59%
and a time benefit of 46.38%.
For Scenario 2, optimized code can achieve an instruction count benefit of
1.6% and a time benefit of 4.5%.
For Scenario 3, since all the PTEs have neither the young nor the dirty
flag, the branches taken by optimized code should be the same as those of
the original code. In fact, the test results of optimized code seem to be
closer to those of the original code.

It can be proven through test function that the optimization for
contpte_ptep_get is effective. Since the logic of contpte_ptep_get_lockless
is similar to that of contpte_ptep_get, the same optimization scheme is
also adopted for it.

Signed-off-by: Xavier Xia <xavier_qy@163.com>
---
Changes in v5:
- Replace macro CHECK_CONTPTE_CONSISTENCY with inline function contpte_is_consistent
  for improved readability and clarity, as suggested by Barry.
- Link to v4: https://lore.kernel.org/all/20250508070353.2370826-1-xavier_qy@163.com/

Changes in v4:
- Convert macro CHECK_CONTPTE_FLAG to an internal loop for better readability.
- Refactor contpte_ptep_get_lockless using the same optimization logic, as suggested by Ryan.
- Link to v3: https://lore.kernel.org/all/3d338f91.8c71.1965cd8b1b8.Coremail.xavier_qy@163.com/
---
 arch/arm64/mm/contpte.c | 74 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 65 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index bcac4f55f9c1..1037450b68e9 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -169,17 +169,44 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
 	for (i = 0; i < CONT_PTES; i++, ptep++) {
 		pte = __ptep_get(ptep);
 
-		if (pte_dirty(pte))
+		if (pte_dirty(pte)) {
 			orig_pte = pte_mkdirty(orig_pte);
-
-		if (pte_young(pte))
+			for (; i < CONT_PTES; i++, ptep++) {
+				pte = __ptep_get(ptep);
+				if (pte_young(pte)) {
+					orig_pte = pte_mkyoung(orig_pte);
+					break;
+				}
+			}
+			break;
+		}
+
+		if (pte_young(pte)) {
 			orig_pte = pte_mkyoung(orig_pte);
+			i++;
+			ptep++;
+			for (; i < CONT_PTES; i++, ptep++) {
+				pte = __ptep_get(ptep);
+				if (pte_dirty(pte)) {
+					orig_pte = pte_mkdirty(orig_pte);
+					break;
+				}
+			}
+			break;
+		}
 	}
 
 	return orig_pte;
 }
 EXPORT_SYMBOL_GPL(contpte_ptep_get);
 
+static inline bool contpte_is_consistent(pte_t pte, unsigned long pfn,
+					pgprot_t prot, pgprot_t orig_prot)
+{
+	return pte_valid_cont(pte) && pte_pfn(pte) == pfn &&
+			pgprot_val(prot) == pgprot_val(orig_prot);
+}
+
 pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
 {
 	/*
@@ -221,16 +248,45 @@ pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
 		pte = __ptep_get(ptep);
 		prot = pte_pgprot(pte_mkold(pte_mkclean(pte)));
 
-		if (!pte_valid_cont(pte) ||
-		   pte_pfn(pte) != pfn ||
-		   pgprot_val(prot) != pgprot_val(orig_prot))
+		if (!contpte_is_consistent(pte, pfn, prot, orig_prot))
 			goto retry;
 
-		if (pte_dirty(pte))
+		if (pte_dirty(pte)) {
 			orig_pte = pte_mkdirty(orig_pte);
-
-		if (pte_young(pte))
+			for (; i < CONT_PTES; i++, ptep++, pfn++) {
+				pte = __ptep_get(ptep);
+				prot = pte_pgprot(pte_mkold(pte_mkclean(pte)));
+
+				if (!contpte_is_consistent(pte, pfn, prot, orig_prot))
+					goto retry;
+
+				if (pte_young(pte)) {
+					orig_pte = pte_mkyoung(orig_pte);
+					break;
+				}
+			}
+			break;
+		}
+
+		if (pte_young(pte)) {
 			orig_pte = pte_mkyoung(orig_pte);
+			i++;
+			ptep++;
+			pfn++;
+			for (; i < CONT_PTES; i++, ptep++, pfn++) {
+				pte = __ptep_get(ptep);
+				prot = pte_pgprot(pte_mkold(pte_mkclean(pte)));
+
+				if (!contpte_is_consistent(pte, pfn, prot, orig_prot))
+					goto retry;
+
+				if (pte_dirty(pte)) {
+					orig_pte = pte_mkdirty(orig_pte);
+					break;
+				}
+			}
+			break;
+		}
 	}
 
 	return orig_pte;
-- 
2.34.1


