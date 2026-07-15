Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C04C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=etJA2syXRyIgV9yIfYwz42KuGi2MCTWS+UAi0vZeNE4=; b=bxe9iSY/silzioNSZrpWKMmIAk
	EVg02QuFc8tpXPD/Gw3nicoLORGYJj6gYt9ci0xPdAxrQV/NdTYwCrBRMXv1uXlEwegnY9EBCsQ1o
	3Fo7+t12eUnLIkImwe3HAzfGhRFFbmCdJXetzcIvWp3sZCNyOKv3K2MVnoZ7WFWwbDekY+Y3L8Czv
	G0vSMvsRfM/0D8YrSBxDdq1xbvkr7MVfmS7F5XtQMIP9308DF7GY5dFlPHMzijUY0df4GPkM+P1BD
	QyisdrP2Sr3/dVd9c4CbJKRvJ0PJAlDAo64iBYaO4BpIc+uZL5Rr9g8hDw1SnSxtqb1f4f7m3yill
	7Q2lQy1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyPf-0000000EiL6-1JLA;
	Wed, 15 Jul 2026 12:08:31 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyPd-0000000EiKC-0Qf4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:08:30 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2caf228a910so40363165ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 05:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784117308; x=1784722108; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=etJA2syXRyIgV9yIfYwz42KuGi2MCTWS+UAi0vZeNE4=;
        b=QkV/3tkBInDhbvjuIJJ+M3vSk45YqZ8vURT+zXPpE3e7eJlPTglNylZ9l1jOARYPfN
         i8WBgSeca0BI4RlsGJ6FdBXc9bGPEjHX+l4OJrYthvGKio6b9WZ4KlHUiWIWotv6Xy0A
         dcqqRWVopd28NH0Wh2gdKc8sGair84jG/+ywLCEzIOZc+C6wvnwcTsDeXze+b1qxdHkm
         LbdrFZd7Aac3cKlhaoxlKLxPOJct1YFg8ClX6nxJrnHVCwkqHap64Pp6hYpiopLzlkPJ
         emQ4ugTm6fAWFcwd2I85u1QobSZzf18TBMmWP8SyekLzkQ4YmVlP4OVHJlk+zJ09JS8H
         uWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784117308; x=1784722108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=etJA2syXRyIgV9yIfYwz42KuGi2MCTWS+UAi0vZeNE4=;
        b=CjIQe/gPLN4TMewv8BKJY3tiALVvOXA9K6iUQ8eqiLwwvC+wqGCHVzPk3Nmwsyahac
         /UzSDz9uU95VkLqz1CtYEboSkHAB48Ed/+dYL6k1MB0FuMu2KFVRuYZvyKTfUla2Xl87
         ce3JGZ3t26nM6KDv+nfjhQhbvh8HdF+D+rwAv7Q/hM5Q3mTR6QCytzGoijOWjjZk4huw
         Zj05nAQIapioUbqDzLQ69T55O3yIxilUolpvcezFJ8TmCiRn9O7OqbhexEnHKYrkZb/N
         vi9Y4830a5pIycISkGyv/dOKG/ervjulxRnqL646tmWhQYVOcsjgd2N4VCn13qdEfogD
         hEDQ==
X-Forwarded-Encrypted: i=1; AHgh+RomvcnnGFHLqUk+XTTmKuZYjm1C3ZClG9abvJmsvJoNos47pM2nHXmEElma57I5nk1E7LwRj9PgbUk7Llxe2jaG@lists.infradead.org
X-Gm-Message-State: AOJu0YxbPbHX1HJeIKn2+cCiRyT9s67Lajc877SXvDY7p+ggzT7jMvEz
	AZ1jA9Ds9r5Ni01ThLiPoIYrNRJ5NWd8emyxvR2QJFnfnknX0Jn3c97R
