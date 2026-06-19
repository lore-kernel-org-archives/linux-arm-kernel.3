Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7ACFCD98E6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 07:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nFTjg/IHL8HMr8nAct3jT4CdzzQIgwwmBvMwQOcvCtw=; b=1GPCRN5aBn2aFV3OI4ueo6qGhD
	47V708QFremJajcqO/5hpO3S8tY223b9sB33KD3FFcyNAHSaY3Ymt1T6zGQfkpvmCQ4z6sK2re593
	CBc6hrU3CNcDCK6AUdypzLe/X5cRGIOQN5aPd8CmDXH0W3eGNa3Xv39RnpB6Ljwx9fo49WRXdMlR6
	gcnLKASTMxl9g24PEVy4mq0ajSewilr8r6uLOT8obi5E8n4bOUYrOeBdu6Pgvqv/UWT08AMDaXnPL
	fTYEJS7bH7h47qQUSGCsIu1uNLs14QgdtvWK0mfSEI2ctADyPtde9vh8NgEaBsJg6DxnSulwwqGAs
	Y/sx5f9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTKJ-000000025UP-1v1Z;
	Fri, 19 Jun 2026 07:07:43 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTK6-000000025Hc-2JPz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 07:07:31 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4923d2f0dedso3938215e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 00:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781852848; x=1782457648; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nFTjg/IHL8HMr8nAct3jT4CdzzQIgwwmBvMwQOcvCtw=;
        b=aFXdG7GoloL/GtJmD8iS9n7LWi2ivenaplq2vEiJ8BEG/oO1TAjgUzbl/rZ+jbQr5P
         alD8lHZ+ZAdgNtUgWNrZ3/gBjH7n9wIxNzsC1BRxbSO7vScNEu+JxTVVh37MlSz2/PSb
         1gr/nupoo7LiFvZMwKQuO7BljSy9qp36L6/OEjrsnIPwub47ZivvKXmbipFFwpHOiI+i
         QrUgHiIv/1iuiqsijaXdTcTrMORSK4DWvXiWURd5ZpaNm4/JMYdpGWHY3uCPOopaqkzH
         qmR+aPrwIYZg/fzOCpCdgfNTeaSB6MmYBfNfdGTuUz1VuyJsBK8bdCji/dckInUPp3vm
         0cXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781852848; x=1782457648;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nFTjg/IHL8HMr8nAct3jT4CdzzQIgwwmBvMwQOcvCtw=;
        b=p34MFN6Ab9vbW5B+apJ08+uj7hsM0Zysrc4+GTcYEik8XEbcWLj+HMjX2uqtdxQAXJ
         ecUqbs8xjVss72/MUkPj4sM+Tfd7Xele6D4p6ZUE1lUvRHbwiismvN2B1m4QmVdDCkUD
         ta3i8K9GtJ30BF7BlmfDMFbZIt8BzMdzyNjX/twtSzDBdiHU9ggerqEi0AEMDVa75CC3
         JLCGriIWJBCuGQh9dBg/u3zyxwV/mokIZMxICEKdJz+0LAmJRxWQID0oiA+sXi7d4v2U
         Eu+zphlYlWO5tWxLASzaeMWGP/i+KlvSPbyhzGSSc1t0FqZ88O98+HorgqbItIxixuYj
         hNDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/5TyfGv0ILkE35y6iU9deXVUqD3690m0xm9QdzOWH+73wQxVnJyP3iSfM0M24y23kxd2rLx2LclDJugjVoD7OW@lists.infradead.org
X-Gm-Message-State: AOJu0YyzuGlMIL4J8XylxDD2MPYkPFi2OxvCT90v0UOTclY120GSVeVA
	1gZpLR2yWExjiQ79v+E7utpMcUGMoCS3ZOiQuM9prK4tUtfPtskebBYSFGML9osChCLXAHJOwQi
	fPg==
X-Received: from wmbf6.prod.google.com ([2002:a05:600c:5946:b0:492:4336:6b5f])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:310e:b0:48f:e3e7:3d39
 with SMTP id 5b1f17b1804b1-49242328b63mr18197345e9.11.1781852848101; Fri, 19
 Jun 2026 00:07:28 -0700 (PDT)
Date: Fri, 19 Jun 2026 08:07:17 +0100
In-Reply-To: <20260619070719.812227-1-tabba@google.com>
Mime-Version: 1.0
References: <20260619070719.812227-1-tabba@google.com>
X-Mailer: git-send-email 2.55.0.rc0.738.g0c8ab3ebcc-goog
Message-ID: <20260619070719.812227-7-tabba@google.com>
Subject: [PATCH v2 6/8] KVM: arm64: Minimise EL2's exposure of host VGIC state
 during world switch
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Quentin Perret <qperret@google.com>, 
	Sebastian Ene <sebastianene@google.com>, Hyunwoo Kim <imv4bel@gmail.com>, 
	Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_000730_641585_F72DDB34 
X-CRM114-Status: GOOD (  16.18  )
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

The host passes a vgic_v3_cpu_if pointer to the __vgic_v3_save_aprs and
__vgic_v3_restore_vmcr_aprs hypercalls, which EL2 dereferences
wholesale. That exposes the host's full VGIC emulation state to the
hypervisor, against pKVM's isolation goals.

