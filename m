Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F24DEB48EA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 09:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okszUF6rn81wokN6MFCx8nZtl6u7oamXEuCUR6T4heI=; b=PkDhgAkshLlulKo6D25dNohKqv
	AXerMZaV3YBHY2ZLNxZUErdT0Pwm9vUd0bPsg3nE4SM4IJmrwBOOYjB6MGGxm8imJMLt2pBzgBw55
	0g6rwiQlJ4DydNqeCRhiV3E/rO+8G0yTXrovn53FAFWLs46E8FPIiduRnpNj4BWGMZJprTAj6zpbW
	LiuQG7zQrd2uTWdca30CxEQW6BaNUuQQ21kMZfY8aFXl4AcyW+5K0Ql3deTzu3hR1djkg/jIEo8O5
	HOm/ZiT/4VSqfpHCXq/OPTq6ISDaWVIV6S8j8HRLYI/h9Y2V+zX48nZ1oej4jEKPbCu8zxtHRYCHC
	9J7gjdog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqSbF-00000001ngL-3OJm;
	Thu, 12 Feb 2026 09:03:01 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqSbB-00000001neE-3eUJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 09:03:00 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-43630b02fb4so4875138f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 01:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770886975; x=1771491775; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=okszUF6rn81wokN6MFCx8nZtl6u7oamXEuCUR6T4heI=;
        b=hLPCm9IoVdM1dSJ5tNcrUnKkG4kgCAy2ZZ8/ssLRfThxMiQpHn3vQCjwh5BU8bgN+J
         SxUzSGaLDDt96LjBsxTGOm+0YMbEr7FnIZzuhwqcL7EtWrOOour6u/hx9nL6sAWreKWW
         PjBb0IRT7IOj/You6xSUc8Wi0rnU9k4ZIXZJxJIor9resbHPWY7nwS6Xz7MKoUGvFd7u
         leXeYmktkCcFxaK8NQqIASm1aY/ma3sYIfkP5iNwUKoC+PaKbU/Nl3w2suDhTaWHZ0pW
         XK+jNzxlyDns5SX7hJ4H9EfoNeZYJtwnzIPINIyc0SJgfjnjjIAHhNuHbr3qlJC4zoVg
         dLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770886975; x=1771491775;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=okszUF6rn81wokN6MFCx8nZtl6u7oamXEuCUR6T4heI=;
        b=SQwxjbuikVI6cJz7ydfQD9QBsuw2K77T1VClv61skqvKSH8GkxZf0KUMSjFBfPlSHN
         ZQDdjhkLQtNrAhlPld0CqIH3VG8Fiz/RM7rLkKjKqEPCafEJMiOH3is+2We3+UQPy4q6
         IYRn7Wdshssg+/AZ8Dwt3RB2lN83yVe3tpumG33eTffBrdixSkO3pKBJBi6XeoHlWzOC
         jtrRjlFLQGk3MZmSARQ6NFnxEN3kdUIX1Mv6iLzsIc9kKXfQecDEqYCl6xhXnpiZAhXG
         edayt1DTaJqRxucGz6NqbYaQsFBE+Rv6Qsu1Vt1C91/9XOOLq12IeUxvhgCKQ7oxE4NU
         X6Cg==
X-Forwarded-Encrypted: i=1; AJvYcCUOihbo1QlJYS+ZdoOcJCaABF4bIx1gG9ol8+hpe5jjB69K6JWLIw76jK2qGf/g7TkdnX0csLen2IPbWPnoRNvV@lists.infradead.org
X-Gm-Message-State: AOJu0YxHyevOPLjJ42LUQL52xINmMawSi8gyHSSrxxojCnb1rlud6niZ
	K15+L7qNqmpzV8eEYp+DqQfzx+JYuJpVoyKdfjW2rIF4njxGCersZg7IRgVWLdmAL23yE1Cw2XE
	nQw==
X-Received: from wrbfv12.prod.google.com ([2002:a05:6000:2c0c:b0:437:72d9:7316])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:5f48:0:b0:436:3475:3687
 with SMTP id ffacd0b85a97d-4378adca042mr3331122f8f.57.1770886975548; Thu, 12
 Feb 2026 01:02:55 -0800 (PST)
