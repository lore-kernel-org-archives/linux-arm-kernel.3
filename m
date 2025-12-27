Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908ABE8FDC2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 07:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=/rkTIxiElWI5s27YLFLws3t5rr63qHfD9Gj0Tb/uj9k=; b=mAdi4p+bw3uo80hyD+OvygXfQa
	tBi5owCkzlUqUxpPWvytQnCTrzvtz3/kq4z8s6TAuG8MgDoVosALL6G8QucpffN+YnHA3ew8a8oLs
	G+b12rAZ3xZ8k1/eHbGXjRQbZO8KfdlKI/ersbXlgjEFzMx3NWiYGpKVlhYVY6JRO0MfpMV2zLmcp
	q/HZjplJA/3lNGlhSM9uhsVgwNZofPkW+OOqp4cUjXtN0yBlKlpuRyJ/mm5RZ6UyxLgnz1d+xwIfA
	2MplbGLsGd4ohlYrv39yKeMfIDmkMdd8GLi2v0OjcSq7zxPwPMIXhGm8UPDDFvXADmj7t38ToBJdE
	4ap9Cdwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZOO3-00000001lmr-2lOO;
	Sat, 27 Dec 2025 07:06:51 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZONy-00000001llq-2brv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 07:06:50 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20251227070634epoutp03a1a28864e91958302ec80866488d8736~FALI50VOZ1702817028epoutp03g
	for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Dec 2025 07:06:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20251227070634epoutp03a1a28864e91958302ec80866488d8736~FALI50VOZ1702817028epoutp03g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1766819194;
	bh=/rkTIxiElWI5s27YLFLws3t5rr63qHfD9Gj0Tb/uj9k=;
	h=From:To:Cc:Subject:Date:References:From;
	b=alypQ+U/ywIa88QXPZc/fxzkBTEc8t9mkOHbuKK2F54Q89SormZbjfBGzeuht93s0
	 gr1DZ7WtWxonOvD9S0HVI/0zWNq4z8ZFzyVnNb1ah8I1Yr5MTMt+ta/8kK4iDV5BXk
	 JQeIBSg3rspOs/xDh0TVGWDRHIyDcYPLUsOkb7I0=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTPS id
	20251227070633epcas1p26607d24b08ae7a000ab202e69330c15b~FALIloIss1811818118epcas1p2z;
	Sat, 27 Dec 2025 07:06:33 +0000 (GMT)
Received: from epcas1p4.samsung.com (unknown [182.195.38.114]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ddYS969g5z3hhT4; Sat, 27 Dec
	2025 07:06:33 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
	20251227070633epcas1p3a8f7c19c9f5114a46765073fa16ba449~FALHxTE3y0494004940epcas1p3w;
	Sat, 27 Dec 2025 07:06:33 +0000 (GMT)
Received: from U20PB1-0362.tn.corp.samsungelectronics.net (unknown
	[10.91.131.200]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251227070632epsmtip17f6ceccf1fb97cee4a0c484ee9ea9231~FALHtFAif1002810028epsmtip1X;
	Sat, 27 Dec 2025 07:06:32 +0000 (GMT)
From: Seongsu Park <sgsu.park@samsung.com>
To: catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Seongsu Park <sgsu.park@samsung.com>
Subject: [PATCH] arm64: Fix PIE_E1 mapping for _PAGE_READONLY_EXEC
Date: Sat, 27 Dec 2025 16:06:25 +0900
Message-Id: <20251227070625.217349-1-sgsu.park@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251227070633epcas1p3a8f7c19c9f5114a46765073fa16ba449
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-711,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251227070633epcas1p3a8f7c19c9f5114a46765073fa16ba449
References: <CGME20251227070633epcas1p3a8f7c19c9f5114a46765073fa16ba449@epcas1p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_230648_747705_7369B2ED 
X-CRM114-Status: GOOD (  11.88  )
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

_PAGE_READONLY_EXEC should map to PIE_RX instead of PIE_R in PIE_E1

Signed-off-by: Seongsu Park <sgsu.park@samsung.com>
---
 arch/arm64/include/asm/pgtable-prot.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
index 161e8660eddd..ca14f61dee81 100644
--- a/arch/arm64/include/asm/pgtable-prot.h
+++ b/arch/arm64/include/asm/pgtable-prot.h
@@ -180,7 +180,7 @@ static inline bool __pure lpa2_is_enabled(void)
 	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_GCS),           PIE_NONE_O) | \
 	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_GCS_RO),        PIE_NONE_O) | \
 	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_EXECONLY),      PIE_NONE_O) | \
-	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_READONLY_EXEC), PIE_R)      | \
+	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_READONLY_EXEC), PIE_RX)     | \
 	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_SHARED_EXEC),   PIE_RW)     | \
 	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_READONLY),      PIE_R)      | \
 	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_SHARED),        PIE_RW)     | \
-- 
2.25.1


