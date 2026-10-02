Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8FDCA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nTdpftTlHppV79iqmYzW2DHPoEL/OonFlSGPOrnWHYM=; b=dwKpQeM7CYFn+GoebFhBN8jLvJ
	L4AoXBakFqV8k8xkOkfZmR5e3xY+DgpfyNJc0p/p0n/FpiWq0AOBZ1DKrXggzetLveWgjAUUqkwhe
	QICoybVyftJI91EcbqIJs7IcZe/fbx74Ro/Fu0urYRzfcPC/kMovgUzc/3euwFu0UHvR6WUdSfnJT
	CwWEUZb+d0xahAuc1F8KfXh3UAoacmW1b1rWoy5OjaBgxAZAZ/iKn7JWxHdHFyvF2/VHAsHJl5Oi/
	Ua7qkq1WhtekRTm9SUXlreXBXOSwKovN2bMOWl8lg7SHtJkKCbDyNP9WV9Q4ia9L7CI2+MWxk2lrt
	iLcW2WEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZHc-0000000B4iG-30W6;
	Fri, 02 Oct 2026 09:10:24 +0000
Received: from mail-pj2-x2a.google.com ([2607:f8b0:4864:39::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZHZ-0000000B4fG-1RCM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:10:23 +0000
Received: by mail-pj2-x2a.google.com with SMTP id d9443c01a7336-2e2dd05994cso12548435ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 02:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932220; x=1791537020; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nTdpftTlHppV79iqmYzW2DHPoEL/OonFlSGPOrnWHYM=;
        b=fbpcoK6h2UAZj6PCIQDW2PSC5D0Uur6QtpND+rkq9y7npNxgRKK11N7401a/ANf8j6
         m6PFNVdtNkFuKoScgwoNgWXg1DxUe5REwsUL9ZEdvu0yqX8MfIiwu8RZ63ebkfCST9hP
         tJQap/ZbDOs9bdNCk6TTwdTEo+IX8pqqE4fZRYmc7o89fK9O+SSXkKvMZBtXnmp+kdmJ
         xWdDamEuKKZNVeZP2+yg+vpok/KN8Dx07G+tw1Thcp612sba5DBwNn/JTcBra8hDGKQf
         bvtKtOACHSC8oP5Q7HJRILcrRtDRUJW6kn0uIn7pdPML+yG83YsdN0NGq4KwFrI7+DJo
         1XCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932220; x=1791537020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nTdpftTlHppV79iqmYzW2DHPoEL/OonFlSGPOrnWHYM=;
        b=gkdAxkT3yEqFh5g04gAYYwVquugAw5Dhec9WjJ9ooEz6WW4OOTp/0AudJs24RXzyx5
         bx2s7MhXS5q8lFdsvXE9fUhnAxh4gvel1NP7GSQBC5a4bq46n+RptKpO/LHkHxljnTtJ
         +I1Li3qPsUhfC9J0xqGPdDWP7fNeOXikIBdIhg0xlmOtAJcFOCKtv16ry056tfOGjRqV
         x+ESBlQXPb688ZgpGgGRl+IhyzQID3yNNN5/GvGoNVesjtH9KFYeS8kprPoWnfGk05dS
         8Z6muy2ya+b0VvL4EQihM2UvfQt3JZcsayFTgCt8VP684EAkd6YOEtlvnSkVgj9Grt+2
         wjsQ==
X-Forwarded-Encrypted: i=1; AKwUvBy32rCMV+Wgq6xQcODwGMQ88Pe/Hi8187L/ATgG7nCuRblE1P4cvPWwl1nXGKduWGDtuxMcw3RwYX4nSaUJLO4F@lists.infradead.org
X-Gm-Message-State: AFq9FYLmHX2GUUKJmy9U7IknbYhPQ4/bNkzD4GiUWuclx5Jr9rIY6xiO
	+CS8n+/0alfZK4tM3CFgggPzEWQDjXpPq9CtUcs7OTiy+G5edF7yQpN+
X-Gm-Gg: AYBFou0xPJ0XjKKJ9gslP7yuP2q8HluTV5+aIwM/RvLzERHRCEehRRRLeRccEVoYP4A
	bloC83RoGIDm5CV9cZbn8AzRmLTQ2HD2dj4CzBHOPDuEeEzi4RzvAZRSP25qZQ5RpWxqcy6tH+l
	LEtRfzNR6jItSzKbRUlXIpNyREUovR+aC8zYgvTfZX1PMbzN2ImpUy8iX+SHVFRNKqb/LTXe+Jm
	2QFyVI7fCUrltnnILi98Aj1EbT100B9jfPlzlBDRh+YHhk4RI5ahWXXL71ZgIddRLu0ri3VD7vi
	aTGQcn8LIcSla/MZZRvVSLYtgC3fZRGZ0Co8pCBD9woNYLdbJP7YNgDFj6/y8qrND5VdksewUOL
	A/f+ZcbdRwhycqhkst/hIIN5ew0bYzAPVzKBStFLEpDhvv43DRGhPfVjO+HRHoQMVYLIx8O6Ss9
	thdykd4DbmrnwSsLJotI/EhhRycBbSItWv/cPmz9H6sO769uLdM9lxJXEqAvh5zhd5IOILqBVNv
	zoDhqib+MigJVy1Dy6Oww==
X-Received: by 2002:a17:902:e88e:b0:2e3:598:75d5 with SMTP id d9443c01a7336-2e49b6ad85fmr18169625ad.74.1790932220371;
        Fri, 02 Oct 2026 02:10:20 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6ab2b9sm5480555ad.36.2026.10.02.02.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:10:18 -0700 (PDT)
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
Subject: [PATCH v10 04/10] arm64/hugetlb: drop the init_mm special case in clear_flush()
Date: Fri,  2 Oct 2026 17:09:41 +0800
Message-Id: <20261002090947.869220-5-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261002090947.869220-1-jiangwen6@xiaomi.com>
References: <20261002090947.869220-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_021022_225757_527187BD 
X-CRM114-Status: GOOD (  11.74  )
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

clear_flush() calls flush_tlb_kernel_range() when mm is &init_mm. This
was added by commit 06fc959fcff7 ("arm64/mm: Support huge pte-mapped
pages in vmap") because vmap called set_huge_pte_at(&init_mm, ...).

Now that vmap uses pte_set_huge()/pte_clear_huge(), mm/vmalloc.c is no
longer a caller of set_huge_pte_at() on arm64. The only remaining
callers passing &init_mm are in arch/powerpc, which uses its own
implementation. Remove the dead branch.

No functional change.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Reviewed-by: Barry Song <baohua@kernel.org>
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


