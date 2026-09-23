Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC05FC98309
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 06:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/fcB7RWsYoduiGVrXMcsoy9SKXwqPZ/B+Usu82ABAo=; b=MmH670mSECowMoaJyq/4Xfzdf7
	psk+X4kVk2tr/K43jAz7Cdt22HT4eTqnvacjSSK51fqE0z1soEtILXnSAdT5gKp37dd5c7vTt5YCl
	vU/v/1fHSWjONl00AHOXe3E7rt4DuSfXzKvKvWV0/lIAOhp7KJmgsk+dT4oDa6lQb6DBmMnninKf2
	IA/WFqso+F+Rt0y1j7jCxnQZVjntYmnDcPxAB/e6nFSA+eU2/YbrX1jSR9efCKd36e+zwCdJIll1M
	qYCo4sPOfMnyhJA81qStXWulsjiH3tHjxUXEMvNZfvLPIbaX2D5IdkW1KNQ9Le0jOLI3PVBcKxMwu
	0sw+MnPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GTM-00000007H8I-3Owj;
	Wed, 23 Sep 2026 06:28:52 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GTG-00000007H59-3ZR2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 06:28:48 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747eb79f7so2512405ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 23:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790144926; x=1790749726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/fcB7RWsYoduiGVrXMcsoy9SKXwqPZ/B+Usu82ABAo=;
        b=dZgIBTu12VHYMWNALIG2LWgVz3HWtKkt6hdNCVbQWti+ek35rtWx1RfxojzNrneEng
         W5pxW9pptu2a4dMuLumovUxPF000hsrwTBQgxBSM3JmumyRY4REWBu6ZUgskyWzR/QZW
         1QEXx0Rm+2hWDL1LooyZjFUlTLz9usPKtkRMfLkF5ec6eRULF1wPgmG7vmfDcov3z1MM
         pqy0IUSIRPNMzoTppPu4pXr7Qq2opwDv6Wgp0N9CmtKB7LiR1OMGxSPNje+XvZAnEy4d
         ElQK0b3yTMjKbwqAtk6jvj+Yp9snK/rvt/0FjEW6P86SqFoHJiOivrS87vxc/5GcKIbc
         64wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790144926; x=1790749726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7/fcB7RWsYoduiGVrXMcsoy9SKXwqPZ/B+Usu82ABAo=;
        b=VhGHUk+E4mR7zhm1iqav5gZs48ypZvO5Kx9IDb+9GJcyHrAI5YysK/KYe6c0st+l7p
         u4CDvHteMQp/KmHLAVFDKwxdyyRmqhlVvs7/tXf3K/jTZ8xrxy6j2AL4XQ9hEpjp1rYr
         cwQHscPkeMzBer0ph/ZxGvliH1kaQXDpuMOjJsVlytnTiolQVrvJsrDsZomDvhO5C67i
         CHbILGZxHIk5nDS3OK+BQCGDfn171yFl//tM6o2TsyxDWNTPbPuGxQ95oK29hL5wu+xc
         GqcW/kSIPdgy7hCsZN/hJdtVTqddJmlr+mEkT+yJ0gyGf9WEkMAo7kH4U++dqQItAeHD
         z6nw==
X-Forwarded-Encrypted: i=1; AKwUvBxgpiiCceGABMYV9CBEeZYj88TeCaSyRRQGWXX+6j2PmjrIdODsJ+r+romA3QXMObYaYiw2RcVd4xTW5hN3FYzu@lists.infradead.org
X-Gm-Message-State: AFuF++m6GPIeb+07k/nRPxDaWOOeLVR+jR5h2j4ksxreGC7zhu5U8Z/R
	FYp//Sy6fIyh6wlVHbqW8+fCB3uLBweQqnfQSKMaFDkHpVHkLghYGrEb
