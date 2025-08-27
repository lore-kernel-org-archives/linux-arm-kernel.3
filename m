Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB129CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 19:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rd9UwLb5cZ+kVWeFJFEFksnb4kjrrzsyAPWz4UBapRQ=; b=v3Vzzd+AupY6v/2B/KdnJnBh2H
	8WRVG/2oubUlEqrbZpmQhq7MvrfgJatlBT7wChkFxvf9kojkR6YnJf4ildcVgn2tLlqpcUB29juG5
	HaJz67zHhp2hXaGERv/zm3ZoVEtoTEz6kasAa9raLY3nEiV/n9gO4bb4iie7TLU4e15/ELAEE27+c
	gdJPFWZasRfnoKAF3K33bqWGro7jvoPebCM9fT3nSK3uwvvlKczj4TNDXMlmqj4qaPlfOTpvA4X2S
	ABRRVB7J0y5xn9AHNj5QQRWPrQBz0wz2AYbKiXOLW7SQSYkogopCoarqw31wv3Dpx1SIl6wuxu9jI
	Tja4VW4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLbo-0000000GZ9k-0ekA;
	Wed, 27 Aug 2025 19:15:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIjb-0000000G8ot-1GmL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 16:10:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BACCF60266;
	Wed, 27 Aug 2025 16:10:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72531C4CEF5;
	Wed, 27 Aug 2025 16:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756311050;
	bh=0JfVi/NdEr3Jmqv7ipgStx4GVp4BrTWb9UY9wl/dGbk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F5RBkcLoZPVDgY0frJlYiEetLJnmdNW73TTKnahRv+R3fBJPA/ZuwJtjF6dr673Mn
	 SQ4de6u08IY7DDTwOKBZYXCex/8lUOruI2xoyEBR9OTtRJgkfTze3kyylrVPdmrloK
	 2zyeKvwYb7Gn9jer96cZUi0dxrjIRNZDWAamGLpwaj9RW6g7DgG9OS/loxKKxokBA8
	 5vYUTayZCRUPZ7zk8f1vpopjG7NLFSthvDRaVVypXTLBxOVeBQTBn8uATnrzFwiZ6B
	 WCsuzHjLK+z0pa7BXfrcuKYQLNAaDxXVGrV8imkQtWiMhfck1Fioq78JdcYWXLa9xf
	 DqAcJjMF6SpAQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1urIjY-00000000yGc-2tGi;
	Wed, 27 Aug 2025 16:10:48 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 11/16] KVM: arm64: Allow EL1 control registers to be accessed from the CPU state
Date: Wed, 27 Aug 2025 17:10:33 +0100
Message-Id: <20250827161039.938958-12-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250827161039.938958-1-maz@kernel.org>
References: <20250827161039.938958-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

As we are about to plug the SW PTW into the EL1-only code, we can
no longer assume that the EL1 state is not resident on the CPU,
as we don't necessarily get there from EL2 traps.

Turn the __vcpu_sys_reg() access on the EL1 state into calls to
the vcpu_read_sys_reg() helper, which is guaranteed to do the
right thing.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/at.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 48406328b74e3..76745e81bd9c8 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -110,7 +110,7 @@ static bool s1pie_enabled(struct kvm_vcpu *vcpu, enum trans_regime regime)
 	case TR_EL10:
 		return ((!vcpu_has_nv(vcpu) ||
 			 (__vcpu_sys_reg(vcpu, HCRX_EL2) & HCRX_EL2_TCR2En)) &&
-			(__vcpu_sys_reg(vcpu, TCR2_EL1) & TCR2_EL1_PIE));
+			(vcpu_read_sys_reg(vcpu, TCR2_EL1) & TCR2_EL1_PIE));
 	default:
 		BUG();
 	}
@@ -139,7 +139,7 @@ static void compute_s1poe(struct kvm_vcpu *vcpu, struct s1_walk_info *wi)
 			return;
 		}
 
-		val = __vcpu_sys_reg(vcpu, TCR2_EL1);
+		val = vcpu_read_sys_reg(vcpu, TCR2_EL1);
 		wi->poe = val & TCR2_EL1_POE;
 		wi->e0poe = val & TCR2_EL1_E0POE;
 	}
@@ -965,7 +965,7 @@ static void compute_s1_direct_permissions(struct kvm_vcpu *vcpu,
 		wxn = (vcpu_read_sys_reg(vcpu, SCTLR_EL2) & SCTLR_ELx_WXN);
 		break;
 	case TR_EL10:
-		wxn = (__vcpu_sys_reg(vcpu, SCTLR_EL1) & SCTLR_ELx_WXN);
+		wxn = (vcpu_read_sys_reg(vcpu, SCTLR_EL1) & SCTLR_ELx_WXN);
 		break;
 	}
 
-- 
2.39.2


