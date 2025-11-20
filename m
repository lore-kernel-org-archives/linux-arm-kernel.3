Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0A1CF9C72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYPgCXId/jgD62brhqnrUBghNDliFcxv+fGfPYTwAe0=; b=yBOvyrpg6YF6VIB3/OIfRJkoev
	kiolZfpAlJkK3NB3oqCyVRqFmJeVxeRbb73J7Y80NsZC44xC7Ry03ETaX1ed7ZaBHEgaLQEFoEHNl
	Jh7arQw21+VhkVHzJqmhleZ7sHDqNYULgia893wfw9Nm/5o0b5vDOZnOYpg33h/SlW0GOBNDsWWBD
	iP2SnZgX1ZX+vMkEBUUdpmcmOSvVWyOLVuo8LO/rLUceRuEFWH4BXfBNrKmBn9c6ZQh/x6KXTQRHl
	HLEn00t9ub2vqdUvBiFxbVasQUjVczuctYwQ9mGq5LeuwEOu2odVhP+HOUwlWjipB4VQ/Uvq/lT5e
	ryq8IpEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8QK-000000076BI-0IpW;
	Thu, 20 Nov 2025 17:26:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Q0-000000075fV-1agx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:26:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CB6DC60206;
	Thu, 20 Nov 2025 17:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82599C116D0;
	Thu, 20 Nov 2025 17:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659563;
	bh=2M4MvgwXEugIL3oc9eCJTpv22xhUFFpaQt+5YS+onvM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EVzdvSF6VGpIZtYXPv6LJuKjlM21JV/05/5SjEULzrDDidGNXnI3TZ2dqWXazwbT2
	 W0ai4cgD4n5OLbpYCldBbu0BJJAqdvUa+Qnz9eoSXa6yvHhNew1r7C+Zl8gqe/61Yd
	 4s9lnqsbaePP2MgBZdRm+LqtHFdppjEYM72KSUt6uI/l8x34nf5LUPjMjzVod+2KYo
	 EB47DZGijmfnWlxypeHVI4QjTPyTLNALb4420MK7OY4GfIk+4DY22yF4HYiSf9Wm8e
	 gEX6VsENiuwgAQ8VAwT9efqWDP/+w3Pjn01aOP0A9gkauGpsOhd+6ZSnPtFJfzXjs8
	 5hpGQoATC5oIQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Px-00000006y6g-2vqD;
	Thu, 20 Nov 2025 17:26:01 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 32/49] KVM: arm64: GICv3: Handle in-LR deactivation when possible
Date: Thu, 20 Nov 2025 17:25:22 +0000
Message-ID: <20251120172540.2267180-33-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120172540.2267180-1-maz@kernel.org>
References: <20251120172540.2267180-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, tabba@google.com, broonie@kernel.org
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

Even when we have either an LR overflow or SPIs in flight, it is
extremely likely that the interrupt being deactivated is still in
the LRs, and that going all the way back to the the generic trap
handling code is a waste of time.

Instead, try and deactivate in place when possible, and only if
this fails, perform a full exit.

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/vgic-v3-sr.c | 38 ++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/hyp/vgic-v3-sr.c b/arch/arm64/kvm/hyp/vgic-v3-sr.c
index f2f5854551449..71199e1a92940 100644
--- a/arch/arm64/kvm/hyp/vgic-v3-sr.c
+++ b/arch/arm64/kvm/hyp/vgic-v3-sr.c
@@ -792,7 +792,7 @@ static void __vgic_v3_bump_eoicount(void)
 	write_gicreg(hcr, ICH_HCR_EL2);
 }
 
-static void __vgic_v3_write_dir(struct kvm_vcpu *vcpu, u32 vmcr, int rt)
+static int ___vgic_v3_write_dir(struct kvm_vcpu *vcpu, u32 vmcr, int rt)
 {
 	u32 vid = vcpu_get_reg(vcpu, rt);
 	u64 lr_val;
@@ -800,19 +800,25 @@ static void __vgic_v3_write_dir(struct kvm_vcpu *vcpu, u32 vmcr, int rt)
 
 	/* EOImode == 0, nothing to be done here */
 	if (!(vmcr & ICH_VMCR_EOIM_MASK))
-		return;
+		return 1;
 
 	/* No deactivate to be performed on an LPI */
 	if (vid >= VGIC_MIN_LPI)
-		return;
+		return 1;
 
 	lr = __vgic_v3_find_active_lr(vcpu, vid, &lr_val);
-	if (lr == -1) {
-		__vgic_v3_bump_eoicount();
-		return;
+	if (lr != -1) {
+		__vgic_v3_clear_active_lr(lr, lr_val);
+		return 1;
 	}
 
-	__vgic_v3_clear_active_lr(lr, lr_val);
+	return 0;
+}
+
+static void __vgic_v3_write_dir(struct kvm_vcpu *vcpu, u32 vmcr, int rt)
+{
+	if (!___vgic_v3_write_dir(vcpu, vmcr, rt))
+		__vgic_v3_bump_eoicount();
 }
 
 static void __vgic_v3_write_eoir(struct kvm_vcpu *vcpu, u32 vmcr, int rt)
@@ -1247,9 +1253,21 @@ int __vgic_v3_perform_cpuif_access(struct kvm_vcpu *vcpu)
 	case SYS_ICC_DIR_EL1:
 		if (unlikely(is_read))
 			return 0;
-		/* Full exit if required to handle overflow deactivation... */
-		if (vcpu->arch.vgic_cpu.vgic_v3.vgic_hcr & ICH_HCR_EL2_TDIR)
-			return 0;
+		/*
+		 * Full exit if required to handle overflow deactivation,
+		 * unless we can emulate it in the LRs (likely the majority
+		 * of the cases).
+		 */
+		if (vcpu->arch.vgic_cpu.vgic_v3.vgic_hcr & ICH_HCR_EL2_TDIR) {
+			int ret;
+
+			ret = ___vgic_v3_write_dir(vcpu, __vgic_v3_read_vmcr(),
+						   kvm_vcpu_sys_get_rt(vcpu));
+			if (ret)
+				__kvm_skip_instr(vcpu);
+
+			return ret;
+		}
 		fn = __vgic_v3_write_dir;
 		break;
 	case SYS_ICC_RPR_EL1:
-- 
2.47.3


