Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F1FCDB469
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 07:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9tQfxVsIaeS+jOhIrhpINETdsAt58seT+ojTMVLuce4=; b=aOK/KYC+0t86ttr5XNtlgm1yIH
	5Pxwfyzm2UzQlaW71xh5/hojrjXXcrM9ckGjCTSKzgAV7RU9GPegicNBXUpFkgoA5uA5LYHBD+Xac
	vshnbstB0APHAQ17bH0ciQmNZAsZdCF1MW+MsPQaDDsl1ajqD6ZbxC26WP55VRx4FGaE2sVvh6+uD
	5Y89FBUy4uMvDr0QGDzFg/o3BhAg+JmO6S7OiW8Qw+afqplULmbj9mA84ILp0m5w9uOigmZQg7PuS
	parnmNYMgy082WTzdVi/YqQBAxUxJhXPg783HbszA/Mfp8DgYWgv1OAB/qjW/jAiDP0f3IYHnBysb
	LlDn28yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTKJ-000000025U3-1SZs;
	Fri, 19 Jun 2026 07:07:43 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTK5-000000025Gm-0OyK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 07:07:30 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-69681505eabso828840a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 00:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781852847; x=1782457647; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9tQfxVsIaeS+jOhIrhpINETdsAt58seT+ojTMVLuce4=;
        b=eaKa5bbUshLy1NY0wLMbhXDczSc+lfuhDElXEyPoeq2TqWwPZUdMgJyYhmBkEHmbET
         7LU7NyQp25ILN3xJX4rJ3KrFzSBX9si7ia2cLxQcdkFHjb5mxBe8VLgyaxbrxRIVGT9t
         RWT4d5pxnxdWfmjoPmFon+vLsmpAoNkfVPp9HiV760EQn87Rv0QyBxFckVH9Rnal6HL2
         i0LWM5dS8NCAJekRtPD4jfHgXG90bL5zRfF2iIwrtOXHoc535x4FxnIi2A/y6ceXn4Lm
         a7OhlO9Gg3z3aqaYgxzJxXZWVCl6lkMqIe3cZTWeiiQjtjTnqObl5kYR0tG5bqkq7iGk
         pO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781852847; x=1782457647;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9tQfxVsIaeS+jOhIrhpINETdsAt58seT+ojTMVLuce4=;
        b=EQsoBwQETHukcYjXhdvS/fOU2ReNZWW7uqDHuLAtq28UcJfemRSQnm7ZyJHgOhyjdG
         1dySpZXlfPxruG1ytNPVfPgXjhUmfqFcFFk7YIVi8aRvvMzQtIc/zP6EVydU9CE/I/2E
         1PwvWeoyMQajwIfbwqhNMP4ESWgJ+tnzzyOp9uVqj9u56JeqtwSAqZfk4jiuSaoS8cW9
         9gfsYGrYX9qvGFyAkprG8yMwBqHpdNczh31VkZx/J3j2WVT+65Ain6oUPiBPsG84o8lu
         ALbNTCllFKwaCDT4cJvZfYNj1YlGByMuoorJDGDGh7JEIJWqU57V/8xokAh3SBwpyvyu
         H15g==
X-Forwarded-Encrypted: i=1; AFNElJ/C3os1ucGFNaXF3z7VEFNz+tPT2k0fLPWJoVe/fs1MXZG6JfQaZgoe0xFh4Rf498nLHLvu5JQZwcs+zqfsdrgt@lists.infradead.org
X-Gm-Message-State: AOJu0YwYq4Qa7fLJSrl8iJv/VipQG860a7a1QJweIsXHVXPkEw4tp8Jq
	n1siU0cJTlfwkBfuvz3QU488NsJiYFg32xzOqL0R1FjiGBg2suCfp9zU+u6mLlQ2gkqPAHDRQP/
	grw==
X-Received: from edds9.prod.google.com ([2002:a05:6402:5209:b0:673:4f43:5f4b])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:4589:b0:67f:e9d0:d819
 with SMTP id 4fb4d7f45d1cf-696e521d903mr1212311a12.22.1781852846765; Fri, 19
 Jun 2026 00:07:26 -0700 (PDT)
