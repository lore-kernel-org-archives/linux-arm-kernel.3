Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC63C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 20:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ihMu+w7nCoTSGq+4RZCJ2TmkBfciX1sr6w0E83yVPuA=; b=sXnkHOKW6Pf9xubZ8j+qWt6bUh
	R9jEwWFWle95U6WxxPZzZZ/UOBnzf9jvwcow0OZHyddXZdby8SYEOSiLj3o2C9dAezV296YLi6xRO
	BrX+JwrOb0riVnhBvCMIzVGO1CwLpsiyskMR7JZI+LbyRfO1P6DjIDHlOEezYLBvbNBMkkssWNAT6
	lFHr5dLbSaDhtbpE+lEk0evs5ku4DHFSa6kWPEygFxSD41h7kJkU/WdSZbBJcyMNEznIc0KckHvW8
	6ZqPV2n4HvElLtHY9622aoZlMibD3iprsY1jtWLCG5DALuQDBLPtCNgiHjSJJmfdOIuzL46S9uuVw
	LI5Kg+TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUATg-00000006nPu-3OvM;
	Tue, 24 Jun 2025 20:42:48 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5YD-000000066dk-24LC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 15:27:10 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-234b9dfb842so49999365ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 08:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750778829; x=1751383629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ihMu+w7nCoTSGq+4RZCJ2TmkBfciX1sr6w0E83yVPuA=;
        b=dZUF2uEdb0nrVifbHGyGHBsoctSw1BPUJ0F0ElfQ5ruA1LHY9h5sz/EZDHQP6UV2iA
         cvWcLkCHzeXiHRNXE+IO3MAbmMe3Jy1/iRD60bmBaAfzMhI2Y3L0xLlxyQLVVe7wCTSj
         +4MKmU1QrARizbRuaP8b4BbdZEkfwPBbjg7sGxOjiMa5VOFx3Ja9OwoE8f94BjIWTZl2
         CurHgi7p0moUZKI8NxYAxi8AMixo0HMxNExTejbJeTooA4E4eZY3sqvx7nflsPyxJi02
         QMF3zwd7taYml+A2LlxEQUvePw7cDiuthuXpIiL5+2O1hMAVKspsJ4s/QIh8ARm4y0qY
         Cqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750778829; x=1751383629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ihMu+w7nCoTSGq+4RZCJ2TmkBfciX1sr6w0E83yVPuA=;
        b=dfJwvxKM9bQ1EY0f6KDYTXMahPuwbxTFS7mgV5NpB76qqhyd0idjqHJGWcS+CEkVu5
         CyPIvrrqCDejswkT/maaGF7diYkYPcA3eUrudSzlVMJsA8f6qESe3gNPZ610v9TdIvUX
         u6b+87E5eu0ONXLWZEGfXalxDa8iTUoVZqPodr+7fOJ+wN4BlBXMgFlUNBaw5CI2ZsUs
         GFqe2tZeHydLk4C8Nm93Sy+JADHB5u6dLHoYRtUDTcMMNX1LswehTg7VtsWWm50KnoWG
         CNE62jo04f+3HvfuLEBkA2177gSQkXfuC5P1wxNHP/pvKWEiErRVni+nvpBSz0ZiX6ED
         Eqhw==
X-Forwarded-Encrypted: i=1; AJvYcCULsMPgJoc6ETLGoY9yUyxO33AMEEm3mCJCHXhKHWzX05aOlc4BXc/1T3tgPDyhWjkiqbWzDrypuHpwHXAjTPBA@lists.infradead.org
X-Gm-Message-State: AOJu0YyjU/eU7x48bpZtO0Y1x4teJJ67FMjkNMNLrpZMdt0bPcTBca68
	td0pTQ81bXI+PUueNsw+Rw6mLiCpD8k7pIepxnt/rJrPe3EdsE90pVAFhQxplg==
X-Gm-Gg: ASbGncu36JE5j3keAFCu/z0rhm6bB8AuhqiaHWfD0LVs+4Vsbr9IPSGi9NWInoKVm+s
	sE0TvW9xq8edmLB8fwE9jrVE5rHnRegAtRMDyrk8wCfQM0q5WJLXZnXATHu6iviOMunLc1Uxh/C
	KHFEINNgrcsJSWZ0eXcnIcYthT2CYbOSC/ygQNf2Qy5x/JIvGeGvDPW3M2AOxsZOtON0DfLN11W
	FyhR8rVY+F1KicmnW0nyTeYJMWdrIqS1uB3ysyNBSemAlLY+6yvZCamCdfNDzhjY+YQLNaRlA++
	poYfooe5HELtmcvaNLBCPjtzzjevmxQ5sjAOKSd97+3fSB3MNXZ49HpEVkj0lcq6Zdp5SMpwUkY
	=
X-Google-Smtp-Source: AGHT+IGyXs9ccyO6PIDBnUQkvw3swafltIfKcPLYEq/f4dAu6qbdAkS+Hno5e1qdpaxNZhpT3FQfjQ==
X-Received: by 2002:a17:903:32c5:b0:234:c5c1:9b63 with SMTP id d9443c01a7336-237d9907243mr218353515ad.18.1750778828233;
        Tue, 24 Jun 2025 08:27:08 -0700 (PDT)
