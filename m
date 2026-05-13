Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4462ECD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 13:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FajouZZwcKvIOzt5TSwpt2oH9Iprx4hsO5lRP6gaWME=; b=UQLYitPOpcqxvTnZymLIg3RlWP
	hPklOGrXtiuT1uWpnvEHZ2RwEkVV5BOCjHIYsfy44+RPGjfysdyFVNuxMW+prlnuuQLcnRN6HmuKE
	G0lET18aZmXSSCjW+4Ar1iNV+tmz+2fK+E0ca3kDDL9dyMLAt1VS371piQC+mS7DwzQg1QOHlbwrM
	DwlhuJ6oaEp98C0e8k1HMi9+NSR6VhJgcYTGFTMYRnktvISWv4H3u9Ip4BpvuaYMqL6Nd8TNCEkZd
	dCO5Wwf11oTYhmxBRgknSrnjxAvAMUmEQPRc1Wju3cWFfsUyRlz45+t0eF5ZWAG8ytfgJHs6FJDS4
	nGxxFLNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9We-00000002hYx-0UbJ;
	Wed, 13 May 2026 13:21:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9Wc-00000002hWl-46zv
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 May 2026 13:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FajouZZwcKvIOzt5TSwpt2oH9Iprx4hsO5lRP6gaWME=; b=ht0A2SslgtjJhtyvcV6or3Y0TI
	z8VTfnaDd7a55W6CihNvRsEItPiA/T6yLtQp/QMD+e03/NPtx0EUliP80FOyPxKECmMGgA+w3V4lf
	VmuKTB15ZcdWu2lzDBaR2fAiNzeTjwxxUlIbLT+1lSxlZF4xrjtX+8ANFJ5OloILaw/gOtRoCemAK
	z7Bv2TChlUxc9ilqkYvXzJQz2CrlIORiKTFejb8DkVQJVvEvyuGHlnE2IBNgbXhX4/zvg1jjoZugZ
	5SzGihUJySRtBcM/mJE18Zb+iWzXu7HRufLdEUsFMNgm9vBG4ZKKiRSbb7FLNN9BL7uLPyBahxbjs
	IL4SBJmA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN9WV-0000000HZXl-14r4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 13:21:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 986802720;
	Wed, 13 May 2026 06:21:08 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.68.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC1A53F905;
	Wed, 13 May 2026 06:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778678473; bh=4ODG+RJ6mRMpfVkQFhDekOIOTPJsfJFUdETkqCGtCq4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qv7o1D1pQQMMG4cNvwqQuHPlMFnoHUqBtfHQtBwB2hOztFyfXUK037oSAaWemDM2l
	 1s4tPABJDgfeEMPVhYuaMWe62e0gK4WJoRFC5va0XMNqFn4ZPfXRf/geIh24NExmNc
	 fGn8rpEQ87QicKlpyNjiRjytkr7kRN2wSQhI7GBs=
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
	Vishal Annapurve <vannapurve@google.com>,
	WeiLin.Chang@arm.com,
	Lorenzo.Pieralisi2@arm.com
Subject: [PATCH v14 32/44] KVM: arm64: Handle Realm PSCI requests
Date: Wed, 13 May 2026 14:17:40 +0100
Message-ID: <20260513131757.116630-33-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513131757.116630-1-steven.price@arm.com>
References: <20260513131757.116630-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_142115_914915_576ED221 
X-CRM114-Status: GOOD (  19.26  )
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

The RMM needs to be informed of the target REC when a PSCI call is made
with an MPIDR argument.

This requirement will be removed in a future release of the RMM 2.0
specification but is still required for v2.0-bet1.

Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Steven Price <steven.price@arm.com>
---
Chanegs since v13:
 * The ioctl KVM_ARM_VCPU_RMI_PSCI_COMPLETE has gone. The RMI call is
   made automatically just before entering the REC again.
Changes since v12:
 * Chance return code for non-realms to -ENXIO to better represent that
   the ioctl is invalid for non-realms (checkpatch is insistent that
   "ENOSYS means 'invalid syscall nr' and nothing else").
Changes since v11:
 * RMM->RMI renaming.
Changes since v6:
 * Use vcpu_is_rec() rather than kvm_is_realm(vcpu->kvm).
 * Minor renaming/formatting fixes.
---
 arch/arm64/include/asm/kvm_rmi.h |  3 ++
 arch/arm64/kvm/psci.c            | 15 ++++++++-
 arch/arm64/kvm/rmi.c             | 58 ++++++++++++++++++++++++++++++++
 3 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
index b65cfec10dee..eacf82a7467d 100644
--- a/arch/arm64/include/asm/kvm_rmi.h
+++ b/arch/arm64/include/asm/kvm_rmi.h
@@ -109,6 +109,9 @@ int realm_map_non_secure(struct realm *realm,
 			 unsigned long size,
 			 enum kvm_pgtable_prot prot,
 			 struct kvm_mmu_memory_cache *memcache);
