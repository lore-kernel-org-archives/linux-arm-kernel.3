Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2342DCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 17:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfjKPMsm3aHo0Xpc6/Rjq86uyyN3j2MKKUq35TImtkw=; b=R9K34QvNGuBHz8j8j74SQREngK
	i6e/Rwv6yFNYsJcGnOuNenZ4xx+asnGH88p/RcbeNDmsrMG6m0aR7HRSxOB3YUIQHgLUAqKPvl6f1
	RUlWxg+p3BdVPFn0su2fhVZBRsV3eXxB2b63tZ0QpGzTYO/gvdg1gAu3enLf+Gq0ywKs9UQSTFqSF
	lqPgrbXhXevQZB23XtB32KTjGh7NVTGox0yHh2BQNdK4B7aq012p+NOpy6IFjWrlRXFCnSvObnYi7
	AysE6roV3ee+2IG6OL/UHYgMSawdi9atGE7uiVzWyBNPJGlGj7hoZpZVHSUE0GPdwrZKoSdAx4ZFN
	ta2AsYGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI92h-00000004DR5-2iOD;
	Sun, 09 Nov 2025 17:17:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI91p-00000004CBQ-3AuG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 17:16:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D4AC43568;
	Sun,  9 Nov 2025 17:16:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8097FC19425;
	Sun,  9 Nov 2025 17:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762708597;
	bh=0Cx21DFv+o0C6Y+UxV0ERfuwdJ4fIlnLl2DzexkfE94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CVc1eMT1KGPi/Z7ZsokwNoR8uaruXjv/TL+jtaJub5ZYjCloE9+cJPMhUPi2YZMzI
	 sGJjVAZd6Qh6AHVCB5e7Tdv9cJsa125NubfgnYfdNPCW4t4Oat+rSkVf6Mm1emP/2T
	 cLEMgY0SG7+u/SIo/2rQeaxId3y2G0iOyuesLtIuuSVbz+Q/n+g6PBtt33T0maawS/
	 d0uQYWBAACdqAXybTe4N3TnIA/XybW9gLT2/KXVAoGJa2B7ORDc4wZoLqwlw8kh+pd
	 YZElFgAasJkFe91XmOhLxgyPGXvmQw+47TrWaExcjvuUaA055TBhOj7R8/Wtm4jnPH
	 ilJMtyJa9Kuaw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vI91n-00000003exw-2xHU;
	Sun, 09 Nov 2025 17:16:35 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: [PATCH v2 31/45] KVM: arm64: GICv3: Handle in-LR deactivation when possible
Date: Sun,  9 Nov 2025 17:16:05 +0000
Message-ID: <20251109171619.1507205-32-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251109171619.1507205-1-maz@kernel.org>
References: <20251109171619.1507205-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com, yaoyuan@linux.alibaba.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_091637_864284_D5C0CBD5 
X-CRM114-Status: GOOD (  17.47  )
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

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/vgic-v3-sr.c | 38 ++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/hyp/vgic-v3-sr.c b/arch/arm64/kvm/hyp/vgic-v3-sr.c
index 8d3f4c069ea63..e950efa225478 100644
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


