Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63ED9CD8C8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 07:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pY3Syi9J71kcCpYa/qDSw//aIWzv401LmWCaxGFOX9I=; b=TGmOOvv5kXub31EWR3NVMdBoQk
	7zRDFgXJmto7nPlU177ufGPTGjX+HIg7rPgZagjhd/8vUUzeMP8Bwvrz7+XdDtHeckOjtBXn4eryP
	GKOwtzhEC0XNueWGjMPtOEsjo13YBMWn8HHQtqKlmG3YKE08MjCl6+sYv/aL9MpYjVU8i7lR5lbjI
	BcS7xbl2bWbdILevmR7U+8+BOr3AIbPR+onKxaV5a3Oa/FBWDJ5v+bFf26OM3t4tY3l2S5nX6I4cw
	2Rzs8D4SzU7rQpkGyhRPWLSI6scKpge2cUy8scNXtcft1B7mZudPZa+jzF9/AahQ/ZTB6uboxL/Xq
	yDM6PifA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW8Q1-000000026i6-24Nw;
	Sun, 07 Jun 2026 07:59:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW8Pz-000000026hx-2u0n
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 07:59:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 76F4C60008;
	Sun,  7 Jun 2026 07:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B795E1F00893;
	Sun,  7 Jun 2026 07:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780819177;
	bh=pY3Syi9J71kcCpYa/qDSw//aIWzv401LmWCaxGFOX9I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=WcNguZiAzEWDEiH6QF9WQwB9orcSb7cwktW/oFZ6a9Om5GynxANuGWzBpCaQ6qYeY
	 PIWx+wgsTgIKl16Y9WwYkW8A275bQ1+k8RmayN3INi2ACrqoUVRM4OFv7QLBl+XF4A
	 vPuOOLoJjVds2WtqNYHRBjx4j/GNtN3UaNZLul2ATHmilucG2njfuTzVDEZsikgjES
	 Nf73jqA49B7A2rNdFIVx3OOIKevWDllJO3anpTyCTmsNfbWX2L1IwuDC/Xn74EGSLQ
	 Sjw4jW+WSIP3b75W4/dPrxVe7jVlY2QVA4rakQDeFQ5Xy5g7cQUJfh60k7rOWpO511
	 FetRX9bgJHlrg==
Date: Sat, 06 Jun 2026 21:59:36 -1000
Message-ID: <088f52fd25860ca961449d53f91b214a@kernel.org>
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
Subject: [PATCH bpf-next] arm64: mm: Complete the PTE store in ptep_try_set()
In-Reply-To: <aiRFcz78QTZdIHHB@arm.com>
References: <20260601183728.1800490-1-tj@kernel.org>
	<f45f02410d23c99d14f3577da9b27a327816b5a0904bdeefc8e229eac760d1cf@mail.kernel.org>
	<8f133924fbf8d259340f3057e505f663@kernel.org>
	<aiRFcz78QTZdIHHB@arm.com>
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

ptep_try_set() installs the new entry with try_cmpxchg() but, unlike
__set_pte(), never calls __set_pte_complete(). On arm64, installing a valid
kernel PTE requires barriers afterward so a subsequent access observes it.
Without them the access can fault instead of reaching the freshly installed
page.

Call __set_pte_complete() after a successful cmpxchg, mirroring
__set_pte().

Fixes: 258df8fce42f ("mm: Add ptep_try_set() for lockless empty-slot installs")
Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Link: https://lore.kernel.org/all/aiRFcz78QTZdIHHB@arm.com/
Signed-off-by: Tejun Heo <tj@kernel.org>
---
 arch/arm64/include/asm/pgtable.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 3ce0f2a6cab6..dc8525431273 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1838,7 +1838,11 @@ static inline bool ptep_try_set(pte_t *ptep, pte_t new_pte)
 {
 	pteval_t old = 0;
 
-	return try_cmpxchg(&pte_val(*ptep), &old, pte_val(new_pte));
+	if (!try_cmpxchg(&pte_val(*ptep), &old, pte_val(new_pte)))
+		return false;
+
+	__set_pte_complete(new_pte);
+	return true;
 }
 #define ptep_try_set ptep_try_set
 
-- 
2.51.1


