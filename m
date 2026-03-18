Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54AD103E19B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZnoia0dP39bfnNvAU7EVfSpEAUul1c4RnLCozece3g=; b=1kE/7ZFUQHB4eZW3pu4oS5dCmm
	FdnbltGnaipZlT3v2EX5YxY62V7IBuim851DQvAcJY/L49JcXiG9SWbNQjqf9qfDBYp6234nkAqrR
	L0xoiyQ91PVgwC22aH7AXjz6YaeMFe9ky0HBT+qMHACEKb/FnfGlc/SHgcyOFxErCEybtHo4+sJw9
	nVa1vEEoShgH9nftDFD7MogUh2/VmYAwHTjiVKuZ4Y+VtrYfrhA89HO4ysBDCA9GIrxxM/6vA6n8N
	4RPtNDlwX/8bmiGmssdzO2ajuyWucWuJ3eYYn3alMOS1t0eANpfIYgtbN84fMJUSUlD7BIKLDrMsh
	YaS520zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tGl-00000008qXr-3VFO;
	Wed, 18 Mar 2026 15:57:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tG9-00000008pr3-1n3F
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 15:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GZnoia0dP39bfnNvAU7EVfSpEAUul1c4RnLCozece3g=; b=j0LkOOfCUKQp+9LKtP1TKZzN9u
	POKgurBI+H4hKguaqaxjRwOhDgglmIe69CnJZZcR1F3mDKeyzd9okyBsRzAVpAI8u1xmPrTELC+32
	l7SIi16O/xFwIkS7ZhR8iQ9LYC5/2kgoEZkVwqEYIyW/+AlGK3uIqmjjt5iQQfbj570x+d867bZJp
	eP/a6h/2CemS5Tg3xZe8KmL+fGRUr7V1aEyQpUMbeuNxnHOLYWh7Zf504NZ/OSLRkStZM3qAzmeg1
	n9OX99PisIwi0/1K+nw1cLKSbKIOtmb6gPV0CPlEoEW601iivLPManooferu+C7jbkZxnqcYpmHDG
	IHCdd6FQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tG5-0000000Bdrd-3giq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:56:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7ACC1201B;
	Wed, 18 Mar 2026 08:56:26 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.61.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 333BE3F73B;
	Wed, 18 Mar 2026 08:56:29 -0700 (PDT)
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
Subject: [PATCH v13 35/48] arm64: RMI: Allow checking SVE on VM instance
Date: Wed, 18 Mar 2026 15:53:59 +0000
Message-ID: <20260318155413.793430-36-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318155413.793430-1-steven.price@arm.com>
References: <20260318155413.793430-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_155634_324369_504FAD46 
X-CRM114-Status: UNSURE (   8.93  )
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
 arch/arm64/include/asm/kvm_rmi.h | 2 ++
 arch/arm64/kvm/arm.c             | 2 ++
 arch/arm64/kvm/rmi.c             | 5 +++++
 3 files changed, 9 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_rmi.h b/arch/arm64/include/asm/kvm_rmi.h
index 1ee5ed0f5ab2..d6cf87de099b 100644
--- a/arch/arm64/include/asm/kvm_rmi.h
+++ b/arch/arm64/include/asm/kvm_rmi.h
@@ -87,6 +87,8 @@ struct realm_rec {
 void kvm_init_rmi(void);
 u32 kvm_realm_ipa_limit(void);
 
+bool kvm_rmi_supports_sve(void);
+
 int kvm_init_realm_vm(struct kvm *kvm);
 int kvm_activate_realm(struct kvm *kvm);
 void kvm_destroy_realm(struct kvm *kvm);
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 7d92ddb06460..3e6f1e810921 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -388,6 +388,8 @@ static bool kvm_realm_ext_allowed(long ext)
 	case KVM_CAP_ARM_PTRAUTH_GENERIC:
 	case KVM_CAP_ARM_RMI:
 		return true;
+	case KVM_CAP_ARM_SVE:
+		return kvm_rmi_supports_sve();
 	}
 	return false;
 }
diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index e56c8af2ad61..7cc6dc14d325 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -33,6 +33,11 @@ static bool rmi_has_feature(unsigned long feature)
 	return !!u64_get_bits(rmm_feat_reg0, feature);
 }
 
+bool kvm_rmi_supports_sve(void)
+{
+	return rmi_has_feature(RMI_FEATURE_REGISTER_0_SVE);
+}
+
 static int rmi_check_version(void)
 {
 	struct arm_smccc_res res;
-- 
2.43.0


