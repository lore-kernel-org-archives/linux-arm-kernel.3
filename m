Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A226BEDF16F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 14:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jMJHo973aYDR+UWfROXQvwm6KfmNQpCUXcX+kTjqb1M=; b=pTEUdZzKwnYABfhykbjrqQaxqT
	kBcVCS5wsterreG3fqgDqyzdErN/Ll+gg4Ph6/a+VFNxqUnsYMqfO08EMGiY/Kf6c8TtMWXvzm1lw
	s+LWjbR9t3qr/kaeFsNui9/cHu+8lHxRt3TejwrQyP84p6Bp8kdc9+utH5r/2DWqe73mw2N9uhS+q
	7hTxPsqNlAMpLaabQymSZgTqNNXj9i6lSM0sbJSPZySNt9EI85GkvB0+to9Mbny2WRP0DwIgo8rpi
	SV6I0xSdFkdlvIuqA94NQj9P1vGwMFCLgDIrTfBHrmAUbDKksf5REB6VDZCAaokXYIGAd0nYm+cmA
	vfMdgRxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquJN-00000003XwE-2HtL;
	Fri, 13 Feb 2026 14:38:25 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquJK-00000003XtK-0VO5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 14:38:23 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b8fc132b0b4so5045066b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 06:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770993500; x=1771598300; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jMJHo973aYDR+UWfROXQvwm6KfmNQpCUXcX+kTjqb1M=;
        b=4SZVCe54/TsrSgzvVbapvUB7U+Fc3lCuZM1k+9WdbHJ827dRakovBm38LOFpkC6hU/
         48CkT59d0IprQBjvLAX811rgcZEjfxEwmMAacBEEnEuTb6jAwpwMMJu4mBjNk0bXs8hw
         RBdkYIti8flAhC+Y4LbL5qx67siWx+EXT6UQDHENGWXy3SeZ8Q/XayD+ncsWiUyQkpe2
         9Yhw1hrzrsE5a2Jk06AoTgU6mocNJW055Ha7GHHrCGEDGe7ag4+/zKZ5wORG7GNL3B1G
         9rgrvgFrwMWQmrIvPPRYkY3nbNxVChTNh/K2I1ncifmyB0ETC4/CX0iBX/CJJJddcAgw
         7KyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770993500; x=1771598300;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jMJHo973aYDR+UWfROXQvwm6KfmNQpCUXcX+kTjqb1M=;
        b=M7aeOcJfxR6rw0xjfP0V+3MObxKMIEPeSUyaXQwNXhgrsh8pWWBkH9JbsYQEFboLw/
         IkpkZyVe+x/eWQPCAUT+Qh6fEWAy6A3In3dZxYcWwiMIBBVPoGG2+v99Dl2do72Kx7RX
         iB7BnNSxT00rCAXuJgYW44Va1+YNb76u0eAp11ooxL6xKgOw6izdoh5br0el15tPuikB
         fYKY8KxuQo6L0xEXmWu7nzjy+jC5M1f0WDjBY/04PpC1KS/YrDJlef3yqU13PIzT40Su
         IDSgJVO1iXZA2eCsH8L/6JELUmg/000DGy8fK0CGLeWwooMF/M9mmffQqflrpxkFfFTI
         6kCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDJLC75vNJXP/zMx988wU30eEZ6BTBioINk6sxukfWx1gIgMYoGqowOyKQK0ERgl5tg7HDXF9pqWNmfre8xaC2@lists.infradead.org
X-Gm-Message-State: AOJu0YwKtJqRny8A1cqh6qwnq6ANpkaD31q6C5z63KbxOm1NHhKskNza
	TdVRA4EDiSNyFNR5DnVmT5jq6B4Bfdg34nm+pb72aKgxgCrysoH37IC2lZ1RfHbc2yb3joNWrKS
	iHw==
X-Received: from ejrf19.prod.google.com ([2002:a17:906:7f93:b0:b88:47b9:4312])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:3f8a:b0:b88:22f1:768f
 with SMTP id a640c23a62f3a-b8fb452e1e2mr118012766b.54.1770993500038; Fri, 13
 Feb 2026 06:38:20 -0800 (PST)
Date: Fri, 13 Feb 2026 14:38:14 +0000
In-Reply-To: <20260213143815.1732675-1-tabba@google.com>
Mime-Version: 1.0
References: <20260213143815.1732675-1-tabba@google.com>
X-Mailer: git-send-email 2.53.0.273.g2a3d683680-goog
Message-ID: <20260213143815.1732675-4-tabba@google.com>
Subject: [PATCH v2 3/4] KVM: arm64: Fix ID register initialization for
 non-protected pKVM guests
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, tabba@google.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_063822_182856_69D5294F 
X-CRM114-Status: GOOD (  16.50  )
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
the hypervisor `kvm` for non-protected VMs during initialization, since
we trust the host with its non-protected guests' features. Also ensure
`KVM_ARCH_FLAG_ID_REGS_INITIALIZED` is cleared initially in
`pkvm_init_features_from_host` so that `vm_copy_id_regs` can properly
initialize them and set the flag once done.

Fixes: 41d6028e28bd ("KVM: arm64: Convert the SVE guest vcpu flag to a vm flag")
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 35 ++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 12b2acfbcfd1..59a010221818 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -345,6 +345,7 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
 	/* No restrictions for non-protected VMs. */
 	if (!kvm_vm_is_protected(kvm)) {
 		hyp_vm->kvm.arch.flags = host_arch_flags;
+		hyp_vm->kvm.arch.flags &= ~BIT_ULL(KVM_ARCH_FLAG_ID_REGS_INITIALIZED);
 
 		bitmap_copy(kvm->arch.vcpu_features,
 			    host_kvm->arch.vcpu_features,
@@ -471,6 +472,35 @@ static int pkvm_vcpu_init_sve(struct pkvm_hyp_vcpu *hyp_vcpu, struct kvm_vcpu *h
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
+	if (test_and_set_bit(KVM_ARCH_FLAG_ID_REGS_INITIALIZED, &kvm->arch.flags))
+		return 0;
+
+	memcpy(kvm->arch.id_regs, host_kvm->arch.id_regs, sizeof(kvm->arch.id_regs));
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
@@ -490,8 +520,9 @@ static int init_pkvm_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu,
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
2.53.0.273.g2a3d683680-goog


