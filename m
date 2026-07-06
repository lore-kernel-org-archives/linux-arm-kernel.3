Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59909C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 13:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N6Mfmmv9Z1KLwW+rFeY1Xe/RVdzdCKnap/t46NltcPk=; b=lBpu4cW04iUYRRVLU6gKzHFu0G
	wJIOQoyKYyD4Fg1t3WuOq5Es2FXj8mOpWjyk4nnARtwuLj79x+YvAjXRdZcfyajwCMerQTBLNBL6h
	BaSc9at8cHtFtFZk03LeSzWKS13gHExgxDvJd2SzOMX3CgDBeEg2EUKDI5jAYwvDQNhhymouYSYKD
	mc2fz0+lrNqpRNobQWGY5tcZZHSLcl+SSr3Ig12ODrgyqdQyejDoVH5qGmPH1jnleMa2OWTyzrNWa
	jGW8jsQ7VT+OUilnBT27QF7RR7D2NP1Bieajbvv4evf6z4Y/Uk6s8F/hv3KgjRz/972+wPxATzQZT
	BlwmoQfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgj2c-0000000CX5Z-3Sn6;
	Mon, 06 Jul 2026 13:07:18 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgj2b-0000000CX43-0Lk8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 13:07:18 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-473987fc217so334750f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 06:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783343235; x=1783948035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6Mfmmv9Z1KLwW+rFeY1Xe/RVdzdCKnap/t46NltcPk=;
        b=fQKd2/TTQtejzna3jCMlVod0viWjNc1Ibd4pQ9jcBxTTGnX0QJ3qbcfKjUS5lWk7SS
         6m2rWkMJdGj2vBNYUzVKwXuMrlJaYDm5EBzGCXBembEYyOvDkGVQcTnx3vhZnXRapQWI
         nsnhjPMJuhDvH/YQG26H/E2BRqr6rPGXDw/ECJAi0GK0qL6aJDljyBT/RvUYfLKXn3Ps
         epA2nyyyYhdAhAhTFuzelNdWHteBrAYS9jG84zBH6k8tuzXgfjMDLHFnxx0VB+abeeYS
         MwBLi8DtmJHNZf6dfPm074KdJaAaDgFU9J7W2WG028WoennBQMjvUP8DBFTvLzeAiT3K
         puZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783343235; x=1783948035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N6Mfmmv9Z1KLwW+rFeY1Xe/RVdzdCKnap/t46NltcPk=;
        b=M8ytXLrA6vBPkex7lJJRZlqcrEfQd+Yh67peXoumR4Nkp10/ein7pu/OS2Ksia2Mdy
         QsF7r7GGL27JVtHg5uqOYe/0ZkCBKNRou0ArMBURAn2iXKIKhBsNG0xBKxBtsvKoFkfH
         l+waes5ELwpMa6LUxw9aEo2HeQCgvtxsiTGB5tHNsN1mqsVk/TsU9w5UnOBqGM+j67WY
         PBNphkhDqkB8N2q7u2SoHjsj6JG1E5MQZN7qZSh3SCa8ku/QW4PMvUBt53zn2Q21BnvE
         L+Qv6QpQmN5wZWiZwzUaBoU8tCfZ3oRR5wHXCxPJsSIuG42yFpV1TkfPqIU9ukwGZdHl
         Hv6w==
X-Forwarded-Encrypted: i=1; AHgh+Rp1e8Zde6qX9ukgj5NlkYITlHraXhnGoXXSymafGngbgAtJfpxy8DebEUQ+qiJThy6OAlZdELkL08o1qfVFEgnj@lists.infradead.org
X-Gm-Message-State: AOJu0YyBi2UQdehhZbdw5pWmtxVCFZedMfLfBthtADs0KXJ5HQJS0a0S
	mB2mBH1+FAUUG1wwT8uX87fP6cSw3sOhUSeSKIT8GD4/mgYyq8OsQIHW
