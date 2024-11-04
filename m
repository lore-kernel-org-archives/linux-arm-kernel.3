Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D67D132DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 15:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BjjoLBvOkIdvqHKae2IJzaas4+AMPqzUZpsNH6gOsjs=; b=2zq2w466NVrcNs2QaTjPeTcm6d
	UGCpuGTEEcHhBDO0rw/97SUp08pIYqqjBkTLsltB22YracXDOh4v/T1iQRkUtF2pL4Fz0EoSxbd+S
	GT1SjjsIjBFL9UO0tIqVz+RfLqWiM1MhXnhPQbYaaXgcrYWUY+rKOZn6WuxeBLIXDq1NBHdJ5Jzaq
	3LPdjb9Vb6gWAU8Ei1kwflZk2YjuoO1dvEsrxghSNZfZK06QtpbKa7E2t5P/mQFIYnV+FI7eytovh
	4jjnyLrQBBUrhNj/lxfx0ksNJmI+Lj189YZropE30esfgo3icij/0tEZ04tgajuGOXZKwwqA5Z8Vv
	wvctLUZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yoL-0000000EAkn-2BNi;
	Mon, 04 Nov 2024 15:16:09 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xCH-0000000DsRJ-098Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 13:32:46 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-a9a273e4251so356478466b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 05:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730727162; x=1731331962; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BjjoLBvOkIdvqHKae2IJzaas4+AMPqzUZpsNH6gOsjs=;
        b=hSY1EVaKSkNPdMNgJqoOZhe/wY+wPEZej0JscbdKJxzeDP371CLbT5Zwa+QGIUM995
         lCbjOgVjUs9jmlC6DMvhKEpTIlFYnKLPxOUJxynkxl241aBrzSMrxUt/g/H/1wUnCRFM
         rw4ACZbwLc4Znz2Jkf0xAW5ZZ6yQ2NpVGxJgukg7IfR0RlJMP5T1AkSImzhwxXTENT6g
         ilO+OA/J/bCS4htB6tq114eU2lFUsUE5SLtBTNztqYo3GK8nbdMsUk133mn00N0ZfIA4
         QOC0utXoo6B2ilcLFviyRb0jKJBXC1MeW80pcwkABgB1t9fvePsOb4EnRQIqYYDIbyPH
         W03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730727162; x=1731331962;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BjjoLBvOkIdvqHKae2IJzaas4+AMPqzUZpsNH6gOsjs=;
        b=q4Eaa4SOBf1DU+vFzIWt/xQhXDIkLJhtXQTGs+aq7neoHiWO/DSHyrLt/HO8HvJVlU
         NSBvelCKGR0mlvyhXMn1PpFY5nUtsje2v+qI5R03Hp60OAVFAfAA+/mw2FVkEG3hAsU+
         Umoww3dK9Q1MUGxIDYGurclCa2HstQK0lai3eLh2vvMMrK/icR9vgYNaSa8zIOvyxaiL
         kDsp46hB9h9HE16zA8AnMGgO2Yv3z6Vi/wJTWd3Mugg9ZQrNhtn0IfS/aVJBPM71lEr8
         Bl4OA8ipEzMzq8RiZuCR5Q72FMy/80lLCSLhc1OxIw6Dt6++LvrJk2JmN+xK0GCVh4oA
         wqMg==
X-Forwarded-Encrypted: i=1; AJvYcCWK5Mm0p2OqknVXN1M7xFc0iwYtnoG1B/+tznM/jnYohCw3I+53hteYH0j5cNRTaogVZlXr7tKd6Bp8vqulwv0u@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9mHjOAqJzFUBh8FrCEtJyO+ee2p3dEEMpMcCjwzV+LoQNfilG
	uFtsd/+V7fq+jqHxiV+MkI2RNAYeoYQt/NaxrgrImDXoHLfLPaTk528409EYJFBJRIZE3GDYjS0
	c2NABXQ==
X-Google-Smtp-Source: AGHT+IEbj6NqToXt4e9wVQWd4WMxb63nj/9jGxcZ0csUp26Lka3674D7FmXmXXn3NSLW/560C2CbSgE7ZVUz
X-Received: from big-boi.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:129])
 (user=qperret job=sendgmr) by 2002:a17:906:ec2:b0:a9a:1e:d858 with SMTP id
 a640c23a62f3a-a9e6582233cmr306266b.11.1730727161943; Mon, 04 Nov 2024
 05:32:41 -0800 (PST)
Date: Mon,  4 Nov 2024 13:32:00 +0000
In-Reply-To: <20241104133204.85208-1-qperret@google.com>
Mime-Version: 1.0
References: <20241104133204.85208-1-qperret@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241104133204.85208-15-qperret@google.com>
Subject: [PATCH 14/18] KVM: arm64: Introduce __pkvm_host_test_clear_young_guest()
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
X-CRM114-CacheID: sfid-20241104_053245_109501_0107D34F 
X-CRM114-Status: GOOD (  12.32  )
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

Plumb the kvm_stage2_test_clear_young() callback into pKVM for
non-protected guest. It will be later be called from MMU notifiers.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/include/asm/kvm_asm.h              |  1 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  1 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 25 +++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 21 ++++++++++++++++
 4 files changed, 48 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 3f1f0760c375..acb36762e15f 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -69,6 +69,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_relax_guest_perms,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_wrprotect_guest,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_test_clear_young_guest,
 	__KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
 	__KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
 	__KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 8658b5932473..554ce31882e6 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -43,6 +43,7 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum k
 int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
 int __pkvm_host_relax_guest_perms(u64 gfn, enum kvm_pgtable_prot prot, struct pkvm_hyp_vcpu *vcpu);
 int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
+int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *vm);
 
 bool addr_is_memory(phys_addr_t phys);
 int host_stage2_idmap_locked(phys_addr_t addr, u64 size, enum kvm_pgtable_prot prot);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index ce33079072c0..21c8a5e74d14 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -307,6 +307,30 @@ static void handle___pkvm_host_wrprotect_guest(struct kvm_cpu_context *host_ctxt
 	cpu_reg(host_ctxt, 1) = ret;
 }
 
+static void handle___pkvm_host_test_clear_young_guest(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
+	DECLARE_REG(u64, gfn, host_ctxt, 2);
+	DECLARE_REG(bool, mkold, host_ctxt, 3);
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
+	ret = __pkvm_host_test_clear_young_guest(gfn, mkold, hyp_vm);
+put_hyp_vm:
+	put_pkvm_hyp_vm(hyp_vm);
+out:
+	cpu_reg(host_ctxt, 1) = ret;
+}
+
 static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
@@ -527,6 +551,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_host_unshare_guest),
 	HANDLE_FUNC(__pkvm_host_relax_guest_perms),
 	HANDLE_FUNC(__pkvm_host_wrprotect_guest),
+	HANDLE_FUNC(__pkvm_host_test_clear_young_guest),
 	HANDLE_FUNC(__kvm_adjust_pc),
 	HANDLE_FUNC(__kvm_vcpu_run),
 	HANDLE_FUNC(__kvm_flush_vm_context),
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 3a8751175fd5..7c2aca459deb 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1537,3 +1537,24 @@ int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *vm)
 
 	return ret;
 }
+
+int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *vm)
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
+	ret = kvm_pgtable_stage2_test_clear_young(&vm->pgt, ipa, PAGE_SIZE, mkold);
+unlock:
+	guest_unlock_component(vm);
+	host_unlock_component();
+
+	return ret;
+}
-- 
2.47.0.163.g1226f6d8fa-goog


