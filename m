Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCDEE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 19:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dyP52yXMvdCG/qeO/nxD7I5lO2ep30nuHc1XdZd9lVE=; b=TYSCBjOb/7o4pX+LZeqRdEWXpq
	xws8YsRDR1rnGRy+87jBGz20toyzumFV8oh20e+6sEByYF6Pc6wOw6Khsd86e8vdPNW1SFLwVmYl0
	Lbyh+RIM4WlesKVMywOe4GJAZC4IFM83CruDibqbkEOyVZsRN16+GZXghvONREQp8pBpXBxee/f8+
	knq1pFvpq7zcJC0LVfSJbQknDnXhjfm9Hwk05baYWen8FRvgi4jFRivUDTj/9k9GtOUTWU3zzGgzD
	7AGjFkWH0KUDuZ0l4mTcNcQAoVFohEyWzRzWqDkYX4j8OT56FtYd8cQ6UN4bK0UjhLJ49nXZMqh/R
	9DICP9eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNGi4-0000000B5NH-1fX7;
	Mon, 16 Dec 2024 19:24:52 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFMX-0000000Ar2b-10LL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 17:58:34 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-5d3e77fd3b3so5297587a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 09:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734371911; x=1734976711; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dyP52yXMvdCG/qeO/nxD7I5lO2ep30nuHc1XdZd9lVE=;
        b=b3JLtEkpPG31UkuZ6A2i6Rrom2QtOS/DfWKMwH/rZickm9sF3dcp726GuLpdrBm1Pq
         NjE/gSSmwi1XY71xMH7JOzduFxPBjs1Z3ixbnpEYdkNrmD7TOeW5iXSRmcc5AgIo5GpX
         iTVjIZSXlmOmNUF4gUJWMN8FU7C6MCno2sCTNLnfpdv/KgqOC4CjM3baYHUnB/ej3AtV
         nwpbOwbBYIB8GZoGGl++mdh3tZZkRGBAN2vFZ/6iab90ABSw1d3n9EPtp90LdQsBg1Yi
         +l13PSU1lxCdT0T7GIJk1kJYd0Qb38xGKTLSmfnWhHo38T5ia/5lHoZoKxrz9yIIGhhj
         9g8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734371911; x=1734976711;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dyP52yXMvdCG/qeO/nxD7I5lO2ep30nuHc1XdZd9lVE=;
        b=RSevMVautTdbvsnY9V8CD5jsHZb3Tw+QvLrUelAdSbJwDczJTySGXhSrzOtcR8eJwp
         s2Hf9VVcnr7EMwKDrle7BoW1azwUkGvf8QstMwkSroRK4kl6nx2hDyGBXjLUXcnXvSB3
         It95ORE1QCzSVPugITrbbs9+MXV21w7cJygdh+WfXCs2lLgsx/XPt/q1HcnutJsBwqXd
         87fHlUFuPEQpQ3Oq1BXSF4bIvONQJZU2W5bM/eLlZgWyIkoBFa9JoIqWnvhTxuwXEQz7
         GH+6gRNzqh2V8M7k0f+qkFYi1I+CDq13q3o0SkgnGPViH/7SLm/gBOEQAjnjnHU/HJi8
         7heg==
X-Forwarded-Encrypted: i=1; AJvYcCWY8JBMsboEKbInqjxCFrXEfKIBeBisllfgdqAXeIKIG35Ixvh6AqMvNqn2sOd9jbPOYdLigBIpnu97QJwh73Ik@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy0AQFQ2yrkRNO2GkAVjrXAdNE5jvbNxrKfIvNfN2//o0+L3mq
	f5jwFEYrezaj6Aq9F84WD1ZFOGQ7iKIpDbXOWrlo6I4UVDTRi8lE1K4Jt0iy98oE9HbkCcsxeSE
	B02WjUg==
