Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6EFC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v3KNxe0yLoF7PUMUYd/OqmVO3pDmLAAWwOynTW5KQ9A=; b=qhUkpg2NUQpXAVHjlABNrSY/24
	b5lAukwC30AgOiCLgJWc0prABNAF4AXYkUvSPVV46k00o22Ocu1/mdzu+xwG+6zf6D9Vxxz5oe/Ju
	qkHinrVam8zAyi0qcGYJ4+svrBAEmhGHySNKqLwJ4rO90DcPo28p8AbZgsHPRhV9V8FO6tDeuct+/
	RTn38FZuQJVQY7CqVrTieKK+Sj2LtSyWezETE3bDL3/3amCyPoggsWg6/2JNCpMu4cVzjUIS4GhJS
	8VBISu5qaFFtwsqqhWrDsbzrEMsiAc7h6jCoMe6+Qc2S7fGR6YKmzrPJFh65+R0tezfmeGnapo68o
	DmQhbGkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyPl-0000000EiOx-30Ld;
	Wed, 15 Jul 2026 12:08:37 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyPj-0000000EiNN-16jv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:08:36 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2cc73e322dbso64369855ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 05:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784117314; x=1784722114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v3KNxe0yLoF7PUMUYd/OqmVO3pDmLAAWwOynTW5KQ9A=;
        b=dGMtOFShTJoPxXnk8Ec1vUtHQzqX+TexxgLqq0YCsdTV1R1pecI552BXDnMxzlrPSH
         km1py9T0MUFp2wDljwj6zRkgWPzAFtk9IkFBTRdUOT4KMAzKAgGuY1xwCb9DDFabvODn
         rr1ryKjSy+HndKOtiSfRAcINLFkAoLW6JYD3EbLMWccLQVH/cfYvqMqnoeAv8TiVOHK7
         a9BWMCguNwhx3++ITYBAIlHUWd+ys1B1m7UYgdVpH0NoL6GN0ejuwBdg+2+PmA6P8hhN
         kD7qoW2bFL5pX7sEiYQSuvTtB2NAuqlJACKyUhJXwxcc1MJOLVmFeINnsZ0WG9gU3SfF
         DSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784117314; x=1784722114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v3KNxe0yLoF7PUMUYd/OqmVO3pDmLAAWwOynTW5KQ9A=;
        b=Ka6CCg+aLx0zNBs3b+o4i9ufPCsZJqG6KL/dcp/yglry/rxclb72YOH7BaZdW+JGRc
         FiPxDADwkpqOn/Hn9jLbAYlaLhLLLDEMtg73S3ciijaWY2muGCcPTC8gw4dGcV5rtpvW
         qS0j6GLio6MzHsyo4aDvrSn35LwvVgGFEpBXoxOgVdWjYvamr9EhS6Ax77DsPQvkBTDK
         SOvakbLLVB0L2YQb1b7j3UJ48A8ORkG1Hk55ZUdJUkV6CR5fGUt5uZp2M7ZYLxEetsaQ
         y1iw6ijGJffpYhU0r6aqmyjc1KFF7Ad3p2JJNGHmLrcSPftCArlpGSmfMlZJYaAZ52mX
         fuHA==
X-Forwarded-Encrypted: i=1; AHgh+RrxIrsbKIvKy1nLGCQAr5uO2k21XGRtLC0aE8vRtc6y6ynRsTqGWPto2FJxAzN2Hvx5siJ5iC/lmEFLx9DOiK3c@lists.infradead.org
X-Gm-Message-State: AOJu0YyWW5wGKcRwgYh2+kZ8gkSzCCWXvhDwuDHrPFMqfEvHEd16b3ce
	e9vLtVUxblvDp2/iJq3nHVof/UMvJmIP0xpAH0RHIENNUzGvkeR1di+R
X-Gm-Gg: AfdE7ckUQhSKMU3v3NUZuzLOLShYnB2PsBkYASyOdbTa7f//VIJ7AiqOvIcb+CK0EMz
	KETs0765R7MEz984H8QW43EA/a0LC+ZyGm/jCc5rq4NFF6iXj9dDETztGTq5taAvYNcOK4ne9O/
	/uT+0ZpyHCz16/vI6Vd8d/WuRGzalLYkYdhhaMs5wcqqmbr1P0BfKvFMM1gP42MIfb5E3+ixVJz
	fD9DHC67ZqIQi00nDjixkQprvbS46v7mdi28Ckkvh07wVvwPLf8u61vbNuCAZkQU2038Q1eyQWV
	7dMYhgzyJA063peVYYln6HZkxHJg6tkphhE6asVqk+i5kncKBF20hNII+Yy0iDspErGTtuLWSSV
	Wj7dOlVrHZwWmYz5vPRko6dfCEyF6k94o088BEoPSKgXOf+rS+pu7Q1jyadTZNTr7lSar458o14
	NVjakDIEDECMrEy0glHP6AtjAYtkV2hzJKAgc=
X-Received: by 2002:a17:902:ced1:b0:2ca:ec6f:aeca with SMTP id d9443c01a7336-2cf03c76231mr23240965ad.8.1784117314292;
        Wed, 15 Jul 2026 05:08:34 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf105bc642sm1216325ad.63.2026.07.15.05.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:08:33 -0700 (PDT)
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
Subject: [PATCH v7 2/7] arm64/vmalloc: Allow arch_vmap_pte_range_map_size to batch multiple CONT_PTE
Date: Wed, 15 Jul 2026 20:08:08 +0800
Message-Id: <20260715120813.3609949-3-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715120813.3609949-1-jiangwen6@xiaomi.com>
References: <20260715120813.3609949-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_050835_315470_543759CD 
X-CRM114-Status: GOOD (  12.72  )
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

Allow arch_vmap_pte_range_map_size to batch across multiple CONT_PTE
blocks, reducing both PTE setup and TLB flush iterations.

For CONT_PTE_SIZE-aligned ranges, return a power-of-two mapping size that
may cover multiple CONT_PTE blocks, capped below PMD_SIZE. These sizes
are vmalloc mapping spans, not HugeTLB hstate sizes.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
---
 arch/arm64/include/asm/vmalloc.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
index 4ec1acd3c1b34..d665f9d687422 100644
--- a/arch/arm64/include/asm/vmalloc.h
+++ b/arch/arm64/include/asm/vmalloc.h
@@ -23,10 +23,14 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
 						unsigned long end, u64 pfn,
 						unsigned int max_page_shift)
 {
+	unsigned long size;
+
 	/*
 	 * If the block is at least CONT_PTE_SIZE in size, and is naturally
 	 * aligned in both virtual and physical space, then we can pte-map the
 	 * block using the PTE_CONT bit for more efficient use of the TLB.
+	 * The returned mapping size may cover multiple CONT_PTE_SIZE blocks,
+	 * capped below PMD_SIZE.
 	 */
 	if (max_page_shift < CONT_PTE_SHIFT)
 		return PAGE_SIZE;
@@ -40,7 +44,9 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
 	if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
 		return PAGE_SIZE;

-	return CONT_PTE_SIZE;
+	size = min3(end - addr, 1UL << max_page_shift, PMD_SIZE >> 1);
+	size = rounddown_pow_of_two(size);
+	return size;
 }

 #define arch_vmap_pte_range_unmap_size arch_vmap_pte_range_unmap_size
--
2.34.1


