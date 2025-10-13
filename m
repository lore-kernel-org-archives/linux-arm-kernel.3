Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D43FCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 17:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lw3ulvozafIXPwveLlmk1PsP9EW50HJuWsahQSUCGD4=; b=zMCTTnHQLe2VK4
	qFavuZJlZwhHK+8n28QNPeubGhsiyYfayEF14pTSCaTBRxJW0aiXxLCy+AzIzKGBIHehiTfLoLVpz
	AL/fSStPyIREi9XL34oFY/RDv8e0QAL+X4w61AxLdjdpw+nIm3ceZzO6rG/3vmCWS9A25tcowkU0L
	wj00mAxGpjdr7NQKx5WMOajA5qGDK/N1Vz3E6a1WQw3Ute6I3fOC31FIGZzqBhFa4NpaEfCVvb83G
	IFz1BRta4gn6Rgn5vZzJpJ2KnIL1HfWF+VXhBKz7121ttrDjrbiTtVvBn6qVpcBHCDSPuhKN9bVXU
	XdYlpsDMWRWs82YcDFHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Ma3-0000000E4T3-0Eng;
	Mon, 13 Oct 2025 17:43:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8MZz-0000000E4SH-3lGp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 17:43:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22C38113E;
	Mon, 13 Oct 2025 10:43:17 -0700 (PDT)
Received: from e137867.cambridge.arm.com (e137867.arm.com [10.1.31.178])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7D12D3F66E;
	Mon, 13 Oct 2025 10:43:23 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: debug: always unmask interrupts in el0_softstp()
Date: Mon, 13 Oct 2025 18:43:17 +0100
Message-ID: <20251013174317.74791-1-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_104327_973458_7F041280 
X-CRM114-Status: GOOD (  11.75  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, stable@vger.kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

EL0 exception handlers should always call `exit_to_user_mode()` with
interrupts unmasked.
When handling a completed single-step, we skip the if block and
`local_daif_restore(DAIF_PROCCTX)` never gets called,
which ends up calling `exit_to_user_mode()` with interrupts masked.

This is broken if pNMI is in use, as `do_notify_resume()` will try
to enable interrupts, but `local_irq_enable()` will only change the PMR,
leaving interrupts masked via DAIF.

Move the call to `try_step_suspended_breakpoints()` outside of the check
so that interrupts can be unmasked even if we don't call the step handler.

Fixes: 0ac7584c08ce ("arm64: debug: split single stepping exception entry")
Cc: <stable@vger.kernel.org> # 6.17
Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
----
This was already broken in a similar fashion in kernels prior to v6.17,
as `local_daif_restore()` was called _after_ the debug handlers, with some
calling `send_user_sigtrap()` which would unmask interrupts via PMR
while leaving them masked by DAIF.
---
 arch/arm64/kernel/entry-common.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 2b0c5925502e..780cbcf12695 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -832,6 +832,7 @@ static void noinstr el0_breakpt(struct pt_regs *regs, unsigned long esr)
 
 static void noinstr el0_softstp(struct pt_regs *regs, unsigned long esr)
 {
+	bool step_done;
 	if (!is_ttbr0_addr(regs->pc))
 		arm64_apply_bp_hardening();
 
@@ -842,10 +843,11 @@ static void noinstr el0_softstp(struct pt_regs *regs, unsigned long esr)
 	 * If we are stepping a suspended breakpoint there's nothing more to do:
 	 * the single-step is complete.
 	 */
-	if (!try_step_suspended_breakpoints(regs)) {
-		local_daif_restore(DAIF_PROCCTX);
+	step_done = try_step_suspended_breakpoints(regs)
+	local_daif_restore(DAIF_PROCCTX);
+	if (!step_done)
 		do_el0_softstep(esr, regs);
-	}
+
 	exit_to_user_mode(regs);
 }
 

base-commit: 449d48b1b99fdaa076166e200132705ac2bee711
-- 
2.43.0


