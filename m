Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF48C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 08:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOyJ3bbxtTyHnbUxiYgYRtegI1lip9bbHwf/0u573ho=; b=lZrHUu4b9uPuBFKISJ89Sr9rOJ
	6PlDb1LlRm3xuJiljYR1IP/OQkvs4zij2b/5xa8e40xKaPkqw6Z1l1G0X1R0dU9Rpmb2eUCSAUSH+
	Km5THG+FTQrGRpAEIB+3Jt4ifDWhFRnAd+BPOUq9xfKSdC20hNrLI65cFhIYkvLzr/SLXcMd/UToO
	pihHfPkOCT8FTM6lSli1xtwVnwkc0MjfnN2dvTV+boOZftXwTre9sCl2EHjCMjFn+Mf9NEvaBENqM
	U9F/6CyIhPAp9N/BiGmIDdUY53qjAl3tuJ4BxXU6CyJdpZytHUamPd326lzreECiSV5USkbe1nBGM
	NrvUJJqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bg8-000000050Gb-0fAM;
	Tue, 15 Apr 2025 08:30:00 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bZ8-00000004yNe-12Xb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 08:22:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=JOyJ3
	bbxtTyHnbUxiYgYRtegI1lip9bbHwf/0u573ho=; b=eiYwfh3b9Gv+hi0GvBuzY
	g4/bqySGRTR8KN4ak8/zV3dCSxHtXt9v2XuIqBSdbw4pwApRNle8ZcN/UeyK69/h
	C/hEl91J28fg8cil1oVq3/bOsQfAyG425QqgxklF7hq00LDoJ155cCjL3RCHRlyK
	GxGtLonTAWowIDIR1Moac4=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wAXIEsxF_5n1K_IAA--.17854S2;
	Tue, 15 Apr 2025 16:22:10 +0800 (CST)
From: Xavier <xavier_qy@163.com>
To: ryan.roberts@arm.com,
	dev.jain@arm.com,
	ioworker0@gmail.com,
	21cnbao@gmail.com
Cc: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	david@redhat.com,
	gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	will@kernel.org,
	willy@infradead.org,
	xavier_qy@163.com,
	ziy@nvidia.com
Subject: [mm/contpte v3 1/1] mm/contpte: Optimize loop to reduce redundant operations
Date: Tue, 15 Apr 2025 16:22:05 +0800
Message-Id: <20250415082205.2249918-2-xavier_qy@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415082205.2249918-1-xavier_qy@163.com>
References: <f0e109c7-6bb2-4218-bc76-c5de39184064@arm.com>
 <20250415082205.2249918-1-xavier_qy@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAXIEsxF_5n1K_IAA--.17854S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww18ZFWxZrykGr48ur1DGFg_yoW8WF1Upr
	y8Cw1aqr1xJF13Jas3tw1rtrW5Jwn3tay7ArnIya1UA34rZr95uryFk3ya9rWUGrWFq3y8
	Zw1jqrsrCFW7CaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piJUUUUUUUU=
X-Originating-IP: [101.132.132.191]
X-CM-SenderInfo: 50dyxvpubt5qqrwthudrp/1tbiwhowEGf+Eoi2tQAAs4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_012246_594687_7A6BD919 
X-CRM114-Status: GOOD (  11.36  )
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
 arch/arm64/mm/contpte.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index bcac4f55f9c1..0acfee604947 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -152,6 +152,16 @@ void __contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
 }
 EXPORT_SYMBOL_GPL(__contpte_try_unfold);
 
+/* Note: in order to improve efficiency, using this macro will modify the
+ * passed-in parameters.*/
+#define CHECK_CONTPTE_FLAG(start, ptep, orig_pte, flag) \
+    for (; (start) < CONT_PTES; (start)++, (ptep)++) { \
+		if (pte_##flag(__ptep_get(ptep))) { \
+				orig_pte = pte_mk##flag(orig_pte); \
+				break; \
+		} \
+    }
+
 pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
 {
 	/*
@@ -169,11 +179,17 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
 	for (i = 0; i < CONT_PTES; i++, ptep++) {
 		pte = __ptep_get(ptep);
 
-		if (pte_dirty(pte))
+		if (pte_dirty(pte)) {
 			orig_pte = pte_mkdirty(orig_pte);
+			CHECK_CONTPTE_FLAG(i, ptep, orig_pte, young);
+			break;
+		}
 
-		if (pte_young(pte))
+		if (pte_young(pte)) {
 			orig_pte = pte_mkyoung(orig_pte);
+			CHECK_CONTPTE_FLAG(i, ptep, orig_pte, dirty);
+			break;
+		}
 	}
 
 	return orig_pte;
-- 
2.34.1


