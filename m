Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED151061B0F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 15:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CMJz60T0d0Y1JC6B8GbMNeMQfr3VQWy8oZWRqInjHj8=; b=ORpHhSIEfeXfYQW3o7rS12EKM2
	Gkz6ODC9jv07pVvTENIfRdL7otZ0vna4gY6BEFhSWX20Q+R27TPZpADq5Zx9vHxHJgZnabO+DSgg4
	RjjEYeoxCvXleZsJhZOroCKm8KsCiX1qy5GfS1ijt3eBOiMOdHZaNaOKWz11Ag/XM54rJYlk9pl7r
	N/VWLNzrNkQMmQJ8bctYj1C2ohkOt5lWwyKpry2AHx5JyY05+l8+rSzQA4395dvvwdMgSMIk9Cvea
	iZr64VmvC2ZjwfGuEeXBya3iWxCDW9RqGt091BBR0GaZppQJ54GTGoSaGX8vgZUAabr2dHnlbUTak
	xJjY4Kzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7EYk-0000000BZk0-2Ocf;
	Mon, 30 Mar 2026 15:29:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7EYj-0000000BZjT-2RoA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 15:29:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ADC8E60054;
	Mon, 30 Mar 2026 15:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEDA7C19423;
	Mon, 30 Mar 2026 15:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774884584;
	bh=hhtJIBLdvdm+AIwtgCrXvY3R3zCBsqQURKRNTRro06o=;
	h=From:To:Cc:Subject:Date:From;
	b=hAo8uZSCVoeQLGlJrSBUGct8Wnpan13+1XCHRRzaL3ROguFpCbRA9BEdHWYvYTmtX
	 YFQMaxWhdXiM7L4XWrcG+1NwRNrK3Gwl5AFEMrZo+Iofonz0isGjFFbuM5oQUK/4Dw
	 lKhA+zWoJKOA/P2QPFKU0rIBUfgUpzB5SrXXASbOWUpJos9nT+6/yJG6rEQlD+bdU/
	 CV6NVXtJwJv+Md+dU8TqmxPTImdC0WUnB1gRsSAvx+Gpsg+9sCxRBE0NJ6tK+vLr2H
	 mB1iJp7qGzGZ3ST+JEz8mzycby4NuGRnSK2E3qOpd0Wh1KqeFbHWlSE9ucfRjjKUt6
	 AS3IK13/5E1oQ==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH] KVM: arm64: Don't populate TPIDR_EL2 in finalise_el2()
Date: Mon, 30 Mar 2026 16:29:26 +0100
Message-ID: <20260330152927.26300-1-will@kernel.org>
X-Mailer: git-send-email 2.47.3
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

When running with VHE, TPIDR_EL2 is only used for the percpu offset once
the ARM64_HAS_VIRT_HOST_EXTN capability has been detected, at which
point cpu_copy_el2regs() will populate its contents from TPIDR_EL1.

Remove the redundant initialisation of TPIDR_EL2 from finalise_el2().

Cc: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Will Deacon <will@kernel.org>
---

I spotted this by inspection as part of an ill-fated (abandoned) attempt
at repurposing tpidr_elx for something else.

 arch/arm64/kernel/hyp-stub.S | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/hyp-stub.S b/arch/arm64/kernel/hyp-stub.S
index 085bc9972f6b..8b8614c0b9a5 100644
--- a/arch/arm64/kernel/hyp-stub.S
+++ b/arch/arm64/kernel/hyp-stub.S
@@ -105,11 +105,9 @@ SYM_CODE_START_LOCAL(__finalise_el2)
 	msr_hcr_el2 x0
 	isb
 
-	// Use the EL1 allocated stack, per-cpu offset
+	// Use the EL1 allocated stack
 	mrs	x0, sp_el1
 	mov	sp, x0
-	mrs	x0, tpidr_el1
-	msr	tpidr_el2, x0
 
 	// FP configuration, vectors
 	mrs_s	x0, SYS_CPACR_EL12
-- 
2.53.0.1018.g2bb0e51243-goog


