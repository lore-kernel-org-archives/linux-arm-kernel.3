Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA51C369AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 13:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LTTL9dQEScHE4pj+G94YjoxirJBT5idVWapzbvs8BzI=; b=QZsIV2TJb+7Zb0Yeu0lZVTSdtc
	NSNPLdtG4SyG7cy2jaWKc51/qOdNPYrWAooMPVQZwkCJpqBBX8B/6cm51EdLRkw2kOvgKW6kyYdY3
	QvKy276U2vb02zc1TUzWnvq56jbg90jWsywZrw1XiQqDmUHnYgzcOTtvRPUX7gqVIoWPSjhotYhNG
	7Y/t4TrT3qNLdd1uUbU3xAp87lh96iiWwYGNr3yaVOQod4nGl3U4tQmBDiCKjdf2P7kX8kXUXjQe7
	U8V4iT6i0FK5Z/CA6AV68pwhm4sLNnPKc2Nc36zS8VyK8MIYTCbbRADkZaxXwGsN+ADbjla7cswRx
	NMtBlaZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28lz-000000046I6-0JlN;
	Tue, 08 Apr 2025 13:13:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26ZU-00000003kcW-40aS
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Apr 2025 10:52:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=LTTL9dQEScHE4pj+G94YjoxirJBT5idVWapzbvs8BzI=; b=PgAyuYCW7ljjltC6plrmfeQscd
	T6UXUBbUpIPy7wBPvV7jUCYB5PSHfZvhc6BC8NGbMgT7i32ZWWz3rVUfIN58L1pdvNwwRBnN+gxqa
	M/tn01gYjSCjB6vvzW+2VBt278MkIZXz+OeLm2YvDSei/gkaEwV6XNSKQBm+v87llVMf437Ncu+MD
	EuBcCeYUUTQ1nHurGXigAhR7O7ertVVdw0AiYtEoHGNdjUfv1w2GU2uIqKnotI2bFO1g0TpcTOAlS
	k+0gTl9tGaH3cZ8gnv0sneN5q4+zn1chLGZA8Mk28dPG2dF2CMzSzL7qqm1ly1DhdKNsWCiT0T0T6
	5+ofY0jA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26ZQ-00000008GRb-0L4j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 10:52:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 83EA449D41;
	Tue,  8 Apr 2025 10:52:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18BC0C4CEE7;
	Tue,  8 Apr 2025 10:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109561;
	bh=ydvZE2fcKiHSXxy2PEWqOT/2J5DSfX2LWTaD8LM7MhU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p6EQqhUbjihCw38r8bJlIz/jQWNYrmqWPIph4sFf8VkH2AyZAO9Hxv3xLW8z2wWF5
	 qglkD09LyTxd/SayrAyYOoHMgF2a192LO+/PJQb6eQtYNiRPtTcK9CV/jQV5br0/NY
	 ZG2EUwaUpd8NXWFTURjlrcrwGiTtq7OvcqVBjv8uIF+Qc7fynRHTq1LqCSXqyf0bPZ
	 z4yuRz6Lr3SsMqowkEKU8kQiuNfQvM2qpWuE5BR5fjv6iO59BhxSl6P97xxLTukPBD
	 rMIGzX5Ic6njY+A2i2Kypnp6TA8VS5TBugaVEYbowxmnL9K0Lft98wXiPmKF9GT4nt
	 doJ3ksJg+tPoA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u26ZL-003QX2-Ac;
	Tue, 08 Apr 2025 11:52:39 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v2 12/17] KVM: arm64: nv: Program host's VNCR_EL2 to the fixmap address
Date: Tue,  8 Apr 2025 11:52:20 +0100
Message-Id: <20250408105225.4002637-13-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250408105225.4002637-1-maz@kernel.org>
References: <20250408105225.4002637-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_115244_357993_61A07A0F 
X-CRM114-Status: GOOD (  16.15  )
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
index 220dee8a45e0d..5eaff1ae32b29 100644
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


