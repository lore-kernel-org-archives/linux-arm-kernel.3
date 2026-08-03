Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65490C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 13:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eazYZp0fl5gOv2055RbbjKKBFnOeFCsoHy6lv3nOdQA=; b=XjlNAwoAcHLy9ff4AQKJUqeTuP
	DINFfJ+0nasJzyBBvIUS4DVRls2IImJ6pECLYZ8VLF4+vjiiXCQ1t5FxfNbUDitbl6oTdyuATagNy
	8s8V2xkFb7kIs3kpsjrsebzX6sQcK9f1jFUBZyyIYqowHHMPqFd+FewnwA3K7/dfS6JRevhu+I0yq
	t33zcmSjGjSCv1Dv6CFmBuKC0aF77Aq72Yl2S3up5e1c3NUUrTOl5FOxU39K/dOYv53sSLUG5nqq5
	rBTzrxNP7hZcVgN368tKzNxkVR7c28ZVn89zyLjpkB1p4mIY4+uFCf53+mvNHvzxMR6TOy3W1tn84
	CeDBE60Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqt0X-0000000HELh-44Xc;
	Mon, 03 Aug 2026 13:47:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqt0V-0000000HEJ0-3ADF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 13:47:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0C2F1476;
	Mon,  3 Aug 2026 06:47:02 -0700 (PDT)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.25.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42F073F66F;
	Mon,  3 Aug 2026 06:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785764826; bh=f5XF4TndoxoVxH50VEJOC2RYRGtrrvhd8+1pRFIhR/0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fJKmpKXhuohGrp+3530yeKrJT8csfLjS8y+WM81FheaAhbBObS+HTTmpyOPHsyN/Q
	 lxjnqi59afiuuWgqyqp8XMuWOTxf8nVkgBF7I31tYQNp5KgYNh1VqpduBnXt8VlHOu
	 OrhjHSsvfZbniqZnMDiulGx9pVTcoAk23iHUyph8=
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
	WeiLin.Chang@arm.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Steven Price <steven.price@arm.com>
Subject: [PATCH v16 36/45] KVM: arm64: CCA: Allow checking SVE on VM instance
Date: Mon,  3 Aug 2026 14:43:52 +0100
Message-ID: <20260803134403.80630-37-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803134403.80630-1-steven.price@arm.com>
References: <20260803134403.80630-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_064707_885721_BF31F8A9 
X-CRM114-Status: GOOD (  10.06  )
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
index 0fb685004d5c..13933f0e555d 100644
--- a/arch/arm64/include/asm/kvm_rmi.h
+++ b/arch/arm64/include/asm/kvm_rmi.h
@@ -98,6 +98,8 @@ struct realm_rec {
 void kvm_init_rmi(void);
 u32 kvm_rmm_ipa_limit(void);
 
+bool kvm_rmi_supports_sve(void);
+
 int kvm_init_realm(struct kvm *kvm);
 int kvm_activate_realm(struct kvm *kvm);
 void kvm_destroy_realm(struct kvm *kvm);
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 96e536d2dda8..3242108be7c5 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -151,6 +151,8 @@ static bool kvm_realm_ext_allowed(long ext)
 	case KVM_CAP_ARM_RMI:
 	case KVM_CAP_SYNC_MMU:
 		return true;
+	case KVM_CAP_ARM_SVE:
+		return kvm_rmi_supports_sve();
 	}
 	return false;
 }
diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index 904df7c7245d..0d46768022df 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -26,6 +26,11 @@ static bool rmi_has_feature(int reg, unsigned long feature)
 	return !!u64_get_bits(rmi_feat_reg(reg), feature);
 }
 
+bool kvm_rmi_supports_sve(void)
+{
+	return rmi_has_feature(0, RMI_FEATURE_REGISTER_0_SVE);
+}
+
 u32 kvm_rmm_ipa_limit(void)
 {
 	return u64_get_bits(rmi_feat_reg(0), RMI_FEATURE_REGISTER_0_S2SZ);
-- 
2.43.0


