Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91E8EC1116
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 17:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXu+atARh1ug5LPt8wIsVfdgFUoA6pk7Mi59qq03Un0=; b=zPR+s7ObVWCu7pcMyu8b02j2AV
	LTJLX6Zp2CQvuKBo21xohH+Zhrh9UOO552q4sNaZVU7/R1XRwPBy5PQKDB/VUeIntjVN2noETWUs2
	n2N0+hSMicOt0qp1s6rNBrTOdTR+lmYv52PNl3EQ1SIr5+U6eoQq+8b/JfghsEPfim/9UPQHb7U58
	WhWE8N9AisjJoM21a63SmiXvw4qXI6OblIAXiNa3OzSxjMh8Zrge8OKbfeDxH5Sdmoa3nSTKMc51j
	EaOkBBPFGHc6yjYG5Bd3oh9e0yiwKMhMoQSeZ7Fzd/0ZUa5IeMxVSqcUrgJeOULrvYHcFwq9Y+kS3
	UtutZz4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vua09-00000000oMZ-3dJW;
	Mon, 23 Feb 2026 17:45:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vua07-00000000oL1-1SUq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 17:45:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B83D060145;
	Mon, 23 Feb 2026 17:45:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA89BC116C6;
	Mon, 23 Feb 2026 17:45:40 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>,
	Will Deacon <will@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Emanuele Rocca <emanuele.rocca@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 2/3] arm64: gcs: Honour mprotect(PROT_NONE) on shadow stack mappings
Date: Mon, 23 Feb 2026 17:45:31 +0000
Message-ID: <20260223174533.1478164-3-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223174533.1478164-1-catalin.marinas@arm.com>
References: <20260223174533.1478164-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

vm_get_page_prot() short-circuits the protection_map[] lookup for a
VM_SHADOW_STACK mapping since it uses a different PIE index from the
typical read/write/exec permissions. However, the side effect is that it
also ignores mprotect(PROT_NONE) by creating an accessible PTE.

Special-case the !(vm_flags & VM_ACCESS_FLAGS) flags to use the
protection_map[VM_NONE] permissions instead. No GCS attributes are
required for an inaccessible PTE.

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Fixes: 6497b66ba694 ("arm64/mm: Map pages for guarded control stack")
Cc: <stable@vger.kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: David Hildenbrand <david@kernel.org>
---
 arch/arm64/mm/mmap.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmap.c b/arch/arm64/mm/mmap.c
index 75f343009b4b..92b2f5097a96 100644
--- a/arch/arm64/mm/mmap.c
+++ b/arch/arm64/mm/mmap.c
@@ -91,7 +91,11 @@ pgprot_t vm_get_page_prot(vm_flags_t vm_flags)
 
 	/* Short circuit GCS to avoid bloating the table. */
 	if (system_supports_gcs() && (vm_flags & VM_SHADOW_STACK)) {
-		prot = gcs_page_prot;
+		/* Honour mprotect(PROT_NONE) on shadow stack mappings */
+		if (vm_flags & VM_ACCESS_FLAGS)
+			prot = gcs_page_prot;
+		else
+			prot = pgprot_val(protection_map[VM_NONE]);
 	} else {
 		prot = pgprot_val(protection_map[vm_flags &
 				   (VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]);

