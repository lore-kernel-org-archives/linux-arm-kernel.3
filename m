Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0C6E63C8C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 18:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xzHL6Cmay2cw66Oy4zr2wuA/E8J6uS2TuzrXR8EmKo=; b=f9Q2eIw1/Zq+RsuDI1lr708gWt
	yNl99zeOMtux3rtB6rQ471Fn4Tj5uZZpPVG5EHO6CFVx3I7FNTB6l+zX3l6asLjjSkq12lh2xS8Fn
	3vMeySE4hzENnQ09KLUJHZbcptzT/OIQzEKpwdY3FsKUr6uY6Dyn/HfH86ULXfYxG7UNctLLZrnU4
	tQrZhwc67FoLB+rT1ovJIJV/F3V63ygw4caA0nKyK7FHljWx4mKjmOBeEK4avQD/ACEBb1OYTnGe4
	IQPUMpBkvQz0Z5i/c2XftC0y/1zx2hs1QYBapHCqfn6uoMevpl4ExuY+qLcWQCoTUsBi2sCLfOgpr
	0kz1VIoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmytu-00000005RCj-1TJu;
	Mon, 02 Feb 2026 18:43:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyti-00000005Qxr-1mNY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 18:43:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 07433444AD;
	Mon,  2 Feb 2026 18:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5106C116C6;
	Mon,  2 Feb 2026 18:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770057821;
	bh=KZ1ahPlEHxeFJ4AviJujfAO2tDqTEzqQuzbGo/U0J7E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q0FRdpMTCRZOXGEs6XOEpL69drTkw8uRya5t+iFuWMepBHCOgCt/NwmWXeuPONEkw
	 MhVyjT1P7rCs+8Pk/dRDWE3DMWP6COAKci1KVdnliD7pOqgBBm77qmhiHcDKaBFowg
	 p0KoYdfx+38/grFzXjKP6d+BE27QTIF0d4cYA4bhDzozKm5VzUsZxeuopM07nyBNEK
	 zk2Q0nR7YujHUeJpf+EVaYIm7g5ku5s7ZvtJMgPeSYvBUxVQT1DMcV1KB+vbVVbY0T
	 hunx3umq43btIKGb1CbtSpre8bkxkPl9i+1FZx0vdmxdzzrWC4O+ox+9dmY+S1L8cD
	 jSdlUAeyf8QJg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vmytf-00000007sAy-3k2H;
	Mon, 02 Feb 2026 18:43:39 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v2 05/20] KVM: arm64: Extend unified RESx handling to runtime sanitisation
Date: Mon,  2 Feb 2026 18:43:14 +0000
Message-ID: <20260202184329.2724080-6-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260202184329.2724080-1-maz@kernel.org>
References: <20260202184329.2724080-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_104342_501314_F1D485F4 
X-CRM114-Status: GOOD (  15.38  )
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

Add a new helper to retrieve the RESx values for a given system
register, and use it for the runtime sanitisation.

This results in slightly better code generation for a fairly hot
path in the hypervisor, and additionally covers all sanitised
registers in all conditions, not just the VNCR-based ones.

Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h | 15 +++++++++++++++
 arch/arm64/kvm/emulate-nested.c   | 10 +---------
 arch/arm64/kvm/nested.c           | 13 ++++---------
 3 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 799f494a1349c..20ebc1610ac84 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -635,6 +635,21 @@ struct kvm_sysreg_masks {
 	struct resx mask[NR_SYS_REGS - __SANITISED_REG_START__];
 };
 
+static inline struct resx __kvm_get_sysreg_resx(struct kvm_arch *arch,
+						enum vcpu_sysreg sr)
+{
+	struct kvm_sysreg_masks *masks;
+
+	masks = arch->sysreg_masks;
+	if (likely(masks &&
+		   sr >= __SANITISED_REG_START__ && sr < NR_SYS_REGS))
+		return masks->mask[sr - __SANITISED_REG_START__];
+
+	return (struct resx){};
+}
+
+#define kvm_get_sysreg_resx(k, sr) __kvm_get_sysreg_resx(&(k)->arch, (sr))
+
 static inline void __kvm_set_sysreg_resx(struct kvm_arch *arch,
 					 enum vcpu_sysreg sr, struct resx resx)
 {
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 774cfbf5b43ba..43334cd2db9e5 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2427,15 +2427,7 @@ static enum trap_behaviour compute_trap_behaviour(struct kvm_vcpu *vcpu,
 
 static u64 kvm_get_sysreg_res0(struct kvm *kvm, enum vcpu_sysreg sr)
 {
-	struct kvm_sysreg_masks *masks;
-
-	/* Only handle the VNCR-backed regs for now */
-	if (sr < __VNCR_START__)
-		return 0;
-
-	masks = kvm->arch.sysreg_masks;
-
-	return masks->mask[sr - __SANITISED_REG_START__].res0;
+	return kvm_get_sysreg_resx(kvm, sr).res0;
 }
 
 static bool check_fgt_bit(struct kvm_vcpu *vcpu, enum vcpu_sysreg sr,
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index c5a45bc62153e..75a23f1c56d13 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1669,16 +1669,11 @@ u64 limit_nv_id_reg(struct kvm *kvm, u32 reg, u64 val)
 u64 kvm_vcpu_apply_reg_masks(const struct kvm_vcpu *vcpu,
 			     enum vcpu_sysreg sr, u64 v)
 {
-	struct kvm_sysreg_masks *masks;
-
-	masks = vcpu->kvm->arch.sysreg_masks;
-
-	if (masks) {
-		sr -= __SANITISED_REG_START__;
+	struct resx resx;
 
-		v &= ~masks->mask[sr].res0;
-		v |= masks->mask[sr].res1;
-	}
+	resx = kvm_get_sysreg_resx(vcpu->kvm, sr);
+	v &= ~resx.res0;
+	v |= resx.res1;
 
 	return v;
 }
-- 
2.47.3


