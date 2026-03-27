Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E18E10ED67C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=suqUmV3t0TCfxqOUJuk6ssfZFyY8qGljIeleXvxkicA=; b=4DEnBwZl9FLOZmJAd6C/vOz+ox
	KeTEFZ23qoYf2425c6M5TSKinCA8kuM37Kz3BQpOVFmfgooh0cT2IoCBK4A97ceywh3jgo0A/njZu
	C3uxScReroKFs92VgA6O58Rp2dd6b62taDLCE9x1jZ4wTj2vptkYLAUrZ5gRRSgI8NY+HWSvn1LQG
	ok3U6D31VRHW5nC4D/ALajmaDhkN6anSFZ1aoFS09NEefCbJZQpfEojhb7Rncmz57oz2si4LO7dun
	x+89RamsyRqTJ7FKBXxh9s1PuRCP6F66wNcbEtVQU1dRXzrBwbww1jNUlHGauHX0DeF1I//8biwr+
	2mqrQuCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67kT-00000007VaB-2O3p;
	Fri, 27 Mar 2026 14:01:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67kK-00000007VWW-1x8R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 14:01:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DB46F6132B;
	Fri, 27 Mar 2026 14:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8BAFC2BCB0;
	Fri, 27 Mar 2026 14:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774620067;
	bh=GEg9qAdks1S+YwQJuBag8f327Zhp7USRaMcrpEgiyho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uOJCN+24HF1P8N3vOszHXVONmUqmtK0wysGXnU7XB/VHEaVFn7OGnOF++R5KlAye/
	 C7lssuZ3cUnsCRks66Dd8Nh+jwsgrV5qZPG9l8/DV/hepmlKM4xGQlSIUSt40UH+ws
	 ctD88G+YdjlyRwmKCEz8xIwSgVzKuzhPruC8oHxAP5XzpyWLfC2cl3X2X4EN4VyCVA
	 NcHPjz+nBqQRhv3K8AvYr7YOK00DFxe1tdhhqjr7EiyINpdTyX9iMB1wDmd0gCsAPP
	 0TJ1/Sn6vg2ZloSau50Hc1QG23ZLzCLolBBNAYI0TLYcP6sIJpTbAzhMSQSRA4nxyD
	 5iAYYhQXwUvhA==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v4 05/38] KVM: arm64: Don't advertise unsupported features for protected guests
Date: Fri, 27 Mar 2026 14:00:04 +0000
Message-ID: <20260327140039.21228-6-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327140039.21228-1-will@kernel.org>
References: <20260327140039.21228-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Both SVE and PMUv3 are treated as "restricted" features for protected
guests and attempts to access their corresponding architectural state
from a protected guest result in an undefined exception being injected
by the hypervisor.

Since these exceptions are unexpected and typically fatal for the guest,
don't advertise these features for protected guests.

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
Tested-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/kvm_pkvm.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 757076ad4ec9..7041e398fb4c 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -40,8 +40,6 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
 	case KVM_CAP_MAX_VCPU_ID:
 	case KVM_CAP_MSI_DEVID:
 	case KVM_CAP_ARM_VM_IPA_SIZE:
-	case KVM_CAP_ARM_PMU_V3:
-	case KVM_CAP_ARM_SVE:
 	case KVM_CAP_ARM_PTRAUTH_ADDRESS:
 	case KVM_CAP_ARM_PTRAUTH_GENERIC:
 		return true;
-- 
2.53.0.1018.g2bb0e51243-goog


