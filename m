Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D960EC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 09:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8TN9/6BnKvyU3e8vS2iprMvt0bdbH7kVE3wStXcniB4=; b=o4ZSicv4VoDDAIzqdCDpiUQmcz
	KP8cgva9PJS8+0lMwU6sJxvPzd71MCAumHz6/GzvyHkDeZg15av8FlyVqd4REsCRiaRlRWE3UgPex
	MuOqn/lJEmqiNFItj02MskTNOoGmRB6jCmW23C+dJNjF8+ufl/s3Ad/9Apa8Q5EdyKCbqQs746fxA
	ENY9csWdWarrlS9wMTeFzjMqghteEgcCefTQbqPEI8j7xzRTeaMKYdu+jp1uqJl+HHeKYVjunGh1n
	qA4CBJZXXq2YhJubtrDIztiKwAxT3LzDR5e1XbAk57yTe5Kmq8SNwR2CnYU0lNoPu4Kz1v03v827+
	SmFFTU2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ijk-0000000HBh2-41VE;
	Mon, 07 Apr 2025 09:25:48 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ihz-0000000HBLB-1780
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 09:24:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=8TN9/
	6BnKvyU3e8vS2iprMvt0bdbH7kVE3wStXcniB4=; b=d3JbWkbc94Y9e0M1/KoJZ
	kJCyNIX5hYPPv5KEDfpgU49ogkrXWuQDHG99CC1liP2oR3dx8/IgApfkGGeUbeDF
	n7xib3tanF2iFbJPf+/cjXtxJqYpwkjKpUT6vn+EejgVSGa8fgxK9zigJF+vNWNF
	IrkHR5+Jej5uuiiwHABwNg=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDn32p6mfNne6pOEw--.1721S2;
	Mon, 07 Apr 2025 17:23:06 +0800 (CST)
From: Xavier <xavier_qy@163.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	baohua@kernel.org,
	ryan.roberts@arm.com,
	ioworker0@gmail.com
Cc: xavier_qy@163.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] mm/contpte: Optimize loop to reduce redundant operations
Date: Mon,  7 Apr 2025 17:22:43 +0800
Message-Id: <20250407092243.2207837-1-xavier_qy@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDn32p6mfNne6pOEw--.1721S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrur43Cr17tw15uF4xZry7KFg_yoWkArb_Zr
	4xtasxXF1UJFyjgFyUt398Gryjgayj93W3JFn29r1UXryfW3yfXrZ2qF92gF1xWrWagr45
	trn8Jr13uFnrCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNE_MDUUUUU==
X-Originating-IP: [101.132.132.191]
X-CM-SenderInfo: 50dyxvpubt5qqrwthudrp/1tbiTh8oEGfzkOnw9AABsB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_022359_676165_55E9D327 
X-CRM114-Status: GOOD (  10.97  )
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

This commit optimizes the contpte_ptep_get function by adding early
 termination logic. It checks if the dirty and young bits of orig_pte
 are already set and skips redundant bit-setting operations during
 the loop. This reduces unnecessary iterations and improves performance.

Signed-off-by: Xavier <xavier_qy@163.com>
---
 arch/arm64/mm/contpte.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index bcac4f55f9c1..ca15d8f52d14 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -163,17 +163,26 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
 
 	pte_t pte;
 	int i;
+	bool dirty = false;
+	bool young = false;
 
 	ptep = contpte_align_down(ptep);
 
 	for (i = 0; i < CONT_PTES; i++, ptep++) {
 		pte = __ptep_get(ptep);
 
-		if (pte_dirty(pte))
+		if (!dirty && pte_dirty(pte)) {
+			dirty = true;
 			orig_pte = pte_mkdirty(orig_pte);
+		}
 
-		if (pte_young(pte))
+		if (!young && pte_young(pte)) {
+			young = true;
 			orig_pte = pte_mkyoung(orig_pte);
+		}
+
+		if (dirty && young)
+			break;
 	}
 
 	return orig_pte;
-- 
2.34.1


