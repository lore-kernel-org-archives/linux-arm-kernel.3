Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB9E1061B0A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 14:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v5aP3Ali1P/4ULjKFuZFTKzxU1og8DKRquRGo+Oh4lA=; b=ici3mmO0wps43oVImqK4Yhi4wX
	VYc5i2TsBc/GDh9nmUzrjkjfv7vEHT99zaYJ/fXiX7Nme4t4GYGWMYJ5JuqSBbpuZ47g/urW3PnOb
	rnYGVrM0EyYkVoknSQ03T23q884j5o+O+UhusP38S1AFXu33aAUzvPzyGjWveXSWxu2TsPtBpbUEq
	2JkYwK0RRxfPavBcQr1OlIsBL94Lzk+ozbtPmyX4idOj2zYSGh+hBaxvE460EL39vDOb0n18OA22p
	Q5un3tXm8v5Ze/HubcilHK+wNYjYCljYlfX0aY5KFyuQeWQL8o9pZFNOzH9r8BrLGe5ycvu/9AYNO
	uNW3xFMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7DwR-0000000BTj1-0Wrb;
	Mon, 30 Mar 2026 14:50:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Dw4-0000000BTOe-1jok
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 14:49:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C2C6560126;
	Mon, 30 Mar 2026 14:49:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9F95C2BCB1;
	Mon, 30 Mar 2026 14:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774882187;
	bh=pg3rhx9t9Whm8ZmzowMLSfZvJMvUSy26V3uyjJDEPQw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qwkDD/YFDJGH2KYyWBshJD7Wy8LT6BNcQ1ghcqZJcJwOKWxNl4fXBOPXCes+H2rp2
	 hr+x8HZ7FPOdiRVV74JH+8sk7UIl6uqcd8wAVTb7LLljaocti/ty84SrDgIOSlZmmW
	 +XVfqQJUAMlWLq+hvqd856U9FkqYiySMKVvjA314qFWkbqGtctbEkGMJXlkV1wcZo7
	 boKgl8swBwgWKG+8WK9lJjHr/rncu31fwKW0wDEqOzfEjkSTHa1k05j+hDeeDVRwkc
	 UxRpEnR9VpTFoFfkInwXgRUlXfvBEl/KH7qZz92eU7j8UWZE3mLHOWXLYbjn7ucZP4
	 jxGINYuVWlwbA==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v5 17/38] KVM: arm64: Factor out pKVM host exception injection logic
Date: Mon, 30 Mar 2026 15:48:18 +0100
Message-ID: <20260330144841.26181-18-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330144841.26181-1-will@kernel.org>
References: <20260330144841.26181-1-will@kernel.org>
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

inject_undef64() open-codes the logic to inject an exception into the
pKVM host. In preparation for reusing this logic to inject a data abort
on an unhandled stage-2 fault from the host, factor out the meat and
potatoes of the function into a new inject_host_exception() function
which takes the ESR as a parameter.

Cc: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
Tested-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 49 ++++++++++++++----------------
 1 file changed, 23 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 7294c94f9296..adfc0bc15398 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -705,43 +705,40 @@ static void handle_host_smc(struct kvm_cpu_context *host_ctxt)
 	kvm_skip_host_instr();
 }
 
-/*
- * Inject an Undefined Instruction exception into the host.
- *
- * This is open-coded to allow control over PSTATE construction without
- * complicating the generic exception entry helpers.
- */
-static void inject_undef64(void)
+static void inject_host_exception(u64 esr)
 {
-	u64 spsr_mask, vbar, sctlr, old_spsr, new_spsr, esr, offset;
+	u64 sctlr, spsr_el1, spsr_el2, exc_offset = except_type_sync;
+	const u64 spsr_mask = PSR_N_BIT | PSR_Z_BIT | PSR_C_BIT |
+			      PSR_V_BIT | PSR_DIT_BIT | PSR_PAN_BIT;
 
-	spsr_mask = PSR_N_BIT | PSR_Z_BIT | PSR_C_BIT | PSR_V_BIT | PSR_DIT_BIT | PSR_PAN_BIT;
+	exc_offset += CURRENT_EL_SP_ELx_VECTOR;
+
+	spsr_el1 = spsr_el2 = read_sysreg_el2(SYS_SPSR);
+	spsr_el2 &= spsr_mask;
+	spsr_el2 |= PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT |
+		    PSR_MODE_EL1h;
 
-	vbar = read_sysreg_el1(SYS_VBAR);
 	sctlr = read_sysreg_el1(SYS_SCTLR);
-	old_spsr = read_sysreg_el2(SYS_SPSR);
-
-	new_spsr = old_spsr & spsr_mask;
-	new_spsr |= PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT;
-	new_spsr |= PSR_MODE_EL1h;
-
 	if (!(sctlr & SCTLR_EL1_SPAN))
-		new_spsr |= PSR_PAN_BIT;
+		spsr_el2 |= PSR_PAN_BIT;
 
 	if (sctlr & SCTLR_ELx_DSSBS)
-		new_spsr |= PSR_SSBS_BIT;
+		spsr_el2 |= PSR_SSBS_BIT;
 
 	if (system_supports_mte())
-		new_spsr |= PSR_TCO_BIT;
-
-	esr = (ESR_ELx_EC_UNKNOWN << ESR_ELx_EC_SHIFT) | ESR_ELx_IL;
-	offset = CURRENT_EL_SP_ELx_VECTOR + except_type_sync;
+		spsr_el2 |= PSR_TCO_BIT;
 
 	write_sysreg_el1(esr, SYS_ESR);
 	write_sysreg_el1(read_sysreg_el2(SYS_ELR), SYS_ELR);
-	write_sysreg_el1(old_spsr, SYS_SPSR);
-	write_sysreg_el2(vbar + offset, SYS_ELR);
-	write_sysreg_el2(new_spsr, SYS_SPSR);
+	write_sysreg_el1(spsr_el1, SYS_SPSR);
+	write_sysreg_el2(read_sysreg_el1(SYS_VBAR) + exc_offset, SYS_ELR);
+	write_sysreg_el2(spsr_el2, SYS_SPSR);
+}
+
+static void inject_host_undef64(void)
+{
+	inject_host_exception((ESR_ELx_EC_UNKNOWN << ESR_ELx_EC_SHIFT) |
+			       ESR_ELx_IL);
 }
 
 static bool handle_host_mte(u64 esr)
@@ -764,7 +761,7 @@ static bool handle_host_mte(u64 esr)
 		return false;
 	}
 
-	inject_undef64();
+	inject_host_undef64();
 	return true;
 }
 
-- 
2.53.0.1018.g2bb0e51243-goog


