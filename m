Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599C7CA600A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 07:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7XwukL8/yd82nFdVG9qm4VBZNIyM/fBMMvZK+hA2jjo=; b=Ca7v2KweQhhjmVQ1TyFedIxFSX
	QcjqP2iIMnuWRYI0QxayI2TzGQtsZNr26Rdw7O2hZreMKT8uX5y8oNGm7GsnDQnqL7dO9QlmpHcXy
	O/gHkgqg5LzMFuQZXjglol2w2p6kKsU4q684TQFp8+WlyVTyFiT1ynHjoqf+goDT9a3ums+FD5fPf
	+GMQDg3bxEYrbQsbp9rdfNc1FaPBr7vyn8PSBFHJ9bQnn0e3XKuqUW4A0WrBJeJGktsEg+wG7mBxs
	rYLTyqg3L/2hAZLkkADOUrCL8utzr7w4qqGNBgRgKVG294E6NJV/ltfFY8EGwY98JznTuY51rPR/1
	wGe/0uCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiaZ-00000003ke9-2rgD;
	Thu, 08 Oct 2026 07:30:51 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiaW-00000003kaN-18pW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 07:30:50 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2d6d28aa26cso24219135ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 00:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791444647; x=1792049447; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XwukL8/yd82nFdVG9qm4VBZNIyM/fBMMvZK+hA2jjo=;
        b=BABKwXyqi8VMVWvSrxxrCTOzGbYXGyx04JDTZOoMm5jyY+WgviQc+U3Al3izW8lYIx
         u7abdrSxiwJk848SiNlNoyDrRj88yliado4cimebresp5jzmuXh9YVGlv11eNb/ST+Q1
         /sccXyXUfOU/dAN9IwfBVR24eIk4PziHVfBG2+sBzXxvmVNe/5M1aZdn6uYDKRYsI8lw
         XUwx8DoySUF5A1OAgXt+JsuwDw/yoUgB6I8dDZjZIdDCt493nc4GiJ4dfH9YAgv7sFR0
         +246exzALsV0eeI6dLWtKy4ig9WZ6K94Y9lwPFwt6t01xeTQEvL8435AQVYjvIhko0q8
         5N7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791444647; x=1792049447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7XwukL8/yd82nFdVG9qm4VBZNIyM/fBMMvZK+hA2jjo=;
        b=zbFEmNWLAH3ZsRp8Vzo8fVVw5psfw5/3mdUsvkhen0HQMrGTDAaiqqBvEBWR11rtv2
         sydU4fs15v+kKuBW+YD9QgYJT7ghTokxuBZV2h6BJn0ISJB7rgONFzSwPHOzkRGTh24r
         KGtkKCa1x1YEi4bNyJVWm5s5mOF8+uuKsKQReutCDGX30LkiBzKBu0hNRWwP5kPtPAEe
         b1M+XaIk7gM9IKVy+qg28GCbeYX73SqBGA5sU6f6vcECWuzt8Td7HiYHoHklN900ZqJu
         HyPAPLQhy3agmFBZ+P6imB38sekQcpBj/rHQwesg5F+VSQ2xMfuM3DxK3aO06VqqEWtn
         a8dQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpDfV2l0sKcfcqpCooryZVHE2T+G4otYP4eZN77HBewQsekuROZN6U1mAW3wypDPPLypO2yV2ZVA/1Od+EZgF+@lists.infradead.org
X-Gm-Message-State: AFq9FYLOdRwbQSWhffmZva1Y+x996BxpjSuZ2hBnWBKOBIME7VTvDPRa
	dnmPKL/BYd01YKCUS8pSHxLa3NDzHurj+Zws6Ahhr4GPeAHqscLgGQtcf9100vdBDpY=
X-Gm-Gg: AYBFou36lSJATt7jRvMACqwDxjlvcm9kJpCYEc5uTf0afrwbkXmCqtFhqt0hCKY2Qnc
	RiQzrP3dHYlY0sQarDHd4epYSsDpygHdFx6q9ApussLsLU1icWxT9GYAApO/3D4iU8LtIEi5cDk
	eBwL8CBYQCUg/xytyEgC8gC3M7PJhpjH09HNburNbtYAOGPygdjuaPwOliFT0erwmhgWPD1dLsA
	EsUeQVjYLw6oQO9S9i0JtzfBnp/K90+CKcJc16BId2BK2gV7SJ+j7IqLQz51/ohnBnikUur+UNW
	6DcBXrCx0nLiiZexqmTrQtF2XQ0CKH/9Uu/t9annhhYr9V3uLoYr2Hj8bGE2yTQ6NBIm8ofiOF0
	Hi9EYyzeTnmXBSgElQPmNVTSItMWboaqdjmGqP3xXy9dmFi0pzKQWXLJ9Sd4X1qwv1WJ5VeJOc7
	jTxYaCxw7yqn8jX7XDv4x8n0wcw0+E19u0S8/+FAZwhIfKRSrVfBOxYLbsg/JbA/8YkiVoa/qZs
	vpHgVZJzESc7Fteox0=
