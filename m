Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B79BCD98D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 06:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xebdFH52a2q7PdzScDZN73wHZPgaOs9QBV3wO9+5R+0=; b=tRucAOM5cNsjb28PbkpWeu686V
	1xSXKt+LSilbVKshKINQfnbugjjDnO/Hqx88vX4HDHqXMrobbJz3sOU7lmCQm64kxIYv0BxhxFhnF
	05e4CJKyYsEtsxyEGYE0PVxbxawP61FEo4cXc/tUY6q6mdS8lG+rm5CEhrHuXgRdpq0uJgpJRAyzZ
	3e31OSI4gDrm2V3jvEvkpgJWRfehtWFfARZbGWnQJ+uYfCRiq+7tv1yqdrFQGicdn6Xx314xPxe7e
	7MHgC0CZRyOJud5npsWLEdl7CH9U/uCLdm/+F5tILrZs9nXcm3TGFDI3yxmMid+vsQYFyToE//y/8
	sUfi56+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvrj-0000000AR4k-3WAs;
	Fri, 12 Jun 2026 06:59:43 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXvre-0000000AQyk-2N5T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 06:59:39 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-490b3ec3f7fso3587835e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 23:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781247576; x=1781852376; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xebdFH52a2q7PdzScDZN73wHZPgaOs9QBV3wO9+5R+0=;
        b=IatOGAKHj9SpAARNQTMTMp++3IfrXKCnmbeLBeFZxDmto5Nrzindk+qMhHaFkUFvAT
         hykpQ/kBvnvaN3OuhUTGdzBIHMMsqKlBV0/TXPV8cmuthDnJP3haB4PAbMd+08DjTkrW
         PgYUe7XFi/FPRNOfyooiuNbWqnvk9mUdpCBLa50lH+nb3oTKdvDRu8FpIoWqGssSANI/
         JvHzY12qWpfXKW1K/f6Q95EmVWLV8BacZgf7tklhGOWjVlc1S1eIjn0FJqWi6Y8Q9srq
         OstKMhHrjTjnIISIJt/s/zlmQyZ4Zs1wMx/85wWc9ir0qMLLKBN66SOHR+wbv1haWtOV
         03KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781247576; x=1781852376;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xebdFH52a2q7PdzScDZN73wHZPgaOs9QBV3wO9+5R+0=;
        b=jaevicsRVhGhcIr6CaRyTGqgg2WY8MEWnTphZR7DYFBdxlh5qpXD0ff2G6uGv8oSa3
         S+04Y9a8A9NKRa16rAITaUgOw0jcjrWzwUcBlPfJx/YskxpIOrsAZZUlzyKK2RifLXH6
         iMg69dFraLQ+DgT4uy+SxXC/IdgWvHWxh0n2lQVFN+XEKo6bfiiuz9sCUPk13wDAj0HI
         urmhBNBFnQAKnO/Cy2i6i+3KiV5xuoWaJ6qksucog+4LmnR8/Ls6jXhN1fDSQkiuqDCM
         NgGhL3KYc4mqQJUZsbv1MC+Q8EAnclxBFtddKSt3/1imh5y4ty6/99/UwcnReOkY6sUo
         rl6A==
X-Forwarded-Encrypted: i=1; AFNElJ++QfVux2080cuHxK16AREdM5r2pm20p2NjmDuhkrM0MIzO8zLQFkk8gFf2+PfxT9HMtOJOPWL1bwbPE1X8/WjY@lists.infradead.org
X-Gm-Message-State: AOJu0YzReN+9nivbEO9ZiP3tOlusxoo2q7p4xFYdKj2xZ++tEogAQKE8
	+lsuyyOE7nKhjTy+6uixbka8u0/VjlcHQROlFnEQegcK0HprFQ/qeXMO3YVYfuu76g/X4hoVHZL
	70A==
X-Received: from wmby27.prod.google.com ([2002:a05:600c:c05b:b0:483:6e28:c16f])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c4ab:b0:48f:f64c:c2fe
 with SMTP id 5b1f17b1804b1-490ec4f8090mr18979405e9.22.1781247576386; Thu, 11
 Jun 2026 23:59:36 -0700 (PDT)
Date: Fri, 12 Jun 2026 07:59:23 +0100
In-Reply-To: <20260612065925.755562-1-tabba@google.com>
Mime-Version: 1.0
References: <20260612065925.755562-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612065925.755562-10-tabba@google.com>
Subject: [PATCH v1 09/11] KVM: arm64: Minimise EL2's exposure of host VGIC
 state during world switch
From: tabba@google.com
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Sebastian Ene <sebastianene@google.com>, 
	Per Larsen <perlarsen@google.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Hyunwoo Kim <imv4bel@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_235938_636773_77E5CA6E 
X-CRM114-Status: GOOD (  16.39  )
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
index 420fb19a6476..2f165b6c7b07 100644
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
@@ -220,6 +222,16 @@ static struct kvm_vcpu *__get_host_hyp_vcpus(struct kvm_vcpu *arg,
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
@@ -489,16 +501,63 @@ static void handle___vgic_v3_init_lrs(struct kvm_cpu_context *host_ctxt)
 
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
2.54.0.1136.gdb2ca164c4-goog