+int realm_psci_complete(struct kvm_vcpu *source,
+			struct kvm_vcpu *target,
+			unsigned long status);
 
 static inline bool kvm_realm_is_private_address(struct realm *realm,
 						unsigned long addr)
diff --git a/arch/arm64/kvm/psci.c b/arch/arm64/kvm/psci.c
index 3b5dbe9a0a0e..a2cd55dc7b5b 100644
--- a/arch/arm64/kvm/psci.c
+++ b/arch/arm64/kvm/psci.c
@@ -103,7 +103,6 @@ static unsigned long kvm_psci_vcpu_on(struct kvm_vcpu *source_vcpu)
 
 	reset_state->reset = true;
 	kvm_make_request(KVM_REQ_VCPU_RESET, vcpu);
-
 	/*
 	 * Make sure the reset request is observed if the RUNNABLE mp_state is
 	 * observed.
@@ -142,6 +141,20 @@ static unsigned long kvm_psci_vcpu_affinity_info(struct kvm_vcpu *vcpu)
 	/* Ignore other bits of target affinity */
 	target_affinity &= target_affinity_mask;
 
+	if (vcpu_is_rec(vcpu)) {
+		struct kvm_vcpu *target_vcpu;
+
+		/* RMM supports only zero affinity level */
+		if (lowest_affinity_level != 0)
+			return PSCI_RET_INVALID_PARAMS;
+
+		target_vcpu = kvm_mpidr_to_vcpu(kvm, target_affinity);
+		if (!target_vcpu)
+			return PSCI_RET_INVALID_PARAMS;
+
+		return PSCI_RET_SUCCESS;
+	}
+
 	/*
 	 * If one or more VCPU matching target affinity are running
 	 * then ON else OFF
diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index 761b38a4071c..2b03e962ee41 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2023-2025 ARM Ltd.
  */
 
+#include <uapi/linux/psci.h>
 #include <linux/kvm_host.h>
 
 #include <asm/kvm_emulate.h>
@@ -127,6 +128,25 @@ static void free_rtt(phys_addr_t phys)
 	kvm_account_pgtable_pages(phys_to_virt(phys), -1);
 }
 
+int realm_psci_complete(struct kvm_vcpu *source, struct kvm_vcpu *target,
+			unsigned long status)
+{
+	int ret;
+
+	/*
+	 * XXX: RMM-v2.0 doesn't require the target REC address for completing
+	 * PSCI requests. Temporary hack until RMM implementation catches up
+	 * to the full spec.
+	 */
+	ret = rmi_psci_complete(virt_to_phys(source->arch.rec.rec_page),
+				virt_to_phys(target->arch.rec.rec_page),
+				status);
+	if (ret)
+		return -EINVAL;
+
+	return 0;
+}
+
 static int realm_rtt_create(struct realm *realm,
 			    unsigned long addr,
 			    int level,
@@ -1004,6 +1024,41 @@ static void kvm_complete_ripas_change(struct kvm_vcpu *vcpu)
 	rec->run->exit.ripas_base = base;
 }
 
+static void kvm_rec_complete_psci(struct kvm_vcpu *vcpu)
+{
+	struct rec_run *run = vcpu->arch.rec.run;
+	unsigned long status = PSCI_RET_DENIED;
+	unsigned long ret = vcpu_get_reg(vcpu, 0);
+	struct kvm_vcpu *target;
+
+	switch (run->exit.gprs[0]) {
+	/*
+	 * XXX: RMM-v2.0 doesn't cause RMI_EXIT_PSCI for AFFINITY_INFO
+	 * Temporary hack until tf-RMM gets the REC to MPIDR mapping via
+	 * RD Auxiliary granules.
+	 * For now always report SUCCESS
+	 */
+	case PSCI_0_2_FN64_AFFINITY_INFO:
+		status = PSCI_RET_SUCCESS;
+		break;
+	case PSCI_0_2_FN64_CPU_ON: {
+		if (ret != PSCI_RET_SUCCESS &&
+		    ret != PSCI_RET_ALREADY_ON)
+			status = PSCI_RET_DENIED;
+		else
+			status = PSCI_RET_SUCCESS;
+		break;
+	}
+	default:
+		return;
+	}
+
+	target = kvm_mpidr_to_vcpu(vcpu->kvm, run->exit.gprs[1]);
+	/* RMM makes sure that we don't get RMI_EXIT_PSCI for invalid mpidrs */
+	if (target)
+		realm_psci_complete(vcpu, target, status);
+}
+
 /*
  * kvm_rec_pre_enter - Complete operations before entering a REC
  *
@@ -1028,6 +1083,9 @@ int kvm_rec_pre_enter(struct kvm_vcpu *vcpu)
 		for (int i = 0; i < REC_RUN_GPRS; i++)
 			rec->run->enter.gprs[i] = vcpu_get_reg(vcpu, i);
 		break;
+	case RMI_EXIT_PSCI:
+		kvm_rec_complete_psci(vcpu);
+		break;
 	case RMI_EXIT_RIPAS_CHANGE:
 		kvm_complete_ripas_change(vcpu);
 		break;
-- 
2.43.0