X-Gm-Gg: AfdE7ckuI0Y+dpEi72kyqR3f0UbZfInDrHx77Z+Ws7yFyfMMYJQ5klNN2SgN0g/Hjiv
	IfsBDHpIyCl5r0FWXv3uYCHxEsCFc2Jw6P1Ke3rzWloGkix82HmmE19eSUaJSjI8NVBJm3Be/qi
	vfCi90NVzSpoZunkplXGNAfbfWz9kSpopLX2zBNCe+2VmwCkvqFhAnYzL+SgQcK99FS7QWdCrFH
	MGuJsXyzeiZbC46Ky6qeugon2wxFDzTCarHT7dvEz4BPlVTGZtFT1xHmOTBp3Sh3ShT0dPxiPOc
	zR2amqstwY/45x+NiZ7HqlMJerKR/UgNbAtKF9zAeS4VeJuJHaT/UxJF9SAQePHtGcHVHo3DtTO
	Kw4+xaM4Z8LbmTGDQBjtUA/xKJTp+JhOchCB8sCUF7z01pkCMwyirensi0Y7u0yvOKUGyO0mdLx
	wsr1y931qSHeQljJZXu380rK+1eYMg/3KTGLw=
X-Received: by 2002:a17:902:ecce:b0:2c9:cf5d:d9b8 with SMTP id d9443c01a7336-2cf03d24104mr22917075ad.33.1784117308327;
        Wed, 15 Jul 2026 05:08:28 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf105bc642sm1216325ad.63.2026.07.15.05.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:08:27 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	david@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	Wen Jiang <jiangwen6@xiaomi.com>,
	Xueyuan Chen <xueyuan.chen21@gmail.com>,
	Leo Yan <leo.yan@arm.com>
Subject: [PATCH v7 1/7] arm64/hugetlb: Extend batching of multiple CONT_PTE in a single PTE setup
Date: Wed, 15 Jul 2026 20:08:07 +0800
Message-Id: <20260715120813.3609949-2-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715120813.3609949-1-jiangwen6@xiaomi.com>
References: <20260715120813.3609949-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_050829_160854_541C0AAC 
X-CRM114-Status: GOOD (  12.26  )
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

From: "Barry Song (Xiaomi)" <baohua@kernel.org>

For sizes aligned to CONT_PTE_SIZE and smaller than PMD_SIZE,
we can handle CONT_PTE_SIZE groups together.

These additional sizes are mapping spans used by non-hugetlbfs(vmalloc)
mm code, not new HugeTLB hstate sizes.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
---
 arch/arm64/mm/hugetlbpage.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index a42c05cf56408..7ce159483a354 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -94,6 +94,11 @@ static int find_num_contig(struct mm_struct *mm, unsigned long addr,
 	return CONT_PTES;
 }

+/*
+ * num_contig_ptes(), set_huge_pte_at() and arch_make_huge_pte() can be
+ * used by non-hugetlbfs(vmalloc) mm code to set multiple huge mappings
+ * at the PTE level.
+ */
 static inline int num_contig_ptes(unsigned long size, size_t *pgsize)
 {
 	int contig_ptes = 1;
@@ -110,6 +115,12 @@ static inline int num_contig_ptes(unsigned long size, size_t *pgsize)
 		contig_ptes = CONT_PTES;
 		break;
 	default:
+		if (size > 0 && size < PMD_SIZE &&
+				IS_ALIGNED(size, CONT_PTE_SIZE)) {
+			*pgsize = PAGE_SIZE;
+			contig_ptes = size >> PAGE_SHIFT;
+			break;
+		}
 		WARN_ON(!__hugetlb_valid_size(size));
 	}

@@ -359,6 +370,10 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	case CONT_PTE_SIZE:
 		return pte_mkcont(entry);
 	default:
+		if (pagesize > 0 && pagesize < PMD_SIZE &&
+				IS_ALIGNED(pagesize, CONT_PTE_SIZE))
+			return pte_mkcont(entry);
+
 		break;
 	}
 	pr_warn("%s: unrecognized huge page size 0x%lx\n",
--
2.34.1