Recover the host vCPU from the supplied cpu_if via container_of() and
copy only vgic_vmcr and the active priority registers between EL2's
hyp-side state and the host vCPU, so EL2 no longer dereferences the
host's vgic_v3_cpu_if directly.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Co-developed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 67 ++++++++++++++++++++++++++++--
 1 file changed, 63 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 8923f594c264..f25ee3971528 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -7,6 +7,8 @@
 #include <hyp/adjust_pc.h>
 #include <hyp/switch.h>
 
+#include <linux/irqchip/arm-gic-v3.h>
+
 #include <asm/pgtable-types.h>
 #include <asm/kvm_asm.h>
 #include <asm/kvm_emulate.h>
@@ -237,6 +239,16 @@ static struct kvm_vcpu *__get_host_hyp_vcpus(struct kvm_vcpu *arg,
 		__get_host_hyp_vcpus(__vcpu, hyp_vcpup);		\
 	})
 
+#define get_host_hyp_vcpus_from_vgic_v3_cpu_if(ctxt, regnr, hyp_vcpup)		\
+	({									\
+		DECLARE_REG(struct vgic_v3_cpu_if *, cif, ctxt, regnr);\
+		struct kvm_vcpu *__vcpu = container_of(cif,			\
+						       struct kvm_vcpu,		\
+						       arch.vgic_cpu.vgic_v3);	\
+										\
+		__get_host_hyp_vcpus(__vcpu, hyp_vcpup);			\
+	})
+
 static void handle___kvm_vcpu_run(struct kvm_cpu_context *host_ctxt)
 {
 	struct pkvm_hyp_vcpu *hyp_vcpu;
@@ -506,16 +518,63 @@ static void handle___vgic_v3_init_lrs(struct kvm_cpu_context *host_ctxt)
 
 static void handle___vgic_v3_save_aprs(struct kvm_cpu_context *host_ctxt)
 {
-	DECLARE_REG(struct vgic_v3_cpu_if *, cpu_if, host_ctxt, 1);
+	struct pkvm_hyp_vcpu *hyp_vcpu;
+	struct kvm_vcpu *host_vcpu;
 
-	__vgic_v3_save_aprs(kern_hyp_va(cpu_if));
+	host_vcpu = get_host_hyp_vcpus_from_vgic_v3_cpu_if(host_ctxt, 1,
+							   &hyp_vcpu);
+	if (!host_vcpu)
+		return;
+
+	if (unlikely(hyp_vcpu)) {
+		struct vgic_v3_cpu_if *hyp_cpu_if, *host_cpu_if;
+		int i;
+
+		hyp_cpu_if = &hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3;
+		__vgic_v3_save_aprs(hyp_cpu_if);
+
+		host_cpu_if = &host_vcpu->arch.vgic_cpu.vgic_v3;
+		host_cpu_if->vgic_vmcr = hyp_cpu_if->vgic_vmcr;
+		for (i = 0; i < ARRAY_SIZE(host_cpu_if->vgic_ap0r); i++) {
+			host_cpu_if->vgic_ap0r[i] = hyp_cpu_if->vgic_ap0r[i];
+			host_cpu_if->vgic_ap1r[i] = hyp_cpu_if->vgic_ap1r[i];
+		}
+	} else {
+		__vgic_v3_save_aprs(&host_vcpu->arch.vgic_cpu.vgic_v3);
+	}
 }
 
 static void handle___vgic_v3_restore_vmcr_aprs(struct kvm_cpu_context *host_ctxt)
 {
-	DECLARE_REG(struct vgic_v3_cpu_if *, cpu_if, host_ctxt, 1);
+	struct pkvm_hyp_vcpu *hyp_vcpu;
+	struct kvm_vcpu *host_vcpu;
 
-	__vgic_v3_restore_vmcr_aprs(kern_hyp_va(cpu_if));
+	host_vcpu = get_host_hyp_vcpus_from_vgic_v3_cpu_if(host_ctxt, 1,
+							   &hyp_vcpu);
+	if (!host_vcpu)
+		return;
+
+	if (unlikely(hyp_vcpu)) {
+		struct vgic_v3_cpu_if *hyp_cpu_if, *host_cpu_if;
+		int i;
+
+		hyp_cpu_if = &hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3;
+		host_cpu_if = &host_vcpu->arch.vgic_cpu.vgic_v3;
+
+		hyp_cpu_if->vgic_vmcr = host_cpu_if->vgic_vmcr;
+		/* Should be a one-off */
+		hyp_cpu_if->vgic_sre = (ICC_SRE_EL1_DIB |
+					ICC_SRE_EL1_DFB |
+					ICC_SRE_EL1_SRE);
+		for (i = 0; i < ARRAY_SIZE(host_cpu_if->vgic_ap0r); i++) {
+			hyp_cpu_if->vgic_ap0r[i] = host_cpu_if->vgic_ap0r[i];
+			hyp_cpu_if->vgic_ap1r[i] = host_cpu_if->vgic_ap1r[i];
+		}
+
+		__vgic_v3_restore_vmcr_aprs(hyp_cpu_if);
+	} else {
+		__vgic_v3_restore_vmcr_aprs(&host_vcpu->arch.vgic_cpu.vgic_v3);
+	}
 }
 
 static void handle___pkvm_init(struct kvm_cpu_context *host_ctxt)
-- 
2.55.0.rc0.738.g0c8ab3ebcc-goog


