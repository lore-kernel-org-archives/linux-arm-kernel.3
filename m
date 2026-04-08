Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85981073C9F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 11:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1kforik9uy69TfUQgLYXH+zurjDPH+VKlQTBhGCuRn0=; b=vNBL63duGVR3s54/JCMM0q3r2i
	LFjUnjtGjgbxkeNnom8S8CnV00lgaKfyOsJdTJrFxnplXQGYmK+8JC0G0SJvjUyO6qnQeFulPObHE
	CHsDV1TpXrvhbX9rFqAPMtUYP/ojFbsaokT8d1WPkW6Mi7KlHUctAe1o+zbTMRHvvYeodkGyzPwzW
	kSaCWBzrTFo9QnYGmIlK0re5YLelxVLHZXUzWsY6trLKlE/BMbrgK1b/8UiBv/gGmuMM1+NHNbehz
	xIj2spoTnkKwFFlttEGpMIbPaEtVW1ZN8vOJxfY327e4e6k52Ys4o5bGZ1s+LyVzlG1UQxJ2fHrBi
	0oS7i5TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAR9c-00000008kiu-3NJy;
	Wed, 08 Apr 2026 11:33:04 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAR9a-00000008khW-0mnx
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 08 Apr 2026 11:33:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description;
	bh=1kforik9uy69TfUQgLYXH+zurjDPH+VKlQTBhGCuRn0=; b=FTLz9pqsYI3Q0jQcxTtllH1qUk
	Uen+iaOvb+Rz3ACjtiayvuwn463S4cbf6mj3qs49sp0zZkQrrvNj3QYX/aEVBv8Mv5qXmJ1on7MzK
	jizzn1wIirF7hwrRMrwNqvvvGg8Ga1CKDBCpalt6kh/EYbmsP2oDcWI5nvEoEksrUsXZYjGpUrpiY
	gdHqGsGkI/q3FSmIvtYzOIgijpkK/hplg6FiJJYiQX/EpZBGzEaP8Z21Kob8CUQ7sGdX1tupUCbxx
	C31yIo2rGV30gFj3waQGpE7fbIThNKQROLb33R56BOg5hBqNMLChHMpayIE7OkScagu+HxUr6j6kA
	zBPEfYew==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAR9V-00000005Iep-2nhT;
	Wed, 08 Apr 2026 11:32:57 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAR9V-00000008nA0-16TK;
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
Subject: [PATCH v2 1/5] KVM: arm64: vgic: Fix IIDR revision field extracted from wrong value
Date: Wed,  8 Apr 2026 12:30:32 +0100
Message-ID: <20260408113256.2095505-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260408113256.2095505-1-dwmw2@infradead.org>
References: <20260408113256.2095505-1-dwmw2@infradead.org>
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

The uaccess write handlers for GICD_IIDR in both GICv2 and GICv3
extract the revision field from 'reg' (the current IIDR value read back
from the emulated distributor) instead of 'val' (the value userspace is
trying to write). This means userspace can never actually change the
implementation revision — the extracted value is always the current one.

Fix the FIELD_GET to use 'val' so that userspace can select a different
revision for migration compatibility.

Fixes: 49a1a2c70a7f ("KVM: arm64: vgic-v3: Advertise GICR_CTLR.{IR, CES} as a new GICD_IIDR revision")
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/arm64/kvm/vgic/vgic-mmio-v2.c | 2 +-
 arch/arm64/kvm/vgic/vgic-mmio-v3.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v2.c b/arch/arm64/kvm/vgic/vgic-mmio-v2.c
index 406845b3117c..0643e333db35 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v2.c
@@ -91,7 +91,7 @@ static int vgic_mmio_uaccess_write_v2_misc(struct kvm_vcpu *vcpu,
 		 * migration from old kernels to new kernels with legacy
 		 * userspace.
 		 */
-		reg = FIELD_GET(GICD_IIDR_REVISION_MASK, reg);
+		reg = FIELD_GET(GICD_IIDR_REVISION_MASK, val);
 		switch (reg) {
 		case KVM_VGIC_IMP_REV_2:
 		case KVM_VGIC_IMP_REV_3:
diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index 89edb84d1ac6..5913a20d8301 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -194,7 +194,7 @@ static int vgic_mmio_uaccess_write_v3_misc(struct kvm_vcpu *vcpu,
 		if ((reg ^ val) & ~GICD_IIDR_REVISION_MASK)
 			return -EINVAL;
 
-		reg = FIELD_GET(GICD_IIDR_REVISION_MASK, reg);
+		reg = FIELD_GET(GICD_IIDR_REVISION_MASK, val);
 		switch (reg) {
 		case KVM_VGIC_IMP_REV_2:
 		case KVM_VGIC_IMP_REV_3:
-- 
2.51.0


