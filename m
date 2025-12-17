Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F325D6552C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NK/7x8OJTP1Ou6/LmQQ7UJ/utX5dh0TaiSojaZ85fnk=; b=k8naigNZXJXSrR+qSCjXeJS2Ry
	goBP/qCpBaMG7GmJpe35ZTlm6OZvwv9G3b4vByopIEqU06DtJeMlteKJwO9yMTdKS9CctxXdGFYA/
	wXB1OOoxPY4/KmOBzGhKklra7OeFcUOaMBz89VZ3+Ycfr21+KMD6VDv3S7y4psnHwlop4stVRLij6
	y9tQYmkNDRoTEImdYaE8+PrBnBjCHmz9cRTCy6CN2O8Keun6+1WNxU5sHMl6Rr7GnnlKBzz00VxQv
	4NUAZu725ViUEMIE2m6zsUlaR/Z0vQT8sgoA/Cjlu22f5PoyOn4K04IjQP1jCGL0j2AUSrKOd59nY
	4HivFp4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoYF-00000006YL8-0byv;
	Wed, 17 Dec 2025 10:14:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoY2-00000006Y8L-2o10
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 10:14:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF2FD1688;
	Wed, 17 Dec 2025 02:14:14 -0800 (PST)
Received: from e122027.arm.com (unknown [10.57.45.201])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5AB873F73B;
	Wed, 17 Dec 2025 02:14:17 -0800 (PST)
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
Subject: [PATCH v12 32/46] arm64: RMI: Allow checking SVE on VM instance
Date: Wed, 17 Dec 2025 10:11:09 +0000
Message-ID: <20251217101125.91098-33-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217101125.91098-1-steven.price@arm.com>
References: <20251217101125.91098-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_021422_794899_3D5C49FA 
X-CRM114-Status: UNSURE (   8.30  )
X-CRM114-Notice: Please train this message.
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

Given we have different types of VMs supported, check the
support for SVE for the given instance of the VM to accurately
report the status.

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Steven Price <steven.price@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Joey Gouly <joey.gouly@arm.com>
---
Changes since v10:
 * RME->RMI renaming.
 * Adapt to move CAP check to kvm_realm_ext_allowed().
---
 arch/arm64/include/asm/kvm_rmi.h |  2 ++
 arch/arm64/kvm/arm.c             |  2 ++
 arch/arm64/kvm/rmi.c             | 10 ++++++++++
 3 files changed, 14 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
index 77da297ca09d..82280c138935 100644
--- a/arch/arm64/include/asm/kvm_rmi.h
+++ b/arch/arm64/include/asm/kvm_rmi.h
@@ -89,6 +89,8 @@ void kvm_init_rmi(void);
 u32 kvm_realm_ipa_limit(void);
 u32 kvm_realm_vgic_nr_lr(void);
 
+bool kvm_rmi_supports_sve(void);
+
 int kvm_init_realm_vm(struct kvm *kvm);
 int kvm_activate_realm(struct kvm *kvm);
 void kvm_destroy_realm(struct kvm *kvm);
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 403f9119543e..f8255de92902 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -342,6 +342,8 @@ static bool kvm_realm_ext_allowed(long ext)
 	case KVM_CAP_ARM_PTRAUTH_GENERIC:
 	case KVM_CAP_ARM_RMI:
 		return true;
+	case KVM_CAP_ARM_SVE:
+		return kvm_rmi_supports_sve();
 	}
 	return false;
 }
diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index 5f50566c701d..7ef5d7f48d0b 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -33,6 +33,16 @@ static inline unsigned long rmi_rtt_level_mapsize(int level)
 	return (1UL << RMM_RTT_LEVEL_SHIFT(level));
 }
 
+static bool rmi_has_feature(unsigned long feature)
+{
+	return !!u64_get_bits(rmm_feat_reg0, feature);
+}
+
+bool kvm_rmi_supports_sve(void)
+{
+	return rmi_has_feature(RMI_FEATURE_REGISTER_0_SVE_EN);
+}
+
 static int rmi_check_version(void)
 {
 	struct arm_smccc_res res;
-- 
2.43.0


