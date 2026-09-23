Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2AEC98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 14:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C/jXk2YYyHPMkVqRrGY/FRmIlGWuOA8HLRzHk1PaDVE=; b=e21hloqctjVVPP5mBL7jRph2Wh
	YvwPJ1qQcTDpKnDmeUKn91llo+pDCP22UuE+69lcbWZr3LCarXj8RMl1AuKQJa5urXc70M7Vt05uH
	uSEy6oFCa3mSB+aUeqwa+MCOttWoL/TI+V5PHIeC+d9ocpDiTo7lkGHokxUvxVD6KhzphXJ1ej8JS
	BlLeHGaLV7t5hxhMuMnLkvsKd7aE8Vi/tyLgopHzQO1UBPVdgn8gF15GE6fbGV+VEAo0PnF4C9o4y
	9e/Yk/ldQfbbzFJyWRfqB+ciK8qtuBy4VPymQuPgQJAHBn837LdA3yLdDFZWcShJbQp5cTvwSPWY6
	StptPo0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9O5n-00000008YDI-0BhX;
	Wed, 23 Sep 2026 14:37:03 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9O5h-00000008YC9-1WU0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 14:37:00 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so11493555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 07:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790174214; x=1790779014; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C/jXk2YYyHPMkVqRrGY/FRmIlGWuOA8HLRzHk1PaDVE=;
        b=sXOyvxlevOVETYry2MvJOQ8ZVmkHTTcwaw0Wf23kTcsibRNepPXKw5tX7i4eXNkRwZ
         njkWCdPLxYMwS5QfhNgIsdp+zS0et5uT367IJ7EfsnD7sIVLst7IMNfmDdXAN6zkxhrS
         h9U9Djx+CsStlUhTyeW1+kdNYqRsTg+a1obRagbEJeXljORSs4OcXrBAZkz1jihFKXM1
         hnwcIpBkFbrMAPFUTsGN/nHNFIrLJMhhjP3uDQcWz18Mxq61k+HkAGPS94FFkm2KUOCJ
         Pn30nxTVI5+AWgabreyRcSZiYz8vKfRfN30ZfZdvKvOw2AMTxrPSXKtAewQkRdcEUzXu
         UfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174214; x=1790779014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C/jXk2YYyHPMkVqRrGY/FRmIlGWuOA8HLRzHk1PaDVE=;
        b=TFc8iBsMKR1Qjb6CT8LmBryRfK7qZHK0jOqKfeNoit2ftijO6IPM+GfXkrTqO7XkE9
         Sh4ibB6FmASQ/WHpvVjjIpQki7TjX8iCqf/Too7EvIE6PKsZe6OQk3F0i1zTYhsDLRnX
         xIhDkCaRXP9vkECDrdoXWmmJ3wOGJo6Hzv1ZHdaSWPycFlq6ddaAavnaGYd1WrYjmwLR
         HqcPFqDeBkbwys3x9ycnSUVQALdSlwjSgxiBvcjglk3ybMCDM6U/1uO8W+VmkAQXdHNV
         Mwrycn6aURAKVc9tE+7/VVGFZh2CSA5K7/2qcqK5G1gol52H6Ie74xueewzFhVGqT+LO
         dqIA==
X-Forwarded-Encrypted: i=1; AKwUvByZhGobV6fVecpAIgQDtwqptwkyTmsizKEhRHEUU+jHHqaHRX87yyzX+hnsyFa7JACtPA5/F+NLx05sspwsRuRt@lists.infradead.org
X-Gm-Message-State: AFuF++mAmqZT2PkM/2SnyOHTSJ5GPBVlnXjAfVVwB46Qy9Lp4xyo/GWL
	qIPgsAoI3TNDivNkZHMJy4nTvKsBkBAZRGCnSv3KdG5z2ErvEZ8CmQ0c
