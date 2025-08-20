Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EAACA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 16:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vCSiOX/CcUjV6mDgXSoyiaNy5ongIPWWb8oqmqwVuKo=; b=Ddu7FqConK4hiLvUrhwaptaZBL
	Rem0diWxrwvT0GQcQM4ZjjwDotrz580dj4km1reCmPR1X+QXGcjD7Z1dFXSs0ATxQDMrxxhciSaew
	xFrEteswsbsDrfrtQwdn2Zzbb23TVfSK9cBs7s6kF/aJhqf4QeyfTGgJ23ukt1RiP+9cCCLuqmACc
	3P1BLAypEJoPs5STj0W1Kr9tq9lUhKAmvljvre3FU55LA4cr0LzDvOLXpFknQ6YJHwnCgHxrmcmhj
	MbwbS0eHE8375eVHk559oXmat0zlgOslpm57zR8FxqP89mhQWQZzSoJdbS/M7G5fKuAxZFL31L3Pm
	vEY2v2zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uom9d-0000000ESuD-3BXP;
	Wed, 20 Aug 2025 16:59:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokG4-0000000EAGW-1hAv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 14:57:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C577C2C3D;
	Wed, 20 Aug 2025 07:57:39 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.2.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD0933F738;
	Wed, 20 Aug 2025 07:57:43 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Steven Price <steven.price@arm.com>
Subject: [PATCH v10 08/43] kvm: arm64: Don't expose debug capabilities for realm guests
Date: Wed, 20 Aug 2025 15:55:28 +0100
Message-ID: <20250820145606.180644-9-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820145606.180644-1-steven.price@arm.com>
References: <20250820145606.180644-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_075748_490228_32BF82C6 
X-CRM114-Status: GOOD (  10.40  )
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

From: Suzuki K Poulose <suzuki.poulose@arm.com>

RMM v1.0 provides no mechanism for the host to perform debug operations
on the guest. So don't expose KVM_CAP_SET_GUEST_DEBUG and report 0
breakpoints and 0 watch points.

Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Steven Price <steven.price@arm.com>
---
Changes since v7:
 * Remove the helper functions and inline the kvm_is_realm() check with
   a ternary operator.
 * Rewrite the commit message to explain this patch.
---
 arch/arm64/kvm/arm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 1acee3861e55..8c0e9ec34f0a 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -331,7 +331,6 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_ARM_IRQ_LINE_LAYOUT_2:
 	case KVM_CAP_ARM_NISV_TO_USER:
 	case KVM_CAP_ARM_INJECT_EXT_DABT:
-	case KVM_CAP_SET_GUEST_DEBUG:
 	case KVM_CAP_VCPU_ATTRIBUTES:
 	case KVM_CAP_PTP_KVM:
 	case KVM_CAP_ARM_SYSTEM_SUSPEND:
@@ -340,6 +339,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_ARM_WRITABLE_IMP_ID_REGS:
 		r = 1;
 		break;
+	case KVM_CAP_SET_GUEST_DEBUG:
+		r = !kvm_is_realm(kvm);
+		break;
 	case KVM_CAP_SET_GUEST_DEBUG2:
 		return KVM_GUESTDBG_VALID_MASK;
 	case KVM_CAP_ARM_SET_DEVICE_ADDR:
@@ -391,10 +393,10 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 		r = cpus_have_final_cap(ARM64_HAS_HCR_NV1);
 		break;
 	case KVM_CAP_GUEST_DEBUG_HW_BPS:
-		r = get_num_brps();
+		r = kvm_is_realm(kvm) ? 0 : get_num_brps();
 		break;
 	case KVM_CAP_GUEST_DEBUG_HW_WPS:
-		r = get_num_wrps();
+		r = kvm_is_realm(kvm) ? 0 : get_num_wrps();
 		break;
 	case KVM_CAP_ARM_PMU_V3:
 		r = kvm_supports_guest_pmuv3();
-- 
2.43.0


