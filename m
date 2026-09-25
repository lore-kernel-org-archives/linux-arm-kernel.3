Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E454BC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 09:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1unqHrpc5llujFHQcQYXnYI2ySFWDNgpy8bvlTBt+k=; b=2QPtU4x9Qfn6QMSLRuuFFWq6a8
	O9gfuGW2iO8DbQHcXrdLCKpCpwozY6L6Uf7A6/rxlu4QvtOGP6HbaIz5KG8wUZCG+bvS9iF8Jw9H5
	C54oIhowTAQC+PSMBK8/rnleAs9LDFcW5oCh0xnDvM8L7rfgA5/BwW84dMxYRuHS7AHonOs8Wkj4J
	6w3ET+6LVhfeyoGlbkI7o7E72rznvqxJ//SFtNlSvqlc1IOyQOc+1g7dyf9+cm0um10LD7GzZMZEC
	fPnyeSyiVvVt/IzP9EjzjTqLH0QlLrXIwzGOMF4gPsW7PaSs5GIF1nmqgTFPilvnMKlrPF07Ga3HJ
	iWYndpzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1tA-0000000Cy8z-268u;
	Fri, 25 Sep 2026 09:06:40 +0000
Received: from out-192.mta0.migadu.com ([2001:41d0:1004:224b::c0] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1st-0000000Cy3b-19BU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 09:06:25 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=uT67jQLLkVIaTp0qSTH277698A/g5o9SVMksMSSr6LM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790327181; v=1; x=1790931981;
 b=u4ji/SGuK7WT3Xkdo6yolw5trjxl5lo25MrWKrgRJqzaL5rzjwhe4epnBovhQT7cgx3gnBR/
 nbULNmo6uHfdveaEC9rAkOTEDzKuaULMoZ3DkU96NOFC8ZTdFH+2wXCMrU8c98YsYTMtt0VRPJ/
 oX29T6h8m/Cu7qCL6fS55apA=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 784084d02c7ed006;
	Fri, 25 Sep 2026 09:06:21 +0000
X-Mizu-Trace-ID: 784084d02c7ed006
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Quentin Perret <qperret@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/4] KVM: arm64: Clear HCR_EL2.RW for 32-bit non-protected vCPUs
Date: Fri, 25 Sep 2026 10:06:17 +0100
Message-Id: <20260925090619.852995-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260925090619.852995-1-fuad.tabba@linux.dev>
References: <20260925090619.852995-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_020623_450569_C89F06EE 
X-CRM114-Status: UNSURE (   9.85  )
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

In pKVM, KVM_RUN on a vCPU created with KVM_ARM_VCPU_EL1_32BIT fails
with KVM_EXIT_FAIL_ENTRY. pkvm_vcpu_reset_hcr(), pKVM's EL2 counterpart
of vcpu_set_hcr(), never clears HCR_EL2.RW, so the first ERET into the
vCPU is an illegal exception return. Protected VMs are AArch64-only, so
only non-protected VMs are affected.

Clear RW for 32-bit vCPUs. The vCPU's features come from the host, and
on a CPU without AArch32 EL1 a cleared RW would make EL2 switch
registers that are UNDEFINED there. Clear it only when the system has
AArch32 EL1, the same check system_supported_vcpu_features() makes on
the host.

Fixes: b56680de9c648 ("KVM: arm64: Initialize trap register values in hyp in pKVM")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 459bd9eb7e4bc..affc9595fda20 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -54,6 +54,14 @@ static void pkvm_vcpu_reset_hcr(struct kvm_vcpu *vcpu)
 	else
 		vcpu->arch.hcr_el2 |= HCR_TID2;
 
+	/*
+	 * At EL2, vcpu_el1_is_32bit() reads HCR_EL2.RW, and EL2 switches the
+	 * *32_EL2 registers when it returns true; they're UNDEFINED without AArch32 EL1.
+	 */
+	if (vcpu_has_feature(vcpu, KVM_ARM_VCPU_EL1_32BIT) &&
+	    cpus_have_final_cap(ARM64_HAS_32BIT_EL1))
+		vcpu->arch.hcr_el2 &= ~HCR_RW;
+
 	if (vcpu_has_ptrauth(vcpu))
 		vcpu->arch.hcr_el2 |= (HCR_API | HCR_APK);
 
-- 
2.39.5


