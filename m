Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E09ECCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 06:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CRTZuq0rY/gTMYppLw9GyTOtJvw+MiEqTar8oNbvhUU=; b=E2WDXmEbLAcwOvyuwWXI1Nzsig
	woPI2eNj94Gq7LLSgY7Ceqgg2hFDnQlKMIzfOPNmJQ/dQofPZgh7zsHI6jyh5Aws3ZrX0v5HdbFo6
	0opCBLngwSvZVfeEDXJpDMct8sPKjT1RQbhBzgJfIxpgvC7z2OLvpwKy2y/Db0MOV9cu6/7jPgjUP
	x6oo31pZWhe1M7DNBKJibG0mZAOfiNnwaYUs0joAWYI3Xbn2Ncu8QOFHcWUErnO1nrYq77guQiyy0
	sbW7z2zk38EqUHE/b6tKQtciFqyEpQvCpQ0mDvU8GAnq0ugI/2Q3GuLJUr5KbvF+XqCT5ApeAqB4i
	rjkVsprQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ4KT-00000008C9C-2jzi;
	Wed, 12 Nov 2025 06:27:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ4KR-00000008C8I-0vVm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 06:27:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51F4B1515;
	Tue, 11 Nov 2025 22:27:30 -0800 (PST)
Received: from MacBook-Pro.blr.arm.com.com (unknown [10.164.18.56])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E6C543F5A1;
	Tue, 11 Nov 2025 22:27:34 -0800 (PST)
From: Dev Jain <dev.jain@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: ryan.roberts@arm.com,
	rppt@kernel.org,
	shijie@os.amperecomputing.com,
	yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH 2/2] arm64/mm: Document why linear map split failure upon vm_reset_perms is not problematic
Date: Wed, 12 Nov 2025 11:57:16 +0530
Message-Id: <20251112062716.64801-3-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20251112062716.64801-1-dev.jain@arm.com>
References: <20251112062716.64801-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_222739_305463_AFDA02E5 
X-CRM114-Status: GOOD (  10.37  )
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

Consider the following code path:

(1) vmalloc -> (2) set_vm_flush_reset_perms -> (3) set_memory_ro/set_memory_rox
-> .... (4) use the mapping .... -> (5) vfree -> (6) vm_reset_perms
-> (7) set_area_direct_map.
Or, it may happen that we encounter failure at (3) and directly jump to (5).

In both cases, (7) may fail due to linear map split failure. But, we care
about its success *only* for the region which got successfully changed by
(3). Such a region is guaranteed to be pte-mapped.

The TLDR is that (7) will surely succeed for the regions we care about.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 arch/arm64/mm/pageattr.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index b4ea86cd3a71..dc05f06a47f2 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -185,6 +185,15 @@ static int change_memory_common(unsigned long addr, int numpages,
 	 */
 	if (rodata_full && (pgprot_val(set_mask) == PTE_RDONLY ||
 			    pgprot_val(clear_mask) == PTE_RDONLY)) {
+		/*
+		 * Note: One may wonder what happens if the calls to
+		 * set_area_direct_map() in vm_reset_perms() fail due ENOMEM on
+		 * linear map split failure. Observe that we care about those
+		 * calls to succeed *only* for the region whose permissions
+		 * are not default. Such a region is guaranteed to be
+		 * pte-mapped, because the below call can change those
+		 * permissions to non-default only after splitting that region.
+		 */
 		for (i = 0; i < area->nr_pages; i++) {
 			ret = __change_memory_common((u64)page_address(area->pages[i]),
 					       PAGE_SIZE, set_mask, clear_mask);
-- 
2.30.2


