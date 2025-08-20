Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513E7CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 20:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5oPyiDB/53w/CRfP1moEAE6TI5Pb990V/JJmWOvCnE=; b=pw4xqtnoZnAMc50pVSi72eGi1W
	sTn+9NQWwIqVCjscc86uykIRchzTmk/HgEF1cksoTbmI6UasF4pQPV6uBD+XS59soSfabv83XaywZ
	AW8oi0nOGtyJxfde7Q/7A4Qyu5RaHGKyc1zNajE+aIrqhVtfE5sxSAXTKy9TXfjLUXeeOf5cNKmgE
	Mx5UaxnDYiOp79tX7mZvQDzqiEeIfb5qj4kpVwtJ4d0pIoaYaNU9vEbbkZeuBXOq71K80htyrsDVP
	wPep8MtWAfb/xwtwIFem3stiTHCLMXNHYNIDJScF6cVbm2qugfyC/aEz5mCvTiMKfq8FRKyZeSFwB
	z0YJ+iNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uopkR-0000000Ert1-0sks;
	Wed, 20 Aug 2025 20:49:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokGp-0000000EAQA-14xQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 14:58:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 628421D31;
	Wed, 20 Aug 2025 07:58:26 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.2.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5641F3F738;
	Wed, 20 Aug 2025 07:58:29 -0700 (PDT)
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
Subject: [PATCH v10 17/43] arm64: RME: Handle RMI_EXIT_RIPAS_CHANGE
Date: Wed, 20 Aug 2025 15:55:37 +0100
Message-ID: <20250820145606.180644-18-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820145606.180644-1-steven.price@arm.com>
References: <20250820145606.180644-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_075835_379163_786A94F8 
X-CRM114-Status: GOOD (  18.69  )
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

The guest can request that a region of it's protected address space is
switched between RIPAS_RAM and RIPAS_EMPTY (and back) using
RSI_IPA_STATE_SET. This causes a guest exit with the
RMI_EXIT_RIPAS_CHANGE code. We treat this as a request to convert a
protected region to unprotected (or back), exiting to the VMM to make
the necessary changes to the guest_memfd and memslot mappings. On the
next entry the RIPAS changes are committed by making RMI_RTT_SET_RIPAS
calls.

The VMM may wish to reject the RIPAS change requested by the guest. For
now it can only do with by no longer scheduling the VCPU as we don't
currently have a usecase for returning that rejection to the guest, but
by postponing the RMI_RTT_SET_RIPAS changes to entry we leave the door
open for adding a new ioctl in the future for this purpose.

Signed-off-by: Steven Price <steven.price@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
Changes since v8:
 * Make use of ripas_change() from a previous patch to implement
   realm_set_ipa_state().
 * Update exit.ripas_base after a RIPAS change so that, if instead of
   entering the guest we exit to user space, we don't attempt to repeat
   the RIPAS change (triggering an error from the RMM).
Changes since v7:
 * Rework the loop in realm_set_ipa_state() to make it clear when the
   'next' output value of rmi_rtt_set_ripas() is used.
New patch for v7: The code was previously split awkwardly between two
other patches.
---
 arch/arm64/kvm/rme.c | 46 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
index a8ea469a9e3b..22168e8d8db7 100644
--- a/arch/arm64/kvm/rme.c
+++ b/arch/arm64/kvm/rme.c
@@ -733,6 +733,21 @@ static int ripas_change(struct kvm *kvm,
 	return 0;
 }
 
+static int realm_set_ipa_state(struct kvm_vcpu *vcpu,
+			       unsigned long start,
+			       unsigned long end,
+			       unsigned long ripas,
+			       unsigned long *top_ipa)
+{
+	struct kvm *kvm = vcpu->kvm;
+	int ret = ripas_change(kvm, vcpu, start, end, RIPAS_SET, top_ipa);
+
+	if (ripas == RMI_EMPTY && *top_ipa != start)
+		realm_unmap_private_range(kvm, start, *top_ipa, false);
+
+	return ret;
+}
+
 static int realm_init_ipa_state(struct kvm *kvm,
 				unsigned long ipa,
 				unsigned long end)
@@ -940,6 +955,34 @@ void kvm_destroy_realm(struct kvm *kvm)
 	kvm_free_stage2_pgd(&kvm->arch.mmu);
 }
 
+static void kvm_complete_ripas_change(struct kvm_vcpu *vcpu)
+{
+	struct kvm *kvm = vcpu->kvm;
+	struct realm_rec *rec = &vcpu->arch.rec;
+	unsigned long base = rec->run->exit.ripas_base;
+	unsigned long top = rec->run->exit.ripas_top;
+	unsigned long ripas = rec->run->exit.ripas_value;
+	unsigned long top_ipa;
+	int ret;
+
+	do {
+		kvm_mmu_topup_memory_cache(&vcpu->arch.mmu_page_cache,
+					   kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu));
+		write_lock(&kvm->mmu_lock);
+		ret = realm_set_ipa_state(vcpu, base, top, ripas, &top_ipa);
+		write_unlock(&kvm->mmu_lock);
+
+		if (WARN_RATELIMIT(ret && ret != -ENOMEM,
+				   "Unable to satisfy RIPAS_CHANGE for %#lx - %#lx, ripas: %#lx\n",
+				   base, top, ripas))
+			break;
+
+		base = top_ipa;
+	} while (base < top);
+
+	rec->run->exit.ripas_base = base;
+}
+
 /*
  * kvm_rec_pre_enter - Complete operations before entering a REC
  *
@@ -965,6 +1008,9 @@ int kvm_rec_pre_enter(struct kvm_vcpu *vcpu)
 		for (int i = 0; i < REC_RUN_GPRS; i++)
 			rec->run->enter.gprs[i] = vcpu_get_reg(vcpu, i);
 		break;
+	case RMI_EXIT_RIPAS_CHANGE:
+		kvm_complete_ripas_change(vcpu);
+		break;
 	}
 
 	return 1;
-- 
2.43.0


