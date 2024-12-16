Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C15E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 18:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vLkxU7WF3J5Qh0Edw4/qg3eGiYkLZ2iXz4JSY5pi8io=; b=d4+xS+GWX7VIL56gF8Grydaz1C
	5nAjyGij5OwFrBlfIxdx8uLEf9eF8toeo9yLDurMdgyfSYBGjogDc3/6tlQUDrwqVoWnJcbQOpwLx
	KR3N0DITlUEKXxI63KF76D0OYGufIF+oEMgSBtyAf7l74s7OLqZAiw5/eGeoDP+1qdGFSy+5UiQ7U
	lZ0H8KaSqTkTPEWnotyku2W3RLBgmhdzlgoUlxg6nM7391BCeoOP8qLj3dkfhThtaAJv0U0NxnI3K
	FdBkOfYauRdjYQpSb00rE45RRN2qKrnnIq5GHCTKPu4fmMFYY3Gt0DBiz4JzKP46HZLATjS82FWT3
	m2J616Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFfq-0000000AwKY-2jbW;
	Mon, 16 Dec 2024 18:18:30 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFMe-0000000Ar5o-43Kz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 17:58:42 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-5d3e4e09ae7so5078616a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 09:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734371919; x=1734976719; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vLkxU7WF3J5Qh0Edw4/qg3eGiYkLZ2iXz4JSY5pi8io=;
        b=Nm4bXL7dRapiUvDAwmJrFs+Z/uZALNrFAwMy/Opkc9jHMQa5mqpFap865lb6253rAA
         akX2N7YFtERYAiQeAaQxLY98RHaD2cPylNp4qmI0XO6jlEbpSCIDxOp6KINqbVUnYp7N
         tn0ulsHHDZP5G5WM9bFjPs0GHHdGZqeu8TdX3QpxEZ+kXgyTDE98j9q0snUgEJ0Kwuh2
         VBHTMYDmKuchDxKBr/DKQC+G2PYIBEveXiaq59eFdXOwh0SJvSQOSGkx2FG7se/bDJ6b
         2TlopnjHxaHENFKWSWGPb/YJ4XYWex4bdI/Y9282BAwIThV5lbcy4vO5gLB/pOCi712L
         cCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734371919; x=1734976719;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vLkxU7WF3J5Qh0Edw4/qg3eGiYkLZ2iXz4JSY5pi8io=;
        b=q2yjwqHOYTOkzDPR/yHe7SR4D2/pmBoJM2CHwMtKV1rOMqOGydSVAUJX4nkVFh+xHP
         Rl8vTq7rfyN027xj+GYzpap/dATkEuX2VOceerD6KfMulefFSQZ9kzk4AX2SbAFw0xcJ
         5LfCIBgmDH94B+IpQKUJ9DagB4qSdKWT2nM2ZthEOpMcgnozC+bMughU0V79eUFpssA9
         Q/lDqPLpwmladscXBWZLDTsrZL1mHVjZYMHUeOqZqQ8smoCY2bSnh5lhDIHNYPhEWxlU
         RMrtYJh1JdINp1Nk3CSeIX36XtJZO/usj8UUaP7/HDxW6HH+A+C9AuQtgrxfcjgnyflb
         Uj6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUyBqTq5QQb0JicjfjvAVlEjBKxGds4xfluLl/kDDUM/xVTyThTK279DwvopAoC7+g4vgUs1dpEd6ggPgkg9MXt@lists.infradead.org
X-Gm-Message-State: AOJu0YzxhkFtsHrWxonZSE+DLkrEYfAlSYW3uA49BIemQeQZ593m87dv
	yhV9DWH08t7P8DUcDx5HgtnFTpQN/huwEifEyuSB5YuWnLl0/HomV/TZY6fzS2IiDkstU2jWbaO
	ee5rkMw==
X-Google-Smtp-Source: AGHT+IGbIEoG5vbn6iQy08UEUu36i7r1jxdCnom039llyQo30KhKhUU2a+YhuuCdj1YaRdinsIVQTfjkxghQ
X-Received: from edvu14.prod.google.com ([2002:a05:6402:110e:b0:5cf:ca3f:365])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:2807:b0:5d0:d610:caa2
 with SMTP id 4fb4d7f45d1cf-5d63c3ad29cmr12773175a12.26.1734371919408; Mon, 16
 Dec 2024 09:58:39 -0800 (PST)
Date: Mon, 16 Dec 2024 17:58:01 +0000
In-Reply-To: <20241216175803.2716565-1-qperret@google.com>
Mime-Version: 1.0
References: <20241216175803.2716565-1-qperret@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216175803.2716565-17-qperret@google.com>
Subject: [PATCH v3 16/18] KVM: arm64: Introduce __pkvm_tlb_flush_vmid()
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
X-CRM114-CacheID: sfid-20241216_095841_011450_3978B0A4 
X-CRM114-Status: GOOD (  11.41  )
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
index a3b07db2776c..002088c6e297 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -87,6 +87,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_teardown_vm,
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_load,
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_put,
+	__KVM_HOST_SMCCC_FUNC___pkvm_tlb_flush_vmid,
 };
 
 #define DECLARE_KVM_VHE_SYM(sym)	extern char sym[]
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 32c4627b5b5b..130f5f23bcb5 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -389,6 +389,22 @@ static void handle___kvm_tlb_flush_vmid(struct kvm_cpu_context *host_ctxt)
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
+	hyp_vm = get_np_pkvm_hyp_vm(handle);
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
@@ -573,6 +589,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_teardown_vm),
 	HANDLE_FUNC(__pkvm_vcpu_load),
 	HANDLE_FUNC(__pkvm_vcpu_put),
+	HANDLE_FUNC(__pkvm_tlb_flush_vmid),
 };
 
 static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
-- 
2.47.1.613.gc27f4b7a9f-goog


