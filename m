Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E70C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zjfOfLvgVimGHsgCQ4xVz2q5aK7BXRC3KS7SUxHd85E=; b=xomWMeN+iGHHeQsf+O9Nkm9HpN
	6EY1FB+0CMvYTFiijnjLROj7hevr7uCnHTDQT7pjMK5of4orvSRk5DoFGBy4VQ1AKq2T/Q1wDEaYL
	hsWyHGUnGHcrfxGub3xP62hDIs/WlnVAbOP4/bSBVy+tM32vkYHriwa/kLiK1l0FCR9NtEDcg6Mfc
	OFQ/LHkbFS3xkkJg+p7aef5KPWVLZiR0sSbMIuoEpzE4Hwd0piuxP2fa3HcBG5HgJ4JS2MBP6sGe5
	tuzSMNRNO1rk3F8L4pLBaJtD90d20KJm9mio9MmluObg3lJLSYpT9R9ID6w3f4bwuJqaHO7YTmiyE
	1YqRMAdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQhD-0000000DXFz-2Ewn;
	Tue, 06 May 2025 22:23:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLP0-0000000CiLk-1YxB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:44:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 024BB5C5786;
	Tue,  6 May 2025 16:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB38CC4CEF2;
	Tue,  6 May 2025 16:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746549857;
	bh=1J0UUEGjyLshTxeVES279sPs7UWzaCpoTsW5ih0zPlo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N06qUZo6OOdwobnvepVtb8fp8DAF3zS0KBQwKhZ+zOULppoKqUQqFxNnbCSrnuita
	 0oK4WL06fgu5OTPjP2ayz28fJDi3doskXwaTeUoWsav8uGbtVWni7MLVTdQn2yYY3V
	 933o/DOP1BAgzf7i1uro3zKQ+pOsT+xgKYxICbNyTCkZyP2aEHOVbQEmohL+EmgAXF
	 CIGRm+sZtlb/flGA76Cknm1NJyJYEfZ2X+ZcU3pHnfQrtJ9Bd4HDhIftc4B50UKRxt
	 Yn+hU2WEjmJEnyRvL6ncBC96XhfowYtCOezua64MsGcZY2zPPDBThgUdzjv2kYf3/C
	 jcqgmh19VvWsA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uCLOy-00CJkN-5T;
	Tue, 06 May 2025 17:44:16 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH v4 43/43] KVM: arm64: Handle TSB CSYNC traps
Date: Tue,  6 May 2025 17:43:48 +0100
Message-Id: <20250506164348.346001-44-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250506164348.346001-1-maz@kernel.org>
References: <20250506164348.346001-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com, ben.horgan@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_094418_518661_808A96D3 
X-CRM114-Status: GOOD (  13.73  )
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

The architecture introduces a trap for TSB CSYNC that fits in
the same EC as LS64 and PSB CSYNC. Let's deal with it in a similar
way.

It's not that we expect this to be useful any time soon anyway.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/esr.h    | 3 ++-
 arch/arm64/kvm/emulate-nested.c | 1 +
 arch/arm64/kvm/handle_exit.c    | 5 +++++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
index ef5a14276ce15..6079e23608a23 100644
--- a/arch/arm64/include/asm/esr.h
+++ b/arch/arm64/include/asm/esr.h
@@ -182,10 +182,11 @@
 #define ESR_ELx_WFx_ISS_WFE	(UL(1) << 0)
 #define ESR_ELx_xVC_IMM_MASK	((UL(1) << 16) - 1)
 
-/* ISS definitions for LD64B/ST64B/PSBCSYNC instructions */
+/* ISS definitions for LD64B/ST64B/{T,P}SBCSYNC instructions */
 #define ESR_ELx_ISS_OTHER_ST64BV	(0)
 #define ESR_ELx_ISS_OTHER_ST64BV0	(1)
 #define ESR_ELx_ISS_OTHER_LDST64B	(2)
+#define ESR_ELx_ISS_OTHER_TSBCSYNC	(3)
 #define ESR_ELx_ISS_OTHER_PSBCSYNC	(4)
 
 #define DISR_EL1_IDS		(UL(1) << 24)
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 9b5a875ad2222..923c1edb7463d 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2044,6 +2044,7 @@ static const union trap_config non_0x18_fgt[] __initconst = {
 	FGT(HFGITR, SVC_EL1, 1),
 	FGT(HFGITR, SVC_EL0, 1),
 	FGT(HFGITR, ERET, 1),
+	FGT(HFGITR2, TSBCSYNC, 1),
 };
 
 static union trap_config get_trap_config(u32 sysreg)
diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index cc44ee56e512b..60507ad8b86f8 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -347,6 +347,11 @@ static int handle_other(struct kvm_vcpu *vcpu)
 		if (is_l2)
 			fwd = !(hcrx & HCRX_EL2_EnALS);
 		break;
+	case ESR_ELx_ISS_OTHER_TSBCSYNC:
+		allowed = kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceBuffer, TRBE_V1P1);
+		if (is_l2)
+			fwd = (__vcpu_sys_reg(vcpu, HFGITR2_EL2) & HFGITR2_EL2_TSBCSYNC);
+		break;
 	case ESR_ELx_ISS_OTHER_PSBCSYNC:
 		allowed = kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSVer, V1P5);
 		if (is_l2)
-- 
2.39.2


