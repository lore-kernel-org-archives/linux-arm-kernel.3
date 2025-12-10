Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F1DD3C545
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 13:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7wai2Vp+oRinZ8W1D2qVlrTBCIs3ioHdxgDpODlKCDM=; b=E8APYVwjd6SzT9gcHhTjzIIx2d
	HBAyarWNJxVzgwonyFCRzISSHIO9A8PRXxvg8t+AX6MsRGo4SiCExeSFPZ6ima1iwT/XzKZa4/MqV
	h4bcSDlLIi7UQahejI4RerT3OgzQ7Ztuw3Fp3Vfj27nNd0LENGFMD7jNFz72wI4BmfgaV5v+6E4Os
	ZesvMWBt5W7KbcqwWGDuQldMOL/bk5/JblI9ZWggp4A/LHm2xSGVhPGs1EhlhibSUlE54g+v9Xn+X
	Vy/JJz7xgFkm6yQX63cYu34NM7BYwXFUIaGH8ETWpDYFu1tb1RqJ788I4fhLcZ220OFYgwIV03zqY
	tN9WztZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTK89-0000000FTgt-2E3U;
	Wed, 10 Dec 2025 13:21:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTK85-0000000FTfj-2GaU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 13:21:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FAEC175D;
	Wed, 10 Dec 2025 05:21:08 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B94273F762;
	Wed, 10 Dec 2025 05:21:13 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	qperret@google.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH 1/2] KVM: arm64: Copy FGT traps to unprotected pKVM VCPU on VCPU load
Date: Wed, 10 Dec 2025 13:21:01 +0000
Message-ID: <20251210132102.137631-2-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251210132102.137631-1-alexandru.elisei@arm.com>
References: <20251210132102.137631-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_052117_613474_5580DCA5 
X-CRM114-Status: GOOD (  13.88  )
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

Commit fb10ddf35c1c ("KVM: arm64: Compute per-vCPU FGTs at vcpu_load()")
introduced per-VCPU FGT traps. For an unprotected pKVM VCPU, the untrusted
host FGT configuration is copied in pkvm_vcpu_init_traps(), which is called
from __pkvm_init_vcpu(). __pkvm_init_vcpu() is called once per VCPU (when
the VCPU is first run) which means that the uninitialized, zero, values for
the FGT registers end up being used for the entire lifetime of the VCPU.
This causes both unwanted traps (for the inverse polarity trap bits) and
the guest being allowed to access registers it shouldn't.

Fix it by copying the FGT traps for unprotected pKVM VCPUs when the
untrusted host loads the VCPU.

Fixes: fb10ddf35c1c ("KVM: arm64: Compute per-vCPU FGTs at vcpu_load()")
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 12 ++++++++++--
 arch/arm64/kvm/hyp/nvhe/pkvm.c     |  1 -
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 29430c031095..ee0f1343100c 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -167,6 +167,7 @@ static void handle___pkvm_vcpu_load(struct kvm_cpu_context *host_ctxt)
 	DECLARE_REG(unsigned int, vcpu_idx, host_ctxt, 2);
 	DECLARE_REG(u64, hcr_el2, host_ctxt, 3);
 	struct pkvm_hyp_vcpu *hyp_vcpu;
+	struct kvm_vcpu *hyp_kvm_vcpu;
 
 	if (!is_protected_kvm_enabled())
 		return;
@@ -175,10 +176,17 @@ static void handle___pkvm_vcpu_load(struct kvm_cpu_context *host_ctxt)
 	if (!hyp_vcpu)
 		return;
 
+	hyp_kvm_vcpu = &hyp_vcpu->vcpu;
+
 	if (pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
 		/* Propagate WFx trapping flags */
-		hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWE | HCR_TWI);
-		hyp_vcpu->vcpu.arch.hcr_el2 |= hcr_el2 & (HCR_TWE | HCR_TWI);
+		hyp_kvm_vcpu->arch.hcr_el2 &= ~(HCR_TWE | HCR_TWI);
+		hyp_kvm_vcpu->arch.hcr_el2 |= hcr_el2 & (HCR_TWE | HCR_TWI);
+	} else {
+		struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
+
+		memcpy(&hyp_kvm_vcpu->arch.fgt, host_vcpu->arch.fgt,
+		       sizeof(hyp_kvm_vcpu->arch.fgt));
 	}
 }
 
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 43bde061b65d..05774aed09cb 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -172,7 +172,6 @@ static int pkvm_vcpu_init_traps(struct pkvm_hyp_vcpu *hyp_vcpu)
 
 		/* Trust the host for non-protected vcpu features. */
 		vcpu->arch.hcrx_el2 = host_vcpu->arch.hcrx_el2;
-		memcpy(vcpu->arch.fgt, host_vcpu->arch.fgt, sizeof(vcpu->arch.fgt));
 		return 0;
 	}
 
-- 
2.52.0


