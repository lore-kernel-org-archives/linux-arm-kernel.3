Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C208BE77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 07:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s3ajwCEJzuBWHLhfIS3uOIg9mbtSga1CIaOnP3nLDr0=; b=TDpy+RcIYG7r0zCctqxm1ypg6t
	8NLYHTnzva+O+LPQTZBLC0pWPvj6kJklq3Ur3M0swbCieY/FJ/BW461RYflG+1vKfOs210c6iLd4t
	doNB5H9MJ521RcRdXbHzcPZA3saFDN5osQ1m5+zZGjvUI5Bh4y8ZB6zl4sP8suMzQFUf7Vouf9jFu
	71Nhly71ymQbJhODvtxPDdw4ljvixfGeyC7IYbVdPW1H5jwWnxrHdS5NZ8eOsf/tW0ZKzsGbDReYF
	UbpyLr9dZU/HQQBRLY2p4cP5nIm5K4m+WdwFTzkaBLKavuZVFVLIe8HT11yTO9cfYvZw6Tvde+8bY
	hZVtUc8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVQ9R-00000007NLE-3luo;
	Wed, 08 Jan 2025 07:06:49 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVQ3P-00000007KaB-2J4H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 07:00:37 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-216728b1836so222418415ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 23:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319635; x=1736924435; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3ajwCEJzuBWHLhfIS3uOIg9mbtSga1CIaOnP3nLDr0=;
        b=ju9kYTopMw8dsauRMtnGr8xmeKLaGGx9D1RT1aTwC2f1AkJX2xPT+G5sKNCnhOea9C
         pSSVjZtHeNt8Sp0pFwxwsDf3YYWaM4pd4mUXQJxvNv+3mdCY86YqcyV4Dr4+BZiHwXJZ
         uce1tNWku7HNd32ElgTnaO7+RlKgQg9uJBbZEmXfHxtd7KCT5kjfJT9QJ0hZo7wPglWn
         fQuLjNhnwqo6o7zbirL1U+L7HxaqogLpPCyubMHoE9PLpEnHToe0InszX1GP3Om7iq5A
         NSQX4/kYpjOtHczLaGy1+l48le2NNDX4CYM36jsI5DFn+AkUexAaktxwTknqUwj2sFEA
         f2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319635; x=1736924435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s3ajwCEJzuBWHLhfIS3uOIg9mbtSga1CIaOnP3nLDr0=;
        b=IuZ+ohnonJKB1q2/2ORY9PRwHGDU/spDK3KPf3V37aLPQD3oVsKTge/Yz397Hl5z1r
         6FaNdRSbJSiCT9myoE1lqAxk74IhY3tdMBLIWOFpk8zkjggIC9rKMxryumMuPkgKVNkf
         uvJS0GLFtV6sXJPZomU1TjvM3AwbpJmbZzMg1xoVnMn5f8L1qnRcwtftTfZCZH1js1VV
         8+uliLLIje8GbI97DlZKBJ6U9eerhuATzAlyBc5vThKbY+OMd88wvV5jxqFXIyCkg1o2
         wsRLMlFEBqTQN9AyqyITnmuUup3OFKYfdavHDWwVEz27yLmhE8UobDArvvo+/S5ZwwPF
         Ey1A==
X-Forwarded-Encrypted: i=1; AJvYcCUBa9q84pAcYTTj7TIFtALemVYoj5loyrVvn2FMP8iDUq4RLBKxHEHGxhH8D+vMFDcKlISBBa8iTDn5X2wVxTiD@lists.infradead.org
X-Gm-Message-State: AOJu0YyQQTcmmt2Ulm0a7GvrwismHq1OLo90v032bDEz6FQKll6JH5ki
	bRP5c39z1cTMyka1Hr4lboIC/uKEU/HhKfWU8Bc17nEaDC/Fpzlq4OC12xBE2wg=
X-Gm-Gg: ASbGnctjPYFZrIZTZLI6ojM1WhwwZwc2e4uzQcXApWq+1pqp+8gaiVDdnzIvK8+h/h2
	LWhT79tmQZ8fIlPSliRd8KpaBRKeEkpbNQrbphPCUdb+8v4y5POGFU+rO2p88ih+Z78tYrgfbdh
	za0nc3LmmTm59Ua6kFWTEHVbZdVJMWmTKZWlcnxqfandGBrnymKbNZWjwymxJmLgQBxr0ZLP45M
	Ex0GAWxyDzY0N/x+jECoPpsPQUjqrd9lwCBWMQ89QqEC5BgaqOhylB+uqLE6mEvqnSZJweD30xz
	KLT67s6xcbOI9CtPq2n0K7VV6AY=
X-Google-Smtp-Source: AGHT+IFQatZJEh1vMaYN2M2lTtxd4TB3DgwS5fDlIHVUeP0cQjVCzCSP2sGAFE7qJT7hKS5hKn1bKA==
X-Received: by 2002:a17:902:d4d2:b0:215:9642:4d6d with SMTP id d9443c01a7336-21a83f55157mr23731385ad.17.1736319635015;
        Tue, 07 Jan 2025 23:00:35 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.23.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:00:34 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	alex@ghiti.fr,
	andreas@gaisler.com,
	palmer@dabbelt.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v5 05/17] arm64: pgtable: use mmu gather to free p4d level page table
Date: Wed,  8 Jan 2025 14:57:21 +0800
Message-Id: <3fd48525397b34a64f7c0eb76746da30814dc941.1736317725.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1736317725.git.zhengqi.arch@bytedance.com>
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_230035_606468_AB4AEB7B 
X-CRM114-Status: GOOD (  10.58  )
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

Like other levels of page tables, also use mmu gather mechanism to free
p4d level page table.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/include/asm/pgalloc.h |  1 -
 arch/arm64/include/asm/tlb.h     | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
index 2965f5a7e39e3..1b4509d3382c6 100644
--- a/arch/arm64/include/asm/pgalloc.h
+++ b/arch/arm64/include/asm/pgalloc.h
@@ -85,7 +85,6 @@ static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgdp, p4d_t *p4dp)
 	__pgd_populate(pgdp, __pa(p4dp), pgdval);
 }
 
-#define __p4d_free_tlb(tlb, p4d, addr)  p4d_free((tlb)->mm, p4d)
 #else
 static inline void __pgd_populate(pgd_t *pgdp, phys_addr_t p4dp, pgdval_t prot)
 {
diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
index a947c6e784ed2..445282cde9afb 100644
--- a/arch/arm64/include/asm/tlb.h
+++ b/arch/arm64/include/asm/tlb.h
@@ -111,4 +111,18 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pudp,
 }
 #endif
 
+#if CONFIG_PGTABLE_LEVELS > 4
+static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4dp,
+				  unsigned long addr)
+{
+	struct ptdesc *ptdesc = virt_to_ptdesc(p4dp);
+
+	if (!pgtable_l5_enabled())
+		return;
+
+	pagetable_p4d_dtor(ptdesc);
+	tlb_remove_ptdesc(tlb, ptdesc);
+}
+#endif
+
 #endif
-- 
2.20.1


