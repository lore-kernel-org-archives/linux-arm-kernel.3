Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AF8CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 12:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYML8FmgbJRn+H7Z7f4gvn0QLHl07SQrP9JcLScJJ3w=; b=sjtXlHmeUzv2dQ/TISM3G4H6Fe
	trNiDDDv7froxjS2FMXPRHHnx0fTndyrKBD1Lxcx7vuCt7wqbEu40X+TIt1rI136JmEiO+W0g/mmX
	8Qpz9gikDT1uO8wcnHN+bg+XCKJ8Ge+WAOMJ+LQMuysuc5hKSgaM9fFvutreY71py5kAuhikCezFO
	GIzT8pdDwHHxm4Vs2SqGz5MWtTwFu/fFnFalM4x5zyJ6k8M93wiNazGksykd/JjiA3z3Jokot+yR6
	ucLQKSrbv7L3ubhkZfP9lB+FhUR0GTRI4Av/774fQ6Q8jLWVN5EQFBXsb1bRy4zaPqM/GCgwX6H+O
	C9vj9nkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyVy-0000000FVZe-3teL;
	Wed, 14 Oct 2026 12:55:26 +0000
Received: from out-7.mta1.migadu.com ([95.215.58.7] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyVt-0000000FVXc-1lva
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 12:55:22 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=1W+NOG2Vc3f+T8d2kTd9wvETY+8H8YtcVIfzWtcM8hs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791982518; v=1; x=1792587318;
 b=dntljhIZwyLxEF7g2/rFr503mVZCDevPVkqarcveV3KUbbF3t54IaiBuVSEnJVAq0hCTtnC1
 WVmHEIHjDi+rnHey4KyHZWziXvPYZQSSZlQuCAf2veCeJy8vMj1cvXjo5rd5C4PCkWEDA4hRJpy
 rBIMnazP2f87SCL//w4+b4rQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 439495e9f5d2f512;
	Wed, 14 Oct 2026 12:55:14 +0000
X-Mizu-Trace-ID: 439495e9f5d2f512
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] KVM: arm64: Track physical CPU number at EL2
Date: Wed, 14 Oct 2026 13:55:09 +0100
Message-Id: <20261014125510.2928306-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261014125510.2928306-1-fuad.tabba@linux.dev>
References: <20261014125510.2928306-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_055521_605649_0F43CE7C 
X-CRM114-Status: GOOD (  12.13  )
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

The nVHE hypervisor has no equivalent of smp_processor_id(), so EL2 code
has no index for the CPU it runs on.

Add a hyp per-CPU hyp_cpu_number, which the host writes in
cpu_prepare_hyp_mode() before it's deprivileged, and a
hyp_smp_processor_id() accessor to read it. The next patch uses it to
index per-CPU state in a hyp VM.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_hyp.h  | 3 +++
 arch/arm64/kvm/arm.c              | 3 +++
 arch/arm64/kvm/hyp/nvhe/hyp-smp.c | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_hyp.h b/arch/arm64/include/asm/kvm_hyp.h
index b0e42be3d9eef..6c4169a14b73e 100644
--- a/arch/arm64/include/asm/kvm_hyp.h
+++ b/arch/arm64/include/asm/kvm_hyp.h
@@ -16,6 +16,9 @@
 DECLARE_PER_CPU(struct kvm_cpu_context, kvm_hyp_ctxt);
 DECLARE_PER_CPU(unsigned long, kvm_hyp_vector);
 DECLARE_PER_CPU(struct kvm_nvhe_init_params, kvm_init_params);
+DECLARE_PER_CPU(int, hyp_cpu_number);
+
+#define hyp_smp_processor_id() (__this_cpu_read(hyp_cpu_number))
 
 /*
  * Unified accessors for registers that have a different encoding
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index d593ba9280933..0dd6667f1beea 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -116,6 +116,7 @@ DECLARE_KVM_HYP_PER_CPU(unsigned long, kvm_hyp_vector);
 
 DEFINE_PER_CPU(unsigned long, kvm_arm_hyp_stack_base);
 DECLARE_KVM_NVHE_PER_CPU(struct kvm_nvhe_init_params, kvm_init_params);
+DECLARE_KVM_NVHE_PER_CPU(int, hyp_cpu_number);
 
 DECLARE_KVM_NVHE_PER_CPU(struct kvm_cpu_context, kvm_hyp_ctxt);
 
@@ -2351,6 +2352,8 @@ static void __init cpu_prepare_hyp_mode(int cpu, u32 hyp_va_bits)
 	struct kvm_nvhe_init_params *params = per_cpu_ptr_nvhe_sym(kvm_init_params, cpu);
 	unsigned long tcr;
 
+	*per_cpu_ptr_nvhe_sym(hyp_cpu_number, cpu) = cpu;
+
 	/*
 	 * Calculate the raw per-cpu offset without a translation from the
 	 * kernel's mapping to the linear mapping, and store it in tpidr_el2
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-smp.c b/arch/arm64/kvm/hyp/nvhe/hyp-smp.c
index 04d194583f1e4..9fcb92abd0b57 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-smp.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-smp.c
@@ -8,6 +8,8 @@
 #include <asm/kvm_hyp.h>
 #include <asm/kvm_mmu.h>
 
+DEFINE_PER_CPU(int, hyp_cpu_number);
+
 /*
  * nVHE copy of data structures tracking available CPU cores.
  * Only entries for CPUs that were online at KVM init are populated.
-- 
2.39.5


