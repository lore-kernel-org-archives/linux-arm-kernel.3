Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B582ED59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 11:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RvvOtAVJLHnAKBsqjizZd5oF9r1DQPPsNT3gzWU0WGI=; b=nMnee0s+ain5fHIBd/TqfkuGFQ
	xL05G1bQMIdwxwsR4CThucaOENNM3ZkAzOs3tAjK/NdwjSs5gJC5yn07rjXuhZEGheAM20PSxmRnV
	OPGVRlIWVFCRtAlrOJWvF+hvMBKPwWPrsXqsp5zJBJHN02XgF0ESEMj+ozWTqJOib85DV75EzPozc
	msudO48CmERZlZSSK8wcJHqRTz8iHc/MNqgicHEyDkJ54FXjsVnHHpNmHNph3hDnTA/o8u5nRjnJG
	mLr24b+V4CPPUYISddrUoat3owGWYH2nlMMR9eqCbGynCFuB552mLKIWpWzA7C9t2x7RP+XoKzrP/
	NoTdebQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV70D-00000003Xzk-3Wn5;
	Mon, 15 Dec 2025 11:44:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV709-00000003Xwx-0wOw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 11:44:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BE1DFEC;
	Mon, 15 Dec 2025 03:44:19 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC7653F73B;
	Mon, 15 Dec 2025 03:44:24 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	qperret@google.com,
	will@kernel.org,
	tabba@google.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH v2 1/4] KVM: arm64: Copy FGT traps to unprotected pKVM VCPU on VCPU load
Date: Mon, 15 Dec 2025 11:44:06 +0000
Message-ID: <20251215114409.212512-2-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215114409.212512-1-alexandru.elisei@arm.com>
References: <20251215114409.212512-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_034429_300801_DE991414 
X-CRM114-Status: GOOD (  13.73  )
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
Acked-by: Will Deacon <will@kernel.org>
Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 3 +++
 arch/arm64/kvm/hyp/nvhe/pkvm.c     | 1 -
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index a7c689152f68..8ffbbce5e2ed 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -180,6 +180,9 @@ static void handle___pkvm_vcpu_load(struct kvm_cpu_context *host_ctxt)
 		/* Propagate WFx trapping flags */
 		hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWE | HCR_TWI);
 		hyp_vcpu->vcpu.arch.hcr_el2 |= hcr_el2 & (HCR_TWE | HCR_TWI);
+	} else {
+		memcpy(&hyp_vcpu->vcpu.arch.fgt, hyp_vcpu->host_vcpu->arch.fgt,
+		       sizeof(hyp_vcpu->vcpu.arch.fgt));
 	}
 }
 
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 8911338961c5..12b2acfbcfd1 100644
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


