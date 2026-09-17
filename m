Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D57BC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 05:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynKYarepbWl9Bt2lXEeL1/lRyqq80+H1joWy3Adf4T8=; b=iGme45z0o6Xu4yEYd/TeOYGa1v
	BfnyHwxVd+J2xK6Cw3b7ONjUnp4j3+7MnbIk+5qAur2bB2k5WRa8SJ139gTIRDHH/PXNShGhgOWw/
	0lFD9Q/EOMSzA1mpDdoiuX/KEGeEE8kBYIC1tTz1DFt5/mukiOI9ASCs9+TYUYYf4+wj+/eD3Zcex
	122eu8LSqcQQvq63KWGIZVwdW0vzpVJe4YCntVayEifvRq7QVu1nfEOmdPCCnr+m81oibKsmJmdV/
	qFWc64htO3a/AFsKiLFFPbDsRrSyBsCVoyZTHNY/yxY/8yjh0hy/eItfREKrLCLwunvteoW14EF+3
	OhtGIvWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x74hM-0000000AbAQ-1GKL;
	Thu, 17 Sep 2026 05:30:16 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x74hI-0000000Ab8G-0Wkt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 05:30:13 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-398c066106cso322204a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 22:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789623011; x=1790227811; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ynKYarepbWl9Bt2lXEeL1/lRyqq80+H1joWy3Adf4T8=;
        b=fqOO8lc6SqMNctYxmEfG1XCkSFezNDQaTY3xazTLudyuL+tApr89fr92ecfOpvk15P
         FgpvvAt/ipwU4LVGiWB7iMCvcsky2d7YM+ky+b/Uwse7BGrwggznplyDRjz8SADc/HsD
         wocYWyRcMOWAWpfjZ9YB/Q52xUWKlO9GibFJHZtJh+Hfj8dDEkiLImEAYaC+ttav6k7k
         mEPX397jwW5HEbaRozLxhdrNmcM0ntUVjcODNt9ouRufK8LocPE92FWYfB9IkVDJmtHr
         cwkzBw/MerRB3DAlXJ19XmR2qGangbqSwR1gjYyBS1s+uJdYE8MJJW/3OiLaretvyAAD
         DfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789623011; x=1790227811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ynKYarepbWl9Bt2lXEeL1/lRyqq80+H1joWy3Adf4T8=;
        b=Zr396I0PToaGUcJfL5EHuk8eSt1GbjEWj9UqzqD/faiXDEMP6W6KJdD4RExpJgDv2U
         xlOzUL8I+0baf6RysWwYologpmDG5j0zSYwAHNSDs38XQLiLM9r5+IBI+MHq7mg/TvJB
         cqDJerFKz2YAOFN/P0Y1G3tYbOtsDCH3cRxocbn5G5grc4hFQuaoWmA39s4tt1BP0hUk
         KhVwi7sYp9YMNmDDhIKpKPYafXlKOxEJQA76v7+MRbBMoHcdQ4X/oTWgdsQe1etOi3V7
         AONKYio44jktEfBkRKW2j4wNs/4CG11EjdS9GTwLOU1aVFi/mhnzA+/CFzciJDBy17Kg
         Jxyw==
X-Forwarded-Encrypted: i=1; AKwUvBwn7qfOt+eMCMLeHncZPm1miIULZwBjXcfg9yGk9nrf6KWpSB8i4NoxljSjWn6UbHdtSbgFXMWuQnw5l20BeLeT@lists.infradead.org
X-Gm-Message-State: AFuF++kjcdN5mcsL7mWMCFdqizf0TqiAra1t352LtQ+zcf8JnI5Pn46t
	wZn/kdD6RwL8E/cF1v4FiD1qd8RGe2e5o6lHlddEVOVa9/a+q2NEg6sb
X-Gm-Gg: AYBFou2lUWXqi+36+N/DPpajH0GcrFz4xE3DAWgViCTXxaz+abKVCCyYx3ps4Ri38tZ
	FiGkI2wauru1PBwXdwUzTC3ke4Hs5avY8O0csDV6+Hp/sxaERkq9vGxKDmmnTtIm+/GBLO22U6W
	vG4n4gsuvFY1HVoTdVZLTArhgjcsXxGeEuByKNFm+Khi5E1DdTMXP9LebFBKvzQbpMQuS9JEx4Y
	kJXRNOzpYnme8HCcCkaol1vvfIgIkvSMzvlXS6NpitmG+WmxSPP4nVbAM7HO/fJ8AyQHb2KZoQT
	11MzpWowJmH8nVRiYgf2t5nJKjP60F5MY8DHMzso4HEPeJ3Vy+63+rSwwpwZJD8HY9EMUGN6j2Q
	pDmrQ7S1AywwVDEwPFBc1Rz2CvULmmzB0gasg8M7tW+pVehXtPMlkLLg9S/IcXlW+qMileqmGzC
	ClL//C0vXk8yju4QODjTG8Jeb+k2j6z5pz+eDMk3rWFyBz7VG6IHA1GcuiJtQKJZfSJbHzFIsex
	DFqdgdasj17GJTFou63b6GGMKQ=
X-Received: by 2002:a17:90b:2803:b0:39d:ef3e:9035 with SMTP id 98e67ed59e1d1-39e1e324463mr17718864a91.10.1789623011402;
        Wed, 16 Sep 2026 22:30:11 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3abada87sm1955836a91.14.2026.09.16.22.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:30:10 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	baohua@kernel.org,
	chleroy@kernel.org,
	david@kernel.org,
	dev.jain@arm.com,
	jiangwen6@xiaomi.com,
	leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Subject: [PATCH v8 04/10] arm64/hugetlb: drop the init_mm special case in clear_flush()
Date: Thu, 17 Sep 2026 13:29:27 +0800
Message-Id: <20260917052933.188679-5-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_223012_192850_70F68FCF 
X-CRM114-Status: GOOD (  11.21  )
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

From: Wen Jiang <jiangwen6@xiaomi.com>

clear_flush() calls flush_tlb_kernel_range() when mm is &init_mm. This
was added by commit 06fc959fcff7 ("arm64/mm: Support huge pte-mapped
pages in vmap") because vmap called set_huge_pte_at(&init_mm, ...).

Now that vmap uses pte_set_huge()/pte_clear_huge(), mm/vmalloc.c is no
longer a caller of set_huge_pte_at() on arm64. The only remaining
callers passing &init_mm are in arch/powerpc, which uses its own
implementation. Remove the dead branch.

No functional change.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
---
 arch/arm64/mm/hugetlbpage.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 8e799c1fe0aa6..ce247b06fe03d 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -206,10 +206,7 @@ static void clear_flush(struct mm_struct *mm,
 	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
 		__ptep_get_and_clear_anysz(mm, addr, ptep, pgsize);
 
-	if (mm == &init_mm)
-		flush_tlb_kernel_range(saddr, addr);
-	else
-		__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, TLBF_NOWALKCACHE);
+	__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, TLBF_NOWALKCACHE);
 }
 
 void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
-- 
2.34.1


