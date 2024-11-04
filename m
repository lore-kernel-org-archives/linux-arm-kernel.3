Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9D0D132CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 14:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucFddVYYmKv6sICxH6cRQFB8Ka0EmmzO4w0j05CMWug=; b=TX03/zJNrLTmOHhmkD1bVnPcEe
	I5xJ7BmTYJ2Wr4rCFUv/dhPIgeWFxG6T17v8lSvii+c4Hdd35SKCfCO+glwfw143j0B8fy1gmJ1s7
	aOL3y5qIpFwHTjUsQG1fg6LfVElt+GP1BrLvd4A3KvU68XU7fGuzlVKVUFjtbtYBB5oIzasqMg4OQ
	3VvPjOgyKN2PEI/I5gGBnkc7BwPrCWbNJ3Va/9eYT8jqBB6KFrsm6VAQ06rq80+qMLzu/slIRZELg
	5Y+d8DZ3Lopz5XStVBuztL93BrfBJfDHNrhNl7xu8dLqsUnV/fJTrx770dFQd7djZVAYyoN2LVRUB
	QHO0rBDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xfe-0000000DyqG-3elE;
	Mon, 04 Nov 2024 14:03:06 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xCC-0000000DsQU-3lS0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 13:32:42 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6ea8901dff1so25677417b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 05:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730727159; x=1731331959; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ucFddVYYmKv6sICxH6cRQFB8Ka0EmmzO4w0j05CMWug=;
        b=YGAJ18ifOCF75TJQwgOPXay0R4GT3OiYOnwjTNJiKq5pVTUL6lUg/QQFGfsGM79ANl
         qii6diiGQAmcfrBpDeiEkEAz5FXPZWM4lO3KYeeA3tBAR/kc9XGWDKLrBBmo+8jv9IhG
         obt3ORJLScX6TmzThL9apJ6xTO3lSJine+yVtH/gAd9NWJxvmYSP9saV9kbbZwP2VSVR
         SP6DQEjkshEmMhT2yNGG4/kgjwS+D6bAyI3gltt14T0K24VJkjWGIZLCzzH2/SLLL7Bz
         Emi7oWzbutna9VtWNdWEiKKHpc4ITBqQ5goqd59vU0OhVwvofusB/ad3Ta8HgEHRkh6D
         5fNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730727159; x=1731331959;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ucFddVYYmKv6sICxH6cRQFB8Ka0EmmzO4w0j05CMWug=;
        b=l8nqux6U1zPexIj+KIZQIT02WkrCluMgsBL4EmYIxgvKrcUU1b8OtkoA+YngqvxR9P
         YxFAqo/M4cukjX22FxaExfG2MKOq9MunZkfHzPmQAqEUbFBrKdL2Vr0u2ESpeq6CLjXZ
         GwpLQYNDgLaus1lhza3C4/KqcNTZTXeY3tD/qTNtCB9O2pj1mS87S/+9iJxs3GxnVCfO
         zWflmSlOXEXeWugA0IpfstCbbSZ52Alf1aEiRAKMI+9LNtWlLaFdZYid9YMHV5qKD/0k
         JmfmfTh/pmONpRrmWG44p8XSBa30iYhxiaGLW1RDX16i9f31CY4eaEkVd8HMwmBxfJTz
         H89g==
X-Forwarded-Encrypted: i=1; AJvYcCUGNiNcl25f9IviNpgaibQvL5DvYWfcKM6l25FoiYtBd5rCa0VtmoTEDcr+9rpqlYIyWmiIvyO3D1XtS0dEybHZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxHRzor6CAVQUKchJOtHp6WIg9j6gcRCu7Az1jjntTCxdZv2I81
	JqBzXPg4ZzEtPZz3KNDRLQoJZwKdh1Cz8uNKhilYyU+JP8HFw+otyiu3u+Rst6gxteGH1Sxnsck
	Gf212XA==
