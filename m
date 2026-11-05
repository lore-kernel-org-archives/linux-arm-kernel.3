Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C26C606A333
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 06:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3aq08pib;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=dW41zqlW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZM306HbMXxWJth45MNpskHOeaLxazIrhxWXy+ExQUgY=; b=3aq08pibJdJM4u
	Rj0q8rSf4Ogyg11+bYO7lO7d9RQdAAyDCs0hrYxffuvKcWVrYODtz0qFhbcUaqyLAHzNjKzo+EGzn
	gtzDS7FkNYjT//5UxcAo4HDV4g2AY32ppEVDEiggKPBKgYf9s/Mas6MA2ywK+GZPw+Tcf/GSmTP88
	IxofQ27uP7iMx3qcZDf7lMCIJnsiXqKwzK97s6DECoiIgg5dq0DX7zGSALT+uImeH5yXj0KrKsesO
	FwF1pB1Skj/ylStxafe2MeLSI19MCVZLkWyp5/tkBXVrZYeIbTcRj+3ZG2OPPdHkOrTA5+pRqQhV9
	R7m/mwb+NT7UDRoRiNew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOqiN-00000007v8Y-3JM0;
	Thu, 05 Nov 2026 06:12:47 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOqiG-00000007v5Q-1GDb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 06:12:41 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3b0a519049aso786883a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 22:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793859159; x=1794463959; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZM306HbMXxWJth45MNpskHOeaLxazIrhxWXy+ExQUgY=;
        b=dW41zqlW6tdwkO1o6UrACq/+dLgpb+d8uYsZjPgdachBFZ+obugV17EP/hOFhMhj9G
         DsRbaLF2w5AV8QwB6yru81kTTEDTuRCBX+IBIA9W2TezSUR3Qf0teb7yPV62r772v7dv
         B3rIKpcd05EavLCeopc7P6A1IzJarwbhmR/HkaGLicqJ646gxoVYS2rqK+ibFI1p9+oV
         qPvPQQpCcBvKP8POPdTfE90fov9pySXzFjj9NVyhUZg4nRlXrKwVoenxNGvtgPjeho6D
         bQmQnwcNKJrFLw8kfSimNT/X0oQuxSwEBZvt/8dMYeI0hbHqz2x6j+e/I/e8ar662X1i
         uzdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793859159; x=1794463959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZM306HbMXxWJth45MNpskHOeaLxazIrhxWXy+ExQUgY=;
        b=IKzUz5BooMNbF/zshETdoOzqvvRfBvN9tU6LBqQToMGaTtOWX+wpyKV6aupaKHZeBj
         06IlIpsXkM5rZIlWqndYOtfK0/Gk7nB2llbWMLupx8c+hfD/WJdXfqD6k4lSoW2wJDOH
         ZQjuPx/rVYHYLdzt4MPF9myfFvk1rUefJZmGHn/hKTM7OcFEP/pNEnXbtnPl97ojnwiU
         Re314uAKCVNWiC2FgQOGnsvm5J9qEv43OGkURvPG+wrFx31YjXyp2LLQ+LM64nlZgePL
         eJ+Y/2rOMGCm+C5d2AARyQyd4E37OvKxwrAgpl6fcA026jjK5LO1I3d5y5dM167Vr0U3
         QZQg==
X-Forwarded-Encrypted: i=1; AKwUvBysGjz3q5sj2ov3UC+dv0Tt1H8t6vfdJCo/yPqL0SmxFY2LS+Nh/JFrOb39TUkMMrBkAIIkhgseXZg/3dMYzVYT@lists.infradead.org
X-Gm-Message-State: APuU4Z83G2jmK1loHS+joG6V74Zfl6wprILDDdjyrCXM1/dvYlsh89yN
	JXXkjTp7P625bFPQIAU29sKaV4Si1AfMg3JCvke6EQJKfhdwdelB27ILkQNbmJgx0Oc=
