Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8E5C9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 06:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTD43tRM/DvylWfM2IitGBwCyUTkrat+FRY5hw0PbE8=; b=syzlwHGTwnarM6MP+BqwIWB7Eu
	I8u7Va1Tw+suYfOszqu1J7/0OmlhnIfsMGaiJ7t44MV9/jAXKwm2nj51PJYB2Qcj1Alz2PZ8sGA3h
	XtPY8RgTGMCS7Be2dtbuOxTsphb7XJinLWB+SXr6AX4vIFO0G5cuLqsKafdOAlm7xQJ783IwCFfJ6
	A937WeYEYGgeOgbOSpNInmqKTthx580GuHulY8pQZpdGE5n2bom55gwOIucBYMEZvWYORVhhyYofp
	/nh4KL2qVRRJBmouSNkX/sHw3RSQhwHqZqvOYK5MN97pKg3zUU/ss5R73Nstlq7lBHhSloc9WHW79
	FOTLrAMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB58l-0000000HTc4-0tuW;
	Mon, 28 Sep 2026 06:47:07 +0000
Received: from out-109.mta0.migadu.com ([2001:41d0:1004:224b::6d] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB58S-0000000HTUb-04uh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 06:46:50 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=1jHpaWMldBRFaEmddqMc+nJNDn5a3aVbF5D1CXCVMl8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790578005; v=1; x=1791182805;
 b=pjYtaHUbGZbtRJLTbDMx9FU73tPnoVbM1E3j37u158wVrYTA+z+AsiSYFRaFo3USQYdqnVEV
 6R6mn+jiBFB9BuJhiJuhFZYXBXjPLviZFvdZ4v9DO9aaM7oVunowqXje/m14BbBtirZjpkGRymW
 pyfBup38iVAHFmZtfjG3tCuk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ffd1c6cc9a1d9028;
	Mon, 28 Sep 2026 06:46:45 +0000
X-Mizu-Trace-ID: ffd1c6cc9a1d9028
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
	Wei-Lin Chang <weilin.chang@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] KVM: arm64: Clear HCR_EL2.RW for 32-bit non-protected vCPUs
Date: Mon, 28 Sep 2026 07:46:41 +0100
Message-Id: <20260928064643.3265087-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260928064643.3265087-1-fuad.tabba@linux.dev>
References: <20260928064643.3265087-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_234648_195756_1C270E69 
X-CRM114-Status: GOOD (  10.93  )
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

pKVM keeps its own copy of each vCPU's HCR_EL2 at EL2, initialised with
RW set unconditionally. Nothing stops userspace from creating a
non-protected AArch32 VM, and with RW set, entering one of its vCPUs is
an illegal exception return: KVM_RUN fails with KVM_EXIT_FAIL_ENTRY.

Clear RW for a vCPU that is AArch32 at EL1, when the CPU has AArch32
EL1. On a CPU without it, RW stays set and the entry still fails, rather
than EL2 switching *32_EL2 registers that are UNDEFINED there. The host
already rejects such a vCPU, but EL2 takes the vCPU's features from the
host and doesn't rely on that.

Fixes: b56680de9c648 ("KVM: arm64: Initialize trap register values in hyp in pKVM")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 459bd9eb7e4bc..62d432144d44c 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -54,6 +54,15 @@ static void pkvm_vcpu_reset_hcr(struct kvm_vcpu *vcpu)
 	else
 		vcpu->arch.hcr_el2 |= HCR_TID2;
 
+	/*
+	 * Without AArch32 EL1, leave RW set and let the entry fail with an
+	 * illegal exception return: the *32_EL2 registers EL2 would otherwise
+	 * switch are UNDEFINED there.
+	 */
+	if (vcpu_has_feature(vcpu, KVM_ARM_VCPU_EL1_32BIT) &&
+	    cpus_have_final_cap(ARM64_HAS_32BIT_EL1))
+		vcpu->arch.hcr_el2 &= ~HCR_EL2_RW;
+
 	if (vcpu_has_ptrauth(vcpu))
 		vcpu->arch.hcr_el2 |= (HCR_API | HCR_APK);
 
-- 
2.39.5


