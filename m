Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0875C10A88DF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 15:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/FsS/LoXvoxvL5bT+xhQb1Ab0ajDGrYmiPkAJWvEV04=; b=zll6KHkHtSKzB1J0xVgIpPAVgW
	pwL8O32xhwCuQPM/3RN3cIFak//R6nbL9Id47zeSLR2OfDrQi6k+jivD6FVNaVs32rmIIXBSjb+aS
	p0+mj/ISjgo1ZKu7JA3s/Abyt/whbFVaxSdlwfBf195cSIucclUk09tia3gAEzI5fjt9aDsATGmW/
	SRcTJ01RBxlhqop4pCiP3thTqZfQwwq2eHsd3UbkGPRUl9lx65XIggKI9hPgSuWInGov9dAhUrgU8
	WKQd/1ZvC36dvGQWCLxqgB1Q+TOaHnsGRTk+yVRbKFuWULBO2N1YsfZRpHdRX5YJGwd0QtHCGEdel
	yndLRwNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mkN-00000005l9x-0cpq;
	Thu, 26 Mar 2026 15:35:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mkD-00000005l2R-1iun
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 15:35:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE31744598;
	Thu, 26 Mar 2026 15:35:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A88DEC116C6;
	Thu, 26 Mar 2026 15:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774539336;
	bh=CRKbEfZ640ydmcu//sv1gFU5INDkhE46iAfYl1MgcF8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L8rVpchGwIjTieyIvgQKJFxHWnjEq2rvcxYSk/P9V9UVjiIa3op5jPp7AM13iiW+l
	 bJKtP1xOJ6CVBha9ulfypthUY2nxniMXP4CYW4G3Tm+++epYoRXtpw4s/m/PU951gf
	 Rf7lveLssaKTRaohN1sHnhjTt7ASgkSv1rxwk2unDvF+nkMbLmmh4WGhkKufKmvfXc
	 4y08cglxTUjeXnIgWODPDn4bXq0XstfEh9lIkRxkBUbLU7KvitUY5ZJkApxO8e7Njt
	 BDxtb69eBxH/wdqYUVfrBwunX8AbLsiuptuAa1Xb3CxzqKkWZQMnukwzaAmSLaJ8K2
	 lp8zR+qOITR9g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w5mkA-000000060II-2hXR;
	Thu, 26 Mar 2026 15:35:34 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 02/15] KVM: arm64: Don't skip per-vcpu NV initialisation
Date: Thu, 26 Mar 2026 15:35:17 +0000
Message-ID: <20260326153530.3981879-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260326153530.3981879-1-maz@kernel.org>
References: <20260326153530.3981879-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_083537_466348_7174E46D 
X-CRM114-Status: GOOD (  11.26  )
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

Some GICv5-related rework have resulted in the NV sanitisation of
registers being skipped for secondary vcpus, which is a pretty bad
idea.

Hoist the NV init early so that it is always executed.

Fixes: cbd8c958be54a ("KVM: arm64: Return early from kvm_finalize_sys_regs() if guest has run")
Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index e1001544d4f40..18e2d2fccedb8 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -5772,6 +5772,12 @@ int kvm_finalize_sys_regs(struct kvm_vcpu *vcpu)
 
 	guard(mutex)(&kvm->arch.config_lock);
 
+	if (vcpu_has_nv(vcpu)) {
+		int ret = kvm_init_nv_sysregs(vcpu);
+		if (ret)
+			return ret;
+	}
+
 	if (kvm_vm_has_ran_once(kvm))
 		return 0;
 
@@ -5820,12 +5826,6 @@ int kvm_finalize_sys_regs(struct kvm_vcpu *vcpu)
 		kvm_vgic_finalize_idregs(kvm);
 	}
 
-	if (vcpu_has_nv(vcpu)) {
-		int ret = kvm_init_nv_sysregs(vcpu);
-		if (ret)
-			return ret;
-	}
-
 	return 0;
 }
 
-- 
2.47.3