X-Gm-Gg: AYBFou0DGxxa9XfTUzFuzyz9OwY8w1rsOyOdPHIMDwNt+2WLbP8KW4prxgxxgke7dFF
	cqc+pbhHmYHDD+x8jMuPf4p9EgDR9MA9X1KgpDqvF6xuOwpbVg4Hnu6f89HlIrr1RCom1F3EWFc
	etrqUfFJAa+VTC/+mt5oorDYmWiaCQucBl8HEMyZY33zhhbTJ7z0NV+qLZdIteR84Jiod5Qf5LR
	0Yp2l9AKjitP8w+QkEFxykJmL8EN4SQ8sk81UiDcBdyTZJUlYz+pVUMskGjYeXqlHHQRfcuY1xP
	2xqgrMtPMJ3FpFvnhXIrmMx9+acgvyQ2L1m9xXw9mG/7b4T43dqNsIsKYtn9M0yrmQUUP7SLMt/
	LMSCiHyEDgNkqIcPWeZ9Royru89XZOB2QcRlApeH1QHrxoxLL5c3zYQnhWDLmlvZPzCkX6FcpKN
	GVjizqRl0mHk3nKxB+428FP5kiUnj860mEajZahGKMbXt2wismV1YUSTIH7nolwrGWLrtaOuxAn
	Uwronm01DHGoOwe7TlLPQ==
X-Received: by 2002:a17:902:d2c2:b0:2dd:c0ff:e724 with SMTP id d9443c01a7336-2df69de446amr13040735ad.54.1790144926198;
        Tue, 22 Sep 2026 23:28:46 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516bfdsm5620465ad.5.2026.09.22.23.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:28:45 -0700 (PDT)
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
Subject: [PATCH v9 01/10] arm64/mm: add pte_set_huge() and pte_clear_huge()
Date: Wed, 23 Sep 2026 14:28:23 +0800
Message-Id: <20260923062832.479455-2-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923062832.479455-1-jiangwen6@xiaomi.com>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_232846_921715_1309C383 
X-CRM114-Status: GOOD (  12.07  )
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

vmap installs PTE-level block mappings (PTE_CONT on arm64) by reusing
set_huge_pte_at() and huge_ptep_get_and_clear(), which are HugeTLB
helpers gated by CONFIG_HUGETLB_PAGE. This makes the feature silently
unavailable on CONFIG_HUGETLB_PAGE=n kernels and couples mm/vmalloc.c to
HugeTLB internals it does not otherwise need.

Add pte_set_huge()/pte_clear_huge() to arm64, joining the existing
pmd_set_huge()/pud_set_huge() family in mm/mmu.c. They build on
__set_ptes() and __get_and_clear_full_ptes() directly, so they do not
depend on CONFIG_HUGETLB_PAGE.

There is no caller yet: mm/vmalloc.c is converted later in this series,
once the generic fallbacks are in place.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
---
 arch/arm64/include/asm/pgtable.h |  6 ++++++
 arch/arm64/mm/mmu.c              | 20 ++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 6000905a2e865..9b762eb68cff0 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1978,6 +1978,12 @@ static inline void clear_young_dirty_ptes(struct vm_area_struct *vma,
 
 #endif /* CONFIG_ARM64_CONTPTE */
 
+#define __HAVE_ARCH_PTE_SET_HUGE
+void pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
+		  pgprot_t prot, unsigned long size);
+#define __HAVE_ARCH_PTE_CLEAR_HUGE
+pte_t pte_clear_huge(pte_t *ptep, unsigned long addr, unsigned long size);
+
 #endif /* !__ASSEMBLER__ */
 
 #endif /* __ASM_PGTABLE_H */
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 79d90226fd5dc..4a3d084bb7556 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1912,6 +1912,26 @@ int pmd_clear_huge(pmd_t *pmdp)
 	return 1;
 }
 
+void pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
+		  pgprot_t prot, unsigned long size)
+{
+	unsigned long pfn = __phys_to_pfn(phys);
+	pte_t pte = pte_mkcont(pfn_pte(pfn, prot));
+	unsigned int nr = size >> PAGE_SHIFT;
+
+	VM_WARN_ON(!IS_ALIGNED(size, CONT_PTE_SIZE));
+	VM_WARN_ON(!IS_ALIGNED(addr, CONT_PTE_SIZE));
+	VM_WARN_ON(!IS_ALIGNED(pfn, CONT_PTES));
+
+	__set_ptes(&init_mm, addr, ptep, pte, nr);
+}
+
+pte_t pte_clear_huge(pte_t *ptep, unsigned long addr, unsigned long size)
+{
+	return __get_and_clear_full_ptes(&init_mm, addr, ptep,
+					 size >> PAGE_SHIFT, 0);
+}
+
 int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
 {
 	pte_t *table;
-- 
2.34.1


