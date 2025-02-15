Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5238C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 15:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=255aD0tukRNCUFSVEx/lxc/CBZ7ChZ9/Iol1CL1A7hc=; b=cT9k9Zn9weJ1/zfJSTD+334vuM
	NAU4Uu3rb4bBYoj4HQ+qRhuAbwszy6RzKO6pWg2I3JEStwLT4ITnv1cooJVqCS23iS/51L2h7cAEc
	vW/wFj5vGb5WH7LSDVkn+SECTI4L/UGOIQiQiEihU4lqKL5N3FjtzG8INyyH+pRc3F53VO54FKr3U
	hWT1ZT1tev+GxRASloVAJmzhFyaKdLTZ+NofzMANHsW/noRLAxzSl7KgXAlGZSt2Vw2Ys5oH82DbN
	qGHSNAUsMGngsdYw6RLTSFTftn0cTQNf6yX+D7H2MU9tAIYJG2hwfok3z3lEa5jnrD6nRumAcLOHD
	9CcBHeZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjJt1-00000000IhO-0U4t;
	Sat, 15 Feb 2025 15:15:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjJgE-00000000H3T-2vaF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 15:02:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 395235C545F;
	Sat, 15 Feb 2025 15:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74410C4CEF4;
	Sat, 15 Feb 2025 15:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739631724;
	bh=NMYKJ0yMl3LarmDuWH+JZqyMOz1yxAJw5qnSKOyFiDw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kEhvtf+Dwp4sEMZQBs4Zxno6Cose3p/fhabVE2663xjUnHGsXJVdFU5/t4Nt2K4MU
	 NNHbEU+tqkpAE0MC7tjydH91/bryxA4JpnLNp6Y0PIV3Zv9KT1NaFxFw+SCTvaf6Fu
	 nXNg+NnEMiK9t+yleIkz3vnqHxo/OEjhD3l5VYyKuz/41jmxHwSRg8UBfqCQYtDV94
	 F95MEBfWUvV8oKnu6gz9461peOvLcj8CRL/gT/w/VzKnaCAeBhjkAAYceFzQxq6iwo
	 wFyUcmX4ufl9LSRCW+uLJRXnVcHmnH6lGtmB6jCVABcF3i49iA1mTqdjc2CGZfgxco
	 CRQ2RHa8feVmg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tjJgA-004Nz6-Hw;
	Sat, 15 Feb 2025 15:02:02 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH 12/14] KVM: arm64: nv: Program host's VNCR_EL2 to the fixmap address
Date: Sat, 15 Feb 2025 15:01:32 +0000
Message-Id: <20250215150134.3765791-13-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250215150134.3765791-1-maz@kernel.org>
References: <20250215150134.3765791-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_070206_836516_0FFC4FAD 
X-CRM114-Status: GOOD (  15.00  )
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

Since we now have a way to map the guest's VNCR_EL2 on the host,
we can point the host's VNCR_EL2 to it and go full circle!

Note that we unconditionally assign the fixmap to VNCR_EL2,
irrespective of the guest's version being mapped or not. We want
to take a fault on first access, so the fixmap either contains
something guranteed to be either invalid or a guest mapping.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/vhe/switch.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index 3453fb76cf0e3..6242ab037bfdf 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -48,6 +48,7 @@ DEFINE_PER_CPU(unsigned long, kvm_hyp_vector);
 
 static u64 __compute_hcr(struct kvm_vcpu *vcpu)
 {
+	u64 guest_hcr = __vcpu_sys_reg(vcpu, HCR_EL2);
 	u64 hcr = vcpu->arch.hcr_el2;
 
 	if (!vcpu_has_nv(vcpu))
@@ -70,9 +71,23 @@ static u64 __compute_hcr(struct kvm_vcpu *vcpu)
 		write_sysreg_s(vcpu->arch.ctxt.vncr_array, SYS_VNCR_EL2);
 	} else {
 		host_data_clear_flag(VCPU_IN_HYP_CONTEXT);
+
+		if (guest_hcr & HCR_NV) {
+			u64 va = __fix_to_virt(vncr_fixmap(smp_processor_id()));
+
+			/* Inherit the low bits from the actual register */
+			va |= __vcpu_sys_reg(vcpu, VNCR_EL2) & GENMASK(PAGE_SHIFT - 1, 0);
+			write_sysreg_s(va, SYS_VNCR_EL2);
+
+			/* Force NV2 in case the guest is forgetful... */
+			guest_hcr |= HCR_NV2;
+		}
 	}
 
-	return hcr | (__vcpu_sys_reg(vcpu, HCR_EL2) & ~NV_HCR_GUEST_EXCLUDE);
+	BUG_ON(host_data_test_flag(VCPU_IN_HYP_CONTEXT) &&
+	       host_data_test_flag(L1_VNCR_MAPPED));
+
+	return hcr | (guest_hcr & ~NV_HCR_GUEST_EXCLUDE);
 }
 
 static void __activate_cptr_traps(struct kvm_vcpu *vcpu)
-- 
2.39.2


