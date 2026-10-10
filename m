Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8FCCA6004
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 11:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cPrbN6fNnAjfl8a6kAKqWueJEJ1qRXmGBrgomj1Gs8U=; b=v0WtjgW9xOS4X+o6XOJR0SYr8q
	oSvrF9YdSpYUrVOZH1A5FT0YQQlVlMX84FXFiBG381HEpfhWAzIGtreZsYJz1zphzkbhuyRoiEKV6
	/i6ErTryfseRO23PsrYPWS3TxYuQqytaYPcYKqdAFF7kvEMdE6Z8fqCT0W8F++LjfPkStsfO5+Rrv
	a9Gc9eUYV1QDQYCsUyDXlqoRu0f83Nhs/+HiTp4xhvtO98Fw92lRu8b/MTpdPLeiDLN+V7DrtvkpQ
	dHIz5KXwDwm6oJJAElD28k6H5fQKUzxcCnVqN0n4OveAf0qmPp+pYM7pQlr6ebdNDu7QIb58r9jtM
	SJwLCnXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVDS-00000007ujV-0gpk;
	Sat, 10 Oct 2026 11:26:14 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVDL-00000007uf5-2XWF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 11:26:10 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3ab3260b35dso289939a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 04:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791631567; x=1792236367; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cPrbN6fNnAjfl8a6kAKqWueJEJ1qRXmGBrgomj1Gs8U=;
        b=Hb+bdxL7pgjkI8hVX7CWQYtQMii+BoELyqRjt1rF0ntTgsJuu04oIPgkKuncfzlGZ6
         QgxGhfaM8JuGY15M+ZoadVte6iQ13O4UlJhRGDwQwJGgxgWKsQfQqEOzHPkLCjiK5YWE
         FCZ+DW/PuCMLuv4uHfSNZiqyZe21uoMNUV0mwgr/2FPd5rZ4zQ5nO9tQXLaLcgdVRTFV
         4b1NM5AV/5q76O/FLcTkrv1PJA93fuagUGxVFQVZURICPgWcB17oB+WEUY9uB0Avo/jr
         KcR/1JL+x0cIS8LripysJEBtVPXIUmdFB7eJya83tqgB8EqzOFzBT1eOR1AtOqnqY/Pp
         1f6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791631567; x=1792236367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cPrbN6fNnAjfl8a6kAKqWueJEJ1qRXmGBrgomj1Gs8U=;
        b=a8tkuGDM8QIkgT84IPE3zJeHQVcVLDxDI21HEN2GS2cq16iooN0Jqgjl992SYz7nhp
         662IQS7kRui/2Zfjir26VYsY+5k671i45JeUG+/J3WxJgptGiP4jVS67wiNX9CK8lD5j
         LYc6BzysE/+ZRNXoaxOZAXqWVQk5Yx/JG90P9vzcDJwE5LLc+X0Wq/8TzxUsSugwqPPz
         FrbNqP9yTwkog8Ts0rTjjWNdd2Xny2wMlnkJFRguws6oQL3xaI5enAeGDCiy6y7gcUHs
         auVq6DrL+etw271RLO0Me6u+sHq9B+EgsP/CSq7yJEWpQPf2PFJiBK0+wfHti+l3DRwJ
         +LjA==
X-Forwarded-Encrypted: i=1; AKwUvByfXDCoPEarQojzKDeOiXIuINRAQm9io6+sSD0coYVnu0Lt2zdloaa4J2nbBjhPUJgT62VmWx3LJFJOQw9v5Iwp@lists.infradead.org
X-Gm-Message-State: AFq9FYKWkXKU9TnrQI6xz/a4opaGcSkfDXRSVHvZKzji53sWO+ElteHb
	3L8gBrKAXuGcMLwraUyDVtJbFlfcRW0o7y/h77guHRq0VP2GQ5LUSw/Oq/5DOAtzB9g=