X-Received: by 2002:a17:90b:2652:b0:3a7:b260:9cc6 with SMTP id 98e67ed59e1d1-3a8a1b91be4mr3069089a91.42.1791444647313;
        Thu, 08 Oct 2026 00:30:47 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a438f25dsm3114715a91.2.2026.10.08.00.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:30:46 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	stable@vger.kernel.org,
	david@kernel.org,
	osalvador@suse.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	bjorn@rivosinc.com,
	apopple@nvidia.com,
	linux-kernel@vger.kernel.org,
	muchun.song@linux.dev
Subject: [PATCH 2/4] riscv/mm: fix hotplug page-table destructor handling
Date: Thu,  8 Oct 2026 15:30:19 +0800
Message-ID: <20261008073021.2512665-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261008073021.2512665-1-songmuchun@bytedance.com>
References: <20261008073021.2512665-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_003048_316804_68A7090E 
X-CRM114-Status: GOOD (  13.63  )
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

RISC-V uses the same memory-hotplug teardown code for the linear map and
vmemmap, although their page-table pages are not always allocated in the
same way. Late linear-map allocations run page-table constructors, while
vmemmap and early allocations may provide constructor-free pages.

The PTE path unconditionally runs the destructor, which is wrong for
constructor-free vmemmap tables. The PMD path avoids that problem by
using is_vmemmap as a proxy for constructor state, but that assumption
will no longer hold once runtime vmemmap allocations use the normal
pgalloc helpers.

Page-table constructors record their state in PG_table. Centralize
page-table freeing and use PageTable() to decide whether the destructor
is required. Keep reserved and constructor-free pages on their existing
freeing paths.

Fixes: c75a74f4ba19 ("riscv: mm: Add memory hotplugging support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/riscv/mm/init.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 857f9a55039c..429a0b015ec1 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1486,10 +1486,19 @@ struct execmem_info __init *execmem_arch_setup(void)
 #endif /* CONFIG_EXECMEM */
 
 #ifdef CONFIG_MEMORY_HOTPLUG
+static void __meminit free_pagetable(struct page *page)
+{
+	if (PageReserved(page))
+		free_reserved_page(page);
+	else if (PageTable(page))
+		pagetable_dtor_free(page_ptdesc(page));
+	else
+		pagetable_free(page_ptdesc(page));
+}
+
 static void __meminit free_pte_table(pte_t *pte_start, pmd_t *pmd)
 {
 	struct page *page = pmd_page(*pmd);
-	struct ptdesc *ptdesc = page_ptdesc(page);
 	pte_t *pte;
 	int i;
 
@@ -1499,18 +1508,13 @@ static void __meminit free_pte_table(pte_t *pte_start, pmd_t *pmd)
 			return;
 	}
 
-	pagetable_dtor(ptdesc);
-	if (PageReserved(page))
-		free_reserved_page(page);
-	else
-		pagetable_free(ptdesc);
+	free_pagetable(page);
 	pmd_clear(pmd);
 }
 
-static void __meminit free_pmd_table(pmd_t *pmd_start, pud_t *pud, bool is_vmemmap)
+static void __meminit free_pmd_table(pmd_t *pmd_start, pud_t *pud)
 {
 	struct page *page = pud_page(*pud);
-	struct ptdesc *ptdesc = page_ptdesc(page);
 	pmd_t *pmd;
 	int i;
 
@@ -1520,12 +1524,7 @@ static void __meminit free_pmd_table(pmd_t *pmd_start, pud_t *pud, bool is_vmemm
 			return;
 	}
 
-	if (!is_vmemmap)
-		pagetable_dtor(ptdesc);
-	if (PageReserved(page))
-		free_reserved_page(page);
-	else
-		pagetable_free(ptdesc);
+	free_pagetable(page);
 	pud_clear(pud);
 }
 
@@ -1645,7 +1644,7 @@ static void __meminit remove_pud_mapping(pud_t *pud_base, unsigned long addr, un
 		remove_pmd_mapping(pmd_base, addr, next, is_vmemmap, altmap);
 
 		if (pgtable_l4_enabled)
-			free_pmd_table(pmd_base, pudp, is_vmemmap);
+			free_pmd_table(pmd_base, pudp);
 	}
 }
 
-- 
2.54.0


