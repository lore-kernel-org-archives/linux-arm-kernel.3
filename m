Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D38CCFA08
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xCIjMttP1i7AxXvq6JI69blw6nSdzeiTaMFgsz/qmFg=; b=AqspVG/RBZ92c4p2EQog7XVQMq
	5JT1fcg2fqCkvA4tOv5luQDKkxcRkYaLG5KDm5j4xSgMz07WfZFyFwlDV4TWsVqmBMgCvs+o+4KBp
	oprWfVV09v+ohM7iBcgxkh29JIgqg7Wexerppv1UCYITa8A3puc2SCc9hl7OEjL/RYbxgay9RKmJl
	G9O1axZ67ft0qRwMBMqTWs7WxxKT3irdclefkWSBNTK6pC2ruooxb4dIxXz5E6WL6Bn89+3vRkS6J
	Yf7HbiPDdmKUDy6KlNA3sGAjsw/X3yFmF/l/xroKYFW4oKIYAr0FIiXLdbsb638EvYGO1uWnimrqR
	ttsgyQeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxqi-0000000AL6k-1Yl0;
	Mon, 03 Nov 2025 16:56:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxqA-0000000AJyJ-1nBt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:55:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A65143C4B;
	Mon,  3 Nov 2025 16:55:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ECD1C113D0;
	Mon,  3 Nov 2025 16:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762188934;
	bh=MuJA4k4s9ChXN15wYrgJFMzwPZmjn6xR8Dy9RWxkAUs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rSS4DWT62OFqJq8AHhaUXmtBWD9TYN88Ryj/ul1/K1dkqPFXpbpfjHGKUI8luNxFT
	 yCfF0YdVTQTtooFSugkjvJWu3DYi7BcjcjuaYrxZpgckegzrkIQllphD3LBvWwvHVG
	 ot2B16De9rq6M7UE7K3bnVy6BOryAp+Ds7xSydeHCGTOB/5e6XH337SE6NqFXnSKMX
	 ATS+5aBd1N/m24ejuBpiQKPjQcmy7f2pmoeqzv+UHxjuxsUBKVFdJ9his18iLaMv3m
	 mxDRffqu16jRnwBSOK4fBDicOfGeor4tCpynnCY8J5H/yrpaGJapxZX5IMVDYD6eRn
	 iIhU+37KQwsSA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vFxq8-000000021VN-1Tgn;
	Mon, 03 Nov 2025 16:55:32 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 32/33] KVM: arm64: GICv2: Always trap GICV_DIR register
Date: Mon,  3 Nov 2025 16:55:16 +0000
Message-ID: <20251103165517.2960148-33-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251103165517.2960148-1-maz@kernel.org>
References: <20251103165517.2960148-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_085534_550316_CFF0E95A 
X-CRM114-Status: GOOD (  12.97  )
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

Since we can't decide to trap the DIR register on a per-vcpu basis,
always trap the second page of the GIC CPU interface. Yes, this is
costly. On the bright side, no sane SW should use EOImode==1 on
GICv2...

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c | 4 ++++
 arch/arm64/kvm/vgic/vgic-v2.c            | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c b/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c
index 78579b31a4205..5fd99763b54de 100644
--- a/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c
+++ b/arch/arm64/kvm/hyp/vgic-v2-cpuif-proxy.c
@@ -63,6 +63,10 @@ int __vgic_v2_perform_cpuif_access(struct kvm_vcpu *vcpu)
 		return -1;
 	}
 
+	/* Handle deactivation as a normal exit */
+	if ((fault_ipa - vgic->vgic_cpu_base) >= GIC_CPU_DEACTIVATE)
+		return 0;
+
 	rd = kvm_vcpu_dabt_get_rd(vcpu);
 	addr  = kvm_vgic_global_state.vcpu_hyp_va;
 	addr += fault_ipa - vgic->vgic_cpu_base;
diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index 5ab29c6755ade..37efffefdb710 100644
--- a/arch/arm64/kvm/vgic/vgic-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-v2.c
@@ -485,7 +485,7 @@ int vgic_v2_map_resources(struct kvm *kvm)
 	if (!static_branch_unlikely(&vgic_v2_cpuif_trap)) {
 		ret = kvm_phys_addr_ioremap(kvm, dist->vgic_cpu_base,
 					    kvm_vgic_global_state.vcpu_base,
-					    KVM_VGIC_V2_CPU_SIZE, true);
+					    KVM_VGIC_V2_CPU_SIZE - SZ_4K, true);
 		if (ret) {
 			kvm_err("Unable to remap VGIC CPU to VCPU\n");
 			return ret;
-- 
2.47.3


