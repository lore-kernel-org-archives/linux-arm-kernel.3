Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0E6C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 09:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zKhG9qiEMRLJS/mGX8jO8pyM5ReATHHbxqdxWWXsPx8=; b=PBSdRKeePEHCRxmAh6Q3IMKE/L
	aX8idjXv2+stGw+s0tmVupi+/w9bfgiI6DiR86ndU0xRcYMV47/ow6gx1k3hvw+xHAxsc5FvJIAWJ
	Nl+zMqbsF2spm7lpwB3hYOwWJLkuxjqs9OsMVFPqMxUTXGBXxqvP4YV2dfTZlljDo+DTuuz14oWrh
	Vk0mhfj9PFtVtxgF8e77bv1gfuhCF7mvGoqU5HbBIFuu8Ja0Vq+c4FkFFcvG7MH7/qbyrnG0cV8s4
	02LRXL/TaVmrkr4VxtD2m6GdPsjuZxTozYl3rTnmamIPDvxX2kbdf3O2w/SinVJahfAmZKDDnjbgp
	PpUb2bgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u252i-00000003P5C-2NeW;
	Tue, 08 Apr 2025 09:14:52 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u24nE-00000003LtW-2yVW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 08:58:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=zKhG9
	qiEMRLJS/mGX8jO8pyM5ReATHHbxqdxWWXsPx8=; b=DZ5qJ+c0PnOUua2pWcX9w
	MAkfLRn2tolNjzPPBDRwOJ/120UmLBKlssIdgsWiCq1umm/otz5XdwNI/7UuOqk+
	vo7XJPCRlnBwwkRmiUkM3XWUhfPqmuHgXBSpc4W5uJ3P5SxJboDpkQmPLNr8xsmA
	xl/yBB/UfBP2cuGTFh5E0g=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wCHF00m5fRnQGxPEw--.37725S2;
	Tue, 08 Apr 2025 16:58:14 +0800 (CST)
From: Xavier <xavier_qy@163.com>
To: dev.jain@arm.com,
	akpm@linux-foundation.org,
	baohua@kernel.org,
	ryan.roberts@arm.com,
	catalin.marinas@arm.com,
	ioworker0@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	will@kernel.org,
	xavier_qy@163.com
Subject: [PATCH v2 1/1] mm/contpte: Optimize loop to reduce redundant operations
Date: Tue,  8 Apr 2025 16:58:09 +0800
Message-Id: <20250408085809.2217618-2-xavier_qy@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408085809.2217618-1-xavier_qy@163.com>
References: <027cc666-a562-46fa-bca5-1122ea00ec0e@arm.com>
 <20250408085809.2217618-1-xavier_qy@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCHF00m5fRnQGxPEw--.37725S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww18ZFWxZrykJw17ZFy3twb_yoW8Xw4xpr
	y8CwnIqr17JFnxG393Jw1rJry5Jws3tFW7ArnIya1UJryF9rn5u34Fk34a9rWUGrZ5X3y8
	Zw1UtrnruFW7CF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piXyCJUUUUU=
X-Originating-IP: [101.132.132.191]
X-CM-SenderInfo: 50dyxvpubt5qqrwthudrp/1tbiTQwpEGf03i7+0gAAs3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_015853_081084_C36A272D 
X-CRM114-Status: GOOD (  11.76  )
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
 arch/arm64/mm/contpte.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index bcac4f55f9c1..034d153d7d19 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -152,6 +152,18 @@ void __contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
 }
 EXPORT_SYMBOL_GPL(__contpte_try_unfold);
 
+#define CHECK_CONTPTE_FLAG(start, ptep, orig_pte, flag) \
+	do { \
+		int _start = start; \
+		pte_t *_ptep = ptep; \
+		while (_start++ < CONT_PTES) { \
+			if (pte_##flag(__ptep_get(_ptep++))) { \
+				orig_pte = pte_mk##flag(orig_pte); \
+				break; \
+			} \
+		} \
+	} while (0)
+
 pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
 {
 	/*
@@ -169,11 +181,17 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
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


