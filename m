Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A77C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 03:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v3/ZNamF37j63F7OBjkPRQYLwgVzCnxnT7m65A9NwFE=; b=xy7OKG7A0NuQ4ch5rZg/lyaj5s
	0RnhLmIbOPTzmBE5EdOeQlk4BJM2YV4weEXIp5RkT5htJK7i2BiWNNAlVnx7VS2eddPgMmyFVqmWo
	3mBKugAVdEW2EL5kFpoa6jQRCDIyGIduaViHb5y3nDV2Sll+r6DxG4J1s+6oMG3L6nWu8qLlcgR3j
	7Ij1er4xwcTT3Es+M4duVTnfREKSGF/9Lscb+4rl9OfvZo6q0sSmmDM5UR9RfK9Qu3bWPd5/CvOMk
	QYKJcMyZlyWTSGWov9GGizcgaxkbX4ju/McHEVoG/EB1fXsqy4XiTo0SWnwLksBwWT1k3+GqVoerZ
	UxCBHiTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhS-0000000GCIP-17mh;
	Wed, 08 Jul 2026 03:11:50 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhK-0000000GC9w-2lzo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 03:11:43 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2c9e994869aso5745855ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 20:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783480301; x=1784085101; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v3/ZNamF37j63F7OBjkPRQYLwgVzCnxnT7m65A9NwFE=;
        b=Pm265fsul1PoM31C/CC9LuF9db6bK0+JW+yqzXGdKRXCEidRsizVfPgZdZJyXRNOSe
         2VdYnw2skt3COtXMi88QA8TMMLo3G6+5aDTzzEYHhCe3PnHU/+DPQxgjJOjlWEXIRWax
         w2v9vcKdB0tftRyneXD+okXn3JG0/9LYcjaznFSRNJu1yGJDSNfaGI91evVvb2VOyjes
         KQl3s11UCMiSyr811q1yioKGUgmEBILJ/bZZ+uEAdQBWSTzsCO8LY09DZD9hC9cNv/Lm
         bJJjBkIkwGkiMsbYd/UA/Zw2+7XvbBjwNKK3GYxEmYRVhjLGITqAsXRD8o4FS6W2i1Zn
         S5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783480301; x=1784085101;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v3/ZNamF37j63F7OBjkPRQYLwgVzCnxnT7m65A9NwFE=;
        b=cORhYgiYIXGU7g/l3rVNNtaVnLkXt+KfOsq5sIsB8euAPCostSd7jisOxLbaoPs/sy
         PhQGyFhtMEIDZhhAZSVuX6IjnNRvDD3fNsuSq079xcfby7sXnJYaAG1fChQbSULJYM4Q
         4mxxoQFHYnXS4l4gHAsMaRts3LzmKRJALCGUPrwsvg8FI01MoblmDq3nbPZhSxnichBg
         FbhI37b+o1zXidDCjbDsgJwdoFio/ka0kJY0k93cxhGYdMsQYH5g7RmE6CuEaZvEDt4A
         Db8DUKV8BHOYeN0tqFYWdYu52nSl18R9K4kn7bRUEpUey6YMFfpmTgOTgZLsaC7/jq7H
         G8jw==
X-Forwarded-Encrypted: i=1; AHgh+RoA6Xah/bVyB8cPCW7YwzAw2dckLmeZodF6Tas25JSrCx7mzpOQ39m1MpnvZvJb+7AtdDw18z9/q8S2ytsKu0Xo@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1gpQ7cKfVrtNARARHbpmfgiBfFyzxvcxI2HVeYsWFrvbTkHJj
	wKMeNV9sennajevfWCYZcZCi4WyiWSLjhx2fhYWrRoJLZ+CkefLydNQMCmb9l5WjYn5Z4woL6Os
	WhJgneFtrECXcc+e7vsnEAQ==
X-Received: from plai17.prod.google.com ([2002:a17:902:c951:b0:2be:fea6:e21a])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:384c:b0:2b7:975c:dacc with SMTP id d9443c01a7336-2ccea35af6bmr7910705ad.1.1783480301298;
 Tue, 07 Jul 2026 20:11:41 -0700 (PDT)
Date: Wed,  8 Jul 2026 03:11:19 +0000
In-Reply-To: <20260708031129.3503195-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708031129.3503195-10-jthoughton@google.com>
Subject: [PATCH 09/18] arm64: Prevent HVO if the HVO system feature is not enabled
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_201142_728049_7B0E8B70 
X-CRM114-Status: GOOD (  11.42  )
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

The HVO system feature checks that all CPUs support HW AF and
BBML2_NOABORT, both of which are needed for HVO (as of this patch).

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/include/asm/hugetlb.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index d038ff14d16c..73af7911fd83 100644
--- a/arch/arm64/include/asm/hugetlb.h
+++ b/arch/arm64/include/asm/hugetlb.h
@@ -11,6 +11,7 @@
 #define __ASM_HUGETLB_H
 
 #include <asm/cacheflush.h>
+#include <asm/cpufeature.h>
 #include <asm/mte.h>
 #include <asm/page.h>
 
@@ -65,6 +66,12 @@ extern void huge_ptep_modify_prot_commit(struct vm_area_struct *vma,
 					 unsigned long addr, pte_t *ptep,
 					 pte_t old_pte, pte_t new_pte);
 
+#define __HAVE_ARCH_HVO_SUPPORTED
+static inline bool arch_hugetlb_vmemmap_optimization_supported(void)
+{
+	return system_supports_hvo();
+}
+
 #include <asm-generic/hugetlb.h>
 
 static inline void __flush_hugetlb_tlb_range(struct vm_area_struct *vma,
-- 
2.55.0.795.g602f6c329a-goog


