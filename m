Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05343C55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 13:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5tyAKbVCSJad9jskPcMTN2YsnmwyBDTKiRz/b8ExHiw=; b=0X+QFfBg6hbckfjdyuTsUSphvA
	M+XTMCGTJVIORIoLIL5571HyijMv/W7yzIlnl7R+YIp6iOVxX49biMmY2OBbMaTaxP3IMdMOmUEmX
	vcPY/QyThUr21TD9YOEEtvjxshu1aH1lGGTb9AQAvYqNMSv35K+cWb+VlXMhkQsD+hQFWAXXd5LIr
	LSEBjyd3ozvW1Uvady5gD476jaJzrnsmTUa/ciAmvpz1lONs06oXYAyfGtOZ+hJhN36sSxSZyA6n3
	JbdvYJ022PPIg1gLOxFVBkPfPP7PT2CvdP9AUL8M2wpTWnUfAScPRG4YYgPucasdfIhyGfuZLy9+R
	VpihM9Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqt0D-0000000HE1v-3SoA;
	Mon, 03 Aug 2026 13:46:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqt0B-0000000HE09-40EA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 13:46:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0C2F1476;
	Mon,  3 Aug 2026 06:46:42 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.25.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BBB873F66F;
	Mon,  3 Aug 2026 06:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785764807; bh=rE5FH9m6cgbxv4oXJ1XSPENbjK143njy6sCuV+SL+fo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ckVzX19es7E2Ac9HZIzWyIGBb0UzHKb0HeLvoqyl/wXBsBzXU7/zUXzLh4mmsAvX4
	 Wm246oY5mYIzCBXgMKG4ozQJ5tKXpAHRkweVj+5xPjNI/WM94dTBtrdz7+yvWPt5v8
	 PyzLiCgxjHUyFZW2jNGDGl+CiSG8LmHDkA3EOOhQ=
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
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [PATCH v16 32/45] KVM: arm64: CCA: Handle Realm PSCI requests
Date: Mon,  3 Aug 2026 14:43:48 +0100
Message-ID: <20260803134403.80630-33-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803134403.80630-1-steven.price@arm.com>
References: <20260803134403.80630-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_064648_093195_6DDB8559 
X-CRM114-Status: GOOD (  15.63  )
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

Some PSCI commands cause a REC exit and the host has to call
RMI_PSCI_COMPLETE to provide the status value to return to the guest.

Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Steven Price <steven.price@arm.com>
---
Changes since v15:
 * Adapt to new exit handling.
Changes since v14:
 * Dropped the support for providing the target REC for a PSCI call (as
   per v2.0-bet2 spec).
Changes since v13:
 * The ioctl KVM_ARM_VCPU_RMI_PSCI_COMPLETE has gone. The RMI call is
   made automatically just before entering the REC again.
Changes since v12:
 * Change return code for non-realms to -ENXIO to better represent that
   the ioctl is invalid for non-realms (checkpatch is insistent that
   "ENOSYS means 'invalid syscall nr' and nothing else").
Changes since v11:
 * RMM->RMI renaming.
Changes since v6:
 * Use vcpu_is_rec() rather than kvm_is_realm(vcpu->kvm).
 * Minor renaming/formatting fixes.
---
 arch/arm64/include/asm/kvm_rmi.h |  2 ++
 arch/arm64/kvm/rmi.c             | 38 ++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
index 967c0a6e8e9c..0fb685004d5c 100644
--- a/arch/arm64/include/asm/kvm_rmi.h
+++ b/arch/arm64/include/asm/kvm_rmi.h
@@ -123,6 +123,8 @@ int realm_map_ipa(struct kvm *kvm, phys_addr_t ipa,
 		  enum kvm_pgtable_prot prot,
 		  struct kvm_mmu_memory_cache *memcache);
 
+int realm_psci_complete(struct kvm_vcpu *source, unsigned long status);
+
 static inline bool kvm_realm_is_private_address(struct realm *realm,
 						unsigned long addr)
 {
diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index 3ef185bc8210..3f31ad25680f 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2023-2026 ARM Ltd.
  */
 
+#include <uapi/linux/psci.h>
 #include <linux/kvm_host.h>
 
 #include <asm/kvm_emulate.h>
@@ -120,6 +121,17 @@ static void free_rtt(phys_addr_t phys)
 	kvm_account_pgtable_pages(phys_to_virt(phys), -1);
 }
 
+int realm_psci_complete(struct kvm_vcpu *source, unsigned long status)
+{
+	long ret;
+
+	ret = rmi_psci_complete(source->arch.rec.rec_phys, status);
+	if (ret)
+		return -ENXIO;
+
+	return 0;
+}
+
 static long realm_rtt_create(struct realm *realm,
 			     unsigned long addr,
 			     int level,
@@ -1145,6 +1157,30 @@ static int kvm_complete_ripas_change(struct kvm_vcpu *vcpu)
 	return 1;
 }
 
+static int kvm_rec_complete_psci(struct kvm_vcpu *vcpu)
+{
+	struct rec_run *run = vcpu->arch.rec.run;
+	unsigned long status = PSCI_RET_DENIED;
+	unsigned long ret = vcpu_get_reg(vcpu, 0);
+	int r;
+
+	switch (run->exit.gprs[0]) {
+	case PSCI_0_2_FN64_CPU_ON: {
+		if (ret != PSCI_RET_SUCCESS &&
+		    ret != PSCI_RET_ALREADY_ON)
+			status = PSCI_RET_DENIED;
+		else
+			status = PSCI_RET_SUCCESS;
+		break;
+	}
+	default:
+		return 1;
+	}
+
+	r = realm_psci_complete(vcpu, status);
+	return r ?: 1;
+}
+
 int kvm_rec_handle_request(struct kvm_vcpu *vcpu)
 {
 	struct realm_rec *rec = &vcpu->arch.rec;
@@ -1163,6 +1199,8 @@ int kvm_rec_handle_request(struct kvm_vcpu *vcpu)
 					vcpu_get_reg(vcpu, rt);
 		}
 		break;
+	case RMI_EXIT_PSCI:
+		return kvm_rec_complete_psci(vcpu);
 	case RMI_EXIT_RIPAS_CHANGE:
 		return kvm_complete_ripas_change(vcpu);
 	default:
-- 
2.43.0


