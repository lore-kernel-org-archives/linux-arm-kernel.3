Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0377CCD98E6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 07:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9tQfxVsIaeS+jOhIrhpINETdsAt58seT+ojTMVLuce4=; b=KchFQlKWzsKcferRqebzk49Uw/
	yoRFY3QN986N9GzcRvUyLuAxWq7PdE3SqNQym1I/TC1UEGBv9cfZ2HReFx8zYjUrImOSqb9rT9P54
	qPXR6FidOdHfalTHM0npbpVvZrF6mTv7cpCfLMjFcWbhh8PWYhYfb8EGuFOR6HrKeE1i/Z9viK2pE
	rJgfY06n7qcfS0AgfMCG4SMNKUQ5SUtoAfeCXCZ6zZhQdeImn89w1tfEh62v5mrpqWzdt6LA4jW6G
	bVWtgSbFtWgBgDEYA3dcm6lz73nq9Vv78Fx2uBbtF5CQX3U1i1AOlhuOv6ntQ9ZYRTBNm0w0mxrxe
	2UjS4USg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTIC-000000024bd-2Czf;
	Fri, 19 Jun 2026 07:05:32 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTHy-000000024R8-1Lxa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 07:05:19 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-4629f312a67so1820299f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 00:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781852716; x=1782457516; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9tQfxVsIaeS+jOhIrhpINETdsAt58seT+ojTMVLuce4=;
        b=QzLppSFNRNZgsG4OlmWiLZtedkxIsZ1m2N/vQNuk2A5A76U1Io0R6BY6L0MIaHhQc6
         vcstgWCuomUtDUB9M2HquNCpoifDxTN/Qga18HEzOtYpZGc2K5JVSXTQduyMk26FEjZM
         x8np8/ajvCoO93AErgxYhCaD5mi69iEIc6K+V9Fb2znnLJeaFMF/fGe6AL9AY7Ggqd7N
         kdrP3KS/Hq0V3TiCaBX4SZesRhoOqaRa4LevJbdOrRueixkXpNad6RjfQR7H7yBDWh5G
         DSeLOhCM26M/RldJEY8KwYC+jVspyAmQ3klJIXknMzIN0d2aZuJr8GLDxfytgzMkCM6P
         FpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781852716; x=1782457516;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9tQfxVsIaeS+jOhIrhpINETdsAt58seT+ojTMVLuce4=;
        b=dtjRmLBa/jV/ULNNGO4DnWZJkYQQ2HjvpPCC775XYCiJMQmi/M9mBArgyNbv90oTK4
         lYxWHimV3PfEJEIQToyzdmiNc7gq2BeXLMxhTwqCvRnNrg4u+ih2Zz/Moks/zxw0KMdx
         ZQYtGraa5TscF4yex9c69AW2zatMsNofJpUuNmPwbgQcqQdM4eHUkPsQ3/GGllwGIiKI
         2v0kKfrqFLFald7+jHEKpUXaLylv1mhMj6lvcrqpSugu7F2NPMdbFu4qOBXAVVKb0F2o
         M/BXWw063RSpCuAsQtOpOnOTM7RQZZ5uzqzZOmXvhe4fIBOvldw9dSrv7csBcZ7OpnD8
         Mybw==
X-Forwarded-Encrypted: i=1; AFNElJ9vmMqTYo1LF43Yf4GTKcIyXm2x9F95AofO1qFMbgt+iVbMLqYwGYQmSKXJ8xj6If+yN3O4RJdAwrrkRcjCfpnt@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr8s4hGRCkPBOttxLf3oBrDKUtLvis7VVhNCRYXHDjGNulgCty
	ho3zPTBX1//ou8qIhxzD7fkTela5V2Eqxx8RbIwBJJHvLa7YTPkU9yrORxvMJGoli19WASe/Yio
	37Q==
X-Received: from wrup11.prod.google.com ([2002:a5d:638b:0:b0:462:5359:f2e5])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:64e7:0:b0:45e:739b:3e43
 with SMTP id ffacd0b85a97d-464fd2fdc18mr4912063f8f.0.1781852716104; Fri, 19
 Jun 2026 00:05:16 -0700 (PDT)
Date: Fri, 19 Jun 2026 08:05:05 +0100
In-Reply-To: <20260619070508.802802-1-tabba@google.com>
Mime-Version: 1.0
References: <20260619070508.802802-1-tabba@google.com>
X-Mailer: git-send-email 2.55.0.rc0.738.g0c8ab3ebcc-goog
Message-ID: <20260619070508.802802-6-tabba@google.com>
Subject: [PATCH 5/8] KVM: arm64: Add host and hypervisor vCPU lookup primitives
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
X-CRM114-CacheID: sfid-20260619_000518_379494_70FFD820 
X-CRM114-Status: GOOD (  16.05  )
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


