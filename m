Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C07CDE013
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 07:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCwEDZ0KU5km8c4sGsCgh07H9CkPrfYw3JcSaVUyj3g=; b=aq4rH6JBJS5Xz9nMcH4zhCY1Ig
	STYe9B0MlHb4rrTj3Ny1P5uJJS1IBFMtCfTHOzaYHckA4UlrqKUwuDlG1p/bEX2FxR+64E4JMR1dX
	shpo+Hzbi42VWTd8Ku5wFfDnJND0MRBYO2z4yTXzJ8DFEDKL5aUx0YCpBwQ4WEP3orgPb3G4kUD1h
	Z/n66yACxnmaxW3ucb1Pgd7EKZO8JtlCwL9H9o+LS+NvVgyRhcxcaGPK6TZhbnz6rEGLXGVIsZYme
	CJrZkPXz73Iztyoj72LmR/Q44PqClswmDCvpYWdyj+U2X9h8uCb4WueTepvIoq2eKow7BnBaKreXy
	wKe75zfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd0cM-0000000Ae1Z-2Nq0;
	Fri, 26 Jun 2026 07:04:50 +0000
Received: from out-187.mta1.migadu.com ([2001:41d0:203:375::bb])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd0cI-0000000Adxp-11Jl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 07:04:47 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782457483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UCwEDZ0KU5km8c4sGsCgh07H9CkPrfYw3JcSaVUyj3g=;
	b=V/b6PIskY4jki0ml6y3z9h0uxIeHQJz1UCmr59QExQVqLwdCL7D3lZef4lFGD2qYKo79GT
	nPS9bnuaRI1RwJtU2l3zpGaBz79o2vzCPy3MH87K6QuZR5gpZiYvtg/Fw3ZCPOfL2Fg76k
	LnYPyysVU1sbQ63Qosy7v4fVzamqaxI=
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	Hyunwoo Kim <imv4bel@gmail.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v3 7/8] KVM: arm64: Add primitives to flush/sync the VGIC state at EL2
Date: Fri, 26 Jun 2026 08:04:07 +0100
Message-Id: <20260626070408.3420953-8-fuad.tabba@linux.dev>
In-Reply-To: <20260626070408.3420953-1-fuad.tabba@linux.dev>
References: <20260626070408.3420953-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_000446_606333_77C86B36 
X-CRM114-Status: GOOD (  13.01  )
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

From: Marc Zyngier <maz@kernel.org>

pKVM performs its own world switch for protected VMs but has no
primitives to move the per-vCPU VGIC state between the host and
hypervisor vCPU contexts.

Add flush_hyp_vgic_state() and sync_hyp_vgic_state(). Flush copies
vgic_hcr, the in-use list registers and used_lrs from the host into the
hyp vCPU and pins vgic_sre to a fixed value; sync copies vgic_hcr,
vgic_vmcr and the in-use list registers back. The active priority
registers are handled separately by the save/restore-aprs path.

Bound used_lrs by hyp_gicv3_nr_lr, the cached implemented-LR count,
instead of reading ICH_VTR_EL2 on each entry. That clamps the
host-supplied value and avoids a per-entry sysreg read that is costly
under NV.

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Co-developed-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 55 ++++++++++++++++++++++--------
 1 file changed, 41 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index f25ee39715282..0194965930e61 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -102,6 +102,45 @@ static void fpsimd_sve_sync(struct kvm_vcpu *vcpu)
 	*host_data_ptr(fp_owner) = FP_STATE_HOST_OWNED;
 }
 
+static void flush_hyp_vgic_state(struct pkvm_hyp_vcpu *hyp_vcpu)
+{
+	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
+	struct vgic_v3_cpu_if *host_cpu_if, *hyp_cpu_if;
+	unsigned int used_lrs, i;
+
+	host_cpu_if	= &host_vcpu->arch.vgic_cpu.vgic_v3;
+	hyp_cpu_if	= &hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3;
+
+	used_lrs	= host_cpu_if->used_lrs;
+	used_lrs	= min(used_lrs, hyp_gicv3_nr_lr);
+
+	hyp_cpu_if->vgic_hcr	= host_cpu_if->vgic_hcr;
+	/* Should be a one-off */
+	hyp_cpu_if->vgic_sre	= (ICC_SRE_EL1_DIB |
+				   ICC_SRE_EL1_DFB |
+				   ICC_SRE_EL1_SRE);
+	hyp_cpu_if->used_lrs	= used_lrs;
+
+	for (i = 0; i < used_lrs; i++)
+		hyp_cpu_if->vgic_lr[i] = host_cpu_if->vgic_lr[i];
+}
+
+static void sync_hyp_vgic_state(struct pkvm_hyp_vcpu *hyp_vcpu)
+{
+	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
+	struct vgic_v3_cpu_if *host_cpu_if, *hyp_cpu_if;
+	unsigned int i;
+
+	host_cpu_if	= &host_vcpu->arch.vgic_cpu.vgic_v3;
+	hyp_cpu_if	= &hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3;
+
+	host_cpu_if->vgic_hcr = hyp_cpu_if->vgic_hcr;
+	host_cpu_if->vgic_vmcr = hyp_cpu_if->vgic_vmcr;
+
+	for (i = 0; i < hyp_cpu_if->used_lrs; i++)
+		host_cpu_if->vgic_lr[i] = hyp_cpu_if->vgic_lr[i];
+}
+
 static void flush_debug_state(struct pkvm_hyp_vcpu *hyp_vcpu)
 {
 	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
@@ -150,13 +189,7 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 
 	hyp_vcpu->vcpu.arch.vsesr_el2	= host_vcpu->arch.vsesr_el2;
 
-	hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3 = host_vcpu->arch.vgic_cpu.vgic_v3;
-
-	/* Bound used_lrs by the number of implemented list registers. */
-	hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3.used_lrs =
-		min_t(unsigned int,
-		      hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3.used_lrs,
-		      hyp_gicv3_nr_lr);
+	flush_hyp_vgic_state(hyp_vcpu);
 
 	hyp_vcpu->vcpu.arch.pid = host_vcpu->arch.pid;
 }
@@ -164,9 +197,6 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 {
 	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
-	struct vgic_v3_cpu_if *hyp_cpu_if = &hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3;
-	struct vgic_v3_cpu_if *host_cpu_if = &host_vcpu->arch.vgic_cpu.vgic_v3;
-	unsigned int i;
 
 	fpsimd_sve_sync(&hyp_vcpu->vcpu);
 	sync_debug_state(hyp_vcpu);
@@ -179,10 +209,7 @@ static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 
 	host_vcpu->arch.iflags		= hyp_vcpu->vcpu.arch.iflags;
 
-	host_cpu_if->vgic_hcr		= hyp_cpu_if->vgic_hcr;
-	host_cpu_if->vgic_vmcr		= hyp_cpu_if->vgic_vmcr;
-	for (i = 0; i < hyp_cpu_if->used_lrs; ++i)
-		host_cpu_if->vgic_lr[i] = hyp_cpu_if->vgic_lr[i];
+	sync_hyp_vgic_state(hyp_vcpu);
 }
 
 static void handle___pkvm_vcpu_load(struct kvm_cpu_context *host_ctxt)
-- 
2.39.5