X-Gm-Gg: AYBFou0YL0GzgRqX/cd6ETXhc5WaxVTmrgRoBOJQphEU39bCwyi742Uemt9bICMOlPY
	EWa+g1DO/GjF1SnhZUCevE0N+QXHOMQXWiiyyO+yyjvwgvz6btsDib+JHy8SIsOY29YNBv27aKo
	+KVZgPH0WWj/Mn4JaQmvQH0kRpl/k6ljYCJ6DBCCmxQREUhq1aenf+r7U+/t0FAHswnOdy6aTV/
	JnUM0/Lj6SNCrm+y0RBY26VkuT4czk7pHYb3pDQ7VJD5jdQNGr7K6Piz8wCmop5YQ2VMlT3GH1Q
	TrdbjbDO+A7nYlhpXgN/HUxenpvUTd6TOzs2EZJhU8CxoY6DHUmBFaB+Du3QY8Jv/UiogCJDlTx
	sKPuHESLk0TdQAp+cryoLjocMCYH5l/pe346BjqKYD5mEWfDQ7s1iSOLCNSabDf3fJsnR99bhmC
	HIR0+INaT6/i+8A+2/9cAvKMYXKb/S0xpKqsVhYYSaeyOsCOfkke6VBZIQpuaZK5yd1Py1Ol/9L
	7PT+wOBC9non404askNf90UeFj2bqFoBxJ9xQ==
X-Received: by 2002:a17:90b:384a:b0:3a8:c0cd:57f7 with SMTP id 98e67ed59e1d1-3ab3a735f76mr3813182a91.23.1791631566480;
        Sat, 10 Oct 2026 04:26:06 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([139.177.225.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3690474esm7900233a91.0.2026.10.10.04.25.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 04:26:05 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Dave Hansen <dave.hansen@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alistair Popple <apopple@nvidia.com>,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 2/4] riscv/mm: fix hotplug page-table destructor handling
Date: Sat, 10 Oct 2026 19:24:55 +0800
Message-ID: <20261010112457.49485-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261010112457.49485-1-songmuchun@bytedance.com>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_042607_658183_8B1D960E 
X-CRM114-Status: GOOD (  14.99  )
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

RISC-V uses the same memory-hotplug teardown code for linear-map and
vmemmap page tables. Late linear-map allocations run page-table
constructors, while vmemmap and early allocations may not.

free_pte_table() unconditionally calls pagetable_dtor(), corrupting
NR_PAGETABLE accounting for constructor-free tables. free_pmd_table()
avoids that for vmemmap using is_vmemmap, but mapping type is not a
reliable proxy for constructor state. In particular, it becomes invalid
once runtime vmemmap tables use the normal pgalloc helpers.

Introduce free_pgtable_page() to select free_reserved_page() for reserved
pages and pagetable_free() otherwise. The latter runs the destructor only
when PageTable() is set, handling both constructor-backed and
constructor-free tables.

Fixes: c75a74f4ba19 ("riscv: mm: Add memory hotplugging support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- Use pagetable_free() for non-reserved tables (suggested by David
  Hildenbrand)
- Simplify reserved-page handling
---
 arch/riscv/mm/init.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 857f9a55039c..151eb197cb09 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1486,10 +1486,17 @@ struct execmem_info __init *execmem_arch_setup(void)
 #endif /* CONFIG_EXECMEM */
 
 #ifdef CONFIG_MEMORY_HOTPLUG
+static void __meminit free_pgtable_page(struct page *page)
+{
+	if (PageReserved(page))
+		free_reserved_page(page);
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
 
@@ -1499,18 +1506,13 @@ static void __meminit free_pte_table(pte_t *pte_start, pmd_t *pmd)
 			return;
 	}
 
-	pagetable_dtor(ptdesc);
-	if (PageReserved(page))
-		free_reserved_page(page);
-	else
-		pagetable_free(ptdesc);
+	free_pgtable_page(page);
 	pmd_clear(pmd);
 }
 
-static void __meminit free_pmd_table(pmd_t *pmd_start, pud_t *pud, bool is_vmemmap)
+static void __meminit free_pmd_table(pmd_t *pmd_start, pud_t *pud)
 {
 	struct page *page = pud_page(*pud);
-	struct ptdesc *ptdesc = page_ptdesc(page);
 	pmd_t *pmd;
 	int i;
 
@@ -1520,12 +1522,7 @@ static void __meminit free_pmd_table(pmd_t *pmd_start, pud_t *pud, bool is_vmemm
 			return;
 	}
 
-	if (!is_vmemmap)
-		pagetable_dtor(ptdesc);
-	if (PageReserved(page))
-		free_reserved_page(page);
-	else
-		pagetable_free(ptdesc);
+	free_pgtable_page(page);
 	pud_clear(pud);
 }
 
@@ -1645,7 +1642,7 @@ static void __meminit remove_pud_mapping(pud_t *pud_base, unsigned long addr, un
 		remove_pmd_mapping(pmd_base, addr, next, is_vmemmap, altmap);
 
 		if (pgtable_l4_enabled)
-			free_pmd_table(pmd_base, pudp, is_vmemmap);
+			free_pmd_table(pmd_base, pudp);
 	}
 }
 
-- 
2.54.0


