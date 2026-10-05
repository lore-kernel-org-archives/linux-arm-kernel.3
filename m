Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367FCCA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87VHJ2do7iSY19oCjvGc29fEV8iGJN2HzDxV11gbBZI=; b=oguKhWNFRQ98MBBeWr+7SrpQz1
	BiiQ9PGw0NHqiN8wQhhiEb964uDdVlSUUveMCorbxU/kpOZjS0caNvHtJ/kGA3jKQJNMDrjAdb7LS
	BW8AdeCWpikYNmx2emyEtG5ArryRKR12y7q4abl2ewKqQRj3IpMc3jUIM3U8CQaFNQc+3peNQa1et
	ojFD2YTAgprNK3MrsAA4WQ+AhnZA2HwzAKekhPr9vhcFxd+ILg52wmyj1ueVSRdhhqHvcYLBNsMS3
	andVDKQYZNFOe0sp/1NA/okFOnIiDEsCMFBPxVTdK1yVS6LhRjctsmGYKAQVxqSarCfSBOVFMdqY4
	wKurSsdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDegb-0000000Fwj8-4042;
	Mon, 05 Oct 2026 09:08:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDegW-0000000FwfO-3qr7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 09:08:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F8FC152B;
	Mon,  5 Oct 2026 02:08:33 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6EF8F3F66F;
	Mon,  5 Oct 2026 02:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791191316; bh=95tX0g47qDlvblS2Z+zxuL6zEuph5wLOWbRzPVg1CJQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d/4IR5qMtJ2fEgcQloh6yk2kxJLlKqJ+BsLqBrR9teyHzJGN6z7x4t8qDPmEuiJF+
	 FRvZCkRfJQZpuUQev3fZxDsLna/HHksPsNZEktBza/z3xBBXqGdSln6ubdz4qtFLSy
	 9AqYiuFbJrJErUnVHXmLZsNkE4R46dTLt6e+bsNw=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	sudeep.holla@arm.com,
	jonathan.cameron@oss.qualcomm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v22 09/23] KVM: arm64: Prevent unsupported vcpu features for VM types
Date: Mon,  5 Oct 2026 10:07:40 +0100
Message-ID: <20261005090754.2140522-10-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005090754.2140522-1-suzuki.poulose@arm.com>
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_020836_993486_987B8511 
X-CRM114-Status: GOOD (  10.88  )
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

Prevent unsupported VCPU features for the protected VCPUs. Realms and pVMs
not support 32bit EL1 or NV yet. pKVM doesn't rely on the host vcpu
features and it clears the unsupported features while hyp_vcpu is
initialised. Block the features early in the vcpu init if we detect
incompatible features.

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/kvm/arm.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index f31d31fa27ad9..9c2ef7ca6a961 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1668,11 +1668,12 @@ int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *irq_level,
 	return -EINVAL;
 }
 
-static unsigned long system_supported_vcpu_features(void)
+static unsigned long system_supported_vcpu_features(struct kvm_vcpu *vcpu)
 {
 	unsigned long features = KVM_VCPU_VALID_FEATURES;
 
-	if (!cpus_have_final_cap(ARM64_HAS_32BIT_EL1))
+	if (vcpu_is_protected(vcpu) ||
+	    !cpus_have_final_cap(ARM64_HAS_32BIT_EL1))
 		clear_bit(KVM_ARM_VCPU_EL1_32BIT, &features);
 
 	if (!kvm_supports_guest_pmuv3()) {
@@ -1688,7 +1689,8 @@ static unsigned long system_supported_vcpu_features(void)
 		clear_bit(KVM_ARM_VCPU_PTRAUTH_GENERIC, &features);
 	}
 
-	if (!cpus_have_final_cap(ARM64_HAS_NESTED_VIRT))
+	if (vcpu_is_protected(vcpu) ||
+	    !cpus_have_final_cap(ARM64_HAS_NESTED_VIRT))
 		clear_bit(KVM_ARM_VCPU_HAS_EL2, &features);
 
 	return features;
@@ -1708,7 +1710,7 @@ static int kvm_vcpu_init_check_features(struct kvm_vcpu *vcpu,
 			return -ENOENT;
 	}
 
-	if (features & ~system_supported_vcpu_features())
+	if (features & ~system_supported_vcpu_features(vcpu))
 		return -EINVAL;
 
 	/*
-- 
2.43.0


