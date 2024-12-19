Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9AAE7718A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 17:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iq3arFM81dJkmcJ/wujh/Ru1Cc9dpdw8Z/f/tcXiPQY=; b=or2Oy597mYII1yL95+dNRvhlJc
	vI6WjlySSYsx4KRTCmTqhiWop0wM6DStx6TDePauSHJtZimiulFVQ3yUkj5UNITrJeAwfrjZHJEva
	r24HHikL98fbwsQ6uKH4d07copYtNc10hFnfZcu90I2MHU4mtyuW2+AhiddO4sxnDyPy8MhwTzHpc
	Wtn55+yyFhyoWg5PinTTG1qmb03dCoLF3V5HEXew8orvL5H0bhcadC574XRYn2orLJgJ3RRVqdRyO
	Edf92+dc6G2CO/Bg7zUFkbwpYoOho+IzmERi90Q0v/QYM2ZrEn+TMdGAQZQfCwBpyWppiNr0xxmnQ
	Yw0UHTSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKb9-00000002c79-3jNV;
	Thu, 19 Dec 2024 17:46:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKPR-00000002ZoK-3cEy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 17:34:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 67071A42830;
	Thu, 19 Dec 2024 17:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93253C4CEDE;
	Thu, 19 Dec 2024 17:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734629640;
	bh=siL6dfIQSTwFlZRwIQq7hAZPgM/PT8qHUgyBN+dXrCU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pCKc5BakDI/dY5FVBP5Y84kGACH8gdhAvXCuzQY6nYe3c62prhgaheFfodD/GHie0
	 f6UsAkEsFvUuVQVz/Rn5RLqDXvNeRBPIfnF/1HN7mHyYQTHo15sKx9jlfP5HR2xiqx
	 C1g/uHYj0qBXPvU9wu+fcYHywev5CbAhacgMa7lF2ezTtc9i6J8aFUrD3Mp1mVZ9tA
	 G+TimxqZBZgKuQjBo35T0Ylo9OWDdMFwbJOFIKM/2uxMxbynzxGs4dIgMFKMhFVwSz
	 md15YE4yc15Hsga2JEdIBg76z7iMgFEycd75km8aGv1P3LhFEjBMoEBiojxKFaFnvQ
	 fUXotfVuabD/w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tOKPO-005Lao-JW;
	Thu, 19 Dec 2024 17:33:58 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 2/4] arm64/sysreg: Get rid of the TCR2_EL1x SysregFields
Date: Thu, 19 Dec 2024 17:33:48 +0000
Message-Id: <20241219173351.1123087-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241219173351.1123087-1-maz@kernel.org>
References: <20241219173351.1123087-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, joey.gouly@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_093402_030713_51638DA6 
X-CRM114-Status: GOOD (  14.08  )
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

TCR2_EL1x is a pretty bizarre construct, as it is shared between
TCR2_EL1 and TCR2_EL12. But the latter is obviously only an
accessor to the former.

In order to make things more consistent, upgrade TCR2_EL1x to
a full-blown sysreg definition for TCR2_EL1, and describe TCR2_EL12
as a mapping to TCR2_EL1.

This results in a couple of minor changes to the actual code.

Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 2 +-
 arch/arm64/kvm/at.c            | 6 +++---
 arch/arm64/mm/proc.S           | 5 +++--
 arch/arm64/tools/sysreg        | 8 ++------
 4 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6ce71f444ed84..7712df48758e9 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2376,7 +2376,7 @@ static void cpu_enable_mops(const struct arm64_cpu_capabilities *__unused)
 #ifdef CONFIG_ARM64_POE
 static void cpu_enable_poe(const struct arm64_cpu_capabilities *__unused)
 {
-	sysreg_clear_set(REG_TCR2_EL1, 0, TCR2_EL1x_E0POE);
+	sysreg_clear_set(REG_TCR2_EL1, 0, TCR2_EL1_E0POE);
 	sysreg_clear_set(CPACR_EL1, 0, CPACR_ELx_E0POE);
 }
 #endif
diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 3d7eb395e33dd..3a96c96816e93 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -111,7 +111,7 @@ static bool s1pie_enabled(struct kvm_vcpu *vcpu, enum trans_regime regime)
 		return vcpu_read_sys_reg(vcpu, TCR2_EL2) & TCR2_EL2_PIE;
 	case TR_EL10:
 		return  (__vcpu_sys_reg(vcpu, HCRX_EL2) & HCRX_EL2_TCR2En) &&
-			(__vcpu_sys_reg(vcpu, TCR2_EL1) & TCR2_EL1x_PIE);
+			(__vcpu_sys_reg(vcpu, TCR2_EL1) & TCR2_EL1_PIE);
 	default:
 		BUG();
 	}
@@ -140,8 +140,8 @@ static void compute_s1poe(struct kvm_vcpu *vcpu, struct s1_walk_info *wi)
 		}
 
 		val = __vcpu_sys_reg(vcpu, TCR2_EL1);
-		wi->poe = val & TCR2_EL1x_POE;
-		wi->e0poe = val & TCR2_EL1x_E0POE;
+		wi->poe = val & TCR2_EL1_POE;
+		wi->e0poe = val & TCR2_EL1_E0POE;
 	}
 }
 
diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index b8edc5765441e..fb30c8804f87b 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -501,7 +501,7 @@ alternative_else_nop_endif
 #ifdef CONFIG_ARM64_HAFT
 	cmp	x9, ID_AA64MMFR1_EL1_HAFDBS_HAFT
 	b.lt	1f
-	orr	tcr2, tcr2, TCR2_EL1x_HAFT
+	orr	tcr2, tcr2, TCR2_EL1_HAFT
 #endif /* CONFIG_ARM64_HAFT */
 1:
 #endif	/* CONFIG_ARM64_HW_AFDBM */
@@ -532,7 +532,8 @@ alternative_else_nop_endif
 #undef PTE_MAYBE_NG
 #undef PTE_MAYBE_SHARED
 
-	orr	tcr2, tcr2, TCR2_EL1x_PIE
+	orr	tcr2, tcr2, TCR2_EL1_PIE
+	msr	REG_TCR2_EL1, x0
 
 .Lskip_indirection:
 
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index da3f02cdf1052..64712e00787f9 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3000,7 +3000,7 @@ Sysreg	TTBR1_EL1	3	0	2	0	1
 Fields	TTBRx_EL1
 EndSysreg
 
-SysregFields	TCR2_EL1x
+Sysreg	TCR2_EL1	3	0	2	0	3
 Res0	63:16
 Field	15	DisCH1
 Field	14	DisCH0
@@ -3014,14 +3014,10 @@ Field	3	POE
 Field	2	E0POE
 Field	1	PIE
 Field	0	PnCH
-EndSysregFields
-
-Sysreg	TCR2_EL1	3	0	2	0	3
-Fields	TCR2_EL1x
 EndSysreg
 
 Sysreg	TCR2_EL12	3	5	2	0	3
-Fields	TCR2_EL1x
+Mapping	TCR2_EL1
 EndSysreg
 
 Sysreg	TCR2_EL2	3	4	2	0	3
-- 
2.39.2


