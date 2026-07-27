Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE6BC54F4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1J4RQ8jQ4A1dNaBnGYTj0jgtAL5HIAlW1wdLLBiDV5g=; b=D1SWdg8nvVB9ZdCwA8/m+RN0ym
	uiY4JE4NmB8GsbnV0QCxQ6IqI7QKavwz2sLW1m8ihyrG2PiG/jwJj3mcYgmdu1TZB95clKrN20sei
	C7oi4bCPVO/+B/FoW+2llQvOQvu5nDBZSWGhCjwmxG0MOl3Z/3IDAMgYDbTZsme6W+madnmUN4bH/
	yijgZ5TxU4Udq/Xl9RJp/3M/mb3nz7wfL1opQQkfbriQxwGj4g2JfKWDRGc+jaFyerTFy7m107S/N
	7ahxVLhk5pT4tscj/9ct1SlMXk9qUYeq77XQ7CvDsz1BmjTYy3r/7SapAICFVntR9HpjagFQfEn4W
	j4X9jQQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOKq-00000003OOX-0hgr;
	Mon, 27 Jul 2026 16:37:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOJC-00000003NHX-3LuW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:36:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 472D8176C;
	Mon, 27 Jul 2026 09:36:02 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6B3B63F86F;
	Mon, 27 Jul 2026 09:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785170166; bh=Ms06R7yJ1+oSY2cSjh+B+ieF4OMT2xGX3kRdg0JwZyM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cka7Km0Fe9EbAxB1BdwvsQueMQpbXBRaoUNykj+MgnG0C9xhiF31jCIIx8ILZ+rMb
	 vO9+1YD5kTY1yyqYt4BPDP16U6auT1hqHEsysiM3bi6fcqy5Ps2wlYOudTySV/vqRk
	 0H/CpFzr50xN1me0hOUNnGFU7VN8MGnresw+ZYqI=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [RFC PATCH v2 37/45] arm64: kprobes: Disable NMIs
Date: Mon, 27 Jul 2026 17:34:45 +0100
Message-Id: <20260727163453.7969-38-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260727163453.7969-1-vladimir.murzin@arm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_093607_235295_36CEC28E 
X-CRM114-Status: GOOD (  10.45  )
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
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/probes/kprobes.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
index 68f4271ce02f..ac14022ff4aa 100644
--- a/arch/arm64/kernel/probes/kprobes.c
+++ b/arch/arm64/kernel/probes/kprobes.c
@@ -208,17 +208,27 @@ static void __kprobes set_current_kprobe(struct kprobe *p)
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


