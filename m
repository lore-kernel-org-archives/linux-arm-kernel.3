Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38541073CA2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 11:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Od+JVLkp+gy2eU3w9akPPssxGqEG5+BPOep9rVB8SM=; b=RiI4ZVaHSgtSZAKEulE3r0Cq/C
	06pHq4uDBiLq+7e8IHFjufEIZ0adbpUEm75MU3m0yQe68V3piegonRXOrL+ogOPztjiFSkcGegNP4
	ZSAXC6KQ8R8M2q0P9LE0QFfIRCrt3s/UsKgt99eZ/htpDGgk7mTIKkoYaGfGFV12zM6mwvk5darzx
	sdGLNh4Cjc2QaDF0Ac1Z24PDD7PMPzKRieFmJHOw9aOhQQeQl9xzZJEh4fRSOM6EaMLilkSn+0RGX
	ko9VB5reSxJrVOA02/2v5Ntcz1eknRppn2/WLV2PI4QhafDxx3XGosCg9EWRLqdP97fWNHw1Hlup+
	wcp74Pzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAR9f-00000008kkO-22jH;
	Wed, 08 Apr 2026 11:33:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAR9a-00000008khZ-0mna
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 08 Apr 2026 11:33:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description;
	bh=9Od+JVLkp+gy2eU3w9akPPssxGqEG5+BPOep9rVB8SM=; b=eUcfCmZxOJRbp/50bNSr4dhzOS
	ylmTygzOZdaxyXJObExOptwY3MV2Ll+7uRhc36T0x/9nYl0SU/55kTWPhOTrR95g262r9rmCGchkA
	GJwXFLsRYGWWhlwAGywIpvqvrrLpg9nZsOmdSLpBTNtmBaGPz5Zg/i2X6CPp02aRgx9cOEumtL6+z
	W1OmQU3jNd4JSu3Lt9dCKB2i5AqqIFOtCOtG7EHI+A+cnouxG31Rdxo7DUNBs/XNQ+7qPU0/uH3fh
	VzSicvqTynFxgxR+3IoAnVEMzO0g7Rp7dOjF0TEZ0ICfiPPQOPkDcdM0kAGU7KpLXGYuqlJgW3xzU
	gNYNaZvw==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAR9V-00000005Ies-2pz5;
	Wed, 08 Apr 2026 11:32:57 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAR9V-00000008nA9-1wCC;
	Wed, 08 Apr 2026 12:32:57 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Eric Auger <eric.auger@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 4/5] KVM: arm64: vgic: Remove v2_groups_user_writable and use IIDR revision directly
Date: Wed,  8 Apr 2026 12:30:35 +0100
Message-ID: <20260408113256.2095505-5-dwmw2@infradead.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260408113256.2095505-1-dwmw2@infradead.org>
References: <20260408113256.2095505-1-dwmw2@infradead.org>
MIME-Version: 1.0
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

The v2_groups_user_writable flag was introduced to gate GICv2 userspace
IGROUPR writes until userspace explicitly wrote the IIDR, signalling
awareness of the group semantics. However, the guest write path through
vgic_mmio_write_group() was never gated by this flag, allowing a GICv2
guest to modify interrupt groups regardless of whether userspace had
opted in.

Rather than adding the same flag check to the guest path, remove the
flag entirely and make both guest and userspace IGROUPR writability
follow the IIDR implementation revision directly. Groups are writable
when the revision is >= 2, which is the case when userspace explicitly
sets the IIDR to revision 2 or 3. When userspace does not write the
IIDR, vgic_init() defaults to KVM_VGIC_IMP_REV_LATEST (currently 3),
so the behaviour is unchanged for userspace that doesn't set the IIDR.

This also fixes the inconsistency where a GICv2 guest could write
IGROUPR even when the IIDR had not been explicitly set by userspace.

Fixes: d53c2c29ae0d ("KVM: arm/arm64: vgic: Allow configuration of interrupt groups")
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/arm64/kvm/vgic/vgic-mmio-v2.c | 16 +++++-----------
 include/kvm/arm_vgic.h             |  3 ---
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v2.c b/arch/arm64/kvm/vgic/vgic-mmio-v2.c
index e5714f7fd2ec..e5fc673a1ea9 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v2.c
@@ -84,21 +84,15 @@ static int vgic_mmio_uaccess_write_v2_misc(struct kvm_vcpu *vcpu,
 			return -EINVAL;
 
 		/*
-		 * If we observe a write to GICD_IIDR we know that userspace
-		 * has been updated and has had a chance to cope with older
-		 * kernels (VGICv2 IIDR.Revision == 0) incorrectly reporting
-		 * interrupts as group 1, and therefore we now allow groups to
-		 * be user writable.  Doing this by default would break
-		 * migration from old kernels to new kernels with legacy
-		 * userspace.
+		 * Allow userspace to select the GICv2 IIDR revision.
+		 * Group writability follows the revision directly:
+		 * groups are guest/user writable for revision >= 2.
 		 */
 		reg = FIELD_GET(GICD_IIDR_REVISION_MASK, val);
 		switch (reg) {
+		case KVM_VGIC_IMP_REV_1:
 		case KVM_VGIC_IMP_REV_2:
 		case KVM_VGIC_IMP_REV_3:
-			vcpu->kvm->arch.vgic.v2_groups_user_writable = true;
-			fallthrough;
-		case KVM_VGIC_IMP_REV_1:
 			dist->implementation_rev = reg;
 			return 0;
 		default:
@@ -114,7 +108,7 @@ static int vgic_mmio_uaccess_write_v2_group(struct kvm_vcpu *vcpu,
 					    gpa_t addr, unsigned int len,
 					    unsigned long val)
 {
-	if (vcpu->kvm->arch.vgic.v2_groups_user_writable)
+	if (vgic_get_implementation_rev(vcpu) >= KVM_VGIC_IMP_REV_2)
 		vgic_mmio_write_group(vcpu, addr, len, val);
 
 	return 0;
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index 90fb6cd3c91c..cdfab2c20877 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -253,9 +253,6 @@ struct vgic_dist {
 #define KVM_VGIC_IMP_REV_3	3 /* GICv3 GICR_CTLR.{IW,CES,RWP} */
 #define KVM_VGIC_IMP_REV_LATEST	KVM_VGIC_IMP_REV_3
 
-	/* Userspace can write to GICv2 IGROUPR */
-	bool			v2_groups_user_writable;
-
 	/* Do injected MSIs require an additional device ID? */
 	bool			msis_require_devid;
 
-- 
2.51.0