Date: Fri, 19 Jun 2026 08:07:16 +0100
In-Reply-To: <20260619070719.812227-1-tabba@google.com>
Mime-Version: 1.0
References: <20260619070719.812227-1-tabba@google.com>
X-Mailer: git-send-email 2.55.0.rc0.738.g0c8ab3ebcc-goog
Message-ID: <20260619070719.812227-6-tabba@google.com>
Subject: [PATCH v2 5/8] KVM: arm64: Add host and hypervisor vCPU lookup primitives
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
X-CRM114-CacheID: sfid-20260619_000729_142291_5F1A2423 
X-CRM114-Status: GOOD (  16.25  )
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

The nVHE hypervisor repeatedly resolves a host vCPU into the EL2
address space and validates that the loaded hyp vCPU matches it, with
that logic open-coded in each handler.

Add __get_host_hyp_vcpus() and the get_host_hyp_vcpus() macro, which
translate the host vCPU into the hypervisor's address space and, when
pKVM is enabled, also return the loaded hyp vCPU if it matches. If pKVM
is enabled but the loaded hyp vCPU does not correspond to the requested
host vCPU, both the host and hyp vCPU are returned as NULL. Convert
handle___kvm_vcpu_run() to use it.

No functional change intended.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Co-developed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 52 ++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 1d01c6e547f5..8923f594c264 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -212,14 +212,45 @@ static void handle___pkvm_vcpu_put(struct kvm_cpu_context *host_ctxt)
 		pkvm_put_hyp_vcpu(hyp_vcpu);
 }
 
-static void handle___kvm_vcpu_run(struct kvm_cpu_context *host_ctxt)
+static struct kvm_vcpu *__get_host_hyp_vcpus(struct kvm_vcpu *arg,
+					     struct pkvm_hyp_vcpu **hyp_vcpup)
 {
-	DECLARE_REG(struct kvm_vcpu *, host_vcpu, host_ctxt, 1);
-	int ret;
+	struct kvm_vcpu *host_vcpu = kern_hyp_va(arg);
+	struct pkvm_hyp_vcpu *hyp_vcpu = NULL;
 
 	if (unlikely(is_protected_kvm_enabled())) {
-		struct pkvm_hyp_vcpu *hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
+		hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
 
+		if (!hyp_vcpu || hyp_vcpu->host_vcpu != host_vcpu) {
+			hyp_vcpu = NULL;
+			host_vcpu = NULL;
+		}
+	}
+
+	*hyp_vcpup = hyp_vcpu;
+	return host_vcpu;
+}
+
+#define get_host_hyp_vcpus(ctxt, regnr, hyp_vcpup)			\
+	({								\
+		DECLARE_REG(struct kvm_vcpu *, __vcpu, ctxt, regnr);	\
+		__get_host_hyp_vcpus(__vcpu, hyp_vcpup);		\
+	})
+
+static void handle___kvm_vcpu_run(struct kvm_cpu_context *host_ctxt)
+{
+	struct pkvm_hyp_vcpu *hyp_vcpu;
+	struct kvm_vcpu *host_vcpu;
+	int ret;
+
+	host_vcpu = get_host_hyp_vcpus(host_ctxt, 1, &hyp_vcpu);
+
+	if (!host_vcpu) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	if (unlikely(hyp_vcpu)) {
 		/*
 		 * KVM (and pKVM) doesn't support SME guests for now, and
 		 * ensures that SME features aren't enabled in pstate when
@@ -231,23 +262,16 @@ static void handle___kvm_vcpu_run(struct kvm_cpu_context *host_ctxt)
 			goto out;
 		}
 
-		if (!hyp_vcpu) {
-			ret = -EINVAL;
-			goto out;
-		}
-
 		flush_hyp_vcpu(hyp_vcpu);
 
 		ret = __kvm_vcpu_run(&hyp_vcpu->vcpu);
 
 		sync_hyp_vcpu(hyp_vcpu);
 	} else {
-		struct kvm_vcpu *vcpu = kern_hyp_va(host_vcpu);
-
 		/* The host is fully trusted, run its vCPU directly. */
-		fpsimd_lazy_switch_to_guest(vcpu);
-		ret = __kvm_vcpu_run(vcpu);
-		fpsimd_lazy_switch_to_host(vcpu);
+		fpsimd_lazy_switch_to_guest(host_vcpu);
+		ret = __kvm_vcpu_run(host_vcpu);
+		fpsimd_lazy_switch_to_host(host_vcpu);
 	}
 out:
 	cpu_reg(host_ctxt, 1) =  ret;
-- 
2.55.0.rc0.738.g0c8ab3ebcc-goog