Received: from localhost ([101.132.132.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2380655376esm15369475ad.26.2025.06.24.08.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 08:27:07 -0700 (PDT)
From: Xavier Xia <xavier.qyxia@gmail.com>
To: ryan.roberts@arm.com,
	will@kernel.org,
	21cnbao@gmail.com,
	ioworker0@gmail.com,
	dev.jain@arm.com
Cc: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	david@redhat.com,
	gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	willy@infradead.org,
	xavier_qy@163.com,
	ziy@nvidia.com,
	Xavier Xia <xavier.qyxia@gmail.com>,
	Barry Song <baohua@kernel.org>
Subject: [PATCH v7] arm64/mm: Optimize loop to reduce redundant operations of  contpte_ptep_get
Date: Tue, 24 Jun 2025 23:25:49 +0800
Message-Id: <20250624152549.2647828-1-xavier.qyxia@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_082709_541848_145CF017 
X-CRM114-Status: GOOD (  19.49  )
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
	#include <stdlib.h>
	#include <sys/mman.h>
	#include <stdio.h>

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

	int main(void) 
	{
		test_contpte_perf();
		return 0;
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

Ryan re-ran these tests on Apple M2 with 4K base pages + 64K mTHP.

Scenario 1: reduced to 56% of baseline execution time
Scenario 2: reduced to 89% of baseline execution time
Scenario 3: reduced to 91% of baseline execution time

It can be proven through test function that the optimization for
contpte_ptep_get is effective. Since the logic of contpte_ptep_get_lockless
is similar to that of contpte_ptep_get, the same optimization scheme is
also adopted for it.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Tested-by: Ryan Roberts <ryan.roberts@arm.com>
Reviewed-by: Barry Song <baohua@kernel.org>
Signed-off-by: Xavier Xia <xavier.qyxia@gmail.com>
---
Changes in v7:
- Update the header files and main function of the test program, as well as Ryan's validation data.
- Link to v6: https://lore.kernel.org/all/20250510125948.2383778-1-xavier_qy@163.com/

Changes in v6:
- Move prot = pte_pgprot(pte_mkold(pte_mkclean(pte))) into the contpte_is_consistent(),
  as suggested by Barry.
- Link to v5: https://lore.kernel.org/all/20250509122728.2379466-1-xavier_qy@163.com/

Changes in v5:
- Replace macro CHECK_CONTPTE_CONSISTENCY with inline function contpte_is_consistent
  for improved readability and clarity, as suggested by Barry.
- Link to v4: https://lore.kernel.org/all/20250508070353.2370826-1-xavier_qy@163.com/

Changes in v4:
- Convert macro CHECK_CONTPTE_FLAG to an internal loop for better readability.
- Refactor contpte_ptep_get_lockless using the same optimization logic, as suggested by Ryan.
- Link to v3: https://lore.kernel.org/all/3d338f91.8c71.1965cd8b1b8.Coremail.xavier_qy@163.com/
---
 arch/arm64/mm/contpte.c | 74 +++++++++++++++++++++++++++++++++++------
 1 file changed, 64 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index bcac4f55f9c1..71efe7dff0ad 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -169,17 +169,46 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
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
+					pgprot_t orig_prot)
+{
+	pgprot_t prot = pte_pgprot(pte_mkold(pte_mkclean(pte)));
+
+	return pte_valid_cont(pte) && pte_pfn(pte) == pfn &&
+			pgprot_val(prot) == pgprot_val(orig_prot);
+}
+
 pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
 {
 	/*
@@ -202,7 +231,6 @@ pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
 	pgprot_t orig_prot;
 	unsigned long pfn;
 	pte_t orig_pte;
-	pgprot_t prot;
 	pte_t *ptep;
 	pte_t pte;
 	int i;
@@ -219,18 +247,44 @@ pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
 
 	for (i = 0; i < CONT_PTES; i++, ptep++, pfn++) {
 		pte = __ptep_get(ptep);
-		prot = pte_pgprot(pte_mkold(pte_mkclean(pte)));
 
-		if (!pte_valid_cont(pte) ||
-		   pte_pfn(pte) != pfn ||
-		   pgprot_val(prot) != pgprot_val(orig_prot))
+		if (!contpte_is_consistent(pte, pfn, orig_prot))
 			goto retry;
 
-		if (pte_dirty(pte))
+		if (pte_dirty(pte)) {
 			orig_pte = pte_mkdirty(orig_pte);
+			for (; i < CONT_PTES; i++, ptep++, pfn++) {
+				pte = __ptep_get(ptep);
+
+				if (!contpte_is_consistent(pte, pfn, orig_prot))
+					goto retry;
+
+				if (pte_young(pte)) {
+					orig_pte = pte_mkyoung(orig_pte);
+					break;
+				}
+			}
+			break;
+		}
 
-		if (pte_young(pte))
+		if (pte_young(pte)) {
 			orig_pte = pte_mkyoung(orig_pte);
+			i++;
+			ptep++;
+			pfn++;
+			for (; i < CONT_PTES; i++, ptep++, pfn++) {
+				pte = __ptep_get(ptep);
+
+				if (!contpte_is_consistent(pte, pfn, orig_prot))
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


