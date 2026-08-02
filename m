Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A297C55179
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 07:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBvTUsFpbqARD87S9WXjNTJXkVqbnPLRNoKntz2t7gk=; b=x6KqQzX91zbQ3BkjD0ToF2Yti6
	/4Xv5VCN2Z0H0JxmU+F0PJcmOFZdA1UEHuO/iakBJw3Jn0CH0pS63yE4NGF0pRG3dXsB6aDiYN4bA
	p6aBX3PsCD7J9r8QL0T5gKtq9HpvNHKnCDnONbe2UTpsKDNxz3C7jysxESXF3mSwg73BuclWw9vdc
	2OTGhzrcj63yvp9obrvHmcETx+9DhGG//lvWFcDCE3GJkuiggxO9n76R3q7EBb1ez+SVHhei9YQlW
	oGM3jXCnX6sCRlOJCPL9t8pteqiDH22G4lQUfFI4K3A0f1xlJphYp7C1v5RPkEzFyTYV9jH1EbR+E
	wuAiPMpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqQoK-0000000FSQm-3PTr;
	Sun, 02 Aug 2026 07:40:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqQoJ-0000000FSQP-2RpF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 07:40:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8285860DD1;
	Sun,  2 Aug 2026 07:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10831F00AC4;
	Sun,  2 Aug 2026 07:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785656438;
	bh=FBvTUsFpbqARD87S9WXjNTJXkVqbnPLRNoKntz2t7gk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M/4JPm5SGHOpNVts3WgVJP+6dIsG7yGugTjEgp26b2GYXzDF7dRr0o/BshxyGXjBG
	 A6ivFWO18gSqdfGjn4Q7OOrf3tVuIn5v4wISp4ia268p77o4TLkMKIcbQ363UBls2Q
	 HVsMwTyNv6byf2x6G65s86CdCUwBv3ShZtJ3scrvPSJUK8A0p47YbGrVKA5NGWWX8+
	 t2eyXR2uc3wykAoBD5g4hAeGe13u32Pt4h/+2sf4QCnuRb+dlPcqDZpdDTt2ZSvxBz
	 wER5xw3zBBqPZ4mWv4Ml8+Os0+SUVuxKiOvnuT0PkJLdls7ddnrCY/xUD9pFflemFl
	 YZ5q5Sz53ZaUA==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	surenb@google.com,
	liam@infradead.org,
	ljs@kernel.org,
	vbabka@kernel.org,
	shakeel.butt@linux.dev,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	zhanghongru@xiaomi.com,
	willy@infradead.org,
	zhangbo56@xiaomi.com,
	"Barry Song (Xiaomi)" <baohua@kernel.org>
Subject: [RFC PATCH v1 2/2] arm64/mm: use VMA lock for kernel faults on user addresses
Date: Sun,  2 Aug 2026 15:40:18 +0800
Message-Id: <20260802074018.73887-3-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260802074018.73887-1-baohua@kernel.org>
References: <20260802074018.73887-1-baohua@kernel.org>
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

Use the VMA lock for kernel faults on user addresses. This also
makes the existing code below meaningful:

/* Quick path to respond to signals */
if (fault_signal_pending(fault, regs)) {
	if (!user_mode(regs))
		goto no_context;
	return 0;
}

Right now, the code above is dead because !user_mode always
takes the mmap_lock path.

Co-developed-by: Bo Zhang <zhangbo56@xiaomi.com>
Signed-off-by: Bo Zhang <zhangbo56@xiaomi.com>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 arch/arm64/mm/fault.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 85e23388f9bb..241f1ab07ab3 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -607,6 +607,7 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 	unsigned int mm_flags = FAULT_FLAG_DEFAULT;
 	unsigned long addr = untagged_addr(far);
 	struct vm_area_struct *vma;
+	bool uaccess = false;
 	int si_code;
 	int pkey = -1;
 
@@ -663,6 +664,7 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 		if (!insn_may_access_user(regs->pc, esr))
 			die_kernel_fault("access to user memory outside uaccess routines",
 					 addr, esr, regs);
+		uaccess = true;
 	}
 
 	if (is_pkvm_stage2_abort(esr)) {
@@ -674,7 +676,7 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 
 	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, addr);
 
-	if (!(mm_flags & FAULT_FLAG_USER))
+	if (!(mm_flags & FAULT_FLAG_USER) && !uaccess)
 		goto lock_mmap;
 
 	vma = lock_vma_under_rcu(mm, addr);
-- 
2.39.3 (Apple Git-146)


