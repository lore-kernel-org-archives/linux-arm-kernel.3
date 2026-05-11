Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A309CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNnAeMZ88hnaK7C3Z3PFUiVty5ocHdzHNWe9HEpa28s=; b=1BKeZUhlUIbo56K59PjfSX1S+c
	JDOd8b8vknG9dGz28qUFVRSh10LuO5xB0csdXM/A/LmoO8BWPrsHMbtC/HeTbUAxqitQHlWW+c/em
	GZ9Pk6ZW9n5AdY14a/QT+0vOYl38xADAj8xdKA3QdfmYEsm8AO0zKGMUUItKGWkUsSi50nlab2/3R
	H053K5L1Ixe2OB5EVQrMmlGR8K4S4MZ+RZxDKSQIoPJzjHT27dPO8UnsgcFRv32a6rjwFeUinzORm
	FdG3gWDAG2+dXdsMBSiAoXXt02/FVfUU+2iRk2Yo3vSXuUm2fuYzD3ILHuDp+kCPRrfn6Pcq345H3
	zyhX6xZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOvd-0000000DLVL-1itK;
	Mon, 11 May 2026 11:36:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOvb-0000000DLU5-29fH
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 11:36:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description;
	bh=cNnAeMZ88hnaK7C3Z3PFUiVty5ocHdzHNWe9HEpa28s=; b=hbQtBPhsZntnThgsYYdL0xrLen
	vju5LUmavfaplo0j/zEoZ+SGkX/bUsBLlUuGUqCXGkBuLLPtmkQEzIhNo7+bQbFEl/ZbyAb1Q7pCP
	w+qVXFun5OOTEWY4FXsoWe7MkCPZ/Pw52VJi3plUv34lcyxc9dX0UVgOdFPhYQiJxZlqLl7hJsvGT
	xHXmYHm34qKsy6YCYeC99qikD76dcGxiZ4XS5ndbSmRJ8vwYJ6vyia2S/7BalXLxf1/hnKY07Yg6g
	ybX2+qohIDUm4pcl92ANKpSABUjNqabVtXsn3/ywNGSyTH+IlWzP3Nin5SuVadnHiJiMcFNJ1rN00
	ISBzYh7Q==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOvY-000000084dK-1iwz;
	Mon, 11 May 2026 11:36:00 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wMOvY-0000000Dx0U-0ZVa;
	Mon, 11 May 2026 12:36:00 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Kees Cook <kees@kernel.org>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 1/4] KVM: arm64: vgic: Allow userspace to set IIDR revision 1
Date: Mon, 11 May 2026 12:30:43 +0100
Message-ID: <20260511113558.3325004-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511113558.3325004-1-dwmw2@infradead.org>
References: <20260511113558.3325004-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
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

From: David Woodhouse <dwmw@amazon.co.uk>

