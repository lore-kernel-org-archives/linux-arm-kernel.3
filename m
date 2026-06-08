Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7850CD8C8E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 07:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KTBGi8oCZ29Roe5CgH69uQStkzIgyiOeC35FA5eeDPU=; b=IJCHXxtq1K3kAGkr2fa91u9RnC
	6zsg1zTn47jXSgx+YXR9LfttHMw0cm4ANEo8HYC7kotwcbghTBarvghv1J+/WGMWuff1cYVrLyUzg
	SjCbD3ghmotFO78UD1+CVjdfSLqPNU4BYV56GWF95wM5APCzZuLCvaDtJ5g6cFMJJwoiTsmr4BgvZ
	x16lVdolSCZnXWpPTQO7Ty/YoHamWpRQulMftDvH5tQhrHhsI9pAExvnxv3qN70+dVLgCdhqPSKxw
	1os0p+BXiIbs+jT0FModV55IHgRa3DW7r2xzxW7ASqcakxvjrUtSHIdnY1+maNPRrFkfA3R0DPG9N
	m8as05QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUMo-00000002ySu-0lkC;
	Mon, 08 Jun 2026 07:25:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWUMn-00000002ySo-0Q30
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 07:25:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C62A240715;
	Mon,  8 Jun 2026 07:25:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F141F00893;
	Mon,  8 Jun 2026 07:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780903548;
	bh=KTBGi8oCZ29Roe5CgH69uQStkzIgyiOeC35FA5eeDPU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=km2IxtHZIktwRU6635g8jlJprIRhl9fSIjqUyOj5lz8NlJoVU7udXLnh9gxiQHqfN
	 Ho8tP98QVDYT7e7M1vtNBaxY3ZqxywP7vPxCLlfSpM5R37nNY4LON6vctCRHBZ9rTJ
	 AOrOiBs+dZ7MEKnAO2NzHFmJsnmNM9zdqPbSrcKfbT8snI4b0mjjwpcfKftahXkR57
	 Amyr1wvgAcMN0xcrfpIud3JS0pAhGC71a0s36Az/truacRX9P6qr3vVc8dGSr6VpIG
	 ibS5OGgaRSMwuZ1n4j6e4QEzUSpG0Bs4StxI4B6M5tp9/dh5M/m70rDA3VfPBW66hF
	 KKSdU8i8BNyAQ==
Date: Sun, 07 Jun 2026 21:25:47 -1000
Message-ID: <7f5f7c94601312c1a401fb18998291cc@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>
Cc: David Hildenbrand <david@kernel.org>,
 Andrea Righi <arighi@nvidia.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Yonghong Song <yonghong.song@linux.dev>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 David Vernet <void@manifault.com>,
 Changwoo Min <changwoo@igalia.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org,
 bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 bpf-next] arm64: mm: Complete the PTE store in ptep_try_set()
In-Reply-To: <aiXVFK_qb54is8b1@arm.com>
References: <088f52fd25860ca961449d53f91b214a@kernel.org>
 <5f68f44310d4878185fd5ebc52d66530b99f174c6d04ab1170dc53cefaa54568@mail.kernel.org>
 <1780862659.ccb18e27e916dc4b@kernel.org>
 <aiXVFK_qb54is8b1@arm.com>
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

ptep_try_set() installs a kernel PTE with try_cmpxchg() but, unlike
__set_pte(), skips the barriers that arm64 requires after writing a valid
kernel PTE. Without them a subsequent access can fault instead of seeing
the new mapping.

Issue them with emit_pte_barriers() rather than __set_pte_complete().
ptep_try_set() must finish the store before it returns, but
__set_pte_complete() would defer the barriers when the calling context is in
lazy MMU mode.

v2: Emit the barriers directly instead of __set_pte_complete(). (Catalin)

Fixes: 258df8fce42f ("mm: Add ptep_try_set() for lockless empty-slot installs")
Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Link: https://lore.kernel.org/all/aiRFcz78QTZdIHHB@arm.com/
Signed-off-by: Tejun Heo <tj@kernel.org>
---
 arch/arm64/include/asm/pgtable.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 3ce0f2a6cab6..3e579c26b383 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1838,7 +1838,16 @@ static inline bool ptep_try_set(pte_t *ptep, pte_t new_pte)
 {
 	pteval_t old = 0;
 
-	return try_cmpxchg(&pte_val(*ptep), &old, pte_val(new_pte));
+	if (!try_cmpxchg(&pte_val(*ptep), &old, pte_val(new_pte)))
+		return false;
+
+	/*
+	 * The store must be complete by the time this returns, but the caller
+	 * may be in lazy MMU mode, where __set_pte_complete() would defer the
+	 * barriers. Issue them directly.
+	 */
+	emit_pte_barriers();
+	return true;
 }
 #define ptep_try_set ptep_try_set
 
-- 
2.51.1

