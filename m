Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3577FE51E7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 08:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YXnZx3UxHBTbHH5XMnk/ieS8KZZEW34YA9EEjoorokI=; b=FSMsq6fgv4jbyPuKuBqaPfMNit
	o/Etto+YxRJ8IGFy6LGlojreiKR6SIPaiPyQzRW8TyZLFCAc7Wjk6RnVFURDwNupyIIldZ1gB5QDE
	CgTZD4xKM9afYv47XXeoRQTC+VVWYF2xdyEtolBoAroT6Y3fVf4jc1hwitNFAt3oxPYl7bvQHuIHz
	zn3CURXNNEtAlp/jF2S64m6wxSvpnSPRciO7qtQyzNL5k9+sgHbq+rYIOiLKx9Ce/3ebAfqI+f7SG
	6nS2wnNzkWYe2w0i5y0mlf6f7J/Q8/pyO6KbpjgCW3bea1wpgfipr7SQNFV1/tJbEISAQsbBxBJZX
	YjFU8JIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCE3-0000000Ct5h-1r8O;
	Fri, 24 Apr 2026 08:49:27 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCDt-0000000Ct0L-1B7k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 08:49:18 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-488c2cc0cbaso54495145e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 01:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777020555; x=1777625355; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YXnZx3UxHBTbHH5XMnk/ieS8KZZEW34YA9EEjoorokI=;
        b=p7rhFzP3bKRCmRUSLMQMJgoT7nf6xdOQQXp3JxIEPXLdVtbarPSXo+dqEzlRg+EgSE
         eC8Kt6Hia7SwBD40+07gZCYwAWoDT1jAYVvri3DvyJyBlmtXPMEnfIol21Ms2sYSexHG
         R6eZtr1/use2+KWLssdodHvEBWibtX22/UpyemadaTZey3jYx+fNxjPCLrQ52gAPcr5l
         xQ1nDfm2wT9zRUa+u7D4n9pxdjHzjWT2Buk2178DpXggevJLGYr3XhjD4eJ0QISgnH0g
         YcuEjK9j62Ag0LTooxXYB2+lRS9wlhAI/UlafhwJByQPUmQc6a89Vu80PxV0lLNyCRmI
         dXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777020555; x=1777625355;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YXnZx3UxHBTbHH5XMnk/ieS8KZZEW34YA9EEjoorokI=;
        b=Qk0yD+Jug1rUBN9sngZ/esHWi+4ahUHliBCXK4n5qr6EBFY0fdkdmB6+2Y89QQTIrY
         I0TCyM4BUZ71O75LwSIcJtR/byuip3sDII1ImgUbwFQ+Cfz6uxQ2+/cCdFLWaHux9DZr
         GMHzESKui0gBpgWBpcCJ2HWYyixV6ACo2WCqeGE4hMv88nUVI6EmrZ3+gfPX++ukejuf
         QO628CLMgpGuUpg6AshSV5bRHaOeoVkv1gG0ZPVOOndspFmRG/SdaQ30Gm9kGEPlhHFh
         B6H1k/vQAPxyN/sGffM8lw7qLboFEwlwnpPmIv50GlocKX3u9weAvlecgoulraJpn/FQ
         eKJQ==
X-Forwarded-Encrypted: i=1; AFNElJ8af0ek08Q1v+cinYIFJkIh07RXugAAU9vyUnGoZoouuG81NzR0VtQ/Z08oB4qfP1kfkSIs+QWpbP7phBByBdGh@lists.infradead.org
X-Gm-Message-State: AOJu0YwEcx3S36uC0MGlz4UWIriSUDBbWGTTa4vrSY/hNgvj/dLFQVfZ
	NpS5+JDhkyinM1qUREpVfsO7vAb5y8F7sAN/FLZO3l/9rsiyEnb7HeB/qr/1LJ6R3HZ6HGwWoCv
	AVQ==
X-Received: from wmmu12.prod.google.com ([2002:a05:600c:cc:b0:489:1d25:1a63])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c177:b0:486:fb0b:ad79
 with SMTP id 5b1f17b1804b1-488fb78129emr400550495e9.20.1777020554656; Fri, 24
 Apr 2026 01:49:14 -0700 (PDT)
Date: Fri, 24 Apr 2026 09:49:07 +0100
In-Reply-To: <20260424084908.370776-1-tabba@google.com>
Mime-Version: 1.0
References: <20260424084908.370776-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260424084908.370776-6-tabba@google.com>
Subject: [PATCH 5/6] KVM: arm64: Fix pin leak and publication ordering in __pkvm_init_vcpu()
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: tabba@google.com, catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oupton@kernel.org, qperret@google.com, suzuki.poulose@arm.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_014917_340040_16D8A4F7 
X-CRM114-Status: GOOD (  15.96  )
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