In order to preserve guest compatibility across kernel upgrades, allow
userspace to select GICD_IIDR revision 1. This allows compatibility with
the original behaviour from before commit d53c2c29ae0d ("KVM: arm/arm64:
vgic: Allow configuration of interrupt groups") where interrupt groups
are not guest-configurable.

When revision 1 is selected:
 - GICv2: IGROUPR reads as zero (group 0), writes are ignored
 - GICv3: IGROUPR reads as all-ones (group 1), writes are ignored
 - v2_groups_user_writable is not set

This is implemented by checking the implementation revision in
vgic_mmio_write_group() and suppressing writes when the revision is
below 2. The read side needs no change since the per-IRQ group reset
values already match the expected behaviour.

For GICv2, commit 32f8777ed92d7 ("KVM: arm/arm64: vgic: Let userspace
opt-in to writable v2 IGROUPR") introduced a confusing model where
IGROUPR registers were not writable from userspace by default until the
IIDR was written — even if it was written to the *same* as its default
value (which, in fact, was the only thing that userspace *could* set it
to before commit a0e6ae45af17 fixed the IIDR write path). Furthermore,
even when the v2_groups_user_writable flag wasn't set, the *guest*
could still actually write to the registers... but userspace couldn't
save/restore them. That default behaviour for GICv2 remains unchanged;
it can be fixed in a future commit.

Fixes: d53c2c29ae0d ("KVM: arm/arm64: vgic: Allow configuration of interrupt groups")
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/arm64/kvm/vgic/vgic-mmio-v2.c | 3 +++
 arch/arm64/kvm/vgic/vgic-mmio-v3.c | 4 ++++
 arch/arm64/kvm/vgic/vgic-mmio.c    | 4 ++++
 include/kvm/arm_vgic.h             | 1 +
 4 files changed, 12 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v2.c b/arch/arm64/kvm/vgic/vgic-mmio-v2.c
index 0643e333db35..e5714f7fd2ec 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v2.c
@@ -20,6 +20,7 @@
  * Revision 1: Report GICv2 interrupts as group 0 instead of group 1
  * Revision 2: Interrupt groups are guest-configurable and signaled using
  * 	       their configured groups.
+ * Revision 3: GICv2 behaviour is unchanged from revision 2.
  */
 
 static unsigned long vgic_mmio_read_v2_misc(struct kvm_vcpu *vcpu,
@@ -96,6 +97,8 @@ static int vgic_mmio_uaccess_write_v2_misc(struct kvm_vcpu *vcpu,
 		case KVM_VGIC_IMP_REV_2:
 		case KVM_VGIC_IMP_REV_3:
 			vcpu->kvm->arch.vgic.v2_groups_user_writable = true;
+			fallthrough;
+		case KVM_VGIC_IMP_REV_1:
 			dist->implementation_rev = reg;
 			return 0;
 		default:
diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index 5913a20d8301..0130db71cfc9 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -74,8 +74,11 @@ bool vgic_supports_direct_sgis(struct kvm *kvm)
 /*
  * The Revision field in the IIDR have the following meanings:
  *
+ * Revision 1: Interrupt groups are not guest-configurable.
+ * 	       IGROUPR reads as all-ones (group 1), writes ignored.
  * Revision 2: Interrupt groups are guest-configurable and signaled using
  * 	       their configured groups.
+ * Revision 3: GICR_CTLR.{IR,CES} are advertised.
  */
 
 static unsigned long vgic_mmio_read_v3_misc(struct kvm_vcpu *vcpu,
@@ -196,6 +199,7 @@ static int vgic_mmio_uaccess_write_v3_misc(struct kvm_vcpu *vcpu,
 
 		reg = FIELD_GET(GICD_IIDR_REVISION_MASK, val);
 		switch (reg) {
+		case KVM_VGIC_IMP_REV_1:
 		case KVM_VGIC_IMP_REV_2:
 		case KVM_VGIC_IMP_REV_3:
 			dist->implementation_rev = reg;
diff --git a/arch/arm64/kvm/vgic/vgic-mmio.c b/arch/arm64/kvm/vgic/vgic-mmio.c
index 74d76dec9730..1b662744ec5b 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio.c
@@ -73,6 +73,10 @@ void vgic_mmio_write_group(struct kvm_vcpu *vcpu, gpa_t addr,
 	int i;
 	unsigned long flags;
 
+	/* Revision 1 and below: groups are not guest-configurable. */
+	if (vgic_get_implementation_rev(vcpu) < KVM_VGIC_IMP_REV_2)
+		return;
+
 	for (i = 0; i < len * 8; i++) {
 		struct vgic_irq *irq = vgic_get_vcpu_irq(vcpu, intid + i);
 
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index 1388dc6028a9..16811ec03d54 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -372,6 +372,7 @@ struct vgic_dist {
 
 	/* Implementation revision as reported in the GICD_IIDR */
 	u32			implementation_rev;
+#define KVM_VGIC_IMP_REV_1	1 /* GICv2 interrupts as group 0 */
 #define KVM_VGIC_IMP_REV_2	2 /* GICv2 restorable groups */
 #define KVM_VGIC_IMP_REV_3	3 /* GICv3 GICR_CTLR.{IW,CES,RWP} */
 #define KVM_VGIC_IMP_REV_LATEST	KVM_VGIC_IMP_REV_3
-- 
2.51.0


