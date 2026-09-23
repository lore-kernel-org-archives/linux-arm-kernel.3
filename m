Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1661C98308
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 06:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RRHIBzX1Ph+VWLlGic49OjVgc6epG84F5iB9tVuXpJQ=; b=TzNvm6YVD+10AiVojpgdkmn00c
	Zl1eoiGw4SHl2vu+V8C+gGrHTxDx7Di220W9ROyVI+1z/51baqc46MDV/DVK/r6WtXVIzTOwwFAHb
	VIrUnKARj/bvb6lYHeE4NfRNTofRM52L+Pe6+9Bv4No1ycB6OSeJXcCIMKSTEypjFkX69pQvEtDXK
	onBjRLrvPhzzdUsI3JEvTaCcYFGu3OVNsMlBKLnbgBSlenix323gzYZU2k+1ZaEsHYHpT20TKDjcZ
	DkG3KtHN8s1O++NqB+tZWy8vS17MooAtlg3VNxCiNb7isokdezHJIE2iL/ItT26E5uFKndNmq0QW9
	tGt8RHwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GTi-00000007HML-1lwI;
	Wed, 23 Sep 2026 06:29:14 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GTc-00000007HIz-3bgC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 06:29:10 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747ee1f9bso2842245ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 23:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790144948; x=1790749748; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RRHIBzX1Ph+VWLlGic49OjVgc6epG84F5iB9tVuXpJQ=;
        b=RicqUWpLbALs4u7qpC4zChxgtGzk+gSKvPIpf0LFxepQSSFjxXs0YNRltERNCM0ZB9
         WSuG8zaGFo8yuAGPPoEfTiarp3DxXWJiRqGjyKt/Mse5ljV0MM+YWbCuFlaN/N+3B+K3
         jfY6g6uASp5ofUkGi22IogkVcVnDy0Svtqbid2WEF53yc5yiwAjg6eZ+BXtw720nBbxv
         R7Ki+3w8uPtXd6Qxy1Pznea/YASjmh2ORex9I5hvSxyO8G6AEogTny3pWeEVNVmdT4hN
         RUZtvwJBHnjfLyBjqfpEM5qRHOAZJz0qx0lySKm28CssMkmvzBs+aFtNiGo4GmS09KuE
         aoRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790144948; x=1790749748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RRHIBzX1Ph+VWLlGic49OjVgc6epG84F5iB9tVuXpJQ=;
        b=Vl5s9J7AN+t8aRPA4h40nXrGMdVIBGAaL9sax9xQ+uY9F3fRoz9Vcfj9FvBj5INTP7
         a5CWjWXoGxav8irkOMH99bkV1bPUhtJGNLMap+rxJTBOqywHujMVMlsqsI2v5sqPPYMi
         FZHjMgzSoYdIYX42FFYCpApg9zhIdyezcLRmiCBSnzORAbl8WykCgTDip7djfIr9P3UC
         r9VF2T+GWGxV95jdwbpjAoYaW8riOdaD1XwhbjaZuYW6/rb8SZhZoPkq/P7UM9jYqdCF
         j26o58AA9AmF4MhoyEzivAATQ+Ke0PvKvgvDlBIKBF1nq7UUZ4+uoTXTjhyRlw5N2egk
         G99w==
X-Forwarded-Encrypted: i=1; AKwUvBw0XUKuhOrpwlVppaym69tsosaXgfiykDdDz94I2XzsU47vh5BbxX8Ec75r1aeYsc4i32a4C7wvSCSjjLkAvanb@lists.infradead.org
X-Gm-Message-State: AFuF++kySnO24DuxWui/fWUs7WTr2248Xid1x+jW2+5ChnfNxlEeG8z7
	ylGact2RvgBodLGuWQCbbA26jVcNFCG/t39Uagouq31V3zmvampbJLU1
X-Gm-Gg: AYBFou1n5RMWwsQIlBaYSX3iqjKHi+gv2G+QgZcnKWnP7gcDcjhN+iA524tLMNg9khL
	XMXgZ3cwXzh9mGHazna5zPUROt/aoAMubRqbZScgeBI9nhF5qmK5thtpNSlnB688P2lDwHs6sRv
	gygbjapJ/cNI2CMzJ9Pb0H59RP+4U5cDFtOYfYrCHs8DU1fMQElxymCeAuwx+A+dDYBhyx6YIgJ
	eSFfu/lDoAryghfSsqFU5Qc5u+mf+cY0QiYUgoMkdSKwlQnjp/lrilzLMjKqEAvOMKU2ztqSJLW
	ltRwvpoYfbFaxBMjVaYDUGfBFs6AI3KMtWm0uhXGpAzvKbV8Bh41WbEd329gXu31BYaE/qMEzoz
	BJoTNX/Q0QfzqZOxTYwTk98GPtsTonWWmGrMbyzAsOpwYvblLi6anejFm6C8IJZDJFP+yvt6xzO
	pEhKSf0CGcSGNjCc1jiDhUO+VHTMn5mDBPMoblrXeKTYNtz5Mzyh8NR4f7HXnUHnV+J/2ETFZf4
	r15EpktTzFPKssgf1FsiQ==
X-Received: by 2002:a17:902:ce0e:b0:2dd:ad73:5b6c with SMTP id d9443c01a7336-2df69d56537mr15363405ad.28.1790144948204;
        Tue, 22 Sep 2026 23:29:08 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516bfdsm5620465ad.5.2026.09.22.23.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:29:07 -0700 (PDT)
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
Subject: [PATCH v9 05/10] arm64/vmalloc: allow arch_vmap_pte_range_map_size() to batch multiple CONT_PTE
Date: Wed, 23 Sep 2026 14:28:27 +0800
Message-Id: <20260923062832.479455-6-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923062832.479455-1-jiangwen6@xiaomi.com>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_232908_921672_9B9DEA51 
X-CRM114-Status: GOOD (  13.19  )
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

From: "Barry Song (Xiaomi)" <baohua@kernel.org>

Allow arch_vmap_pte_range_map_size to batch across multiple CONT_PTE
blocks, reducing both PTE setup and TLB flush iterations.

For CONT_PTE_SIZE-aligned ranges, return a mapping size that may cover
multiple CONT_PTE blocks, capped below PMD_SIZE. These sizes are vmalloc
mapping spans, not HugeTLB hstate sizes.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
---
 arch/arm64/include/asm/vmalloc.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
index 4ec1acd3c1b34..4053b1ec1902e 100644
--- a/arch/arm64/include/asm/vmalloc.h
+++ b/arch/arm64/include/asm/vmalloc.h
@@ -23,10 +23,14 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
 						unsigned long end, u64 pfn,
 						unsigned int max_page_shift)
 {
+	unsigned long size;
+
 	/*
 	 * If the block is at least CONT_PTE_SIZE in size, and is naturally
 	 * aligned in both virtual and physical space, then we can pte-map the
 	 * block using the PTE_CONT bit for more efficient use of the TLB.
+	 * The returned mapping size may cover multiple CONT_PTE_SIZE blocks,
+	 * capped below PMD_SIZE.
 	 */
 	if (max_page_shift < CONT_PTE_SHIFT)
 		return PAGE_SIZE;
@@ -40,7 +44,9 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
 	if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
 		return PAGE_SIZE;
 
-	return CONT_PTE_SIZE;
+	size = min3(end - addr, 1UL << max_page_shift, PMD_SIZE >> 1);
+	size = round_down(size, CONT_PTE_SIZE);
+	return size;
 }
 
 #define arch_vmap_pte_range_unmap_size arch_vmap_pte_range_unmap_size
-- 
2.34.1


