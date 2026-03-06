Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FBAF51413
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 06:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z89VjCPOsBTAMzdOkBmmkyGLdD2D9prjOEPgmVbdWLg=; b=hM4CNhbRk+y1UEZ+iqM7myBlr0
	wZ081FRbuAwCyceCTaT2mogWdCTXGSJERy649WU52Q6D3PC15MCjqwOCbdHHn1OMKhqOc1+0F0hBg
	Lec4tnwDZDJXPXLk/4mqqk13WBSrM7pHMugT/MqvTf1vXFt/x3TOBqEPOjQTTS3IRpF9VEr4siJnp
	k+KUGJSy2Pax038ORRyYXROo1xdlxIB3CFDxHzguRAfSZMXBLeFayBuoLmvGLsh6ZmKW+OG3Asfi9
	++FwCYp7kf2jgomeWgJ65c/EXcZz4weKk3EkeT/oOl4WQ6I88kN9Cx9N3pxkVNCyEgGqossi3t946
	v/rseJTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyOv3-0000000362Z-3KFv;
	Fri, 06 Mar 2026 06:44:17 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyOuz-000000035xM-2OQv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 06:44:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1772779449; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Z89VjCPOsBTAMzdOkBmmkyGLdD2D9prjOEPgmVbdWLg=;
	b=ldKEC1kuEPefnGMQ0yMTEQcsEED3mzCE7wZNbXSwW1u68p0NJHbxPyti4ErvsJCWWhefAlAODcEbZCNX4j/CFim370d0SPCIFr9n0IUIyL1FOabEkiX00obEKXDTp0QE3TC1+qtXfQbd+KQ1FthHOj4zDeAKmZK5wiHG4IoC0eM=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X-MLT6U_1772779446 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Mar 2026 14:44:07 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	lorenzo.stoakes@oracle.com,
	ryan.roberts@arm.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	riel@surriel.com,
	harry.yoo@oracle.com,
	jannh@google.com,
	willy@infradead.org,
	baohua@kernel.org,
	dev.jain@arm.com,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	hannes@cmpxchg.org,
	zhengqi.arch@bytedance.com,
	shakeel.butt@linux.dev,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] arm64: mm: implement the architecture-specific test_and_clear_young_ptes()
Date: Fri,  6 Mar 2026 14:43:42 +0800
Message-ID: <7f891d42a720cc2e57862f3b79e4f774404f313c.1772778858.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772778858.git.baolin.wang@linux.alibaba.com>
References: <cover.1772778858.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_224414_218660_16C23E76 
X-CRM114-Status: GOOD (  10.01  )
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

Implement the Arm64 architecture-specific test_and_clear_young_ptes() to enable
batched checking of young flags, improving performance during large folio
reclamation when MGLRU is enabled.

While we're at it, simplify ptep_test_and_clear_young() by calling
test_and_clear_young_ptes(). Since callers guarantee that PTEs are present
before calling these functions, we can use pte_cont() to check the CONT_PTE
flag instead of pte_valid_cont().

Performance testing:
Enable MGLRU, then allocate 10G clean file-backed folios by mmap() in a memory
cgroup, and try to reclaim 8G file-backed folios via the memory.reclaim interface.
I can observe 60%+ performance improvement on my Arm64 32-core server (and about
15% improvement on my X86 machine).

W/o patchset:
real	0m0.470s
user	0m0.000s
sys	0m0.470s

W/ patchset:
real	0m0.180s
user	0m0.001s
sys	0m0.179s

Reviewed-by: Rik van Riel <riel@surriel.com>
Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 arch/arm64/include/asm/pgtable.h | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index aa4b13da6371..ab451d20e4c5 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1812,16 +1812,22 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 	return __ptep_get_and_clear(mm, addr, ptep);
 }
 
+#define test_and_clear_young_ptes test_and_clear_young_ptes
+static inline int test_and_clear_young_ptes(struct vm_area_struct *vma,
+					    unsigned long addr, pte_t *ptep,
+					    unsigned int nr)
+{
+	if (likely(nr == 1 && !pte_cont(__ptep_get(ptep))))
+		return __ptep_test_and_clear_young(vma, addr, ptep);
+
+	return contpte_test_and_clear_young_ptes(vma, addr, ptep, nr);
+}
+
 #define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
 static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
 				unsigned long addr, pte_t *ptep)
 {
-	pte_t orig_pte = __ptep_get(ptep);
-
-	if (likely(!pte_valid_cont(orig_pte)))
-		return __ptep_test_and_clear_young(vma, addr, ptep);
-
-	return contpte_test_and_clear_young_ptes(vma, addr, ptep, 1);
+	return test_and_clear_young_ptes(vma, addr, ptep, 1);
 }
 
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
-- 
2.47.3


