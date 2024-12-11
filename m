Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE6DE77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 16:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iEBINFMezgkT8kFwn0hqoIa1/VcW9GASEhKC5a7WGaY=; b=lOFt3kG2ImIY5lad1siiPSnT39
	BqhpI4j/Lq3E2vmdeCqGcGEfTeajTzbt2iCuf6Z/PD4qFAz3kZVJmW6TolPdjBlJKeuIDQcyXsbqe
	L5sWjmwog2G8/cveiVgSosDNKGEGMi8t9vNUve2u8SjfWxVRnwKIbkUkwRkiQDlgoeeROe51sr7SI
	KwhNJoqu+M9Xd2DCrjn3q6CotS8fWafghttskm7mRrhXmsIdaZp5hfWEd4bvPxZhyEbnNjxIMpI5g
	5FSQUu2UOKS036bdVv/k9V3kNQy5OmHj2TUwBEpwJxSoitHDOGpoGvR8Kprn+rrX5ZCYwDyjejslw
	AqtlIlEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPHx-0000000FOzp-2Jaw;
	Wed, 11 Dec 2024 16:10:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLPB8-0000000FNNL-0P6P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 16:03:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C32071713;
	Wed, 11 Dec 2024 08:03:37 -0800 (PST)
Received: from mazurka.cambridge.arm.com (mazurka.cambridge.arm.com [10.1.196.66])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A0CF63F5A1;
	Wed, 11 Dec 2024 08:03:07 -0800 (PST)
From: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>
To: ryan.roberts@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com
Cc: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: [RESEND RFC PATCH v1 5/5] arm64/mm: Elide tlbi in contpte_convert() under BBML2
Date: Wed, 11 Dec 2024 16:01:41 +0000
Message-ID: <20241211160218.41404-6-miko.lenczewski@arm.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241211160218.41404-1-miko.lenczewski@arm.com>
References: <20241211160218.41404-1-miko.lenczewski@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_080310_174217_F6FD3A06 
X-CRM114-Status: UNSURE (   9.37  )
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


