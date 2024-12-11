Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56109E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 15:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iEBINFMezgkT8kFwn0hqoIa1/VcW9GASEhKC5a7WGaY=; b=4zP+GBuMW3KMuNDQPr7KFOKPJk
	y0LcmhHMYsgx6+pKFyth88RMBmLglQNvFqCSmW+QSyBe2xqx+lMBVOoJnneFEfsCMvpXvRH5TdE5a
	Kc51+Sq0XNkG+YojAKa1aahFWT9xarUPU0Rfo2atoZ4odC8EjV8esRvBhc/5mdqCMfy9WM4PYT7Xn
	7f8ncnN6aUzDmHRlpll4/AUHFafIXyJdemtVzdLxgmSKedAVpreaq1kMlIRexou5JE4/csCw1pMzX
	dNTj0aXSc5P3RjmEwxQlU39hHwHKBGq7BosHARyCZHijjOtFY2Wpj9bZyNTqkwNoe9QjyP7Cu+kFj
	P/27xaxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLP3y-0000000FLkr-2pRu;
	Wed, 11 Dec 2024 15:55:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOvR-0000000FJoj-0dFa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 15:46:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79F5DFEC;
	Wed, 11 Dec 2024 07:47:24 -0800 (PST)
Received: from mazurka.cambridge.arm.com (mazurka.cambridge.arm.com [10.1.196.66])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5FD93F5A1;
	Wed, 11 Dec 2024 07:46:54 -0800 (PST)
From: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com
Cc: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	liunx-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvmarm@vger.kernel.org
Subject: [RFC PATCH v1 5/5] arm64/mm: Elide tlbi in contpte_convert() under BBML2
Date: Wed, 11 Dec 2024 15:45:06 +0000
Message-ID: <20241211154611.40395-6-miko.lenczewski@arm.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241211154611.40395-1-miko.lenczewski@arm.com>
References: <20241211154611.40395-1-miko.lenczewski@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_074657_226612_5AA0E4D4 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

If we support BBM level 2, we can potentially avoid an intermediate
TLB invalidation, as hardware is capable of managing the TLB itself
in this situation. Hardware will either silently clear out the
offending entry, or will take a TLB Conflict Abort Exception.

Note that such aborts should not occur on Arm hardware and indeed
were not seen on any of the benchmarked systems.

Eliding the invalidation results in a 12% improvement on a
microbenchmark which targeted the worst case of contpte_convert(), which
represents an 80% reduction in the overhead of contpte_convert().

Note also that this patch is pending review to ensure that it is
architecturally valid, and we are working with Arm architects to
validate this patch.

Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>
---
 arch/arm64/mm/contpte.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index fc927be800ee..009690770415 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -72,9 +72,6 @@ static void contpte_convert(struct mm_struct *mm, unsigned long addr,
 		__flush_tlb_range(&vma, start_addr, addr, PAGE_SIZE, true, 3);
 
 	__set_ptes(mm, start_addr, start_ptep, pte, CONT_PTES);
-
-	if (system_supports_bbml2())
-		__flush_tlb_range(&vma, start_addr, addr, PAGE_SIZE, true, 3);
 }
 
 void __contpte_try_fold(struct mm_struct *mm, unsigned long addr,
-- 
2.45.2


