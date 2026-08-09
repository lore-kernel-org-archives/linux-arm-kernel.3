Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E19C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 21:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U54iBc5U8WWYJkiiO/xs08z3ruV1SM6Nmun6JHAzDSE=; b=cn+PtYhFBx8xDcVPf1+Lm1JHW+
	oIHHkMBiFB/aoWtms2uojnjiicgXtRDWYKFh51R2l9d1T96w1OUBTX/HZgch8xVdmEQaZv6FPqudz
	/iTW/mWn1zQkv1KxtzpCbn2wDT8sx5BIbL9zzEvijW16KXwaNKU1AMCpy0F6twb2OvjBnOArPkNIV
	ZRCnfyLUkysGhX1N1eL8Qp0PliqnGZ++i02psUCiCJPklUpJ/Y7oe+A00j7Dc0PyYpdtgFh39MTL4
	RORr5oESiKeIvBVn/paKaUKhiXwkMXah/a5mcUlbCwhyyuYuHdOVAGjGZ2YMd48XN+DFVeNVx5eXp
	vWU46xHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtBC4-0000000AlhO-0G85;
	Sun, 09 Aug 2026 21:36:32 +0000
Received: from devianza.investici.org ([198.167.222.108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtBC0-0000000Alfz-3RV7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 21:36:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1786311375;
	bh=U54iBc5U8WWYJkiiO/xs08z3ruV1SM6Nmun6JHAzDSE=;
	h=From:To:Cc:Subject:Date:From;
	b=kl2gDOH7X/PtQp6hyyX1hELB05zpwwLobktlFIXyzeR6fVzhcgm2u96us5XNHIIjC
	 Dy+bY/gfMuZWGEF+ZwXC4tQ7Cem60AyBKvNHQruBUAc1TeZkKBOr/C+sF9F+Pe05bl
	 2sdhxsISEPtL34JQ/XcpDhZmywoW2L90Py3aWqvQ=
Received: from mx2.investici.org (unknown [127.0.0.1])
	by devianza.investici.org (Postfix) with UTF8SMTP id 4hJB5q3wdQz6vNp;
	Sun, 09 Aug 2026 21:36:15 +0000 (UTC)
Received: by mx2.investici.org (Postfix) id 4hJB5q1cVZz4y43;
	Sun, 09 Aug 2026 21:36:15 +0000 (UTC)
From: Bradley Morgan <include@grrlz.net>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	include@grrlz.net
Subject: [PATCH] arm64: hibernate: pass HVC_SET_VECTORS args to the resume hvc
Date: Sun,  9 Aug 2026 21:36:15 +0000
Message-ID: <20260809213615.11646-1-include@grrlz.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_143629_297029_72EBCA5B 
X-CRM114-Status: GOOD (  11.47  )
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

swsusp_arch_suspend_exit() reinstalls the restored kernel's hyp stub
vectors with an hvc, but never passes the arguments. x0 is not set to
HVC_SET_VECTORS and x1 is not set to the vector address, so the stub
dispatch falls through and returns without writing vbar_el2. EL2 is
left pointing at the trans_pgd copy of the vectors, a page that
swsusp_free() releases right after resume.

Set the arguments up the same way __hyp_set_vectors() does.

Fixes: 788bfdd97434 ("arm64: trans_pgd: hibernate: Add trans_pgd_copy_el2_vectors")
Cc: stable@vger.kernel.org
Signed-off-by: Bradley Morgan <include@grrlz.net>
---
 arch/arm64/kernel/hibernate-asm.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/hibernate-asm.S b/arch/arm64/kernel/hibernate-asm.S
index 0e1d9c3c6a93..2baefe7a82d3 100644
--- a/arch/arm64/kernel/hibernate-asm.S
+++ b/arch/arm64/kernel/hibernate-asm.S
@@ -89,6 +89,8 @@ alternative_insn "dc cvau, x4",  "dc civac, x4",  ARM64_WORKAROUND_CLEAN_CACHE
 	isb
 
 	cbz	x24, 3f		/* Do we need to re-initialise EL2? */
+	mov	x1, x24
+	mov	x0, #HVC_SET_VECTORS
 	hvc	#0
 3:	ret
 SYM_CODE_END(swsusp_arch_suspend_exit)
-- 
2.47.3