Two bugs exist in the vCPU initialisation path:

1. If a check fails after hyp_pin_shared_mem() succeeds, the cleanup
   path jumps to 'unlock' without calling unpin_host_vcpu() or
   unpin_host_sve_state(), permanently leaking pin references on the
   host vCPU and SVE state pages.

   Extract a register_hyp_vcpu() helper that performs the checks and
   the store. When register_hyp_vcpu() returns an error, call
   unpin_host_vcpu() and unpin_host_sve_state() inline before falling
   through to the existing 'unlock' label.

2. register_hyp_vcpu() publishes the new vCPU pointer into
   'hyp_vm->vcpus[]' with a bare store, allowing a concurrent caller
   of pkvm_load_hyp_vcpu() to observe a partially initialised vCPU
   object.

   Ensure the store uses smp_store_release() and the load uses
   smp_load_acquire(). While 'vm_table_lock' currently serialises the
   store and the load, these barriers ensure the reader sees the fully
   initialised 'hyp_vcpu' object even if there were a lockless path or
   if the lock's own ordering guarantees were insufficient for nested
   object initialization.

Fixes: 49af6ddb8e5c ("KVM: arm64: Add infrastructure to create and track pKVM instances at EL2")
Reported-by: Ben Simner <ben.simner@cl.cam.ac.uk>
Co-developed-by: Will Deacon <willdeacon@google.com>
Signed-off-by: Will Deacon <willdeacon@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 38 ++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 7ed96d64d611..e7496eb85628 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -266,7 +266,8 @@ struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
 	if (hyp_vm->kvm.created_vcpus <= vcpu_idx)
 		goto unlock;
 
-	hyp_vcpu = hyp_vm->vcpus[vcpu_idx];
+	/* Pairs with smp_store_release() in register_hyp_vcpu(). */
+	hyp_vcpu = smp_load_acquire(&hyp_vm->vcpus[vcpu_idx]);
 	if (!hyp_vcpu)
 		goto unlock;
 
@@ -860,12 +861,30 @@ int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
  *	     the page-aligned size of 'struct pkvm_hyp_vcpu'.
  * Return 0 on success, negative error code on failure.
  */
+static int register_hyp_vcpu(struct pkvm_hyp_vm *hyp_vm,
+			      struct pkvm_hyp_vcpu *hyp_vcpu)
+{
+	unsigned int idx = hyp_vcpu->vcpu.vcpu_idx;
+
+	if (idx >= hyp_vm->kvm.created_vcpus)
+		return -EINVAL;
+
+	if (hyp_vm->vcpus[idx])
+		return -EINVAL;
+
+	/*
+	 * Ensure the hyp_vcpu is initialised before publishing it to
+	 * the vCPU-load path via 'hyp_vm->vcpus[]'.
+	 */
+	smp_store_release(&hyp_vm->vcpus[idx], hyp_vcpu);
+	return 0;
+}
+
 int __pkvm_init_vcpu(pkvm_handle_t handle, struct kvm_vcpu *host_vcpu,
 		     unsigned long vcpu_hva)
 {
 	struct pkvm_hyp_vcpu *hyp_vcpu;
 	struct pkvm_hyp_vm *hyp_vm;
-	unsigned int idx;
 	int ret;
 
 	hyp_vcpu = map_donated_memory(vcpu_hva, sizeof(*hyp_vcpu));
@@ -884,18 +903,11 @@ int __pkvm_init_vcpu(pkvm_handle_t handle, struct kvm_vcpu *host_vcpu,
 	if (ret)
 		goto unlock;
 
-	idx = hyp_vcpu->vcpu.vcpu_idx;
-	if (idx >= hyp_vm->kvm.created_vcpus) {
-		ret = -EINVAL;
-		goto unlock;
+	ret = register_hyp_vcpu(hyp_vm, hyp_vcpu);
+	if (ret) {
+		unpin_host_vcpu(host_vcpu);
+		unpin_host_sve_state(hyp_vcpu);
 	}
-
-	if (hyp_vm->vcpus[idx]) {
-		ret = -EINVAL;
-		goto unlock;
-	}
-
-	hyp_vm->vcpus[idx] = hyp_vcpu;
 unlock:
 	hyp_spin_unlock(&vm_table_lock);
 
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


