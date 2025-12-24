Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E70E75448
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 10:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zj162aZxQBEU+UIjJS9+a4lH3G+iwLeQyL/18BsRVfw=; b=RfHWVL+pf+4nFIEdgyuE5PwoAU
	zNvxilNfFs1PkmLCisV6T+erEPayPV5ahkP+6nLoJUI2GhTzYcBTVLml5p6c1y6rkJ7qYBB2Sa2+Q
	eDUwsXQ6RlUHrXCs1Fa43rZd3A80XUVnY7Kf2igdrwfu+djvdrmlxzsE6ie79fVgzIllbIsCTiX5d
	eBALEysMc0fBeiFIiRkp1cLVSqJWEp/VVZA/6rEluPQj4l92o9ZsFLRQToQDBj9jWaS80FOioOStE
	SC2WzFtgq9HUlm3vCUbwhWilDianLMAAfwW4EEOxL03n1s3qtKcgXyYjm9+2GQtWkZsC1O9mUcUrN
	YUF3LA9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYMVk-0000000GiGq-2y9B;
	Wed, 24 Dec 2025 10:54:32 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYMVh-0000000GiGA-1Dvk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 10:54:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1766573661; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=zj162aZxQBEU+UIjJS9+a4lH3G+iwLeQyL/18BsRVfw=;
	b=Ft9NHhxYr/yQgVA/Tm+jTK9Egkc5lsdu2kntgcFfW2aVq7VL4ekoChUEMxyjA1+ysUPiyJuEe11HubKOHy7wbtyLDeDD0CTFkxQE5bJxziTRQzQRQubNAJmhe4P8GTE/0eo+ZRGo+RVq8yG/R8Jo8SQYMSW8puY4GmFNzfyqpWc=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wvb6GVT_1766573657 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 24 Dec 2025 18:54:18 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: baolin.wang@linux.alibaba.com
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	baohua@kernel.org,
	catalin.marinas@arm.com,
	david@kernel.org,
	dev.jain@arm.com,
	harry.yoo@oracle.com,
	jannh@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	mhocko@suse.com,
	riel@surriel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	surenb@google.com,
	vbabka@suse.cz,
	will@kernel.org,
	willy@infradead.org
Subject: [PATCH] arm64: mm: fix passing the incorrect 'CONT_PTES' for non-batched APIs
Date: Wed, 24 Dec 2025 18:54:07 +0800
Message-ID: <38f3d9fbd486bdd75874a833a24a8c704b6b5a95.1766573044.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <3b427d9010a6d52f2b91342760f12be097d21cf6.1766455378.git.baolin.wang@linux.alibaba.com>
References: <3b427d9010a6d52f2b91342760f12be097d21cf6.1766455378.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_025430_000599_D2F45D8D 
X-CRM114-Status: GOOD (  10.18  )
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

Since contpte_test_and_clear_young_ptes() and contpte_clear_flush_young_ptes
have  already performed CONT_PTE_SIZE alignment and will clear the young flag
for the entire cont block, Their non-batched callers do not need to pass in
'CONT_PTES' to specify the cont block range. Otherwise, it may exceed the
range of a single cont block for the non-batched cases.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
Hi Andrew,

As I conducted more tests, I found that the ptep_test_and_clear_young() operation
may clear the young flag beyond a single cont block range, causing issues.
Please fold this fixup into this patch to solve this issue. Thanks.
---
 arch/arm64/include/asm/pgtable.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index d5fbe72e820a..5e9ff16146c3 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1823,7 +1823,7 @@ static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
 	if (likely(!pte_valid_cont(orig_pte)))
 		return __ptep_test_and_clear_young(vma, addr, ptep);
 
-	return contpte_test_and_clear_young_ptes(vma, addr, ptep, CONT_PTES);
+	return contpte_test_and_clear_young_ptes(vma, addr, ptep, 1);
 }
 
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
@@ -1835,7 +1835,7 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
 	if (likely(!pte_valid_cont(orig_pte)))
 		return __ptep_clear_flush_young(vma, addr, ptep);
 
-	return contpte_clear_flush_young_ptes(vma, addr, ptep, CONT_PTES);
+	return contpte_clear_flush_young_ptes(vma, addr, ptep, 1);
 }
 
 #define wrprotect_ptes wrprotect_ptes
-- 
2.47.3


