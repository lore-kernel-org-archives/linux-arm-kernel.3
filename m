Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C14C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 08:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BORzaS8UMoTufghFvn6+seF/n3gYea85fRPT58fYDQ0=; b=HER61qlO4qkaQjJ7OkoMsSQE0H
	m4d9MNGvPBW3JkNsCo/Pj7S15eyEypgLtjoOTTNa5NteL8jlbU/zXsz7bZr/bW7xHhmBPdaD1Q1cD
	aiePiF3oJHCsdlXRal+UjuwCY+JaCyzZbgwgs0zEw7AWlbvrC7V3It5eyW0u6LIJUv98rveXc59M9
	bhEaMn5Pf52YB3sN11DjTqlbhAw5ib1dL6/uECQrwWmeeovbAxRApTQY/Lgo//8Z1WYmxWFNyoX/h
	NAAgyLl2PGo1K8j+aGntDFI37UdX0GMiv/8HpdYV14v52SFqcovtWN+m/zxBC5HTTBx6KOuHjrBho
	24JJssAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGvQv-00000008I3q-0J6M;
	Mon, 19 May 2025 08:01:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGvFN-00000008GZG-1yCV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 07:49:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08DE914BF;
	Mon, 19 May 2025 00:49:04 -0700 (PDT)
Received: from K4MQJ0H1H2.blr.arm.com (unknown [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5ADCB3F6A8;
	Mon, 19 May 2025 00:49:10 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org
Cc: ryan.roberts@arm.com,
	david@redhat.com,
	willy@infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com,
	vbabka@suse.cz,
	jannh@google.com,
	anshuman.khandual@arm.com,
	peterx@redhat.com,
	joey.gouly@arm.com,
	ioworker0@gmail.com,
	baohua@kernel.org,
	kevin.brodsky@arm.com,
	quic_zhenhuah@quicinc.com,
	christophe.leroy@csgroup.eu,
	yangyicong@hisilicon.com,
	linux-arm-kernel@lists.infradead.org,
	hughd@google.com,
	yang@os.amperecomputing.com,
	ziy@nvidia.com,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v3 5/5] arm64: Add batched version of ptep_modify_prot_commit
Date: Mon, 19 May 2025 13:18:24 +0530
Message-Id: <20250519074824.42909-6-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250519074824.42909-1-dev.jain@arm.com>
References: <20250519074824.42909-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_004917_551500_22D3F56A 
X-CRM114-Status: UNSURE (   9.62  )
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

Override the generic definition to simply use set_ptes() to map the new
ptes into the pagetable.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 5 +++++
 arch/arm64/mm/mmu.c              | 9 ++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 8872ea5f0642..0b13ca38f80c 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1558,6 +1558,11 @@ extern pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
 				    unsigned long addr, pte_t *ptep,
 				    unsigned int nr);
 
+#define modify_prot_commit_ptes modify_prot_commit_ptes
+extern void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
+				    pte_t *ptep, pte_t old_pte, pte_t pte,
+				    unsigned int nr);
+
 #ifdef CONFIG_ARM64_CONTPTE
 
 /*
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index fe60be8774f4..5f04bcdcd946 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1543,10 +1543,17 @@ pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte
 	return modify_prot_start_ptes(vma, addr, ptep, 1);
 }
 
+void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
+			     pte_t *ptep, pte_t old_pte, pte_t pte,
+			     unsigned int nr)
+{
+	set_ptes(vma->vm_mm, addr, ptep, pte, nr);
+}
+
 void ptep_modify_prot_commit(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep,
 			     pte_t old_pte, pte_t pte)
 {
-	set_pte_at(vma->vm_mm, addr, ptep, pte);
+	modify_prot_commit_ptes(vma, addr, ptep, old_pte, pte, 1);
 }
 
 /*
-- 
2.30.2