X-Gm-Gg: AYBFou2wjp+1qR7HDetLRMFSKqRxzBy4xaO0veFYhHI6oEfrEVb+g/fn2Li/7T+Q9XF
	u4VMTsXbwaptmacN+OOstPK70rCq9Vs5pmqkWaZXI7Ao8F79UHF86vih55DuHFFj5mhUyItKgqS
	kPkUNiJx86MbbQ2oKMq6xRZleigF8bS5toeyKuPDBpEik1SOIRYuGs7MacVhy72NY9+iuvYP+3P
	6ghWRhRMH1y3Dxfqb+cmHqlRHlyABokvukdfvMtMLslCJ840VixGMdvsuLGOzJXjvARz8f3JTxO
	5rEXxgUX9mJRM+YhXVQavppViPxwJi47AO8XjyzteLX8TbE4y+VIdJzZi9RZ7t5XHoleIHOGU1R
	3qurHqjtRc2R5GL0nEd58t1x/0JePSvkMB0JETpEvXQ27A1dD/Z2IGCBBSg4thgGBONNRDVK8iF
	Rl2XU8I9u+jMSDFNpfwhVIBEtwSh/kIXYF60/By2Ize52syYNplWsFLaHNEZ3HQgllb+7H+J9lS
	XsfF7prsmrn/zThymvIXDt6yv0hwnqUn/nu/F9p/BrKVW72Tj4Q+zWctF1Zg7l9VGXeA28lh4m5
	pfZJjTRb7j7DzqSMyqGJoKCnIE8HagyKAgpKb6rKac+0IIVe4gRdwN7IkgNccpTC0A==
X-Received: by 2002:a17:90b:3d4b:b0:3ad:eb4c:26fb with SMTP id 98e67ed59e1d1-3ae897c87acmr15846459a91.23.1793859159284;
        Wed, 04 Nov 2026 22:12:39 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323a1fdsm2107528a91.5.2026.11.04.22.12.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 22:12:38 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: David Hildenbrand <david@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Lance Yang <lance.yang@linux.dev>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Oscar Salvador <osalvador@suse.de>,
	Qi Zheng <qi.zheng@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 1/5] powerpc/mm: make vmemmap_populate_compound_pages() static
Date: Thu,  5 Nov 2026 14:12:13 +0800
Message-ID: <20261105061217.13302-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105061217.13302-1-songmuchun@bytedance.com>
References: <20261105061217.13302-1-songmuchun@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_221240_341968_5F080476 
X-CRM114-Status: GOOD (  11.95  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

vmemmap_populate_compound_pages() is no longer used outside
radix_pgtable.c.

Make it static and drop the unused dev_pagemap argument from
its only remaining caller to simplify the code.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
 arch/powerpc/include/asm/book3s/64/radix.h |  6 ------
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 13 +++++++------
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index da954e779744..8452a2714cb1 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -356,11 +356,5 @@ int radix__remove_section_mapping(unsigned long start, unsigned long end);
 #define vmemmap_can_optimize vmemmap_can_optimize
 bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap);
 #endif
-
-#define vmemmap_populate_compound_pages vmemmap_populate_compound_pages
-int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
-					      unsigned long start,
-					      unsigned long end, int node,
-					      struct dev_pagemap *pgmap);
 #endif /* __ASSEMBLER__ */
 #endif
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index ebac5f9058f6..2924604fbb38 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1117,7 +1117,9 @@ static inline pte_t *vmemmap_pte_alloc(pmd_t *pmdp, int node,
 	return pte_offset_kernel(pmdp, address);
 }
 
-
+static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
+						     unsigned long start,
+						     unsigned long end, int node);
 
 int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, int node,
 				      struct vmem_altmap *altmap)
@@ -1132,7 +1134,7 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 	unsigned long pfn = page_to_pfn((struct page *)start);
 
 	if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
-		return vmemmap_populate_compound_pages(pfn, start, end, node, NULL);
+		return vmemmap_populate_compound_pages(pfn, start, end, node);
 	/*
 	 * If altmap is present, Make sure we align the start vmemmap addr
 	 * to PAGE_SIZE so that we calculate the correct start_pfn in
@@ -1228,10 +1230,9 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 	return 0;
 }
 
-int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
-					      unsigned long start,
-					      unsigned long end, int node,
-					      struct dev_pagemap *pgmap)
+static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
+						     unsigned long start,
+						     unsigned long end, int node)
 {
 	/*
 	 * we want to map things as base page size mapping so that
-- 
2.54.0


