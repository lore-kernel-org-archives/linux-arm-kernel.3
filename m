Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A569C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 09:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XjnlXfHduLY+rrmKH9+0EuauvU+FcYu+CLRTJgWmNn0=; b=ZjxQlW83zEPJJKti+35IF3ExA6
	Uu1Wuub5YyrHT//49U4PytRCHyIHUTSgii3ycl+CSEjh1b4ZEhOfSs7lPbiQeZQZRHPaA5AWDkCh0
	vYKBqTdZshF0kgIiR0yHATsbUB7iw1bz1n4HtSa0sjWTEUkxAE3tfJiiTjSPf8vrbMSBipP01V7l3
	kQ4mKyIuOEFJ7I4j+Uf2w6quOUDMuwKTDgm6g9kwAqPsJgljxLY7sLStyhOS8SdQZ/sNdM5s2Pc4K
	mXqBN8q8OwqVtwD8b7eL065/oIuzoN8qWkEJQk9ul4FR1gINV+xqvbhzshC778NgK7aiNOGF5przw
	iL2KcThw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxNx-00000000Ea4-2tJZ;
	Thu, 08 May 2025 09:17:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCx0D-00000000AvY-1hiy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 08:53:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746694391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XjnlXfHduLY+rrmKH9+0EuauvU+FcYu+CLRTJgWmNn0=;
	b=IZNjBkw3wXPpFEZzxgs8BBwvdFgY60RtJ/GkjJBDFmDu03vinj2z/HlVow70nUT0BeM8Ff
	9qHeJV1PQFyjuItbcV7hlesRweAu8B9zTyJqPu+eqfLWvySJOzircoAiuzzYPIYMKMbLOB
	qlRLUuqTzbcyze+dzuiFqzEDgbnb74g=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-494-kdACPehFNBSx2-OB9Bo3hQ-1; Thu,
 08 May 2025 04:53:08 -0400
X-MC-Unique: kdACPehFNBSx2-OB9Bo3hQ-1
X-Mimecast-MFC-AGG-ID: kdACPehFNBSx2-OB9Bo3hQ_1746694386
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3168C1956086;
	Thu,  8 May 2025 08:53:06 +0000 (UTC)
Received: from gshan-thinkpadx1nanogen2.rmtau.csb (unknown [10.64.136.14])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8C5DC19560B4;
	Thu,  8 May 2025 08:52:59 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	anshuman.khandual@arm.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	gshan@redhat.com,
	peterx@redhat.com,
	joey.gouly@arm.com,
	yangyicong@hisilicon.com,
	shan.gavin@gmail.com
Subject: [PATCH v2] arm64: mm: Drop redundant check in pmd_trans_huge()
Date: Thu,  8 May 2025 18:52:51 +1000
Message-ID: <20250508085251.204282-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_015313_510014_167A0104 
X-CRM114-Status: GOOD (  12.14  )
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

pmd_val(pmd) is redundant because a positive pmd_present(pmd) ensures
a positive pmd_val(pmd) according to their definitions like below.

  #define pmd_val(x)       ((x).pmd)
  #define pmd_present(pmd) pte_present(pmd_pte(pmd))
  #define pte_present(pte) (pte_valid(pte) || pte_present_invalid(pte))
  #define pte_valid(pte)   (!!(pte_val(pte) & PTE_VALID))
  #define pte_present_invalid(pte) \
          ((pte_val(pte) & (PTE_VALID | PTE_PRESENT_INVALID)) == PTE_PRESENT_INVALID)

pte_present() can't be positive unless either of the flag PTE_VALID or
PTE_PRESENT_INVALID is set. In this case, pmd_val(pmd) should be positive
either.

So lets drop the redundant check pmd_val(pmd) and no functional changes
intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
v1: https://lore.kernel.org/linux-arm-kernel/4e5941f8-7e61-4a63-a669-bee1601093a6@arm.com/T/#u
v2: Improved commit log per Anshuman
---
 arch/arm64/include/asm/pgtable.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index d3b538be1500..2599b9b8666f 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -739,8 +739,7 @@ static inline int pmd_trans_huge(pmd_t pmd)
 	 * If pmd is present-invalid, pmd_table() won't detect it
 	 * as a table, so force the valid bit for the comparison.
 	 */
-	return pmd_val(pmd) && pmd_present(pmd) &&
-	       !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID));
+	return pmd_present(pmd) && !pmd_table(__pmd(pmd_val(pmd) | PTE_VALID));
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
-- 
2.49.0


