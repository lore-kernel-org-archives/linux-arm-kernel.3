Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02D0C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1J4RQ8jQ4A1dNaBnGYTj0jgtAL5HIAlW1wdLLBiDV5g=; b=QtFs+r9ENNPnz8tLtCl2oCOxED
	HR0MC686AreaG+Pz2OIfOg5Wvs3QNZxxsaD0VemJ/Tt6/lq3ewLDrwVdnRCwQfWaJNUBDidBiFDK7
	4WUMn6tGmfM9Dt+GYXbVZ6r7/0UBkudGSQmiUfZX00ENg7Crw5QfMsGcR2A0gceFmdcDHlLDk1CDF
	qBMo/rndreJo2l7TR3kIE1GYvkXV3IFirBiJ79Xwajxevly6ILeGCnccO+828DzYEYQKy+He36GaF
	LCC/sIzxC0ZQGGGUoKNKAgMdcMZrSWmg6s2JahEL0OJLWN6VhjDwgqnSdJN5/Ia11dE3SCQp4yS4Q
	yblMWUcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63pY-000000036Jf-2QxA;
	Mon, 14 Sep 2026 10:22:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63pB-000000035js-3RDE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:22:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAD6A1576;
	Mon, 14 Sep 2026 03:22:05 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5487B3F7B4;
	Mon, 14 Sep 2026 03:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789381329; bh=Ms06R7yJ1+oSY2cSjh+B+ieF4OMT2xGX3kRdg0JwZyM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bGIQgcGL8/JdTt7XsJjf0SFT6zbCiSWpgTJonPGsPuka9N1TzJ7/ZJDrplENTT/1U
	 48EShA2/Bynd0yWnj1wWQFK/FeKqYIfZ2wDMoAY/7p7roTZaFxgKtx+FSAIDiVMROM
	 Bi7caodNc7al6XzHHA7ShWzBVP8ezZRqqiJDv1pY=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [PATCH 29/38] arm64: kprobes: Disable NMIs
Date: Mon, 14 Sep 2026 11:20:53 +0100
Message-Id: <20260914102102.68597-30-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260914102102.68597-1-vladimir.murzin@arm.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_032209_924921_7B728C69 
X-CRM114-Status: GOOD (  10.32  )
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


