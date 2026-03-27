Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0139A10ED67E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v5aP3Ali1P/4ULjKFuZFTKzxU1og8DKRquRGo+Oh4lA=; b=qZGiGGO3xanN+UOgP389fk+tmD
	W8ey5EEbCKeKRftlxogi1lVarW5g09Z3/XYw4rZwUdTEz7YzVAUP0FqaeRiAyi7xZ+oEZe0hA+9Zq
	is4E0vIzIksbdn61+WAxyK17myxNQ+WDhD4QDHdSvyb7+OmfgaD84890jLDWv1mrICXvJVmdH6bmY
	pnWI6bZPXvUbDn+wXyMc7soQ/QtdSmvMHAY0yK+nBSvWmpqQzH1xlv3/uECGYhV1nqTJwn/1NesRb
	6jZrAsF52kFIc66nqZW2ZEZJvi7PqWBoh5ASajKP0OcGf5AKTBuhGGXwcEjcgnmCfTcTCHAJi8WMs
	zHANhWWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67lX-00000007WUz-345m;
	Fri, 27 Mar 2026 14:02:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67kx-00000007W2C-2mj0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 14:01:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 342CA418A0;
	Fri, 27 Mar 2026 14:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4890BC2BCB1;
	Fri, 27 Mar 2026 14:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774620107;
	bh=pg3rhx9t9Whm8ZmzowMLSfZvJMvUSy26V3uyjJDEPQw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eM3PRzrLKPVwmLywO2Qutwub1rbC0kaD+37VmBdVzF3T3b9tJQGhAebNWeXvD1pgb
	 8h59PgYkybDo6wdlHlHliE3xQiqYHhuJ93JzZIs1uU3/0uBbJa+91hTiXs4tOQlpdR
	 8e/ZcWafk/l3E/gdatYb3nycxGXr5Xte4WNN+CwQKhqPkInkwEQnI188lrgXSpDfhj
	 Nu2IwlHSl7/+jNL4f3xUPO1GfXIDAct3uP3QvPVI2NjzJAeOK8h+KK5kws1tASQCuC
	 xEx9ruzUjKLwA+H1ZFPXq+x9nYX8uxsFXTByVM+CX8pH39xLt+kz08ZjCxPt1OF1c+
	 DAep3cCpji0Lw==
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
Subject: [PATCH v4 17/38] KVM: arm64: Factor out pKVM host exception injection logic
Date: Fri, 27 Mar 2026 14:00:16 +0000
Message-ID: <20260327140039.21228-18-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327140039.21228-1-will@kernel.org>
References: <20260327140039.21228-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_070149_959759_C89B8590 
X-CRM114-Status: GOOD (  11.69  )
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


