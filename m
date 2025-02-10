Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E11FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 19:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zaWnnKyJIOHBv+eThB5SKr0Iq+tvF8zs5UcT5Ed7lZM=; b=S0C6uwFV1H0EZcwmFmso2kqz0g
	6sfPqKN4BpyS9J7osoCR3ErXwugyFUgj+XUUixMemg10zAWBT+AEDjGKmFOLzgqbrN4k+s/oXQIMW
	NeiL7p4LK4fpljR55+iwiTBKIse7dMvr0cLeFUHAlqiEGqqx3KYzDUFi8QlAp6vPjEIpyqHVlTJHu
	GPqk1yaon3Yrge/E7N7+z3v3c+1zRGHMevDowzPYiYYIO92g212deeM1su0reofTkn+IjhwPcU14r
	352o/dOw3LHgUvnCmcnuUnp+elEk1Lfwn+zn7tp/OWq0wC/3C5FfDSkrf+yj0cxawhTsWINu82xZR
	Fbib5WZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZYU-000000016Ux-2DlO;
	Mon, 10 Feb 2025 19:34:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYjI-00000000yry-3peI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 18:42:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C829B5C5DBC;
	Mon, 10 Feb 2025 18:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BDE8C4CEE7;
	Mon, 10 Feb 2025 18:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739212920;
	bh=9WGEF6A0ADnv6z6hchcc2hNLlsWnoeEm6HgulDZDTAw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TNIuKE4xSKZxikrwD88Pi2o/BV7XaNFYWnnTjcRQh+lRp/OwalMEGGIfJyDBM4wUC
	 oiudFlhlaCAjeqf16bkFPzHfHh9MLg7k/x5f16YD2IV6Mo9VlbBZkPN+uhRuDgiPmS
	 nfrLvEfym67pneVwXA3G3RlIjdx55JL42iOwH36Qp7YxmGAzEcmGBFSuQjuPk4SnEK
	 /f6c5MHQGNuFs16qkhg3DhSjHEpP7HYm6Z7aWziAFqeCh/hj4L5d9884z/LHPmCEDD
	 qgSP8LDGC/C75o/YNUSVBguFEJZ08gmw+SCavrX71r2GHb/oTsjpoRX50tjGNtV1U6
	 iQl4vZCwaSGkw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1thYjG-002g2I-BF;
	Mon, 10 Feb 2025 18:41:58 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 05/18] KVM: arm64: Don't treat HCRX_EL2 as a FGT register
Date: Mon, 10 Feb 2025 18:41:36 +0000
Message-Id: <20250210184150.2145093-6-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250210184150.2145093-1-maz@kernel.org>
References: <20250210184150.2145093-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_104201_008556_33AB6A17 
X-CRM114-Status: GOOD (  11.00  )
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

Treating HCRX_EL2 as yet another FGT register seems excessive, and
gets in a way of further improvements. It is actually simpler to
just be explicit about the masking, so just to that.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/include/hyp/switch.h | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index f838a45665f26..25a7ff5012ed6 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -261,12 +261,9 @@ static inline void __activate_traps_common(struct kvm_vcpu *vcpu)
 	if (cpus_have_final_cap(ARM64_HAS_HCX)) {
 		u64 hcrx = vcpu->arch.hcrx_el2;
 		if (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu)) {
-			u64 clr = 0, set = 0;
-
-			compute_clr_set(vcpu, HCRX_EL2, clr, set);
-
-			hcrx |= set;
-			hcrx &= ~clr;
+			u64 val = __vcpu_sys_reg(vcpu, HCRX_EL2);
+			hcrx |= val & __HCRX_EL2_MASK;
+			hcrx &= ~(~val & __HCRX_EL2_nMASK);
 		}
 
 		write_sysreg_s(hcrx, SYS_HCRX_EL2);
-- 
2.39.2


