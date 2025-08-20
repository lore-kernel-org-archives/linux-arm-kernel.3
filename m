Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3EBCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 18:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BtQOhDJDdpA03+d/8z21YcB9Smds3YGgfJ1KdE49oLs=; b=0N089JM9g7SX12rMx5tCLdezQl
	Xqmj9uze09Vt8AtqnF6B7Pd+S0x6Md9kJEfTdm0vC9bMdFJ22+QAEnBWdXzhXvDaQOA+Uzamy9R4l
	xyXf3r39SRfaRLihOc3ZP6io84pmwKdHo9fg2EAMQje0iNxPWnE4zxa9HozuCL88p3STcEfd3Ryk+
	hv3jvu9bodej0+vO/dsAHDCDMjPrVJwL2MYxEyJHPcYh0iuqyQO3hfOO+V6HFHISwjlY7c71oIOHS
	MqJwzO5pLrtsWpFyvLYLNJ3nGHXin55uHVOf1y62o0iHduvW60D/LeCgZ+n2+6qYZV53G3GQdO3wE
	IG1eTZ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uonSz-0000000EflF-0Xzy;
	Wed, 20 Aug 2025 18:23:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokIl-0000000EArN-38Ah
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 15:00:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FF7B2F27;
	Wed, 20 Aug 2025 08:00:27 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.2.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EFD343F738;
	Wed, 20 Aug 2025 08:00:30 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
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
	Vishal Annapurve <vannapurve@google.com>
Subject: [PATCH v10 43/43] KVM: arm64: Allow activating realms
Date: Wed, 20 Aug 2025 15:56:03 +0100
Message-ID: <20250820145606.180644-44-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820145606.180644-1-steven.price@arm.com>
References: <20250820145606.180644-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_080035_821758_1D5129B6 
X-CRM114-Status: GOOD (  12.10  )
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

Add the ioctl to activate a realm and set the static branch to enable
access to the realm functionality if the RMM is detected.

Signed-off-by: Steven Price <steven.price@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/kvm/rme.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
index 55ef3143a7b2..299473298720 100644
--- a/arch/arm64/kvm/rme.c
+++ b/arch/arm64/kvm/rme.c
@@ -1253,6 +1253,20 @@ static int kvm_init_ipa_range_realm(struct kvm *kvm,
 	return realm_init_ipa_state(kvm, addr, end);
 }
 
+static int kvm_activate_realm(struct kvm *kvm)
+{
+	struct realm *realm = &kvm->arch.realm;
+
+	if (kvm_realm_state(kvm) != REALM_STATE_NEW)
+		return -EINVAL;
+
+	if (rmi_realm_activate(virt_to_phys(realm->rd)))
+		return -ENXIO;
+
+	WRITE_ONCE(realm->state, REALM_STATE_ACTIVE);
+	return 0;
+}
+
 /* Protects access to rme_vmid_bitmap */
 static DEFINE_SPINLOCK(rme_vmid_lock);
 static unsigned long *rme_vmid_bitmap;
@@ -1400,6 +1414,9 @@ int kvm_realm_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap)
 		r = kvm_populate_realm(kvm, &args);
 		break;
 	}
+	case KVM_CAP_ARM_RME_ACTIVATE_REALM:
+		r = kvm_activate_realm(kvm);
+		break;
 	default:
 		r = -EINVAL;
 		break;
@@ -1725,5 +1742,5 @@ void kvm_init_rme(void)
 	if (rme_vmid_init())
 		return;
 
-	/* Future patch will enable static branch kvm_rme_is_available */
+	static_branch_enable(&kvm_rme_is_available);
 }
-- 
2.43.0