Date: Thu, 12 Feb 2026 09:02:51 +0000
In-Reply-To: <20260212090252.158689-1-tabba@google.com>
Mime-Version: 1.0
References: <20260212090252.158689-1-tabba@google.com>
X-Mailer: git-send-email 2.53.0.239.g8d8fc8a987-goog
Message-ID: <20260212090252.158689-3-tabba@google.com>
Subject: [PATCH v1 2/3] KVM: arm64: Fix ID register initialization for
 non-protected pKVM guests
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, tabba@google.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_010257_923919_980F5E54 
X-CRM114-Status: GOOD (  16.93  )
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

In protected mode, the hypervisor maintains a separate instance of
the `kvm` structure for each VM. For non-protected VMs, this structure is
initialized from the host's `kvm` state.

Currently, `pkvm_init_features_from_host()` copies the
`KVM_ARCH_FLAG_ID_REGS_INITIALIZED` flag from the host without the
underlying `id_regs` data being initialized. This results in the
hypervisor seeing the flag as set while the ID registers remain zeroed.

Consequently, `kvm_has_feat()` checks at EL2 fail (return 0) for
non-protected VMs. This breaks logic that relies on feature detection,
such as `ctxt_has_tcrx()` for TCR2_EL1 support. As a result, certain
system registers (e.g., TCR2_EL1, PIR_EL1, POR_EL1) are not
saved/restored during the world switch, which could lead to state
corruption.

Fix this by explicitly copying the ID registers from the host `kvm` to
the hypervisor `kvm` for non-protected VMs during vCPU initialization,
since we trust the host with its non-protected guests' features. Also
ensure `KVM_ARCH_FLAG_ID_REGS_INITIALIZED` is cleared initially in
`pkvm_init_features_from_host` so that `vm_copy_id_regs` can properly
initialize them and set the flag once done.

Fixes: 41d6028e28bd ("KVM: arm64: Convert the SVE guest vcpu flag to a vm flag")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 37 ++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 12b2acfbcfd1..267854ed29c8 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -344,6 +344,8 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
 
 	/* No restrictions for non-protected VMs. */
 	if (!kvm_vm_is_protected(kvm)) {
+		clear_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &host_arch_flags);
+
 		hyp_vm->kvm.arch.flags = host_arch_flags;
 
 		bitmap_copy(kvm->arch.vcpu_features,
@@ -471,6 +473,36 @@ static int pkvm_vcpu_init_sve(struct pkvm_hyp_vcpu *hyp_vcpu, struct kvm_vcpu *h
 	return ret;
 }
 
+static int vm_copy_id_regs(struct pkvm_hyp_vcpu *hyp_vcpu)
+{
+	struct pkvm_hyp_vm *hyp_vm = pkvm_hyp_vcpu_to_hyp_vm(hyp_vcpu);
+	const struct kvm *host_kvm = hyp_vm->host_kvm;
+	struct kvm *kvm = &hyp_vm->kvm;
+
+	if (!test_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &host_kvm->arch.flags))
+		return -EINVAL;
+
+	if (test_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags))
+		return 0;
+
+	memcpy(kvm->arch.id_regs, host_kvm->arch.id_regs, sizeof(kvm->arch.id_regs));
+	set_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags);
+
+	return 0;
+}
+
+static int pkvm_vcpu_init_sysregs(struct pkvm_hyp_vcpu *hyp_vcpu)
+{
+	int ret = 0;
+
+	if (pkvm_hyp_vcpu_is_protected(hyp_vcpu))
+		kvm_init_pvm_id_regs(&hyp_vcpu->vcpu);
+	else
+		ret = vm_copy_id_regs(hyp_vcpu);
+
+	return ret;
+}
+
 static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
 			      struct pkvm_hyp_vm *hyp_vm,
 			      struct kvm_vcpu *host_vcpu)
@@ -490,8 +522,9 @@ static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
 	hyp_vcpu->vcpu.arch.cflags = READ_ONCE(host_vcpu->arch.cflags);
 	hyp_vcpu->vcpu.arch.mp_state.mp_state = KVM_MP_STATE_STOPPED;
 
-	if (pkvm_hyp_vcpu_is_protected(hyp_vcpu))
-		kvm_init_pvm_id_regs(&hyp_vcpu->vcpu);
+	ret = pkvm_vcpu_init_sysregs(hyp_vcpu);
+	if (ret)
+		goto done;
 
 	ret = pkvm_vcpu_init_traps(hyp_vcpu);
 	if (ret)
-- 
2.53.0.239.g8d8fc8a987-goog