X-Google-Smtp-Source: AGHT+IFP4nw4MedeF204ACC4I+mIvh9+F0wuQVKyEpLyYdXQPbpwYFvSWf+Gws8g2zlegmkHbaKOYI4g0Iku
X-Received: from edbek21.prod.google.com ([2002:a05:6402:3715:b0:5d6:570c:dae5])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:5191:b0:5cf:bb9e:cca7
 with SMTP id 4fb4d7f45d1cf-5d63c3c0697mr13666506a12.28.1734371910915; Mon, 16
 Dec 2024 09:58:30 -0800 (PST)
Date: Mon, 16 Dec 2024 17:57:57 +0000
In-Reply-To: <20241216175803.2716565-1-qperret@google.com>
Mime-Version: 1.0
References: <20241216175803.2716565-1-qperret@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216175803.2716565-13-qperret@google.com>
Subject: [PATCH v3 12/18] KVM: arm64: Introduce __pkvm_host_relax_guest_perms()
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
X-CRM114-CacheID: sfid-20241216_095833_276231_E6E46F70 
X-CRM114-Status: GOOD (  12.59  )
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

Introduce a new hypercall allowing the host to relax the stage-2
permissions of mappings in a non-protected guest page-table. It will be
used later once we start allowing RO memslots and dirty logging.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/include/asm/kvm_asm.h              |  1 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 20 ++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 23 +++++++++++++++++++
 4 files changed, 45 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 0b6c4d325134..66ee8542dcc9 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -67,6 +67,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_hyp,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_share_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_relax_perms_guest,
 	__KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
 	__KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
 	__KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index e528a42ed60e..a308dcd3b5b8 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -41,6 +41,7 @@ int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
 int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
+int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
 
 bool addr_is_memory(phys_addr_t phys);
 int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 3c3a27c985a2..287e4ee93ef2 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -264,6 +264,25 @@ static void handle___pkvm_host_unshare_guest(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 1) =  ret;
 }
 
+static void handle___pkvm_host_relax_perms_guest(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(u64, gfn, host_ctxt, 1);
+	DECLARE_REG(enum kvm_pgtable_prot, prot, host_ctxt, 2);
+	struct pkvm_hyp_vcpu *hyp_vcpu;
+	int ret = -EINVAL;
+
+	if (!is_protected_kvm_enabled())
+		goto out;
+
+	hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
+	if (!hyp_vcpu || pkvm_hyp_vcpu_is_protected(hyp_vcpu))
+		goto out;
+
+	ret = __pkvm_host_relax_perms_guest(gfn, hyp_vcpu, prot);
+out:
+	cpu_reg(host_ctxt, 1) = ret;
+}
+
 static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
@@ -475,6 +494,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_host_unshare_hyp),
 	HANDLE_FUNC(__pkvm_host_share_guest),
 	HANDLE_FUNC(__pkvm_host_unshare_guest),
+	HANDLE_FUNC(__pkvm_host_relax_perms_guest),
 	HANDLE_FUNC(__kvm_adjust_pc),
 	HANDLE_FUNC(__kvm_vcpu_run),
 	HANDLE_FUNC(__kvm_flush_vm_context),
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 30243b7922f1..aa8e0408aebb 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1488,3 +1488,26 @@ int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *vm)
 
 	return ret;
 }
+
+int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot)
+{
+	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
+	u64 ipa = hyp_pfn_to_phys(gfn);
+	u64 phys;
+	int ret;
+
+	if (prot & ~KVM_PGTABLE_PROT_RWX)
+		return -EINVAL;
+
+	host_lock_component();
+	guest_lock_component(vm);
+
+	ret = __check_host_shared_guest(vm, &phys, ipa);
+	if (!ret)
+		ret = kvm_pgtable_stage2_relax_perms(&vm->pgt, ipa, prot, 0);
+
+	guest_unlock_component(vm);
+	host_unlock_component();
+
+	return ret;
+}
-- 
2.47.1.613.gc27f4b7a9f-goog


