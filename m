Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6966EC44507
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qdp//1e9Iy4wAq5+210miQNkEWlNveFTFW87G09ua08=; b=RXFi32ZN/slmGz0tc+AWO019Ye
	P7R6Znz4MoSHKeyCVqG/sPBG8EHS2p5jesG7EYdURAGLPvqmTo6+eNDTSsBB2BI9g5q5uut3N7B4/
	fkRsRWmId6PJXYbdQ9ug2odFvq21PqjXQjsn4g8BGRe2NfTyY+G7+CYLuQqk/EkxGgyhklKmOa2k7
	0NYFCa3Pjt+q7bptjVYe44vdEnv21Ok0a6YgM9MJyrEsdA2te3Y7ZlMEogEWwxIATfB6zHEhAFgeJ
	d/3IEv1nXCn6TYP3RSMAto8GuhfeiUmmwbz9NqKE4gNfKbWsb4b7SX+Y/1S+kW9F7A7X+iMysNT6o
	48iaZlzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnf7-00000002MgF-3KTn;
	Thu, 09 Jul 2026 12:15:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whneO-00000002L6S-0waw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:14:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CC663569;
	Thu,  9 Jul 2026 05:14:39 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B754A3F7B4;
	Thu,  9 Jul 2026 05:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783599283; bh=n3hrOfPHC0XzLILE26mS38U5iY3Ld8yHlVHKUa57SvE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VZiWuSHyqJZ3xRAJ7a8TYwgJpWnQBdDJ+ZAgXkqGGbhEyuyq6s+c81KTJEKDEVNTQ
	 tIRdYSby7RJdGI1sM7xknzoIPRpBdv9KuZLomJ8k/rIrUX0+B8cVVbFexpeKrf4EUe
	 6JLDRGJpx7X4YdWG2TCHHhwaMbsODvLOcpmtLC4A=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com
Subject: [RFC PATCH 34/36] arm64: kprobes: Disable NMIs
Date: Thu,  9 Jul 2026 13:13:31 +0100
Message-Id: <20260709121333.23507-35-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260709121333.23507-1-vladimir.murzin@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_051444_358020_C7C9F72D 
X-CRM114-Status: UNSURE (   9.97  )
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

Kprobes masks all DAIF exceptions to keep things simple and avoid
nested exceptions. With FEAT_NMI, that is no longer enough. Mask
ALLINT as well to ensure things stay simple.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/kernel/probes/kprobes.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
index d9d25d184309..defbe6061546 100644
--- a/arch/arm64/kernel/probes/kprobes.c
+++ b/arch/arm64/kernel/probes/kprobes.c
@@ -193,17 +193,27 @@ static void __kprobes set_current_kprobe(struct kprobe *p)
  * the kprobe state is per-CPU and doesn't get migrated.
  */
 static void __kprobes kprobes_save_local_irqflag(struct kprobe_ctlblk *kcb,
-						struct pt_regs *regs)
+						 struct pt_regs *regs)
 {
-	kcb->saved_irqflag = regs->pstate & DAIF_MASK;
-	regs->pstate |= DAIF_MASK;
+	arm64_exc_hwstate_t next = arm64_exc_hwstate_of_context(CRITICAL_CONTEXT);
+
+	kcb->saved_irqflag = arm64_inherit_exc_hwstate(regs).flags;
+
+	regs->pstate &= ~(DAIF_MASK | PSR_ALLINT_BIT);
+
+	regs->pstate |= next.daif;
+	regs->pstate |= next.allint;
 }
 
 static void __kprobes kprobes_restore_local_irqflag(struct kprobe_ctlblk *kcb,
-						struct pt_regs *regs)
+						    struct pt_regs *regs)
 {
-	regs->pstate &= ~DAIF_MASK;
-	regs->pstate |= kcb->saved_irqflag;
+	arm64_exc_hwstate_t prev = {.flags = kcb->saved_irqflag};
+
+	regs->pstate &= ~(DAIF_MASK | PSR_ALLINT_BIT);
+
+	regs->pstate |= prev.daif;
+	regs->pstate |= prev.allint;
 }
 
 static void __kprobes setup_singlestep(struct kprobe *p,
-- 
2.34.1


