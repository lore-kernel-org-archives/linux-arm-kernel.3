Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9609D132D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 14:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YA9nOaF/CPva03eUOIXNUH1DNhxgj/qlCLjHWmvoHj8=; b=LbFZjnHfQfHGQfGJ/mc6Gd3ijo
	ckND8c/7ZJ461o7mdZ/TohN6yC66VH7tQT9twGLBp6Ea9GtI0KC7vboxIzQ2JdxJ8pJr0nqMh7n9h
	s7giYSilpwGLdcOZxCXG8pih59z9fPL5naYflGeyAPHB9rgj+Ib60+Lf1j1zpxVKodyu13v6DvrBc
	S+5NQg1Jh/RuTuWE0BtpXK65vRzNDVKZdYJ8i82OHdmJvs/37dJxFN74Orr5j21JR5f5pHCf5I2/s
	xYceDLWklU3b982VFruPiRRLyeJmCYM2ClTPXXq92ZtTiWlkXvTNG7vNItNa5d6ZyE6BhiVrQ2Oh2
	Neqg6LYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xkc-0000000DzhN-42II;
	Mon, 04 Nov 2024 14:08:14 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xCK-0000000DsTM-302k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 13:32:49 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-a99fc3e2285so280785466b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 05:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730727166; x=1731331966; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YA9nOaF/CPva03eUOIXNUH1DNhxgj/qlCLjHWmvoHj8=;
        b=c30CKNQx4kXrSDChg34UFkqB+FlgF+rSLo8mg+0OECjieYi9qRx3W+9wzTG4BLzy/E
         CvWl7ar/JpOfmIHi5nI0GmKDpmbrySDDtTqq3ZteBRDV906CuY/Ak8eacNAt54HjLj3f
         XiAfqhex85KMwpKsad9Z/2vJnk1bGGaYAlWXxx1aA/NiGyBkSd1qU7lkZ5HqShTtLt4u
         9i9Q4StpzCA9/YkD2nxdDXlBGhhdEZLIiPi0T7q9XYNHACPHWWdiug8BtZ6kD1zttjFA
         8iLPTQd1SYjbvklckYgf8mW7d0OjhLeiEeuFaYQUmr2XKIKqSi4ZP3S+KCbxonkqzkg2
         p3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730727166; x=1731331966;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YA9nOaF/CPva03eUOIXNUH1DNhxgj/qlCLjHWmvoHj8=;
        b=iMmATuauDPkMEd+b3R+d3KfzH+dRHPTOOWY3L8+k8CR1DYLDAvP9s//D9FLfeTjRRA
         a0ySmT0F1P1rJM2siH8MQVxD3DO1Lxc1KLAu7n6zNkwcWxXEgb5DNTH3OoMlEKnqhqJj
         5KwVRNagrymyb9yReJmEYnZq6BETvc3Lkow4mhdjLOP9saAJtfVWjrtUw+ZEfJXdWsTA
         faGxudWpSv91Llc44CiXJPeVDkOojE1mi/PAg0ncNQ6JwW395jepqJLpMTNw0R3MgJ5x
         jf2AsJQGtJnnlasEL0c0sLRNlT7M1f5TYGe+z4g0PGN/25VUsROTpXFZHukPXVJOkcgT
         L6TQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkteTv7y9vPAd9aiNfZTRCyMeJnUICsLAcYq0Yd/WbdiNudcbjqhNEFUnGUVxK9rg2kWGZRjSxAUNrFK6qZcG5@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0kjc7UxPcw0aLVPs/AQ0EvQy8HeNoxwfSwUVC7HfeTxSw+mNn
	2qayUlnC6KL0UGdh0oKXV+ut/kmwaNza3y6iR8wcEO1nX2zMa/agFij4ESnVrYHWPDDD8ozLfEW
	O1OvVmQ==
X-Google-Smtp-Source: AGHT+IHKDJEbkEfKj/R2W9nSJpi/mLwlZYh9Ih88dIXHNCkRftaPK88SGfUQc4OzczUSSCQEg5KywaFPE6uv
X-Received: from big-boi.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:129])
 (user=qperret job=sendgmr) by 2002:a17:906:c20a:b0:a99:fa8a:9772 with SMTP id
 a640c23a62f3a-a9e50868dd1mr396366b.2.1730727166509; Mon, 04 Nov 2024 05:32:46
 -0800 (PST)
Date: Mon,  4 Nov 2024 13:32:02 +0000
In-Reply-To: <20241104133204.85208-1-qperret@google.com>
Mime-Version: 1.0
References: <20241104133204.85208-1-qperret@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241104133204.85208-17-qperret@google.com>
Subject: [PATCH 16/18] KVM: arm64: Introduce __pkvm_tlb_flush_vmid()
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_053248_787253_932B9355 
X-CRM114-Status: GOOD (  11.91  )
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

Introduce a new hypercall to flush the TLBs of non-protected guests. The
host kernel will be responsible for issuing this hypercall after changing
stage-2 permissions using the __pkvm_host_relax_guest_perms() or
__pkvm_host_wrprotect_guest() paths. This is left under the host's
responsibility for performance reasons.

Note however that the TLB maintenance for all *unmap* operations still
remains entirely under the hypervisor's responsibility for security
reasons -- an unmapped page may be donated to another entity, so a stale
TLB entry could be used to leak private data.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/include/asm/kvm_asm.h   |  1 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 4b93fb3a9a96..1bf7bc51f50f 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -88,6 +88,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_teardown_vm,
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_load,
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_put,
+	__KVM_HOST_SMCCC_FUNC___pkvm_tlb_flush_vmid,
 };
 
 #define DECLARE_KVM_VHE_SYM(sym)	extern char sym[]
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 904f6b1edced..1d8baa14ff1c 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -396,6 +396,22 @@ static void handle___kvm_tlb_flush_vmid(struct kvm_cpu_context *host_ctxt)
 	__kvm_tlb_flush_vmid(kern_hyp_va(mmu));
 }
 
+static void handle___pkvm_tlb_flush_vmid(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
+	struct pkvm_hyp_vm *hyp_vm;
+
+	if (!is_protected_kvm_enabled())
+		return;
+
+	hyp_vm = get_pkvm_hyp_vm(handle);
+	if (!hyp_vm)
+		return;
+
+	__kvm_tlb_flush_vmid(&hyp_vm->kvm.arch.mmu);
+	put_pkvm_hyp_vm(hyp_vm);
+}
+
 static void handle___kvm_flush_cpu_context(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_s2_mmu *, mmu, host_ctxt, 1);
@@ -588,6 +604,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_teardown_vm),
 	HANDLE_FUNC(__pkvm_vcpu_load),
 	HANDLE_FUNC(__pkvm_vcpu_put),
+	HANDLE_FUNC(__pkvm_tlb_flush_vmid),
 };
 
 static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
-- 
2.47.0.163.g1226f6d8fa-goog