X-Gm-Gg: AYBFou3/rVP/mAFuXg3BoEXtL7y28d8sQXMCggC+JmcbaA6SgIMRbwUjnU+QiHzox+d
	/VRmeOIU70fx9T/zpSXjrqGZLIzeyLv0g4DCW0rMTY9tEgLa0jZ47Q1C9tHMNEVzNQz4hoN3KY0
	/4fu3rNFPVVuiqLXX1AFTJsG9INzjxk+lCT7UrUEb3kj7BiIATNQRtVaYjSGqvr6uge1plgF6JV
	yjXBoagfd62t+BiZV7XVUTRtESTHKGykU8rHA5vpYikzEKAOTdfTQzeFs8JTMILcu4Z1HomUnhA
	TAZxi23tNgjryQGvOFCBPRiLM2jQSABzRLb0Ore5TmM0JIe7vXCzJvQpwtaQCxuhKPMrVbZIMAz
	Oj6tYIGCrsvOZFpt7nmrUj9XNn9JcLyAT79LdDvueL5/h4WDNkzuZ5KFWF3cCqqqUVHYSRTX9xp
	aJ6vetpg+AbHhck/fa/L3IlI24+mvWrrO+USQO47V1yoTnCqctmzkJP6d+bpSAUiIFXxlWnuokX
	h02LY/qkYJUst2uIMGs3kgNI8B/slZNUV/wubtceQLU
X-Received: by 2002:a05:600c:c493:b0:49d:15f8:2bdb with SMTP id 5b1f17b1804b1-49fdee0a968mr39819935e9.7.1790174213402;
        Wed, 23 Sep 2026 07:36:53 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.116.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1aca52sm81960045e9.14.2026.09.23.07.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:36:52 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dev Jain <dev.jain@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] arm64: mm: Fix the break-before-make flush range for erratum 2645198
Date: Wed, 23 Sep 2026 16:36:32 +0200
Message-ID: <20260923143636.89480-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_073659_337158_63529162 
X-CRM114-Status: GOOD (  15.06  )
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

modify_prot_start_ptes() performs the break-before-make TLB invalidation
required by erratum 2645198 with __flush_tlb_range(), whose third
argument is the end address of the range.  It passes nr * PAGE_SIZE
instead of addr + nr * PAGE_SIZE, so __do_flush_tlb_range() computes the
page count as (nr * PAGE_SIZE - addr) >> PAGE_SHIFT.

For addr > nr * PAGE_SIZE that subtraction underflows, the page count
exceeds the batching limit and the flush degenerates to flush_tlb_mm(),
so a single-page mprotect broadcasts an ASID-wide invalidation and a
full-range mmu notifier call.

For addr <= nr * PAGE_SIZE only [addr, nr * PAGE_SIZE) is invalidated,
and when the cleared batch starts below nr * PAGE_SIZE the tail is left
in the TLB.  The workaround then no longer covers the whole batch, and
for addr == nr * PAGE_SIZE the flush is empty.

On affected Cortex-A715 CPUs, this can corrupt ESR_ELx and FAR_ELx on the
next instruction abort caused by a permission fault.

Pass addr + nr * PAGE_SIZE as the end address.

Fixes: 7efa1cd5f89b5 ("arm64: add batched versions of ptep_modify_prot_start/commit")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 arch/arm64/mm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 79d90226fd5dc..d4384131e10d8 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -2295,7 +2295,7 @@ pte_t modify_prot_start_ptes(struct vm_area_struct *vma, unsigned long addr,
 		 * in cases where cpu is affected with errata #2645198.
 		 */
 		if (pte_accessible(vma->vm_mm, pte) && pte_user_exec(pte))
-			__flush_tlb_range(vma, addr, nr * PAGE_SIZE,
+			__flush_tlb_range(vma, addr, addr + nr * PAGE_SIZE,
 					  PAGE_SIZE, 3, TLBF_NOWALKCACHE);
 	}
 
-- 
2.53.0