X-Gm-Gg: AfdE7clUjI6Hqj/1TYWwCGAu7wdVFaL68bp8IjUCezdyH823PC77ikerQSnN22dJy+Y
	TjV0xcTKxflOnoRPdkknGvb2H1OAiuQNTVY7ivIXOe0m+qybt+ztb5Gx0wdjVEtutnnc6EGGrSp
	jjofECypUK2BNc1w+KNM2yWvERsQFmxa4CujEBcj7tWlNoC50uY56pCjluT88uxhh0EZk5ay2G4
	1sHvl11I6blTMKpIWvF5tsZdjpgJsqAeSeOrMPJz95NHCnjEkhLRiHJh+bh2GaTWOSkjcjAUmGP
	fdmixT9pz/6Oq+02boSPye79M2xV0L6xM8AcWFqu+6XXxkpyZYEm0BZ0wWp5rN/WloH2kpskLUQ
	n6JZeyqejGu/tYBeiDcthb1KU/qorAtQovbV5WGGhdnx7TF+yeCfO0PJ8SLNL3PMc2BY/dfLKca
	HwF836W4E7hphGd27SN7YGey5yKWlePrl/WtioQ14Zg7IO17cfjcJbjF8BsmX53BUuti+3vdQJt
	KrXFoU3VVLZF9ihSGQdXpRke8LKLGwPq0g=
X-Received: by 2002:a05:6000:46ca:b0:474:2edc:c0a8 with SMTP id ffacd0b85a97d-47aab57d3admr4208341f8f.4.1783343234997;
        Mon, 06 Jul 2026 06:07:14 -0700 (PDT)
Received: from debian.lan (vmi1894487.contaboserver.net. [154.26.158.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8f1sm24515956f8f.3.2026.07.06.06.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:07:14 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Lance Yang <lance.yang@linux.dev>,
	Jann Horn <jannh@google.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [RFC PATCH v3 3/3] x86/mm: add set_direct_map_ro_noflush()
Date: Mon,  6 Jul 2026 21:04:40 +0800
Message-ID: <20260706130440.9295-4-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706130440.9295-1-xueyuan.chen21@gmail.com>
References: <20260706130440.9295-1-xueyuan.chen21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_060717_140919_87814E35 
X-CRM114-Status: GOOD (  12.44  )
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

From: Xueyuan Chen <xueyuan.chen21@gmail.com>

Implement set_direct_map_ro_noflush() for x86 using CPA directly on the
passed direct-map address. Clear _PAGE_RW and _PAGE_DIRTY, keep alias
checks disabled like the existing direct-map _noflush helpers, and leave
TLB invalidation to the caller.

Co-developed-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 arch/x86/include/asm/set_memory.h |  2 ++
 arch/x86/mm/pat/set_memory.c      | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/x86/include/asm/set_memory.h b/arch/x86/include/asm/set_memory.h
index 4362c26aa992..bd3817e06052 100644
--- a/arch/x86/include/asm/set_memory.h
+++ b/arch/x86/include/asm/set_memory.h
@@ -89,6 +89,8 @@ int set_pages_rw(struct page *page, int numpages);
 int set_direct_map_invalid_noflush(struct page *page);
 int set_direct_map_default_noflush(struct page *page);
 int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
+int set_direct_map_ro_noflush(const void *addr, unsigned long nr_pages);
+#define set_direct_map_ro_noflush set_direct_map_ro_noflush
 bool kernel_page_present(struct page *page);
 
 extern int kernel_set_to_readonly;
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index d023a40a1e03..5987f4c84f6f 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -2662,6 +2662,21 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 	return __set_pages_np(page, nr);
 }
 
+int set_direct_map_ro_noflush(const void *addr, unsigned long nr_pages)
+{
+	unsigned long tempaddr = (unsigned long)addr;
+	struct cpa_data cpa = {
+		.vaddr = &tempaddr,
+		.pgd = NULL,
+		.numpages = nr_pages,
+		.mask_set = __pgprot(0),
+		.mask_clr = __pgprot(_PAGE_RW | _PAGE_DIRTY),
+		.flags = CPA_NO_CHECK_ALIAS,
+	};
+
+	return __change_page_attr_set_clr(&cpa, 1);
+}
+
 #ifdef CONFIG_DEBUG_PAGEALLOC
 void __kernel_map_pages(struct page *page, int numpages, int enable)
 {
-- 
2.49.0