X-Google-Smtp-Source: AGHT+IGBa0WaXIVQ6f/knL91GvKmh8psD2Fj6oZFqWjEZD8hAxiH7KoDd3VReE3WYYM+VRLwqJwKNMXlhvth
X-Received: from big-boi.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:129])
 (user=qperret job=sendgmr) by 2002:a05:690c:64c6:b0:6e3:c503:d1ec with SMTP
 id 00721157ae682-6ea64c29ea7mr1983467b3.7.1730727159727; Mon, 04 Nov 2024
 05:32:39 -0800 (PST)
Date: Mon,  4 Nov 2024 13:31:59 +0000
In-Reply-To: <20241104133204.85208-1-qperret@google.com>
Mime-Version: 1.0
References: <20241104133204.85208-1-qperret@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241104133204.85208-14-qperret@google.com>
Subject: [PATCH 13/18] KVM: arm64: Introduce __pkvm_host_wrprotect_guest()
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
X-CRM114-CacheID: sfid-20241104_053240_959159_FB1FF580 
X-CRM114-Status: GOOD (  12.12  )
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

Introduce a new hypercall to remove the write permission from a
non-protected guest stage-2 mapping. This will be used for e.g. enabling
dirty logging.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/include/asm/kvm_asm.h              |  1 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 24 +++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 21 ++++++++++++++++
 4 files changed, 47 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index f528656e8359..3f1f0760c375 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -68,6 +68,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_share_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_relax_guest_perms,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_wrprotect_guest,
 	__KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
 	__KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
 	__KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index db0dd83c2457..8658b5932473 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -42,6 +42,7 @@ int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
 int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
 int __pkvm_host_relax_guest_perms(u64 gfn, enum kvm_pgtable_prot prot, struct pkvm_hyp_vcpu *vcpu);
+int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
 
 bool addr_is_memory(phys_addr_t phys);
 int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index d3210719e247..ce33079072c0 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -284,6 +284,29 @@ static void handle___pkvm_host_relax_guest_perms(struct kvm_cpu_context *host_ct
 	cpu_reg(host_ctxt, 1) = ret;
 }
 
+static void handle___pkvm_host_wrprotect_guest(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
+	DECLARE_REG(u64, gfn, host_ctxt, 2);
+	struct pkvm_hyp_vm *hyp_vm;
+	int ret = -EINVAL;
+
+	if (!is_protected_kvm_enabled())
+		goto out;
+
+	hyp_vm = get_pkvm_hyp_vm(handle);
+	if (!hyp_vm)
+		goto out;
+	if (pkvm_hyp_vm_is_protected(hyp_vm))
+		goto put_hyp_vm;
+
+	ret = __pkvm_host_wrprotect_guest(gfn, hyp_vm);
+put_hyp_vm:
+	put_pkvm_hyp_vm(hyp_vm);
+out:
+	cpu_reg(host_ctxt, 1) = ret;
+}
+
 static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
@@ -503,6 +526,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_host_share_guest),
 	HANDLE_FUNC(__pkvm_host_unshare_guest),
 	HANDLE_FUNC(__pkvm_host_relax_guest_perms),
+	HANDLE_FUNC(__pkvm_host_wrprotect_guest),
 	HANDLE_FUNC(__kvm_adjust_pc),
 	HANDLE_FUNC(__kvm_vcpu_run),
 	HANDLE_FUNC(__kvm_flush_vm_context),
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index fc6050dcf904..3a8751175fd5 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1516,3 +1516,24 @@ int __pkvm_host_relax_guest_perms(u64 gfn, enum kvm_pgtable_prot prot, struct pk
 
 	return ret;
 }
+
+int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *vm)
+{
+	u64 ipa = hyp_pfn_to_phys(gfn);
+	u64 phys;
+	int ret;
+
+	host_lock_component();
+	guest_lock_component(vm);
+
+	ret = __check_host_unshare_guest(vm, &phys, ipa);
+	if (ret)
+		goto unlock;
+
+	ret = kvm_pgtable_stage2_wrprotect(&vm->pgt, ipa, PAGE_SIZE);
+unlock:
+	guest_unlock_component(vm);
+	host_unlock_component();
+
+	return ret;
+}
-- 
2.47.0.163.g1226f6d8fa-goog


