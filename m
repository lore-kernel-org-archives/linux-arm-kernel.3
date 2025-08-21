Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFAECA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 02:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vioVXt2ZZgg7NeYPZVOuYjJyML9DfewAFD4Lo8ICLyI=; b=0yi+18WuKFnRRupMIoe4pBRNzE
	AYLspQMIlFhDbx832PenxEPOLNGR3fX9wLGLpdmocwxze4H9OoaSa0H4meUpCzSLxGBjSKrNQX8xC
	FFj4ryetlmmmCVm9cc+pj2+SmZqJ3GnJsDpTOw2PR4oJ9O4Hv774iEjNeCNxA6GtX2HnPxmrwfj34
	HDyYKcAsxc8M5OwTlv/SfyUrhDu9mvjeIAEhddISouxe4QXAngPTEPtW9qc8W3c7FLerTdSk1xL0D
	bQJ1bdm20PVIUpyRVGX7xgH/4IbwEp81CrZnqR3u2RtB5bu517gXfoVvZ0ohMItaoIyJNK1I5pKx4
	ERSuyDsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upHnG-00000001JDm-2sc2;
	Fri, 22 Aug 2025 02:46:18 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upCP3-00000000bXx-1d5I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 21:00:58 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3235e45b815so1629044a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 14:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755810056; x=1756414856; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=vioVXt2ZZgg7NeYPZVOuYjJyML9DfewAFD4Lo8ICLyI=;
        b=YHx2bX2tZ8/ezH8COHE+RKoN8vK8kD/4sjmdFz0eUCiaPigTUjqf91fwS6h32fTu/r
         rga6+r1D2yjy4eRa8s1ZHkpcKR+m9werS6F8JcXTUa64gDot9VLdW2EA1mGRxb8TEGh5
         o2SlEs+9rWyVInVcbtMs4qJfeuhG1ucExzhnsEOsYBNAKxWeAludDgzpvFrGVhf7d1EA
         DBW9dfM1NqDVtTBubp24gwvhH/3NTBs99KWZGcJ3VfFr6PPDFqlp1LXq1Y/l+feduvtS
         JHgKVBlTafVT2hCw2jg2Mie3q83PrBBKXxPGR7R6NdDC0SDdImmiHvTNW9ABpSTz2Q+M
         ynrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755810056; x=1756414856;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vioVXt2ZZgg7NeYPZVOuYjJyML9DfewAFD4Lo8ICLyI=;
        b=MUD9bNAorTjl6h+KdK1b0a879gvO9J0WQ25T6tSm3+V9FVe9PjwOn0ccCobH1w+nro
         WdkIHp2TXZcYkMnJYjAbaY5K5lm2ji2P+3YUmaaNzrtkWmjRCFm5v2xHs1NC3eN/Bs1X
         UCDspxY10tb0CLiVk0ftvifTEXVpOYxJCRg9edC3JF5cxBQonQJbKnCG1VKN16Wlympj
         GDUfh582oaxKALGAaFvVc8tVl0umi7AEe++Jl1jqrXLtQZ+t9dUvh/yaUPSD4A+vnYvf
         6QSHJt0n2uJJwOOmXgci4CJVQn32bkpC7f1/BlnHly4uRAiu6yvd7AEXy0k+s5yoM8NL
         Hrcw==
X-Gm-Message-State: AOJu0YzOefQeEz7nuom0a+uoPPi8LjACR3qVkPPnUbmGDJ1MD08Bamzu
	hESmE0FgFdVTol2QJo+09B2EKNMsBTg/JmtblWHYBQZvDyVJ3ck1wpSC7ZefJbsmxMVzk+xFHnl
	RruRgsw==
X-Google-Smtp-Source: AGHT+IFMAoySLGWaBGxxLE7EGe5/JK70vfGurcQkwXtR0YxVIkKbRYcB3XHf65NsmmZ5Hb+78WjJ0WrD9XU=
X-Received: from pjbee15.prod.google.com ([2002:a17:90a:fc4f:b0:321:c3cc:2574])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c45:b0:324:e96a:2ada
 with SMTP id 98e67ed59e1d1-3251774ac2emr940105a91.21.1755810055944; Thu, 21
 Aug 2025 14:00:55 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:00:32 -0700
In-Reply-To: <20250821210042.3451147-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250821210042.3451147-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250821210042.3451147-7-seanjc@google.com>
Subject: [RFC PATCH 06/16] KVM: arm64: Pass kvm_page_fault pointer to transparent_hugepage_adjust()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sean Christopherson <seanjc@google.com>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_140057_426015_0522D223 
X-CRM114-Status: GOOD (  13.61  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Use the local kvm_page_fault structure to adjust for transparent hugepages
when resolving guest aborts, to reduce the number of parameters from 5=>2,
and to eliminate the less-than-pleasant pointer dereferences.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/mmu.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index ca98778989b2..047aba00388c 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1361,19 +1361,15 @@ static bool fault_supports_stage2_huge_mapping(struct kvm_memory_slot *memslot,
  * Returns the size of the mapping.
  */
 static long
-transparent_hugepage_adjust(struct kvm *kvm, struct kvm_memory_slot *memslot,
-			    unsigned long hva, kvm_pfn_t *pfnp,
-			    phys_addr_t *ipap)
+transparent_hugepage_adjust(struct kvm *kvm, struct kvm_page_fault *fault)
 {
-	kvm_pfn_t pfn = *pfnp;
-
 	/*
 	 * Make sure the adjustment is done only for THP pages. Also make
 	 * sure that the HVA and IPA are sufficiently aligned and that the
 	 * block map is contained within the memslot.
 	 */
-	if (fault_supports_stage2_huge_mapping(memslot, hva, PMD_SIZE)) {
-		int sz = get_user_mapping_size(kvm, hva);
+	if (fault_supports_stage2_huge_mapping(fault->slot, fault->hva, PMD_SIZE)) {
+		int sz = get_user_mapping_size(kvm, fault->hva);
 
 		if (sz < 0)
 			return sz;
@@ -1381,10 +1377,8 @@ transparent_hugepage_adjust(struct kvm *kvm, struct kvm_memory_slot *memslot,
 		if (sz < PMD_SIZE)
 			return PAGE_SIZE;
 
-		*ipap &= PMD_MASK;
-		pfn &= ~(PTRS_PER_PMD - 1);
-		*pfnp = pfn;
-
+		fault->ipa &= PMD_MASK;
+		fault->pfn &= ~(PTRS_PER_PMD - 1);
 		return PMD_SIZE;
 	}
 
@@ -1724,9 +1718,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 		if (fault->is_perm && fault_granule > PAGE_SIZE)
 			vma_pagesize = fault_granule;
 		else
-			vma_pagesize = transparent_hugepage_adjust(kvm, fault->slot,
-								   fault->hva, &fault->pfn,
-								   &fault->fault_ipa);
+			vma_pagesize = transparent_hugepage_adjust(kvm, fault);
 
 		if (vma_pagesize < 0) {
 			ret = vma_pagesize;
-- 
2.51.0.261.g7ce5a0a67e-goog


