Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A3F606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 06:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eLXdyVBQ;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ilZMMvv+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=db1iEGMFzAz69F0Qd2NIWb14nn5dPV9u5Dz96tL5APM=; b=eLXdyVBQcM4/0S
	ltcRhwARfUHXEEGj9kQEIzqYyMsXTp8H3Zo80N2xiCg563QR/kFT4vgmYBXTOtpF3c5/z+329jDLk
	ogJzYQYOENkPaueM5RqgIw2StSOXt+k8TbRShON240P5J6a9fQOMTN3Ifkrb1XwJe0p3xL2nb+c6Z
	u2QtXXh2dSXqrBhhx1nY9pB1xAlituut5OWP8lchyLWCaTMzWCXxj4qu2BhCj5goQ4PvpYZnNSU6y
	6WjDhsojm3nb2lf92fzE2ee+OBLTCjfd4I40NivM+lylnbxRiifD3hT+X2oseG5QiYtAx182+8v0A
	/5OgnyBdpEA0uNP1drRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8rg-0000000FZyv-3pIs;
	Fri, 23 Oct 2026 06:34:56 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8ra-0000000FZtt-2cUS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 06:34:52 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so290678a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 23:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792737290; x=1793342090; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=db1iEGMFzAz69F0Qd2NIWb14nn5dPV9u5Dz96tL5APM=;
        b=ilZMMvv+H/Mn1Y4w2ZAvCllSsaUR9smcqejQAkie2t8eBa7+ICg+RF02vibWSlxVgi
         eiEjtpqKQrs5TMaiuyuVgoV+rFG/j3w1sn6rD+eW5jzD5saFOOOqmW6l+X7qoXlzwLgI
         Jxn5BJ4Nr5O5/ciqsHuEy1fpQQbLsX8A1eaAtAVI8S+KOJ2wHA25B90tjHcoCY2V+RZg
         KrUf29e12ZmC5Lsh4cQUxs2BgtaLdGyBhBz0syleSToR8/tVSxo4GFPJvB9FVD0tLazm
         FuXdA1FAkS4VNWlTXc9VdEU2ikMvcwYllV800860s7QidwFjRqHIEd8ydp41Mxe7jrUD
         S4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737290; x=1793342090;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=db1iEGMFzAz69F0Qd2NIWb14nn5dPV9u5Dz96tL5APM=;
        b=XBeW1l+Tag6PN7wr1il2xB30lEHdVcxBk7hR5A5TWe3LViSaE/xv88Nu4gftTRW58g
         3Zz+wjdTBhSbofJkC+N/xjXetFeR8m7SPNhXCMGDb/XtOiegI1umkbCUBONtun3+W5Mm
         0WEzQZUNYOWz1mMesYcbC0v4IqJFO5+67lnjwLwxkSRaT4gA1l89YvLZQWEF97cLdZcZ
         q+ICGSzvqI/h1dZMNFGUuF1JezCd3W+5WBz/075r1Qf05B4QscFNm9r8ZKdkGRQwm62t
         0KR8tgK+eDiSUIRgIzxwpRmPwitr93c3yvCU+PkL2L83qjdj1IQYrXbHim/tmabwiTCd
         y8Eg==
X-Forwarded-Encrypted: i=1; AKwUvBxlgkPJZK8cY2rf+I7McYNHSpBg2a2hDvZ9Ha0x/7DEAyVsCKcfzfE9fCX37PHAaPpclsskcuhpF5QwNAdjx8/m@lists.infradead.org
X-Gm-Message-State: AFq9FYLqTSZs0qK+PaYj1XdlyfWyR5WrP23YfJ1rMfy40acj8PKD3K3K
	R4EnEb07z7zKA1e5O770tUZOuToU6DorVOZgFtco/ImHWRT3jgebPtVwpaYiDe25bZ0=
X-Gm-Gg: AYBFou31aAwI2VmnH74JfkjDTDrmU73zrXNSLpep0yqM9R1bWAWi49N3910gFZGr1IP
	rlMdpP/SCizA2d2VoNky/RpeNuY4o/p8eDDYCynBHaRTYtg0AvrCTHiFqufKejU8oofPvGW1omy
	7QTv1JESVXPV86N9mD3e69FNvIKLEzT6/YJ1lZYozJZSALTFgf3PYF7kYEeOpOWF0CgpNo6Z2i2
	McITdS1i5OQLPsyAjLqks1IJ6IU/rMKGZ9hSjCnNMS3gp5erSaztOMHRQACekF5tZq4rNei2iF9
	5NuF5ZpkGV3E0XvDp6ILhJQJ8nHq9LPA+ve1MmnVnh+vD7N/G8AZSd/O4T9jyA/coiS+mMdFfts
	pEsP+GrhrQ1bHqivDs2+N525xhj2zTnjBhgJy8HaplUaRgYaIsJd5uqw6vvLYDsj3TdGmUvAzkL
	T0CbMqSYXzzAx2I86D013axzpibvY13j7Qy87WdK6J8IZJbohEwh7/8bQZ4SI8n09J+RpxThu/i
	jqN4SfBmL74J3ynS7njkkPf8lj4AKNpBefLFxRWnszr7rrWs59qR0K65lyttybEFSX+rv9H7Bzm
	Ig==
X-Received: by 2002:a17:90b:3b44:b0:3ac:c005:cf07 with SMTP id 98e67ed59e1d1-3adce08329dmr1117038a91.42.1792737289490;
        Thu, 22 Oct 2026 23:34:49 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add246f308sm575202a91.0.2026.10.22.23.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:34:48 -0700 (PDT)
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
Subject: [PATCH v3 2/4] riscv/mm: fix hotplug page-table destructor handling
Date: Fri, 23 Oct 2026 14:34:26 +0800
Message-ID: <20261023063428.3658761-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023063428.3658761-1-songmuchun@bytedance.com>
References: <20261023063428.3658761-1-songmuchun@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_233450_675537_95339DC9 
X-CRM114-Status: GOOD (  15.38  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
Reviewed-by: Björn Töpel <bjorn@kernel.org>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
v3:
- Collect Acked-by from David Hildenbrand
- Collect Reviewed-by from Björn Töpel and Kevin Brodsky

v2:
- Use pagetable_free() for non-reserved tables (suggested by David
  Hildenbrand)
- Simplify reserved-page handling
---
 arch/riscv/mm/init.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index fb37b0b67efe..e111d25e18e1 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1485,10 +1485,17 @@ struct execmem_info __init *execmem_arch_setup(void)
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
 
@@ -1498,18 +1505,13 @@ static void __meminit free_pte_table(pte_t *pte_start, pmd_t *pmd)
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
 
@@ -1519,12 +1521,7 @@ static void __meminit free_pmd_table(pmd_t *pmd_start, pud_t *pud, bool is_vmemm
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
 
@@ -1644,7 +1641,7 @@ static void __meminit remove_pud_mapping(pud_t *pud_base, unsigned long addr, un
 		remove_pmd_mapping(pmd_base, addr, next, is_vmemmap, altmap);
 
 		if (pgtable_l4_enabled)
-			free_pmd_table(pmd_base, pudp, is_vmemmap);
+			free_pmd_table(pmd_base, pudp);
 	}
 }
 
-- 
2.54.0


