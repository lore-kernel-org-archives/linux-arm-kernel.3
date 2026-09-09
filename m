Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F22C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 10:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9lkQQXf5XYtCcdnsfgeCGlKVAE7OhiLAhG9JfwG3Lk=; b=qWK603thEzc/Sexnoehi1YbJRP
	NBQ11o97QbvNEtTd9h7WydHnRsZX7VhjhvAv0Pu9yiRziGJv5Y13R7aJMmouu/3P+NKpt0yATw2QZ
	6wQatFN1Hix/P0gjIHp+N4pKFDIP266ma12eQWbw/6i8WOsUlbNVuUC1WnTbzcUah6v4gHH1/3N70
	A2/8ottUX5sAsLb00sGZLqPeQTcywcNosieOhRYbaYLi8m4h04kC12FBgHNjKZS7x4WvCCJctJnhI
	bWum2VAqvAAlVx1Q7LcfOGJakQXGLz/uy5odX5nqSjuBWjfeaTIWO1WDirLEP7ppflfH8FCPL0xEX
	8VzIC7Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Ebe-0000000BI8c-1DnB;
	Wed, 09 Sep 2026 09:28:38 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4EbX-0000000BI1I-4AbF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 09:28:34 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=F9lkQQXf5XYtCcdnsfgeCGlKVAE7OhiLAhG9JfwG3Lk=;
	b=fqO8rMb3HlVD+32HaLHoJ8RBkcSU2TDanLzf76vQO2uJlP70eaN2O1NtS+oKrG2yJa9OVZQpU
	jjtGxV/XWUiIa/xsFV7hgOV3ubrj8bgGYCq4MD7j5TCLNk3nLPbbOiDPUJsOx+sRgChW8z2NApD
	jtx1eUHX7kp1Vu9J/r6mCqI=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4hfwF34pMrz1prQs;
	Wed,  9 Sep 2026 17:17:27 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id 921854056E;
	Wed,  9 Sep 2026 17:28:23 +0800 (CST)
Received: from huawei.com (10.50.85.135) by kwepemr500001.china.huawei.com
 (7.202.194.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 17:28:22 +0800
From: Jinjiang Tu <tujinjiang@huawei.com>
To: <akpm@linux-foundation.org>, <david@kernel.org>, <ljs@kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<ryan.roberts@arm.com>, <peterx@redhat.com>, <dave.jiang@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>
CC: <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>,
	<tujinjiang@huawei.com>
Subject: [PATCH 2/3] arm64: simplify pmd_special and pmd_mkspecial
Date: Wed, 9 Sep 2026 17:00:17 +0800
Message-ID: <20260909090018.1991485-3-tujinjiang@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909090018.1991485-1-tujinjiang@huawei.com>
References: <20260909090018.1991485-1-tujinjiang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.85.135]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemr500001.china.huawei.com (7.202.194.229)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_022832_501285_ED0017EE 
X-CRM114-Status: UNSURE (   8.09  )
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

Use pte_special() and pte_mkspecial() helper to simplify pmd_special()
and pmd_mkspecial(), and kill unused set_pmd_bit() and clear_pmd_bit()
helper.

Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>
---
 arch/arm64/include/asm/pgtable.h | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 6000905a2e86..427ea3d2bac7 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -243,18 +243,6 @@ static inline pte_t set_pte_bit(pte_t pte, pgprot_t prot)
 	return pte;
 }
 
-static inline pmd_t clear_pmd_bit(pmd_t pmd, pgprot_t prot)
-{
-	pmd_val(pmd) &= ~pgprot_val(prot);
-	return pmd;
-}
-
-static inline pmd_t set_pmd_bit(pmd_t pmd, pgprot_t prot)
-{
-	pmd_val(pmd) |= pgprot_val(prot);
-	return pmd;
-}
-
 static inline pte_t pte_mkwrite_novma(pte_t pte)
 {
 	pte = set_pte_bit(pte, __pgprot(PTE_WRITE));
@@ -619,11 +607,8 @@ static inline pmd_t pmd_mkhuge(pmd_t pmd)
 }
 
 #ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
-#define pmd_special(pte)	(!!((pmd_val(pte) & PTE_SPECIAL)))
-static inline pmd_t pmd_mkspecial(pmd_t pmd)
-{
-	return set_pmd_bit(pmd, __pgprot(PTE_SPECIAL));
-}
+#define pmd_special(pmd)	pte_special(pmd_pte(pmd))
+#define pmd_mkspecial(pmd)	pte_pmd(pte_mkspecial(pmd_pte(pmd)))
 #endif
 
 #define __pmd_to_phys(pmd)	__pte_to_phys(pmd_pte(pmd))
-- 
2.43.0


